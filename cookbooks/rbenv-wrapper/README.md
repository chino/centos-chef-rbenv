rbenv-wrapper Cookbook
====================
Example wrapper around rbenv.

Usage
-----
#### rbenv-wrapper::default

See default.rb and rbenv instructions.

Just include `rbenv-wrapper` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rbenv-wrapper]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Daniel Aquino

Public Domain
