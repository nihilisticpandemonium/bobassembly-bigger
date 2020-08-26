local item = data.raw.item

bobmods.lib.tech.add_recipe_unlock("automation-6", "assembling-machine-6-bigger")

local miles = mods["MilesBobsExpansion"] ~= nil

local iter
if miles then
	iter = function(func)
		for tier = 7, 10 do
			func(tier)
		end
	end

	iter(function(tier) bobmods.lib.tech.add_recipe_unlock("automation-"..tier, "assembling-machine-"..tier.."-bigger") end)
end

if item["nitinol-alloy"] then
  bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "steel-plate", "nitinol-alloy")
  bobmods.lib.tech.add_prerequisite("automation-6", "nitinol-processing")
  if miles then
	iter(function(tier)
		bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "steel-plate", "nitinol-alloy")
		bobmods.lib.tech.add_prerequisite("automation-"..tier, "nitinol-processing")
	end)
end
else
  if item["titanium-plate"] then
    bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "steel-plate", "titanium-plate")
    bobmods.lib.tech.add_prerequisite("automation-6", "titanium-processing")
	if miles then
		iter(function(tier)
			bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "steel-plate", "titanium-plate")
			bobmods.lib.tech.add_prerequisite("automation-"..tier, "titanium-processing")
		end)
	end
  end
end

if item["tungsten-carbide"] then
  bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "iron-plate", "tungsten-carbide")
  bobmods.lib.tech.add_prerequisite("automation-6", "tungsten-alloy-processing")
  if miles then
	iter(function(tier)
		bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "iron-plate", "tungsten-carbide")
		bobmods.lib.tech.add_prerequisite("automation-"..tier, "tungsten-alloy-processing")
	end)
  end
else
  if item["tungsten-plate"] then
    bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "iron-plate", "tungsten-plate")
    bobmods.lib.tech.add_prerequisite("automation-6", "tungsten-processing")
	if miles then
		iter(function(tier)
			bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "iron-plate", "tungsten-plate")
			bobmods.lib.tech.add_prerequisite("automation-"..tier, "tungsten-processing")
		end)
	end
  end
end

if item["nitinol-bearing"] then
  bobmods.lib.recipe.add_ingredient("assembling-machine-6-bigger", {"nitinol-bearing", 5})
  if miles then
	iter(function(tier)
		bobmods.lib.recipe.add_ingredient("assembling-machine-"..tier.."-bigger", {"nitinol-bearing", 5 + (5 * (tier - 6))})
	end)
  end
else
  if item["titanium-bearing"] then
    bobmods.lib.recipe.add_ingredient("assembling-machine-6-bigger", {"titanium-bearing", 5})
  else
    bobmods.lib.recipe.add_ingredient("assembling-machine-6-bigger", {"iron-gear-wheel", 3})
  end
  if miles then
	iter(function(tier)
		bobmods.lib.recipe.add_ingredient("assembling-machine-"..tier.."-bigger", {"titanium-bearing", 5 + (5 * (tier - 6))})
	end)
  end
end

if item["nitinol-gear-wheel"] then
  bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "iron-gear-wheel", "nitinol-gear-wheel")
  bobmods.lib.tech.add_prerequisite("automation-6", "nitinol-processing")
  if miles then
	iter(function(tier)
		bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "iron-gear-wheel", "nitinol-gear-wheel")
		bobmods.lib.tech.add_prerequisite("automation-"..tier, "nitinol-processing")
	end)
  end
else
  if item["titanium-gear-wheel"] then
    bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "iron-gear-wheel", "titanium-gear-wheel")
    bobmods.lib.tech.add_prerequisite("automation-6", "titanium-processing")
	if miles then
		iter(function(tier)
			 bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "iron-gear-wheel", "titanium-gear-wheel")
    		 bobmods.lib.tech.add_prerequisite("automation-"..tier, "titanium-processing")
		end)
	end
  else
    if item["tungsten-gear-wheel"] then
      bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "iron-gear-wheel", "tungsten-gear-wheel")
      bobmods.lib.tech.add_prerequisite("automation-6", "tungsten-processing")
    end
	if miles then
		iter(function(tier)
			 bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "iron-gear-wheel", "tungsten-gear-wheel")
     		 bobmods.lib.tech.add_prerequisite("automation-"..tier, "tungsten-processing")
		end)
	end
  end
