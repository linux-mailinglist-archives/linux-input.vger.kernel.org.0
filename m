Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B927F3F9FA8
	for <lists+linux-input@lfdr.de>; Fri, 27 Aug 2021 21:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhH0TKs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Aug 2021 15:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhH0TKs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Aug 2021 15:10:48 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150DEC061757
        for <linux-input@vger.kernel.org>; Fri, 27 Aug 2021 12:09:59 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id k65so14385177yba.13
        for <linux-input@vger.kernel.org>; Fri, 27 Aug 2021 12:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmqpPyCViUdQ6lV2XGHo1KoClyvYrg1o5PhxAHxFrNU=;
        b=r/YqS1x4EeqispNU89qAK/xlc4TzaN4m3mOoOi3mTjNnJKjhznNasDf/9eIADbDelD
         0CDsilL8J4JRfB6z6JIZAe3cy4WN+26vfyKeO3mMW2dtHMxWAJHmCEonJhzhRFDqk1yb
         czL/CZx8zlQlvX9bwr2d8QGjjzHGdMUffXOaBNXAmL0QKWaQOObISPDdH7UuayD5X0/d
         m/k2hQmocayd68Id0D6EKkUHz6yBVveMdJEn7xSYPgPoS4mpYk2qTINVPEDH9E50xlxR
         u3xwNczNqf18h9dqHEEfQmQ080JEx8z/2peNox30LVoxAbF/ULIKtv1gQaKthrIb8mMg
         V1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmqpPyCViUdQ6lV2XGHo1KoClyvYrg1o5PhxAHxFrNU=;
        b=uDzye7ioDMq08u7n7SEJ6uB9ToYwd/iMy6fnOm1etrHJw3AMNivJoxU/GOX5AtjshD
         PXmCjmqFD2rbxjgZbSCmwoKfEnnCNwePtsrbCYbdbwoGm1oqhCEFLfsxgcuslHaoSh6U
         lzkK4jziCkv6DmYfeNhC1hzBeZd+l+cMaZSquARru3H7QAViKa4j6L7O2cUpTQeucebJ
         wdBiTfMB/gZaUk1SYSUwHtLVw3ev0CVxsUwJlGh7HqHthRO3Kz5RictFjeLShpVA9xjg
         rAdhiaTecxgrij7SmiQt8Hz5S6gegkEZhN19ft4V0r5+fEV9dvllxv60hgN6BqQsFLJb
         yCNA==
X-Gm-Message-State: AOAM533DepMJGDHzs9kNnTmQqGYtyYazyu2uflDgiHzQpJ16n88HZI8Z
        X+mqKLYFGIhjcLcZ8Rmc22ZrA1JOv5QfEZiFyRyX1g==
X-Google-Smtp-Source: ABdhPJyAq8493Ze/4BngPeKPMZmgpY2Y0wSygyb4JFj8HUfSp1QLt0YKKUJUFwKtDYkigqneF6kkcm8lGTeTRW+nL5s=
X-Received: by 2002:a25:d213:: with SMTP id j19mr7541214ybg.20.1630091398019;
 Fri, 27 Aug 2021 12:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210816074619.177383-1-wangkefeng.wang@huawei.com>
 <20210816074619.177383-4-wangkefeng.wang@huawei.com> <CAL_JsqLBddXVeP-t++wqPNp=xYF7tvEcnCbjFnK9CUBLK2+9JA@mail.gmail.com>
 <CAGETcx8SY14rcd7g=Gdwmw7sUMb=jdEV+ffuNpg6btDoL1jmWw@mail.gmail.com>
 <ee649111-dc07-d6db-8872-dcb692802236@huawei.com> <CAGETcx9drOdE_vfn-nhDZM9MbgxGxYJN6ydiAVxo_Ltqve9eTg@mail.gmail.com>
 <b5eb935f-26e1-6475-63af-e7f6101eb017@huawei.com> <CAGETcx9yaWZOzt=gcyNAshoHdPoYizhmrKS-kU9c2QM2+HqeEw@mail.gmail.com>
 <df8e7756-8b0d-d7de-a9ff-3f6eb0ffa8a5@huawei.com> <CAGETcx-47yRUcBjEdWFBtroSEkHXRNrJ4zaD8WpE0DPEPp9NxQ@mail.gmail.com>
 <85b28900-5f42-b997-2ded-0b952bc2a03e@huawei.com>
