variable "save_to" {
    default = ""
}

data "archive_file" "generate_zip" {
  type        = "zip"
  output_path = (var.save_to != "" ? "${var.save_to}/RelationalJunctionOCIStack.zip" : "${path.module}/dist/RelationalJunctionOCIStack.zip")
  source_dir = "../"
  excludes    = ["terraform.tfstate", 
                "terraform.tfvars.template", 
                "terraform.tfvars", 
                "provider.tf", 
                ".terraform", 
                "build-orm", 
                "images", 
                "README.md", 
                "terraform.", 
                "terraform.tfstate.backup", 
                "test", 
                "simple", 
                ".git", 
                "README", 
                ".github", 
                ".gitignore", 
                ".DS_Store", 
                "LICENSE", 
                "diagram",
                "envVar.sh",
                "schema.yamlexample",
                "terraform.tfvarsexample",
                ".terraform.lock.hcl",
                "env-vars.ps1",
                "terraform.tfvars.example"
                ]
}
