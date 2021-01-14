# Jekyll Actions Quickstart
> How to setup GH Pages + GH Actions for use with Jekyll 4

[![Build and Deploy GH Pages](https://github.com/MichaelCurrin/jekyll-actions-quickstart/workflows/Build%20and%20Deploy%20GH%20Pages/badge.svg)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/actions)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-actions-quickstart)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/tags/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue)](#license)

[![Jekyll](https://img.shields.io/badge/Jekyll-4-blue?logo=jekyll&logoColor=white)](https://jekyllrb.com)
[![Made with Github Pages](https://img.shields.io/badge/Made_with-GitHub_Pages-blue.svg)](https://pages.github.com/)
[![Made with Github Actions](https://img.shields.io/badge/Made_with-GitHub_Actions-blue.svg)](https://help.github.com/en/actions)
[![Made with Jekyll Actions](https://img.shields.io/badge/Jekyll_Actions-2.0.2-blue.svg)](https://github.com/marketplace/actions/jekyll-actions)


## Purpose

A live demo and introduction around deploying Jekyll 4 to GitHub Pages - using GitHub Actions and the [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) action.


## How can I use Jekyll 4 with GitHub Actions?

Follow one of the approaches below to learn how it works and set up your own site and workflow.

### Tutorial

This project was developed as part of writing a step-by-step guide for the Jekyll site's documentation.

Here is the link:

- [Jekyll CI Github Actions tutorial](https://jekyllrb.com/docs/continuous-integration/github-actions/)

### Demo

See this project's live demo hosted on Github Pages:

<div align="center">
    
[![Github Pages site](https://img.shields.io/badge/site-Github_Pages-blue?style=for-the-badge)](https://michaelcurrin.github.io/jekyll-actions-quickstart/)

</div>

### Create from template

Create your own repo like this one using the button below. Then continue following the setup and run instructions on this page.

<div align="center">

[![Use this template](https://img.shields.io/badge/Use_this_template-2ea44f?style=for-the-badge)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/generate)

</div>

### Comparing approaches

There are many ways to deploy a Jekyll site on GH Pages. I cover some in my [Code Cookbook](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/jekyll/).

Those approaches have different levels of complexity:

- You use an all-one Jekyll + GH Pages action, like the one in this project and tutorial.
- Or use a separate action for Jekyll and then another for GH Pages for more modularity (you can swap out one action easily and you can reuse the GH PAges deploy action for other projects like for React).
- Or you can avoid premade actions and write all the low-level code yourself (not recommended.

The approaches have varying levels of security. 

- Some flows use the GitHub-generated `GITHUB_TOKEN`, which only has access to one repo during workflow run and is _very_ secure.
- Others like the one used in project use a user-generated Personal Access Token which has access to update _all_ your public repos and so is _less_ secure.


## Requirements

- [Ruby](https://www.ruby-lang.org/)
- [Bundler](https://bundler.io)

For convenience, this project used [GNU Make](https://www.gnu.org/software/make/), which is standard on Linux and macOS. If you do not have it on Windows, you can skip `make` commands and use the more verbose commands supplied in the docs of this project.


## Deploy
> How to deploy this project as a remote site using GH Actions and GH Pages

The part which makes this project run on GitHub Actions is the workflow file - see [jekyll.yml](/.github/workflows/jekyll.yml). You do _not_ need to modify that file. But, you do need to set a GH API **token** for it to use. See below.

How to setup as a GitHub Pages site:

1. Add this repo to your GitHub repos using the template or fork button. You only need `master` branch. The `gh-pages` branch will get built from scratch later.
1. Follow the instructions in the tutorial page's _Add token_ section to add `JEKYLL_PAT` to the environment as Secret, so you have a Github Auth token created and added to your repo.
1. Save a file or push a commit.
1. Go to the _Actions_ tab of your repo to see the workflow running.
    - On success, it will generate the site, commit to `gh-pages` branch and make the content available GH Pages.
    - On the very first run, you'll see a success but not actually have the site live. So then you need to go into the Settings of your repo and turn GitHub Pages **off** and then on again (for `gh-pages` branch). This has been my experience.
1. Check the _environment_ section to see the status and the GH Pages URL.

Your GH Pages site is live on GH Pages and now rebuilds and deploys on a commit or push - using custom gems.

Note: The _standard_ GitHub Pages flow actually still run behind the scenes in addition to the GH Actions build (which actually can't serve anything alone). The GitHub Pages service just sees `gh-pages` branch as static HTML assets with no Jekyll config, so it will serve the content without processing it through Jekyll.


## Run locally

### Installation

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems).
2. Install Bundler as a user gem. Some people prefer to omit `--user-install` flag but then you need access to install to a shared `/usr/lib/ruby` directory.
    ```sh
    $ gem install bundler --user-install
    ```
3. Clone the repo or your repo copied from the template.
4. Install project dependencies using Bundler. This will include Jekyll 4.
    ```sh
    $ bundle config set --local path vendor/bundle
    $ bundle install
    ```
    If you like `make` on Linux or macOS, then simply run this instead:
    ```sh
    $ make install
    ```

### Usage

Start a development server using the project-scoped Jekyll (ignoring any globally-installed Jekyll gem).

```sh
$ bundle exec jekyll serve --source sample_site --destination build/ --livereload --trace
```

Or, using `make`:

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

The `Makefile`, `LICENSE` and `README.md` files do not have to be excluded, as this site is setup to build from a _subdirectory_. Otherwise they would have to be added to the ignore list.

The `Gemfile` and `Gemfile.lock` are _always_ ignored by Jekyll 4.


## License

- Released under [MIT](/LICENSE) by [@MichaelCurrin](https://github.com/MichaelCurrin).
- Feel free to modify and reuse this project. You are required to include the license when using this code. Copy `LICENSE` to `LICENSE-source` and then modify `LICENSE` with your own name.
- Please link back to this repo as well.
