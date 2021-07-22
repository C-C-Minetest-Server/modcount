local mod_count = "Uncounted"
local old_status = minetest.get_server_status
function minetest.get_server_status(name, joined)
  local status = old_status(name, joined)
  status = status .. "\n# Mod: " .. mod_count .. " installed"
  return status
end
minetest.register_on_mods_loaded(function()
  local mci = 0
  for x in pairs(minetest.get_modnames()) do
    mci = mci + 1
  end
  mod_count = tostring(mci)
end)
