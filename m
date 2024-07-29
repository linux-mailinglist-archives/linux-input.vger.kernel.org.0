Return-Path: <linux-input+bounces-5182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664693EA3A
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 02:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD651B210E3
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 00:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C21393;
	Mon, 29 Jul 2024 00:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLpIkGby"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D9372;
	Mon, 29 Jul 2024 00:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722211941; cv=none; b=ohpOmeveLzliHehq4VOEdLNgNdqX4MXFKf+xYPEsWpzrd40u9Q1NgxQmriefi7CeP602teP34yt6pQWb9zSjJ3dcY93U5jk6cTiFhckO+5EAq3Ao7qbc8+JGv0uKWYxISzhHwLDLYaZCpR+NuEw/i36E/7z8v2Qk4Ae80/KzeRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722211941; c=relaxed/simple;
	bh=/TwQ0FiiJh0E8/J2SSTHCENCIdB/WpQhzyIACSbtXLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvn3tMzifQVzvPfcOtYethsNLuFajwrzMClAmK7s7ERIFdJK6vkqtn648PDVCqxZvizEzIHSshtLzXpopsw0fgBLQSvOK6hDSm3XG2L3+I89mKhll6hvN++zMkI+e3wi0HU/cta+S2QHFotz3McZKg3c+hj1mXS4Y8/o7uSsCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLpIkGby; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-709465248b7so841131a34.3;
        Sun, 28 Jul 2024 17:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722211939; x=1722816739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wq6LCH29AVIUOnczbAjX+lNk/5KihGhzsCJtp4bWP14=;
        b=OLpIkGbyBKeXYYWuW6odWPdtdzdQn/UfG9oI3rvmVRk3U4fDTKwyv5plhcH7flFLcw
         VmbDfiJwi3kRiR2SsVtPUlwNcxzDnDWRHH0LMJ1xetHJ25/Rk9wbEeTcYtsKDCIexc8q
         2+120/sZP8YMGZOT/UT2laA5LboSJlloD3AyMMQgimVstjCFhkb0Urp1EN3U2DpQ6j0o
         irs3pU1+gQs5vDNuotSWezcdU2na35+MU5UzLsRReyjiVd6FFB1xP8uQ3N54QiA8gdIK
         brkdoTawdqxY5p0PSPt2fVtlwCinZmcWjOB0Pb83m3aQ5q9NabawctD/gGh82VIxRyNj
         ZPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722211939; x=1722816739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wq6LCH29AVIUOnczbAjX+lNk/5KihGhzsCJtp4bWP14=;
        b=WIwuTn0MqI7N3X7JfKO78MlHlB5TmzJhtti4rwBdFBqUeVb/R6GwuOo7Dqyw0Dogji
         Drp5oUC7Fxv9DuEYRxeHqg/RCan84DrpIpS7lN40BEMEckl/eShQXyyjPBY7rkN0iVr8
         fzaga/6CiUtysRjVJ/DtAqmUl6FYKRJBUhT/hUsoIf5Y6EocunigGJdQdHXT2kW3SMDV
         MjV/UC6HuwpLOgG42EXnVyZjmM+IfJBYE/B1aFBlx35Rptt2qh37XmjaqGisKbDfuP12
         OW64LcTmQ+lXeKEYpv7UM+YpIUn2AAopJL8w3DbIwdhrmYEdZs1HT2+vDkdLy/q3krvB
         0MIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTAj6YFmNjc4uDEjvSMfwivb5iq28ncL8tKbLTw7rjj+Qa0XlLoEle3OD906WMXQ+v8cxBQYQ67+yHfHKv6ecRiUZr9mRAIVkuhJek/ItKmvg6Qt8f0dLu6tAmGjJXDVC+I8d2VSSBycF1sYEol5y3BAFC4vZgKkylJW4Ado/db89xlmY6uasAaY/xrA8vFBxIMkqSHQpwlk9jNVCbxkKwYaN/VPSRjVpkGKDt2lwRD/OvRmw8F/jez2az7DwG
