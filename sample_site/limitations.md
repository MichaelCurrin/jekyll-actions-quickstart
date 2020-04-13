---
title: Limitations
layout: page
---

> Description of the limitations of using gems supported by Github Pages when not using Actions.


Only certain supported gems are available and at the version that Github Pages sets.

This means:

- Jekyll (which is also a gem) version is pinned at `3.8.5`.
- The other supported plugins are only available at pinned versions.
- Any unsupported plugin you find or write cannot be used.
- Only about 10 themes are available as supported themes. These are the ones you choose from in repo Settings when using the theme selector.
- Note there is a way to set a remote theme (not supported by Github) using `remote_theme` parameter and [benbalter/jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme) plugin, which is already supported plugin.


Github Pages supports what is on these lists:

- [Gem versions](https://pages.github.com/versions/)
- [Themes](https://pages.github.com/themes/)


See also issue [#651](https://github.com/github/pages-gem/issues/651) on the Pages Gem which deals with adding Jekyll 4 support to Github Pages.
