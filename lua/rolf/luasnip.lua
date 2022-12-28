local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "vpugscss",
            namr = "vue base",
            dscr = "Vue with pug compesition and scoped scss",
        }, {
            text({"<template lang='pug'>", ""}),
            insert(1),
            text({"", "</template>"}),
            text({"", ""}),
            text({"", ""}),
            text({"<script>", ""}),
            text({"export default {", ""}),
            text({" setup () {", ""}),
            text({"   return {}", ""}),
            text({" }", ""}),
            text({"}", ""}),
            text({"</script>", ""}),
            text({"", ""}),
            text({"", ""}),
            text({"<style lang='scss' scoped>", ""}),
            text({"</style>"}),
        }),
    },
})
