if executable('prettier')
  autocmd BufWritePre *.md,*.ts,*.tsx,*.js,*.json,*.yml,*.yaml Prettier
endif
