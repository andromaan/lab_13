#!/bin/bash
CURRENT_VERSION=$(grep "version:" pubspec.yaml | awk '{print $2}')
VERSION_NAME=$(echo $CURRENT_VERSION | cut -d'+' -f1)
BUILD_NUMBER=$(echo $CURRENT_VERSION | cut -d'+' -f2)
NEW_BUILD_NUMBER=$((BUILD_NUMBER + 1))
NEW_VERSION="${VERSION_NAME}+${NEW_BUILD_NUMBER}"
sed -i "s/version: ${CURRENT_VERSION}/version: ${NEW_VERSION}/" pubspec.yaml
echo "Version updated: ${CURRENT_VERSION} -> ${NEW_VERSION}"
