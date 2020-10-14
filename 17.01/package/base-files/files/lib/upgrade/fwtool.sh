fwtool_pre_upgrade() {
	[ "$REQUIRE_IMAGE_METADATA" = 1 ] && {
		fwtool -q -i /dev/null "$1"
	}
}

fwtool_check_image() {
	[ $# -gt 1 ] && return 1

	[ "$REQUIRE_IMAGE_METADATA" = 1 ] && {

		. /usr/share/libubox/jshn.sh

		if ! fwtool -q -i /tmp/sysupgrade.meta "$1"; then
			echo "Image metadata not found"
			return 1
		fi

		json_load "$(cat /tmp/sysupgrade.meta)" || {
			echo "Invalid image metadata"
			return 1
		}

		device="$(cat /tmp/sysinfo/board_name)"

		json_select supported_devices || return 1

		json_get_keys dev_keys
		for k in $dev_keys; do
			json_get_var dev "$k"
			[ "$dev" = "$device" ] && return 0
		done

		echo "Device $device not supported by this image"
		echo -n "Supported devices:"
		for k in $dev_keys; do
			json_get_var dev "$k"
			echo -n " $dev"
		done
		echo

		return 1
	}

	return 0
}
