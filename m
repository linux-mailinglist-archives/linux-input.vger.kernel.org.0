Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B434C16012E
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBOXso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:48:44 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35044 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgBOXso (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:48:44 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so5269417plt.2;
        Sat, 15 Feb 2020 15:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KSNr+yHW4ycn1sxEse/mYo6PN+i2/AGLioB236lCzWo=;
        b=Fu3hFeU3H9cIrAGixOQOIa3DrO9tMNQUqJ5DnbRAIIp/FVsgL187aSBB0LbLxc6FrD
         ldjuRzW4KHHR5W+tuq8vR6ry+PiMZqEIqS6dBQILVlP63X130G+XKZnFohX9ghPCeHIC
         ceSeCP7m2ceZAlBD6jzsmyesGZOWHysCdqb8Zy4/nVyD0MlkfrpWqXiAYGBthL0oAyHY
         ueFaeO5RSfIXcqIs347aSXUlo/zyfLyJn3RbZTGcDCKChcbgGL16/5i+WZ1PdY11Rg+u
         Su8RGYqnUJWiSCJwan2NJ/TdcCaSLltfk/KryFMgebOODc3uK9FV954qWiHkFZD5u+DO
         kneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KSNr+yHW4ycn1sxEse/mYo6PN+i2/AGLioB236lCzWo=;
        b=m2EWaXrtpz5jBOlHUYsdW2oWg3/t3soItu9x9tA1v2FzbKQ0NplVzlHMj66dVmkG/y
         uXGx698QYQ7Yj8h16PlDJx0qczMwN5znv4HyRZFqoB8p3mlqMLJ+q++XRZeY2+EXTd4A
         B0eZL2jRcQ8xE+vWMMH/2pdGtCdKXwYLxcgPsMEhguH4lqiKx1duezWdO5Yjo8BtO2bn
         Uz0aQ85aoSQKyyHJh8SgGflSinHGMVOZLOvQJhvvq6eaMiul4RX65TxOp3UxsvVwdGdC
         a3AXsrMHWx2iqt6MWDQgs/WoYAWAkwXMqjbxxV9jnn5Hb+pKaibyC7X49MyaGCmsYS0x
         IW7Q==
X-Gm-Message-State: APjAAAW4E3ncM4h0POgnLEkU53QWnDFZ3akvOVXlFVunaBH8Ms0wwMO4
        h9fdfLHnWldNbu7ZL3ptoBY=
X-Google-Smtp-Source: APXvYqxlOJLVG7eC47baAse1iAF1gIb+QDc1RCaMWHEuJMoZzV9i2WIIriIlCt4cip6JWtyyq1qZdQ==
X-Received: by 2002:a17:902:b944:: with SMTP id h4mr9586794pls.92.1581810523942;
        Sat, 15 Feb 2020 15:48:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q21sm11493734pff.105.2020.02.15.15.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:48:43 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:48:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-input@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Marek Vasut <marex@denx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: ili210x - fix return value of is_visible function
Message-ID: <20200215234841.GL183709@dtor-ws>
References: <20200209145628.649409-1-luca@z3ntu.xyz>
 <CAGngYiUCC10epFwLO7wXMT-ko2g-zXRDecMwaK5=Y4nCCHHVEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiUCC10epFwLO7wXMT-ko2g-zXRDecMwaK5=Y4nCCHHVEw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 10, 2020 at 10:07:34AM -0500, Sven Van Asbroeck wrote:
> Luca,
> 
> Good catch. That's what happens when I post a patch I can't test :)
> 
> Reviewed-by: Sven Van Asbroeck <TheSven73@gmail.com>

Applied, thank you.

> 
> On Sun, Feb 9, 2020 at 9:58 AM Luca Weiss <luca@z3ntu.xyz> wrote:
> >
> > The is_visible function expects the permissions associated with an
> > attribute of the sysfs group or 0 if an attribute is not visible.
> >
> > Change the code to return the attribute permissions when the attribute
> > should be visible which resolves the warning:
> >
> >   Attribute calibrate: Invalid permissions 01
> >
> > Fixes: cc12ba1872c6 ("Input: ili210x - optionally show calibrate sysfs attribute")
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> >  drivers/input/touchscreen/ili210x.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> > index 37526baff8a6..199cf3daec10 100644
> > --- a/drivers/input/touchscreen/ili210x.c
> > +++ b/drivers/input/touchscreen/ili210x.c
> > @@ -351,7 +351,7 @@ static umode_t ili210x_calibrate_visible(struct kobject *kobj,
> >         struct i2c_client *client = to_i2c_client(dev);
> >         struct ili210x *priv = i2c_get_clientdata(client);
> >
> > -       return priv->chip->has_calibrate_reg;
> > +       return priv->chip->has_calibrate_reg ? attr->mode : 0;
> >  }
> >
> >  static const struct attribute_group ili210x_attr_group = {
> > --
> > 2.25.0
> >

-- 
Dmitry
