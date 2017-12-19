# API приложение рецептов.
Тестовое задание разработка API backend для приложения добавления рецептов.
### Requirements
* PHP 7
* Postgres

Dump базы данных лежит в папке dump/test.sql 
## API

| uri                          | method | request                                               | response                   | description                                  |
|------------------------------|--------|-------------------------------------------------------|----------------------------|----------------------------------------------|
| /user/login/                 | POST   | ["login"], ["pass"]                                   | JSON with message          | User authentication                          |
| /user/create/                | POST   | ["login"], ["pass"], ["pass2"], ["name"], ["surname"] | JSON with message          | User registration                            |
| /user/logout/:id             | GET    | :id = User Id                                         | JSON with message          | User logout                                  |
| /recipes/                    | POST   | ["name"], ["descriptions"]                            | JSON with message          | Create new recipe (only for authorized users)|
| /recipes/update/:id          | PUT    | ["name"], ["descriptions"], :id = Recipe Id           | JSON with message          | Update recipe info(only for authorized users)|
| /recipes/remove/:id          | DELETE | :id = Recipe Id                                       | JSON with message          | Remove recipe (only for authorized users)    |
| /recipes/one/:id             | GET    | :id = Recipe Id                                       | JSON one recipe            | Get one recipe                               |
| /recipes/all/                | GET    |                                                       | JSON all recipes           | Get all recipe                               |
| /images/form/                | GET    |                                                       | HTML form                  | Html form for test file upload               |
| /images/create/:id           | GET    | $_FILES , :id = linked Post Id                        | JSON with message          | Create db entry & upload file to file system |
