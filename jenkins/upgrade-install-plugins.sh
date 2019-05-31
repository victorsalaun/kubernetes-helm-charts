#!/usr/bin/env bash

updateCenter=$(curl https://updates.jenkins.io/current/update-center.json)
updateCenter=${updateCenter:18:(${#updateCenter}-21)} # remove non-json parts

plugin_line=$(yq read "values.yaml" master.installPlugins | tr -d '\n')

IFS=" " read -ra plugins <<< ${plugin_line}
for plugin in "${plugins[@]}"; do

    if [[ ${plugin} == *":"* ]]; then
        IFS=':' read -ra plugin_line_splitted  <<< "$plugin"
        version=$(echo ${updateCenter} | jq ".plugins.\"${plugin_line_splitted[0]}\".version" | tr -d '\"')
        echo "    - ${plugin_line_splitted[0]}:${version}"
    fi

done

exit 0
