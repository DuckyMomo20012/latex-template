<div align="center">

  <img src="https://user-images.githubusercontent.com/64480713/219921672-be3ebe86-c8bf-409a-923d-bdfee746ea06.svg" alt="logo" width="200" height="auto" />
  <h1>Latex template</h1>

  <p>
    Latex template project
  </p>

<!-- Badges -->
<p>
  <a href="https://github.com/DuckyMomo20012/latex-template/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/DuckyMomo20012/latex-template" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/DuckyMomo20012/latex-template/main" alt="last update" />
  </a>
  <a href="https://github.com/DuckyMomo20012/latex-template/network/members">
    <img src="https://img.shields.io/github/forks/DuckyMomo20012/latex-template" alt="forks" />
  </a>
  <a href="https://github.com/DuckyMomo20012/latex-template/stargazers">
    <img src="https://img.shields.io/github/stars/DuckyMomo20012/latex-template" alt="stars" />
  </a>
  <a href="https://github.com/DuckyMomo20012/latex-template/issues/">
    <img src="https://img.shields.io/github/issues/DuckyMomo20012/latex-template" alt="open issues" />
  </a>
  <a href="https://github.com/DuckyMomo20012/latex-template/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/DuckyMomo20012/latex-template" alt="license" />
  </a>
</p>

<h4>
    <a href="https://github.com/DuckyMomo20012/latex-template/">View Demo</a>
  <span> · </span>
    <a href="https://github.com/DuckyMomo20012/latex-template">Documentation</a>
  <span> · </span>
    <a href="https://github.com/DuckyMomo20012/latex-template/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/DuckyMomo20012/latex-template/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->

# :notebook_with_decorative_cover: Table of Contents

