
Flight Distance Calculation
===================

### Setup ###
```
Install ruby 2.2.3 or change ruby version in ruby-version file.
bundle install
```

### For Running program ###

```
ruby flight_distance.rb
```

### Sample Input ###

```
3 4 2
Dhaka 23.8500 90.4000
Chittagong 22.2500 91.8333
Calcutta 22.5333 88.3667
Dhaka Calcutta
Calcutta Dhaka
Dhaka Chittagong
Chittagong Dhaka
Chittagong Calcutta
Dhaka Chittagong
0 0 0
```

### Tests ###

```
rake spec
```
