require('nvim_comment').setup({
    comment_empty = false
})

---Command Reference ------------------------------------------------------------
-- gcc comment/uncomment current line, this does not take a count, if you want a count use the gc{count}{motion}
-- gc{motion} comment/uncomment selection defined by a motion (as lines are commented, any comment toggling actions will default to a linewise):
-- gcip comment/uncomment a paragraph
-- gc4w comment/uncomment current line
-- gc4j comment/uncomment 4 lines below the current line
-- dic delete comment block
-- gcic uncomment commented block