- [Getting Started](#toolbox-getting-started)
  - [Prerequisites](#bangbang-prerequisites)
  - [Run Locally](#running-run-locally)
- [Usage](#eyes-usage)
  - [Makefile](#package-makefile)
  - [Compile](#computer-compile)
  - [Cleanup](#wastebasket-cleanup)
  - [Format Code](#sparkles-format-code)
  - [Remote Development](#whale-remote-development)
- [FAQ](#grey_question-faq)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)

<!-- Getting Started -->

## :toolbox: Getting Started

<!-- Prerequisites -->

### :bangbang: Prerequisites

This project requires the following prerequisites:

- Local Development:

  - make:

  ```bash
  sudo apt-get update

  sudo apt-get -y install make
  ```

  - [TexLive](https://www.tug.org/texlive/): A TeX distribution for Linux,
    macOS, and Windows. Required about ~5GB of disk space.

- Remote Development (**recommended**):

  - [Docker](https://www.docker.com/) installed locally:

  ```bash
  #!/usr/bin/env bash

  # Uninstall old versions
  sudo apt-get remove docker docker-engine docker.io containerd runc

  # Set up the repository

  # Update the apt package index and install packages to allow apt to use a
  # repository over HTTPS
  sudo apt-get update

  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release

  # Add Docker’s official GPG key
  sudo mkdir -m 0755 -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  # Use the following command to set up the repository
  echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Install Docker Engine

  # Update the apt package index
  sudo apt-get update

  # Install Docker Engine, containerd, and Docker Compose.
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Post installation steps

  # Add your user to the docker group
  sudo usermod -aG docker $USER
  ```

<!-- Run Locally -->

### :running: Run Locally

Clone the project:

```bash
git clone https://github.com/DuckyMomo20012/latex-template.git
```

Go to the project directory:

```bash
cd latex-template
```

Compile `all` targets:

```bash
make all
```

Compile `main` (Bachelor thesis):

```bash
make main
```

The generated pdf file will be located at `dist/main.pdf`.

Compile `proposal` (Thesis proposal):

```bash
make proposal
```

The generated pdf file will be located at `dist/proposal.pdf`.

<!-- Usage -->

## :eyes: Usage

<!-- Makefile -->

### :package: Makefile

There are two targets in the `Makefile`:

- `main`: Compile the `main.tex` file, which is the **Bachelor thesis**.

  - Usage:

    ```bash
    make main
    ```

- `proposal`: Compile the `proposal.tex` file, which is the **Thesis proposal**.

  - Usage:

    ```bash
    make proposal
    ```

- `all`: Compile both `main` and `proposal` targets.

  - Usage:

    ```bash
    make all
    ```

- `pretty`: Format the code using `latexindent`.

  - Usage:

    ```bash
    make pretty
    ```

- `clean`: Remove the `dist` directory.

  - Usage:

    ```bash
    make clean
    ```

<!-- Compile -->

### :computer: Compile

The compilation process is described in the following steps:

1. Clone the directory tree:

   In the next step, we want to output the compiled files to the `dist`
   directory, using the option `-output-directory`; however, the `pdflatex` may
   write some auxiliary files to the dependency directories (required files by
   the main latex file) and it **can't write without those directories created
   in the `dist` directory**.

2. Compile the `tex` file:

   The `pdflatex` will compile the `tex` file and write the output to the `dist`
   directory.

   Compile order:

   - `main.tex`: `pdflatex` -> `bibtex` -> `pdflatex` -> `pdflatex`.
   - `proposal.tex`: `pdflatex` -> `bibtex` -> `pdflatex` -> `pdflatex`.

   > **Note**: The pdf files will be **generated with different checksums** on
   > each run.

3. Clean up the directory tree:

   Sometimes, the `tex` file doesn't have any dependencies, so the cloned
   directory tree will have an empty directory. In this case, we should clean up
   empty directories.

<!-- Cleanup -->

### :wastebasket: Cleanup

Clean up the `dist` directory:

```bash
make clean
```

<!-- Format Code -->

### :sparkles: Format Code

The tool `latexindent` is used to format the code, this
[should be shipped with the `TeXLive` distribution](https://latexindentpl.readthedocs.io/en/latest/sec-how-to-use.html#how-to-use-the-script).

To format the code, run the following command:

```bash
make pretty
```

- When running the command, the backup directory `dist/backup` will be created
  to store the backup files.

- All the `tex` files will be formatted.

- The `latexindent` will be used to format the code:

  - `cruft`: Backup directory stored in `dist/backup`.
  - `local`: Configuration file defined in `latexindent.yaml`.
  - `overwrite`: Overwrite the original file.
  - `silent`: Silent mode.
  - `modifylinebreaks`: Modify line breaks.

- Or, you can run the full command:

  ```bash
  latexindent --local=./latexindent.yaml --cruft=./dist/backup --overwrite --silent --modifylinebreaks main.tex
  ```

Read more about `latexindent` in the
[documentation](https://ctan.org/pkg/latexindent) or on
[Read the Docs](https://latexindentpl.readthedocs.io/en/latest/).

<!-- Remote Development -->

### :whale: Remote Development

#### Introduction

This is the **recommended** way to develop this project. Using Docker provides a
consistent environment for development, quick setup, and teardown. Moreover,
developers don't have to install the `TexLive` distribution on their local
machine, which is quite large.

For remote development, we can use the `Dev Container` feature of the `VS Code`,
which will create a docker container for us and mount the project folder.

#### Setup

Install the extension
[`Dev Containers`](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
in the `VS Code`:

```bash
code --install-extension ms-vscode-remote.remote-containers
```

After the installation, the extension will immediately detect the file
`devcontainer.json` in the project root directory and prompt you to reopen the
project in a container.

#### Configuration

The `devcontainer.json` file is used to configure the development container:

```json
{
  "name": "my-project-devcontainer",
  "image": "texlive/texlive:latest",
  "features": {
    "ghcr.io/devcontainers/features/sshd:1": {
      "version": "latest"
    }
  },
  "customizations": {
    // Configure properties specific to VS Code.
    "vscode": {
      "settings": {},
      // Add the IDs of extensions you want installed when the container is created.
      "extensions": [
        "james-yu.latex-workshop",
        "esbenp.prettier-vscode",
        "eamodio.gitlens",
        "stkb.rewrap",
        "usernamehw.errorlens",
        "streetsidesoftware.code-spell-checker"
      ]
    }
  }
}
```

- `image`: Use the official `TexLive` image from
  [Docker Hub](https://hub.docker.com/r/texlive/texlive).
- `features`: Enable the `SSH` feature to allow us to connect to the container
  using `SSH`. Some users may clone the project using `SSH` instead of `HTTPS`.
- `customizations`: Configure the `VS Code` settings and extensions.
  - `vscode.settings`: Configure the `VS Code` settings.
  - `vscode.extensions`: Install the extensions in the container. These
    extensions will be installed in the container:
    - [`LaTeX Workshop`](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop):
      A powerful LaTeX extension for `VS Code`.
    - [`Prettier`](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode):
      An opinionated code formatter.
    - [`GitLens`](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens):
      Supercharge the Git capabilities built into Visual Studio Code.
    - [`Rewrap`](https://marketplace.visualstudio.com/items?itemName=stkb.rewrap):
      Hard word wrapping for comments and other text at a given column.
    - [`Error Lens`](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens):
      Show errors in the editor.
    - [`Code Spell Checker`](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker):
      Spelling checker for source code.

<!-- FAQ -->

## :grey_question: FAQ

- Can I develop this project on Overleaf?

  - Yes, you can. You can use it as an editor, but you still need to commit
    those changes to the repository.

  - You can find the `Overleaf` template here:
    https://www.overleaf.com/read/jwrxbcrmkgfh. You can read more about the
    template instructions
    [here](https://www.fit.hcmus.edu.vn/vn/LinkClick.aspx?fileticket=uQfVVVLFuE0%3D&tabid=1064&mid=3747).

- Can't remove the `dist` directory?

  - If you develop this project in the container, hence the `dist` is created by
    the container, you can't remove it without changing the owner of the `dist`.

  - To remove the `dist` directory, you have to change the owner:

    ```bash
    sudo chown -R $USER:$USER dist
    ```

  - Then you can remove the `dist` directory:

    ```bash
    rm -rf dist
    ```

    Or you can use the `make` command:

    ```bash
    make clean
    ```

<!-- Contact -->

## :handshake: Contact

Duong Vinh - [@duckymomo20012](https://twitter.com/duckymomo20012) -
tienvinh.duong4@gmail.com

Project Link:
[https://github.com/DuckyMomo20012/latex-template](https://github.com/DuckyMomo20012/latex-template).

<!-- Acknowledgments -->

## :gem: Acknowledgements

Here are useful resources and libraries that we have used in our projects:

- [Development Containers](https://containers.dev/): An open specification for
  enriching containers with development specific content and settings.
- [TexLive](https://www.tug.org/texlive/): A comprehensive TeX system including
  all the major TeX-related programs, macro packages, and fonts that are free
  software.
- [latexindent](https://github.com/cmhughes/latexindent.pl): latexindent.pl is a
  perl script to beautify/tidy/format/indent (add horizontal leading space to)
  code within environments, commands, after headings and within special code
  blocks.
