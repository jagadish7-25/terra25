module "vpc" {
    source = "../expense-projext"
    project_name = var.project_name
    Environmet = var.Environmet
    common_tags = var.common_tags  
}