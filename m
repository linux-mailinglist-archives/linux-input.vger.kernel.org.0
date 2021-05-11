Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB503379F02
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 07:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhEKFM2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 01:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhEKFM2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 01:12:28 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95782C06175F
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 22:11:22 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso16504133otn.3
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 22:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7oDQMz9t4AtL3UdUrA20txvqhShBWFIQ8bBa91mvX/M=;
        b=aNKKM2SyQxeKqM19kJrfARsecbuQbVPC/fPYIBd58WSEa0f+y3A895JVHmia3g+sF7
         TAv73ymGHiGqlQGErhnnL/nXGOlplwxkcOPfcbI2p3NL4fY6x5bG2BNpsJnVaRLtTs4A
         yuhdodGXPdc0ubN7r3Bx/F5JPNVeQyyYLtAv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7oDQMz9t4AtL3UdUrA20txvqhShBWFIQ8bBa91mvX/M=;
        b=H7Ivlk4zlZFEvBO4EDACYNBA+VRxpY9Z7DGxrToGIH3UXWvczcles8jysi5Ymb3H55
         T7UtXDgF2ZX/p67VMM0M0iT77OKWQkraFJK8795ydQhkyOfbewkN3rKA7dpHc7RQnB+b
         HtP5pcPbnQeLWR90Uy+ndlEHdtL3sgwAdxS8IkxrIU+MmY/gOo8+1H/HLphD2t0Yg+7Q
         z3PHKRU6Y+182t6BEr6LH5CA0VtjlyhnFVLzYiD0VyPN0zYJV0uNW6T3dI7yliIZrmnt
         N3P5y5R+gQno5H6F1CS/XTwXhY2mv+cp0UwSzhCkqTVSJ+ylvogNioEIxS1xDP8ajKt6
         NUZw==
X-Gm-Message-State: AOAM531T0ZjDQtBgk+yi8Y4E/DBTTDhe4/TJf7OZJdLWHK8aBfyxzXeR
        j+eGfsq31/YDWbM8AMIOFntwu1bUEp9dGE3OrOIlE5D7ycs=
X-Google-Smtp-Source: ABdhPJzbFwjNfWIOqMSBhORhmph4qPTWiNPIoGHPrv8WSDpHxXAu5NdDbAUfmLXvaMTXNpByYXRxoCv8awsJ3XOXZzs=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr25327758otn.233.1620709881874;
 Mon, 10 May 2021 22:11:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 22:11:21 -0700
