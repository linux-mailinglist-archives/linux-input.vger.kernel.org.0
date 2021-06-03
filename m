Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05156399772
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 03:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCBVV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 21:21:21 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:41837 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhFCBVV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 21:21:21 -0400
Received: by mail-pf1-f182.google.com with SMTP id x73so3618978pfc.8;
        Wed, 02 Jun 2021 18:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ty3N7sz7ZZbHEgvRJz/Q8HvbgGySKCHnxTu2C1iByKI=;
        b=aVGEzYhMcPq1PSs5K3PDR6aVZ8h9m3/44j7bTQ77PUenUyGWdP2XTO+IOp9TbtMYJG
         JvuLEY406xZ/75vjegL6MGLOMDg8Y1Xxs4VM/ZVSEclOuh9puekrxOh5QYxni9Bn90Uq
         BokVXwwfkgfVrAD+4KYSuo6jBtfKUvDf6oTEf9rkVLFvHc+/w4DVBRlShz2odowguXDe
         mtn6eh829+QKd31L07ZUl9VJ85+a7lQcQdunE3x1HumEsylOeqSfvheYk1RK4yMsWVRb
         NwzVEWbybiDh3rJWA6WiYB7W/UCyIwwCvDe61YlfIwneAXYuYGCkKgHb4UxtaPzA1nIE
         BW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ty3N7sz7ZZbHEgvRJz/Q8HvbgGySKCHnxTu2C1iByKI=;
        b=O+K3K4GrvQZAZU545oJFId2IiYwN4bCzgIMlIjVBWaNgG1cxRj/Zot55Jo+t0XF7sc
         SSvxrgsTBRtm38ySBSJR5yzWAmeun4Tzn47d5vfKJ6p8dDv7lXkP1GPEMo4tkz0S4M1Y
         OCHKUrFb6ebB12E635AoZXo68mSaqbJoa7NkMLUVrLtPg1rRkzRFCY00s6qF+8c8d7Bi
         KDBY+9vn/Nhue1XNxc4NM75drr0OgrihoOow9Q57C1Cp6h+9hHPeIbMYJ41jpj/4LwX+
         o7EAp3vmTzZjiCWwbE87kzUuZiaePTrRlSJbIgXc44V1rVt62h56D3sydbE80Ud7WXUy
         YWfw==
X-Gm-Message-State: AOAM530MJNSTuRIdkxbsmK8PfY1HjMic8Iz4axU5XTYb/53+btU+240C
        ySiHPzM603++JpYZCNQmuVE=
X-Google-Smtp-Source: ABdhPJzWyALYef0ZMvpo7kjvQ9cOuhrMTX3GtqQgask8ftaSg2mUJbZJcAofxDtHCqnDvs9mcdnEFg==
X-Received: by 2002:a63:104a:: with SMTP id 10mr37093356pgq.66.1622683100756;
        Wed, 02 Jun 2021 18:18:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id k15sm560404pjf.32.2021.06.02.18.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 18:18:19 -0700 (PDT)
Date:   Wed, 2 Jun 2021 18:18:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] Input: elan_i2c: Disable irq on shutdown
Message-ID: <YLgt2ZJ6GZwUNL8T@google.com>
References: <20210510220012.2003285-1-swboyd@chromium.org>
 <YJnllh7GfuVlL3ze@google.com>
 <CAE-0n539o_DWqHbPuarWozk4Rev_d++2Da=AvOYALwvB1j3dVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n539o_DWqHbPuarWozk4Rev_d++2Da=AvOYALwvB1j3dVA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephen,

Sorry for the long delay with the response.

