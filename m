Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17F34043F6
	for <lists+linux-input@lfdr.de>; Thu,  9 Sep 2021 05:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349727AbhIIDcM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 23:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244614AbhIIDcK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Sep 2021 23:32:10 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAE9C06175F
        for <linux-input@vger.kernel.org>; Wed,  8 Sep 2021 20:31:01 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id s16so1150338ybe.0
        for <linux-input@vger.kernel.org>; Wed, 08 Sep 2021 20:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SKuiG7fSaLUtvrOY7AskCWh9YOWHRbtwHIiErMRt3Fo=;
        b=q+i5ei6FXsm719Iu9GiQExVUePgwzXZb8Omuxge6SPboGL3SJUUyvX+hWHEHM55VxW
         0ODi5fHeNhvwUnWHR1OfsWeuyKKBSt5PBZOsVYBKyDVtugD/lfnNrINchGccOGl+dk5r
         ItHQuRTiEhofv3WtTa6MfLN+zhuRvLVHf2Mh5PutIS8kdunXD3w3yG+L2kFdZyblFuZR
         sIdrQflGLYYTzYdRd0G/+9O4G1CGDGORrtEb8N2Md0RJy4a5qsx2vrw4MRGbt3hMsqn6
         znvqu8KGkQKpJHs79XM9BXzUX2uudbKhdbcnvoTelIPDfVuplwwqFvD2oG0GVA6cBeUf
         9ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SKuiG7fSaLUtvrOY7AskCWh9YOWHRbtwHIiErMRt3Fo=;
        b=1bjFhpCDVDHuRi9uor1N/MoVLsKAvfsn84mI6Y4bO5xHk/oIjkHQOEAXheconOWKHf
         l2RHTL1Ga31oCYFV834q+p3bHsNdE0WyorRS3f9Q3ttLKuEdSmPkDwgWMMqjBWnB8p0k
         JduuX1DNt3pgDCRjMGttcXfOY5dg3lSlEQhCJmJT/0m9CmyLiG5xPjyuwEJDGGwnFBjh
         C1e1ckmQQ1372wRdmHqeuY/UqkKqCv3iQEyI3lsneXeNUPhVsmQD1mZ92Tc3J1T74gyd
         2r0h5+623i3mTebcVzC0tvrzeIAPIXqpLvN94U7b+3NYX+YmCGOrUhYNYCax0pR+s3gD
         4HzA==
X-Gm-Message-State: AOAM531gbsU0Ed1QzS77xLBgn+7Tetd2dKb0v9P2dhqYUt4pdpuvY73f
        Wc8GRIoza9IgLHN2//AOlKcfYhdAYVpkFg3UHKqjwQ==
X-Google-Smtp-Source: ABdhPJwhXa9uKVvpkTonPsJSkl25kEg1AeeAQozeAA4vApKSgEke+CqyqNJnFYaPY3f4KhX9hHc42qL1B4az4TeZF7c=
X-Received: by 2002:a25:21c5:: with SMTP id h188mr930531ybh.23.1631158260632;
 Wed, 08 Sep 2021 20:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210816074619.177383-1-wangkefeng.wang@huawei.com>
 <20210816074619.177383-4-wangkefeng.wang@huawei.com> <CAL_JsqLBddXVeP-t++wqPNp=xYF7tvEcnCbjFnK9CUBLK2+9JA@mail.gmail.com>
 <CAGETcx8SY14rcd7g=Gdwmw7sUMb=jdEV+ffuNpg6btDoL1jmWw@mail.gmail.com>
 <ee649111-dc07-d6db-8872-dcb692802236@huawei.com> <CAGETcx9drOdE_vfn-nhDZM9MbgxGxYJN6ydiAVxo_Ltqve9eTg@mail.gmail.com>
 <b5eb935f-26e1-6475-63af-e7f6101eb017@huawei.com> <CAGETcx9yaWZOzt=gcyNAshoHdPoYizhmrKS-kU9c2QM2+HqeEw@mail.gmail.com>
 <df8e7756-8b0d-d7de-a9ff-3f6eb0ffa8a5@huawei.com> <CAGETcx-47yRUcBjEdWFBtroSEkHXRNrJ4zaD8WpE0DPEPp9NxQ@mail.gmail.com>
 <85b28900-5f42-b997-2ded-0b952bc2a03e@huawei.com> <CAGETcx-N4+u0iw9n5ncx_9MNnTa3ViyesxsDD7xN3jtEPT-uBw@mail.gmail.com>
 <265bb783-10da-a7c1-2625-055dec5643a3@huawei.com>
