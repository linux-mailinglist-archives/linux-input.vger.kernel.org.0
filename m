Return-Path: <linux-input+bounces-11750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C2FA88070
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 14:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3BDD3AA60C
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A912625F964;
	Mon, 14 Apr 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJVBPo+e"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75132190057
	for <linux-input@vger.kernel.org>; Mon, 14 Apr 2025 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634123; cv=none; b=eAgArX7889Y/M/PtwhEEPAjDlpzHpTviBr24WUj8tQc3rPrIpvVW1Zm2rBoSERay5SWbXIn6+bJIVulAgkhuIcvK6PysF8pAjh6Wtu9YaTf50FOI9XI9qr5UhW2szQ0Q2y3GnIFZ8NIN898dEx5Hq1D+BqyhlC7Dy9G0migJXvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634123; c=relaxed/simple;
	bh=KXiXct5D82WjzPQ03XzTsMJcwfBjZVK3WG4Zj5yoCaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAafrjc4fc0PUFVn4YC/p5cUYNu86BNM0afmT4uUcTymcaKTPogqTCsrhK9yY/SIW86E8WtLCPmWwWp2XIw7VQmVQn11eRqsp7Llsc4uZBdlmAoypLsAvXLRhMvjNrTYBx+sMnwN3Pb7KdYzM5ERdO1GfzYtyPDTQGeonLsyLjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KJVBPo+e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744634120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reQeZAEsae+LBDDlNWSP8kl3eTjKxXOtr2fdg8qUz6Q=;
	b=KJVBPo+eHoVEsRA0I6PEMq/X2TGJ/teNvebWpWYsdjiasX4W/YAWyKfnizHpK2YH+wG7s+
	nQNcVe8+q6CHTiy6tQ5J2oBXk5VXJehFlJei5/DkCY78C+cKobtJU/bD3ogarnoDQcqwKg
	XxIE5vdGDPpRb+wOde9DIstNLb19RjE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-IxLQubHVOie-G8O2LI1xoQ-1; Mon, 14 Apr 2025 08:35:18 -0400
X-MC-Unique: IxLQubHVOie-G8O2LI1xoQ-1
X-Mimecast-MFC-AGG-ID: IxLQubHVOie-G8O2LI1xoQ_1744634118
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5cd9f3f7aso4139010a12.2
        for <linux-input@vger.kernel.org>; Mon, 14 Apr 2025 05:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634118; x=1745238918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reQeZAEsae+LBDDlNWSP8kl3eTjKxXOtr2fdg8qUz6Q=;
        b=o3uQyd4AzxC2yifrBFExHwNZCaIXimxXLn52K7dz/FZah8AfrcxxjTIuoMYolyinSG
         ycAX0B4yACt7ApEk7oFNrs3/9eUvMIzzUDOS++TyBuRABtvh+kH1JrMDBnm7zHSpya6h
         rfTmGq/LN+65sl5LD0EegaU9Rk+gJ4DKfZtEPYXS9Hs3FkqUO3SVXJos/pjcF/hnDt9k
         rVrH4Izcqvmy/Iydx28JzUlExVbVVD1h9k23/0SA11nKXpV1iWBufjkk1X0F0Eoxsc5H
         qLh27JaHLLq9YsiFa0ob6w+wSSuqLtMevtreLWAi8e0g4j6zjQqicTxF3R5oG9zejHGr
         zNqA==
X-Gm-Message-State: AOJu0Yx6vlMSR7hfJ+gaPOvAP+IAFn7h0CWg4R4kS9mcCdS+/2NXiwxZ
	miCUZZz4dJf1z8gMNEQJIpZJjZFa9jAGqOVP8iKEAxg8Wqiw7rWcq0WwRomdlj9EO8MNWy7F8Xt
	jUuc1Pl7pJMRdw99qsgL6Ul0Su47cpIqlYmdr6QXxjeHONGxMc8LPmo2L3cBf
X-Gm-Gg: ASbGncujTDGT4/wr99osiOjhfCGwbx4Lcee2M2Vm8zk+LTc5C8qdm7+nGBqwY0EMqjh
	gr1aFxHEHFh/EXCnvrna9DObbrpB4SnJLMAsSw36ZCLaLawwTpT0AzSJXjhYeOIi1S4N7JCdkxZ
	ZB7ltjtHG0cU4FmD8l/mZU8zIU09Ofa2wpJDbB9nEKvB9fiJ2cyHd+fki4CQc0p7TKj9QxD2NRq
	Vze0izjV4b5Vwyi6bL9XOtNfogPVCOvLLVFa5zacuzqTx0HI/OoDT5ztjDXz2VG23clhcTW0GGT
	m8xllpkbwckvKyQ=
