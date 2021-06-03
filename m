Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC07539978B
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 03:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFCBfp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 21:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhFCBfo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 21:35:44 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD45C06174A
        for <linux-input@vger.kernel.org>; Wed,  2 Jun 2021 18:33:50 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so4249699otp.11
        for <linux-input@vger.kernel.org>; Wed, 02 Jun 2021 18:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HW6JmhxnQ8NnN3D++0VAfeTT+opPSeIySjhYQR+Ks4w=;
        b=BZFPgzQMEd3tkLFJbQqD4H/umzSphsx2IRAN+toI9G/mcRGOCky9FYKQdMgXmxckLL
         MNUHGxFzJ9zzfWNXAIaiY5y3O1iJ84jGTbJnQqxJVp7iotahONtTEa1hREKloDXcJYZe
         AC2GyAH1MaQsKBRajGN/5vFShJdYKV7iFK2yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HW6JmhxnQ8NnN3D++0VAfeTT+opPSeIySjhYQR+Ks4w=;
        b=TKijTLPQzakeWbeG44Y6SBX2WS3VSaOhXgxa/ol7u/qi7PBPA/K9dNMbiUdTMKaHk2
         1dkc9zNS9NmPwGxC+/rLzPq88AjqPIgdpCr7rRROksOdFbfoKotFd7e6sUKrbt5zkqAM
         NhQ0iWa6a6L5MeFUtxEcUcLt7YN0YHSIrKeScxACzcSaEe3/yHP0LQx2K+6bktVPgRPD
         o/To2mJcuCg4HZvWkGL/+DJpLdjUJbjJwNty5eCl4biV5JYG0ZUZxnuKdDv9BjbAFeYW
         zUi664dmcCSeCKJSod8yB7Pv+pX+YFVs5vnDB/IPsKr0Gmy8+QxY0rQP6tzYGSwc59Jx
         4MFw==
X-Gm-Message-State: AOAM532jaoxlnu/ivOuVKlpvBqKx49cX0gvrjAdQbA4tStCBzukYo+FL
        gZYmI+7Ne/ujsd0gITsqWWkQ2APn/T3iU04fP61bOg==
X-Google-Smtp-Source: ABdhPJyS1G/yRiWKv8oRSfsDp9yy5+haP4zK2ZdJkDDu6TW7sZOkirdF/9vvQCfP91zUlcCMvaCsVhQgEUdVbDsa2Zc=
X-Received: by 2002:a05:6830:3154:: with SMTP id c20mr29037276ots.233.1622684029763;
 Wed, 02 Jun 2021 18:33:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 18:33:49 -0700
MIME-Version: 1.0
In-Reply-To: <YLgt2ZJ6GZwUNL8T@google.com>
References: <20210510220012.2003285-1-swboyd@chromium.org> <YJnllh7GfuVlL3ze@google.com>
 <CAE-0n539o_DWqHbPuarWozk4Rev_d++2Da=AvOYALwvB1j3dVA@mail.gmail.com> <YLgt2ZJ6GZwUNL8T@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 2 Jun 2021 18:33:49 -0700
