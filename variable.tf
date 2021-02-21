variable "AWS_REGION" {
  description = "AWS Region"
  default = ""
  type        = string
}

variable "ECR_NAME" {
  description = "Elastic Container Registry name"
  default = ""
  type = string
}

variable "tag" {
  description = "Tag to use for deployed Docker image"
  type        = string
  default     = "latest"
}


variable "scan_on_push" {
  default     = true
  type        = bool
  description = "Whether images should automatically be scanned on push or not"
}
