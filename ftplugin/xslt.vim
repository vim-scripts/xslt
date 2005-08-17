" Vim script file                                           vim600:fdm=marker:
" FileType:	XSLT
" Maintainer:	Pedro Alves pedro.alvesATzmail.pt
" Last Change:  $Date: 2005/08/16 09:29:20 $
" Version:      $Revision: 1.1 $

" This is a wrapper script to add extra xslt support to xml documents. Uses
" the excelent xml.vim

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
" Don't set 'b:did_ftplugin = 1' because that is xml.vim's responsability.
"
"
" 

" On to loading xml.vim
runtime ftplugin/xml.vim

inoremap <F2> <Esc>:call Load_Subs()<CR>a
inoremap " ""<ESC>i

function Load_Subs()

	let wrd = expand("<cword>")

	if wrd == "xsl"
		exe "norm bdWa<?xml version=\"1.0\<right> ?>\<cr><xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\<right> version=\"1.0\<right>>>"
			
	elseif wrd == "tm"
		exe "norm bdW\"zdBa<xsl:template match=\"\<c-r>z\<right> >>"
			
	elseif wrd == "tn"
		exe "norm bdW\"zdBa<xsl:template name=\"\<c-r>z\<right> >>"
			
	elseif wrd == "fe"
		exe "norm bdW\"zdBa<xsl:for-each select=\"\<c-r>z\<right> >>"
			
	elseif wrd == "vo"
		exe "norm bdW\"zdBa<xsl:value-of select=\"\<c-r>z\<right> />"
			
	elseif wrd == "so"
		exe "norm bdW\"zdBa<xsl:sort select=\"\<c-r>z\<right> />"
			
	elseif wrd == "if"
		exe "norm bdW\"zdBa<xsl:if test=\"\<c-r>z\<right> >>"
			
	elseif wrd == "ch"
		exe "norm bdW\"zdBa<xsl:choose>><xsl:when test=\"\<c-r>z\<right> >>\<ESC>\<down>o<xsl:otherwise>>\<up>\<up>\<up>"
	
	elseif wrd == "at"
		exe "norm bdW\"zdBi<xsl:apply-templates select=\"\<c-r>z\<right> />"
			
	elseif wrd == "ct"
		exe "norm bdW\"zdBa<xsl:call-template name=\"\<c-r>z\<right> />"
			
	elseif wrd == "pa"
		exe "norm bdW\"zdBx\"xdBa<xsl:param name=\"\<c-r>x\<right> select=\"\<c-r>z\<right> />"
			
	elseif wrd == "wp"
		exe "norm bdW\"zdBx\"xdBa<xsl:with-param name=\"\<c-r>x\<right> select=\"\<c-r>z\<right> />"
			
	elseif wrd == "out"
		exe "norm bdWa<xsl:output method=\"xml\<right> encoding=\"iso-8859-1\<right> />\<cr>"
			
	endif
endfunction
