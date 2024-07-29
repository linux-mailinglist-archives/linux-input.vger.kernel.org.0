Return-Path: <linux-input+bounces-5184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DF393EEF5
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 09:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93534B20D28
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 07:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5EB12D75C;
	Mon, 29 Jul 2024 07:49:12 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4614412D745;
	Mon, 29 Jul 2024 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239352; cv=none; b=jMQcnDmSoPPiOI2QEJgtkFgSpGOAtK8n4VZx7ws3RAhlT3l/PQhEvaxuLbCzgYeAgjlyNmIiS9I9h5lLoUh5NLxqx5Zxx9pWzDZCLXwTXpz/lj7m6jnvOn65iwXbappSsGxA9HhdvSfP+XwyMyIye7iICFA4vt+8c2ZO1XCuqm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239352; c=relaxed/simple;
	bh=VSun/wxDS4xDOcuLBEA6E7BacEf8jkUpb4LRTsCx8kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOMohYuV1ea75lcd5fRvHN0WxzP3sHP8NRlI1oa13zOWfeiXZngVW++64dz0Aq4oblv88yqqP3Em83t/eVAmnnXsH66MsNxvKqhwgNNt5hSEcLAJ7q5OLvbuMNrE5EyLfOcscARuIPbl3UApqJ4mV6ZuMFmKujOWhzpKPIZzQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86192c.versanet.de ([94.134.25.44] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sYL7k-00028u-Q2; Mon, 29 Jul 2024 09:48:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Florian Eckert <fe@dev.tdt.de>
Cc: lee@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
 dmitry.torokhov@gmail.com, pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 3/7] leds: add driver for LEDs from qnap-mcu devices
Date: Mon, 29 Jul 2024 09:48:50 +0200
Message-ID: <2916408.FA0FI3ke8A@diego>
In-Reply-To: <f7d10147a643f4d0d7cf2decbe490315@dev.tdt.de>
References:
 <20240728211751.2160123-1-heiko@sntech.de>
 <20240728211751.2160123-4-heiko@sntech.de>
 <f7d10147a643f4d0d7cf2decbe490315@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Florian,

Am Montag, 29. Juli 2024, 08:24:26 CEST schrieb Florian Eckert:
> > +static int qnap_mcu_register_err_led(struct device *dev, struct
> > qnap_mcu *mcu, int num)
> > +{
> > +	struct qnap_mcu_err_led *err_led;
> > +	char tmp_buf[LED_MAX_NAME_SIZE];
> > +	int ret;
> > +
> > +	err_led = devm_kzalloc(dev, sizeof(*err_led), GFP_KERNEL);
> > +	if (!err_led)
> > +		return -ENOMEM;
> > +
> > +	err_led->mcu = mcu;
> > +	err_led->num = num;
> > +	err_led->mode = QNAP_MCU_ERR_LED_OFF;
> > +
> > +	snprintf(tmp_buf, LED_MAX_NAME_SIZE, "hdd%d:red:status", num + 1);
> > +	err_led->cdev.name = tmp_buf;
> 
> Should not the memory have to be allocated here via 'kzalloc' for 
> 'err_led->cdev.name'?
> After leaving the function, tmp_buf is no longer on the stack?

Reading the led_classdev_register thing, cdev->name is used only for
creating the final-name for the LED and thus copied into yet another
temporary buffer [0] .

And cdev->name is not accessed anymore outside the register function.

But thinking more about that, you're still right, because after registering
cdev->name is in a bad state, pointing to something no valid anymore.
So if the LED core changes behaviour in the future, this will cause breakage.

So I'll change that.


Thanks for catching that
Heiko



[0] https://elixir.bootlin.com/linux/v6.10.1/source/drivers/leds/led-class.c#L500
https://elixir.bootlin.com/linux/v6.10.1/source/drivers/leds/led-class.c#L503



