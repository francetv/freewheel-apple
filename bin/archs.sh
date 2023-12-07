#!/bin/bash -e

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

PATH_TO_BINARY_IOS="iOS/AdManager.xcframework/ios-arm64/libAdManager.a"
PATH_TO_BINARY_IOS_SIMU="iOS/AdManager.xcframework/ios-arm64_x86_64-simulator/libAdManager.a"
PATH_TO_BINARY_TVOS="tvOS/AdManager.xcframework/tvos-arm64/libAdManager.a"
PATH_TO_BINARY_TVOS_SIMU="tvOS/AdManager.xcframework/tvos-arm64_x86_64-simulator/libAdManager.a"

X86="x86_64"
ARM64="arm64"

IOS_VALIDATION_RESULT=0
TVOS_VALIDATION_RESULT=0

help() {
  echo -e "Use ${GREEN}--scan${NC} or ${GREEN}-s${NC} to display available architectures."
  echo -e "Use ${GREEN}--bitcode${NC} or ${GREEN}-b${NC} to know whether bitcode is enabled."
  echo -e "Use ${GREEN}--validate${NC} or ${GREEN}-v${NC} to check required architectures are available."
}

quit_on_error() {
  if [[ $IOS_VALIDATION_RESULT != 0 || $TVOS_VALIDATION_RESULT != 0 ]]
  then
    exit 1
  fi
}

available_archs_for_os() {
  echo -e "${GREEN}Checking bitcode for iOS.${NC}"
  lipo -i $PATH_TO_BINARY_IOS
  echo -e "${GREEN}Checking bitcode for iOS simulator.${NC}"
  lipo -i $PATH_TO_BINARY_IOS_SIMU
  echo -e "${GREEN}Checking bitcode for tvOS.${NC}"
  lipo -i $PATH_TO_BINARY_TVOS
  echo -e "${GREEN}Checking bitcode for tvOS simulator.${NC}"
  lipo -i $PATH_TO_BINARY_IOS_SIMU
}

contains_element_in_array() {
  result=1
  for elt in ${@:2} # loop on parameters starting $2
  do
    if [[ $elt == $1 ]]
    then
      result=0
    fi
  done

  echo $result
}

validate_archs_for_os() {
  result=0
  missing_archs=""
  available_archs=$(available_archs_for_os | cut -d : -f3 | awk "{$1=$1}1") # split message using ':' as delimiter, then trim spaces
  required_archs="$X86 $ARM64"

  for arch in $required_archs
  do
    contained=$(contains_element_in_array $arch $available_archs)
    if [[ $contained != 0 ]]
    then
      result=1
      missing_archs="$arch $missing_archs"
    fi
  done

  if [[ $result != 0 ]]
  then
    echo -e "${RED}Missing architectures in $1 framework: $missing_archs${NC}"

    if [[ $1 == iOS ]]
    then
      IOS_VALIDATION_RESULT=1
    elif [[ $1 == tvOS ]]
    then
      TVOS_VALIDATION_RESULT=1
    fi
  fi
}

contains_bitcode_for_os() {
  result=1
  output=$(otool -l $1 | grep __LLVM | head -n1) # display load commands, look for what's interesting, take the first occurrence

  if [[ $output == *"segname __LLVM"* ]] # pattern matching
  then
    result=0
  fi

  echo $result
}

validate_bitcode_for_os() {
  output=$(contains_bitcode_for_os $1)

  if [[ $output != 0 ]]
  then
    echo -e "${RED}Bitcode is NOT enabled in $1 framework${NC}"

    if [[ $1 == iOS ]]
    then
      IOS_VALIDATION_RESULT=1
    elif [[ $1 == tvOS ]]
    then
      TVOS_VALIDATION_RESULT=1
    fi
  fi
}

if [[ $1 == "-s" || $1 == "--scan" ]]
then
  available_archs_for_os
elif [[ $1 == "-b" || $1 == "--bitcode" ]]
then
  ios_res=$(contains_bitcode_for_os $PATH_TO_BINARY_IOS)

  if [[ $ios_res == 0 ]]
  then
    echo "Bitcode enabled for iOS."
  else
    echo "Bitcode NOT enabled for iOS."
  fi

  tvos_res=$(contains_bitcode_for_os $PATH_TO_BINARY_TVOS)

  if [[ $tvos_res == 0 ]]
  then
    echo "Bitcode enabled for tvOS."
  else
    echo "Bitcode NOT enabled for tvOS."
  fi
elif [[ $1 == "-v" || $1 == "--validate" ]]
then
  echo -e "${GREEN}Validating required architectures are available in Freewheel frameworks.${NC}"

  validate_archs_for_os iOS
  validate_archs_for_os tvOS

  quit_on_error

  echo -e "${GREEN}All required architectures are available in Freewheel frameworks.${NC}"

  echo -e "${GREEN}Checking bitcode for tvOS.${NC}"

  validate_bitcode_for_os $PATH_TO_BINARY_TVOS

  quit_on_error

  echo -e "${GREEN}Bitcode requirements are met.${NC}"
else
  help
fi
