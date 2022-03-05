+++
author = "Pacifica Labs"
title = "Step-By-Step-Guide: Deploy your Hugo-built static site online."
date = "2021-07-22"
description = "Follow these straightforward steps to deploy your static site built with Hugo for free."
whythismatters = "Though hosting a free static site sounds tempting, configuration & version tracking during deployment can be fraught with unforeseen difficulties."
tags = [
    "hugo",
    "static-site",
    "developer",
    "github-pages",
    "easy"
]
+++
### Background
When selecting a static site generator our team were frustrated with the slow build time of Jekyll. 

We eventually settled upon [Hugo](https://www.gohugo.com), the superfast framework built in Googles own language Go. 

The motto of Hugo is build sites lightning fast & the [build time](https://stackshare.io/stackups/hugo-vs-jekyll#:~:text=Generally%20speaking%2C%20Hugo%20builds%20sites,is%20to%20stay%20extremely%20fast.) doesn't disappoint.

*Deploying static sites are not at all straightforward & the options on the Hugo website don't really offer anything that's fast to setup & user friendly to maintain. Below is our guide to quickly deploying your Hugo site....*  

### Assumptions & Prerequisites
1. You have Hugo installed
2. You're ready to publish your content online.
3. You have initialized your root folder with git & have made a number of commitments.

### Steps:

1. Ensure your baseURl is an empty string & not a url.
```bash
# config.yaml
title: "Pacifica Labs"
baseURL: ""  # note the absence of any url
languageCode: "en-AU"
```
2. Ensure Hugo builds all your content from scratch by removing your public folder:

```bash
rm -rf public/

```

3. *Build your static site content*...
  
```bash
$ hugo
Start building sites …

                   | EN
-------------------+-----
  Pages            | 21
  Paginator pages  |  0
  Non-page files   |  0
  Static files     | 18
  Processed images | 16
  Aliases          |  6
  Sitemaps         |  1
  Cleaned          |  0

Total in 263 ms
``` 

 3. You will see newly compiled content in the *public* folder:

```sh
$ ls public/

404.html
about
articles
blog
docs
favicon.ico
fonts
gallery
index.html
(...)
(...)
(...)
(etc)

```

4. Create an empty repository on [github](https://docs.github.com/en/get-started/quickstart/create-a-repo) and commit your entire project folder:

```bash

git add .

git commit -m "first commit"

```

5. Create a new branch called gh-pages which is the branch github pages will read from when deploying the static site:

6. Create a subtree
 
```bash
git push origin `git subtree split --prefix public master`:gh-pages --force
```

7. Wait til the pages notification changes from *blue* to *green*

8. Confirm your changes!

#### The Big Picture:

Key steps in deploying a Hugo repository require subtree usage.

#### Go Deeper... 
(Further reading links here)
This is a [bash script](https://gist.github.com/pacificalabs/27b60e18d0c1a472d6f7cde1350cde15) I have written to automate the above steps of the deployment process.

#### ***Appendix***

1. The [top 4](https://jamstack.org/generators/) global static site generators were Next.js, Hugo & Gatsby & Jekyll. 
2. In benchmarking tests Hugo compiled [23x](https://forestry.io/blog/hugo-vs-jekyll-benchmark/#tl-dr) faster than Jekyll.