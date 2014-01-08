# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
PMAC::Application.config.secret_key_base = '4bd651abff9d9e8e3928bb6ccd0e594891cc06f76d092ab2bcbf1a09fc85d8f49b0b95f80bf207b310ac1021dea0c23882a35b47b6585f7d699ffe1e24cf5ac0'
