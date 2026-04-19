variable "s3bucket" {
  default = "asdfghjkjhgfdsasdfghjkjhgfds" #has to be unique so random gibberish has been used
}

variable "policy" {
  default = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::my-bucket-name/*\"}]}"


}