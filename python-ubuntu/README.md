# Custom python container

* uses ubuntu base image
* includes `click`, `pandas`, `SQLAlchemy`
* includes libraries needed for mysql connection

## build

```
docker build -t python_tests .
```

## run

```
docker run -ti --rm python_tests bash
```

```
docker run --rm python_tests python main.py
```