X-Received: by 2002:a17:907:d26:b0:ac3:aae:40c6 with SMTP id a640c23a62f3a-acad3456e96mr1066834966b.8.1744634117505;
        Mon, 14 Apr 2025 05:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4diTZepj0Ibob17FfX1D4DwclODi97c5RCtOfJGgBD8bjmxxpLuqVLEKi9/FsWuzjhP7a9g==
X-Received: by 2002:a17:907:d26:b0:ac3:aae:40c6 with SMTP id a640c23a62f3a-acad3456e96mr1066832166b.8.1744634116977;
        Mon, 14 Apr 2025 05:35:16 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7f7dsm899269566b.180.2025.04.14.05.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 05:35:16 -0700 (PDT)
Message-ID: <e085b24a-bd53-4781-a6db-96f597a374cf@redhat.com>
Date: Mon, 14 Apr 2025 14:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] input: misc: Add as1895 hall sensor driver
To: Wentong Wu <wentongw@amazon.com>, dmitry.torokhov@gmail.com,
 sakari.ailus@linux.intel.com, Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org, Calvin Fang <fangtianwen@huaqin.com>
References: <20250411172410.25406-1-wentongw@amazon.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250411172410.25406-1-wentongw@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Wentong,

On 11-Apr-25 19:23, Wentong Wu wrote:
> The as1895 is designed for omnipolar detection hall-effect
> application, such as cover switch, contactless switch, solid
> state switch and lid close sensor etc battery operation.
> 
> When the magnetic flux density (B) is larger than operate
> point (BOP), the output will be turned on (low), the output
> is held until the magnetic flux density (B) is lower than
> release point (BRP), then turn off (high). And the connected
> GPIO will trigger interrupts to CPU according to the output
> change of as1895.
> 
> This driver reports the magnetic field change of as1895 via
> input subsystem to notify user space system suspend/resume
> status. It can alse report the state change to the external
> connectors via the Extcon (External Connector) subsystem.
> 
> Tested-by: Calvin Fang <fangtianwen@huaqin.com>
> Signed-off-by: Wentong Wu <wentongw@amazon.com>

Using an extcon device here feels weird/wrong. In an offlist
discussion about this you mentioned that:

> Could you please share more about the extcon? I just use extcon
> to notify other drivers the status change.

"extcon" stands for external connector, it is mainly designed for use
with micro-usb and/or 3.5 mm jack *connectors* to indicate if there is
something or nothing plugged in and if something is plugged in what
it is (e.g. charger/ USB-device / USB-host connected, or microphone/
headphones/headset/line-in/line-out/rs232-over-jack connected).

Since your LID switch is not a connector of any kind using extcon for
this is clearly wrong.

Also why do other drivers need to respond to the LID switch, typically
the LID switch state is reported to userspace and userspace will then
decide to suspend the whole system, or if an external display is
connected and active, to ignore the LID switch. So other drivers will
get their suspend callback called if they need to act on the LID switch.

If other drivers really need to respond to the LID switch for some reason
they can install an in kernel input-listener, see: net/rfkill/input.c for
an example, especially how that code calls input_register_handler().

As already mentioned by Jeff in his review just to turn a GPIO into
an input-device reporting LID_SW you do not need a new driver, you can
do this with the proper devicetree description of the switch in combination
with the existing gpio-keys driver.

So all in all it seems that you do not need this driver at all.

Regards,

Hans







