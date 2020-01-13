Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD0FA1389AA
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 04:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733091AbgAMDUf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jan 2020 22:20:35 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35133 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732961AbgAMDUf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jan 2020 22:20:35 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 12AFF220E2;
        Sun, 12 Jan 2020 22:20:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 12 Jan 2020 22:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=d9ywLl/DDZFlz
        Uz3mT7RYsQEEe5B8fjqhKvK92riuO8=; b=EuHre93g1A3yk7B/WLKbPBbsdK5k1
        H+1oQ47b5B9HXiJN2oI3BCyb08N6w++X7rnQIMOL3y6Sn/ZzWP1Wo7KwDTdLccwc
        LRKYlHWjzlucB0dCdsoHwSXToBKzMOWqJ1CDWC4FVPFEKqLvrsesT1d4XIhe+Cec
        4L1q4U01R0qJd+fDuOD9sna7MZKKti270hs61NVZfbIDKT++Ruzv7fUFPnmbkDdn
        kwFSh+pvG4wcGmLk38HoBo+gPlbtgr1n3yaPL4JoeNaAhu7rypGSZmn5CSbcgD9G
        K5RDGk8Rz+hh/XxEnsilRmmUYcSvYj04t4AgmINzF4y8bjErhtcTsBqQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=d9ywLl/DDZFlzUz3mT7RYsQEEe5B8fjqhKvK92riuO8=; b=mZguVctx
        Rl/yMHWSjH0bkJtDJVrwLIcnVIf9WbZ+IkNBkJ21pulmGSGQTGWheXwGf4nr0WoA
        WSiEAXKGjHETnmNMv1btfP45DMKRPMTJ8ke/8/PmOqAO0Cjx+TsxOCHClhiWTtXs
        NBaQiiqQ4pyfer4ybHpcWi82IwzlQ+64hQsiqZB8pyAlQ94WGuXe/lRWOW98Y2zM
        8Ara5oKtlfXytiIrtS0+G9/tOibkVY3JlwTKpqURMAFtyw96WkZX9UMfJx+GOIZK
        E8MIoVW4EUJ6X2J9htY7DMcKTeBpqowncTpvxJ7+F6vUL2XmFqXGbUuf9I10/n0q
        f3rYuEEAfSL6zg==
X-ME-Sender: <xms:AeIbXrfPtcMjCBESsZX4uG117AxImR100d8F8q-lt1hMWo375hRu5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
    epjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghm
    uhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:AeIbXlfQ4HxeWNQCOykMzJU-ttve1UE-JvsMz9wkVdLhL4Our8Kq7w>
    <xmx:AeIbXvjLxWpqy0dOZDOP8cQ8pjGuaqq_vFA-z1UPhS35UbSDq9wuYA>
    <xmx:AeIbXhSyF1N4Ykmz_GoHx3T3783U22ut3YT_TG2d1z629P9bTKaVwA>
    <xmx:AuIbXrXEkNZSoeMbK4Q1EqFd3C2nsRglXWrPfOlHIxMp_93kHyJHlw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7A3CC80059;
        Sun, 12 Jan 2020 22:20:33 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/3] Input: axp20x-pek - Respect userspace wakeup configuration
Date:   Sun, 12 Jan 2020 21:20:31 -0600
Message-Id: <20200113032032.38709-2-samuel@sholland.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200113032032.38709-1-samuel@sholland.org>
References: <20200113032032.38709-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unlike most other power button drivers, this driver unconditionally
enables its wakeup IRQ. It should be using device_may_wakeup() to
respect the userspace configuration of wakeup sources.

Because the AXP20x MFD device uses regmap-irq, the AXP20x PEK IRQs are
nested off of regmap-irq's threaded interrupt handler. The device core
ignores such interrupts, so to actually disable wakeup, we must
explicitly disable all non-wakeup interrupts during suspend.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/misc/axp20x-pek.c | 42 ++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 7d0ee5bececb..38cd4a4aeb65 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -280,7 +280,7 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 	}
 
 	if (axp20x_pek->axp20x->variant == AXP288_ID)
-		enable_irq_wake(axp20x_pek->irq_dbr);
+		device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 }
@@ -352,6 +352,45 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#if CONFIG_PM_SLEEP
+static int axp20x_pek_suspend(struct device *dev)
+{
+	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
+
+	/*
+	 * Nested threaded interrupts are not automatically
+	 * disabled, so we must do it explicitly.
+	 */
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(axp20x_pek->irq_dbf);
+		enable_irq_wake(axp20x_pek->irq_dbr);
+	} else {
+		disable_irq(axp20x_pek->irq_dbf);
+		disable_irq(axp20x_pek->irq_dbr);
+	}
+
+	return 0;
+}
+
+static int axp20x_pek_resume(struct device *dev)
+{
+	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev)) {
+		disable_irq_wake(axp20x_pek->irq_dbf);
+		disable_irq_wake(axp20x_pek->irq_dbr);
+	} else {
+		enable_irq(axp20x_pek->irq_dbf);
+		enable_irq(axp20x_pek->irq_dbr);
+	}
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(axp20x_pek_pm_ops, axp20x_pek_suspend,
+					    axp20x_pek_resume);
+
 static const struct platform_device_id axp_pek_id_match[] = {
 	{
 		.name = "axp20x-pek",
@@ -371,6 +410,7 @@ static struct platform_driver axp20x_pek_driver = {
 	.driver		= {
 		.name		= "axp20x-pek",
 		.dev_groups	= axp20x_groups,
+		.pm		= &axp20x_pek_pm_ops,
 	},
 };
 module_platform_driver(axp20x_pek_driver);
-- 
2.23.0