In-Reply-To: <85b28900-5f42-b997-2ded-0b952bc2a03e@huawei.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 27 Aug 2021 12:09:22 -0700
Message-ID: <CAGETcx-N4+u0iw9n5ncx_9MNnTa3ViyesxsDD7xN3jtEPT-uBw@mail.gmail.com>
Subject: Re: [BUG] amba: Remove deferred device addition
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 27, 2021 at 7:38 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
>
> On 2021/8/27 8:04, Saravana Kannan wrote:
> > On Thu, Aug 26, 2021 at 1:22 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> >>
> >>>>> Btw, I've been working on [1] cleaning up the one-off deferred probe
> >>>>> solution that we have for amba devices. That causes a bunch of other
> >>>>> headaches. Your patch 3/3 takes us further in the wrong direction by
> >>>>> adding more reasons for delaying the addition of the device.
> >> Hi Saravana, I try the link[1], but with it, there is a crash when boot
> >> (qemu-system-arm -M vexpress-a15),

I'm assuming it's this one?
arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts

> > Hi,
> >
> > It's hard to make sense of the logs. Looks like two different threads
> > might be printing to the log at the same time? Can you please enable
> > the config that prints the thread ID (forgot what it's called) and
> > collect this again? With what I could tell the crash seems to be
> > happening somewhere in platform_match(), but that's not related to
> > this patch at all?
>
> Can you reproduce it? it is very likely related(without your patch, the
> boot is fine),

Sorry, I haven't ever setup qemu and booted vexpress. Thanks for your help.

> the NULL ptr is about serio, it is registed from amba driver.
>
> ambakmi_driver_init
>
>   -- amba_kmi_probe
>
>     -- __serio_register_port

Thanks for the pointer. I took a look at the logs and the code. It's
very strange. As you can see from the backtrace, platform_match() is
being called for the device_add() from serio_handle_event(). But the
device that gets added there is on the serio_bus which obviously
should be using the serio_bus_match.

>
> +Dmitry and input maillist, is there some known issue about serio ?
>
> I add some debug, the full log is attached.
>
> [    2.958355][   T41] input: AT Raw Set 2 keyboard as
> /devices/platform/bus@8000000/bus@8000000:motherboard-bus/bus@8000000:motherboard-bus:iofpga-bus@300000000/1c060000.kmi/serio0/input/input0
> [    2.977441][   T41] serio serio1: pdev c1e05508, pdev->name (null),
> drv c1090fc0, drv->name vexpress-reset

Based on the logs you added, it's pretty clear we are getting to
platform_match(). It's also strange that the drv->name is
vexpress-reset

> [    2.977928][   T41] 8<--- cut here ---
> [    2.978162][   T41] Unhandled fault: page domain fault (0x01b) at
> 0x00000000
> [    2.978494][   T41] pgd = (ptrval)
> [    2.978819][   T41] [00000000] *pgd=00000000
> [    2.979881][   T41] Internal error: : 1b [#1] SMP ARM
> [    2.980385][   T41] Modules linked in:
> [    2.980810][   T41] CPU: 0 PID: 41 Comm: kworker/0:2 Not tainted
> 5.14.0-rc7+ #213
> [    2.981229][   T41] Hardware name: ARM-Versatile Express
> [    2.981780][   T41] Workqueue: events_long serio_handle_event
> [    2.982737][   T41] PC is at strcmp+0x18/0x44
> [    2.983030][   T41] LR is at platform_match+0xdc/0xf0
> [    2.983283][   T41] pc : [<c0560bcc>]    lr : [<c0646358>]    psr:
> 600b0013
> [    2.983572][   T41] sp : c1675d68  ip : c1675d78  fp : c1675d74
> [    2.983832][   T41] r10: 00000000  r9 : 00000000  r8 : 00000001
> [    2.984095][   T41] r7 : c1e05518  r6 : c1675df4  r5 : c1e05518  r4 :
> c1090fc0
> [    2.984395][   T41] r3 : c0a5e180  r2 : 6bede3db  r1 : c0b82a04  r0 :
> 00000000
> [    2.984906][   T41] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32 ISA
> ARM  Segment none

---- 8< ---- cleaning up a bunch of register dumps

> [    3.003113][   T41] Backtrace:
> [    3.003451][   T41] [<c0560bb4>] (strcmp) from [<c0646358>] (platform_match+0xdc/0xf0)
> [    3.003963][   T41] [<c064627c>] (platform_match) from [<c06437d4>] (__device_attach_driver+0x3c/0xf4)
> [    3.004769][   T41] [<c0643798>] (__device_attach_driver) from [<c0641180>] (bus_for_each_drv+0x68/0xc8)
> [    3.005481][   T41] [<c0641118>] (bus_for_each_drv) from [<c0642f40>] (__device_attach+0xf0/0x16c)
> [    3.006152][   T41] [<c0642e50>] (__device_attach) from [<c06439d4>] (device_initial_probe+0x1c/0x20)
> [    3.006853][   T41] [<c06439b8>] (device_initial_probe) from [<c0642030>] (bus_probe_device+0x94/0x9c)
> [    3.007259][   T41] [<c0641f9c>] (bus_probe_device) from [<c063f9cc>] (device_add+0x408/0x8b8)
> [    3.007900][   T41] [<c063f5c4>] (device_add) from [<c071c1cc>] (serio_handle_event+0x1b8/0x234)
> [    3.008824][   T41] [<c071c014>] (serio_handle_event) from [<c01475a4>] (process_one_work+0x238/0x594)
> [    3.009737][   T41] [<c014736c>] (process_one_work) from [<c014795c>] (worker_thread+0x5c/0x5f4)
> [    3.010638][   T41] [<c0147900>] (worker_thread) from [<c014feb4>] (kthread+0x178/0x194)
> [    3.011496][   T41] [<c014fd3c>] (kthread) from [<c0100150>] (ret_from_fork+0x14/0x24)
> [    3.011860][   T41] Exception stack(0xc1675fb0 to 0xc1675ff8)

But the platform_match() is happening for the device_add() from
serio_event_handle() that's adding a device to the serio_bus and it
should be using serio_bus_match().

I haven't reached any conclusion yet, but my current thought process
is that it's either:
1. My patch is somehow causing list corruption. But I don't directly
touch any list in my change (other than deleting a list entirely), so
it's not clear how that would be happening.
2. Without my patch, these AMBA device's probe would be delayed at
least until 5 seconds or possibly later. I'm wondering if my patch is
catching some bad timing assumptions in other code.

You might be able to test out theory (2) by DEFERRED_DEVICE_TIMEOUT to
a much smaller number. Say 500ms or 100ms. If it doesn't crash, it
doesn't mean it's not (2), but if it does, then we know for sure it's
(2).

I'll continue debugging further.

-Saravana

>
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index 836d6d23bba3..883a58c658c2 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -237,6 +237,7 @@ static int amba_match(struct device *dev, struct
> device_driver *drv)
>
>          if (!pcdev->periphid) {
>                  int ret = amba_read_periphid(pcdev);
> +               dev_info(dev, "%s, amba_read_periphid ret = %d\n",
> __func__, ret);
>
>                  if (ret)
>                          return ret;
> @@ -522,6 +523,7 @@ int amba_device_add(struct amba_device *dev, struct
> resource *parent)
>          /* If primecell ID isn't hard-coded, figure it out */
>          if (!dev->periphid) {
>                  ret = amba_read_periphid(dev);
> +               dev_info(&dev->dev, "%s, amba_read_periphid ret = %d\n",
> __func__, ret);
>                  if (ret && ret != -EPROBE_DEFER)
>                          goto err_release;
>                  /*
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 8640578f45e9..f7c1933c56b5 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1360,6 +1360,7 @@ static int platform_match(struct device *dev,
> struct device_driver *drv)
>          struct platform_device *pdev = to_platform_device(dev);
>          struct platform_driver *pdrv = to_platform_driver(drv);
>
> +       dev_info(dev, "pdev %px, pdev->name %s, drv %px, drv->name %s",
> pdev, pdev->name, drv, drv->name);
>          /* When driver_override is set, only bind to the matching driver */
>          if (pdev->driver_override)
>                  return !strcmp(pdev->driver_override, drv->name);
>
>
> > [1] - https://lore.kernel.org/lkml/CAGETcx8b228nDUho3cX9AAQ-pXOfZTMv8cj2vhdx9yc_pk8q+A@mail.gmail.com/
> > .
> >
> >>> .
> >>>
> > .
> >
