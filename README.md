# Jekyll Actions Quickstart
> How to setup GH Pages + GH Actions for use with Jekyll 4

[![Build and Deploy GH Pages](https://github.com/MichaelCurrin/jekyll-actions-quickstart/workflows/Build%20and%20Deploy%20GH%20Pages/badge.svg)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/actions?query=workflow:"Build+and+Deploy+GH+Pages")
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-actions-quickstart)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/tags/)
[![License](https://img.shields.io/badge/License-MIT-blue)](#license)

[![Hosted with GH Pages](https://img.shields.io/badge/Hosted_with-GitHub_Pages-blue?logo=github&logoColor=white)](https://pages.github.com/)
[![Made with GH Actions](https://img.shields.io/badge/CI-GitHub_Actions-blue?logo=github-actions&logoColor=white)](https://github.com/features/actions)

[![Made with Jekyll](https://img.shields.io/badge/Jekyll-4.x-blue?logo=jekyll&logoColor=white)](https://jekyllrb.com)
[![Made with Jekyll Actions](https://img.shields.io/badge/Jekyll_Actions-2.x-blue.svg)](https://github.com/marketplace/actions/jekyll-actions)


## Purpose

A live demo and introduction around deploying Jekyll 4 to GitHub Pages - using GitHub Actions and the [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) action.


## How can I use Jekyll 4 with GitHub Actions?

Follow one of the approaches below to learn how it works and set up your own site and workflow.

### Tutorial

This project was developed as part of writing a step-by-step guide for the Jekyll site's documentation.

Here is the link:

- [Jekyll CI GitHub Actions tutorial](https://jekyllrb.com/docs/continuous-integration/github-actions/)

### Demo

See this project's live demo hosted on GitHub Pages:

<div align="center">

[![GitHub Pages site](https://img.shields.io/badge/site-GitHub_Pages-blue?style=for-the-badge)](https://michaelcurrin.github.io/jekyll-actions-quickstart/)

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
- Or you can avoid pre-made actions and write all the low-level code yourself (not recommended.

The approaches have varying levels of security.

- Some flows use the GitHub-generated `GITHUB_TOKEN`. This only has access to one repo during workflow a run, is never seen by a human and so is _very_ secure.
- Other flows expect a user-generated Personal Access Token. This has access to update _all_ of your public repos and requires you to generate and store it. It might get abused by a vulnerable or malicious Action. It is _less_ secure.


## Requirements

- [Ruby](https://www.ruby-lang.org/)
- [Bundler](https://bundler.io)

For convenience, this project used [GNU Make](https://www.gnu.org/software/make/), which is standard on Linux and macOS. If you do not have it on Windows, you can skip `make` commands and use the more verbose commands supplied in the docs of this project.


## Deploy
> How to deploy this project as a remote site using GH Actions and GH Pages

The part which makes this project run on GitHub Actions is the workflow file - see [jekyll.yml](/.github/workflows/jekyll.yml). You do _not_ need to modify that file. Except perhaps to change the branch to `main`.

How to setup this project as a GitHub Pages site:

1. Add this repo to your GitHub repos using the template or fork button. You only need `master` branch. The `gh-pages` branch will get built from scratch later.
2. Save a file or push a commit.
2. Go to the _Actions_ tab of your repo to see the workflow running.
    - On success, it will generate the site, commit to `gh-pages` branch and make the content available GH Pages.
    - On the _very first_ run, you'll see a success, but not actually have the site live. So then you need to go into the _Settings_ of your repo and turn GitHub Pages **off** and then on again (for `gh-pages` branch). This has been my experience on multiple projects.
5. Check the _Environment_ section to see the status and your GH Pages URL.

Your GH Pages site is live on GH Pages. It now rebuilds and deploys on a commit or push - using custom gems.

Update the badge in your `README.md` to point to your workflow - this makes it easy to see the passing/failing status of your workflow.

### GitHub Pages vs GitHub Actions

Here we use GitHub Actions as a CI/CD flow to just build the site. It does not actually serve anything.

The GitHub Pages deploy runs here, as if you were not using GH Actions at all. The difference is that normally GH Pages points to source content on `master` or `main` branch and no second branch is needed. Here we build to `gh-pages` directory and GH Pages then serves that. There are no Jekyll configs or markdown files on `gh-pages` - just compiled HTML files and other assets. The Action we use also adds an empty `.nojekyll` file to the `gh-pages` branch for us, to explicitly tell GH Pages to serve the content with doing a build.


## Run locally

### Installation

1. Clone the repo or your repo copied from the template.
2. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems).
3. Install Bundler as gem for your user.
    ```sh
    $ gem install bundler --user-install
    ```
4. Install project dependencies using Bundler. This will include Jekyll 4.
    ```sh
    $ bundle config set --local path vendor/bundle
    $ bundle install
    ```
    If you use `make` on Linux or macOS, then simply run this instead:
    ```sh
    $ make install
    ```

Some people prefer to _omit_ the `--user-install` flag, but, then you need access to install to a shared `/usr/lib/ruby` directory, which could require use of `sudo` to run the `gem` command. In that case, rather change permissions on `/usr/lib/ruby` directory to be writable by all users, so you never have to run `sudo gem ...`.

### Usage

Start a development server using the project-scoped Jekyll (ignoring any globally-installed Jekyll gem).

```sh
cd sample_site
bundle exec jekyll serve --destination ../build/ --trace --livereload
```

Or, using `make`:

```sh
$ make serve
```


## Development

<!-- If you've forked this project or used the template so you can make a new site, you can delete this Development section. -->

### Note on locking gems

For this simple demo project with few dependencies, leaving out the `Gemfile.lock` file altogether is reasonable.

Note that `Gemfile.lock` must remain as file **ignored** by `git` to avoid build errors. This because an install locally with `bundle` will put `bundler` as a line in `Gemfile.lock`, while `bundler` use will cause an error on the remote build as its not available (at least in the container used by the chosen GitHub Action here.

Alternatively, keep the file either build will a global (user-level) Jekyll. Or keep building a `Gemfile.lock` remember to manually remove the `bundler` reference.

### Excluding

The `Makefile`, `LICENSE` and `README.md` files in the root do not have to be excluded, as this site is setup to build from a _subdirectory_. Otherwise they would have to be added to the ignore list.

The `Gemfile` and `Gemfile.lock` are _always_ ignored by Jekyll 4.


## License

- Released under [MIT](/LICENSE) by [@MichaelCurrin](https://github.com/MichaelCurrin).
- Feel free to modify and reuse this project. You are required to include the license when using this code. Copy `LICENSE` to `LICENSE-source` and then modify `LICENSE` with your own name.
- Please link back to this repo.
