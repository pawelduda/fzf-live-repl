# 🚀 fzf-live-repl 🚀

This hacky one-liner turns your [fzf](https://github.com/junegunn/fzf) into a live REPL. There is not much to explain,
see it for yourself. Please note that I will be adding more examples as I come up with them. You are also welcome to
contribute them yourself by creating an issue or a pull request.

[Featured in my blog post](https://paweldu.dev/posts/fzf-live-repl/)

## How?
By abusing the `--preview` flag of `fzf`. It allows an arbitrary command to be executed as the query changes. The `{q}`
is then being substituted by your typed query. After exiting `fzf` by pressing `enter`, the `--print-query` flag ensures that the typed
query will be printed to stdout.

## WARNING!
Always be careful what you set the `--preview` flag to! **Imagine setting `rm -rf` and then typing `*` as the query
string!**. I take no responsibility if you break anything! **ALWAYS KNOW WHAT YOU'RE TYPING/PASTING.**

## Examples

### Live awk preview
```bash
$ echo '' | fzf --print-query --preview 'echo "a\nb\nc\nd" | awk {q}'
```
![live-awk-preview](gifs/fzf_awk.gif?raw=True)

### Peek into contents of a directory
```bash
$ echo '' | fzf --preview 'ls {q}'
```
![fzf-ls](gifs/fzf_ls.gif?raw=True)

### Execute a Ruby script
```bash
$ echo '' | fzf --print-query --preview 'ruby -e {q}'
```
![fzf-ruby](gifs/fzf_ruby.gif?raw=True)

### Instantly browse manpages and find the relevant flag as you type the command
```bash
$ #TODO
```
