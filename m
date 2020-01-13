Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02848138F68
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 11:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgAMKl6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 05:41:58 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47567 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728767AbgAMKl5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 05:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578912115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GJEbtVcYCYsYzHFQQH8H+wrqKP98/+Ixpvz8Qz58wLw=;
        b=gCugC3V31ZqqmwRr8Hzv+BYqvd2eeshJ89LI0PHeN9mUkSkAobbDfzKo3SqWn68YLlndls
        k4RDzDAo0jeg6YQK5mbCmEba2aUd6DOqX/bWDpdPLHv5O7bkzYL6u1S6S4zB9f9PmDRrds
        6nmzwoCM6p6bnYOWTRR3/c/XSV2eI2w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-FDctDj6eMR69v0KmLklqqA-1; Mon, 13 Jan 2020 05:41:51 -0500
X-MC-Unique: FDctDj6eMR69v0KmLklqqA-1
Received: by mail-wr1-f70.google.com with SMTP id t3so4772758wrm.23
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 02:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GJEbtVcYCYsYzHFQQH8H+wrqKP98/+Ixpvz8Qz58wLw=;
        b=D7AKG2iCVevJplAOt0gxKk6/toSXnq2lq7n69El2POaVjI+Ychnzt8mSyGgUVlSUOv
         /3Y/SwhuIAdMiTxOdSRLXjY15fr+UfzfBM5zN0/PMeBryZsHDwl1lgsJuHfgz6RKoiS1
         p77k20dPD/OFx0NmG6rjsLXJOvEh63jl9BLJEDMeuY29cAwNCAW4HISQbmoHR+wRM3QF
         l/BLALeLwWKum0gKD/0icTfF6cyARYWabTSgyOCjfgjbuScpPtE5LQ45AcCIDmPMsItt
         3JXppqfhaVvyXdtTyaCc5A/mSnARyhrLeyVY229V8GY0tTZ3CvKs7uo6tiRGLwfof5Hv
         Qnzg==
X-Gm-Message-State: APjAAAWJB8fx2AcGKcdVOYAg2grTJ1q1/Yfnlf/ml+NfPC04eok7qPWr
        opQksxyMEN7np/6C5PObPdP3GWUj+mdTyWqqmF3nV6IOe8yuUWAzyRLwJJ37lcEq8/3ZE2OrFol
        IqUh3ZRJUxhZTxPVe7fMxvEc=
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr18185432wrp.182.1578912110736;
        Mon, 13 Jan 2020 02:41:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTaRrUorrV25kUMcn86Ibeg1yxvRIfWO4wbNVDFWXR6W47GP/TaN/2ZA8nilR0VNOisMdSgA==
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr18185402wrp.182.1578912110433;
        Mon, 13 Jan 2020 02:41:50 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id t5sm14405988wrr.35.2020.01.13.02.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:41:49 -0800 (PST)
Subject: Re: [PATCH 1/3] Input: axp20x-pek - Remove unique wakeup event
 handling
To:     Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20200113032032.38709-1-samuel@sholland.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c876812-6ec1-cf28-8ce4-7732c5cf67da@redhat.com>
Date:   Mon, 13 Jan 2020 11:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113032032.38709-1-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 13-01-2020 04:20, Samuel Holland wrote:
> This driver attempts to avoid reporting wakeup events to userspace by
> clearing a possible pending IRQ before IRQs are enabled during resume.
> The assumption seems to be that userspace cannot cope with a KEY_POWER
> press during resume. However, no other input driver does this, so it
> would be a bug that such events are missing with this driver.
> 
> Furthermore, for PMICs connected via I2C or RSB, it is not possible to
> update the regmap during the noirq resume phase, because the bus
> controller drivers require IRQs to perform bus transactions. And the
> resume hook cannot move to a later phase, because then it would race
> with the power key IRQ handler.
> 
> So the best solution seems to be simply removing the hook.

Hmm, I'm not sure this is a good idea, let me give you some background
info on this:

This hook was handled because on X86 systems/laptops when waking
them up typically the power-button does not send a KEY_POWER press event
when the system was woken up through the power-button.

So normal (e.g. Debian, Fedora) userspace does not expect this event
and will directly go to sleep again because that is the default behavior
on a KEY_POWER event.

On x86 axp20x-pek is only used for the power-button on Bay Trail devices
with a AXP288 PMIC. On Cherry Trail devices with an AXP288 PMIC the
power-button is also connected directly to a GPIO on the SoC and that
is used (also see the axp20x_pek_should_register_input function).

So after writing this patch, when doing hw-enablement for the power-button
on the Cherry Trail devices I learned that the gpio_keys driver does
send userspace a KEY_POWER event when woken up with the power-button.

I wrote a patch for gpio-keys to not do this, as that is what normal
Linux userspace expects, but that was nacked, because under e.g.
Android the KEY_POWER event is actually desirable / necessary to avoid
Android immediately re-suspending the system again. Since my "fix" to
the gpio-keys devices was nacked I have instead wroked around this in
userspace, but *only* for the GNOME3 desktop environment, by teaching
GNOME3 to ignore KEY_POWER events for the first couple of seconds after
a resume.

So your suggested change, which will cause KEY_POWER to be send on
Bay Trail devices after a wake-up by the power button, should be
fine for recent GNOME3 versions, but for other desktop environments
this may cause a regression where they respond to the new KEY_POWER
event by immediately going back to sleep again.

As for this not working with the i2c bus, it does on X86 because
the PMIC is also directly accessed by the power-management HW of
the SoC and to make this work the i2c-controller is never suspended
and its irq is marked IRQF_NO_SUSPEND. But this is X86 special
sauce.

Summarizing:

I'm personally fine with remove the magic I added to suppress
the KEY_POWER press reporting as in hindsight given the gpio-keys
story I should have never added it. But I'm worried about this
causing regressions for some Bay Trail users. OTOH making this
change would be good for Android X86 users.

Another IMHO better fix would be to drop the __maybe_unused and
instead wrap both the axp20x_pek_resume_noirq function and the
init of the  .resume_noirq struct member with:

#if defined X86 && defined CONFIG_PM_SLEEP

This keeps the current behavior on Bay Trail machines, while
I assume it should also fix the issues this was causing for
your setup.

Regards,

Hans








> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>   drivers/input/misc/axp20x-pek.c | 25 -------------------------
>   1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
> index 17c1cca74498..7d0ee5bececb 100644
> --- a/drivers/input/misc/axp20x-pek.c
> +++ b/drivers/input/misc/axp20x-pek.c
> @@ -352,30 +352,6 @@ static int axp20x_pek_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
> -{
> -	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
> -
> -	if (axp20x_pek->axp20x->variant != AXP288_ID)
> -		return 0;
> -
> -	/*
> -	 * Clear interrupts from button presses during suspend, to avoid
> -	 * a wakeup power-button press getting reported to userspace.
> -	 */
> -	regmap_write(axp20x_pek->axp20x->regmap,
> -		     AXP20X_IRQ1_STATE + AXP288_IRQ_POKN / 8,
> -		     BIT(AXP288_IRQ_POKN % 8));
> -
> -	return 0;
> -}
> -
> -static const struct dev_pm_ops axp20x_pek_pm_ops = {
> -#ifdef CONFIG_PM_SLEEP
> -	.resume_noirq = axp20x_pek_resume_noirq,
> -#endif
> -};
> -
>   static const struct platform_device_id axp_pek_id_match[] = {
>   	{
>   		.name = "axp20x-pek",
> @@ -394,7 +370,6 @@ static struct platform_driver axp20x_pek_driver = {
>   	.id_table	= axp_pek_id_match,
>   	.driver		= {
>   		.name		= "axp20x-pek",
> -		.pm		= &axp20x_pek_pm_ops,
>   		.dev_groups	= axp20x_groups,
>   	},
>   };
> 

