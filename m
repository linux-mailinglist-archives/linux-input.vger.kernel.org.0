Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E2D340D96
	for <lists+linux-input@lfdr.de>; Thu, 18 Mar 2021 19:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbhCRS4M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Mar 2021 14:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhCRSzn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Mar 2021 14:55:43 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133BBC06174A;
        Thu, 18 Mar 2021 11:55:43 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id x187-20020a4a41c40000b02901b664cf3220so1682179ooa.10;
        Thu, 18 Mar 2021 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+vUe2aDbl1jQQYaBLQ0FlLUwR8pg911EhG/FXdJ85+Q=;
        b=K1qorVH0LZX++4wxLcbW1S6aHQuvcFMF9LuLxaq9EsBJrRzCbkEWoXZorqWlXYoRz7
         B0wbBEBBdC5HDC4zipkpcIfCU6Xp/iF5ydYTZkOyp0TwWj5Jax8ONGxmEZK5fYGrLWrN
         wK6sc3d48/0MxnaQQQFWvm1LrXnwaWGM13HGF+1LLQ6ns6Qbl2red5pkOa50ZpQnvpo5
         xodFV0PFu3sbrpftBn06VtRW1SaoXQbffklp3b9JoAOPWKVKQv/XZbE21gNO4MnAaJiq
         lMMHIBwnjPHfFFqcZ4z5yUe/qv6FMRmU8fmFXgQZgc3tYZYWG7JpTJiTt9YKtMsLLvzJ
         lvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+vUe2aDbl1jQQYaBLQ0FlLUwR8pg911EhG/FXdJ85+Q=;
        b=GtHPbRynyeq4m5UkeK1dXHrFMNJekpnyDGqtsVGL/eiJOrc4BxA+AcG3QloPMF95T1
         WIHv+nmYDRjtOD8hYUkTYBelQRW0G1ihO8Wv0+Zgh19E4X3LakC8q4g3kuEx1i/kIVJY
         abKB4xbIDzIsuU7j0Z1Atef9gQr3FCIqoszOjKbf1P8+p16ovisndoTtSrhr/n4lDVoP
         mWEEURcnpooDDMFCKVY01OZyTM66zaEt85LmmBdxMpbNCNefoRBahU91Ecx8c/abXQEG
         V6Vj81Xj7j8zejv6gmq4qo5YONobtX+CbiDvk+QJVPqTleGYKtgwXwgsrD6OiFShW2bX
         jLIA==
X-Gm-Message-State: AOAM530TeUbSH32dzTTUcyWAa4L37X3rkqqDP93IzK+vmgp64iLBjLRf
        +YhMGP9hAX4Cx2br7ze7MIpop2GDSYs=
X-Google-Smtp-Source: ABdhPJzJ2mcwtMl0xN43otFZIw9klmRT2em4DA4PkNTeT9Zn5CyE7+PAnp+M9H91cziPeGEx1/lQxg==
X-Received: by 2002:a4a:4958:: with SMTP id z85mr8632600ooa.3.1616093741860;
        Thu, 18 Mar 2021 11:55:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f8sm703063oij.4.2021.03.18.11.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 11:55:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: add driver for NZXT Kraken X42/X52/X62/X72
