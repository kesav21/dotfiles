vim.wo.wrap = false
vim.bo.makeprg =
	"pdflatex -shell-escape % && rm -f %:r.aux %:r.log %:r.bcf %:r.out %:r.run.xml pdfa.xmpi"
