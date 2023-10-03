#ok: general-invalid-module-identifier
module "test" {
  source  = "hashicorp/module/random"
}

#ok: general-invalid-module-identifier
module "test_1" {
  source  = "hashicorp/module/random"
}

#ruleid: general-invalid-module-identifier
module "test!" {
 source = "hashicorp/module/random"
}

#ruleid: general-invalid-module-identifier
module "../test" {
 source = "hashicorp/module/random"
}

#ruleid: general-invalid-module-identifier
module "./test" {
 source = "hashicorp/module/random"
}

#ruleid: general-invalid-module-identifier
module "te$t" {
 source = "hashicorp/module/random"
}

#ok: general-invalid-module-identifier
module "test-1" {
  source  = "hashicorp/module/random"
}
