Return-Path: <linux-input+bounces-645-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0380B3F0
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 12:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566A31C2084B
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 11:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAEE13ADF;
	Sat,  9 Dec 2023 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="vxvzh2tC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD18110E0;
	Sat,  9 Dec 2023 03:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xucqkHPBJF36oXeOi/pc0yQ5CBxoZP6i5FtuLPSX75U=; b=vxvzh2tC5vuR0OgFJ3PNto2G57
	mBHkdc50jbPSKeXA99iXTls69eVMEgjrbaXDimki3efaQEV+gXPXgfC9GJicy5TYubkFRyqsqrui3
	c34v6Y+u+ofYQoGE7Uwiu3y4enY5fJEAYiqn0sabQFGGaZq10wpMzSUvWKMaKBKTaP2a7SgYnrDGE
	VWiRvmEJwMENawn640CPapiicTueA+JRtW5AOnyNxi7kWJaP2e8DNt9yzw19/x4Wm8lO5H7R5zItF
	Nvt+7JPsuzBOFRthNeb6VUEgGaefordUyP0u6tsOOzLShhNCFkRlfPTkKWBLnWmpO9fQ1z2lWGFIq
	S6do7aPQ==;
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rBvOH-007CLA-3K; Sat, 09 Dec 2023 12:21:01 +0100
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1rBvOG-001tr9-0W;
	Sat, 09 Dec 2023 12:21:00 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	tony@atomide.com,
	frank.li@vivo.com,
	u.kleine-koenig@pengutronix.de,
	Jonathan.Cameron@huawei.com,
	robh@kernel.org,
	andreas@kemnade.info,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] Input: omap4-keypad: react on keypresses if device is runtime-suspended
Date: Sat,  9 Dec 2023 12:20:58 +0100
Message-Id: <20231209112058.453030-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to SWPU235AB, table 26-6, fclk is required to generate events
at least on OMAP4460, so keep fclk enabled all the time the device
is opened.

Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Tony Lindgren <tony@atomide.com>
---
Changes since RFC:
- add R-by:

 drivers/input/keyboard/omap4-keypad.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index d3f8688fdd9c3..7d83aff95617f 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -83,6 +84,7 @@ struct omap4_keypad {
 	bool no_autorepeat;
 	u64 keys;
 	unsigned short *keymap;
+	struct clk *fck;
 };
 
 static int kbd_readl(struct omap4_keypad *keypad_data, u32 offset)
@@ -211,6 +213,8 @@ static int omap4_keypad_open(struct input_dev *input)
 
 	disable_irq(keypad_data->irq);
 
+	clk_prepare_enable(keypad_data->fck);
+
 	kbd_writel(keypad_data, OMAP4_KBD_CTRL,
 			OMAP4_DEF_CTRL_NOSOFTMODE |
 			(OMAP4_KEYPAD_PTV_DIV_128 << OMAP4_DEF_CTRL_PTV_SHIFT));
@@ -258,6 +262,7 @@ static void omap4_keypad_close(struct input_dev *input)
 	disable_irq(keypad_data->irq);
 	omap4_keypad_stop(keypad_data);
 	enable_irq(keypad_data->irq);
+	clk_disable_unprepare(keypad_data->fck);
 
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
@@ -356,6 +361,11 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	keypad_data->irq = irq;
+	keypad_data->fck = devm_clk_get(&pdev->dev, "fck");
+	if (IS_ERR(keypad_data->fck))
+		return dev_err_probe(&pdev->dev, PTR_ERR(keypad_data->fck),
+				     "unable to get fck");
+
 	mutex_init(&keypad_data->lock);
 	platform_set_drvdata(pdev, keypad_data);
 
-- 
2.39.2


