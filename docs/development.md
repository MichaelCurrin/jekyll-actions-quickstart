# Development


## Note on locking gems

For this simple demo project with few dependencies, leaving out the `Gemfile.lock` file altogether is reasonable.

Note that `Gemfile.lock` must remain as file **ignored** by `git` to avoid build errors. This because an install locally with `bundle` will put `bundler` as a line in `Gemfile.lock`, while `bundler` use will cause an error on the remote build as its not available (at least in the container used by the chosen GitHub Action here.

Alternatively, keep the file either build will a global (user-level) Jekyll. Or keep building a `Gemfile.lock` remember to manually remove the `bundler` reference.


## Excluding

The `Makefile`, `LICENSE` and `README.md` files in the root do not have to be excluded, as this site is setup to build from a _subdirectory_. Otherwise they would have to be added to the ignore list.

The `Gemfile` and `Gemfile.lock` are _always_ ignored by Jekyll 4.
