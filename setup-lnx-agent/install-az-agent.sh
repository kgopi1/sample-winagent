#! /bin/bash
agentversion='2.177.1'
agenturl="https://vstsagentpackage.azureedge.net/agent/$agentversion/vsts-agent-linux-x64-$agentversion.tar.gz"
AZP_TOKEN=''
AZP_ORGNAME='kgopi10356'
AZP_URL="https://dev.azure.com/$AZP_ORGNAME"
mkdir -p ~/.agentdownload
agentpath=~/.agentdownload/vsts-$agentversion.tar.gz
curl $agenturl -o $agentpath &&  tar zxvf $agentpath
sudo -u $SUDO_USER ./config.sh --unattended \
  --agent "${AZP_AGENT_NAME:-az-kg-lnx-agent}" \
  --url "$AZP_URL" \
  --auth PAT \
  --token "$AZP_TOKEN" \
  --pool "${AZP_POOL:-azselfpool}" \
  --work "${AZP_WORK:-_work}" \
  --replace \
  --acceptTeeEula
sudo ./svc.sh install
sudo ./svc.sh start
