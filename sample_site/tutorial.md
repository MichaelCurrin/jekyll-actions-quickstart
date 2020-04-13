---
title: Tutorial
layout: page
---

> Where to find Jekyll actions on Github and how to set one up.

Note that an Action builds inside a container on Github so you need a workflows file to provide the steps and either specify shell commands directly or reference an existing action in your action file to use that.

There are two Actions listed below - [Starter workflows](#starter-workflows) action and [Jekyll Actions by Helaili](#jekyll-actions-by-helaili).


## Starter workflows

If you create a new action through the Actions tab, you'll see a Jekyll action there. You might have to click a _more..._ button.

That references [jekyll.yml](https://github.com/actions/starter-workflows/blob/master/ci/jekyll.yml) in the [actions/starter-workflows](https://github.com/actions/starter-workflows) repo.

It does provide any info though on what you do after a successful build in terms of publishing and viewing results.

This Action was not used for this site and is not covered in more detail.


## Jekyll Actions by Helaili

Description:

> A GitHub Action to build and publish Jekyll sites to GitHub Pages

Links around this Action:

- [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) on the Marketplace
- [helaili/jekyll-action](https://github.com/helaili/jekyll-action) repo
    - By [helaili](https://github.com/helaili), a staff member at Github.
- [entrypoint.sh](https://github.com/helaili/jekyll-action/blob/master/entrypoint.sh)
    - The shell commands which are run in the build, including use of `jekyll` and `git`. This is useful to see what would happen on the remote environment, for example file and directory references for inputs and outputs. Also it shows that `bundle` is actually used in the container.


Note that the action will build from the `master` branch to the `gh-pages` branch and setup Github Pages to point to `gh-pages`. All your edits should be on `master` throughout.

The instructions on the Marketplace page are the same as on the repo _README.md_ and are a good intro. But they leave some details out.

Follow the steps below to setup this Action on your own project.


### Setup repo

Create your project on `master`. The Action can still be triggered by builds to feature branches, but the Action specifically only builds from content on `master`.

If you click _Use latest version_ in the Marketplace, you get this snippet which should be pasted in your YAML actions file:

```yaml
- name: Jekyll Actions
  uses: helaili/jekyll-action@2.0.0
```

Create `Gemfile` in the root.

Create folder containing site contents and also a `_config.yml` file. The folder can be called anything and the plugin will pick it up from the presence of the config.

Create an action at `.github/worksflows/jekyll.yml`, though the file name can be anything.

A typical setup based on the tutorial:

{% raw %}
```yaml
name: Testing the GitHub Pages publication

on:
  push

jobs:
  jekyll:
    runs-on: ubuntu-16.04
    steps:
    - uses: actions/checkout@v2
    - uses:  helaili/jekyll-action@2.0.0
      env:
        JEKYLL_PAT: ${{ secrets.JEKYLL_PAT }}
```
{% endraw %}

**Warning** - this Action will run when you build from a feature branch and then it will overwrite content on the `gh-pages` branch. So it is safer to restrict the workflow to only run on builds to `master`. So replace the `on` section with this:


```yaml
on:
  push:
    branches:
      - master
```

### Add token

The instructions require you to set the variable `JEKYLL_PAT` using your PAT (Personal Access Token).


{% raw %}
```
${{ secrets.JEKYLL_PAT }}
```
{% endraw %}

That token presumably allows access to your Github repo by the action.

This is used in one place in the repo - [entrypoint.sh](https://github.com/helaili/jekyll-action/blob/master/entrypoint.sh):

```
remote_repo="https://${JEKYLL_PAT}@github.com/${GITHUB_REPOSITORY}.git" && \
```

 So you'll need to create in Github and then add it in the _Secrets_ sections of the repo settings - i.e. do not paste it directly in a version-controlled (public) file.

Go here to the repo's Tokens page under Settings:

- [github.com/settings/tokens](https://github.com/settings/tokens)

Then to the _Personal Access Tokens_ tab.

Create a token. Name it something like _Github Actions_.

Ensure it has access to:

- _public repos_ (necessary for pushing to `gh-pages` branch)
- _workflow_

_Note: The build on Github may give a **misleading success** status for all steps. So you'll have to look closer for the error messages. If the build check passes but nothing is rendered. This happened to me and adding permissions fixed the error._

Copy the token value.

Come back to your repo and go to Settings then Secrets.

Create the create named `JEKYLL_PAT` and set the value as copied value.

### Build

You do not need to setup `gh-pages` branch or enable Github Pages. The action will do this for you.

So build your site (such as doing a push to the repo).

Check the status.

- Go to your repo main root in Github. Under the most recent commit (near the top) you'll see a status symbol next to the commit message.
- Or go to Actions tab.

If all goes well, you'll see all the steps completed without error.

### View

On a successful build, Github Pages will publish the site.

Go to the environment tab of your repo. Click _View Deployment_ to see the deployed site.

e.g.

- [michaelcurrin.github.io/jekyll-actions/](https://michaelcurrin.github.io/jekyll-actions/)

Add this to the URL part of your repo to make it easy to find.


### Notes

#### Bundler

Rather than installing Jekyll globally locally, you might want to install Jekyll in your project using _Bundler_.

Note that _Bundler_ will show up in your lock file.

```
...

BUNDLED WITH
   1.17.2
```

But not in your Gemfile. This will cause an error:

```
/usr/local/lib/ruby/2.7.0/rubygems.rb:275:in `find_spec_for_exe': Could not find 'bundler' (1.17.2) required by your /github/workspace/Gemfile.lock. (Gem::GemNotFoundException)
```

Solutions:

- Switch to creating Gemfile.lock using a global Jekyll build locally (not practical if you want to avoid using global Jekyll).
- Delete Gemfile.lock (this means versions are not locked). The remote build will then use its global Jekyll and not try to use Bundler, even if you use Bundler locally.

Unfortunately, putting Bundler inside Gemfile and running install did not work.

#### Env

If you needed to set values in the environment locally, you could do this with an ignore `.env` file. And make sure that is loaded when running a Jekyll build.

In this case the only environment variable needed is one needed to actually run the action and build to `gh-pages` branch, so this project has no `.env` file.
