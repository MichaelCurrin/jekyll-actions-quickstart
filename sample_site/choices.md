---
title: Action choices
---

Where to find Jekyll actions on Github.


## Starter workflows

If you create a new action through the Actions tab, you'll see a Jekyll action there. You might have to click a _more..._ button.

That references this file:

[jekyll.yml](https://github.com/actions/starter-workflows/blob/master/ci/jekyll.yml) in the [actions/starter-workflows](https://github.com/actions/starter-workflows) repo.

It does provide any info though on what you do after a successful build in terms of publishing and viewing results.


## Helaili

See this action **Jekyll Actions***.

> A GitHub Action to build and publish Jekyll sites to GitHub Pages

Links:

- [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) on Marketplace.
- [helaili/jekyll-action](https://github.com/helaili/jekyll-action) repo by [helaili](https://github.com/helaili), a staff member at Github.

The instructions on the Marketplace page are the same as on the repo README.md and are a good intro.

Create your project. Edit on `master` branch.

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


The instructions require you to set the variable `JEKYLL_PAT` using your Personal Access Token. So you'll need to create in Github and then add it in the _Secrets_ sections of the repo settings - i.e. do not paste it directly in a version-controlled (public) file.

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

On a successful build, Github Pages will publish the site and will be available in the environment tab of your repo.

Note that the action will build from the `master` branch to the `gh-pages` branch.

### Warning

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
- Delete Gemfile.lock (this means versions are not locked).
- Install Bundle instead project dependencies by adding to Gemfile and running install command again, to update Gemfile.lock.
