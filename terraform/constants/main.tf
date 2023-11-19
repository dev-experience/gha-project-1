locals {
  regions = {
    "eastus" = {
      "display_name" = "East US"
      "slug"         = "eu"
    },
    "eastus2" = {
      "display_name" = "East US 2"
      "slug"         = "eu2"
    },
    "southcentralus" = {
      "display_name" = "South Central US"
      "slug"         = "scus"
    },
    "westus2" = {
      "display_name" = "West US 2"
      "slug"         = "wu2"
    },
    "westus3" = {
      "display_name" = "West US 3"
      "slug"         = "wu3"
    },
    "australiaeast" = {
      "display_name" = "Australia East"
      "slug"         = "aue"
    },
    "southeastasia" = {
      "display_name" = "Southeast Asia"
      "slug"         = "sea"
    },
    "northeurope" = {
      "display_name" = "North Europe"
      "slug"         = "ne"
    },
    "swedencentral" = {
      "display_name" = "Sweden Central"
      "slug"         = "sec"
    },
    "uksouth" = {
      "display_name" = "UK South"
      "slug"         = "uks"
    },
    "westeurope" = {
      "display_name" = "West Europe"
      "slug"         = "we"
    },
    "centralus" = {
      "display_name" = "Central US"
      "slug"         = "cu"
    },
    "southafricanorth" = {
      "display_name" = "South Africa North"
      "slug"         = "zan"
    },
    "centralindia" = {
      "display_name" = "Central India"
      "slug"         = "cin"
    },
    "eastasia" = {
      "display_name" = "East Asia"
      "slug"         = "ea"
    },
    "japaneast" = {
      "display_name" = "Japan East"
      "slug"         = "jpe"
    },
    "koreacentral" = {
      "display_name" = "Korea Central"
      "slug"         = "krc"
    },
    "canadacentral" = {
      "display_name" = "Canada Central"
      "slug"         = "cac"
    },
    "francecentral" = {
      "display_name" = "France Central"
      "slug"         = "frc"
    },
    "germanywestcentral" = {
      "display_name" = "Germany West Central"
      "slug"         = "dewc"
    },
    "italynorth" = {
      "display_name" = "Italy North"
      "slug"         = "itn"
    },
    "norwayeast" = {
      "display_name" = "Norway East"
      "slug"         = "noe"
    },
    "polandcentral" = {
      "display_name" = "Poland Central"
      "slug"         = "plc"
    },
    "switzerlandnorth" = {
      "display_name" = "Switzerland North"
      "slug"         = "chn"
    },
    "uaenorth" = {
      "display_name" = "UAE North"
      "slug"         = "aen"
    },
    "brazilsouth" = {
      "display_name" = "Brazil South"
      "slug"         = "brs"
    },
    "israelcentral" = {
      "display_name" = "Israel Central"
      "slug"         = "ilc"
    },
    "qatarcentral" = {
      "display_name" = "Qatar Central"
      "slug"         = "qac"
    },
    "brazilus" = {
      "display_name" = "Brazil US"
      "slug"         = "bru"
    },
    "northcentralus" = {
      "display_name" = "North Central US"
      "slug"         = "ncu"
    },
    "westus" = {
      "display_name" = "West US"
      "slug"         = "wu"
    },
    "jioindiawest" = {
      "display_name" = "Jio India West"
      "slug"         = "jinw"
    },
    "westcentralus" = {
      "display_name" = "West Central US"
      "slug"         = "wcu"
    },
    "southafricawest" = {
      "display_name" = "South Africa West"
      "slug"         = "zaw"
    },
    "australiacentral" = {
      "display_name" = "Australia Central"
      "slug"         = "ac"
    },
    "australiacentral2" = {
      "display_name" = "Australia Central 2"
      "slug"         = "auc2"
    },
    "australiasoutheast" = {
      "display_name" = "Australia Southeast"
      "slug"         = "ause"
    },
    "japanwest" = {
      "display_name" = "Japan West"
      "slug"         = "jpw"
    },
    "jioindiacentral" = {
      "display_name" = "Jio India Central"
      "slug"         = "jinc"
    },
    "koreasouth" = {
      "display_name" = "Korea South"
      "slug"         = "krs"
    },
    "southindia" = {
      "display_name" = "South India"
      "slug"         = "sin"
    },
    "westindia" = {
      "display_name" = "West India"
      "slug"         = "win"
    },
    "canadaeast" = {
      "display_name" = "Canada East"
      "slug"         = "cae"
    },
    "francesouth" = {
      "display_name" = "France South"
      "slug"         = "frs"
    },
    "germanynorth" = {
      "display_name" = "Germany North"
      "slug"         = "den"
    },
    "norwaywest" = {
      "display_name" = "Norway West"
      "slug"         = "new"
    },
    "switzerlandwest" = {
      "display_name" = "Switzerland West"
      "slug"         = "chw"
    },
    "ukwest" = {
      "display_name" = "UK West"
      "slug"         = "ukw"
    },
    "uaecentral" = {
      "display_name" = "UAE Central"
      "slug"         = "aec"
    },
    "brazilsoutheast" = {
      "display_name" = "Brazil Southeast"
      "slug"         = "brse"
    }
  }

  regions_regex = "^(${join("|", keys(local.regions))})$"
  
  environments = {
    Development = "d"
    Test        = "t"
    Acceptance  = "a"
    Production  = "p"
  }

  allowed_environments = keys(local.environments)
}

output "environments" {
  value = local.environments
}

output "allowed_environments" {
  value = local.allowed_environments
}

output "regions" {
  value = local.regions
}

output "regions_regex" {
  value = local.regions_regex
}

output "uuid_regex" {
  value = "^[0-9A-Fa-f]{8}(-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$"
}
