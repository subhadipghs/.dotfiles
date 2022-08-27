## Dotfiles(Linux)
Configuration files:
[Atlassian Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)


## Windows Powershell Configuration
1. [Scoop](https://scoop.sh/)
2. [Latest Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2)
3. [Caskaydia Code Nerd Font](https://www.nerdfonts.com/font-downloads)
4. [Oh My Posh](https://ohmyposh.dev/docs/installation/windows)
5. [Git](https://git-scm.com/downloads)
6. [Neovim](https://neovim.io/)

### Installation
  - After installing scoop install the following dependecies using scoop.
  
    ```sh
    scoop install curl sudo jq oh-my-posh neovim gcc
    ```
  - Install powershell modules
  
    ```ps1
    Install-Module posh-git -Scope CurrentUser -Force
    Install-Module -Name Terminal-Icons -Repository PSGallery -Force
    ```
  - Create a powershell user user
  
    ```sh
      nvim $USERPROFILE/.config/powershell/user_profile.ps1
    ```
    
  - Paste the content below in the previously created file
  
    ```ps1
    Import-Module posh-git
    Import-Module Terminal-Icons
    # Initialize oh-my-posh
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
    
    Set-Alias vim nvim
    Set-Alias g git
    Set-Alias ls dir
    Set-Alias grep findstr
    ```
  
  - Link the `user_profile.ps1` file in the actual powershell configuration file. Open the default powershell configuration file and paste the content below
   
    ```ps1
    . $env:USERPROFILE\.config\powershell\user_profile.ps1
    ```