To:     Jonas Malaco <jonas@protocubo.io>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210318164824.21374-1-jonas@protocubo.io>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8d59a1fe-e38d-3f1b-601d-26a9bcf7272f@roeck-us.net>
Date:   Thu, 18 Mar 2021 11:55:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210318164824.21374-1-jonas@protocubo.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 3/18/21 9:48 AM, Jonas Malaco wrote:
> These are "all-in-one" CPU liquid coolers that can be monitored and
> controlled through a proprietary USB HID protocol.
> 
> While the models have differently sized radiators and come with varying
> numbers of fans, they are all indistinguishable at the software level.
> > The driver exposes fan/pump speeds and coolant temperature through the
> standard hwmon sysfs interface.
> 
> Fan and pump control, while supported by the devices, are not currently
> exposed.  The firmware accepts up to 61 trip points per channel
> (fan/pump), but the same set of trip temperatures has to be maintained
> for both; with pwmX_auto_point_Y_temp attributes, users would need to
> maintain this invariant themselves.
> 
> Instead, fan and pump control, as well as LED control (which the device
> also supports for 9 addressable RGB LEDs on the CPU water block) are
> left for existing and already mature user-space tools, which can still
> be used alongside the driver, thanks to hidraw.  A link to one, which I
> also maintain, is provided in the documentation.
> 
> The implementation is based on USB traffic analysis.  It has been
> runtime tested on x86_64, both as a built-in driver and as a module.
> 
> Signed-off-by: Jonas Malaco <jonas@protocubo.io>
> ---
> 
> I was not sure whether to exhaustively check type, attr and channel in
> _is_visible/_read/_read_string.  Would it be preferred if those
> functions assumed that they would never be called for unsupported
> combinations, since that would be a programming error?
> 
> In practice, should kraken2_is_visible be simplified into
> 
> 	static umode_t kraken2_is_visible(...)
> 	{
> 		return 0444;
> 	}
> 
Yes, if nothing is optional, and all permissions are 0444.

> and should _read/_read_string go through similar (but not as effective)
> simplifications?
> 
Unless I am missing something, all the channel checks are unnecessary
and should be removed.

> On another note, the copyright dates back to 2019 because this driver
> was left to mature (and then was mostly forgotten about) in an
> out-of-tree repository.[1]
> 
> [1] https://github.com/liquidctl/liquidtux
> 
>  Documentation/hwmon/index.rst        |   1 +
>  Documentation/hwmon/nzxt-kraken2.rst |  42 ++++
>  MAINTAINERS                          |   7 +
>  drivers/hwmon/Kconfig                |  10 +
>  drivers/hwmon/Makefile               |   1 +
>  drivers/hwmon/nzxt-kraken2.c         | 279 +++++++++++++++++++++++++++
>  6 files changed, 340 insertions(+)
>  create mode 100644 Documentation/hwmon/nzxt-kraken2.rst
>  create mode 100644 drivers/hwmon/nzxt-kraken2.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index d4b422edbe3a..48bfa7887dd4 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -143,6 +143,7 @@ Hardware Monitoring Kernel Drivers
>     npcm750-pwm-fan
>     nsa320
>     ntc_thermistor
> +   nzxt-kraken2
>     occ
>     pc87360
>     pc87427
> diff --git a/Documentation/hwmon/nzxt-kraken2.rst b/Documentation/hwmon/nzxt-kraken2.rst
> new file mode 100644
> index 000000000000..94025de65a81
> --- /dev/null
> +++ b/Documentation/hwmon/nzxt-kraken2.rst
> @@ -0,0 +1,42 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver nzxt-kraken2
> +==========================
> +
> +Supported devices:
> +
> +* NZXT Kraken X42
> +* NZXT Kraken X52
> +* NZXT Kraken X62
> +* NZXT Kraken X72
> +
> +Author: Jonas Malaco
> +
> +Description
> +-----------
> +
> +This driver enables hardware monitoring support for NZXT Kraken X42/X52/X62/X72
> +all-in-one CPU liquid coolers.  Three sensors are available: fan speed, pump
> +speed and coolant temperature.
> +
> +Fan and pump control, while supported by the firmware, are not currently
> +exposed.  The addressable RGB LEDs, present in the integrated CPU water block
> +and pump head, are not supported either.  But both features can be found in
> +existing user-space tools (e.g. `liquidctl`_).
> +
> +.. _liquidctl: https://github.com/liquidctl/liquidctl
> +
> +Usage Notes
> +-----------
> +
> +As these are USB HIDs, the driver can be loaded automatically by the kernel and
> +supports hot swapping.
> +
> +Sysfs entries
> +-------------
> +
> +=======================	========================================================
> +fan1_input		Fan speed (in rpm)
> +fan2_input		Pump speed (in rpm)
> +temp1_input		Coolant temperature (in millidegrees Celsius)
> +=======================	========================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0635b30e467c..b8f9fc5eaf08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12911,6 +12911,13 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
>  S:	Supported
>  F:	drivers/nfc/nxp-nci
>  
> +NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
> +M:	Jonas Malaco <jonas@protocubo.io>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/nzxt-kraken2.rst
> +F:	drivers/hwmon/nzxt-kraken2.c
> +
>  OBJAGG
>  M:	Jiri Pirko <jiri@nvidia.com>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 54f04e61fb83..0ddc974b102e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1492,6 +1492,16 @@ config SENSORS_NSA320
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nsa320-hwmon.
>  
> +config SENSORS_NZXT_KRAKEN2
> +	tristate "NZXT Kraken X42/X51/X62/X72 liquid coolers"
> +	depends on USB_HID
> +	help
> +	  If you say yes here you get support for hardware monitoring for the
> +	  NZXT Kraken X42/X52/X62/X72 all-in-one CPU liquid coolers.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nzxt-kraken2.
> +
>  source "drivers/hwmon/occ/Kconfig"
>  
>  config SENSORS_PCF8591
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index fe38e8a5c979..59e78bc212cf 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -155,6 +155,7 @@ obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
>  obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
>  obj-$(CONFIG_SENSORS_NSA320)	+= nsa320-hwmon.o
>  obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
> +obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
>  obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
>  obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
>  obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
> diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
> new file mode 100644
> index 000000000000..1426310d6965
> --- /dev/null
> +++ b/drivers/hwmon/nzxt-kraken2.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * nzxt-kraken2.c - hwmon driver for NZXT Kraken X42/X52/X62/X72 coolers
> + *
> + * Copyright 2019  Jonas Malaco <jonas@protocubo.io>

