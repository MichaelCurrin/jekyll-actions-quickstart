# Deploy
> How to deploy this project as a remote site using GH Pages and GH Actions


## Run a local production build

If you want to use `make`:

```sh
$ make build
```

Or

```sh
$ cd sample_site
$ JEKYLL_ENV=production bundle exec jekyll build -d ../build --trace
```

Then view the output in `build` at your project root.


## Set up this project as a GitHub Pages site

The part which makes this project run on GitHub Actions is the workflow file - see [jekyll.yml](/.github/workflows/jekyll.yml). You do _not_ need to modify that file. Except perhaps to change the branch to `main`.

1. Add this repo to your GitHub repos using the template or fork button. You only need `master` branch. The `gh-pages` branch will get built from scratch later.
1. Save a file or push a commit.
1. Go to the _Actions_ tab of your repo to see the workflow running.
    - On success, it will generate the site, commit to `gh-pages` branch and make the content available GH Pages.
    - On the _very first_ run, you'll see a success, but not actually have the site live. So then you need to go into the _Settings_ of your repo and turn GitHub Pages **off** and then on again (for `gh-pages` branch). This has been my experience on multiple projects.
1. Check the _Environment_ section to see the status and your GH Pages URL.

Your GH Pages site is live on GH Pages. It now rebuilds and deploys on a commit or push - using custom gems.

Update the badge in your `README.md` to point to your workflow - this makes it easy to see the passing/failing status of your workflow.

Note that the workflow has been configured to deploy using one branch - the default one. If you had the workflow run against other branches too, then you would accidentally deploy to your site any time your pushed work-in-progress code to a branch.


## How GH Pages and GH Actions work together

Here we use GitHub Actions as a CI/CD flow to just _build_ the site. It does not actually _serve_ anything.

The GitHub Pages deploy runs here, as if you were not using GH Actions at all. The difference is that normally GH Pages points to source content on `master` or `main` branch and no second branch is needed. Here we build to `gh-pages` directory and GH Pages then serves that. There are no Jekyll configs or markdown files on `gh-pages` - just compiled HTML files and other assets. The Action we use also adds an empty `.nojekyll` file to the `gh-pages` branch for us, to explicitly tell GH Pages to serve the content with doing a build.
