vim.lsp.config('kotlin_language_server', {
    cmd = { "kotlin-language-server" },
    filetypes = { "kotlin" },
    root_markers = { "build.gradle", "build.gradle.kts", "settings.gradle", "settings.gradle.kts", "pom.xml" },
})
vim.lsp.enable('kotlin_language_server')
