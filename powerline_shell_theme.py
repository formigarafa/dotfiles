from powerline_shell.themes.default import DefaultColor
from powerline_shell.utils import RepoStats

class Color(DefaultColor):
    PATH_BG = 4
    CWD_FG = 15

    REPO_CLEAN_BG = 2
    REPO_CLEAN_FG = 0
    REPO_DIRTY_BG = 221
    REPO_DIRTY_FG = 0

    GIT_STASH_BG = 221
    GIT_STASH_FG = 0

    JOBS_FG = 39
    JOBS_BG = 238

    CMD_PASSED_BG = 236
    CMD_PASSED_FG = 15
    CMD_FAILED_BG = 161
    CMD_FAILED_FG = 15

    GIT_AHEAD_BG = 240
    GIT_AHEAD_FG = 250
    GIT_BEHIND_BG = 240
    GIT_BEHIND_FG = 250
    GIT_STAGED_BG = 22
    GIT_STAGED_FG = 15
    GIT_NOTSTAGED_BG = 130
    GIT_NOTSTAGED_FG = 15
    GIT_UNTRACKED_BG = 52
    GIT_UNTRACKED_FG = 15
    GIT_CONFLICTED_BG = 9
    GIT_CONFLICTED_FG = 15

RepoStats.symbols["stash"] = u'\uF01C'
RepoStats.symbols["git"] = u'\uF1D3' # git
# RepoStats.symbols["git"] = u'\uF113' # github

