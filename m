Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F061F3061FA
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 18:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233783AbhA0R2v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 12:28:51 -0500
Received: from foss.arm.com ([217.140.110.172]:56864 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343623AbhA0R1V (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 12:27:21 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B634139F;
        Wed, 27 Jan 2021 09:26:00 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D97053F66E;
        Wed, 27 Jan 2021 09:25:57 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Lee Jones <lee.jones@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v5 05/20] Input: axp20x-pek: Bail out if AXP has no interrupt line connected
Date:   Wed, 27 Jan 2021 17:24:45 +0000
Message-Id: <20210127172500.13356-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210127172500.13356-1-andre.przywara@arm.com>
References: <20210127172500.13356-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On at least one board (Orangepi Zero2) the AXP305 PMIC does not have its
interrupt line connected to the CPU (mostly because the H616 SoC does
not feature an NMI pin anymore).
After allowing the AXP driver to proceed without an "interrupts"
property [1], the axp20x-pek driver crashes with a NULL pointer
dereference (see below).

Check for the regmap_irqc member to be not NULL before proceeding with
probe. This gets normally filled by the call to regmap_add_irq_chip(),
which we allow to skip now, when the DT node lacks an interrupt
property.

....
[    3.843388] sunxi-rsb 7083000.rsb: RSB running at 3000000 Hz
[    3.849972] axp20x-rsb sunxi-rsb-745: AXP20x variant AXP806 found
[    3.857971] Unable to handle kernel NULL pointer dereference at
virtual address 00000000000001b8
[    3.866855] Mem abort info:
[    3.869691]   ESR = 0x96000004
[    3.872749]   EC = 0x25: DABT (current EL), IL = 32 bits
[    3.878092]   SET = 0, FnV = 0
[    3.881149]   EA = 0, S1PTW = 0
[    3.884309] Data abort info:
[    3.887210]   ISV = 0, ISS = 0x00000004
[    3.891062]   CM = 0, WnR = 0
[    3.894049] [00000000000001b8] user address but active_mm is swapper
[    3.900590] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    3.906166] Modules linked in:
[    3.909227] CPU: 2 PID: 34 Comm: kworker/2:1 Not tainted 5.11.0-rc1
[    3.915925] Hardware name: OrangePi Zero2 (DT)
[    3.920367] Workqueue: events deferred_probe_work_func
[    3.925518] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
[    3.931522] pc : regmap_irq_get_virq+0x0/0x48
[    3.935883] lr : axp20x_pek_probe+0x78/0x200
[    3.940147] sp : ffff800012fdb450
[    3.943459] x29: ffff800012fdb450 x28: ffff0000054af340
[    3.948776] x27: ffff000005534000 x26: ffff000005534810
[    3.954091] x25: ffff800012883028 x24: 0000000000000002
[    3.959407] x23: ffff80001157eaf0 x22: ffff000005534810
[    3.964722] x21: ffff000005534800 x20: ffff0000054b0580
[    3.970037] x19: 000000000000000b x18: 0000000000000000
[    3.975353] x17: 0000000000000001 x16: 0000000000000019
[    3.980668] x15: 000002ce4ea04ae6 x14: 000000000000014f
[    3.985983] x13: 0000000000000282 x12: 0000000000000030
[    3.991298] x11: 0000000000000038 x10: 0101010101010101
[    3.996613] x9 : 0000000000000000 x8 : 7f7f7f7f7f7f7f7f
[    4.001928] x7 : ff5141435e4a444f x6 : 0000000000000080
[    4.007243] x5 : 0000000000000000 x4 : 8000000000000000
[    4.012558] x3 : 0000000000000000 x2 : 0000000000000000
[    4.017872] x1 : 000000000000000b x0 : 0000000000000000
[    4.023188] Call trace:
[    4.025635]  regmap_irq_get_virq+0x0/0x48
[    4.029646]  platform_probe+0x68/0xd8
[    4.033312]  really_probe+0xe4/0x3b0
[    4.036889]  driver_probe_device+0x58/0xb8
[    4.040986]  __device_attach_driver+0x84/0xc8
[    4.045342]  bus_for_each_drv+0x78/0xc8
[    4.049178]  __device_attach+0xf0/0x150
[    4.053013]  device_initial_probe+0x14/0x20
[    4.057196]  bus_probe_device+0x9c/0xa8
[    4.061032]  device_add+0x36c/0x7b8
[    4.064525]  platform_device_add+0x100/0x238
[    4.068796]  mfd_add_devices+0x494/0x718
[    4.072721]  axp20x_device_probe+0x70/0x158
[    4.076904]  axp20x_rsb_probe+0x94/0xd0
[    4.080741]  sunxi_rsb_device_probe+0x6c/0x88
[    4.085102]  really_probe+0xe4/0x3b0
[    4.088679]  driver_probe_device+0x58/0xb8
[    4.092776]  __device_attach_driver+0x84/0xc8
[    4.097132]  bus_for_each_drv+0x78/0xc8
[    4.100967]  __device_attach+0xf0/0x150
[    4.104803]  device_initial_probe+0x14/0x20
[    4.108986]  bus_probe_device+0x9c/0xa8
[    4.112821]  device_add+0x36c/0x7b8
[    4.116313]  device_register+0x20/0x30
[    4.120065]  sunxi_rsb_probe+0x4e4/0x608
....

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2021-January/633392.html

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/input/misc/axp20x-pek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 9c6386b2af33..abe52ef194ee 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -309,6 +309,10 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 
 	axp20x_pek->axp20x = dev_get_drvdata(pdev->dev.parent);
 
+	/* In case there is no interrupt line from the AXP towards the CPU. */
+	if (!axp20x_pek->axp20x->regmap_irqc)
+		return -ENODEV;
+
 	axp20x_pek->irq_dbr = platform_get_irq_byname(pdev, "PEK_DBR");
 	if (axp20x_pek->irq_dbr < 0)
 		return axp20x_pek->irq_dbr;
-- 
2.17.5

