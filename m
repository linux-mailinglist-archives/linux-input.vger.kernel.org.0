Return-Path: <linux-input+bounces-5183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21EE93ED95
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 08:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10EB2B20CC9
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 06:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B850484D29;
	Mon, 29 Jul 2024 06:40:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A236284052;
	Mon, 29 Jul 2024 06:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.224.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722235258; cv=none; b=jM3b5ugUaReRyJnHcVUQ8avrFde9z8ByAX4JbG/xBCyr+mEgXVtT9RD0TsStXAxkOsm8bjPs0UkcACdwKv7wcVctSOJIfPPNEnr7hQU9X/LBC+brFBKVgn4nJzhSuZN83oDrFECnQUuyWyGN6Mi1LfgQiyuJ7UZQLFhtCoKAThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722235258; c=relaxed/simple;
	bh=x5FdFI8UNAApHvTVx7N8rwm526f3zkx/HepVYYmXwt4=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=mWlReJoCk7bRRXTUs2rzifvhTnoSYDR4n3UJrnvowA8nP18FCouLpej1beVFk+EC4k72YLd2tZm7XfgY31iUDGAvcpXAcU18fKuozkr8PJOScsr63BbsBbKjvli6V+E5+pF2GNWjwaCpqc6lnJcklt9eH485eB7pclUtEIM54ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=91.198.224.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=1954343a27=fe@dev.tdt.de>)
	id 1sYJo5-009RoD-Df; Mon, 29 Jul 2024 08:24:29 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1sYJo4-00EKvn-Kw; Mon, 29 Jul 2024 08:24:28 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 31333240041;
	Mon, 29 Jul 2024 08:24:28 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 04C26240036;
	Mon, 29 Jul 2024 08:24:28 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 1E66B20A38;
	Mon, 29 Jul 2024 08:24:27 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 29 Jul 2024 08:24:26 +0200
From: Florian Eckert <fe@dev.tdt.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
 dmitry.torokhov@gmail.com, pavel@ucw.cz, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ukleinek@debian.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 3/7] leds: add driver for LEDs from qnap-mcu devices
In-Reply-To: <20240728211751.2160123-4-heiko@sntech.de>
References: <20240728211751.2160123-1-heiko@sntech.de>
 <20240728211751.2160123-4-heiko@sntech.de>
Message-ID: <f7d10147a643f4d0d7cf2decbe490315@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate-type: clean
X-purgate-ID: 151534::1722234269-16C4CD11-DF4FFB49/0/0
X-purgate: clean

Hello Heiko,

> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index effdfc6f1e951..27eb6cd827610 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_LEDS_PCA995X)		+= leds-pca995x.o
>  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>  obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>  obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
> +obj-$(CONFIG_LEDS_QNAP_MCU)		+= leds-qnap-mcu.o
>  obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
>  obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
>  obj-$(CONFIG_LEDS_SUN50I_A100)		+= leds-sun50i-a100.o
> diff --git a/drivers/leds/leds-qnap-mcu.c 
> b/drivers/leds/leds-qnap-mcu.c
> new file mode 100644
> index 0000000000000..e3244923759d2
> --- /dev/null
> +++ b/drivers/leds/leds-qnap-mcu.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Driver for LEDs found on QNAP MCU devices
> + *
> + * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/mfd/qnap-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <uapi/linux/uleds.h>
> +
> +enum qnap_mcu_err_led_mode {
> +	QNAP_MCU_ERR_LED_ON = 0,
> +	QNAP_MCU_ERR_LED_OFF = 1,
> +	QNAP_MCU_ERR_LED_BLINK_FAST = 2,
> +	QNAP_MCU_ERR_LED_BLINK_SLOW = 3,
> +};
> +
> +struct qnap_mcu_err_led {
> +	struct qnap_mcu *mcu;
> +	struct led_classdev cdev;
> +	u8 num;
> +	u8 mode;
> +};
> +
> +static inline struct qnap_mcu_err_led *
> +		cdev_to_qnap_mcu_err_led(struct led_classdev *led_cdev)
> +{
> +	return container_of(led_cdev, struct qnap_mcu_err_led, cdev);
> +}
> +
> +static int qnap_mcu_err_led_set(struct led_classdev *led_cdev,
> +				enum led_brightness value)
> +{
> +	struct qnap_mcu_err_led *err_led = 
> cdev_to_qnap_mcu_err_led(led_cdev);
> +	u8 cmd[] = {
> +		[0] = 0x40,
> +		[1] = 0x52,
> +		[2] = 0x30 + err_led->num,
> +		[3] = 0x30
> +	};
> +
> +	/*
> +	 * If the led is off, turn it on. Otherwise don't disturb
> +	 * a possible set blink-mode.
> +	 */
> +	if (value == 0)
> +		err_led->mode = QNAP_MCU_ERR_LED_OFF;
> +	else if (err_led->mode == QNAP_MCU_ERR_LED_OFF)
> +		err_led->mode = QNAP_MCU_ERR_LED_ON;
> +
> +	cmd[3] = 0x30 + err_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(err_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_err_led_blink_set(struct led_classdev *led_cdev,
> +				      unsigned long *delay_on,
> +				      unsigned long *delay_off)
> +{
> +	struct qnap_mcu_err_led *err_led = 
> cdev_to_qnap_mcu_err_led(led_cdev);
> +	u8 cmd[] = {
> +		[0] = 0x40,
> +		[1] = 0x52,
> +		[2] = 0x30 + err_led->num,
> +		[3] = 0x30
> +	};
> +
> +	/* LED is off, nothing to do */
> +	if (err_led->mode == QNAP_MCU_ERR_LED_OFF)
> +		return 0;
> +
> +	if (*delay_on < 500) {
> +		*delay_on = 100;
> +		*delay_off = 100;
> +		err_led->mode = QNAP_MCU_ERR_LED_BLINK_FAST;
> +	} else {
> +		*delay_on = 500;
> +		*delay_off = 500;
> +		err_led->mode = QNAP_MCU_ERR_LED_BLINK_SLOW;
> +	}
> +
> +	cmd[3] = 0x30 + err_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(err_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_register_err_led(struct device *dev, struct
> qnap_mcu *mcu, int num)
> +{
> +	struct qnap_mcu_err_led *err_led;
> +	char tmp_buf[LED_MAX_NAME_SIZE];
> +	int ret;
> +
> +	err_led = devm_kzalloc(dev, sizeof(*err_led), GFP_KERNEL);
> +	if (!err_led)
> +		return -ENOMEM;
> +
> +	err_led->mcu = mcu;
> +	err_led->num = num;
> +	err_led->mode = QNAP_MCU_ERR_LED_OFF;
> +
> +	snprintf(tmp_buf, LED_MAX_NAME_SIZE, "hdd%d:red:status", num + 1);
> +	err_led->cdev.name = tmp_buf;

Should not the memory have to be allocated here via 'kzalloc' for 
'err_led->cdev.name'?
After leaving the function, tmp_buf is no longer on the stack?


> +
> +	err_led->cdev.brightness_set_blocking = qnap_mcu_err_led_set;
> +	err_led->cdev.blink_set = qnap_mcu_err_led_blink_set;
> +	err_led->cdev.brightness = 0;
> +	err_led->cdev.max_brightness = 1;
> +
> +	ret = devm_led_classdev_register(dev, &err_led->cdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register hdd led %d", 
> num);
> +
> +	return qnap_mcu_err_led_set(&err_led->cdev, 0);
> +}
> +
> +enum qnap_mcu_usb_led_mode {
> +	QNAP_MCU_USB_LED_ON = 1,
> +	QNAP_MCU_USB_LED_OFF = 3,
> +	QNAP_MCU_USB_LED_BLINK = 2,
> +};
> +
> +struct qnap_mcu_usb_led {
> +	struct qnap_mcu *mcu;
> +	struct led_classdev cdev;
> +	u8 mode;
> +};
> +
> +static inline struct qnap_mcu_usb_led *
> +		cdev_to_qnap_mcu_usb_led(struct led_classdev *led_cdev)
> +{
> +	return container_of(led_cdev, struct qnap_mcu_usb_led, cdev);
> +}
> +
> +static int qnap_mcu_usb_led_set(struct led_classdev *led_cdev,
> +				enum led_brightness value)
> +{
> +	struct qnap_mcu_usb_led *usb_led = 
> cdev_to_qnap_mcu_usb_led(led_cdev);
> +	u8 cmd[] = {
> +		[0] = 0x40,
> +		[1] = 0x43,
> +		[2] = 0
> +	};
> +
> +	/*
> +	 * If the led is off, turn it on. Otherwise don't disturb
> +	 * a possible set blink-mode.
> +	 */
> +	if (value == 0)
> +		usb_led->mode = QNAP_MCU_USB_LED_OFF;
> +	else if (usb_led->mode == QNAP_MCU_USB_LED_OFF)
> +		usb_led->mode = QNAP_MCU_USB_LED_ON;
> +
> +	/* byte 3 is shared between the usb led target and setting the mode 
> */
> +	cmd[2] = 0x44 | usb_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(usb_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_usb_led_blink_set(struct led_classdev *led_cdev,
> +				      unsigned long *delay_on,
> +				      unsigned long *delay_off)
> +{
> +	struct qnap_mcu_usb_led *usb_led = 
> cdev_to_qnap_mcu_usb_led(led_cdev);
> +	u8 cmd[] = {
> +		[0] = 0x40,
> +		[1] = 0x43,
> +		[2] = 0
> +	};
> +
> +	/* LED is off, nothing to do */
> +	if (usb_led->mode == QNAP_MCU_USB_LED_OFF)
> +		return 0;
> +
> +	*delay_on = 250;
> +	*delay_off = 250;
> +	usb_led->mode = QNAP_MCU_USB_LED_BLINK;
> +
> +	/* byte 3 is shared between the usb led target and setting the mode 
> */
> +	cmd[2] = 0x44 | usb_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(usb_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_register_usb_led(struct device *dev, struct 
> qnap_mcu *mcu)
> +{
> +	struct qnap_mcu_usb_led *usb_led;
> +	int ret;
> +
> +	usb_led = devm_kzalloc(dev, sizeof(*usb_led), GFP_KERNEL);
> +	if (!usb_led)
> +		return -ENOMEM;
> +
> +	usb_led->mcu = mcu;
> +	usb_led->mode = QNAP_MCU_USB_LED_OFF;
> +	usb_led->cdev.name = "usb:blue:disk";
> +	usb_led->cdev.brightness_set_blocking = qnap_mcu_usb_led_set;
> +	usb_led->cdev.blink_set = qnap_mcu_usb_led_blink_set;
> +	usb_led->cdev.brightness = 0;
> +	usb_led->cdev.max_brightness = 1;
> +
> +	ret = devm_led_classdev_register(dev, &usb_led->cdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register usb led");
> +
> +	return qnap_mcu_usb_led_set(&usb_led->cdev, 0);
> +}
> +
> +static int qnap_mcu_leds_probe(struct platform_device *pdev)
> +{
> +	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
> +	const struct qnap_mcu_variant *variant = 
> qnap_mcu_get_variant_data(mcu);
> +	int ret, i;
> +
> +	for (i = 0; i < variant->num_drives; i++) {
> +		ret = qnap_mcu_register_err_led(&pdev->dev, mcu, i);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					"failed to register error led %d\n", i);
> +	}
> +
> +	if (variant->usb_led) {
> +		ret = qnap_mcu_register_usb_led(&pdev->dev, mcu);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					"failed to register usb led %d\n", i);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qnap_mcu_leds_driver = {
> +	.probe = qnap_mcu_leds_probe,
> +	.driver = {
> +		.name = "qnap-mcu-leds",
> +	},
> +};
> +module_platform_driver(qnap_mcu_leds_driver);
> +
> +MODULE_ALIAS("platform:qnap-mcu-leds");
> +MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
> +MODULE_DESCRIPTION("QNAP MCU LEDs driver");
> +MODULE_LICENSE("GPL");

