#output  "abc" {
#  value =  "Hello"
#}

#
#variable  "Stringdatatype"  {
#  default = "string"
#}
#
#variable "numberdatatype" {
#  default =  123
#}
#
#variable "boolean" {
#  default =  true
#}
#
#variable "array" {
#  default =  ["abc" ,123, true]
#}

variable "abc" {
  default =  {
    string ="abc" ,
    number =123,
    boolean =true,
  }
}

variable "array1" {
  default =  {
    string ="abc" ,
    number =123,
    boolean =true
  }
}

variable "array" {
  default =  [     "string" ,
    123,
    true
  ]
}
output  "array" {
  value = "value1 =  ${var.array[0]},  value2 = ${var.array[2]}"
}