On Mon, May 10, 2021 at 10:11:21PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Torokhov (2021-05-10 19:01:58)
> > Hi Stephen,
> >
> > On Mon, May 10, 2021 at 03:00:12PM -0700, Stephen Boyd wrote:
> > > Touching an elan trackpad while shutting down the system sometimes leads
> > > to the following warning from i2c core. This is because the irq is still
> > > active and working, but the i2c bus for the device has been shutdown
> > > already. If the bus has been taken down then we shouldn't expect
> > > transfers to work. Disable the irq on shutdown so that this driver
> > > doesn't try to get the report in the irq handler after the i2c bus is
> > > shutdown.
> > >
> > >  i2c i2c-7: Transfer while suspended
> > >  WARNING: CPU: 0 PID: 196 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0xb8/0x38c
> > >  Modules linked in: rfcomm algif_hash algif_skcipher af_alg uinput xt_cgroup
> > >  CPU: 0 PID: 196 Comm: irq/166-ekth300 Not tainted 5.4.115 #96
> > >  Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
> > >  pstate: 60c00009 (nZCv daif +PAN +UAO)
> > >  pc : __i2c_transfer+0xb8/0x38c
> > >  lr : __i2c_transfer+0xb8/0x38c
> > >  sp : ffffffc011793c20
> > >  x29: ffffffc011793c20 x28: 0000000000000000
> > >  x27: ffffff85efd60348 x26: ffffff85efdb8040
> > >  x25: ffffffec39d579cc x24: ffffffec39d57bac
> > >  x23: ffffffec3aab17b9 x22: ffffff85f02d6400
> > >  x21: 0000000000000001 x20: ffffff85f02aa190
> > >  x19: ffffff85f02aa100 x18: 00000000ffff0a10
> > >  x17: 0000000000000044 x16: 00000000000000ec
> > >  x15: ffffffec3a0b9174 x14: 0000000000000006
> > >  x13: 00000000003fe680 x12: 0000000000000000
> > >  x11: 0000000000000000 x10: 00000000ffffffff
> > >  x9 : 806da3cb9f8c1d00 x8 : 806da3cb9f8c1d00
> > >  x7 : 0000000000000000 x6 : ffffffec3afd3bef
> > >  x5 : 0000000000000000 x4 : 0000000000000000
> > >  x3 : 0000000000000000 x2 : fffffffffffffcc7
> > >  x1 : 0000000000000000 x0 : 0000000000000023
> > >  Call trace:
> > >   __i2c_transfer+0xb8/0x38c
> > >   i2c_transfer+0xa0/0xf4
> > >   i2c_transfer_buffer_flags+0x64/0x98
> > >   elan_i2c_get_report+0x2c/0x88
> > >   elan_isr+0x68/0x3e4
> > >   irq_thread_fn+0x2c/0x70
> > >   irq_thread+0xf8/0x148
> > >   kthread+0x140/0x17c
> > >   ret_from_fork+0x10/0x18
> >
> > This does not seem to me that it is Elan-specific issue. I wonder if
> > this should be pushed into I2C core to shut off client->irq in shutdown
> > for everyone.
> 
> It sounds nice if we don't have to play whack-a-mole, except for the
> part where the irq is requested in this driver via
> devm_request_threaded_irq(). The i2c bus code doesn't request the irq,
> so it doesn't enable it, hence the responsibility of enabling and
> disabling the irq is on the driver.

There is purity, and there is practicality. Drivers normally prepare
device for suspend and waking up from suspend, however I2C core does
handle enabling interrupt as wakeup source because this saves on
boilerplate. I2C core already does a lot of preparing for interrupt
being requested by drivers (parsing ACPI and DT tables, etc).

> Maybe another option would be to
> disable all device irqs, similar to how that is done during suspend, but
> then we would need a split shutdown flow where there's irq enabled
> shutdown and irq disabled shutdown callbacks.

Yes, that would be quite large patch, and probably not needed for
devices/buses that do not use out of bound signalling of attention.

> That would be a large
> change. Similarly, disabling it in the i2c bus code would be a large
> change that would mean auditing each i2c driver shutdown function to
> make sure we don't disable the irq more than the number of times it has
> been enabled.

I do not think keeping counter balanced would be important here, as we
are shutting down, and upon reboot everything will be reinitialized from
scratch. Also, we are lucky in that there is just a handful of I2C
drivers defining shutdown() methods.

> Please don't make me shave this yak.

I'm afraid someone has to... I'm adding Wolfram to CC to get his take on
this.

Thanks.

-- 
Dmitry
