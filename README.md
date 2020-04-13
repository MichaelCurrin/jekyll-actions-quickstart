# Jekyll Actions Quickstart
> Demo, template and tutorial for using Jekyll 4 through Github Actions

[![Jekyll site CI](https://github.com/MichaelCurrin/jekyll-actions-quickstart/workflows/Jekyll%20site%20CI/badge.svg)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/actions)
[![Made with Github Pages](https://img.shields.io/badge/Made%20with-Github%20Pages-blue.svg)](https://pages.github.com/)
[![Made with Github Actions](https://img.shields.io/badge/Made%20with-Github%20Actions-blue.svg)](https://help.github.com/en/actions)
[![Made with Jekyll Actions](https://img.shields.io/badge/Jekyll%20Actions-2.0.0-blue.svg)](https://github.com/marketplace/actions/jekyll-actions)


Project site:

[![Github Pages site](https://img.shields.io/badge/site-Github%20Pages-blue?style=for-the-badge)](https://michaelcurrin.github.io/jekyll-actions-quickstart/)


Get your own repo like this:

[![Use this template](https://img.shields.io/badge/Use_this_template-green.svg)](https://github.com/MichaelCurrin/jekyll-actions-quickstart/generate)


## Development

### Note on locking gems

For this simple demo project with few dependencies, leaving out the `Gemfile.lock` file altogether is reasonable.

Note that `Gemfile.lock` must remain as file **ignored** by `git` to avoid build errors. This because an install locally with `bundle` will put `bundler` as a line in `Gemfile.lock`, while `bundler` use will cause an error on the remote build as its not available (at least in the container used by the chosen Github Action here.

Alternatively, keep the file either build will a global (user-level) Jekyll. Or keep building a `Gemfile.lock` remember to manually remove the `bundler` reference.



## License

Released under [MIT](/LICENSE).
