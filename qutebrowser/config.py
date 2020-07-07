import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

config.set('zoom.default', 200)

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})
