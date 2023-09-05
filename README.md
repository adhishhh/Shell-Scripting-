# Shell-Scripting-
Shell accepts human-readable commands from users and converts them into something which the kernel can understand

The script named **v4l2_user_control.sh** now supports the following cases:

If no arguments are provided, it lists the existing control names and their values.
If one argument is provided, it checks if it's "list" and lists user and camera controls accordingly. If it's not "list," it assumes it's a control name and retrieves its value.
If two arguments are provided, it assumes the first argument is a control name and the second argument is the desired value. It sets the control to the specified value.
