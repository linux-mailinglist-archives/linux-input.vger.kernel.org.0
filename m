Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E964032FC
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 05:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346657AbhIHDlf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 23:41:35 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58623 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345195AbhIHDlb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Sep 2021 23:41:31 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 600102B002B5;
        Tue,  7 Sep 2021 23:40:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 07 Sep 2021 23:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=MVVeiWIC2nl4o
        F/AFwnBSE7sJZ2jQzfbZWmwhvrIQ0Y=; b=rXsJ8M+R64P1fV3yfNgXjacS6sWhI
        y5TE+kE5H5W6JoloJpZaluBtWuZbCkuwfnx/VBgPnbSDcLhfyC7U06VQ7eYGltww
        QVwF+4DCX8MtFtbKy0J/WirLXz5snQQPusDWVAuBaprDm3sd4KUBoK8QTI74Mugw
        JLNlMGWGYQm0YOYQhtSTEZ5W81eQtMHe6+qYkAfJ4BW10z9LQycvg3EnqDKi0hT7
        l2Uv7FQO5KY5TNtfOrk2oMdElljlMjnuyfQi5qZkpMWP70B1EonnJdugHGz7raen
        7GKVL+souwtsWvGngedoju6q+sqGpxtbtk8prujjAzOmlywIjhVMm6HPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=MVVeiWIC2nl4oF/AFwnBSE7sJZ2jQzfbZWmwhvrIQ0Y=; b=g3yavs6u
        uDxO7K6AGYbeGnFtwOt23NbfazxyOBTkueLMix+QuVhkuMvZ3tqz3/b5xadKar9Z
        LQxsv0PtS0+YzZVO7bRDs0XZilu9jZ/SW5LSVnGqEMwkIpAi9F/NWgIe0yDkjV3x
        bpkn9S8EVmUNP20g9skLRDzfpabQH1hiakly5GLgZ3tBpEH47NOvv5ck3lnQEOx+
        +GKr72hh9TqsLug0775P+ey9D3tV7bFOckJ8J9inLbdFagSNZDcGIckWpRdCu2JG
        b8Ig0FiSFcRdLBQZRUOuCs8P0eAe1GOAdHZFrI+Mu+Uoz7ZrHVui3IBiAX/ZhdLl
        /6M/Tpyi7S7OOg==
X-ME-Sender: <xms:pjA4YdU0pWW2SFQ-M7xGpC2EyjIsQXlDiURpbyyJTjle5Kg_NJYAZA>
    <xme:pjA4Ydn4IGezY2txod9OTnf75_6SDVowKDVMSnTvXYq9tCinGbwR4V1XvJ0U43j3C
    CVt80y1BuXGzdJrYw>
X-ME-Received: <xmr:pjA4YZZCCRbnHCRygthESSvuP_L1LVLRUr9-bkkkkq3uFJPmlqKMqENOio8xdnl56jBcEkKwEktel12ohM7bC0mjqO2YNSNehxR_k270I0-Cj54kujWDys3Tv7ibHGDbDuJpVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:pjA4YQWK724zfUkPPeVqX7APFfTx7hyVW8a_3VY_KjYnYsMjH4vUwQ>
    <xmx:pjA4YXkG3kDNtmiB7eZSN7W2n61dbJZVJGftDiz9NzlkXUMK98tKlw>
    <xmx:pjA4YdcTzH451qqI3w3knu5LODiUBXPa2g6UhsGUkW3BdY1l_Y7kuQ>
    <xmx:pzA4YVfK-qXrdHA1QSTrzoavABl8prfogBeFxuHVTfHoudmUkkfEcI1nYz4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Sep 2021 23:40:22 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/3] Input: sun4i-lradc-keys: Add optional clock/reset support
Date:   Tue,  7 Sep 2021 22:40:15 -0500
Message-Id: <20210908034016.24119-3-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908034016.24119-1-samuel@sholland.org>
References: <20210908034016.24119-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Until the R329, the LRADC hardware was always active. Now it requires
enabling a clock gate and deasserting a reset line. Do this if the clock
and reset are provided in the device tree, but keep them optional to
maintain support for the existing binding.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 4a796bed48ac..50fc18052829 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -14,6 +14,7 @@
  * there are no boards known to use channel 1.
  */
 
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -23,6 +24,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #define LRADC_CTRL		0x00
@@ -83,6 +85,8 @@ struct sun4i_lradc_data {
 	struct device *dev;
 	struct input_dev *input;
 	void __iomem *base;
+	struct clk *clk;
+	struct reset_control *reset;
 	struct regulator *vref_supply;
 	struct sun4i_lradc_keymap *chan0_map;
 	const struct lradc_variant *variant;
@@ -140,6 +144,14 @@ static int sun4i_lradc_open(struct input_dev *dev)
 	if (error)
 		return error;
 
+	error = reset_control_deassert(lradc->reset);
+	if (error)
+		goto err_disable_reg;
+
+	error = clk_prepare_enable(lradc->clk);
+	if (error)
+		goto err_assert_reset;
+
 	lradc->vref = regulator_get_voltage(lradc->vref_supply) *
 		      lradc->variant->divisor_numerator /
 		      lradc->variant->divisor_denominator;
@@ -153,6 +165,13 @@ static int sun4i_lradc_open(struct input_dev *dev)
 	writel(CHAN0_KEYUP_IRQ | CHAN0_KEYDOWN_IRQ, lradc->base + LRADC_INTC);
 
 	return 0;
+
+err_assert_reset:
+	reset_control_assert(lradc->reset);
+err_disable_reg:
+	regulator_disable(lradc->vref_supply);
+
+	return error;
 }
 
 static void sun4i_lradc_close(struct input_dev *dev)
@@ -164,6 +183,8 @@ static void sun4i_lradc_close(struct input_dev *dev)
 		SAMPLE_RATE(2), lradc->base + LRADC_CTRL);
 	writel(0, lradc->base + LRADC_INTC);
 
+	clk_disable_unprepare(lradc->clk);
+	reset_control_assert(lradc->reset);
 	regulator_disable(lradc->vref_supply);
 }
 
@@ -243,6 +264,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	lradc->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(lradc->clk))
+		return PTR_ERR(lradc->clk);
+
+	lradc->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(lradc->reset))
+		return PTR_ERR(lradc->reset);
+
 	lradc->vref_supply = devm_regulator_get(dev, "vref");
 	if (IS_ERR(lradc->vref_supply))
 		return PTR_ERR(lradc->vref_supply);
-- 
2.31.1

