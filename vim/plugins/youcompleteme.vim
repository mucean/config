let g:ycm_language_server = 
  \ [ 
  \   {
  \     'name': 'php',
  \     'cmdline': [ 'php', expand( $COMPOSER_HOME . '/vendor/bin/php-language-server.php' ) ],
  \     'filetypes': [ 'php' ],
  \   }
  \ ]
