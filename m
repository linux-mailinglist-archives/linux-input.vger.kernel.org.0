Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745EE39992C
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhFCEg3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:36:29 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:40685 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFCEg2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:36:28 -0400
Received: by mail-pj1-f53.google.com with SMTP id jz2-20020a17090b14c2b0290162cf0b5a35so4700222pjb.5;
        Wed, 02 Jun 2021 21:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Urq5p1xoH90Draw9l3rymrwCgm46nXEYLvPhdjj3VHc=;
        b=G9sfxTJT2AoopmmeT72urDESMHfrCrp6EViRGle/fJ3Yaryb+z5+sbAVMrgTEV5w3g
         xkoQetndhlpmcHbeOGp6EUSMkRyo8PLTofWHP6Nyf25VuWgeJ7PY+tSFfuZj4eiLSHR8
         Uv+LdorscOfKBO8v9Ov103dDb2lLXV1LgdgsIvLuPxikRu9LLyyEe/OLy+PA0fcd2AtH
         N9nUXKeJrMmn3SrnWB+iL3+JR6Ryi7xrWdJ8BtgJLpdL3X3fkLsa9rYKtBh6QQTrs4mV
         VSCP2/3/NYXgu6FlrWJmD/RnulqFgg6o8TkF/roXrCerxuBtebIILUvxEje7j8N4MYAc
         sIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Urq5p1xoH90Draw9l3rymrwCgm46nXEYLvPhdjj3VHc=;
        b=NYVD8jxoMyt3YpycU4QEP4wQIuss/bye/NXbJ5x+Kjhh/TApU//RIUi7Y87cN5Y1IZ
         KXMzZY56Bn03Y+KvWaPTP/WdUTi8rphFrXtL6MFnH2o8+UYzE6ctHDpLcQ2biANJd5pS
         tVdf5mZbsHwqvrNIbzUTirrpzmFJQ7Ei9mTm49C4ZzB4ZHx/zM1IFePEIJWASYQXMI6O
         LSEauzTzkONzUrN3o9ypKZyD1N7Ulr/2ptwmdNFW043SZ8But2CJx9mEii78Yq1OYe7D
         Ob24tLubulGwfGSJDtf0RltWCc6soXOpEdA2eDhe969GlbDKrqsL8Vjn9oSxVfYkOkjy
         eCEQ==
X-Gm-Message-State: AOAM5318ycoQJlH3Lq7GPFRNuObtIk0APOsytHdecJu/ufiQKA9zy9HW
        dx1SZrtPZfT4iD8Lx5QNxnc=
X-Google-Smtp-Source: ABdhPJyCSgRQ2EShBeBW5cFJPBy1MD04jdSHLpDz8E3katuYAjHQUpaeGryfmDxkq3bhoRSkiCLTWQ==
X-Received: by 2002:a17:90a:6402:: with SMTP id g2mr34127646pjj.82.1622694824822;
        Wed, 02 Jun 2021 21:33:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id x15sm488156pfd.121.2021.06.02.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:33:43 -0700 (PDT)
Date:   Wed, 2 Jun 2021 21:33:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] Input: elan_i2c: Disable irq on shutdown
Message-ID: <YLhbpYq8/+JUlP27@google.com>
References: <20210510220012.2003285-1-swboyd@chromium.org>
 <YJnllh7GfuVlL3ze@google.com>
 <CAE-0n539o_DWqHbPuarWozk4Rev_d++2Da=AvOYALwvB1j3dVA@mail.gmail.com>
 <YLgt2ZJ6GZwUNL8T@google.com>
 <CAE-0n52S72vWZkzwva2_uqsMMdgdKbX7-MKtNE5PdaetyeqN2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52S72vWZkzwva2_uqsMMdgdKbX7-MKtNE5PdaetyeqN2Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 02, 2021 at 06:33:49PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Torokhov (2021-06-02 18:18:17)
