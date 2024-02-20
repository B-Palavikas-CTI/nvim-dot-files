return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    config = {
        ui ={
            icons= {
                package_installed = "",
                package_not_installed = "",
                package_outdated = "",
                package_pending = "",
            }
        }
    }
}
