# API-тесты (Postman)

Коллекция `practice-api.postman_collection.json` тестирует учебное API https://jsonplaceholder.typicode.com.

## Что проверяется
| Запрос | Проверки |
|---|---|
| `GET /users/1` | статус 200, значение и тип полей `name`, `email`, `id` |
| `GET /users/9999` | негативный сценарий: статус 404, пустое тело |
| `POST /users` | статус 201, в ответе данные из запроса и числовой `id` |

## Как запустить
1. Postman → **Import** → выбрать файл коллекции
2. Открыть коллекцию → **Run** → **Run Practice API**
3. Все тесты должны быть зелёными
