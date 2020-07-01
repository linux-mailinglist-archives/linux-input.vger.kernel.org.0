Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C6B211634
	for <lists+linux-input@lfdr.de>; Thu,  2 Jul 2020 00:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgGAWls (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jul 2020 18:41:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgGAWlr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Jul 2020 18:41:47 -0400
Received: from localhost (mobile-166-175-191-139.mycingular.net [166.175.191.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED3362082F;
        Wed,  1 Jul 2020 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593643307;
        bh=n2vGfZSBPjybhWDA+g1S8i5WOzxKsIimFmP4WaB3i/k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=TUG0m1DmEwhAYs7l/5QTJrOhDJDby5unDa852whT5oB/UNlvATBgfsnl/26I5DcA/
         vpv2Nom93bhpOJJw0DR+hmCK4/MgE+GNHnfgbqO005+8G7SDuA6AOtBSfyjIbvWSd3
         yiteYTEVRnZ5ALyh3h6W2QSfOliqQVipE5abOG0s=
Date:   Wed, 1 Jul 2020 17:41:45 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        Ksenija Stanojevic <ksenija.stanojevic@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: mxs_lradc_ts: Warning due to "0 is an invalid IRQ number"
Message-ID: <20200701224145.GA3616172@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5D7z=Eg=WYgzrpqn9VoU8HxMeBbEZiv9KLjMVD1_kRo+w@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[+cc Rob, LKML for visibility & archive]

On Wed, Jul 01, 2020 at 12:32:48PM -0300, Fabio Estevam wrote:
> On Tue, Jun 16, 2020 at 8:52 PM Fabio Estevam <festevam@gmail.com> wrote:
> > I am seeing the following warning on a imx28-evk running linux-next:
> >
> > [    7.625012] ------------[ cut here ]------------
> > [    7.630111] WARNING: CPU: 0 PID: 1 at drivers/base/platform.c:317
> > __platform_get_irq_byname+0x74/0x90
> > [    7.639692] 0 is an invalid IRQ number
> > [    7.643540] Modules linked in:
> > [    7.646961] CPU: 0 PID: 1 Comm: swapper Not tainted
> > 5.8.0-rc1-next-20200616-dirty #92
> > [    7.654896] Hardware name: Freescale MXS (Device Tree)
> > [    7.660434] [<c00105ec>] (unwind_backtrace) from [<c000e070>]
> > (show_stack+0x10/0x14)
> > [    7.668591] [<c000e070>] (show_stack) from [<c001aa90>] (__warn+0xe4/0x108)
> > [    7.675941] [<c001aa90>] (__warn) from [<c001ab20>]
> > (warn_slowpath_fmt+0x6c/0xb8)
> > [    7.683575] [<c001ab20>] (warn_slowpath_fmt) from [<c0491b44>]
> > (__platform_get_irq_byname+0x74/0x90)
> > [    7.693101] [<c0491b44>] (__platform_get_irq_byname) from
> > [<c0491b70>] (platform_get_irq_byname+0x10/0x48)
> > [    7.703154] [<c0491b70>] (platform_get_irq_byname) from
> > [<c056e234>] (mxs_lradc_ts_probe+0x190/0x384)
> > [    7.712771] [<c056e234>] (mxs_lradc_ts_probe) from [<c0491850>]
> > (platform_drv_probe+0x48/0x98)
> > [    7.722806] [<c0491850>] (platform_drv_probe) from [<c048f7f0>]
> > (really_probe+0x218/0x348)
> > [    7.731530] [<c048f7f0>] (really_probe) from [<c048fa28>]
> > (driver_probe_device+0x58/0xb4)
> > [    7.740189] [<c048fa28>] (driver_probe_device) from [<c048fc2c>]
> > (device_driver_attach+0x58/0x60)
> > [    7.749471] [<c048fc2c>] (device_driver_attach) from [<c048fcb8>]
> > (__driver_attach+0x84/0xc0)
> > [    7.758394] [<c048fcb8>] (__driver_attach) from [<c048db28>]
> > (bus_for_each_dev+0x70/0xb4)
> > [    7.766977] [<c048db28>] (bus_for_each_dev) from [<c048eb24>]
> > (bus_add_driver+0x154/0x1e0)
> > [    7.775385] [<c048eb24>] (bus_add_driver) from [<c0490774>]
> > (driver_register+0x74/0x108)
> > [    7.783872] [<c0490774>] (driver_register) from [<c000a2fc>]
> > (do_one_initcall+0x68/0x268)
> > [    7.792467] [<c000a2fc>] (do_one_initcall) from [<c0a00fa0>]
> > (kernel_init_freeable+0x160/0x1f4)
> > [    7.801661] [<c0a00fa0>] (kernel_init_freeable) from [<c0720c58>]
> > (kernel_init+0x8/0xf4)
> > [    7.810165] [<c0720c58>] (kernel_init) from [<c0008510>]
> > (ret_from_fork+0x14/0x24)
> > [    7.818101] Exception stack(0xc748dfb0 to 0xc748dff8)
> > [    7.823273] dfa0:                                     00000000
> > 00000000 00000000 00000000
> > [    7.831815] dfc0: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000 00000000
> > [    7.840351] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [    7.847322] irq event stamp: 273303
> > [    7.850940] hardirqs last  enabled at (273311): [<c0066ed8>]
> > console_unlock+0x390/0x534
> > [    7.859314] hardirqs last disabled at (273328): [<c0066b8c>]
> > console_unlock+0x44/0x534
> > [    7.867605] softirqs last  enabled at (273344): [<c00097fc>]
> > __do_softirq+0x2d4/0x450
> > [    7.875817] softirqs last disabled at (273355): [<c001fe48>]
> > irq_exit+0x150/0x174
> > [    7.883472] ---[ end trace ddb222ada5cbf5cd ]---
> > [    7.900004] input: mxs-lradc-ts as
> > /devices/soc0/80000000.apb/80040000.apbx/80050000.lradc/mxs-lradc-ts/input/input0
> >
> > The touchscreen irq is defined as:
> >
> > enum mx28_lradc_irqs {
> > MX28_LRADC_TS_IRQ = 0,
> >
> > Shouldn't we retrieve the IRQ number from the device tree instead?

  mxs_lradc_ts_probe()
  {
    ...
    irq = platform_get_irq_byname(pdev, mxs_lradc_ts_irq_names[i]);
    if (irq < 0)
	    return irq;

    virq = irq_of_parse_and_map(node, irq);
    ...
  }

That's not right, is it?  irq_of_parse_and_map() takes an *index*, but
we're passing an IRQ.

mxs_lradc_adc_probe() also has the same pattern.
