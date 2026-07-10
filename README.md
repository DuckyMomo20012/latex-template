<div align="center">

  <h1>Latex template</h1>

  <p>
    Latex template project
  </p>

</div>

<br />

<!-- Table of Contents -->

# :notebook_with_decorative_cover: Table of Contents

- [Getting Started](#toolbox-getting-started)
  - [Prerequisites](#bangbang-prerequisites)
  - [Run Locally](#running-run-locally)
- [Usage](#eyes-usage)
  - [Makefile](#package-makefile)
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
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
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

> [!NOTE]
> Is it **highly recommended** to open the project with `Dev Container` in `VS
Code` for remote development, and use
> [Latex Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
> extension to compile the project.

You can also use `make` command to compile any `.tex` file in the project:

```bash
make <folder>/<file_name>
```

<!-- Usage -->

## :eyes: Usage

<!-- Makefile -->

### :package: Makefile

There are two targets in the `Makefile`:

- `main`: Compile `.tex` files to generate the pdf file.
  - Usage:

    Compile a specific file (in root directory):

    ```bash
    make <file>
    ```

    Compile a specific file (in subdirectory):

    ```bash
    make <subdirectory>/<file>
    ```

> [!NOTE]
> Avoid adding `./` in the file name, because the `Makefile` will not recognize
> it.

- `pretty`: Format the code using `latexindent`.
  - Usage:

    Format a specific file:

    ```bash
    make pretty FILE=<file_name>
    ```

    Format all files:

    ```bash
    make pretty
    ```

- `clean`: Remove the auxiliary files generated.
  - Usage:

    ```bash
    make clean
    ```

- `deep-clean`: Remove all auxiliary files generated.
  - Usage:

    ```bash
    make deep-clean
    ```

<!-- Cleanup -->

### :wastebasket: Cleanup

Clean up base auxiliary files:

```bash
make clean
```

Clean up all auxiliary files:

```bash
make deep-clean
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

The `devcontainer.json` file is used to configure the development container.

<!-- FAQ -->

## :grey_question: FAQ

- Can I develop this project on [Overleaf](https://www.overleaf.com/)?
  - Yes, you can. You can use it as an editor, but you still need to commit
    those changes to the repository.

  - You can find the `Overleaf` template here:
    https://www.overleaf.com/read/jwrxbcrmkgfh. You can read more about the
    template instructions
    [here](https://www.fit.hcmus.edu.vn/vn/LinkClick.aspx?fileticket=uQfVVVLFuE0%3D&tabid=1064&mid=3747).

  - However, due to recent price changes, the free plan of `Overleaf` is quite
    limited, so you may want to consider using another solution.

- Can I develop this project on [Prism](https://prism.openai.com/)?
  - Yes, you can. You can use it as an editor, but you still need to commit
    those changes to the repository.

  - Prism is a free and open-source online LaTeX editor that allows you to
    write, edit, and compile LaTeX documents in your web browser. We recommend
    using Prism for small projects, but for larger projects, you may want to
    consider using another solution.

- Can't remove the directory?
  - If you develop this project in the container, the directory is created by
    the container, you can't remove it without changing the owner of the
    directory.

  - To remove the sample `dist` directory, you have to change the owner:

    ```bash
    sudo chown -R $USER:$USER dist
    ```

  - Then you can remove the `dist` directory:

    ```bash
    rm -rf dist
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
