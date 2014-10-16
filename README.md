# md-to-html-with-hljs-script

## About

> This is a simple script that uses highlight js and markdowns native markdown to html converter to turn md files into viewable web pages
> More info on markdown can be found [here](http://daringfireball.net/projects/markdown/)
> I built this to sovle the problem of not retaining syntax highlight when converting markdown to html.

----------------

## Install

### Markdown

This script was made with markdown 1.0.1-6 and hljs 8.2

markdown can be installed via

```
pacman -S markdown
```
```
yum install perl-Text-Markdown.noarch
```
```
apt-get install markdown
```
----------------
### Hljs

Highlight.js can be installed from their [download page](https://highlightjs.org/download/)

A custom package can be built for specified syntax.


## Configure

> The hljs js folder will need to be put into a directory that is accessible by the web server and declared within: ```header.html```


## Run

To run the script it is as simple as

```
$ ./cmd.sh source_directory target_directory
```

> This will create a web ready html file that imports hljs and replaces the ```syntax``` with the appropriate html tags along with some custom stylings for each md file in the source directory. The outputs will have the same name but with a index.html extension in the output directory.

----------------

