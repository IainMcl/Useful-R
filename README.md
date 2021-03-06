Fun things in R
================
Iain McLaughlan
10/2/2021

  - [Quick tips](#quick-tips)
      - [Package install](#package-install)
      - [Snippets](#snippets)
      - [Better printing](#better-printing)
  - [R project - quick setup](#r-project---quick-setup)
      - [External dependincies](#external-dependincies)
      - [Roxygen - documentation](#roxygen---documentation)
      - [Testing](#testing)
  - [Renv - library environments](#renv---library-environments)
  - [Git](#git)

# Quick tips

### Package install

Make sure that a package is installed.

``` r
if(!library(<package>)){
    install.packages("<package>")
    library(<package>)
}
```

### Snippets

Bored of typing too much? Use
[snippets](https://jozef.io/r906-rstudio-snippets/). Go to `Tools >>
Global options >> Code >> Edit snippets`. In here is a list of snippets
which can be edited to match the use case that you use it most for.
These can come up as auto complete suggestions but if not can be added
by typing the key then `Shift + Tab`.

An example

``` r
snippet if
    if($1:condition){
        {2:code}
    }
```

Typing `if` then `Shift + Tab` the code in the snippet will be added.
Hit `Tab` to move between editables.

### Better printing

Don’t like printing having a \[1\] in front of it?

``` r
cat("<string>")
```

# R project - quick setup

``` r
# Create an R project
devtools::create(path = "./<PROJECT NAME>")

# Initialise an R environment
renv::init()

# Set up unit testing
usethis::use_testthat()

# Build package
devtools::build(path = "./")
# Setting the path = "./" will create the .tar.gz within the project dir.
# If not then specify a path to your package dir.

# Installing from .tar.gz
# In this case path_to_file = "./Project_0.0.1.tar.gz"
path_to_file = "./Project_0.0.1.tar.gz"
install.packages(path_to_file, repos = NULL, type="source")
```

## External dependincies

Working within `./R/` **DON’T** use `library(...)` or `require(...)`

``` r bg-danger
# Within a packaged don't use
library(<LIBRARY NAME>)
# or
require(<LIBRARY NAME>)
```

Instead update the DESCRIPTION file with an `Imports:` section.

``` r bg-success
# Within DESCRIPTION
Imports:
    ggplot2 (>= 3.3.3)
```

Adding imports in this way will install with dependencies when the
package is installed. If using this as a pretend package that isn’t
installed fully then adding `library(...)` for the given dependency in
the running file should work.

## Roxygen - documentation

In a working file use Ctrl + Alt + Shift + R to add a Roxygen
documentation template.

``` r
# With roxygen comments on functions within ./R create a manual
devtools::document()
```

## Testing

### Testthat - unit testing

``` r
# Create testing file structure
usethis::use_testthat()

# Create tests for the current working file
usethis::use_test() # Adds a test file in ./tests/testthat/test-<FILE NAME>.R

# Run all tests
devtools::test()
```

### Covr - test coverage

Test coverage.

# Renv - library environments

``` r
# Creating an R environment
renv::init()
# Taking a snapshot of the current dependencies and store in renv.lock.
renv::snapshot()

# Load back to the last snapshot
renv::restore()
```

# Git

Supper basic just covering the most commonly used commands.

Create a git repo

``` r
git init
```

Add files, commit and push to remote repo (like github or another file
store).

``` r
git add . 
git commit -m "<SHORT DESCRIPTION"> -m "<LONGER DESCRIPTION>(optional)"
git push <REMOTE NAME> <BRANCH NAME>
# example
git push origin master
```

Checkout new branch and add to remote.

``` r
git branch <NEW BRANCH NAME>
```

or

``` r
git checkout -b <NEW BRANCH NAME>

git push --set-upstream <remote> <branch>
# example
git push --set-upstream origin master

# If branch is already tracked on remote
git push
```

Pull data from remote

``` r
git pull <remote> <branch>
#example
git pull origin master
# If on branch
git pull
```

General info

``` r
git status
```
