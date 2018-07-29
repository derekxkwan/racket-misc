# racket-misc
miscellaneous racket stuff that doesn't have a home yet


## dxk-hash-util.rkt
- **hash-nref** - drill down a hash table by list of keys
- **hash-nset** - nested hash table setting

## dxk-list-util.rkt
- **chunkify** - splits a list into equal-sized sublists (with the leftovers)
- **list-count** - count elements in a list, returns as a hash table
- **list-intertwine** - intertwine two lists
- **list-pad** - pads input list with opt keyed argt #:padval if below opt argt n

## dxk-time-util.rkt
- todo: change minsec to hms (detect number of colons)
- **minsec-to-sec** - translate min:sec string ("5:30") to seconds
- **sec-to-minsec** - translate seconds to a min:sec string
- **minsec-subtract** - subtract min:sec strings
