# LearningHaskell
Self-learning Haskell.

## Content
* [Development environment (made from scratch)](#env)
* [First need commands](#basic)

## <a name=env />Development environment (made from scratch)

* Operating system:
  - Host OS: Microsoft Windows 10
  - Hypervisor: Microsft Hyper-V
  - Guest OS: [FreeBSD] 10.2-RELEASE (deployed into VM from i386-bootonly.iso)
  ```shell
  $ uname -a
  FreeBSD hyaena 10.2-RELEASE FreeBSD 10.2-RELEASE #0 r286666: Wed Aug 12 19:31:38 UTC 2015     root@releng1.nyi.freebsd.org:/usr/obj/usr/src/sys/GENERIC  i386
  ```
* Haskell platform:
  - **[ghc]** (It is also available as port `lang/ghc` but installation fails. That's why it is installed from packages.)
  ```shell
  $ pkg install ghc
  $ ghc --version
  The Glorious Glasgow Haskell Compilation System, version 7.10.2
  ```
  - **[cabal]** 
  ```shell
  $ cd /usr/ports/devel/hs-cabal-install && make install clean
  $ cabal --version
  cabal-install version 1.22.6.0
  using version 1.22.4.0 of the Cabal library 
  $ cabal update # It is required to initialize packages list.
  Downloading the latest package list from hackage.haskell.org
  ```
* Third-party tools installed extra
  - **[curl]**
  ```shell
  $ cd /usr/ports/ftp/curl && make install clean
  $ curl --version
  curl 7.47.0 (i386-portbld-freebsd10.2) libcurl/7.47.0 OpenSSL/1.0.1p zlib/1.2.8
  Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
  Features: AsynchDNS Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP UnixSockets 
  ```
  - **[git]**
  ```shell
  $ cd /usr/ports/devel/git && make install clean
  $ git --version
  git version 2.7.0
  ```
* Editor (inspired by [PRACTICAL HASKELL - EDITOR SETUP WITH STACK](http://seanhess.github.io/2015/08/05/practical-haskell-editors.html))
  - **[vim]**
  ```shell
  $ cd /usr/ports/editors/vim && make install clean
  $ vim --version
  VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Feb 20 2016 17:13:39)
  Included patches: 1-1229
  Compiled by sebi@hyaena
  Big version without GUI.  Features included (+) or not (-):
  +acl             +farsi           +mouse_sgr       +tag_old_static
  +arabic          +file_in_path    +mouse_sysmouse  -tag_any_white
  +autocmd         +find_in_path    +mouse_urxvt     -tcl
  -balloon_eval    +float           +mouse_xterm     +terminfo
  -browse          +folding         +multi_byte      +termresponse
  ++builtin_terms  -footer          +multi_lang      +textobjects
  +byte_offset     +fork()          -mzscheme        +title
  +channel         -gettext         +netbeans_intg   -toolbar
  +cindent         -hangul_input    +path_extra      +user_commands
  -clientserver    +iconv           -perl            +vertsplit
  -clipboard       +insert_expand   +persistent_undo +virtualedit
  +cmdline_compl   +jumplist        +postscript      +visual
  +cmdline_hist    +keymap          +printer         +visualextra
  +cmdline_info    +langmap         -profile         +viminfo
  +comments        +libcall         -python          +vreplace
  +conceal         +linebreak       -python3         +wildignore
  +cryptv          +lispindent      +quickfix        +wildmenu
  +cscope          +listcmds        +reltime         +windows
  +cursorbind      +localmap        +rightleft       +writebackup
  +cursorshape     -lua             -ruby            -X11
  +dialog_con      +menu            +scrollbind      -xfontset
  +diff            +mksession       +signs           -xim
  +digraphs        +modify_fname    +smartindent     -xsmp
  -dnd             +mouse           -sniff           -xterm_clipboard
  -ebcdic          -mouseshape      +startuptime     -xterm_save
  +emacs_tags      +mouse_dec       +statusline      -xpm
  +eval            -mouse_gpm       -sun_workshop    
  +ex_extra        -mouse_jsbterm   +syntax          
  +extra_search    +mouse_netterm   +tag_binary      
     system vimrc file: "/usr/local/etc/vim/vimrc"
       user vimrc file: "$HOME/.vimrc"
   2nd user vimrc file: "~/.vim/vimrc"
        user exrc file: "$HOME/.exrc"
    fall-back for $VIM: "/usr/local/etc/vim"
   f-b for $VIMRUNTIME: "/usr/local/share/vim/vim74"
  Compilation: cc -c -I. -Iproto -DHAVE_CONFIG_H   -I/usr/local/include  -O2 -pipe  -fstack-protector -fno-strict-aliasing   -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1      
  Linking: cc   -Wl,-rpath=/usr/lib:/usr/local/lib -fstack-protector -L/usr/local/lib -Wl,--as-needed -o vim               -lm -lelf  -ltermlib                     
  ```
    - **[hdevtools]**

    ```shell
    $ cabal install hdevtools
    $ hdevtools --version # probably PATH must be updated. Maybe $HOME/.cabal/bin should be added.
    hdevtools: version 0.1.2.2 (ghc-7.10.2-i386-freebsd, cabal-1.22.4.0)
    ```
    - **[pathogen.vim]** (~/.vimrc must be updated, see [pathogen.vim])

    ```shell
    $ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
      curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    ```
    - **[syntastic]** (~/.vimrc must be updated, see [syntastic])

    ```shell
    $ cd ~/.vim/bundle && \
      git clone https://github.com/scrooloose/syntastic.git
    ```
    - **[vim-hdevtools]** (~/.vimrc must be updated, see [vim-hdevtools])

    ```shell
    $ cd ~/.vim/bundle && \
      git clone https://github.com/bitc/vim-hdevtools.git
    ```

## <a name=basic />First need commands
```shell
$ cabal install --only-dependencies # It installs all expected requirements.
$ cabal build                       # It builds project to folder `dist` as output folder
$ cabal run                         # Easy way to run the code. It builds project and runs the result
```

[cabal]: http://www.haskell.org/cabal/
[curl]: http://curl.haxx.se/
[FreeBSD]: http://www.freebsd.org/
[ghc]: http://www.haskell.org/ghc/
[git]: http://git-scm.com/
[hdevtools]: http://github.com/schell/hdevtools/
[pathogen.vim]: http://github.com/tpope/vim-pathogen/
[syntastic]: http://github.com/scrooloose/syntastic/
[vim]: http://www.vim.org/
[vim-hdevtools]: http://github.com/bitc/vim-hdevtools/
