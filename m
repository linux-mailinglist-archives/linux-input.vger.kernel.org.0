Return-Path: <linux-input+bounces-5166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A793D143
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2024 12:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D6BB1C20B67
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2024 10:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D77178390;
	Fri, 26 Jul 2024 10:41:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53322B9C4;
	Fri, 26 Jul 2024 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721990501; cv=none; b=fq4+5WJ4L1M6qFqpZAx8Sov+XCq47fDjEWLtNfqfTst5B5wR0T6d6pISgnIRZPmbePWmYhBAM8+ug21b8y0w2S50xzgFJOIhuxcd/a8SU5S5dINUWglXDO/H6KloejKNC8jO0L30eHkGX0wt7S4VxtFWOy0qgZZ41wG+m5nKkfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721990501; c=relaxed/simple;
	bh=EMIqymkkmsp2yIFmkqP9X5hm4EP09YGY3VbxMo/iihM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAKsbkRfh+hZJLHtXMh+g8VzRrvA2zksCIx40vaAGLynvCDmlrIB6pFXlsm/nRQ52r3VX98qxkmj+JCbOaZ9jaLoiAY8hGS+1f/aR0W3W1V6qla8R3RgoK6UaOdH5tNKYW9cV9Ktv+u+gOjAr4UdJ86GEbJBzUpPNGyjKJrl5Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz10t1721990475two4uu
X-QQ-Originating-IP: k2c1s9b73anA3oC7JtVpWn6Qej+uxjEfiRTb1KSKUL4=
Received: from john-PC ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Jul 2024 18:41:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13043270550837116636
Date: Fri, 26 Jul 2024 18:41:05 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: dmitry.torokhov@gmail.com, hdegoede@redhat.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - fix LED state at suspend/resume
Message-ID: <035AC89B9E0E2BE4+20240726184105.6b90f00b@john-PC>
In-Reply-To: <20240726102730.24836-1-maqianga@uniontech.com>
References: <20240726102730.24836-1-maqianga@uniontech.com>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0

On Fri, 26 Jul 2024 18:27:30 +0800
Qiang Ma <maqianga@uniontech.com> wrote:

Sorry, add the correct email address: linux-input@vger.kernel.org

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
> according to code-value in the event, in the atkbd_set_leds function,
> first look at the value of lenon, if it is 0, there is no need to
> look at the value of dev->led, otherwise, Need to look at dev->led
> to determine the keyboard LED on/off.
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  drivers/input/keyboard/atkbd.c | 35
> +++++++++++++++++++++++++--------- 1 file changed, 26 insertions(+),
> 9 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c
> b/drivers/input/keyboard/atkbd.c index 7f67f9f2946b..27d8f375929e
> 100644 --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -237,6 +237,8 @@ struct atkbd {
>  	struct mutex mutex;
>  
>  	struct vivaldi_data vdata;
> +
> +	unsigned long ledon[BITS_TO_LONGS(LED_CNT)];
>  };
>  
>  /*
> @@ -604,24 +606,34 @@ static int atkbd_set_repeat_rate(struct atkbd
> *atkbd) return ps2_command(&atkbd->ps2dev, &param, ATKBD_CMD_SETREP);
>  }
>  
> +#define ATKBD_DO_LED_TOGGLE(dev, atkbd, type, v, bits,
> on)		\
> +({
> \
> +	unsigned char __tmp =
> 0;					\
> +	if (test_bit(LED_##type,
> atkbd->on))				\
> +		__tmp = test_bit(LED_##type, dev->bits) ? v :
> 0;	\
> +
> else								\
> +		__tmp =
> 0;						\
> +
> __tmp;
> \ +}) +
>  static int atkbd_set_leds(struct atkbd *atkbd)
>  {
>  	struct input_dev *dev = atkbd->dev;
> -	unsigned char param[2];
> +	unsigned char param[2] = {0};
>  
> -	param[0] = (test_bit(LED_SCROLLL, dev->led) ? 1 : 0)
> -		 | (test_bit(LED_NUML,    dev->led) ? 2 : 0)
> -		 | (test_bit(LED_CAPSL,   dev->led) ? 4 : 0);
> +	param[0] = ATKBD_DO_LED_TOGGLE(dev, atkbd, SCROLLL, 1, led,
> ledon)
> +		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, NUML,    2, led,
> ledon)
> +		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, CAPSL,   4, led,
> ledon); if (ps2_command(&atkbd->ps2dev, param, ATKBD_CMD_SETLEDS))
>  		return -1;
>  
>  	if (atkbd->extra) {
>  		param[0] = 0;
> -		param[1] = (test_bit(LED_COMPOSE, dev->led) ? 0x01 :
> 0)
> -			 | (test_bit(LED_SLEEP,   dev->led) ? 0x02 :
> 0)
> -			 | (test_bit(LED_SUSPEND, dev->led) ? 0x04 :
> 0)
> -			 | (test_bit(LED_MISC,    dev->led) ? 0x10 :
> 0)
> -			 | (test_bit(LED_MUTE,    dev->led) ? 0x20 :
> 0);
> +		param[1] = ATKBD_DO_LED_TOGGLE(dev, atkbd, COMPOSE,
> 0x01, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, SLEEP,
> 0x02, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, SUSPEND,
> 0x04, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, MISC,
> 0x10, led, ledon)
> +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd, MUTE,
> 0x20, led, ledon); if (ps2_command(&atkbd->ps2dev, param,
> ATKBD_CMD_EX_SETLEDS)) return -1;
>  	}
> @@ -695,6 +707,11 @@ static int atkbd_event(struct input_dev *dev,
>  	switch (type) {
>  
>  	case EV_LED:
> +		if (value)
> +			__set_bit(code, atkbd->ledon);
> +		else
> +			__clear_bit(code, atkbd->ledon);
> +
>  		atkbd_schedule_event_work(atkbd,
> ATKBD_LED_EVENT_BIT); return 0;
>  


