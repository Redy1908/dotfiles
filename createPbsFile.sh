#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide the filename."
  exit 1
fi

# Add the .pbs extension to the filename
filename="$1.pbs"

# Check if the file already exists
if [ -e "$filename" ]; then
  echo "The file $filename already exists. Please choose another name."
  exit 1
fi

# Create the file and insert text into it

cat <<EOL > $1.pbs
#!/bin/bash

#PBS -N myJob
#PBS -q studenti
#PBS -o result.out
#PBS -e result.err

cd \$PBS_O_WORKDIR

if [ -f result.out ]; then
    rm result.out
fi

if [ -f result.err ]; then
    rm result.err
fi

cc main.c -fopenmp

./a.out
EOL

echo "File $filename created successfully!"

