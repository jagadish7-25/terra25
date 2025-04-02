module "vpc" {
    source = "../expense-projext"
    project_name = var.project_name
    Environmet = var.Environmet
    common_tags = var.common_tags
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.public_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs

}