Should probably be 2019 - 2021

> + */
> +
> +#include <asm/unaligned.h>
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +
> +#define STATUS_REPORT_ID	0x04
> +#define STATUS_USEFUL_SIZE	8
> +
> +static const char *const kraken2_temp_label[] = {
> +	"Coolant",
> +};
> +
> +static const char *const kraken2_fan_label[] = {
> +	"Fan",
> +	"Pump",
> +};
> +
> +struct kraken2_priv_data {
> +	struct hid_device *hid_dev;
> +	struct device *hwmon_dev;
> +
> +	spinlock_t lock; /* protects the last received status */
> +	u8 status[STATUS_USEFUL_SIZE];
> +};
> +
> +static umode_t kraken2_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_label:
> +			if (channel == 0)
> +				return 0444;
> +			return 0;
> +		}
> +		break;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +		case hwmon_fan_label:
> +			if (channel >= 0 && channel < 2)
> +				return 0444;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int kraken2_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	struct kraken2_priv_data *priv = dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			if (channel != 0)
> +				return -EOPNOTSUPP;
> +			/*
> +			 * The fractional byte has been observed to be in the
> +			 * interval [1,9], but some of these steps are also
> +			 * consistently skipped for certain integer parts.
> +			 *
> +			 * For the lack of a better idea, assume that the
> +			 * resolution is 0.1°C, and that the missing steps are
> +			 * artifacts of how the firmware processes the raw
> +			 * sensor data.
> +			 */
> +			spin_lock_irqsave(&priv->lock, flags);

Why would this need to disable interrupts ?

> +			*val = priv->status[1] * 1000 + priv->status[2] * 100;
> +			spin_unlock_irqrestore(&priv->lock, flags);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			if (channel < 0 || channel >= 2)
> +				return -EOPNOTSUPP;
> +			spin_lock_irqsave(&priv->lock, flags);

Why would this need to disable interrupts ?