> ---
>  drivers/input/misc/Kconfig  |   9 ++
>  drivers/input/misc/Makefile |   1 +
>  drivers/input/misc/as1895.c | 193 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 203 insertions(+)
>  create mode 100644 drivers/input/misc/as1895.c
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 6a852c76331b..6ba26052354b 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -956,4 +956,13 @@ config INPUT_STPMIC1_ONKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stpmic1_onkey.
>  
> +config INPUT_AS1895
> +	tristate "AS1895 hall sensor support"
> +	depends on GPIOLIB || COMPILE_TEST
> +	help
> +	  Say Y here if you have a as1895 hall sensor connected to a GPIO pin.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called as1895.
> +
>  endif
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index 4f7f736831ba..38b364a6c8c1 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -92,3 +92,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
>  obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
>  obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
>  obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
> +obj-$(CONFIG_INPUT_AS1895)		+= as1895.o
> diff --git a/drivers/input/misc/as1895.c b/drivers/input/misc/as1895.c
> new file mode 100644
> index 000000000000..d87318f1bda4
> --- /dev/null
> +++ b/drivers/input/misc/as1895.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + */
> +
> +#include <linux/extcon-provider.h>
> +#include <linux/gpio.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +/* Timeout value for processing the wakeup event */
> +#define AS1895_WAKEUP_TIMEOUT_MS 100
> +
> +#define AS1895_DRV_NAME "AMZN-AS1895"
> +
> +struct as1895_dev {
> +	struct input_dev *input;
> +	struct extcon_dev *edev;
> +	struct wakeup_source *ws;
> +
> +	/* the connected gpio pin number */
> +	int gpio_pin;
> +	int irq;
> +};
> +
> +static const unsigned int as1895_cable[] = {
> +	EXTCON_MECHANICAL,
> +	EXTCON_NONE,
> +};
> +
> +static irqreturn_t as1895_irq_thread_handler(int irq, void *data)
> +{
> +	struct as1895_dev *as1895 = (struct as1895_dev *)data;
> +	struct input_dev *input = as1895->input;
> +	int gpio_val;
> +
> +	/* allow user space to consume the event */
> +	__pm_wakeup_event(as1895->ws, AS1895_WAKEUP_TIMEOUT_MS);
> +
> +	gpio_val = gpio_get_value(as1895->gpio_pin);
> +
> +	extcon_set_state_sync(as1895->edev, EXTCON_MECHANICAL,
> +			      gpio_val ? false : true);
> +
> +	input_report_switch(input, SW_LID, !gpio_val);
> +
> +	input_sync(input);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int as1895_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct as1895_dev *as1895;
> +	unsigned long irqflags;
> +	int ret, gpio_pin;
> +	const char *name;
> +
> +	ret = of_property_read_string(node, "name", &name);
> +	if (ret)
> +		return ret;
> +
> +	gpio_pin = of_get_named_gpio(node, "int-gpio", 0);
> +	if (!gpio_is_valid(gpio_pin))
> +		return -EINVAL;
> +
> +	as1895 = devm_kzalloc(dev, sizeof(struct as1895_dev), GFP_KERNEL);
> +	if (!as1895)
> +		return -ENOMEM;
> +
> +	as1895->edev = devm_extcon_dev_allocate(dev, as1895_cable);
> +	if (IS_ERR(as1895->edev))
> +		return -ENOMEM;
> +
> +	/* register extcon device */
> +	ret = devm_extcon_dev_register(dev, as1895->edev);
> +	if (ret) {
> +		dev_err(dev, "can't register extcon device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	as1895->input = devm_input_allocate_device(dev);
> +	if (!as1895->input)
> +		return -ENOMEM;
> +
> +	as1895->input->name = name;
> +	set_bit(EV_SW, as1895->input->evbit);
> +	set_bit(SW_LID, as1895->input->swbit);
> +
> +	/* register input device */
> +	ret = input_register_device(as1895->input);
> +	if (ret) {
> +		dev_err(dev, "can't register input device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	as1895->ws = wakeup_source_register(NULL, name);
> +	if (!as1895->ws)
> +		return -ENOMEM;
> +
> +	as1895->gpio_pin = gpio_pin;
> +	as1895->irq = gpio_to_irq(gpio_pin);
> +
> +	irqflags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
> +
> +	ret = request_threaded_irq(as1895->irq, NULL,
> +				   as1895_irq_thread_handler,
> +				   irqflags, name, as1895);
> +	if (ret)
> +		goto err_unregister_ws;
> +
> +	platform_set_drvdata(pdev, as1895);
> +
> +	device_init_wakeup(dev, true);
> +
> +	return 0;
> +
> +err_unregister_ws:
> +	wakeup_source_unregister(as1895->ws);
> +
> +	return ret;
> +}
> +
> +static void as1895_remove(struct platform_device *pdev)
> +{
> +	struct as1895_dev *as1895 = platform_get_drvdata(pdev);
> +
> +	device_init_wakeup(&pdev->dev, false);
> +
> +	free_irq(as1895->irq, as1895);
> +
> +	wakeup_source_unregister(as1895->ws);
> +}
> +
> +static int as1895_suspend(struct device *dev)
> +{
> +	struct as1895_dev *as1895 = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(as1895->irq);
> +
> +	return 0;
> +}
> +
> +static int as1895_resume(struct device *dev)
> +{
> +	struct as1895_dev *as1895 = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(as1895->irq);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(as1895_pm_ops, as1895_suspend, as1895_resume);
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id as1895_of_match[] = {
> +	{ .compatible = "amazon,as1895-hall-sensor" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, as1895_of_match);
> +#endif
> +
> +static struct platform_driver as1895_driver = {
> +	.probe = as1895_probe,
> +	.remove = as1895_remove,
> +	.driver = {
> +		.name = AS1895_DRV_NAME,
> +		.pm = pm_sleep_ptr(&as1895_pm_ops),
> +		.of_match_table = of_match_ptr(as1895_of_match),
> +	}
> +};
> +
> +module_platform_driver(as1895_driver);
> +
> +MODULE_AUTHOR("Wentong Wu <wentongw@amazon.com>");
> +MODULE_AUTHOR("Zengjin Zhao <zzengjin@amazon.com>");
> +MODULE_AUTHOR("Xinkai Liu <xinka@amazon.com>");
> +MODULE_AUTHOR("Weihua Wu <wuweihua@amazon.com>");
> +MODULE_DESCRIPTION("Amazon as1895 hall sensor driver");
> +MODULE_LICENSE("GPL");


