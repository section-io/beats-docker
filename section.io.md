# Purpose
These instruction outline the steps used to create the Dockerfile used
to build filebeats for the section.io deployment.

```
sudo apt-get install python-pip python3-pip
sudo -H pip3 install virtualenv
virtualenv -p python3 venv
cd venv
source ./bin/activate
pip3 install -r ../requirements.txt
pip install -r ../requirements.txt
```