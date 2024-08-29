Return-Path: <linux-input+bounces-5947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF6964BAF
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 18:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40361C22B30
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 16:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E33F1B531B;
	Thu, 29 Aug 2024 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3aSAJAm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366A1B3B32;
	Thu, 29 Aug 2024 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724948832; cv=none; b=X1AOIxd4SUUepJCXXC21gvRCtitEJ3s94xWP96Yt9OGbXvraZ7gCoZLoco2Pi8NL6uL+HdWXebYQCpuW3RE67LVMRt1s6dD/YpxIXY2g0Z9lX+b8CHpjmgbx2jI/FPf1vrLranvDFyrxX2cZi4XXlMcYH3F0F6tEcMRhQa/d2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724948832; c=relaxed/simple;
	bh=rUK7cYrfp3ANOIDU3rLaYOEYkyvnUKtRN7aNsL8GQDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ys7E0kmPQI/y7CRyNF4qNS7bJx0s2bYP0acBo513NG57ata5eTT3I7eT/vpji96EtT+c7ZBCSoW0k4Zli2ukjc8uWO2+L5s2WmBha4NjbRAGdD84W4yYD1Lje3m/CTV0+nD7Uy3FrdUHBf5Aoun378uEq27/spZu7KnCIzzi95o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3aSAJAm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8BFC4CEC2;
	Thu, 29 Aug 2024 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724948832;
	bh=rUK7cYrfp3ANOIDU3rLaYOEYkyvnUKtRN7aNsL8GQDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3aSAJAmkUXpSwt1M+icllnaM5UhiPpzeCpja5FEKOILNoHE1faNT1islB9c6BLzx
	 Zr7sVdo+BZ4PvsEmCsflfnl/qt3C5gEGlRvHzB7aZnS43ZI7rtlS009Xm50T1zpjS7
	 MsYc70pcCEDEQCWonNnsm73gyxnunmxfdf4vsX7Pf8t2XT5S/mYPo3/g9S/qBPhODn
	 GTFv2MbII2PA9H8Gk3xTFxcEzSf+1rE3nhDSUhQEvpON0zhy0S85i1P4OjXiNKaw0m
	 6tB2Psy+e0FKIiWS5xvXYoKDy478U2Ao5kbQ82ypDGhDa6jj5mflzN35tq91Lsx2jO
	 L2iAgG//6rHqw==
Date: Thu, 29 Aug 2024 17:27:05 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net, dmitry.torokhov@gmail.com,
	pavel@ucw.cz, ukleinek@debian.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 3/7] leds: add driver for LEDs from qnap-mcu devices
Message-ID: <20240829162705.GR6858@google.com>
References: <20240825203235.1122198-1-heiko@sntech.de>
 <20240825203235.1122198-4-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240825203235.1122198-4-heiko@sntech.de>

On Sun, 25 Aug 2024, Heiko Stuebner wrote:

> This adds a driver that connects to the qnap-mcu mfd driver and provides
> access to the LEDs on it.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/leds/Kconfig         |  11 ++
>  drivers/leds/Makefile        |   1 +
>  drivers/leds/leds-qnap-mcu.c | 226 +++++++++++++++++++++++++++++++++++
>  4 files changed, 239 insertions(+)
>  create mode 100644 drivers/leds/leds-qnap-mcu.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fbd2d953da4..4dff0e237f22 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18657,6 +18657,7 @@ F:	drivers/media/tuners/qm1d1c0042*
>  QNAP MCU DRIVER
>  M:	Heiko Stuebner <heiko@sntech.de>
>  S:	Maintained
> +F:	drivers/leds/leds-qnap-mcu.c
>  F:	drivers/mfd/qnap-mcu.c
>  F:	include/linux/qnap-mcu.h
>  
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 8d9d8da376e4..9a337478dd80 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -580,6 +580,17 @@ config LEDS_PCA995X
>  	  LED driver chips accessed via the I2C bus. Supported
>  	  devices include PCA9955BTW, PCA9952TW and PCA9955TW.
>  
> +config LEDS_QNAP_MCU
> +	tristate "LED Support for QNAP MCU controllers"
> +	depends on LEDS_CLASS
> +	depends on MFD_QNAP_MCU
> +	help
> +	  This option enables support for LEDs available on embedded
> +	  controllers used in QNAP NAS devices.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called qnap-mcu-leds.
> +
>  config LEDS_WM831X_STATUS
>  	tristate "LED support for status LEDs on WM831x PMICs"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 18afbb5a23ee..c6f74865d729 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_LEDS_PCA995X)		+= leds-pca995x.o
>  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>  obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>  obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
> +obj-$(CONFIG_LEDS_QNAP_MCU)		+= leds-qnap-mcu.o
>  obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
>  obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
>  obj-$(CONFIG_LEDS_SUN50I_A100)		+= leds-sun50i-a100.o
> diff --git a/drivers/leds/leds-qnap-mcu.c b/drivers/leds/leds-qnap-mcu.c
> new file mode 100644
> index 000000000000..0723ec52e4c5
> --- /dev/null
> +++ b/drivers/leds/leds-qnap-mcu.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +

Superfluous line.

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
> +	char name[LED_MAX_NAME_SIZE];
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

'value' is a terrible variable name.

Please describe the data.  'brightness' seems appropriate.

> +{
> +	struct qnap_mcu_err_led *err_led = cdev_to_qnap_mcu_err_led(led_cdev);
> +	u8 cmd[] = { 0x40, 0x52, 0x30 + err_led->num, 0x30 };

Really not fan of these magic values being used raw like this.

> +	/* Don't disturb a possible set blink-mode if LED is already on */

Why not save cycles and return if blink mode is already enabled?

> +	if (value == 0)
> +		err_led->mode = QNAP_MCU_ERR_LED_OFF;
> +	else if (err_led->mode == QNAP_MCU_ERR_LED_OFF)
> +		err_led->mode = QNAP_MCU_ERR_LED_ON;

Then you can do:

	err_led->mode = value ? QNAP_MCU_ERR_LED_ON : QNAP_MCU_ERR_LED_OFF;

> +	cmd[3] = 0x30 + err_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(err_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_err_led_blink_set(struct led_classdev *led_cdev,
> +				      unsigned long *delay_on,
> +				      unsigned long *delay_off)
> +{
> +	struct qnap_mcu_err_led *err_led = cdev_to_qnap_mcu_err_led(led_cdev);
> +	u8 cmd[] = { 0x40, 0x52, 0x30 + err_led->num, 0x30 };
> +
> +	/* LED is off, nothing to do */
> +	if (err_led->mode == QNAP_MCU_ERR_LED_OFF)
> +		return 0;
> +
> +	if (*delay_on < 500) {

Setting delay_on based on the current value of delay_on sounds sketchy.

> +		*delay_on = 100;
> +		*delay_off = 100;
> +		err_led->mode = QNAP_MCU_ERR_LED_BLINK_FAST;
> +	} else {
> +		*delay_on = 500;
> +		*delay_off = 500;
> +		err_led->mode = QNAP_MCU_ERR_LED_BLINK_SLOW;
> +	}

How do you change from a fast to a slow blinking LED and back again?

> +	cmd[3] = 0x30 + err_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(err_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_register_err_led(struct device *dev, struct qnap_mcu *mcu, int num)

What's num?  I should be able to answer that by the nomenclature.

> +{
> +	struct qnap_mcu_err_led *err_led;
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
> +	snprintf(err_led->name, LED_MAX_NAME_SIZE, "hdd%d:red:status", num + 1);

scnprintf()?

> +	err_led->cdev.name = err_led->name;
> +
> +	err_led->cdev.brightness_set_blocking = qnap_mcu_err_led_set;
> +	err_led->cdev.blink_set = qnap_mcu_err_led_blink_set;
> +	err_led->cdev.brightness = 0;
> +	err_led->cdev.max_brightness = 1;
> +
> +	ret = devm_led_classdev_register(dev, &err_led->cdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register hdd led %d", num);

"HDD LED"

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
> +	struct qnap_mcu_usb_led *usb_led = cdev_to_qnap_mcu_usb_led(led_cdev);
> +	u8 cmd[] = { 0x40, 0x43, 0 };
> +
> +	/*
> +	 * If the led is off, turn it on. Otherwise don't disturb

"LED"

> +	 * a possible set blink-mode.
> +	 */
> +	if (value == 0)
> +		usb_led->mode = QNAP_MCU_USB_LED_OFF;
> +	else if (usb_led->mode == QNAP_MCU_USB_LED_OFF)
> +		usb_led->mode = QNAP_MCU_USB_LED_ON;

Same suggestions as above.

> +	/* byte 3 is shared between the usb led target and setting the mode */

"Byte" for two reasons.  Firstly because it's the correct capitalisation
of Byte and secondly because it's the start of a sentence.

"USB" and "LED" throughout please.

> +	cmd[2] = 0x44 | usb_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(usb_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_usb_led_blink_set(struct led_classdev *led_cdev,
> +				      unsigned long *delay_on,
> +				      unsigned long *delay_off)
> +{
> +	struct qnap_mcu_usb_led *usb_led = cdev_to_qnap_mcu_usb_led(led_cdev);
> +	u8 cmd[] = { 0x40, 0x43, 0 };
> +
> +	/* LED is off, nothing to do */
> +	if (usb_led->mode == QNAP_MCU_USB_LED_OFF)
> +		return 0;
> +
> +	*delay_on = 250;
> +	*delay_off = 250;
> +	usb_led->mode = QNAP_MCU_USB_LED_BLINK;
> +
> +	/* byte 3 is shared between the usb led target and setting the mode */
> +	cmd[2] = 0x44 | usb_led->mode;
> +
> +	return qnap_mcu_exec_with_ack(usb_led->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_register_usb_led(struct device *dev, struct qnap_mcu *mcu)
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
> +	const struct qnap_mcu_variant *variant = qnap_mcu_get_variant_data(mcu);

Grab this from platform_data.

> +	int ret, i;
> +
> +	for (i = 0; i < variant->num_drives; i++) {

You can use:

	for (int i = 0; ..

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

The 'i' here looks like a copy/paste error.

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
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

