Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160682F42D3
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 05:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbhAMEGy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 23:06:54 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:50987 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726682AbhAMEGw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 23:06:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id E790719F2;
        Tue, 12 Jan 2021 23:05:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=L/yNuOxj28hiX
        +c/tqAQ/Im+opvb6Nb/8TsVGhyxOMw=; b=D0NyJ/OcaJDR4QbYQlR2Cnrz6IOUX
        yCx2x4x1zXZM2TCMIgsIRE7Yeefvu+PIO2+QqKtZZpU8pwz4Ph/KrqX/Ff3BoIQQ
        YtrfEII/NBfEoThf3NUPsuWfHYDDORmxQaMCl6C9XhNX9LrSHaZ3mxDZ+IwW8KO8
        bsjq5V3mlhfxsluoDRW+4jCvxNr1AS0lrZTead/r3tLRa+lvqz1LzlYFP6o1UbX7
        jNhxGJE4bCfgXsZKc6mYF2zNkd9cKhthbLJe/1Dy3nziovvF9ZNJO2rS8mX4jC2d
        Z2yVzII7wC6ZEWXw9p32NWxvw6WR5W9r/ui3CqNh1VFa3WgiWmua6g4xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=L/yNuOxj28hiX+c/tqAQ/Im+opvb6Nb/8TsVGhyxOMw=; b=d3klVUa9
        XMuyK0GBxz/Ydg8zyowYyUKCjouwHVpPsUfnF9G6V/W7hDJPsaWIup6BwGbDabku
        JHkAS01fN93JUJj79oycIhnT2KnxB3wOB15Y3vEJHDgPlzT8hpGZZuio9wSjgF9J
        hzKqG1XKruHVOU0mWLVKYbjnWI3/LxKvbbeAf16zTUB6gsjpCwe2to+iFtZEFUnI
        WaCACsRRdGJZfo4y3MuAXCFyyiZlEZogqZfugqsIUgZcdWlBmo5Uvz+uUthwHHwB
        +YZUu1e1U5sCRkWaFOhDnYHaE0koHNNapEl29L5KP9R0PiKJzxeBLIeUN5AD4i4F
        6NS8NHNM17+yBw==
X-ME-Sender: <xms:mXH-XxPZTD0wCcRD1FwgcZzlZh5UgGPuCk3miRnf2YebPFgJMn4lAg>
    <xme:mXH-Xz-bOQT4EzmxngsPN5QrFz3noEbxlAAW4nQyD4_KMJsAc0ptFK8po3N3XxllX
    cseCnxF0iDxvkLUaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:mXH-XwQMdkXNxt0pmeKfySBPTzkdmTjMT4Kxzywhrjn39UpqpGnPDA>
    <xmx:mXH-X9shonJNn6i7aaTsrIH27ITaguVdV3ASC583_6tkc3Dm0A3ZuA>
    <xmx:mXH-X5fwmtWH6MkzDjzR-5V-_SQVBMWaAocec69Pg5AQ4REKyxWJ-Q>
    <xmx:mXH-X15vv_Ok-IM-fkpw4q6b5ZZydQnvCi0jTUH3blm46QpuhiLbc0dTRYs>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 941EC240064;
        Tue, 12 Jan 2021 23:05:44 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
Subject: [PATCH v2 2/3] input: sun4i-lradc-keys -  Add wakup support
Date:   Tue, 12 Jan 2021 22:05:41 -0600
Message-Id: <20210113040542.34247-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113040542.34247-1-samuel@sholland.org>
References: <20210113040542.34247-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Allow the driver to wake the system on key press if the "wakeup-source"
property is provided in the device tree. Using the LRADC as a wakeup
source requires keeping the AVCC domain active during sleep. Since this
has a nontrivial impact on power consumption (sometimes doubling it),
disable the LRADC wakeup source by default.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 4a796bed48ac..a1eb2001c088 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -22,6 +22,8 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -226,8 +228,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 {
 	struct sun4i_lradc_data *lradc;
 	struct device *dev = &pdev->dev;
-	int i;
-	int error;
+	int error, i, irq;
 
 	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
 	if (!lradc)
@@ -272,8 +273,13 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
-				 sun4i_lradc_irq, 0,
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "Failed to get IRQ\n");
+		return irq;
+	}
+
+	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
 				 "sun4i-a10-lradc-keys", lradc);
 	if (error)
 		return error;
@@ -282,6 +288,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		device_set_wakeup_capable(dev, true);
+
+		error = dev_pm_set_wake_irq(dev, irq);
+		if (error)
+			dev_warn(dev, "Failed to set wake IRQ\n");
+	}
+
 	return 0;
 }
 
-- 
2.26.2

