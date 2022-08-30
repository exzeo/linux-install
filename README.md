# Automated Installation

```
curl -s -L https://raw.githubusercontent.com/exzeo/linux-install/main/install.sh | bash
```

## Tools installed
* AWSCLI
* Chrome
* Go
* Helm
* Istioctl
* Kops
* Kubectl
* NodeJS
* Packer
* Terraform
* Vault
* Yarn
* Fortigate VPN
* Scripts


## Visual Studio Code Issues
Failed to find the "go" binary in either GOROOT()

Add to settings.json in VS Code (Open User Settings JSON)
```
"go.alternateTools": {
        "go": "/home/<name>/.asdf/shims/go"
    }
```