In-Reply-To: <265bb783-10da-a7c1-2625-055dec5643a3@huawei.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Sep 2021 20:30:24 -0700
Message-ID: <CAGETcx9m4=7V25nvYa0030ChKeJw5bu3ogs6gjFpjNKdq+_B_Q@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 27, 2021 at 6:09 PM Kefeng Wang <wangkefeng.wang@huawei.com> wr=
ote:
>
>
> On 2021/8/28 3:09, Saravana Kannan wrote:
> > On Fri, Aug 27, 2021 at 7:38 AM Kefeng Wang <wangkefeng.wang@huawei.com=
> wrote:
> >>
> >> On 2021/8/27 8:04, Saravana Kannan wrote:
> >>> On Thu, Aug 26, 2021 at 1:22 AM Kefeng Wang <wangkefeng.wang@huawei.c=
om> wrote:
> >>>>>>> Btw, I've been working on [1] cleaning up the one-off deferred pr=
obe
> >>>>>>> solution that we have for amba devices. That causes a bunch of ot=
her
> >>>>>>> headaches. Your patch 3/3 takes us further in the wrong direction=
 by
> >>>>>>> adding more reasons for delaying the addition of the device.
> >>>> Hi Saravana, I try the link[1], but with it, there is a crash when b=
oot
> >>>> (qemu-system-arm -M vexpress-a15),
> > I'm assuming it's this one?
> > arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
>
> I use arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts.
>
> qemu-system-arm -M vexpress-a15 -dtb vexpress-v2p-ca15-tc1.dtb -cpu
> cortex-a15 -smp 2 -m size=3D3G -kernel zImage -rtc base=3Dlocaltime -init=
rd
> initrd-arm32 -append 'console=3DttyAMA0 cma=3D0 kfence.sample_interval=3D=
0
> earlyprintk debug ' -device virtio-net-device,netdev=3Dnet8 -netdev
> type=3Dtap,id=3Dnet8,script=3D/etc/qemu-ifup,downscript=3D/etc/qemu-ifdow=
n
> -nographic
>
> >
> >>> Hi,
> >>>
> >>> It's hard to make sense of the logs. Looks like two different threads
> >>> might be printing to the log at the same time? Can you please enable
> >>> the config that prints the thread ID (forgot what it's called) and
> >>> collect this again? With what I could tell the crash seems to be
> >>> happening somewhere in platform_match(), but that's not related to
> >>> this patch at all?
> >> Can you reproduce it? it is very likely related(without your patch, th=
e
> >> boot is fine),
> > Sorry, I haven't ever setup qemu and booted vexpress. Thanks for your h=
elp.
> >
> >> the NULL ptr is about serio, it is registed from amba driver.
> >>
> >> ambakmi_driver_init
> >>
> >>    -- amba_kmi_probe
> >>
> >>      -- __serio_register_port
> > Thanks for the pointer. I took a look at the logs and the code. It's
> > very strange. As you can see from the backtrace, platform_match() is
> > being called for the device_add() from serio_handle_event(). But the
> > device that gets added there is on the serio_bus which obviously
> > should be using the serio_bus_match.
> Yes, I am confused too.
> >
> >> +Dmitry and input maillist, is there some known issue about serio ?
> >>
> >> I add some debug, the full log is attached.
> >>
> >> [    2.958355][   T41] input: AT Raw Set 2 keyboard as
> >> /devices/platform/bus@8000000/bus@8000000:motherboard-bus/bus@8000000:=
motherboard-bus:iofpga-bus@300000000/1c060000.kmi/serio0/input/input0
> >> [    2.977441][   T41] serio serio1: pdev c1e05508, pdev->name (null),
> >> drv c1090fc0, drv->name vexpress-reset
> > Based on the logs you added, it's pretty clear we are getting to
> > platform_match(). It's also strange that the drv->name is
> > vexpress-reset
> ...
> >
> >> [    3.003113][   T41] Backtrace:
> >> [    3.003451][   T41] [<c0560bb4>] (strcmp) from [<c0646358>] (platfo=
rm_match+0xdc/0xf0)
> >> [    3.003963][   T41] [<c064627c>] (platform_match) from [<c06437d4>]=
 (__device_attach_driver+0x3c/0xf4)
> >> [    3.004769][   T41] [<c0643798>] (__device_attach_driver) from [<c0=
641180>] (bus_for_each_drv+0x68/0xc8)
> >> [    3.005481][   T41] [<c0641118>] (bus_for_each_drv) from [<c0642f40=
>] (__device_attach+0xf0/0x16c)
> >> [    3.006152][   T41] [<c0642e50>] (__device_attach) from [<c06439d4>=
] (device_initial_probe+0x1c/0x20)
> >> [    3.006853][   T41] [<c06439b8>] (device_initial_probe) from [<c064=
2030>] (bus_probe_device+0x94/0x9c)
> >> [    3.007259][   T41] [<c0641f9c>] (bus_probe_device) from [<c063f9cc=
>] (device_add+0x408/0x8b8)
> >> [    3.007900][   T41] [<c063f5c4>] (device_add) from [<c071c1cc>] (se=
rio_handle_event+0x1b8/0x234)
> >> [    3.008824][   T41] [<c071c014>] (serio_handle_event) from [<c01475=
a4>] (process_one_work+0x238/0x594)
> >> [    3.009737][   T41] [<c014736c>] (process_one_work) from [<c014795c=
>] (worker_thread+0x5c/0x5f4)
> >> [    3.010638][   T41] [<c0147900>] (worker_thread) from [<c014feb4>] =
(kthread+0x178/0x194)
> >> [    3.011496][   T41] [<c014fd3c>] (kthread) from [<c0100150>] (ret_f=
rom_fork+0x14/0x24)
> >> [    3.011860][   T41] Exception stack(0xc1675fb0 to 0xc1675ff8)
> > But the platform_match() is happening for the device_add() from
> > serio_event_handle() that's adding a device to the serio_bus and it
> > should be using serio_bus_match().
> >
> > I haven't reached any conclusion yet, but my current thought process
> > is that it's either:
> > 1. My patch is somehow causing list corruption. But I don't directly
> > touch any list in my change (other than deleting a list entirely), so
> > it's not clear how that would be happening.
>
> Maybe some concurrent driver load=EF=BC=9F
>
> > 2. Without my patch, these AMBA device's probe would be delayed at
> > least until 5 seconds or possibly later. I'm wondering if my patch is
> > catching some bad timing assumptions in other code.
>
> After Rob's patch, It will retry soon.
>
> commit 039599c92d3b2e73689e8b6e519d653fd4770abb
> Author: Rob Herring <robh@kernel.org>
> Date:   Wed Apr 29 15:58:12 2020 -0500
>
>      amba: Retry adding deferred devices at late_initcall
>
>      If amba bus devices defer when adding, the amba bus code simply retr=
ies
>      adding the devices every 5 seconds. This doesn't work well as it
>      completely unsynchronized with starting the init process which can
>      happen in less than 5 secs. Add a retry during late_initcall. If the
>      amba devices are added, then deferred probe takes over. If the
>      dependencies have not probed at this point, then there's no improvem=
ent
>      over previous behavior. To completely solve this, we'd need to retry
>      after every successful probe as deferred probe does.
>
>      The list_empty() check now happens outside the mutex, but the mutex
>      wasn't necessary in the first place.
>
>      This needed to use deferred probe instead of fragile initcall orderi=
ng
>      on 32-bit VExpress systems where the apb_pclk has a number of probe
>      dependencies (vexpress-sysregs, vexpress-config).
>
>
> >
> > You might be able to test out theory (2) by DEFERRED_DEVICE_TIMEOUT to
> > a much smaller number. Say 500ms or 100ms. If it doesn't crash, it
> > doesn't mean it's not (2), but if it does, then we know for sure it's
> > (2).
> ok, I will try this one, but due to above patch, it may not work.

Were you able to find anything more?

-Saravana