end

if item["advanced-processing-unit"] then
  bobmods.lib.recipe.replace_ingredient("assembling-machine-6-bigger", "processing-unit", "advanced-processing-unit")
  bobmods.lib.tech.add_prerequisite("automation-6-bigger", "advanced-electronics-3")
  if miles then
	iter(function(tier)
		bobmods.lib.recipe.replace_ingredient("assembling-machine-"..tier.."-bigger", "processing-unit", "advanced-processing-unit")
  		bobmods.lib.tech.add_prerequisite("automation-"..tier.."-bigger", "advanced-electronics-3")
	end)
  end
end

if settings.startup["bobmods-assembly-limits"].value == true then
  data.raw["assembling-machine"]["assembling-machine-6-bigger"].ingredient_count = 16
  if miles then
	iter(function(tier)
		data.raw["assembling-machine"]["assembling-machine-"..tier.."-bigger"].ingredient_count = 16 + (4 * (tier - 6))
	end)
  end
end

if mods["ShinyBobGFX"] then
  if settings.startup["replace-assemblycolors"].value == true then
    assembler_entity = data.raw["assembling-machine"]["assembling-machine-6-bigger"]
    assembler_item = item["assembling-machine-6-bigger"]

    if settings.startup["add-powerbars"].value == true then
      -- no idea why Zombiee did that
      -- assembler_item.icons = {
      --   {icon = "__ShinyBobGFX__/graphics/icons/old-assembling/assembling-machine-6.png"},
      --   {icon = "__ShinyBobGFX__/graphics/icons/num-5.png"}
      -- }

      assembler_entity.icon_size = 32
      assembler_entity.icons = {
        {icon = "__ShinyBobGFX__/graphics/icons/assembling-machine-6.png"},
        {icon = "__ShinyBobGFX__/graphics/icons/num-5.png"}
      }
      assembler_entity.icon = nil

      assembler_item.icon_size = 32
      assembler_item.icons = {
        {icon = "__ShinyBobGFX__/graphics/icons/assembling-machine-6.png"},
        {icon = "__ShinyBobGFX__/graphics/icons/num-5.png"}
      }
      assembler_item.icon = nil
    else
      assembler_item.icons = "__ShinyBobGFX__/graphics/icons/old-assembling/assembling-machine-6.png"

      assembler_entity.icon_size = 32
      assembler_entity.icon = "__ShinyBobGFX__/graphics/icons/assembling-machine-6.png"

      assembler_item.icon_size = 32
      assembler_item.icon = "__ShinyBobGFX__/graphics/icons/assembling-machine-6.png"
    end

    assembler_entity["animation"] = {
      layers = {
        {
          filename = "__ShinyBobGFX__/graphics/entity/assembling-machines/assembling-machine-6.png",
          priority = "high",
          width = 142,
          height = 113,
          frame_count = 32,
          line_length = 8,
          shift = {0.85, -0.15},
          scale = 5 / 3,
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5 * 5 / 3
          }
        },
        {
          filename = "__ShinyBobGFX__/graphics/entity/assembling-machines/assembling-machine-6.png",
          priority = "high",
          width = 142,
          height = 113,
          frame_count = 32,
          line_length = 8,
          shift = {0.85, -0.15},
          scale = 5 / 3,
          hr_version = {
            filename = "__ShinyBobGFX__/graphics/entity/assembling-machines/hr-assembling-machine-6-cap.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5 * 5 / 3
          }
        },
        {
          filename = "__ShinyBobGFX__/graphics/entity/assembling-machines/assembling-machine-noshad-3.png",
          priority = "high",
          width = 142,
          height = 113,
          frame_count = 32,
          line_length = 8,
          shift = {0.85, -0.15},
          draw_as_shadow = true,
          scale = 5 / 3,
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5 * 5 / 3
          }
        }
      }
    }
  end
end
