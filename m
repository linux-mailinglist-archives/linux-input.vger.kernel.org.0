Return-Path: <linux-input+bounces-5288-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19993945E9C
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 15:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7691F240F7
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 13:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4318D1E3CB9;
	Fri,  2 Aug 2024 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="XgQSvStR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88E1E3CC3;
	Fri,  2 Aug 2024 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722605028; cv=none; b=oETbSTNydT+qVGFzwbQvC2hZb6+p1n2Yz5NqOBLJ8plm06wFvWVmZPp1iCjF4XTNOGvr0l8P5cGYFNcSpSy1HQ+F4A5RsnHFeH2hJuj1lC0D2HsT3M/Q3Wj9mZjC7odFb4WlU0QjiRG7KE8U4FI4IqfvZE7rbNpPnD+7Mc+J0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722605028; c=relaxed/simple;
	bh=fsVvgYGyE0NtWIPTCBcgpNi+GdQA4vGo6K3ciq5bNA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWjlZK0/AKwk5rXR75PzDMWINa25kdr/p5RLEpfDXJZLaFK8dzuvRAYsfM2FqvcBs71Q9paZ0/+YP0bdTojUzfNuw6yvSoPiECp/7wTnu28cszrAxjbaEu0YOvvzGTJStifXhTiCPQSo1PHEabQ4qAAOXsOVaP9EqmIknpeYLdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=XgQSvStR; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ZsFrs3ZHUIDadZsFrsw7Va; Fri, 02 Aug 2024 15:23:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722605016;
	bh=l1w5HkBmdUNhk0KIrdXhJAVeGOc8OmiX+2Fh0Dp3WdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=XgQSvStRKBHsqpExqclU4nuBvGpye4lES2soTnHEnVXj4m6zeXXOi17G4VtcLIV2n
	 /r2X0anBonHUcyPLH0/2OPjYCaNUKAWF5jZCoRcfrloaB/kxuVoMH5MC3l8En+PxAZ
	 TwJ4VTBBs6p1wAGg/ffP6RFTtkXyr7Xiugq7DnrYQlZ1aeOdYrr6iAofa1RuB2ZuEW
	 4HLW2TL0uOl6Vzmvfjt1ALmkBvOlNQK2gwllVMd/ctDoIqcYLG7776cbDrWvVU5Xnu
	 Y6MIOe6aBz1FhEo/NldiBR5Ujl3VAazooUS0iRhGtlRXXfRq2KTkbkjei9+kKWFfnE
	 uqfMRnfrpOFnA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 02 Aug 2024 15:23:36 +0200
X-ME-IP: 90.11.132.44
Message-ID: <96843dc5-6c7a-4b93-84a2-1cdc4da9ce85@wanadoo.fr>
Date: Fri, 2 Aug 2024 15:23:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] Input: atkbd - fix LED state at suspend/resume
To: Qiang Ma <maqianga@uniontech.com>, dmitry.torokhov@gmail.com,
 hdegoede@redhat.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240802093600.6807-1-maqianga@uniontech.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240802093600.6807-1-maqianga@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/08/2024 à 11:36, Qiang Ma a écrit :
> After we turn on the keyboard CAPSL LED and let the system suspend,
> the keyboard LED is not off, and the kernel log is as follows:
> 
> [  185.987574] i8042: [44060] ed -> i8042 (kbd-data)
> [  185.988057] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> [  185.988067] i8042: [44061] 04 -> i8042 (kbd-data)
> [  185.988248] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> 
> The log shows that after the command 0xed is sent, the data
> sent is 0x04 instead of 0x00.
> 
> Solution:
> Add a bitmap variable ledon in the atkbd structure, and then set ledon
> according to code-value in the event, in the atkbd_set_leds() function,
> first look at the value of ledon, if it is 0, there is no need to
> look at the value of dev->led, otherwise, need to look at dev->led
> to determine the keyboard LED on/off.
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Hmmm, no.

