# Python Project Manager

![](images/ppm.png)
> [!IMPORTANT]
> **To build ppm's needed directories you need to run `ppm build`

**PPM** stands for *Python Project Manager*. **PPM** is used for managing and creating projects, as well as installing and uninstalling packages.

**PPM** makes making and managing Python easier.

# Features

* Package manager (using [pip](https://pypi.org))
* Running python files
* Managing and creating projects and project files.
* Creating projects by project templates
* Custom user-made templates

# ⚙ Making a project 

To create a project use `ppm setup` to setup a pre-made project template.
To load a user-made template use `ppm template load <template_name>` replace `<template_name>` with the template's name, to get a list of all templates (pre-made and user-made) use `ppm template menu`

You can also use `ppm init` or `ppm new <project_name>`  to create the project. `init` will prompt you with questions and setup the project, `new` will generate a basic **project.toml** file.
# 📦 Package manager

To install a package use `ppm install <package_name>`.
To uninstall a package use `ppm uninstall <package_name>`.

**[pip](https://pypi.org) is required in order to use the package manager**

# 🦄 Templates

In order to create a template you must use the command `ppm template create`, after that answer the template prompts.

To share your template go to your templates folder in the source of **ppm** and copy the folder that has the name of your template, then compress that folder to a `.zip` and share it with people! In order to use a shared template extract the `.zip` and get the template folder, put that template folder into the templates folder in the source of **ppm**.

To load a template use `ppm template load <template_name>`.
 
> [!IMPORTANT]
> #### ⚠️ WARNING, USE `ppm build` BEFORE YOU RUN ANYTHING ELSE. ⚠️

###### Developed by Myfer. — Under MIT License
