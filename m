Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5335236F4DA
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 06:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhD3EVY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Apr 2021 00:21:24 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:57571 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229902AbhD3EVW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Apr 2021 00:21:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BDB58580993;
        Fri, 30 Apr 2021 00:20:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 30 Apr 2021 00:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=twhTTkXFTaNa0
        JKFc4hyiam+oxDA9ilOzTNkxYn0QVU=; b=AemblQgBcosekkAPjsBiAJYZ2qsA4
        Ls41ugrHWHudRTImhc1D4HO5BZcyCGXWC8A413LCs/AhrSnzZVgq1CmtwcN4beP9
        UJg2TnfrjtKMsAEAkFmCz6XcJSDGiHh6vKNrdnofZMxTltERL4C5lB/INGV15L00
        Bs2WZDzC8m7YdQWa+M8mczBxOAk6W3kOV7/OO6pLinIECmea23UG6LlNullSO6fu
        6aiH68BJJwI04B1Qfs/YdMPYfXrcNoeYAUy9CsWDCQFEiyDr//BbSwGsc7tOjSuo
        s6IqiNiCeu/nbS8oAvt7Twqlm8uWpAHbkDp+Z0CGDn8r2V6hQ4rUEyNMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=twhTTkXFTaNa0JKFc4hyiam+oxDA9ilOzTNkxYn0QVU=; b=CRlHtxq9
        VwytTOKr1W++ddkmojnjbEDmHxViZ6V+gpEndeD//KP6Kfo9fRuzrBVD0Th17M5J
        WAdoI85tl0186vUTntkqoXTbZGwvZ4ZbgBfC5HN5wKHiI4/oS32rC+U/k+Ei6teS
        YBfvG26T5GmFp7fX5k+g2sNubzW+iBU4IlmCQdBMdeaeyZeOhNC8py6l6pKYJGWy
        YkiOAT8rEZQIT9yPiOUy/LEddpmOI4MgCPNo5W4v/0FNK+9iKaGBMWD4M9ycKzn8
        2WVsMn3uWS+dnJD29DlcuixR0IZkZ+vnF8yOInaP5WXrxqSK12ALOgrjuvR0xqMA
        eJTRbJE4I5POLQ==
X-ME-Sender: <xms:d4WLYCu5JPGh7PLU0BA_S_0m03NbZYds2y4gMvi4ej__VJeZbU_q0Q>
    <xme:d4WLYHeVmfDTpeZaJWJLGFAy4UChlmwBNX7Au0Sg_LsWRAjgzKKPf37q8yZ4m281c
    2CebuQ0DhJd408Wcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:d4WLYNzlwWB79yP2noiTMGvMn8_pKeLVc09dV8iwzr_li0l8cH1rDw>
    <xmx:d4WLYNPyxVqHLJCNcNOmnP5IeVj864FBv9xq4bsffgQYMW0hW34EcA>
    <xmx:d4WLYC-6OY8HQ20EAspsOnD00ww3Qw97NCjPB2d8G3FbzmfeYGicRg>
    <xmx:eIWLYFZu2dwuszy839qYCw5wlVpe0zkF53wptcnONstRqHgVvW64TQ>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Fri, 30 Apr 2021 00:20:06 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
Subject: [PATCH v3 2/2] input: sun4i-lradc-keys -  Add wakup support
Date:   Thu, 29 Apr 2021 23:20:03 -0500
Message-Id: <20210430042003.4591-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430042003.4591-1-samuel@sholland.org>
References: <20210430042003.4591-1-samuel@sholland.org>
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 4a796bed48ac..af1683d68c8c 100644
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
@@ -272,8 +273,11 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
-				 sun4i_lradc_irq, 0,
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
 				 "sun4i-a10-lradc-keys", lradc);
 	if (error)
 		return error;
@@ -282,6 +286,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
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
2.26.3

