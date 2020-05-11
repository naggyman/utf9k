# utf9k

This is my personal website, which is powered by [Hugo](https://gohugo.io/), [Tailwind](https://tailwindcss.com/) and [PostCSS](https://postcss.org/)

## Getting setup

Some prerequisites:

* [Node](https://nodejs.org/en/download/)
* [Yarn](https://yarnpkg.com/getting-started/install)
* [Go](https://golang.org/doc/install)
* [Hugo](https://gohugo.io/getting-started/quick-start/)

If you're using a package manager (apt-get, homebrew), you can probably just install Hugo which will pull in golang along with it.

Once that's all done, you shouldn't need to do anything besides a `yarn install` followed by a `yarn start` / `hugo serve -D`

## Layout

All of the CSS assets are stored in `/assets/css` and get bundled by Hugo at build time. It pulls in Tailwind's CSS NPM package as well as some general utilities like `autoprefixer`.

Markdown content (posts, pages etc) are stored in `/content`

HTML templates live in `/layouts`

Images and other static content lives in `/static`

Deployment is handled automatically by [Netlify](https://www.netlify.com/)