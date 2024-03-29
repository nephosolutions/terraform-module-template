# Copyright 2021-2023 NephoSolutions srl, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

output "null_resource_id" {
  description = "The ID of the demo resource."
  value       = module.demo.null_resource_id
}

output "null_resource_triggers" {
  description = "The triggers of the demo resource."
  value       = module.demo.null_resource_triggers
}
