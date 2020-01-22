Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39CD144B95
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 07:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgAVGEY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 01:04:24 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44951 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVGEY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 01:04:24 -0500
Received: by mail-pg1-f193.google.com with SMTP id x7so2861591pgl.11;
        Tue, 21 Jan 2020 22:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/h9o3IJUBowmLWfA61u+50384SsUM8Xhdmip5ZMDV/U=;
        b=rDOLU2b+w9DoleHwa3ayn9bAX80pvFO+gWeoYnPUyDv2Jqo4vowsYXjY+jxll+NcQi
         TKFSL98RF0EWxJETVrA7hGJBeM0YuljRnym0dCYpoFsb9gWAQUZrL9f2jx/bk9w2s7/J
         DAt/Od0CABWhKpTjSa67PnkZXXhZTx6rCWTaH76jB7u8fAGuElmfa+dzLorX6jIUC+JV
         q3rD+O6gkcde0mnYTi5WzNq0hGEFK0Z09QvHGEFSBofGF30mI0jJ3I8AiAE+rX7ZQSfA
         q9dour+qWb1s2NUKky+QXewZDTM4WJ9+FSPVFFwgg6lmtcHazuker0sY4+ZTeXwx7HjC
         FdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/h9o3IJUBowmLWfA61u+50384SsUM8Xhdmip5ZMDV/U=;
        b=rB3tsVj1a6Y39M2+r1sQGdRt8dfLPB4yksYKy1ThDMdeSHVjK/abPxcdpJ7V2GW2AO
         ky8BHxf0YKTi6L0veSYPInId/ECl2Lm/3ADarcGAeoXFvmsu3nP3WVCBcuezJF0H5M0m
         AzEyVLTRw2HGJ0vVOxkEA/CSt9BVJk8pzwVrQ2izO/IwV0HKslMERt4Wrwn8RbUEA/QF
         XzXkVNPgtysYR/zd0A6aaiAF0zgTruexeCFfyB3ikh3tLGt8eyTn7tNHX5Es44Gqk1nU
         Dx8QCH13kderOEOY0i0XYW/t0c+WWNiiLKl5cFlpmPM2M4gGdTZVSybIpn2hflr90i0U
         9kcA==
X-Gm-Message-State: APjAAAVCcZVY+S7ofgo/cc3nOxrYDH2S4WbSlTluSTSWANSrgiEJiHa3
        plk9UpPGSeFqxCFKmeZHyDI=
X-Google-Smtp-Source: APXvYqz9OeBvN7zgKLhewIMrKkPlKMyOwBLBE0xGHFrKV4R5pDxHgUjfmYDjBtCK6dLd0rZVOia8Og==
X-Received: by 2002:a62:1548:: with SMTP id 69mr1146889pfv.239.1579673063272;
        Tue, 21 Jan 2020 22:04:23 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o134sm47192992pfg.137.2020.01.21.22.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 22:04:22 -0800 (PST)
Date:   Tue, 21 Jan 2020 22:04:19 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 1/2] Input: axp20x-pek - Respect userspace wakeup
 configuration
Message-ID: <20200122060419.GD110084@dtor-ws>
References: <20200115051253.32603-1-samuel@sholland.org>
 <20200115051253.32603-2-samuel@sholland.org>
 <674932c7-c120-092f-0255-5fa94925155d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <674932c7-c120-092f-0255-5fa94925155d@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 15, 2020 at 11:50:08AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 15-01-2020 06:12, Samuel Holland wrote:
> > Unlike most other power button drivers, this driver unconditionally
> > enables its wakeup IRQ. It should be using device_may_wakeup() to
> > respect the userspace configuration of wakeup sources.
> > 
> > Because the AXP20x MFD device uses regmap-irq, the AXP20x PEK IRQs are
> > nested off of regmap-irq's threaded interrupt handler. The device core
> > ignores such interrupts, so to actually disable wakeup, we must
> > explicitly disable all non-wakeup interrupts during suspend.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> Patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

> 
> Regards,
> 
> Hans
> 
> 
> 
> > ---
> >   drivers/input/misc/axp20x-pek.c | 37 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
> > index 17c1cca74498..0ace3fe3d7dc 100644
> > --- a/drivers/input/misc/axp20x-pek.c
> > +++ b/drivers/input/misc/axp20x-pek.c
> > @@ -280,7 +280,7 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
> >   	}
> >   	if (axp20x_pek->axp20x->variant == AXP288_ID)
> > -		enable_irq_wake(axp20x_pek->irq_dbr);
> > +		device_init_wakeup(&pdev->dev, true);
> >   	return 0;
> >   }
> > @@ -352,6 +352,40 @@ static int axp20x_pek_probe(struct platform_device *pdev)
> >   	return 0;
> >   }
> > +static int __maybe_unused axp20x_pek_suspend(struct device *dev)
> > +{
> > +	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
> > +
> > +	/*
> > +	 * As nested threaded IRQs are not automatically disabled during
> > +	 * suspend, we must explicitly disable non-wakeup IRQs.
> > +	 */
> > +	if (device_may_wakeup(dev)) {
> > +		enable_irq_wake(axp20x_pek->irq_dbf);
> > +		enable_irq_wake(axp20x_pek->irq_dbr);
> > +	} else {
> > +		disable_irq(axp20x_pek->irq_dbf);
> > +		disable_irq(axp20x_pek->irq_dbr);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused axp20x_pek_resume(struct device *dev)
> > +{
> > +	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
> > +
> > +	if (device_may_wakeup(dev)) {
> > +		disable_irq_wake(axp20x_pek->irq_dbf);
> > +		disable_irq_wake(axp20x_pek->irq_dbr);
> > +	} else {
> > +		enable_irq(axp20x_pek->irq_dbf);
> > +		enable_irq(axp20x_pek->irq_dbr);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
> >   {
> >   	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
> > @@ -371,6 +405,7 @@ static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
> >   }
> >   static const struct dev_pm_ops axp20x_pek_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(axp20x_pek_suspend, axp20x_pek_resume)
> >   #ifdef CONFIG_PM_SLEEP
> >   	.resume_noirq = axp20x_pek_resume_noirq,
> >   #endif
> > 
> 

-- 
Dmitry
