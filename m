Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6CD1389AE
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 04:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733228AbgAMDUl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jan 2020 22:20:41 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42865 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733020AbgAMDUf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jan 2020 22:20:35 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0A9F6220E1;
        Sun, 12 Jan 2020 22:20:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 12 Jan 2020 22:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=ayrlkXHGm5lt6lLJAPNWvVy/hi
        Q1duOWAQwfasBu6FY=; b=fTKl6SlKcwHTYRxceYjcmQA61y8VvSiLy9Hr1QbYB/
        p6581XesWJ7WbUoUAOL50AVG/lPP58AS12R4HOgOwzinc6husDGEKcfgeDuPlvur
        LW8J+U60+7IfkJOtKiffQIQxSUsffwPoaTFD8Xjy6cB0QkUrhRYEfSztoMD3dFpf
        vZ6zzlui0I9189MKJlJjQGsJ526+IaC9Eo+EvPdIh1r4dRxVc/QVODua/zN9I8BX
        s5qv3BTJEB8eGDME366oqLSrCtkbguMSleG0sNp5bgLBI32jO+jO+k1Q4lG0ysF4
        m9xWuzQ7ih9m0KgePgG5JLkq4bQESj304HzOXEb1f+vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ayrlkXHGm5lt6lLJA
        PNWvVy/hiQ1duOWAQwfasBu6FY=; b=ivuoZhBspxctCYYxWJW37iFqveK8zdUgL
        zeVq/XzjCU94qeYtiqrhF+o5f0K5vEJQRTktDthQQyuOzljZJVmXAgYyrMGlD3GP
        ss0mifrki86dukgnXg59+9ZtEMiLygnckmCNl/vk2VMv+t7um9sBzRgVOOMOxq2/
        j45UM6PKZ2IsXe1vjv354PTM89afrchN42kJQqyF97E+XlZ72tSXZx5c8tb4MpmZ
        +npsjlyOoBIjU6WvPVzggJZxoc016AKMACmxc5WYPQU0LFRrYoFW8TzFKb6RP4FP
        8B+++tJY60I16ctOQiBHeqk0ra0RySou05QqsyOd9EcnvDbZzpB6w==
X-ME-Sender: <xms:AeIbXp2k1gbGUhg6BafMwW_6KY8ZG7OeEQ8EtDzgS2ahcEHaBAAurA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkphepje
    dtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgv
    lhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:AeIbXkUaKkkL_Qi7-_gfz5xfdIPGR3yyao4Vvk-sdp3X_p4u42-BTw>
    <xmx:AeIbXk4azsmlfRGUiaMeRadAzJWtTyRlo92lFMdNk8eo0DBMYTbbpA>
    <xmx:AeIbXrJQSgsMJG7r9-yGeiloFfQ-ICqyPBthQCvC4nFRPMox-TU13A>
    <xmx:AuIbXkNLubhc2LuzG0tD7xQ9nFhw1LHM078rOJ-X_Q2p1W984HjH5g>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 17B718005B;
        Sun, 12 Jan 2020 22:20:33 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/3] Input: axp20x-pek - Remove unique wakeup event handling
Date:   Sun, 12 Jan 2020 21:20:30 -0600
Message-Id: <20200113032032.38709-1-samuel@sholland.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver attempts to avoid reporting wakeup events to userspace by
clearing a possible pending IRQ before IRQs are enabled during resume.
The assumption seems to be that userspace cannot cope with a KEY_POWER
press during resume. However, no other input driver does this, so it
would be a bug that such events are missing with this driver.

Furthermore, for PMICs connected via I2C or RSB, it is not possible to
update the regmap during the noirq resume phase, because the bus
controller drivers require IRQs to perform bus transactions. And the
resume hook cannot move to a later phase, because then it would race
with the power key IRQ handler.

So the best solution seems to be simply removing the hook.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/misc/axp20x-pek.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 17c1cca74498..7d0ee5bececb 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -352,30 +352,6 @@ static int axp20x_pek_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
-{
-	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
-
-	if (axp20x_pek->axp20x->variant != AXP288_ID)
-		return 0;
-
-	/*
-	 * Clear interrupts from button presses during suspend, to avoid
-	 * a wakeup power-button press getting reported to userspace.
-	 */
-	regmap_write(axp20x_pek->axp20x->regmap,
-		     AXP20X_IRQ1_STATE + AXP288_IRQ_POKN / 8,
-		     BIT(AXP288_IRQ_POKN % 8));
-
-	return 0;
-}
-
-static const struct dev_pm_ops axp20x_pek_pm_ops = {
-#ifdef CONFIG_PM_SLEEP
-	.resume_noirq = axp20x_pek_resume_noirq,
-#endif
-};
-
 static const struct platform_device_id axp_pek_id_match[] = {
 	{
 		.name = "axp20x-pek",
@@ -394,7 +370,6 @@ static struct platform_driver axp20x_pek_driver = {
 	.id_table	= axp_pek_id_match,
 	.driver		= {
 		.name		= "axp20x-pek",
-		.pm		= &axp20x_pek_pm_ops,
 		.dev_groups	= axp20x_groups,
 	},
 };
-- 
2.23.0

