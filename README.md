
Workflow based on Webpack & CirruScript
----

Scaffold for personal projects.

### Bash Alias

```bash
# webpack-workflow
export wf=/Users/chen/repo/mvc-works/webpack-workflow/
alias workflow="
cp $wf/gulpfile.* .;
cp $wf/package.json .;
cp $wf/webpack.* .;
cp $wf/template.cirru .;
cp $wf/.gitignore .;
cp $wf/.npmignore .;
cp $wf/README.md .;
cp -r $wf/style .;
cp -r src .;
git init;
"
```

### Usage

* Development

```text
npm i
gulp html
webpack-dev-server --hot
```

* Production

```text
gulp buld
gulp rsync
```

### License

MIT