X-Gm-Message-State: AOJu0YwGk08zsu331O3CIygLIdjsTkedqzrM+wse04Sc91S6DPH0jda9
	6jj0L3iPd1IWggmxjuZW1ToisueHBmqYTQhNZ1aIdh5JRfLAn5U+
X-Google-Smtp-Source: AGHT+IGVyP6gbXtVMP8ZYuvJnPbXecyEUUCdfpDFZwJFJscmplOk9XdMFLdqjqofeRs+8ynqhon/yw==
X-Received: by 2002:a05:6830:2714:b0:709:3b82:7680 with SMTP id 46e09a7af769-70940c1aa9fmr9821703a34.19.1722211938803;
        Sun, 28 Jul 2024 17:12:18 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:74de:62d6:bed2:4c63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73eb9b1sm9153999a91.28.2024.07.28.17.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 17:12:18 -0700 (PDT)
Date: Sun, 28 Jul 2024 17:12:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, jdelvare@suse.com, linux@roeck-us.net, pavel@ucw.cz,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ukleinek@debian.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 4/7] Input: add driver for the input part of qnap-mcu
 devices
Message-ID: <ZqbeX923IR3tp5Ns@google.com>
References: <20240728211751.2160123-1-heiko@sntech.de>
 <20240728211751.2160123-5-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240728211751.2160123-5-heiko@sntech.de>

Hi Heiko,

