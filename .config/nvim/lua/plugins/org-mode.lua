return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })

	require('orgmode').setup({
	  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
	  org_default_notes_file = '~/Dropbox/org/refile.org',
	})

  end,
}

