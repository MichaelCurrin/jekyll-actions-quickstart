---
title: Tutorial
layout: page
---

> Where to find Jekyll actions on GitHub and how to set one up.


## Tutorial on Jekyll docs

To learn how to setup a Jekyll / GitHub Actions / GitHub Pages integration, see the [GitHub Actions](https://jekyllrb.com/docs/continuous-integration/github-actions/) guide on the Jekyll docs site.

This project was actually developed as part of the processing of writing that step-by-step guide and there is a link at the end of the doc back to this repo.


## Extra details

Some details not mentioned in that guide but which I still want to share.

- Links
    - See [helaili/jekyll-action](https://github.com/helaili/jekyll-action) repo which by [helaili](https://github.com/helaili), a staff member at GitHub. The instructions there cover optional input values.
    - [entrypoint.sh](https://github.com/helaili/jekyll-action/blob/master/entrypoint.sh)
        - This covers the shell commands which are run in the build, including use of `jekyll` and `git`. This is useful to see what would happen on the remote environment, for example file and directory references for inputs and outputs. Also it shows how `bundle` is actually used in the container.
- Subdirectory usage
    - The action mentioned above will build from any directory which contains a config file. This is usually the root but can be a subdirectory, such as is the case for this repo.
- Dotenv file
    - If you need to set values in the environment locally, you could do this with an ignored `.env` file at the root. You'll have to to load that into the shell. Some plugins will read from a `.env` file though. In this case the only environment variable needed is one needed to actually run the action and build to `gh-pages` branch, so this project has no `.env` file.
