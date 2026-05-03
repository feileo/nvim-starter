return {
  default_engine = "google",
  engines = {
    google = {
      default_source = "auto",
      default_target = "zh-CN",
      fallback = {
        default_source = "auto",
        default_target = "zh-CN",
      },
    },
  },
}
