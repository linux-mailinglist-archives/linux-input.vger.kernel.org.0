Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4BC1FC274
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 01:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgFPXxE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 19:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgFPXxD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 19:53:03 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423CEC061573
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 16:53:02 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e4so642098ljn.4
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 16:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=8qVBHk726nsaPT/rwFh0yOQuGgaqL5gDcppc2r1LsAg=;
        b=WTq/0wDF1+h7c1bBVpf4DbryqZ02rGdBM+8GkoEvEqo01ZkRgu9ik2niBPMmid0u9r
         XZCoWVq4w7ZUoUke4saroWSVmV/qEIWf1S3Ur8GxGYEIipE1okBtQ0h7Qqt39MYO+13s
         Oi6dE/hTmmpOh8CbdDtQKsPHQPJKGtOO4YI2BvYO2QJ2HBS7iZqojwo6aMTXSu7O6c6c
         LcUj0WleINq5GgUZ9JaDjQYvwiCBiadSNIbKVKN4jTynSffQOAp82yUKa1Icu/yO/OuB
         +Klk+L7XHDRoZqqfUAQsaZ4xuVuKg/2Bjrpxzq0uje3kxuWAukkOWO27chuzQqRqjYxD
         FFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=8qVBHk726nsaPT/rwFh0yOQuGgaqL5gDcppc2r1LsAg=;
        b=h1udz09UdD6wQvv2eap/NuzO+xo8z30O/mP6xcJSy/Nib/KX+XzXFdrEqWOACWdLwm
         Q6uFaU8g5A/0I0rDF8/XTHEEJhAJPUBbQbTSOqsbI3ZnBPL0PXFFLrUAF/7YhWMwTmOO
         96nP/8GSEGGN+FZ2DoeXzan1c8yrOXOBgCDKc3keHSMITuIttCWG03qqOu4CB1RbgQfA
         v2dfA6yvn1AsK8kM5XbXTMC1ZbnwhbrRRvyCHoYGsJsOqJ5FMXgQNpgkowCcnk2X9GA8
         xY6i5HhYNCbvHkRX9xPPVETXHHE48o63cIVFLXLd76UlvT+NnPvbauWRdu9P+mRj4Wnh
         tGwQ==
X-Gm-Message-State: AOAM530X+wZXkZCNRC9g+rhBg4TgjinFmWeCjMOE21flMWyd8r/zcgcg
        LqsH6GEb5XyMzj6NuP0xh7B7Trax65BTWbDhi+6swkHKcqw=
X-Google-Smtp-Source: ABdhPJwN/GLe37w736IqZyAIChBQEwFisUhMVWGbPNJWgjbdafXqSIcaCZSF81XaVljPrH3C+4v3YiuDOjTdhoBifko=
X-Received: by 2002:a05:651c:2050:: with SMTP id t16mr2280657ljo.178.1592351579372;
 Tue, 16 Jun 2020 16:52:59 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 16 Jun 2020 20:52:47 -0300
Message-ID: <CAOMZO5CgTzo6GuXptD4mFTN=UsJJqpkixDW1Q64gqZGrij8+uQ@mail.gmail.com>
Subject: mxs_lradc_ts: Warning due to "0 is an invalid IRQ number"
To:     Marek Vasut <marex@denx.de>,
        Ksenija Stanojevic <ksenija.stanojevic@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I am seeing the following warning on a imx28-evk running linux-next:

[    7.625012] ------------[ cut here ]------------
[    7.630111] WARNING: CPU: 0 PID: 1 at drivers/base/platform.c:317
__platform_get_irq_byname+0x74/0x90
[    7.639692] 0 is an invalid IRQ number
[    7.643540] Modules linked in:
[    7.646961] CPU: 0 PID: 1 Comm: swapper Not tainted
5.8.0-rc1-next-20200616-dirty #92
[    7.654896] Hardware name: Freescale MXS (Device Tree)
[    7.660434] [<c00105ec>] (unwind_backtrace) from [<c000e070>]
(show_stack+0x10/0x14)
[    7.668591] [<c000e070>] (show_stack) from [<c001aa90>] (__warn+0xe4/0x108)
[    7.675941] [<c001aa90>] (__warn) from [<c001ab20>]
(warn_slowpath_fmt+0x6c/0xb8)
[    7.683575] [<c001ab20>] (warn_slowpath_fmt) from [<c0491b44>]
(__platform_get_irq_byname+0x74/0x90)
[    7.693101] [<c0491b44>] (__platform_get_irq_byname) from
[<c0491b70>] (platform_get_irq_byname+0x10/0x48)
[    7.703154] [<c0491b70>] (platform_get_irq_byname) from
[<c056e234>] (mxs_lradc_ts_probe+0x190/0x384)
[    7.712771] [<c056e234>] (mxs_lradc_ts_probe) from [<c0491850>]
(platform_drv_probe+0x48/0x98)
[    7.722806] [<c0491850>] (platform_drv_probe) from [<c048f7f0>]
(really_probe+0x218/0x348)
[    7.731530] [<c048f7f0>] (really_probe) from [<c048fa28>]
(driver_probe_device+0x58/0xb4)
[    7.740189] [<c048fa28>] (driver_probe_device) from [<c048fc2c>]
(device_driver_attach+0x58/0x60)
[    7.749471] [<c048fc2c>] (device_driver_attach) from [<c048fcb8>]
(__driver_attach+0x84/0xc0)
[    7.758394] [<c048fcb8>] (__driver_attach) from [<c048db28>]
(bus_for_each_dev+0x70/0xb4)
[    7.766977] [<c048db28>] (bus_for_each_dev) from [<c048eb24>]
(bus_add_driver+0x154/0x1e0)
[    7.775385] [<c048eb24>] (bus_add_driver) from [<c0490774>]
(driver_register+0x74/0x108)
[    7.783872] [<c0490774>] (driver_register) from [<c000a2fc>]
(do_one_initcall+0x68/0x268)
[    7.792467] [<c000a2fc>] (do_one_initcall) from [<c0a00fa0>]
(kernel_init_freeable+0x160/0x1f4)
[    7.801661] [<c0a00fa0>] (kernel_init_freeable) from [<c0720c58>]
(kernel_init+0x8/0xf4)
[    7.810165] [<c0720c58>] (kernel_init) from [<c0008510>]
(ret_from_fork+0x14/0x24)
[    7.818101] Exception stack(0xc748dfb0 to 0xc748dff8)
[    7.823273] dfa0:                                     00000000
00000000 00000000 00000000
[    7.831815] dfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    7.840351] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.847322] irq event stamp: 273303
[    7.850940] hardirqs last  enabled at (273311): [<c0066ed8>]
console_unlock+0x390/0x534
[    7.859314] hardirqs last disabled at (273328): [<c0066b8c>]
console_unlock+0x44/0x534
[    7.867605] softirqs last  enabled at (273344): [<c00097fc>]
__do_softirq+0x2d4/0x450
[    7.875817] softirqs last disabled at (273355): [<c001fe48>]
irq_exit+0x150/0x174
[    7.883472] ---[ end trace ddb222ada5cbf5cd ]---
[    7.900004] input: mxs-lradc-ts as
/devices/soc0/80000000.apb/80040000.apbx/80050000.lradc/mxs-lradc-ts/input/input0

The touchscreen irq is defined as:

enum mx28_lradc_irqs {
MX28_LRADC_TS_IRQ = 0,

Shouldn't we retrieve the IRQ number from the device tree instead?

Thanks,

Fabio Estevam
