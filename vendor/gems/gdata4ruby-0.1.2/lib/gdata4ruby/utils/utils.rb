# Author:: Mike Reich (mike@seabourneconsulting.com)
# Copyright:: Copyright (C) 2010 Mike Reich
# License:: GPL v2
#--
# Licensed under the General Public License (GPL), Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#
# Feel free to use and update, but be sure to contribute your
# code back to the project and attribute as required by the license.
#++
module GData4Ruby
  #A helper class that includes commonly used utility methods.
  class Utils
    #Adds common Google namespaces to an element.  Useful for processing individual events returned from in a feed.
    def self.add_namespaces(entry)
      entry.attributes["xmlns:openSearch"] = "http://a9.com/-/spec/opensearch/1.1/"
      entry.attributes["xmlns:gAcl"] = "http://schemas.google.com/acl/2007"
      entry.attributes["xmlns:gCal"] = "http://schemas.google.com/gCal/2005"
      entry.attributes["xmlns:gd"] = "http://schemas.google.com/g/2005"
      entry.attributes["xmlns:app"] = "http://www.w3.org/2007/app"
      entry.attributes["xmlns:docs"] = "http://schemas.google.com/docs/2007"
      entry.attributes["xmlns"] = "http://www.w3.org/2005/Atom"
      entry
    end
  end
end