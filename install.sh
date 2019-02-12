#!/bin/bash

IMAGE=singularity-compression
DIRECTORY=~/.singularity

if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
fi

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi

if [ ! -f $DIRECTORY/$(echo $IMAGE | cut -d"-" -f2).simg ]; then
	singularity pull --name $(echo $IMAGE | cut -d"-" -f2).simg shub://icaoberg/$IMAGE
	mv -v $(echo $IMAGE | cut -d"-" -f2).simg $DIRECTORY
fi

# ┌───┐
# │RAR│
# └───┘
cat << EOF > ~/bin/rar
#!/bin/bash

singularity run --app rar ~/.singularity/$(echo $IMAGE | cut -d"-" -f2).simg $1
EOF

chmod +x ~/bin/rar

# ┌─────┐
# │UNRAR│
# └─────┘
cat << EOF > ~/bin/unrar
#!/bin/bash

singularity run --app unrar ~/.singularity/$(echo $IMAGE | cut -d"-" -f2).simg $1
EOF

chmod +x ~/bin/unrar

# ┌──┐
# │7z│
# └──┘
cat << EOF > ~/bin/7z
#!/bin/bash

singularity run --app 7z ~/.singularity/$(echo $IMAGE | cut -d"-" -f2).simg $1
EOF

chmod +x ~/bin/7z
