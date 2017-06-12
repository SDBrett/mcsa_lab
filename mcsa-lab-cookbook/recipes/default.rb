#
# Cookbook:: mcsa_lab
# Recipe:: default
#
# Copyright:: 2017, Brett Johnson
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

# If the OS is server 2012 R2 or 2012 download and install WMF5, otherwise DSC will not work
# This is not needed in 2016 as WMF5 is the default
