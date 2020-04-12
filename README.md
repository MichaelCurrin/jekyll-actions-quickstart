# Jekyll Actions
> Demo of using Jekyll 4 on Github Pages through Actions

[![Jekyll site CI](https://github.com/MichaelCurrin/jekyll-actions/workflows/Jekyll%20site%20CI/badge.svg)](https://github.com/MichaelCurrin/jekyll-actions/actions)


View the demo site, which also acts as a tutorial and resources.

- [jekyll-actions](https://michaelcurrin.github.io/jekyll-actions/)


## Resources

- [jekyll.yml](https://github.com/actions/starter-workflows/blob/master/ci/jekyll.yml) from [actions/starter-workflows](https://github.com/actions/starter-workflows/blob/master/ci/jekyll.yml) - used to create this project's workflow.
- [Actions](https://github.com/features/actions) on Github docs
- [Jekyll-related actions](https://github.com/marketplace?type=actions&query=jekyll) in the Github Marketplace.


## Development

### Note on locking gems

For this simple demo project with few dependencies, leaving out the `Gemfile.lock` file altogether is reasonable.

Note that `Gemfile.lock` must remain as file **ignored** by `git` to avoid build errors. This because an install locally with `bundle` will put `bundler` as a line in `Gemfile.lock`, while `bundler` use will cause an error on the remote build as its not available (at least in the container used by the chosen Github Action here.

Alternatively, keep the file either build will a global (user-level) Jekyll. Or keep building a `Gemfile.lock` remember to manually remove the `bundler` reference.



## License

Released under [MIT](/LICENSE).
