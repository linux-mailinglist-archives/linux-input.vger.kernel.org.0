Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83C844BBA9
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 07:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhKJGao (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 01:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhKJGao (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 01:30:44 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F65BC061764
        for <linux-input@vger.kernel.org>; Tue,  9 Nov 2021 22:27:57 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so970096pja.1
        for <linux-input@vger.kernel.org>; Tue, 09 Nov 2021 22:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e8+NRAWHR3bT/UkfHvfLg3cyGBdlKVJIKDCcEWXJStk=;
        b=Kcwa+Rwv5TUsHcA34B/FdYgUS+MrNBmt0cgNenYYOVvvewoDFdE5FQodbHxYG7CEsK
         jW9RrLVzTrGTXuVeWoSTZukAD8FRscGlb46157pMJ7hYngnuZWxxp8j+tXcNGnuEMsL3
         O8sRbTldCUvW7MgPqdTdpHlagnUtDIkiiPiERrL7BVlP8De4qEDZy8Gzp5yoLa0wUBPP
         rC06HVvQCYMTSDYJkMzR7fAgj1VSniGdJYhvZyA17YV4CcMKJQxYbUqmBhQXCOT8HbxE
         VIN0usBM9JJGvzEWNeBgHpAfD8DP/OMhaOZKdZFwMWtwo4rtSoMbkW+Yc/RO8NHIvaSv
         GOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e8+NRAWHR3bT/UkfHvfLg3cyGBdlKVJIKDCcEWXJStk=;
        b=WTUy0iUya6qsx+lSIzZ/0s/lfutoHE1ev/yDRKEXm4o8wyq0wr8uUweqYhFUidu1e8
         Qkbyt/zD7NskCrT4CiZo/jJ+Mvcq2vSexsUSrDwqV/wyEMC2r//zK+tRoXajRrCu7mY+
         jBRFiym+27ijawyj4AcCsJR5Prsj7AuRYMgoZrfTKuLUnGyiJkUnYGBot9gNRCDhxYX3
         YwMXkQ3lLKg7RYDCl7KOaSDEd80jHZWzixzK3OhKivZc+YPxDYgG6urDA6SWWhHW8fO+
         48ycIS+1K12Mn1WaPgzFcN4Zyy7uCQjwfffDPFOn04jgx47z4JN+LwA8aHufRV38nP3t
         ZV8w==
X-Gm-Message-State: AOAM530/ICM4TYq27LGzp5MlcNxhJv5vPSxxLgFuSMKORq8znbSSMwZO
        AKP0dzEnJMwWC9cR3dZi2yE=
X-Google-Smtp-Source: ABdhPJwBOc0gWhrcPJ4wdOSQszdw5RRVgD0MU1s/MISABcsxkiGCkiBLbOGlSz3061NIlvHURfGEVQ==
X-Received: by 2002:a17:90b:e83:: with SMTP id fv3mr14294912pjb.115.1636525677016;
        Tue, 09 Nov 2021 22:27:57 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b345:ee3a:151d:b1d1])
        by smtp.gmail.com with ESMTPSA id c21sm23682471pfl.15.2021.11.09.22.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 22:27:55 -0800 (PST)
Date:   Tue, 9 Nov 2021 22:27:53 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH] Input: ili210x - Improve polled sample spacing
Message-ID: <YYtmaXa/gmA3DJ0A@google.com>
References: <20211108005216.480525-1-marex@denx.de>
 <YYibdjD35P2RklGh@google.com>
 <b541d4b7-0b3e-6ccd-abbb-8448c1c57c22@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b541d4b7-0b3e-6ccd-abbb-8448c1c57c22@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 08, 2021 at 12:04:30PM +0100, Marek Vasut wrote:
> On 11/8/21 4:37 AM, Dmitry Torokhov wrote:
> > Hi Marek,
> 
> Hi,
> 
> [...]
> 
> > > diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> > > index a3b71a9511eb3..b2d9fe1e1c707 100644
> > > --- a/drivers/input/touchscreen/ili210x.c
> > > +++ b/drivers/input/touchscreen/ili210x.c
> > > @@ -328,10 +328,13 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
> > >   	const struct ili2xxx_chip *chip = priv->chip;
> > >   	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
> > >   	bool keep_polling;
> > > +	ktime_t time_next;
> > > +	s64 time_delta;
> > >   	bool touch;
> > >   	int error;
> > >   	do {
> > > +		time_next = ktime_add_ms(ktime_get(), ILI2XXX_POLL_PERIOD);
> > >   		error = chip->get_touch_data(client, touchdata);
> > >   		if (error) {
> > >   			dev_err(&client->dev,
> > > @@ -341,8 +344,11 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
> > >   		touch = ili210x_report_events(priv, touchdata);
> > >   		keep_polling = chip->continue_polling(touchdata, touch);
> > > -		if (keep_polling)
> > > -			msleep(ILI2XXX_POLL_PERIOD);
> > > +		if (keep_polling) {
> > > +			time_delta = ktime_us_delta(time_next, ktime_get());
> > 
> > Do we really need to use exact time, or ktime_get_coarse() is good
> > enough, as it is cheaper?
> 
> ktime_get_coarse() introduces multi-millisecond jitter into the samples if
> you have low HZ setting, which isn't really nice. That's also why I use
> ktime and not jiffies here, jiffies has the same problem.

Applied, thank you.

-- 
Dmitry
