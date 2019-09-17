# ioc-spark-training

Spark training for IOC, this is mainly spark training material that has been used in IOC.

It also contains a Docker container with a PySpark local environment and a Jupyter notebook setup for easy access.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites for the PySpark environment

Working docker


### Installing

Build and run the docker container:

```
docker build . -t ioc-spark-training:latest
docker run -t --name ioc-spark-training -p 3000:3000 ioc-spark-training:latest
```

Then copy paste the url shown when running it:

```
    To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-6-open.html
    Or copy and paste one of these URLs:
        http://7085854b358e:3000/?token=fd49dff9619830e729c9a5bf311ae9043d867b0e58e789ae
     or http://127.0.0.1:3000/?token=fd49dff9619830e729c9a5bf311ae9043d867b0e58e789ae
```

This is the link you open: **http://127.0.0.1:3000/?token=fd49dff9619830e729c9a5bf311ae9043d867b0e58e789ae**

That is is, now you can just create your notebooks.


## Contributing

Please read [Fork and PR](https://gist.github.com/Chaser324/ce0505fbed06b947d962) for details on the process for submitting pull requests to us.


## Authors

* **Jesus Gazol** - *Initial work* - [Jesus Gazol](https://github.com/jgaz)

See also the list of [contributors](https://github.com/jgaz/ioc-spark-training/contributors) who participated in this project.

## License

This project is licensed under the GPL3 License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Nikolai Thomassen for the initial Docker support.

