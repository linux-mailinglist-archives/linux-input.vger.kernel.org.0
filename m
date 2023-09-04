Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60E2791B07
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 17:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241641AbjIDP75 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 11:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbjIDP75 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 11:59:57 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39B0CDA;
        Mon,  4 Sep 2023 08:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1693843190; bh=6xQ8ZzLA186xYSB1p50dCg8bI/xUN5UKZ4e4DN5dY4Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JbEcKK6AlWE4egRXfy61j4FO6+MWz00uDfvuC32Z8D1FjmOkA58fhIsMMBa3ngg/n
         WwF0wzIOQbwLKwFniOMKBDDVVTl4ep/Av9SvOK0TVpf0nGV1CWMHFr+MzQYTqy39Ku
         JtybnDyMdsKr9/jvkP3Ov9Pw6es8f3ebi5SUMiaU=
Date:   Mon, 4 Sep 2023 17:59:45 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Julius Zint <julius@zint.sh>, Hans de Goede <hdegoede@redhat.com>
Cc:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
Message-ID: <f2e1ab9e-e691-42e1-a600-42744f692922@t-8ch.de>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820094118.20521-2-julius@zint.sh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+Cc Hans who ins involved with the backlight subsystem

Hi Julius,

today I stumbled upon a mail from Hans [0], which explains that the
backlight subsystem is not actually a good fit (yet?) for external
displays.

It seems a new API is in the works that would better fit, but I'm not
sure about the state of this API. Maybe Hans can clarify.

This also ties back to my review question how userspace can figure out
to which display a backlight devices applies. So far it can not.

[0] https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/

Below the original PATCH for Hans' reference.

