function cppinit
  argparse 'p/project=+' 'b/binary=+' 't/type=+' -- $argv
  or begin
    echo "Usage:  cppinit -p PROJECT_NAME -b BINARY_NAME"
    return 1
  end

  set -l project_name $_flag_p
  set -l binary_name $_flag_b
  set -l type $_flag_t


  cp -r ~/.scripts/cppinit/cppTemplate/ ./$project_name/
  if not test -e $project_name && not test -d $project_name
    echo "Error: Directory does not exist -- $project_name"
    return 1
  end
  cd $project_name

  set -l meson_path meson.build

  if not test -f $meson_path
    echo "Error: File does not exist -- $meson_path"
    return 1
  end

  sed -i "s/project('project_name'/project('$project_name'/g" $meson_path
  sed -i "s/executable('binary_name'/executable('$binary_name'/g" $meson_path
  sed -i "s/buildtype=debug/buildtype=$type/g" $meson_path

  echo "Project $project_name has been created."
  echo "To build the project, run: meson setup build --reconfigure; ninja -C build"
end
