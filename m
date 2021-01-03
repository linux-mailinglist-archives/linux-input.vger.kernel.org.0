Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9112E8BC3
	for <lists+linux-input@lfdr.de>; Sun,  3 Jan 2021 11:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbhACKzz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 05:55:55 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33241 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726029AbhACKzy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 3 Jan 2021 05:55:54 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 66DF94D9;
        Sun,  3 Jan 2021 05:54:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 03 Jan 2021 05:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=rh6jZ/zg8pqa6gJitOqmkOlpCU
        OT0/AMXwRjNzoppZ4=; b=PJLp+7ABPXtoCJagkuPW9GFSujSiFcr8BnwAB1SP7t
        uMMv6taaINVD7oq1Fq7Zggr8ODalUu3gZUY7pk8orFmSwtN5C5szLnvyQLsmAglz
        el0AO4svDfosZzuYi2V2yMZaFpTIOK/cQji+hzINENwiSfuYNZtWtWOvw/6r2/U3
        GOca6ppYcKsXmbsvvy1lNTK1e6KM8jvuKXAcoPMzccAXFJdb3hy38UHqHyCdyl4H
        FeqruUPb4djFtqMWlSEoPwvVfRoJYv174xof0/fAfVpCz3lGepsZf2lZYlzZBpDk
        +7aTfeV/4UspqD+GSJrMueqq4s0NxtLRb4jeelXHpbWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rh6jZ/zg8pqa6gJit
        OqmkOlpCUOT0/AMXwRjNzoppZ4=; b=DeH/dxFZQstLUbcgiZIURbqsvP9bfYrTK
        sLRH7wRTJbqdFICOA0NvMsCEQvrlOAfFtLoJgkOY1S4KyxnwuRm1NxiVsIjYGfme
        cX69sNav3pNRN1GJi6iPy62WC7GxDrkcVJA4O2Fn731U8qYnDjri/uz0HQwyt7AL
        dcphh4ONZdj9HGZEv+9aBLPMze84wKl0nXAtTiuRkOJZQuaCkCRZ7aoJasQeZ0+n
        fOAi2ORtbghWaCBFW1yecknPQ7IhsLhQYiBbdm/aa9yRTs7+U5WGYFwsoK/oLf5v
        p+IB/9L4DDu3U8tGlsHljp7b/N3Y9g2Dm+7rYu1vsEvcbAJ2fFw3A==
X-ME-Sender: <xms:d6LxX191X2744yTIlEgmdbVFK2Aw6_LAygMPkMxs7Usuf_CZ2YqJvQ>
    <xme:d6LxX5tvop--op2vSzOiB6Dl09MnCUsIIl80zqHNz_90dPGVYK7DQR8GzHt8LraLL
    IP8oPXyWe_95dHfLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefuddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
    vedtveenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivg
    epudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:d6LxXzAfsyymFUE5kFPpE4M2_83bnnd_WB8lkuFpqUdWpf6VlJ5npA>
    <xmx:d6LxX5fTbJuJN-b_Gaf5DhM4Fw2NIoFjO7VAOGNHCOTqLwVW98ffsw>
    <xmx:d6LxX6OF5zCXkselRTWEShWVfQpR2LI8vDdYLxK_I7JAUbMkQNLPyg>
    <xmx:eKLxX5cWw3Gtsc6WfdcgLlO7-WF887FGU3NHWLcxxY_56zMTjoJjAw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 52A891080057;
        Sun,  3 Jan 2021 05:54:47 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Ondrej Jirman <megous@megous.com>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH] input: sun4i-lradc-keys -  Add wakup support
Date:   Sun,  3 Jan 2021 04:54:46 -0600
Message-Id: <20210103105446.33923-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Allow the driver to wake up the system on key press. Since using the
LRADC as a wakeup source requires keeping on an additional power domain,
disable the wakeup source by default.

Signed-off-by: Ondrej Jirman <megous@megous.com>
[Samuel: disable the wakeup source by default]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 4a796bed48ac..4d0e8879a97d 100644
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
 
+	device_set_wakeup_capable(dev, true);
+
+	error = dev_pm_set_wake_irq(dev, irq);
+	if (error) {
+		dev_err(dev, "Could not set wake IRQ\n");
+		return error;
+	}
+
 	return 0;
 }
 
-- 
2.26.2

