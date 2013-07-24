# dotfiles

These are my dotfiles. You need `git(1)` for installation.

## Installation

    $ curl https://raw.github.com/frznvm0/dotfiles/master/setup | sh -

You can also use `wget -O-` instead of `curl`.

If you want to clone somewhere other than `~/.dotfiles`, use the desired destination as the first argument (`... | sh -s path/to/dotfiles`).

#### Customize

    $ git clone https://github.com/frzvnm0/dotfiles.git path/to/dotfiles
    $ cd path/to/dotfiles
    ... create branches, edit files, etc. ...
    $ sh setup

## Updating

    $ cd path/to/dotfiles
    $ git pull

`git pull` runs a post-merge hook that will link all new files automatically.

## Removal

    $ cd path/to/dotfiles
    $ sh setup --remove
    $ rm -rf path/to/dotfiles

## License

Copyright (c) 2013 frznvm0

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

