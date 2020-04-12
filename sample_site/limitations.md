---
title: Limitations
---

Limitations of using Github Pages **without** using Github Actions to do a custom build.


Only certain supported gems are available and at the version that Github Pages sets.

This means:

- Jekyll (which is also a gem) version is pinned at `3.8.5`.
- You cannot use any custom plugin that you write or find online, unless it is on the list.
- Only about 10 themes are available. These are the ones you choose from in repo Settings when using the theme selector.


Lists of what is supported by Github Pages:

- [Gem versions](https://pages.github.com/versions/)
- [Themes](https://pages.github.com/themes/)


See also issue [#651](https://github.com/github/pages-gem/issues/651) on the Pages Gem which deals with adding Jekyll 4 support to Github Pages.
