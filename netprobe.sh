#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# This script runs basic network checks to host and ports
# Usgae: netprobe <<Host>> <<Port>>
# Example: netprobe www.google.com 80
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

pline(){
    printf "\n-------------- $1 $2 --------------\n"
}

run_ping(){
    local host=$1
    pline "ping $host"     
    ping -c 5 $host  && echo "✅ ping Connection successful" || echo "❌ ping Connection failed"  
}
 

run_traceroute(){
    local host=$1 
    local port=${2:-80}   
    local max_hops=30 
    consecutive_limit=3
    pline "Traceroute $host $port"

    consecutive_count=0

    # Run traceroute and read line-by-line in real time
    traceroute -m $max_hops -p $port "$host" | while IFS= read -r line; do
    echo "$line"  # print output immediately

    # Check if line is a hop with all no reply stars
    if echo "$line" | grep -qE '^\s*[0-9]+\s+\* \* \*'; then
        ((consecutive_count++))
        if ((consecutive_count >= consecutive_limit)); then
        echo "❌ traceroute: $consecutive_count consecutive hops with no reply failed"
        return 1 
        fi
    else
        consecutive_count=0
    fi
    done
   echo "✅ traceroute Connection successful"
}


run_dns(){
    local host=$1 
    pline  "DNS $host"     
    dig $host && echo "✅ dig Connection successful" || echo "❌ dig Connection failed"  
}

run_nmap(){
    local host=$1 
    local port=${2:-80}     
    pline  "nmap $host $port"   
   
    nmap -A -T4 -p $port $host && echo "✅ nmap Connection successful" || echo "❌ nmap Connection failed" 
}

run_mtr(){
    local host=$1 
    local port=${2:-80}    
    pline  "MTR $host $port"   
   
    sudo mtr -r -n -T -c 5 $host  --port $port && echo "✅ mtr Connection successful" || echo "❌ mtr Connection failed" 
}

run_connection(){
    local host=$1 
    local port=${2:-443} 
    pline  "nc Connection $host $port" 

    nc -zvw3 "$host" "$port" && echo "✅ nc Connection successful" || echo "❌ nc Connection failed"  

}

run_curl(){
    local host=$1 
    pline  "curl $host" 
    curl -I "$host" && echo "✅ curl Connection successful" || echo "❌ curl Connection failed"  
}

detectos(){
    local os_type=$(uname)
    if [[ "$os_type" == "Darwin" ]]; then
        echo "macOS"
    elif [[ "$os_type" == "Linux" ]]; then
        echo "Linux"
    else
        echo "Unknown OS: $os_type"
    fi
}
run_certCheck(){
    local hostname=$1
    local port=${2:-443}   
    pline "Certificate $1 $port"  
    
    
    expiration_date=$(echo |openssl s_client -servername ${hostname} -connect ${hostname}:${port} 2>/dev/null | openssl x509 -noout -enddate | sed 's/notAfter=//')
    echo "expiration_date ${expiration_date}"
    if [[ -z "$expiration_date" ]]; then
        echo "Could not retrieve certificate information for ${hostname}."
        exit 1
    fi
    current_timestamp=$(date +%s)
    
    os=$(detectos)
    echo "$os: detected"
    if [[ $os == "Linux" ]]; then
        expiration_timestamp=$(date -d "$expiration_date" +%s) # for linux
    elif [[ $os == "macOS" ]]; then   
    expiration_timestamp=$(date -j -f "%b %d %T %Y %Z" "$expiration_date" +"%s") #for mac
    fi

    remaining_days=$(( (expiration_timestamp - current_timestamp) / (60*60*24) ))
    echo "Certificate for ${hostname} expires in ${remaining_days}"
}

check_mtr_installed() {
  if command -v mtr >/dev/null 2>&1; then
    #echo "✅ mtr is installed."
    return 0
  else
    echo "❌ mtr is not installed."
    echo "👉 To install:"
    if [[ "$(uname)" == "Darwin" ]]; then
      echo "  brew install mtr"
    elif [[ -f /etc/debian_version ]]; then
      echo "  sudo apt install mtr"
    elif [[ -f /etc/redhat-release ]]; then
      echo "  sudo yum install mtr"
    else
      echo "  Use your package manager to install 'mtr'"
    fi
    return 1
  fi
}


main(){

    check_mtr_installed

    local host=$1
    if [[ -z "$host" ]]; then
        echo "Usage: netprobe <host> [port]"
    return 1
    fi

    local port=$2


    run_ping $host
    run_dns $host
    run_nmap $host $port
    run_mtr $host $port
    run_traceroute $host $port
    run_certCheck $host $port
    run_connection $host
    run_curl $host
}

main "$@"
