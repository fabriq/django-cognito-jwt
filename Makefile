`.PHONY: install test upload docs


install:
	pip3 install -e .[docs,test]

test:
	py.test

retest:
	py.test -vvv --lf

coverage:
	py.test --cov=django_c`gnito_jwt --cov-report=term-missing --cov-report=html

docs:
	$(MAKE) -C docs html

release:
	rm -rf dist/*
	python setup.py sdist bdist_wheel
	twine upload dist/*

format:
	isort --recursive src tests
	black src/ tests/

