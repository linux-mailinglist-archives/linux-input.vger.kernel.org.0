Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70312A695E
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgKDQXD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:23:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729676AbgKDQXD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:23:03 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF3FC0613D3;
        Wed,  4 Nov 2020 08:23:02 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 62so9718084pgg.12;
        Wed, 04 Nov 2020 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q2mfeuyukwDpEVK3US1O9VpyvYNLH3syNY4R2lZUiaY=;
        b=n8xjNZn7dT4jZr6ILNGCShucZI4BYYjZ7ixGnkM746zNyjQDv895NiZRZSLNr11cK8
         i9b4CMcjgdxBAP4dCk4r3kfRiQzRfdVNrMyWIIDSDXbWoe94+j+3pZwkzgKO+E1kfGsm
         ZeswMpr6YaOziLfxbs9351PQOSn233vzIu5oF+GoaCM3KNU6xgGak32MaNfvo6HM0hsz
         A9lSVFG/+2wODFbyIXPQ+mwZ+oGQn7047jOVfWVZlSVTrMlevMqEgjUK9KNdC/91bHBF
         bE8fmxqKLyzy8BrkwRkpRCLa78uO0DyXQ3m4IaYdgokGSa6/nqXwdArMF5loC4K2FjCI
         CL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q2mfeuyukwDpEVK3US1O9VpyvYNLH3syNY4R2lZUiaY=;
        b=e0obxAVBIEok18YPaR/C4MMVMh4/sPYZpI5jOshZD+Ae71cq0F0nqEbCzo9QiEUWwf
         vu06kl9RiC6HRZgh+GEWpcrNdfUGHjdrM7CFOdKd4P3ogryPs0u4u2Kg3cZx1tzjxFsF
         NT3nETCKujO2/AGj6l3/9lleUnWVAbSrGhP3Tfi/sRjR+Lzn3wKsfR5+cCBE7Vg6Pmpz
         HnaZYoI5Ef0KHSF/Lro9rhFltLGSpEQpdidfVs/xGYIRaXyr8cx5vukyVCMK3BaFzVL+
         OhoQugijlwpnhwk4LTQ0LsjEGnsbtX1mEDEOJL+94fkeud3wlxl9nK+RhXMWSzmVvKsa
         8f+g==
X-Gm-Message-State: AOAM532yy2XrDT43AfRlETEVcwoBS4koFOekjGEjromMiDxdj5nT/su8
        kEW2lS/Ed8tKicFAnpDBR2v6d5SYFDU=
X-Google-Smtp-Source: ABdhPJy8FbPKSjjXZQjeDrAjBkT94hjFSb3BR7mQQgMEpz9rRKeIiAwz9FXmDm1nArwKmwjRjqkr2w==
X-Received: by 2002:a17:90a:a4c6:: with SMTP id l6mr5009451pjw.91.1604506982162;
        Wed, 04 Nov 2020 08:23:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v126sm3031552pfb.137.2020.11.04.08.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:22:59 -0800 (PST)
Date:   Wed, 4 Nov 2020 08:22:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Adam Ford-BE <aford@beaconembedded.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: ili210x: Enable suspend/resume functions
Message-ID: <20201104162257.GB1003057@dtor-ws>
References: <20200918143352.93135-1-aford173@gmail.com>
 <CAHCN7xLMGhuGq8WFn8B2W_dwAgDgjo1YczDnf0uJJw3kvJWhjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLMGhuGq8WFn8B2W_dwAgDgjo1YczDnf0uJJw3kvJWhjw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Adam,

On Wed, Nov 04, 2020 at 10:15:47AM -0600, Adam Ford wrote:
> On Fri, Sep 18, 2020 at 9:34 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > Some people may wish to wake their system from sleep, so this
> > patch enables a suspend and resume function which enables
> > and disables IRQ wake functions.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> Gentle ping.  Any feedback on this?

Ah, sorry. This should not be needed as for I2C devices that are
configured as wakeup sources I2C core takes care of declaring interrupt
line as wake IRQ and should configure it accordingly during the system
state transitions.

See drivers/i2c/i2c-core-base.c - calls to
dev_pm_set_[dedicated_]wake_irq() in i2c_device_probe().

> 
> >
> > diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> > index 199cf3daec10..9b1a61447054 100644
> > --- a/drivers/input/touchscreen/ili210x.c
> > +++ b/drivers/input/touchscreen/ili210x.c
> > @@ -474,6 +474,28 @@ static int ili210x_i2c_probe(struct i2c_client *client,
> >         return 0;
> >  }
> >
> > +static int __maybe_unused ili210x_i2c_suspend(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +
> > +       if (device_may_wakeup(&client->dev))
> > +               enable_irq_wake(client->irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused ili210x_i2c_resume(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +
> > +       if (device_may_wakeup(&client->dev))
> > +               disable_irq_wake(client->irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(ili210x_i2c_pm, ili210x_i2c_suspend, ili210x_i2c_resume);
> > +
> >  static const struct i2c_device_id ili210x_i2c_id[] = {
> >         { "ili210x", (long)&ili210x_chip },
> >         { "ili2117", (long)&ili211x_chip },
> > @@ -495,6 +517,7 @@ MODULE_DEVICE_TABLE(of, ili210x_dt_ids);
> >  static struct i2c_driver ili210x_ts_driver = {
> >         .driver = {
> >                 .name = "ili210x_i2c",
> > +               .pm = &ili210x_i2c_pm,
> >                 .of_match_table = ili210x_dt_ids,
> >         },
> >         .id_table = ili210x_i2c_id,
> > --
> > 2.25.1
> >

Thanks.

-- 
Dmitry
