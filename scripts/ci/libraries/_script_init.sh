#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -euo pipefail

_CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")

SCRIPTS_CI_DIR="$(cd "${_CURRENT_DIR}"/.. && pwd)"
export SCRIPTS_CI_DIR

# Sets to where airflow sources are located
AIRFLOW_SOURCES=${AIRFLOW_SOURCES:=$(cd "${SCRIPTS_CI_DIR}/../../" && pwd)}
export AIRFLOW_SOURCES


# shellcheck source=scripts/ci/libraries/_all_libs.sh
. "${SCRIPTS_CI_DIR}"/libraries/_all_libs.sh

initialize_common_environment

basic_sanity_checks

script_start

trap script_end EXIT
