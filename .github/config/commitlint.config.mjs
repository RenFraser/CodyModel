export default {
    extends: ['@commitlint/config-conventional'],
    ignores: [
        (commit) => commit.includes('Signed-off-by: dependabot[bot] <support@github.com>')
    ]
}