I just made a few comments on v1.

That does not mean a Signed-off-by at all.

> ---
> V2:
>   - Fixed formatting and spelling errors
>   - Optimized some code

A good practice is also to give the link to previous versions. It can 
help reviewers who maybe missed part of the story.

v1: 
https://lore.kernel.org/all/20240726102730.24836-1-maqianga@uniontech.com/

> 
>   drivers/input/keyboard/atkbd.c | 31 +++++++++++++++++++++++--------
>   1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 7f67f9f2946b..fb479bc78134 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -237,6 +237,8 @@ struct atkbd {
>   	struct mutex mutex;
>   
>   	struct vivaldi_data vdata;
> +
> +	DECLARE_BITMAP(ledon, LED_CNT);
>   };
>   
>   /*
> @@ -604,24 +606,32 @@ static int atkbd_set_repeat_rate(struct atkbd *atkbd)
>   	return ps2_command(&atkbd->ps2dev, &param, ATKBD_CMD_SETREP);
>   }
>   
> +#define ATKBD_DO_LED_TOGGLE(dev, atkbd, type, v, bits, on)		\

Is there a real advantage for 'bits' and 'on'?

They always match with 'led' and 'ledon' below.
And 'atkbd' and 'dev' are already hard coded below anyway.

I just find it confusing and harder to read.

Also, in order to be less verbose, maybe ATKBD_LED_TOGGLE or 
ATKBD_TOGGLE_LED would just be as clear with fewer char?

CJ

> +({									\
> +	unsigned char __tmp = 0;					\
> +	if (test_bit(LED_##type, atkbd->on))				\
> +		__tmp = test_bit(LED_##type, dev->bits) ? v : 0;	\
> +	__tmp;								\
> +})
> +
>   static int atkbd_set_leds(struct atkbd *atkbd)
>   {
>   	struct input_dev *dev = atkbd->dev;
>   	unsigned char param[2];
>   
> -	param[0] = (test_bit(LED_SCROLLL, dev->led) ? 1 : 0)
> -		 | (test_bit(LED_NUML,    dev->led) ? 2 : 0)
> -		 | (test_bit(LED_CAPSL,   dev->led) ? 4 : 0);
> +	param[0] = ATKBD_DO_LED_TOGGLE(dev, atkbd, SCROLLL, 1, led, ledon)
> +		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, NUML,    2, led, ledon)
> +		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, CAPSL,   4, led, ledon);
>   	if (ps2_command(&atkbd->ps2dev, param, ATKBD_CMD_SETLEDS))
>   		return -1;
>   
>   	if (atkbd->extra) {
>   		param[0] = 0;
> -		param[1] = (test_bit(LED_COMPOSE, dev->led) ? 0x01 : 0)
> -			 | (test_bit(LED_SLEEP,   dev->led) ? 0x02 : 0)
> -			 | (test_bit(LED_SUSPEND, dev->led) ? 0x04 : 0)
> -			 | (test_bit(LED_MISC,    dev->led) ? 0x10 : 0)
> -			 | (test_bit(LED_MUTE,    dev->led) ? 0x20 : 0);
> +		param[1] = ATKBD_DO_LED_TOGGLE(dev, atkbd, COMPOSE, 0x01, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, SLEEP,   0x02, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, SUSPEND, 0x04, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, MISC,    0x10, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, MUTE,    0x20, led, ledon);
>   		if (ps2_command(&atkbd->ps2dev, param, ATKBD_CMD_EX_SETLEDS))
>   			return -1;
>   	}
> @@ -695,6 +705,11 @@ static int atkbd_event(struct input_dev *dev,
>   	switch (type) {
>   
>   	case EV_LED:
> +		if (value)
> +			__set_bit(code, atkbd->ledon);
> +		else
> +			__clear_bit(code, atkbd->ledon);
> +
>   		atkbd_schedule_event_work(atkbd, ATKBD_LED_EVENT_BIT);
>   		return 0;
>   


