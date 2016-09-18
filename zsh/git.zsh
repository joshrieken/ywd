# Makes git auto completion faster favoring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}
