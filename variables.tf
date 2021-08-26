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
    name_prefix = "JEDI-2021-5"
    # ami         = "ami-076ff374bb05d7124"
    ami = "ami-036ab2d7c91582af4"
    instance = {
      # type = "t3a.medium"
      type = "t2.medium"
    }
    root_block_device = [
      {
        volume_type = "gp3"
        volume_size = 100
        tags = {
          Name = "root-block"
        }
      },
    ]
    disable_api_termination = true
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
    # 矢嶋
    "J76554" = {}
    # 山﨑
    "J35414" = {}
    # 小河原
    "J74233" = {}
    # 神
    "J70971" = {}
    # 伊藤航
    "J35316" = {}
    # 塚本朱音
    "J35782" = {}
    # 江利角 昌巳
    "J32935" = {}
    # 堀江 政宏
    "J32895" = {}
    # 渡邉 良太
    "J34569" = {}
    # 森田 康介
    "J34572" = {}
    # 秋本 昂岐
    "J35738" = {}
    # 遠藤 祥史
    "J31974" = {}
    # 徳田 一樹
    "J32569" = {}
    # 小宮 泰斗
    "J35315" = {}
    # 島倉 舜
    "J36016" = {}
  }
}

