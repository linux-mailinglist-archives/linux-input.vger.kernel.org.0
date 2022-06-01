Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26B953A6D7
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 15:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353628AbiFANzi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 09:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353834AbiFANzJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 09:55:09 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FA18DDC9;
        Wed,  1 Jun 2022 06:54:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 172B4CE1AF2;
        Wed,  1 Jun 2022 13:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8E8C34119;
        Wed,  1 Jun 2022 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654091658;
        bh=a3fmYRNmxmmGtW2qncH+A1b8hXxAu7cfiYtmX5DV0eM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TOp2KYgHIQoxfvFCf0GrhHhWwaAFMiKc+bjqAstDwU0Ql1unlgbp+IOKtoZY5KbJx
         PbY3PzUOemrPSJPibkXDDyszUgB2GYhl+BkWFyyCLn/KmJuhsdqJGTIiTphIM0kcTT
         2aiYD95nlPx4BgDaRR6XWA05Ms53QsCqM4hxSkHYqrBYbESNjTiUduyob/KRqspNAO
         yFtIAfqpF/NBHe8+bOgnZafK/HiJRzyOWCdTlK3mHf0q8V5cq9NVCDHdWbSCLpbkke
         jLs2w1Z07GlNicTebJLZjoFbzGKKRcf+v/Ui+EGlHFfbhm9yGps260tUAg3Ig8NqET
         PCmtdSjqqNE7A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, paul@crapouillou.net,
        christophe.jaillet@wanadoo.fr, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 48/49] Input: gpio-keys - cancel delayed work only in case of GPIO
Date:   Wed,  1 Jun 2022 09:52:12 -0400
Message-Id: <20220601135214.2002647-48-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135214.2002647-1-sashal@kernel.org>
References: <20220601135214.2002647-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[ Upstream commit cee409bbba0d1bd3fb73064fb480ff365f453b5d ]

gpio_keys module can either accept gpios or interrupts. The module
initializes delayed work in case of gpios only and is only used if
debounce timer is not used, so make sure cancel_delayed_work_sync()
is called only when its gpio-backed and debounce_use_hrtimer is false.

This fixes the issue seen below when the gpio_keys module is unloaded and
an interrupt pin is used instead of GPIO:

[  360.297569] ------------[ cut here ]------------
[  360.302303] WARNING: CPU: 0 PID: 237 at kernel/workqueue.c:3066 __flush_work+0x414/0x470
[  360.310531] Modules linked in: gpio_keys(-)
[  360.314797] CPU: 0 PID: 237 Comm: rmmod Not tainted 5.18.0-rc5-arm64-renesas-00116-g73636105874d-dirty #166
[  360.324662] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[  360.331270] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  360.338318] pc : __flush_work+0x414/0x470
[  360.342385] lr : __cancel_work_timer+0x140/0x1b0
[  360.347065] sp : ffff80000a7fba00
[  360.350423] x29: ffff80000a7fba00 x28: ffff000012b9c5c0 x27: 0000000000000000
[  360.357664] x26: ffff80000a7fbb80 x25: ffff80000954d0a8 x24: 0000000000000001
[  360.364904] x23: ffff800009757000 x22: 0000000000000000 x21: ffff80000919b000
[  360.372143] x20: ffff00000f5974e0 x19: ffff00000f5974e0 x18: ffff8000097fcf48
[  360.379382] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000053f40
[  360.386622] x14: ffff800009850e88 x13: 0000000000000002 x12: 000000000000a60c
[  360.393861] x11: 000000000000a610 x10: 0000000000000000 x9 : 0000000000000008
[  360.401100] x8 : 0101010101010101 x7 : 00000000a473c394 x6 : 0080808080808080
[  360.408339] x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff80000919b458
[  360.415578] x2 : ffff8000097577f0 x1 : 0000000000000001 x0 : 0000000000000000
[  360.422818] Call trace:
[  360.425299]  __flush_work+0x414/0x470
[  360.429012]  __cancel_work_timer+0x140/0x1b0
[  360.433340]  cancel_delayed_work_sync+0x10/0x18
[  360.437931]  gpio_keys_quiesce_key+0x28/0x58 [gpio_keys]
[  360.443327]  devm_action_release+0x10/0x18
[  360.447481]  release_nodes+0x8c/0x1a0
[  360.451194]  devres_release_all+0x90/0x100
[  360.455346]  device_unbind_cleanup+0x14/0x60
[  360.459677]  device_release_driver_internal+0xe8/0x168
[  360.464883]  driver_detach+0x4c/0x90
[  360.468509]  bus_remove_driver+0x54/0xb0
[  360.472485]  driver_unregister+0x2c/0x58
[  360.476462]  platform_driver_unregister+0x10/0x18
[  360.481230]  gpio_keys_exit+0x14/0x828 [gpio_keys]
[  360.486088]  __arm64_sys_delete_module+0x1e0/0x270
[  360.490945]  invoke_syscall+0x40/0xf8
[  360.494661]  el0_svc_common.constprop.3+0xf0/0x110
[  360.499515]  do_el0_svc+0x20/0x78
[  360.502877]  el0_svc+0x48/0xf8
[  360.505977]  el0t_64_sync_handler+0x88/0xb0
[  360.510216]  el0t_64_sync+0x148/0x14c
[  360.513930] irq event stamp: 4306
[  360.517288] hardirqs last  enabled at (4305): [<ffff8000080b0300>] __cancel_work_timer+0x130/0x1b0
[  360.526359] hardirqs last disabled at (4306): [<ffff800008d194fc>] el1_dbg+0x24/0x88
[  360.534204] softirqs last  enabled at (4278): [<ffff8000080104a0>] _stext+0x4a0/0x5e0
[  360.542133] softirqs last disabled at (4267): [<ffff8000080932ac>] irq_exit_rcu+0x18c/0x1b0
[  360.550591] ---[ end trace 0000000000000000 ]---

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Link: https://lore.kernel.org/r/20220524135822.14764-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/keyboard/gpio_keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index d75a8b179a8a..a5dc4ab87fa1 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -131,7 +131,7 @@ static void gpio_keys_quiesce_key(void *data)
 
 	if (!bdata->gpiod)
 		hrtimer_cancel(&bdata->release_timer);
-	if (bdata->debounce_use_hrtimer)
+	else if (bdata->debounce_use_hrtimer)
 		hrtimer_cancel(&bdata->debounce_timer);
 	else
 		cancel_delayed_work_sync(&bdata->work);
-- 
2.35.1