On Sun, Jul 28, 2024 at 11:17:48PM +0200, Heiko Stuebner wrote:
> The MCU controls the power-button and beeper, so expose them as input
> device. There is of course no interrupt line, so the status of the
> power-button needs to be polled. To generate an event the power-button
> also needs to be held for 1-2 seconds, so the polling interval does
> not need to be overly fast.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/input/misc/Kconfig          |  12 +++
>  drivers/input/misc/Makefile         |   1 +
>  drivers/input/misc/qnap-mcu-input.c | 156 ++++++++++++++++++++++++++++
>  4 files changed, 170 insertions(+)
>  create mode 100644 drivers/input/misc/qnap-mcu-input.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f690b55730111..58574f278bfed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18345,6 +18345,7 @@ F:	drivers/media/tuners/qm1d1c0042*
>  QNAP MCU DRIVER
>  M:	Heiko Stuebner <heiko@sntech.de>
>  S:	Maintained
> +F:	drivers/input/misc/qnap-mcu-input.c
>  F:	drivers/leds/leds-qnap-mcu.c
>  F:	drivers/mfd/qnap-mcu.c
>  F:	include/linux/qnap-mcu.h
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 6ba984d7f0b18..4ab8fe8301635 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -900,6 +900,18 @@ config INPUT_HISI_POWERKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hisi_powerkey.
>  
> +config INPUT_QNAP_MCU
> +	tristate "Input Support for QNAP MCU controllers"
> +	depends on MFD_QNAP_MCU
> +	help
> +	  This option enables support for input elements available on
> +	  embedded controllers used in QNAP NAS devices.
> +
> +	  This includes a polled power-button as well as a beeper.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qnap-mcu-input.
> +
>  config INPUT_RAVE_SP_PWRBUTTON
>  	tristate "RAVE SP Power button Driver"
>  	depends on RAVE_SP_CORE
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index 04296a4abe8e8..05f5d0072b08f 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)	+= pmic8xxx-pwrkey.o
>  obj-$(CONFIG_INPUT_POWERMATE)		+= powermate.o
>  obj-$(CONFIG_INPUT_PWM_BEEPER)		+= pwm-beeper.o
>  obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
> +obj-$(CONFIG_INPUT_QNAP_MCU)		+= qnap-mcu-input.o
>  obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
>  obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
>  obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)	+= regulator-haptic.o
> diff --git a/drivers/input/misc/qnap-mcu-input.c b/drivers/input/misc/qnap-mcu-input.c
> new file mode 100644
> index 0000000000000..9bac7ea2c6b80
> --- /dev/null
> +++ b/drivers/input/misc/qnap-mcu-input.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Driver for input events on QNAP-MCUs
> + *
> + * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
> + */
> +
> +#include <linux/input.h>
> +#include <linux/mfd/qnap-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +/*
> + * The power-key needs to be pressed for a while to create an event,
> + * so there is no use for overly frequent polling.
> + */
> +#define POLL_INTERVAL		500
> +
> +struct qnap_mcu_input_dev {
> +	struct input_dev *input;
> +	struct qnap_mcu *mcu;
> +	struct device *dev;
> +
> +	struct work_struct beep_work;
> +	int beep_type;
> +};
> +
> +static void qnap_mcu_input_poll(struct input_dev *input)
> +{
> +	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
> +	u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x43, /* C */
> +		[2] = 0x56  /* V */
> +	};
> +	u8 reply[4];
> +	int state, ret;
> +
> +	/* poll the power button */
> +	ret = qnap_mcu_exec(idev->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
> +	if (ret)
> +		return;
> +
> +	/* First bytes must mirror the sent command */
> +	if (memcmp(cmd, reply, sizeof(cmd))) {
> +		dev_err(idev->dev, "malformed data received\n");
> +		return;
> +	}
> +
> +	state = reply[3] - 0x30;
> +	input_event(input, EV_KEY, KEY_POWER, state);
> +	input_sync(input);
> +}
> +
> +static void qnap_mcu_input_beeper_work(struct work_struct *work)
> +{
> +	struct qnap_mcu_input_dev *idev =
> +		container_of(work, struct qnap_mcu_input_dev, beep_work);
> +	u8 cmd[] = {

Can this be const?

> +		[0] = 0x40, /* @ */
> +		[1] = 0x43, /* C */
> +		[2] = (idev->beep_type == SND_TONE) ? 0x33 : 0x32
> +	};
> +
> +	qnap_mcu_exec_with_ack(idev->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_input_event(struct input_dev *input, unsigned int type,
> +				unsigned int code, int value)
> +{
> +	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
> +
> +	if (type != EV_SND || (code != SND_BELL && code != SND_TONE))
> +		return -EOPNOTSUPP;
> +
> +	if (value < 0)
> +		return -EINVAL;
> +
> +	/* beep runtime is determined by the MCU */
> +	if (value == 0)
> +		return 0;
> +
> +	/* Schedule work to actually turn the beeper on */
> +	idev->beep_type = code;
> +	schedule_work(&idev->beep_work);

I do not see this being canceled anywhere. You should define ->close()
method for the input device and cancel the work there.

> +
> +	return 0;
> +}
> +
> +static int qnap_mcu_input_probe(struct platform_device *pdev)
> +{
> +	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
> +	struct qnap_mcu_input_dev *idev;
> +	struct device *dev = &pdev->dev;
> +	struct input_dev *input;
> +	int ret;
> +
> +	idev = devm_kzalloc(dev, sizeof(*idev), GFP_KERNEL);
> +	if (!idev)
> +		return -ENOMEM;
> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input)
> +		return dev_err_probe(dev, -ENOMEM, "no memory for input device\n");
> +
> +	idev->input = input;
> +	idev->dev = dev;
> +	idev->mcu = mcu;
> +
> +	input_set_drvdata(input, idev);
> +
> +	input->name		= "qnap-mcu";
> +	input->phys		= "qnap-mcu-input/input0";
> +	input->id.bustype	= BUS_HOST;
> +	input->id.vendor	= 0x0001;
> +	input->id.product	= 0x0001;
> +	input->id.version	= 0x0100;
> +	input->event		= qnap_mcu_input_event;
> +
> +	input_set_capability(input, EV_KEY, KEY_POWER);
> +	input_set_capability(input, EV_SND, SND_BELL);
> +	input_set_capability(input, EV_SND, SND_TONE);
> +
> +	INIT_WORK(&idev->beep_work, qnap_mcu_input_beeper_work);
> +
> +	ret = input_setup_polling(input, qnap_mcu_input_poll);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to set up polling\n");
> +
> +	input_set_poll_interval(input, POLL_INTERVAL);
> +
> +	ret = input_register_device(input);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to register input device\n");
> +
> +	qnap_mcu_input_poll(input);
> +	input_sync(input);

Why do you need this here? Either the device will be opened by now (and
will be polled) or there are no listeners and events will be dropped on
the floor...

Thanks.

-- 
Dmitry

