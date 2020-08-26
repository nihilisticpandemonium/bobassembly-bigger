data:extend(
  {
    {
      type = "item",
      name = "assembling-machine-6-bigger",
      icon = "__bobassembly__/graphics/icons/assembling-machine-6.png",
      icon_size = 32,
      subgroup = "bob-assembly-machine",
      order = "c[assembling-machine-6-bigger]",
      place_result = "assembling-machine-6-bigger",
      stack_size = 50
    },
    {
      type = "assembling-machine",
      name = "assembling-machine-6-bigger",
      icon = "__bobassembly__/graphics/icons/assembling-machine-6.png",
      icon_size = 32,
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-6-bigger"},
      max_health = 600,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      resistances = {
        {
          type = "fire",
          percent = 70
        }
      },
      fluid_boxes = {
        {
          production_type = "input",
          pipe_picture = assembler3pipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{type = "input", position = {0, -3}}}
        },
        {
          production_type = "output",
          pipe_picture = assembler3pipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = 1,
          pipe_connections = {{type = "output", position = {0, 3}}}
        },
        off_when_no_fluid_recipe = true
      },
      open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
      close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
      working_sound = {
        sound = {
          {
            filename = "__base__/sound/assembling-machine-t3-1.ogg",
            volume = 0.8
          },
          {
            filename = "__base__/sound/assembling-machine-t3-2.ogg",
            volume = 0.8
          }
        },
        idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.6},
        apparent_volume = 1.5
      },
      collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
      selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
      fast_replaceable_group = "assembling-machine",
      animation = {
        layers = {
          {
            filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-3.png",
            priority = "high",
            width = 108,
            height = 119,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -1),
            scale = 5 / 3,
            hr_version = {
              filename = "__bobassembly__/graphics/entity/assembling-machine/hr-assembling-machine-3.png",
              priority = "high",
              width = 214,
              height = 237,
              frame_count = 32,
              line_length = 8,
              shift = util.by_pixel(0, -1.5),
              scale = 0.5 * 5 / 3
            }
          },
          {
            filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-mask.png",
            priority = "high",
            width = 142,
            height = 113,
            repeat_count = 32,
            shift = {1.48, -0.18},
            tint = {r = 0.1, g = 0.7, b = 0.1},
            scale = 5 / 3
          },
          {
            filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-3-shadow.png",
            priority = "high",
            width = 130,
            height = 82,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(56, 8),
            scale = 5 / 3,
            hr_version = {
              filename = "__bobassembly__/graphics/entity/assembling-machine/hr-assembling-machine-3-shadow.png",
              priority = "high",
              width = 260,
              height = 162,
              frame_count = 32,
              line_length = 8,
              draw_as_shadow = true,
              shift = util.by_pixel(56, 8),
              scale = 0.5 * 5 / 3
            }
          }
        }
      },
      crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
      crafting_speed = 3.5,
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.75
      },
      energy_usage = "480kW",
      module_specification = {
        module_slots = 6,
        module_info_icon_shift = {0, 0.5},
        module_info_multi_row_initial_height_modifier = -0.3
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"}
    },
    {
      type = "recipe",
      name = "assembling-machine-6-bigger",
      enabled = "false",
      ingredients = {
        {"assembling-machine-5", 1},
        {"processing-unit", 3},
        {"steel-plate", 5},
        {"iron-plate", 5},
        {"iron-gear-wheel", 5}
      },
      result = "assembling-machine-6-bigger"
    }
  }
)
