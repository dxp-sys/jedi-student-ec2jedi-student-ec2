# ---------------------------------------
# プロジェクト全体設定パラメータ
# ---------------------------------------
variable "project_name" {
  description = "プロジェクト名。すべてのリソースのタグにセットされる。"
  type        = string
  default     = "jedi"
}

variable "env_name" {
  description = "環境名（本番、テスト、開発 等）。すべてのリソースのタグやにセットされる。"
  type        = string
  default     = "advanced"
}

variable "region" {
  description = "リージョン名"
  type        = string
  default     = "ap-northeast-1"
}

# ネットワーク
variable "subnets" {
  description = "List of subnet IDs to use"
  type        = list(string)
  default     = ["subnet-06d304f09f21ae5eb"]
}

variable "vpc_security_group_ids" {
  description = "List of subnet IDs to use"
  type        = list(string)
  default     = ["sg-05a73729c56f390e9"]
}

variable "ec2_win" {
  default = {
    name_prefix = "JEDI-Advanced-CONT"
    ami         = "ami-076ff374bb05d7124"
    instance = {
      type = "t3a.medium"
    }
    root_block_device = [
      {
        volume_type = "gp3"
        volume_size = 50
        tags = {
          Name = "root-block"
        }
      },
    ]
    disable_api_termination = false
  }
}

# EC2一覧
variable "ec2_win_list" {
  type = map(object({}))
  default = {
    # 藤井
    "J73687" = {}
    # 福島
    "J35286" = {}
  }
}

