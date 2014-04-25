git filter-branch --index-filter \
        'git rm --cached --ignore-unmatch i3/i3log' \
            --tag-name-filter cat -- --all