On 2023-08-20 11:41:18+0200, Julius Zint wrote:
> The HID spec defines the following Usage IDs (p. 345 ff):
> 
> - Monitor Page (0x80) -> Monitor Control (0x01)
> - VESA Virtual Controls Page (0x82) -> Brightness (0x10)
> 
> Apple made use of them in their Apple Studio Display and most likely on
> other external displays (LG UltraFine 5k, Pro Display XDR).
> 
> The driver will work for any HID device with a report, where the
> application matches the Monitor Control Usage ID and:
> 
> 1. An Input field in this report with the Brightness Usage ID (to get
>    the current brightness)
> 2. A Feature field in this report with the Brightness Usage ID (to
>    set the current brightness)
> 
> This driver has been developed and tested with the Apple Studio Display.
> Here is a small excerpt from the decoded HID descriptor showing the
> feature field for setting the brightness:
> 
>   Usage Page (Monitor VESA VCP),  ; Monitor VESA VPC (82h, monitor page)
>   Usage (10h, Brightness),
>   Logical Minimum (400),
>   Logical Maximum (60000),
>   Unit (Centimeter^-2 * Candela),
>   Unit Exponent (14),
>   Report Size (32),
>   Report Count (1),
>   Feature (Variable, Null State),
> 
> The full HID descriptor dump is available as a comment in the source
> code.
> 
> Signed-off-by: Julius Zint <julius@zint.sh>
> ---
>  drivers/video/backlight/Kconfig  |   8 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/hid_bl.c | 269 +++++++++++++++++++++++++++++++
>  3 files changed, 278 insertions(+)
>  create mode 100644 drivers/video/backlight/hid_bl.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 51387b1ef012..b964a820956d 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -472,6 +472,14 @@ config BACKLIGHT_LED
>  	  If you have a LCD backlight adjustable by LED class driver, say Y
>  	  to enable this driver.
>  
> +config BACKLIGHT_HID
> +	tristate "VESA VCP HID Backlight Driver"
> +	depends on HID
> +	help
> +	  If you have an external display with VESA compliant HID brightness
> +	  controls then say Y to enable this backlight driver. Currently the
> +	  only supported device is the Apple Studio Display.
> +
>  endif # BACKLIGHT_CLASS_DEVICE
>  
>  endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index f72e1c3c59e9..835f9b8772c7 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -58,3 +58,4 @@ obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>  obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>  obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
>  obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> +obj-$(CONFIG_BACKLIGHT_HID)		+= hid_bl.o
> diff --git a/drivers/video/backlight/hid_bl.c b/drivers/video/backlight/hid_bl.c
> new file mode 100644
> index 000000000000..b40f8f412ee2
> --- /dev/null
> +++ b/drivers/video/backlight/hid_bl.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include <linux/backlight.h>
> +
> +#define APPLE_STUDIO_DISPLAY_VENDOR_ID  0x05ac
> +#define APPLE_STUDIO_DISPLAY_PRODUCT_ID 0x1114
> +
> +#define HID_USAGE_MONITOR_CTRL			0x800001
> +#define HID_USAGE_VESA_VCP_BRIGHTNESS		0x820010
> +
> +/*
> + * Apple Studio Display HID report descriptor
> + *
> + * Usage Page (Monitor),               ; USB monitor (80h, monitor page)
> + * Usage (01h),
> + * Collection (Application),
> + *     Report ID (1),
> + *
> + *     Usage Page (Monitor VESA VCP),  ; Monitor VESA virtual control panel (82h, monitor page)
> + *     Usage (10h, Brightness),
> + *     Logical Minimum (400),
> + *     Logical Maximum (60000),
> + *     Unit (Centimeter^-2 * Candela),
> + *     Unit Exponent (14),
> + *     Report Size (32),
> + *     Report Count (1),
> + *     Feature (Variable, Null State),
> + *
> + *     Usage Page (PID),               ; Physical interface device (0Fh)
> + *     Usage (50h),
> + *     Logical Minimum (0),
> + *     Logical Maximum (20000),
> + *     Unit (1001h),
> + *     Unit Exponent (13),
> + *     Report Size (16),
> + *     Feature (Variable, Null State),
> + *
> + *     Usage Page (Monitor VESA VCP),  ; Monitor VESA virtual control panel (82h, monitor page)
> + *     Usage (10h, Brightness),
> + *     Logical Minimum (400),
> + *     Logical Maximum (60000),
> + *     Unit (Centimeter^-2 * Candela),
> + *     Unit Exponent (14),
> + *     Report Size (32),
> + *     Report Count (1),
> + *     Input (Variable),
> + * End Collection
> + */
> +
> +struct hid_bl_data {
> +	struct hid_device *hdev;
> +	unsigned int min_brightness;
> +	unsigned int max_brightness;
> +	struct hid_field *input_field;
> +	struct hid_field *feature_field;
> +};
> +
> +static struct hid_field *hid_get_usage_field(struct hid_device *hdev,
> +					     unsigned int report_type,
> +					     unsigned int application, unsigned int usage)
> +{
> +	struct hid_report_enum *re = &hdev->report_enum[report_type];
> +	struct hid_report *report;
> +	int i, j;
> +
> +	list_for_each_entry(report, &re->report_list, list) {
> +		if (report->application != application)
> +			continue;
> +
> +		for (i = 0; i < report->maxfield; i++) {
> +			struct hid_field *field = report->field[i];
> +
> +			for (j = 0; j < field->maxusage; j++)
> +				if (field->usage[j].hid == usage)
> +					return field;
> +		}
> +	}
> +	return NULL;
> +}
> +
> +static void hid_bl_remove(struct hid_device *hdev)
> +{
> +	struct backlight_device *bl;
> +	struct hid_bl_data *data;
> +
> +	hid_dbg(hdev, "remove\n");
> +	bl = hid_get_drvdata(hdev);
> +	data = bl_get_data(bl);
> +
> +	devm_backlight_device_unregister(&hdev->dev, bl);
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +	hid_set_drvdata(hdev, NULL);
> +	devm_kfree(&hdev->dev, data);
> +}
> +
> +static int hid_bl_get_brightness_raw(struct hid_bl_data *data)
> +{
> +	struct hid_field *field;
> +	int result;
> +
> +	field = data->input_field;
> +	hid_hw_request(data->hdev, field->report, HID_REQ_GET_REPORT);
> +	hid_hw_wait(data->hdev);
> +	result = *field->new_value;
> +	hid_dbg(data->hdev, "get brightness: %d\n", result);
> +
> +	return result;
> +}
> +
> +static int hid_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct hid_bl_data *data;
> +	int brightness;
> +
> +	data = bl_get_data(bl);
> +	brightness = hid_bl_get_brightness_raw(data);
> +	return brightness - data->min_brightness;
> +}
> +
> +static void hid_bl_set_brightness_raw(struct hid_bl_data *data, int brightness)
> +{
> +	struct hid_field *field;
> +
> +	field = data->feature_field;
> +	*field->value = brightness;
> +	hid_hw_request(data->hdev, field->report, HID_REQ_SET_REPORT);
> +	hid_hw_wait(data->hdev);
> +	hid_dbg(data->hdev, "set brightness: %d\n", brightness);
> +}
> +
> +static int hid_bl_update_status(struct backlight_device *bl)
> +{
> +	struct hid_bl_data *data;
> +	int brightness;
> +
> +	data = bl_get_data(bl);
> +	brightness = backlight_get_brightness(bl);
> +	brightness += data->min_brightness;
> +	hid_bl_set_brightness_raw(data, brightness);
> +	return 0;
> +}
> +
> +static const struct backlight_ops hid_bl_ops = {
> +	.update_status  = hid_bl_update_status,
> +	.get_brightness = hid_bl_get_brightness,
> +};
> +
> +static int hid_bl_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	int ret;
> +	struct hid_field *input_field;
> +	struct hid_field *feature_field;
> +	struct hid_bl_data *data;
> +	struct backlight_properties props;
> +	struct backlight_device *bl;
> +
> +	hid_dbg(hdev, "probe\n");
> +
> +	ret = hid_parse(hdev);
> +	if (ret) {
> +		hid_err(hdev, "parse failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> +	if (ret) {
> +		hid_err(hdev, "hw start failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	input_field = hid_get_usage_field(hdev, HID_INPUT_REPORT,
> +					  HID_USAGE_MONITOR_CTRL,
> +					  HID_USAGE_VESA_VCP_BRIGHTNESS);
> +	if (input_field == NULL) {
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	feature_field = hid_get_usage_field(hdev, HID_FEATURE_REPORT,
> +					    HID_USAGE_MONITOR_CTRL,
> +					    HID_USAGE_VESA_VCP_BRIGHTNESS);
> +	if (feature_field == NULL) {
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	if (input_field->logical_minimum != feature_field->logical_minimum) {
> +		hid_warn(hdev, "minimums do not match: %d / %d\n",
> +			 input_field->logical_minimum,
> +			 feature_field->logical_minimum);
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	if (input_field->logical_maximum != feature_field->logical_maximum) {
> +		hid_warn(hdev, "maximums do not match: %d / %d\n",
> +			 input_field->logical_maximum,
> +			 feature_field->logical_maximum);
> +		ret = -ENODEV;
> +		goto exit_stop;
> +	}
> +
> +	hid_dbg(hdev, "Monitor VESA VCP with brightness control\n");
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hw open failed: %d\n", ret);
> +		goto exit_stop;
> +	}
> +
> +	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (data == NULL) {
> +		ret = -ENOMEM;
> +		goto exit_stop;
> +	}
> +	data->hdev = hdev;
> +	data->min_brightness = input_field->logical_minimum;
> +	data->max_brightness = input_field->logical_maximum;
> +	data->input_field = input_field;
> +	data->feature_field = feature_field;
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = data->max_brightness - data->min_brightness;
> +
> +	bl = devm_backlight_device_register(&hdev->dev, "vesa_vcp",
> +					    &hdev->dev, data,
> +					    &hid_bl_ops,
> +					    &props);
> +	if (IS_ERR(bl)) {
> +		ret = PTR_ERR(bl);
> +		hid_err(hdev, "failed to register backlight: %d\n", ret);
> +		goto exit_free;
> +	}
> +
> +	hid_set_drvdata(hdev, bl);
> +
> +	return 0;
> +
> +exit_free:
> +	hid_hw_close(hdev);
> +	devm_kfree(&hdev->dev, data);
> +
> +exit_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static const struct hid_device_id hid_bl_devices[] = {
> +	{ HID_USB_DEVICE(APPLE_STUDIO_DISPLAY_VENDOR_ID,
> +			 APPLE_STUDIO_DISPLAY_PRODUCT_ID) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, hid_bl_devices);
> +
> +static struct hid_driver hid_bl_driver = {
> +	.name = "hid_backlight",
> +	.id_table = hid_bl_devices,
> +	.probe = hid_bl_probe,
> +	.remove = hid_bl_remove,
> +};
> +module_hid_driver(hid_bl_driver);
> +
> +MODULE_AUTHOR("Julius Zint <julius@zint.sh>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Backlight driver for HID devices");
> -- 
> 2.41.0
> 
