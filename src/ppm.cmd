@echo off

set arg1=%1
set arg2=%2
set arg3=%3
set empty=%9

if "%arg1%"=="build" (
    if exist data (
        echo The directory "data" already exists.
    ) else (
        echo Building "data" folder..
        mkdir data
        echo Done!
    )
    if exist templates (
        echo The directory "templates" already exists.
    ) else (
        echo Building "templates" folder..
        mkdir templates
        echo Done! 
    )
)

if "%arg1%"=="setup" (
    if "%arg2%"=="" (
        echo ERROR. Please enter a project type.
    )
    if "%arg2%"=="menu" (
        echo Project Types:
        echo default
        echo github
        echo personal
        echo open-src
        echo org-project
    )
    if "%arg2%"=="default" (
        if exist data/default_github (
            md src
            cd src
            echo # main.py > main.py
            cd ..
            echo # Hello world! > README.md
            echo __pycache__/ > .gitignore
            md .github
        ) else if exist data/default_personal (
            md src
            cd src
            echo # main.py > main.py
            cd ..
            md test
        ) else if exist data/default_open-src (
            md src
            cd src
            echo # main.py > main.py
            cd ..
            echo License here. > LICENSE
            echo __pycache__/ > .gitignore
        ) else if exist data/default_org-project (
            md src
            cd src
            echo # main.py > main.py
            cd ..
            echo License here. > LICENSE
            echo # Hello world! > README.md
            echo __pycache__/ > .gitignore
            md docs
        ) else (
            echo Error. No default setting configured, please use the following command to configure your default settings: ppm configure default
        )
    )
    if "%arg2%"=="github" (
        md src
        cd src
        echo # main.py > main.py
        cd ..
        echo # Hello world! > README.md
        echo __pycache__/ > .gitignore
        md .github
    )
    if "%arg2%"=="personal" (
        md src
        cd src
        echo # main.py > main.py
        cd ..
        md test
    )
    if "%arg2%"=="open-src" (
        md src
        cd src
        echo # main.py > main.py
        cd ..
        echo License here. > LICENSE
        echo __pycache__/ > .gitignore
    )
    if "%arg2%"=="org-project" (
        md src
        cd src
        echo # main.py > main.py
        cd ..
        echo License here. > LICENSE
        echo # Hello world! > README.md
        echo __pycache__/ > .gitignore
        md docs
    )
)

if "%arg1%"=="configure" (
    if "%arg2%"=="default" (
        echo Valid project types: "github", "personal", "open-src", "org-project"
        set /p config_def=Enter default project type:
        if "%config_def%"=="github" (
            if exist data/default_github (
                 del data\default_github
            )
            if exist data/default_personal (
                del data\default_personal
            )
            if exist data/default_open_src (
                del data\default_open_src
            )
            if exist data/default_org-project (
                del data\default_org-project
            )
            echo mydata > data/default_github
        )
        if "%config_def%"=="personal" (
            if exist data/default_github (
                del data\default_github
            )
            if exist data/default_personal (
                del data\default_personal
            )
            if exist data/default_open-src (
                del data\default_open-src
            )
            if exist data/default_org-project (
                del data\default_org-project
            )
            echo mydata > data/default_personal
        )
        if "%config_def%"=="open-src" (
            if exist data/default_github (
                del data\default_github
            )
            if exist data/default_personal (
                del data\default_personal
            )
            if exist data/default_open-src (
                del data\default_open-src
            )
            if exist data/default_org-project (
                del data\default_org-project
            )
            echo mydata > data/default_open-src
        )
        if "%config_def%"=="org-project" (
            if exist data/default_github (
                del data\default_github
            )
            if exist data/default_personal (
                del data\default_personal
            )
            if exist data/default_open_src (
                del data\default_open_src
            )
            if exist data/default_org-project (
                del data\default_org-project
            )
            echo mydata > data/default_org-project
        )
        echo Saved! Default configuration is saved as "%config_def%"
    )
)

if "%arg1%"=="new" (
    echo [project] > project.toml
    echo name = "%arg2%" >> project.toml
    echo description = "A pretty cool project" >> project.toml
    echo version = "0.1.0" >> project.toml
    echo. >> project.toml
    echo [packages] >> project.toml
    echo. >> project.toml
    echo [scripts] >> project.toml
    echo test = "echo Hello world!" >> project.toml
    echo # main.py > src/main.py
)

