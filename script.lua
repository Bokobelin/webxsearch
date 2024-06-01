local searchButton = get("searchButton")
local searchInput = get("searchInput")
local resultsContainer = get("resultsContainer")

local data = {
    "Lua is great for scripting.",
    "HTML stands for HyperText Markup Language.",
    "CSS is used for styling.",
    "JavaScript can be used for dynamic web content.",
    "Lua can be embedded in applications.",
    "Search engines are useful.",
    "Learning to code is beneficial."
}

local function search(query)
    local results = {}
    for _, item in ipairs(data) do
        if string.find(string.lower(item), string.lower(query)) then
            table.insert(results, item)
        end
    end
    return results
end

local function displayResults(results)
    resultsContainer.set_content("")
    for _, result in ipairs(results) do
        local resultDiv = document.create_element("div")
        resultDiv.add_class("result-item")
        resultDiv.set_content(result)
        resultsContainer.append_child(resultDiv)
    end
end

searchButton.on_click(function()
    local query = searchInput.get_value()
    local results = search(query)
    displayResults(results)
end)