MIME-Version: 1.0
In-Reply-To: <YJnllh7GfuVlL3ze@google.com>
References: <20210510220012.2003285-1-swboyd@chromium.org> <YJnllh7GfuVlL3ze@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 10 May 2021 22:11:21 -0700
Message-ID: <CAE-0n539o_DWqHbPuarWozk4Rev_d++2Da=AvOYALwvB1j3dVA@mail.gmail.com>
Subject: Re: [PATCH] Input: elan_i2c: Disable irq on shutdown
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2021-05-10 19:01:58)
> Hi Stephen,
>
> On Mon, May 10, 2021 at 03:00:12PM -0700, Stephen Boyd wrote:
> > Touching an elan trackpad while shutting down the system sometimes leads
> > to the following warning from i2c core. This is because the irq is still
> > active and working, but the i2c bus for the device has been shutdown
> > already. If the bus has been taken down then we shouldn't expect
> > transfers to work. Disable the irq on shutdown so that this driver
> > doesn't try to get the report in the irq handler after the i2c bus is
> > shutdown.
> >
> >  i2c i2c-7: Transfer while suspended
> >  WARNING: CPU: 0 PID: 196 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0xb8/0x38c
> >  Modules linked in: rfcomm algif_hash algif_skcipher af_alg uinput xt_cgroup
> >  CPU: 0 PID: 196 Comm: irq/166-ekth300 Not tainted 5.4.115 #96
> >  Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
> >  pstate: 60c00009 (nZCv daif +PAN +UAO)
> >  pc : __i2c_transfer+0xb8/0x38c
> >  lr : __i2c_transfer+0xb8/0x38c
> >  sp : ffffffc011793c20
> >  x29: ffffffc011793c20 x28: 0000000000000000
> >  x27: ffffff85efd60348 x26: ffffff85efdb8040
> >  x25: ffffffec39d579cc x24: ffffffec39d57bac
> >  x23: ffffffec3aab17b9 x22: ffffff85f02d6400
> >  x21: 0000000000000001 x20: ffffff85f02aa190
> >  x19: ffffff85f02aa100 x18: 00000000ffff0a10
> >  x17: 0000000000000044 x16: 00000000000000ec
> >  x15: ffffffec3a0b9174 x14: 0000000000000006
> >  x13: 00000000003fe680 x12: 0000000000000000
> >  x11: 0000000000000000 x10: 00000000ffffffff
> >  x9 : 806da3cb9f8c1d00 x8 : 806da3cb9f8c1d00
> >  x7 : 0000000000000000 x6 : ffffffec3afd3bef
> >  x5 : 0000000000000000 x4 : 0000000000000000
> >  x3 : 0000000000000000 x2 : fffffffffffffcc7
> >  x1 : 0000000000000000 x0 : 0000000000000023
> >  Call trace:
> >   __i2c_transfer+0xb8/0x38c
> >   i2c_transfer+0xa0/0xf4
> >   i2c_transfer_buffer_flags+0x64/0x98
> >   elan_i2c_get_report+0x2c/0x88
> >   elan_isr+0x68/0x3e4
> >   irq_thread_fn+0x2c/0x70
> >   irq_thread+0xf8/0x148
> >   kthread+0x140/0x17c
> >   ret_from_fork+0x10/0x18
>
> This does not seem to me that it is Elan-specific issue. I wonder if
> this should be pushed into I2C core to shut off client->irq in shutdown
> for everyone.

It sounds nice if we don't have to play whack-a-mole, except for the
part where the irq is requested in this driver via
devm_request_threaded_irq(). The i2c bus code doesn't request the irq,
so it doesn't enable it, hence the responsibility of enabling and
disabling the irq is on the driver. Maybe another option would be to
disable all device irqs, similar to how that is done during suspend, but
then we would need a split shutdown flow where there's irq enabled
shutdown and irq disabled shutdown callbacks. That would be a large
change. Similarly, disabling it in the i2c bus code would be a large
change that would mean auditing each i2c driver shutdown function to
make sure we don't disable the irq more than the number of times it has
been enabled. Please don't make me shave this yak.

>
> >
> > Cc: Jingle Wu <jingle.wu@emc.com.tw>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/input/mouse/elan_i2c_core.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> > index bef73822315d..6f64992e70d1 100644
> > --- a/drivers/input/mouse/elan_i2c_core.c
> > +++ b/drivers/input/mouse/elan_i2c_core.c
> > @@ -1338,6 +1338,22 @@ static int elan_probe(struct i2c_client *client,
> >       return 0;
> >  }
> >
> > +static void elan_shutdown(struct i2c_client *client)
> > +{
> > +     struct elan_tp_data *data = i2c_get_clientdata(client);
> > +
> > +     /*
> > +      * Make sure we don't access i2c bus after it is shutdown.
> > +      *
> > +      * We are taking the mutex to make sure sysfs operations are
> > +      * complete before we attempt to silence the device by disabling
> > +      * the irq.
> > +      */
>
> I do not think important on shutdown as I expect we'll stop/kill
> userspace first, and then fully reinitialize device on subsequent boot.

Alright sure. I was worried about some process that may still be running
given that shutdown/restart doesn't actually stop/freeze all processes
like suspend does. If you're not worried about something like a firmware
update happening in parallel with the restart syscall then OK. Cutting
those things off may mean they don't work properly, but we're already
shutting down so all bets are off.
