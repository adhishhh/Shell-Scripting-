map_synonyms() {
    case "$1" in
        "bright"|"brightness")
            echo "brightness"
            ;;
        "contrast")
            echo "contrast"
            ;;
        "saturation")
            echo "saturation"
            ;;
        "gamma")
            echo "gamma"
            ;;
        "exposure")
            echo "exposure"
            ;;
        "gain")
            echo "gain"
            ;;
        "power"|"frequency")
            echo "power_line_frequency"
            ;;
        "color"|"effects")
            echo "color_effects"
            ;;
        "zoom")
            echo "zoom_absolute"
            ;;
        "white"|"balance")
            echo "white_balance_auto_preset"
            ;;
        "metering")
            echo "exposure_metering"
            ;;
        "scene"|"mode")
            echo "scene_mode"
            ;;
        *)
            echo "$1"
            ;;
    esac
}

if [ $# -eq 0 ]; then
    echo "Existing Control Values:"
    v4l2-ctl -d /dev/v4l-subdev0 -L
    exit 1
elif [ $# -eq 1 ]; then
    if [ "$1" == "list" ]; then
        echo "User Controls:"
        v4l2-ctl -d /dev/v4l-subdev0 -L | sed -n '/User Controls/,/Camera Controls/p'
        echo "Camera Controls:"
        v4l2-ctl -d /dev/v4l-subdev0 -L | sed -n '/Camera Controls/,$p'
    else
        control_name=$(map_synonyms "$1")
        echo "Getting the value of control: $control_name"
        v4l2-ctl -d /dev/v4l-subdev0 -C "$control_name"
    fi
elif [ $# -eq 2 ]; then
    control_name=$(map_synonyms "$1")
    echo "Setting control $control_name to value $2"
    v4l2-ctl -d /dev/v4l-subdev0 -c "$control_name=$2"
else
    echo "Invalid number of arguments."
    exit 1
fi
