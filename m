Return-Path: <linux-input+bounces-6251-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064EE96DC4A
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 16:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95AF28A235
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 14:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AE928689;
	Thu,  5 Sep 2024 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="w/b4diqw"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13808179BF;
	Thu,  5 Sep 2024 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547725; cv=none; b=dO8ul8/V6RZJOasWSvWJBgwC2d4VEDvSY/IBwFhoVoCWcjmLfVoGii5/SyLfmOURN3iMgCnHXMOP32XySpUTlVjb4jrofVlzIW0PsQ/OyzpPdtZYjPRTIzXEA0carIfO+LsagFcvEZB3db+E1EtcmEm9PlhPIxnnotShVgDV+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547725; c=relaxed/simple;
	bh=0ommqQRWmdehvN0o6pbfhCcsZNj04TF1UHTEwGE5yDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j3ez7wsb/1ApqH+94ZSJ7MpY+Wc6GIDtaLnrHA8LZz9w+6e4pt28cDZRanlykN7wNXiJAEVkBkjK7KE3f/S91Rpm7MmJ25tyAudcwEFZGnh2IiEExlwT/z4SY4NNMlDZMVjCZIULEuKh784ioAnCevBXw5eyZwzNBYdEltIykDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=w/b4diqw; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z9IgYD/2bP3HwiWDe9m6U4cOpfzwTsOumgc5N6zAYJA=; b=w/b4diqw5J8ZIWZLi5djL0KZax
	oYskcatg6UJKVdLpBuSCCoPxb857ufeJN9eshcmsi68J/7ptbzWk043BsCHcRZ+oXflAwquP5rcoA
	MV40is1liBi9d8axQSJHuIhypek6r9Lvz4WU8t+VItpygoIB3Qrdq4VKamWkE7HBi7vMET96xV0oC
	yyF4mAvu0ThWEjYfLULsTtkVHc3A6s7wx5yRnUz9WjN0FdjUpRdKbQ0bD/gnSFwMp9guoDc2fL3HW
	4iE5WgDR4IijnID5sLC2t6JfrtyLyvB2hFOMLYI26aTLd/qZk5RdFq5LFYVTydBQ05sXM6fHcZQsu
	0P35Q/gw==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1smDmd-0002HD-Hx; Thu, 05 Sep 2024 16:48:27 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jdelvare@suse.com, linux@roeck-us.net, dmitry.torokhov@gmail.com,
 pavel@ucw.cz, ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 3/7] leds: add driver for LEDs from qnap-mcu devices
Date: Thu, 05 Sep 2024 16:50:22 +0200
Message-ID: <3627679.ZzFAyJQhcr@diego>
In-Reply-To: <20240829162705.GR6858@google.com>
References:
 <20240825203235.1122198-1-heiko@sntech.de>
 <20240825203235.1122198-4-heiko@sntech.de> <20240829162705.GR6858@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 29. August 2024, 18:27:05 CEST schrieben Sie:
> On Sun, 25 Aug 2024, Heiko Stuebner wrote:
> 
> > This adds a driver that connects to the qnap-mcu mfd driver and provides
> > access to the LEDs on it.
> > 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>

[...]

> > +{
> > +	struct qnap_mcu_err_led *err_led = cdev_to_qnap_mcu_err_led(led_cdev);
> > +	u8 cmd[] = { 0x40, 0x52, 0x30 + err_led->num, 0x30 };
> 
> Really not fan of these magic values being used raw like this.

Me neither, I tried my luck with QNAP support to get some sort of
documentation on what these magic characters mean, and it did
even get up to some "product team" but ultimately they decided
against providing any help.

But ok, if it makes you feel more at ease, I'll switch to at least
replaying ascii-values where possible :-) .


> > +static int qnap_mcu_err_led_blink_set(struct led_classdev *led_cdev,
> > +				      unsigned long *delay_on,
> > +				      unsigned long *delay_off)
> > +{
> > +	struct qnap_mcu_err_led *err_led = cdev_to_qnap_mcu_err_led(led_cdev);
> > +	u8 cmd[] = { 0x40, 0x52, 0x30 + err_led->num, 0x30 };
> > +
> > +	/* LED is off, nothing to do */
> > +	if (err_led->mode == QNAP_MCU_ERR_LED_OFF)
> > +		return 0;
> > +
> > +	if (*delay_on < 500) {
> 
> Setting delay_on based on the current value of delay_on sounds sketchy.

As far as I understood the API, the parameter should indicated the wanted
blink time, while the function then should set in those variables the delay
the driver actually set.

So if the delay_on is < 500, select the fast blink mode, which is this
100/100 variant and for everything >= 500 the slow blink mode.

I.e. you set the trigger to "timer" and this creates the delay_on and
delay_off sysfs files, where you put you wish into and can read the
actually set delays out of.


> > +		*delay_on = 100;
> > +		*delay_off = 100;
> > +		err_led->mode = QNAP_MCU_ERR_LED_BLINK_FAST;
> > +	} else {
> > +		*delay_on = 500;
> > +		*delay_off = 500;
> > +		err_led->mode = QNAP_MCU_ERR_LED_BLINK_SLOW;
> > +	}
> 
> How do you change from a fast to a slow blinking LED and back again?

echo timer > /sys/class/leds/hdd4:red:status/trigger
## creates delay_on + delay_off sysfs files

echo 150 > /sys/class/leds/hdd4:red:status/delay_on
cat /sys/class/leds/hdd4:red:status/delay_on --> 100

echo 250 > /sys/class/leds/hdd4:red:status/delay_on
cat /sys/class/leds/hdd4:red:status/delay_on --> 100

## switch to slow blink

echo 500 > /sys/class/leds/hdd4:red:status/delay_on
cat /sys/class/leds/hdd4:red:status/delay_on --> 500

echo 600 > /sys/class/leds/hdd4:red:status/delay_on
cat /sys/class/leds/hdd4:red:status/delay_on --> 500

## switch to fast blink again

echo 150 > /sys/class/leds/hdd4:red:status/delay_on
cat /sys/class/leds/hdd4:red:status/delay_on --> 100

echo heartbeat > /sys/class/leds/hdd4:red:status/trigger
## removes the delay_on + delay_off files again


Heiko