if "%arg1%"=="run" (
    python %arg2%
)

if "%arg1%"=="install" (
    if exist "C:\Users\%username%\AppData\Local\Microsoft\WindowsApps\pip.exe" (
        pip install %arg2%
    ) else (
        echo Please install Pip/PyPi to use the "install" command.
    )
)

if "%arg1%"=="uninstall" (
    if exist "C:\Users\%username%\AppData\Local\Microsoft\WindowsApps\pip.exe" (
        pip uninstall %arg2%
    ) else (
        echo Please install Pip/PyPi to use the "uninstall" command.
    )
)

if "%arg1%"=="init" (
    set /p sourcedir= Enter source directory name [src]:
    set /p mainfn= Enter main file name [main]:
    set /p projectname= Enter project name:
    set /p projectdesc= Enter project description:
    set /p projectver= Enter project verison [0.1.0]:
    if "%sourcedir%"=="" (
        set sourcedir=src
    )
    if "%mainfn%"=="" (
        set mainfn= "main"
    )
    if "%projectver%"=="" (
        set projectver="0.1.0"
    )
    echo [project] > project.toml
    echo name = "%projectname%" >> project.toml
    echo description = "%projectdesc%" >> project.toml
    echo version = "%projectver%" >> project.toml
    echo. >> project.toml
    echo [packages] >> project.toml
    echo. >> project.toml
    echo [scripts] >> project.toml
    echo test = "echo Hello world!" >> project.toml
    md %sourcedir%
    echo. %mainfn%.py > %sourcedir%/%mainfn%.py
)

if "%arg1%"=="template" (
    if not exist templates (
        echo Error. The directory "templates" is a required directory in order to load and create templates.
        echo Creating "templates" directory...
        md templates
        exit /b
    )
    if "%arg2%"=="create" (
        echo MUST INCLUDE FILE EXTENSION
        set /p template_file1= [1/5] Enter the name of a file to make:
        set /p template_file2= [2/5] Enter the name of another file to make:
        set /p template_directory= [3/5] Enter the name of a directory to make:
        set /p template_file3= [4/5] Enter the name of file in directory:
        set /p template_name= [5/5] Enter the name of your template:
        echo =================TEMPLATE CONTENTS=================
        echo %template_file1%
        echo %template_file2%
        echo %template_directory%
        echo %template_file3% [inside "%template_directory%"]
        echo Template name: %template_name%
        echo ===================================================
        echo Confirm?
        set /p confirmChoice= [Y/N]:
        if "%confirmChoice%"=="N" (
            exit /b
        )
        if "%confirmChoice%"=="Y" (
            md templates\%template_name%
            echo Creating template files [0/5]
            echo %template_file1% > templates/%template_name%/template_file1.ppmTempl
            echo Creating template files [1/5]
            echo %template_file2% > templates/%template_name%/template_file2.ppmTempl
            echo Creating template files [2/5]
            echo %template_directory% > templates/%template_name%/template_dir.ppmTempl
            echo Creating template files [3/5]
            echo %template_file3% > templates/%template_name%/template_file3.ppmTempl
            echo Creating template files [4/5]
            echo %template_name% > templates/%template_name%/template_name.ppmTempl
            echo Creating template files [5/5]
        )
    )
    if "%arg2%"=="load" (
        echo arg2: %arg2%
        echo arg3: %arg3%

        if "%arg3%"=="" (
            echo Error. Please use the following command to load a template: ppm load template [template_name]
        )
        if exist templates\%arg3% (
            echo Loading template files..
            set /p file1=<templates\%arg3%\template_file1.ppmTempl
            echo. > %file1%
            set /p file2=<templates\%arg3%\template_file2.ppmTempl
            echo. > %file2%
            set /p dir1=<templates\%arg3%\template_dir.ppmTempl
            mkdir %dir1%
            set /p file3=<templates\%arg3%\template_file3.ppmTempl
            echo. > %dir1%\%file3%
            echo Template files loaded!
        ) else (
            echo Invalid template name. Template not found.
        )
    )
    if "%arg2%"=="delete" (
        if exist templates\%arg3% (
            del templates\%arg3%
            rmdir templates\%arg3%
            echo Template deleted! 
        ) else (
            echo Invalid template name. Template not found
        )
    )
    if "%arg2%"=="menu" (
        dir templates
    )
)