Message-ID: <CAE-0n52S72vWZkzwva2_uqsMMdgdKbX7-MKtNE5PdaetyeqN2Q@mail.gmail.com>
Subject: Re: [PATCH] Input: elan_i2c: Disable irq on shutdown
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>, Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2021-06-02 18:18:17)
> Hi Stephen,
>
> Sorry for the long delay with the response.
>
> On Mon, May 10, 2021 at 10:11:21PM -0700, Stephen Boyd wrote:
> > Quoting Dmitry Torokhov (2021-05-10 19:01:58)
> > > Hi Stephen,
> > >
> > > On Mon, May 10, 2021 at 03:00:12PM -0700, Stephen Boyd wrote:
> > > > Touching an elan trackpad while shutting down the system sometimes leads
> > > > to the following warning from i2c core. This is because the irq is still
> > > > active and working, but the i2c bus for the device has been shutdown
> > > > already. If the bus has been taken down then we shouldn't expect
> > > > transfers to work. Disable the irq on shutdown so that this driver
> > > > doesn't try to get the report in the irq handler after the i2c bus is
> > > > shutdown.
> > > >
> > > >  i2c i2c-7: Transfer while suspended
> > > >  WARNING: CPU: 0 PID: 196 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0xb8/0x38c
> > > >  Modules linked in: rfcomm algif_hash algif_skcipher af_alg uinput xt_cgroup
> > > >  CPU: 0 PID: 196 Comm: irq/166-ekth300 Not tainted 5.4.115 #96
> > > >  Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
> > > >  pstate: 60c00009 (nZCv daif +PAN +UAO)
> > > >  pc : __i2c_transfer+0xb8/0x38c
> > > >  lr : __i2c_transfer+0xb8/0x38c
> > > >  sp : ffffffc011793c20
> > > >  x29: ffffffc011793c20 x28: 0000000000000000
> > > >  x27: ffffff85efd60348 x26: ffffff85efdb8040
> > > >  x25: ffffffec39d579cc x24: ffffffec39d57bac
> > > >  x23: ffffffec3aab17b9 x22: ffffff85f02d6400
> > > >  x21: 0000000000000001 x20: ffffff85f02aa190
> > > >  x19: ffffff85f02aa100 x18: 00000000ffff0a10
> > > >  x17: 0000000000000044 x16: 00000000000000ec
> > > >  x15: ffffffec3a0b9174 x14: 0000000000000006
> > > >  x13: 00000000003fe680 x12: 0000000000000000
> > > >  x11: 0000000000000000 x10: 00000000ffffffff
> > > >  x9 : 806da3cb9f8c1d00 x8 : 806da3cb9f8c1d00
> > > >  x7 : 0000000000000000 x6 : ffffffec3afd3bef
> > > >  x5 : 0000000000000000 x4 : 0000000000000000
> > > >  x3 : 0000000000000000 x2 : fffffffffffffcc7
> > > >  x1 : 0000000000000000 x0 : 0000000000000023
> > > >  Call trace:
> > > >   __i2c_transfer+0xb8/0x38c
> > > >   i2c_transfer+0xa0/0xf4
> > > >   i2c_transfer_buffer_flags+0x64/0x98
> > > >   elan_i2c_get_report+0x2c/0x88
> > > >   elan_isr+0x68/0x3e4
> > > >   irq_thread_fn+0x2c/0x70
> > > >   irq_thread+0xf8/0x148
> > > >   kthread+0x140/0x17c
> > > >   ret_from_fork+0x10/0x18
> > >
> > > This does not seem to me that it is Elan-specific issue. I wonder if
> > > this should be pushed into I2C core to shut off client->irq in shutdown
> > > for everyone.
> >
> > It sounds nice if we don't have to play whack-a-mole, except for the
> > part where the irq is requested in this driver via
> > devm_request_threaded_irq(). The i2c bus code doesn't request the irq,
> > so it doesn't enable it, hence the responsibility of enabling and
> > disabling the irq is on the driver.
>
> There is purity, and there is practicality. Drivers normally prepare
> device for suspend and waking up from suspend, however I2C core does
> handle enabling interrupt as wakeup source because this saves on
> boilerplate. I2C core already does a lot of preparing for interrupt
> being requested by drivers (parsing ACPI and DT tables, etc).
>
> > Maybe another option would be to
> > disable all device irqs, similar to how that is done during suspend, but
> > then we would need a split shutdown flow where there's irq enabled
> > shutdown and irq disabled shutdown callbacks.
>
> Yes, that would be quite large patch, and probably not needed for
> devices/buses that do not use out of bound signalling of attention.
>
> > That would be a large
> > change. Similarly, disabling it in the i2c bus code would be a large
> > change that would mean auditing each i2c driver shutdown function to
> > make sure we don't disable the irq more than the number of times it has
> > been enabled.
>
> I do not think keeping counter balanced would be important here, as we
> are shutting down, and upon reboot everything will be reinitialized from
> scratch. Also, we are lucky in that there is just a handful of I2C
> drivers defining shutdown() methods.
>
> > Please don't make me shave this yak.
>
> I'm afraid someone has to... I'm adding Wolfram to CC to get his take on
> this.
>

I suppose another option would be to introduce some common function that
i2c drivers can use for their shutdown op, like i2c_generic_shutdown()
that would disable the irq? I would guess that it isn't a great idea to
blanket disable the irq in case some i2c driver wants to do something
that may require that irq to come in once more during shutdown to signal
that things are off or something like that.

Would having this common function that this driver opts into work for
you?
