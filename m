Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B36275DD3E
	for <lists+linux-input@lfdr.de>; Sat, 22 Jul 2023 17:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjGVPfu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Jul 2023 11:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjGVPfu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Jul 2023 11:35:50 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685E0E5E
        for <linux-input@vger.kernel.org>; Sat, 22 Jul 2023 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690040144; x=1690644944; i=friedrich.vock@gmx.de;
 bh=tk0yPqjfu6e8zv2kdbLOPyhpQbPUa2Ou0qet4/HeqT8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HRj+3zfpcba+kXuTVsnhlQh7BamxtnqeO+he3nzm24QtbmK5bT/IyCvl0N47MxTqpXhx1Ba
 JZRSjMQJf8Hyuq0m9UU48uFJj1r9WU8DNpbO9FS/sRC1b6KQ33ODjeWeNL2dRr7IzJy5bHLWG
 dtmTkfPsI+rG3x6/gg+/ucoydcLfrTSjzBt1qLNiXL8dtYBl/U3A8yW/yejXhOYqzapWlII1c
 Up6O6I0rNKc6lx+WgqxpYiV4OFj1a20HfrFyuSqea79M6x0f6/8BwqN78vE4yXgt9zaFuhwnU
 JWWTr+kwqK8aa7Q6ZPt+uKil371x/7+F7UuXQos2mucVZk3im/nQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.113.178]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAONd-1qBNkS3QOB-00BwUV; Sat, 22
 Jul 2023 17:35:43 +0200
Message-ID: <a8e101fd-d221-7f56-77fd-d4656bc909f0@gmx.de>
Date:   Sat, 22 Jul 2023 17:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: i8042 - Add quirk for polling the KBD port
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20230530153644.17262-1-friedrich.vock@gmx.de>
 <ZLsYUlSMIK0Gtr21@google.com>
Content-Language: en-US
From:   Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <ZLsYUlSMIK0Gtr21@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7g2Z2uaiXyKDVqsas9Z683Lt9i00GiuOz/+jKHEEs6Bdc1rcZEV
 qKOKuxQRXVfyTHCtP6kp+Yvhfjowl7CUsndSTaPQcxaRcWB/lqEsCxFdibZlpX0/TECS76S
 ZkipmRIHw35nKaidF1qX6H2HRt1g3s/6XUgovVEfeSJJJkqOaaODfigqJdTjOqNgTZrKE6D
 JT/9lIfuO9fvfjVjGnsGQ==
UI-OutboundReport: notjunk:1;M01:P0:OOb4eoxIwas=;gnAOt1NcO87B0Kdmj9KxBRh6HL7
 w1Xt5yFqFdQ054cQNmuI0r1H7Fwp8j8nvm5AJ3iqjEVmEfT2mxbuyB6RV4nJj0Il7nDsvSCCd
 ot+3LZlCTcYbVUCARoV+5HCRJbg6X2JTGlylGdwZ6AP9Jo+suZse2Hjum1WFJhPyxZapWxPxs
 l2MFP/e0q5ygewO96hI40JXCZ0hRdBqj4+NL989h6OzjJEbXUkirXdsl+xDgJaJcno/JWvk93
 pLPmsdKCLI9DXrFQo+l/MXMMP310+IZR3uq3xLlfH5cHZIMdDRC67b/SQk9+j8Bi6vmgkP1uc
 wEA06w5sydYoqooeerhBTMiPnVvjK9KYxu9LiG0JI7LqDPg9hgB4USV4w3iaHmxlnT6HFL6H/
 DcqymeFf9REP0WFXgIVohF6ht1rzJwi7qnIUJxoBrb+q1ytVc6WtKJ5M6aMMEoAmhWenJ57yf
 xxo6S6LbxRuhOSDrybnpbdQPuAeHVwkzzU6Tgml0ocvPKG6EMRI3poP41g/RX2ZiDf1N8A9ps
 KwpRzTu4vcmhBNobAzYmCRGxQD/NqTZLWzt+AwaVEe86baATQnM8z8IVA56y5jkXwtgny71tO
 UFY1z6SHHrK1Bp/Xp8ZJ4GEO58Lb8daUm2BiEZ8zWjTO+veCs8p963LHNl+jWjM7Wn02tnIGq
 gwQkCaEAXN/5JxWClo6e5H2alEAnRcXwBKkpH9sCkGgnw/lOVpS6766Uo0LAV0ZrLxMA0gZqe
 1J6+170nmdhtHcVNsZziw6OuwYk5ddUu1BoGHi4rkNsi2aoUmJGCcv8a8G5Ml1WkfuNFmZq5f
 2N5ESga6yBUzSNutoWscY2zWCNjVG3Sj0La3Kp+vJQMhgfQfBiHGPqrzGKAKLrOtMt+QP7h1/
 CzSmIJoO562N0T6t/l3lrECDlQq0TTCesubxQ4lhJazBIYBydQNJa1wuzgXfAoYKzJhDxGGgS
 Lu3mHWs00XWP7klxj6fxo44nD9A=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 22.07.23 01:44, Dmitry Torokhov wrote:
