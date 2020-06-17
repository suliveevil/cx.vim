let s:repoPath=expand('<sfile>:p:h:h')

function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/cx.txt'
    let dbCountFile = '/misc/count_cx.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : 'CNX',
                \ })


    call ZFVimIM_cloudRegister({
                \   'mode' : 'local',
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'dbId' : db['dbId'],
                \ }, 'async')
endfunction

augroup ZFVimIM_pinyin_huge_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

