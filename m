Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C327781D53
	for <lists+linux-input@lfdr.de>; Sun, 20 Aug 2023 12:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjHTKGz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Aug 2023 06:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjHTKGy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Aug 2023 06:06:54 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B810468C
        for <linux-input@vger.kernel.org>; Sun, 20 Aug 2023 03:06:44 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id XfKSq7fa0WghuXfKSq3Tzp; Sun, 20 Aug 2023 12:06:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1692526002;
        bh=GiOe1P5RZBAu0+IDAU0H1NgB/w3J2a4zROWs+GR1bIs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=dNvhYJTG55qucsGiqkg/mOVpuZxDI+WhER2U/+XjCyirYycq/czq0XRKsGhNgKuPY
         ZTMJWh9gMQPYYL/RAhrsEl7r9rgamS6GBXBnEqxHqo8VP6SVtLpZU6l8YhHLCQRjf6
         xV76Ou8igdQowkUo62+u2ldZa7He4jpDZ4GgoC8XQjs4mVR7RaYNYApCo8kfd7Zxr6
         IRHQjw3zrzEnPRO+7fG5UyKYzRRHIWiHc5QF14aAX2PoC7N1F7bPu5h10SWAEwhfRy
         psEpA/kUe70Fp/AFglfpbyrUooZDIHtufczVgixBLfyLiE+zecK8T05aODWHfGLn27
         IgH/A3WaGOafQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 12:06:42 +0200
X-ME-IP: 86.243.2.178
Message-ID: <2b7cf5af-1d96-8650-ac93-b1243bab5d7a@wanadoo.fr>
Date:   Sun, 20 Aug 2023 12:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
Content-Language: fr
To:     Julius Zint <julius@zint.sh>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Helge Deller <deller@gmx.de>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-input@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230820094118.20521-2-julius@zint.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le 20/08/2023 à 11:41, Julius Zint a écrit :
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
>     the current brightness)
> 2. A Feature field in this report with the Brightness Usage ID (to
>     set the current brightness)
> 
> This driver has been developed and tested with the Apple Studio Display.
> Here is a small excerpt from the decoded HID descriptor showing the
> feature field for setting the brightness:
> 
>    Usage Page (Monitor VESA VCP),  ; Monitor VESA VPC (82h, monitor page)
>    Usage (10h, Brightness),
>    Logical Minimum (400),
>    Logical Maximum (60000),
>    Unit (Centimeter^-2 * Candela),
>    Unit Exponent (14),
>    Report Size (32),
>    Report Count (1),
>    Feature (Variable, Null State),
> 
> The full HID descriptor dump is available as a comment in the source
> code.
> 
> Signed-off-by: Julius Zint <julius@zint.sh>
> ---

[...]

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

Hi,

If this need to be called here, before the hid_() calls below, there 
seems to be no real point in using devm_backlight_device_register() / 
devm_backlight_device_unregister().

The non-devm_ version should be enough.

> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +	hid_set_drvdata(hdev, NULL);
> +	devm_kfree(&hdev->dev, data);

'data' is devm_kzalloc()'ed.
It is likely that this explicit devm_kfree() could be saved. It will be 
freed by the framework.

> +}

[...]

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

exit_free?
in order to undo the hid_hw_open() just above.

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

'data' is devm_kzalloc()'ed.
It is likely that this explicit devm_kfree() could be saved. It will be 
freed by the framework.

> +
> +exit_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}

[...]

