---
title: About Actions
layout: page
---

## Comparison

GitHub's Actions functionality as a build and deploy pipeline for a Jekyll site gives more control than a standard _GitHub Pages_ deploy.

Here are the main differences between GitHub Pages when using Actions or not.

- Jekyll version
    - The GitHub Pages environment limits us to using Jekyll `3.9`.
    - Actions let you use a version in your Gemfile, such as Jekyll `4.2`.
- Plugins
    - GitHub Pages limits you to a set of supported [gem versions](https://pages.github.com/versions/), so you cannot use plugins or versions outside of this. You can only specify whether a config is used by using `plugins` field in the config.
    - Actions lets you choose any plugin - whether your own or someone else's.
- Themes
    - GitHub Pages normally limits you to these [Themes](https://pages.github.com/themes/) at certain versions. Though, GitHub Pages does also let you use the `remote_theme` parameter through the supported [benbalter/jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme) plugin.
    - Actions lets you choose any theme  - whether your own or by someone else.
- Workflow
    - GitHub Pages gives you limited output and error messages when running a build and check that everything built okay.
    - With Actions, you specify a workflow file, do a build in a container and see verbose logged steps and errors. You can combine multiple actions or how secrets are used as environment variables. And you can add extra steps like calling an API at build time using a Ruby plugin. You can even compile a ReactJS site and use other non-Jekyll options if you find the right Action on the Marketplace.
- Build destination
    - GitHub Pages builds to a `_site` or similar build location which you never get to see directly. You can mirror it by building locally of course.
    - Using Actions, you can build to a different branch like `gh-pages`. You can even output to your content another repo. When using GH Pages alone, you just needed one branch like `master` or `main`, without worrying about a `gh-pages` branch.


## Notes

Even if a plugin or themes written for Jekyll 3 installs and runs without error in Jekyll 4, you may still run into issues. For example, you may have to overwrite a theme _layout_ or _includes_ file in your project, so that you can control the URLs better.

See the [Upgrading from 3x to 4x](https://jekyllrb.com/docs/upgrading/3-to-4/) guide to see what changes there are.

See also issue [#651](https://github.com/github/pages-gem/issues/651) on the Pages Gem repo, which deals with adding Jekyll 4 support to GitHub Pages. This is complex to implement, so don't expect it soon.
