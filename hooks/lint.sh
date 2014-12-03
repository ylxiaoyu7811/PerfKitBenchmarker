#!/bin/bash

# Copyright 2014 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Print 1 if the file in $1 passes linting, 0 otherwise
FILE=$1
EXT=${FILE##*.}

LINTER="$(dirname $0)/lint.${EXT}.sh"

if [ ! -e "$LINTER" ]; then
  echo "1"
  exit 0
fi

LINT=$($LINTER $FILE)
if [[ ! -z "$LINT" ]]; then
  >&2 echo "$LINT"
  echo "0"
  exit 0
fi

echo "1"
exit 0
