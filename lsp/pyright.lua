return {
    cmd = { "pyright-langserver", "--stdio" }, -- Command to start the language server
    filetypes = { "python" },               -- File types that this server will handle
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },        -- Markers to identify the root of the project
    settings = { -- Settings for the language server
        pyright = {
            -- Auto-import settings
            autoImportCompletions = true,
            autoSearchPaths = true,

            -- Analysis settings
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace", -- or "openFilesOnly"
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic", -- "off", "basic", "strict"

                -- Analysis settings that can be toggled
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = "warning",
                    reportUnusedImport = "warning",
                    reportUnusedClass = "warning",
                    reportUnusedFunction = "warning",
                    reportUnusedCoroutine = "warning",
                    reportDuplicateImport = "warning",
                    reportOptionalMemberAccess = "none",
                    reportOptionalSubscript = "none",
                    reportOptionalIterable = "none",
                    reportOptionalContextManager = "none",
                    reportOptionalOperand = "none",
                },

                -- Analysis features
                reportMissingImports = false,
                reportMissingTypeStubs = false, -- Set to true if you use type stubs
                reportUnusedCallResult = "none",
                reportPrivateImportUsage = "warning",

                -- Python version compatibility
                pythonVersion = "3.13", -- Adjust based on your project
            },

            -- Completion settings
            completion = {
                completeFunctionParens = true, -- Don't auto-add parentheses
            },

            -- Indexing settings (for larger projects)
            indexing = true,

            -- Organize imports
            organizeImports = true,
        },
    },

    -- Single file support
    single_file_support = true,

    -- Capabilities (if you want to customize further)
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                },
            },
        },
    },
}
