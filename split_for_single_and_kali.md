wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-19.6.tar.gz#md5=c607dd118eae682c44ed146367a17e26  
tar -zxvf setuptools-19.6.tar.gz  
cd setuptools-19.6  
python3 setup.py build  
python3 setup.py install  
cd ../  
wget --no-check-certificate https://pypi.python.org/packages/source/p/pip/pip-8.0.2.tar.gz#md5=3a73c4188f8dbad6a1e6f6d44d117eeb  
tar -zxvf pip-8.0.2.tar.gz  
cd pip-8.0.2  
python3 setup.py build  
python3 setup.py install  
