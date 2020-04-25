  #!/bin/bash
  echo "1 - YES"
  echo "2 - NO"
  echo "Do you want to Setup SSS Platform inside of your Virtual Private Server?"
  read DO
  echo ""
  if [ $DO = "1" ]
    then
      echo -e "Installing docker, it may take some time to finish.${NC}"
      sudo curl -fsSL "$(curl -s https://api.github.com/repos/Xicy/baship/releases/latest | grep "browser_download_url.*" | cut -d '"' -f 4)" -o - | sudo bash /dev/stdin install  >/dev/null 2>&1
      cd /home
      git clone https://github.com/Simple-Software-Solutions/Simple-Cloud
      cd Simple-Cloud
      baship start
      baship composer i
      sleep 5
      baship art migrate --seed
  fi
  if [ $DO = "2" ]
    then
      exit
  fi