> Hi Friedrich,
>
> On Tue, May 30, 2023 at 05:36:44PM +0200, Friedrich Vock wrote:
>> It seems like there are some devices in the ASUS TUF A16 laptops that
>> just don't send any keyboard interrupts until you read from the KBD port.
> I am sorry, but continuously polling keyboard port will absolutely wreck
> battery life on these devices, so this can not be a real solution.
>
> I wonder if this is yet another example of incorrect IRQ 1 polarity
> override on devices with AMD chipsets (CC-ing Mario).
I'm pretty sure that's the case. I only found Mario's patch reverting
these overrides sometime after sending out this one, but that patch
indeed fixes this problem as well. It's contained in 6.5-rc2, so this
patch is not necessary anymore. Sorry for not sending a "please
disregard" earlier.

Thanks,
Friedrich
>
>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>>   drivers/input/serio/i8042-acpipnpio.h | 30 +++++++++++++++--
>>   drivers/input/serio/i8042.c           | 47 ++++++++++++++++++++++-----
>>   drivers/input/serio/i8042.h           |  2 +-
>>   3 files changed, 67 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
>> index 028e45bd050b..be2e72aaa658 100644
>> --- a/drivers/input/serio/i8042-acpipnpio.h
>> +++ b/drivers/input/serio/i8042-acpipnpio.h
>> @@ -83,6 +83,7 @@ static inline void i8042_write_command(int val)
>>   #define SERIO_QUIRK_KBDRESET		BIT(12)
>>   #define SERIO_QUIRK_DRITEK		BIT(13)
>>   #define SERIO_QUIRK_NOPNP		BIT(14)
>> +#define SERIO_QUIRK_POLL_KBD            BIT(15)
>>
>>   /* Quirk table for different mainboards. Options similar or identical to i8042
>>    * module parameters.
>> @@ -99,6 +100,26 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>>   		},
>>   		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
>>   	},
>> +	/* Some laptops seem to not trigger any keyboard interrupts at all,
>> +	 * even when there is data available. On these devices, manually
>> +	 * polling the keyboard port is required.
>> +	 */
>> +	{
>> +		/* ASUS TUF Gaming A16 with Ryzen 7 7735HS */
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
>> +		},
>> +		.driver_data = (void *)(SERIO_QUIRK_POLL_KBD)
>> +	},
>> +	{
>> +		/* ASUS TUF Gaming A16 with Ryzen 9 7940HS */
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
>> +		},
>> +		.driver_data = (void *)(SERIO_QUIRK_POLL_KBD)
>> +	},
>>   	{
>>   		.matches = {
>>   			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> @@ -1634,6 +1655,8 @@ static void __init i8042_check_quirks(void)
>>   	if (quirks & SERIO_QUIRK_NOPNP)
>>   		i8042_nopnp = true;
>>   #endif
>> +	if (quirks & SERIO_QUIRK_POLL_KBD)
>> +		i8042_poll_kbd = true;
>>   }
>>   #else
>>   static inline void i8042_check_quirks(void) {}
>> @@ -1667,7 +1690,7 @@ static int __init i8042_platform_init(void)
>>
>>   	i8042_check_quirks();
>>
>> -	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>> +	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>>   		i8042_nokbd ? " nokbd" : "",
>>   		i8042_noaux ? " noaux" : "",
>>   		i8042_nomux ? " nomux" : "",
>> @@ -1687,10 +1710,11 @@ static int __init i8042_platform_init(void)
>>   		"",
>>   #endif
>>   #ifdef CONFIG_PNP
>> -		i8042_nopnp ? " nopnp" : "");
>> +		i8042_nopnp ? " nopnp" : "",
>>   #else
>> -		"");
>> +		"",
>>   #endif
>> +		i8042_poll_kbd ? "poll_kbd" : "");
>>
>>   	retval = i8042_pnp_init();
>>   	if (retval)
>> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
>> index 6dac7c1853a5..7212263d3a41 100644
>> --- a/drivers/input/serio/i8042.c
>> +++ b/drivers/input/serio/i8042.c
>> @@ -115,6 +115,10 @@ module_param_named(nopnp, i8042_nopnp, bool, 0);
>>   MODULE_PARM_DESC(nopnp, "Do not use PNP to detect controller settings");
>>   #endif
>>
>> +static bool i8042_poll_kbd;
>> +module_param_named(poll_kbd, i8042_poll_kbd, bool, 0);
>> +MODULE_PARM_DESC(poll_kbd, "Continuously poll the KBD port instead of relying on interrupts");
>> +
>>   #define DEBUG
>>   #ifdef DEBUG
>>   static bool i8042_debug;
>> @@ -178,6 +182,24 @@ static irqreturn_t i8042_interrupt(int irq, void *dev_id);
>>   static bool (*i8042_platform_filter)(unsigned char data, unsigned char str,
>>   				     struct serio *serio);
>>
>> +#define POLL_TIME 1
>> +static void i8042_poll_func(struct timer_list *timer)
>> +{
>> +	unsigned char status;
>> +	unsigned long flags;
>> +
>> +	do {
>> +		spin_lock_irqsave(&i8042_lock, flags);
>> +		status = i8042_read_status();
>> +		spin_unlock_irqrestore(&i8042_lock, flags);
>> +		if (status & I8042_STR_OBF)
>> +			i8042_interrupt(0, NULL);
>> +	} while (status & I8042_STR_OBF);
>> +	mod_timer(timer, jiffies + msecs_to_jiffies(POLL_TIME));
>> +}
>> +
>> +DEFINE_TIMER(poll_timer, i8042_poll_func);
>> +
>>   void i8042_lock_chip(void)
>>   {
>>   	mutex_lock(&i8042_mutex);
>> @@ -1437,13 +1459,15 @@ static void i8042_unregister_ports(void)
>>   	}
>>   }
>>
>> +
>>   static void i8042_free_irqs(void)
>>   {
>>   	if (i8042_aux_irq_registered)
>>   		free_irq(I8042_AUX_IRQ, i8042_platform_device);
>> -	if (i8042_kbd_irq_registered)
>> +	if (i8042_poll_kbd)
>> +		del_timer(&poll_timer);
>> +	else if (i8042_kbd_irq_registered)
>>   		free_irq(I8042_KBD_IRQ, i8042_platform_device);
>> -
>>   	i8042_aux_irq_registered = i8042_kbd_irq_registered = false;
>>   }
>>
>> @@ -1497,10 +1521,14 @@ static int i8042_setup_kbd(void)
>>   	if (error)
>>   		return error;
>>
>> -	error = request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
>> -			    "i8042", i8042_platform_device);
>> -	if (error)
>> -		goto err_free_port;
>> +	if (i8042_poll_kbd)
>> +		mod_timer(&poll_timer, msecs_to_jiffies(POLL_TIME));
>> +	else {
>> +		error = request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
>> +				    "i8042", i8042_platform_device);
>> +		if (error)
>> +			goto err_free_port;
>> +	}
>>
>>   	error = i8042_enable_kbd_port();
>>   	if (error)
>> @@ -1510,8 +1538,11 @@ static int i8042_setup_kbd(void)
>>   	return 0;
>>
>>    err_free_irq:
>> -	free_irq(I8042_KBD_IRQ, i8042_platform_device);
>> - err_free_port:
>> +	if (i8042_poll_kbd)
>> +		del_timer(&poll_timer);
>> +	else
>> +		free_irq(I8042_KBD_IRQ, i8042_platform_device);
>> +err_free_port:
>>   	i8042_free_kbd_port();
>>   	return error;
>>   }
>> --
>> 2.40.1
>>
> Thanks.
>
