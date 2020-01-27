#!/usr/bin/env perl
$latex                       = "platex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S";
$latex_silent                = "platex -synctex=1 -interaction=batchmode -halt-on-error %O %S";
$bibtex                      = "pbibtex -kanji=utf8 %O %B";
$dvipdf                      = "dvipdfmx %O -o %D %S";
$makeindex                   = "mendex -U %O -o %D %S";
$max_repeat                  = 5;
$pdf_mode                    = 3;
$out_dir                     = "out";
$pvc_view_file_via_temporary = 0;