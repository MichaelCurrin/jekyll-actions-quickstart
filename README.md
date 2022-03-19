# Jekyll Actions Quickstart
> Deploy a Jekyll 4 site to GH Pages using the "Jekyll Actions" action

[![GH Pages CI](https://github.com/MichaelCurrin/jekyll-actions-quickstart/workflows/GH%20Pages%20CI/badge.svg)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/actions?query=workflow:"GH+Pages+CI")
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-actions-quickstart)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/tags/)
[![License](https://img.shields.io/badge/License-MIT-blue)](#license)

[![Hosted with GH Pages](https://img.shields.io/badge/Hosted_with-GitHub_Pages-blue?logo=github&logoColor=white)](https://pages.github.com/)
[![Made with GH Actions](https://img.shields.io/badge/CI-GitHub_Actions-blue?logo=github-actions&logoColor=white)](https://github.com/features/actions)

[![Made with Jekyll](https://img.shields.io/badge/Jekyll-4.x-blue?logo=jekyll&logoColor=white)](https://jekyllrb.com)
[![Made with Jekyll Actions](https://img.shields.io/badge/Jekyll_Actions-2.x-blue.svg)](https://github.com/marketplace/actions/jekyll-actions)


## Purpose

A live demo and introduction around deploying Jekyll 4 to GitHub Pages - using a GitHub Actions workflow and the [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) action. If you prefer a more generic, flexible, and reusable flow, see my related quickstart repo - [jekyll-gh-actions-quickstart](https://github.com/MichaelCurrin/jekyll-gh-actions-quickstart). That uses a Ruby action to install Ruby and gems, builds using a shell command, and then deploys using an action that handles GitHub Pages.

GitHub Pages already supports building a plain HTML or Jekyll site. No workflow configuration needed for that. So, the reason for GitHub Actions here to build a Jekyll site is that it gives us more control over the environment and build steps. Like the ability to choose Jekyll 4 instead of Jekyll 3, using custom gems, and adding in shell, Python, or NPM commands before the Jekyll build command.

If you are new to GH Actions, see links and code snippets in my [Workflow Builder](https://michaelcurrin.github.io/workflow-builder/) project.


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

[![Use this template](https://img.shields.io/badge/Generate-Use_this_template-2ea44f?style=for-the-badge)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/generate)

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


## Documentation
> How to install and run locally and deploy on GH Pages

<div align="center">

[![View - Documentation](https://img.shields.io/badge/View-Documentation-blue?style=for-the-badge)](/docs/)

</div>


## License

- Released under [MIT](/LICENSE) by [@MichaelCurrin](https://github.com/MichaelCurrin).
- Feel free to modify and reuse this project. You are required to include the license when using this code. Copy `LICENSE` to `LICENSE-source` and then modify `LICENSE` with your own name.
- Please link back to this repo.
