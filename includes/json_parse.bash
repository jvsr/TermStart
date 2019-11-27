#!/bin/bash

json_property_dquote () {
    local json=$1
    local property=$2
    local save=${json#*\"$property\":\"}
    local value=${save%%\"*}
    echo $value
}

json_property () {
    local json=$1
    local property=$2
    local save=${json#*\"$property\":}
    local value=${save%%,*}
    echo $value
}

json_property_square_brackets () {
    local json=$1
    local property=$2
    local save=${json#*\"$property\":\[}
    local value=${save%%\]*}
    echo $value
}

json_property_brackets () {
    local json=$1
    local property=$2
    local save=${json#*\"$property\":\{}
    local value=${save%%\}*}
    echo $value
}
