# Jekyll Actions Quickstart
> How to setup GitHub Pages + Actions for use with Jekyll 4

[![Build and Deploy GH Pages](https://github.com/MichaelCurrin/jekyll-actions-quickstart/workflows/Build%20and%20Deploy%20GH%20Pages/badge.svg)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/actions)

[![Made with Github Pages](https://img.shields.io/badge/Made_with-GitHub_Pages-blue.svg)](https://pages.github.com/)
[![Made with Github Actions](https://img.shields.io/badge/Made_with-GitHub_Actions-blue.svg)](https://help.github.com/en/actions)
[![Made with Jekyll Actions](https://img.shields.io/badge/Jekyll_Actions-2.0.2-blue.svg)](https://github.com/marketplace/actions/jekyll-actions)

[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-actions-quickstart)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/tags/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue)](#license)


## Purpose

A live demo and introduction around deploying Jekyll 4 to GitHub Pages, using GitHub Actions and the [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) action.


## How can I use Jekyll 4 with GitHub Actions?

Follow one of the approaches below to learn how it works and set up your own site and workflow.


### Tutorial

This project was developed as part of writing a step-by-step guide for the Jekyll site's documentation. 

Here is the link:

- [Jekyll CI Github Actions tutorial](https://jekyllrb.com/docs/continuous-integration/github-actions/)


### Demo

See this project's live demo hosted on Github Pages:

[![Github Pages site](https://img.shields.io/badge/site-Github_Pages-blue?style=for-the-badge)](https://michaelcurrin.github.io/jekyll-actions-quickstart/)


### Create from template

Create your own repo like this one using the button below and the instructions on this page.

[![Use this template](https://img.shields.io/badge/Use_this_template-green.svg?style=for-the-badge)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/generate)


## Requirements

- [Ruby](https://www.ruby-lang.org/)
- [Bundler](https://bundler.io)


## Remote setup
> How to setup as a GitHub Pages site

1. Add this repo to your GitHub repos using the template or fork button. You only need `master` branch. The `gh-pages` branch will get build from scratch.
2. Follow the instructions in the tutorial page's _Add token_ section to add `JEKYLL_PAT` to the environment as Secret, so you have a Github Auth token created and added to your repo.
3. Save a file or push a commit then watch the site get built to Github Pages.
4. Check the _environment_ tab to see the status and the URL.


## Run locally

### Installation

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems).
2. Install Bundler as a user gem.
    ```sh
    $ gem install bundler --user-level
    ```
3. Clone the repo or your repo copied from the template.
4. Install project dependencies using Bundler. This will include Jekyll 4.
    ```sh
    $ make install
    ```

### Usage

Start a development server using the project-scoped Jekyll.

```sh
$ make serve
```


## Development

<!-- If you've forked this project or used the template so you can make a new site, you can delete this Development section. -->

### Note on locking gems

For this simple demo project with few dependencies, leaving out the `Gemfile.lock` file altogether is reasonable.

Note that `Gemfile.lock` must remain as file **ignored** by `git` to avoid build errors. This because an install locally with `bundle` will put `bundler` as a line in `Gemfile.lock`, while `bundler` use will cause an error on the remote build as its not available (at least in the container used by the chosen Github Action here.

Alternatively, keep the file either build will a global (user-level) Jekyll. Or keep building a `Gemfile.lock` remember to manually remove the `bundler` reference.

### Excluding

The `Makefile`, `LICENSE`, `README.md` do not have to be excluded as this site is setup to build from a subdirectory. Otherwise they would have to be added.

The `Gemfile` and `Gemfile.lock` are always ignored by Jekyll 4.


## License

- Released under [MIT](/LICENSE).
- Feel free to modify and reuse this project. You are required to include the license when using this code. Copy `LICENSE` to `LICENSE-source` and then modify `LICENSE` with your own name.
- Please link back to this repo as well.
