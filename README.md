echo Cookbook
==================

This cookbook downloads .mp3 programs from echo of Moscow radio <br>
Supported programs can be found at: http://echo.msk.ru/programs/ <br>

Attributes
==================
#### echo::default

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
| ['echo']['proxy'] | String | Proxy server | " " |
| ['echo']['source'] | String | program's source | "http://echo.msk.ru/programs/" |
| ['echo']['path'] | String | program's download destination | "#{ENV['HOMEPATH']}/Desktop/Radio/" |
| ['echo']['arcPath'] | String | program's archive destination | "E:/LIBRARY/Audio/Radio_Echo/" |

Suported Programs:
==================

* personalno/ <br>
* year2017/ <br>
* albac/ <br>
* sorokina/ <br>
* tochka/ <br>
* vsetak/ <br>
* Diletanti/ <br>
* naukafokus/ <br>
* netak/
* victory/ <br>
* cenapobedy/ <br>
* 48minut/ <br>
* 96_pages/ <br>
* vsetakplus/ <br>
* sut/ ==> special code for gsub date <br>
* code/ ==> special code for gsub date <br>

Usage
==================
#### 'echo'::default

Just include 'echo' in your cookbook:

    include_recipe 'echo'

Notes:
===================
Windows Task Scheduling: Radio - Echo

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Michael Vershinin

Support
-------------------
goldver@gmail.com