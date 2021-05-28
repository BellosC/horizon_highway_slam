# horizon_highway_slam

> Apply SLAM to rosbag and get a 3D model from `.pcd` files.

## Usage

1.  ```sh
    git clone https://github.com/BellosC/horizon_highway_slam
    cd horizon_highway_slam
    ```

1. ```sh
    docker build -t horizon_highway_slam:latest .
    ```

1. Place your bagfile at `$HOME/shared_dir`.

1. ```sh
    ./run.sh <name-of-bagfile> <imu>
    ```
    > `0` recommended for `<imu>`.

1. Wait until rosbag is fully played.

1. <kbd>Ctrl</kbd> + <kbd>C</kbd>

1. Get your juicy pcd files at `$HOME/shared_dir/<name-of-bag-file>_pcd/`.

1. If you have `pcl_viewer` installed, it will open automatically.

## Related

- [BellosC/lidar-rosbag-docker](https://github.com/BellosC/lidar-rosbag-docker): Get a rosbag file from a Livox Horizon LIDAR.