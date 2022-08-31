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
* Postman
* Prospect Mail
* Kubectx
* Kubens

## Not installed
* Studio 3T
    * https://studio3t.com/knowledge-base/articles/how-to-install-studio-3t-on-linux/

## Notes
* How to get linux not to ask for password for sudo
    ```
    echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/$USER-no-sudo-password"
    ```

## Visual Studio
* Failed to find the "go" binary in either GOROOT() in VS Code
  *  Add to settings.json in VS Code (Open User Settings JSON)
        ```
        "go.alternateTools": {
            "go": "/home/<name>/.asdf/shims/go"
        }
        ```

* Recommended Plugins 
    ```
    code --install-extension amazonwebservices.aws-toolkit-vscode --force
    code --install-extension aws-scripting-guy.cform --force
    code --install-extension formulahendry.code-runner --force
    code --install-extension ryanluker.vscode-coverage-gutters --force
    code --install-extension EditorConfig.EditorConfig --force
    code --install-extension dbaeumer.vscode-eslint --force
    code --install-extension golang.go --force
    code --install-extension banxi.go-snippets --force
    code --install-extension premparihar.gotestexplorer --force
    code --install-extension hashicorp.hcl --force
    code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools --force
    code --install-extension ghmcadams.lintlens --force
    code --install-extension ms-vscode.live-server --force
    code --install-extension OctopusDeploy.vscode-octopusdeploy --force
    code --install-extension tscpp.proto-lang --force
    code --install-extension 4ops.terraform --force
    code --install-extension adamhartford.vscode-base64 --force
    code --install-extension technosophos.vscode-helm --force
    code --install-extension zxh404.vscode-proto3 --force
    code --install-extension redhat.vscode-yaml --force
    ```