> > Hi Stephen,
> >
> > Sorry for the long delay with the response.
> >
> > On Mon, May 10, 2021 at 10:11:21PM -0700, Stephen Boyd wrote:
> > > Quoting Dmitry Torokhov (2021-05-10 19:01:58)
> > > > Hi Stephen,
> > > >
> > > > On Mon, May 10, 2021 at 03:00:12PM -0700, Stephen Boyd wrote:
> > > > > Touching an elan trackpad while shutting down the system sometimes leads
> > > > > to the following warning from i2c core. This is because the irq is still
> > > > > active and working, but the i2c bus for the device has been shutdown
> > > > > already. If the bus has been taken down then we shouldn't expect
> > > > > transfers to work. Disable the irq on shutdown so that this driver
> > > > > doesn't try to get the report in the irq handler after the i2c bus is
> > > > > shutdown.
> > > > >
> > > > >  i2c i2c-7: Transfer while suspended
> > > > >  WARNING: CPU: 0 PID: 196 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0xb8/0x38c
> > > > >  Modules linked in: rfcomm algif_hash algif_skcipher af_alg uinput xt_cgroup
> > > > >  CPU: 0 PID: 196 Comm: irq/166-ekth300 Not tainted 5.4.115 #96
> > > > >  Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
> > > > >  pstate: 60c00009 (nZCv daif +PAN +UAO)
> > > > >  pc : __i2c_transfer+0xb8/0x38c
> > > > >  lr : __i2c_transfer+0xb8/0x38c
> > > > >  sp : ffffffc011793c20
> > > > >  x29: ffffffc011793c20 x28: 0000000000000000
> > > > >  x27: ffffff85efd60348 x26: ffffff85efdb8040
> > > > >  x25: ffffffec39d579cc x24: ffffffec39d57bac
> > > > >  x23: ffffffec3aab17b9 x22: ffffff85f02d6400
> > > > >  x21: 0000000000000001 x20: ffffff85f02aa190
> > > > >  x19: ffffff85f02aa100 x18: 00000000ffff0a10
> > > > >  x17: 0000000000000044 x16: 00000000000000ec
> > > > >  x15: ffffffec3a0b9174 x14: 0000000000000006
> > > > >  x13: 00000000003fe680 x12: 0000000000000000
> > > > >  x11: 0000000000000000 x10: 00000000ffffffff
> > > > >  x9 : 806da3cb9f8c1d00 x8 : 806da3cb9f8c1d00
> > > > >  x7 : 0000000000000000 x6 : ffffffec3afd3bef
> > > > >  x5 : 0000000000000000 x4 : 0000000000000000
> > > > >  x3 : 0000000000000000 x2 : fffffffffffffcc7
> > > > >  x1 : 0000000000000000 x0 : 0000000000000023
> > > > >  Call trace:
> > > > >   __i2c_transfer+0xb8/0x38c
> > > > >   i2c_transfer+0xa0/0xf4
> > > > >   i2c_transfer_buffer_flags+0x64/0x98
> > > > >   elan_i2c_get_report+0x2c/0x88
> > > > >   elan_isr+0x68/0x3e4
> > > > >   irq_thread_fn+0x2c/0x70
> > > > >   irq_thread+0xf8/0x148
> > > > >   kthread+0x140/0x17c
> > > > >   ret_from_fork+0x10/0x18
> > > >
> > > > This does not seem to me that it is Elan-specific issue. I wonder if
> > > > this should be pushed into I2C core to shut off client->irq in shutdown
> > > > for everyone.
> > >
> > > It sounds nice if we don't have to play whack-a-mole, except for the
> > > part where the irq is requested in this driver via
> > > devm_request_threaded_irq(). The i2c bus code doesn't request the irq,
> > > so it doesn't enable it, hence the responsibility of enabling and
> > > disabling the irq is on the driver.
> >
> > There is purity, and there is practicality. Drivers normally prepare
> > device for suspend and waking up from suspend, however I2C core does
> > handle enabling interrupt as wakeup source because this saves on
> > boilerplate. I2C core already does a lot of preparing for interrupt
> > being requested by drivers (parsing ACPI and DT tables, etc).
> >
> > > Maybe another option would be to
> > > disable all device irqs, similar to how that is done during suspend, but
> > > then we would need a split shutdown flow where there's irq enabled
> > > shutdown and irq disabled shutdown callbacks.
> >
> > Yes, that would be quite large patch, and probably not needed for
> > devices/buses that do not use out of bound signalling of attention.
> >
> > > That would be a large
> > > change. Similarly, disabling it in the i2c bus code would be a large
> > > change that would mean auditing each i2c driver shutdown function to
> > > make sure we don't disable the irq more than the number of times it has
> > > been enabled.
> >
> > I do not think keeping counter balanced would be important here, as we
> > are shutting down, and upon reboot everything will be reinitialized from
> > scratch. Also, we are lucky in that there is just a handful of I2C
> > drivers defining shutdown() methods.
> >
> > > Please don't make me shave this yak.
> >
> > I'm afraid someone has to... I'm adding Wolfram to CC to get his take on
> > this.
> >
> 
> I suppose another option would be to introduce some common function that
> i2c drivers can use for their shutdown op, like i2c_generic_shutdown()
> that would disable the irq? I would guess that it isn't a great idea to
> blanket disable the irq in case some i2c driver wants to do something
> that may require that irq to come in once more during shutdown to signal
> that things are off or something like that.
> 
> Would having this common function that this driver opts into work for
> you?

Opting in in this fashion will still require changes in the majority
of drivers (any I2C touchscreen or touchpad may be touched while system
is being shut down, so all of them will need to have interrupt freed or
disabled, or they may initiate I2C transfer). How about something like
this;

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 38107c0c318c..c835e7bb71de 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -603,9 +603,12 @@ static void i2c_device_shutdown(struct device *dev)
 
 	if (!client || !dev->driver)
 		return;
+
 	driver = to_i2c_driver(dev->driver);
 	if (driver->shutdown)
 		driver->shutdown(client);
+	else if (client->irq > 0)
+		disable_irq(client->irq);
 }
 
 static void i2c_client_dev_release(struct device *dev)

Thanks.

-- 
Dmitry
