Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D60144B8E
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 07:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgAVGAV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 01:00:21 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36328 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgAVGAU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 01:00:20 -0500
Received: by mail-pf1-f196.google.com with SMTP id x184so2810120pfb.3;
        Tue, 21 Jan 2020 22:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q6AE7P4ZLtQuKFwEWHmJlyzS5LEfQqdxCBPGs6J70Ns=;
        b=SmxnMsZrXszPm8r6VzfE5WWUcHsKzzYkyps6RDS4FParQiAG9NkJWoMTK4bvePCkon
         Au5pFRpLIWqNQ0byUn8QJbwIZ3VsLREp6Rvk+Jmcg79qym7EeOLzXOnYDll0YzRZ+WLc
         0G1BBCjLMfB/80P4DwpYs0txubiw3LkvKL/CPjzLheoeNeNYiI05x1sTENmL/jU+5JRF
         Vf6rJe2jfpa1YRsOajT8/ePjCceEGQ3x66hwt2g/OB6JhC7921OIE4A03yjVHteId4pc
         PQC2ECXq9XOdpC6ouCzZ3Ri9gfOaQMwJ0Wdq9Wh8FaFOlffVIvZ09JLfnfnMmD2KBww3
         LEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q6AE7P4ZLtQuKFwEWHmJlyzS5LEfQqdxCBPGs6J70Ns=;
        b=Q2omjDLRUC0tiXLoGXVlEF0PcoVIQ3+178tr6ZR1Z7tmidyqK47hSo+bJEBwa30TvX
         gAINzLzhxzFPV1MjbsWplHSx8VDmL6t9UjaH3K7qo/wmjRnlbwBhlQBXCiWTdF8Quu/3
         g/5QzLcgD338pzn4YY9YBdeEVb/iWP5wtY12HbMz4H4s2wYjZJO19duT9XByIVSw6tzN
         G6SnGrrelDtDxxup1hrkZCDFyJyLbl1JyP3tkZQoTcpfsYzhJNis6z/THQv/uplzmFdR
         70QFasdy/yIMVAQvCUgVFFwHQ5e8vVID/Yi4EVPAa+VndOouStFIOoOWADiFLdy7ohyE
         CeMg==
X-Gm-Message-State: APjAAAW54Ss0XIpPRIPxhyGPkjYnkuqLDd5HccWhm9sYAKzcO2eK8D/h
        aqDiUd2kz4ZXDGS6FtWJpk8=
X-Google-Smtp-Source: APXvYqyW7SQF7PHDOhPc9KRISc7/Z492Dp3QPFwCYIKYtwqRjz+lUZnSmKP/vZ7O09rP8l0ry5f8nA==
X-Received: by 2002:a65:68ca:: with SMTP id k10mr9705967pgt.222.1579672819903;
        Tue, 21 Jan 2020 22:00:19 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h3sm1491806pjs.0.2020.01.21.22.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 22:00:19 -0800 (PST)
Date:   Tue, 21 Jan 2020 22:00:17 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
        simon.budig@kernelconcepts.de, mripard@kernel.org, bparrot@ti.com,
        hdegoede@redhat.com, andy.shevchenko@gmail.com, robh+dt@kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, shawnguo@kernel.org,
        fcooper@ti.com
Subject: Re: [PATCH v3 6/6] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20200122060017.GC110084@dtor-ws>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-7-m.felsch@pengutronix.de>
 <20200110010957.GP8314@dtor-ws>
 <20200110071606.g42csvhgtriddqj4@pengutronix.de>
 <20200110071847.h5hqfb7ujnahuuus@pengutronix.de>
 <20200116133219.xtp3wkkcefbcumca@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116133219.xtp3wkkcefbcumca@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On Thu, Jan 16, 2020 at 02:32:19PM +0100, Marco Felsch wrote:
> Hi Dmitry,
> 
> On 20-01-10 08:18, Marco Felsch wrote:
> > On 20-01-10 08:16, Marco Felsch wrote:
> > > Hi Dmitry,
> > > 
> > > On 20-01-09 17:09, Dmitry Torokhov wrote:
> > > > Hi Marco,
> > > > 
> > > > On Wed, Jan 08, 2020 at 12:10:50PM +0100, Marco Felsch wrote:
> > > > > +static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
> > > > > +{
> > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > +	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
> > > > > +	int ret;
> > > > > +
> > > > > +	if (device_may_wakeup(dev))
> > > > > +		return 0;
> > > > > +
> > > > > +	ret = regulator_enable(tsdata->vcc);
> > > > > +	if (ret)
> > > > > +		dev_warn(dev, "Failed to enable vcc\n");
> > > > 
> > > > I wonder if we should not return error here instead of continuing. If
> > > > device is not powered up properly we'll have hard time communicating
> > > > with it.
> > > 
> > > That's a reasonable point.
> > > 
> > > > The same is for suspend: maybe we should abort if we can't switch off
> > > > regulator or write to the device.
> > > 
> > > I have no strong opinion about that case but IMHO it's okay to go further
> > > if we can't switch it off. Instead we should print a warning.
> > 
> > I just noticed that we do that already.. So the suspend case should be
> > okay.
> 
> 
> Is it okay to check the return val for the resume case only? I want to
> prepare a v4 of this patch to get this done.

OK, I now remember my issues with power management in this driver. It
supports factory mode vs operational/normal mode, and updating register
settings at runtime. If you want to cut power off at suspend, then you
need to make sure you restore the mode and register settings at resume
time, not simply revert to normal mode.

Thanks.

-- 
Dmitry