> +			*val = get_unaligned_be16(priv->status + 3 + channel * 2);
> +			spin_unlock_irqrestore(&priv->lock, flags);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int kraken2_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			if (channel != 0)
> +				return -EOPNOTSUPP;
> +			*str = kraken2_temp_label[channel];
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_label:
> +			if (channel < 0 || channel >= 2)
> +				return -EOPNOTSUPP;
> +			*str = kraken2_fan_label[channel];
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_ops kraken2_hwmon_ops = {
> +	.is_visible = kraken2_is_visible,
> +	.read = kraken2_read,
> +	.read_string = kraken2_read_string,
> +};
> +
> +static const struct hwmon_channel_info *kraken2_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info kraken2_chip_info = {
> +	.ops = &kraken2_hwmon_ops,
> +	.info = kraken2_info,
> +};
> +
> +static int kraken2_raw_event(struct hid_device *hdev,
> +			     struct hid_report *report, u8 *data, int size)
> +{
> +	struct kraken2_priv_data *priv;
> +	unsigned long flags;
> +
> +	if (size < STATUS_USEFUL_SIZE || report->id != STATUS_REPORT_ID)
> +		return 0;
> +
> +	priv = hid_get_drvdata(hdev);
> +
> +	spin_lock_irqsave(&priv->lock, flags);

I don't see the point of disabling interrupts here and above.

Either case, the spinlocks are overkill. It would be much easier to
convert raw readings here into temperature and fan speed and store
the resulting values in struct kraken2_priv_data, and then to
just report it in the read functions. That would be much less costly
because the spinlock would not be needed at all, and calculations
would be done only once per event.

> +	memcpy(priv->status, data, STATUS_USEFUL_SIZE);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}

For my education: What triggers those events ? Are they reported
by the hardware autonomously whenever something changes ?
A comment at the top of the driver explaining how this works
might be useful.

Also, is there a way to initialize values during probe ? Otherwise
the driver would report values of 0 until the hardware reports
something.

> +
> +static int kraken2_probe(struct hid_device *hdev,
> +			 const struct hid_device_id *id)
> +{
> +	struct kraken2_priv_data *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->hid_dev = hdev;
> +	spin_lock_init(&priv->lock);
> +	hid_set_drvdata(hdev, priv);
> +
> +	ret = hid_parse(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hid parse failed with %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Enable hidraw so existing user-space tools can continue to work.
> +	 */
> +	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	if (ret) {
> +		hid_err(hdev, "hid hw start failed with %d\n", ret);
> +		goto fail_and_stop;
> +	}
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "hid hw open failed with %d\n", ret);
> +		goto fail_and_close;
> +	}
> +
> +	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
> +							  priv, &kraken2_chip_info,
> +							  NULL);
> +	if (IS_ERR(priv->hwmon_dev)) {
> +		ret = PTR_ERR(priv->hwmon_dev);
> +		hid_err(hdev, "hwmon registration failed with %d\n", ret);
> +		goto fail_and_close;
> +	}
> +
> +	return 0;
> +
> +fail_and_close:
> +	hid_hw_close(hdev);
> +fail_and_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void kraken2_remove(struct hid_device *hdev)
> +{
> +	struct kraken2_priv_data *priv = hid_get_drvdata(hdev);
> +
> +	hwmon_device_unregister(priv->hwmon_dev);
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id kraken2_table[] = {
> +	{ HID_USB_DEVICE(0x1e71, 0x170e) }, /* NZXT Kraken X42/X52/X62/X72 */
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(hid, kraken2_table);
> +
> +static struct hid_driver kraken2_driver = {
> +	.name = "nzxt-kraken2",
> +	.id_table = kraken2_table,
> +	.probe = kraken2_probe,
> +	.remove = kraken2_remove,
> +	.raw_event = kraken2_raw_event,
> +};
> +
> +static int __init kraken2_init(void)
> +{
> +	return hid_register_driver(&kraken2_driver);
> +}
> +
> +static void __exit kraken2_exit(void)
> +{
> +	hid_unregister_driver(&kraken2_driver);
> +}
> +
> +/*
> + * When compiled into the kernel, initialize after the hid bus.
> + */
> +late_initcall(kraken2_init);
> +module_exit(kraken2_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jonas Malaco <jonas@protocubo.io>");
> +MODULE_DESCRIPTION("Hwmon driver for NZXT Kraken X42/X52/X62/X72 coolers");
> 
> base-commit: d8a08585259268e7b5305d04422a59d713719ccb
> 

