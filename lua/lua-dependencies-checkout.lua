--
-- 使用：
-- lua lua-dependencies-checkout.lua <your-pkg-install-path>
--
-- 如: lua lua-dependencies-checkout.lua./thirdlibs/
--
-- 将会输出依赖包安装命令🥱
-- luarocks install lua-cjson 2.1.0.10-1 --tree ./thirdlibs
-- luarocks install luasocket 3.1.0-1 --tree ./thirdlibs
-- luarocks install redis-lua 2.0.4-1 --tree ./thirdlibs
--

local tree_path = arg[1]
local packages = {}
local last_pkg = nil

local cmd
if tree_path then
	cmd = "luarocks list --tree " .. tree_path
else
	cmd = "luarocks list"
end

for line in io.popen(cmd):lines() do
	local name = line:match("^([%w%-_]+)$")
	if name then
		last_pkg = name
	else
		local version = line:match("^%s+(%d[%d%.%-]+)%s+%(")
		if version and last_pkg then
			table.insert(packages, { name = last_pkg, version = version })
		end
	end
end

for _, pkg in ipairs(packages) do
	if tree_path then
		print("luarocks install " .. pkg.name .. " " .. pkg.version .. " --tree " .. tree_path)
	else
		print("luarocks install " .. pkg.name .. " " .. pkg.version)
	end
end
