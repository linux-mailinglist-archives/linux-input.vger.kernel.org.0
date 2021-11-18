Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8BE455368
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 04:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242721AbhKRDdP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 22:33:15 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:54123 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241185AbhKRDdO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 22:33:14 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1619F58096D;
        Wed, 17 Nov 2021 22:30:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 17 Nov 2021 22:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=/cj2kNWq2UVok38XhOoZvbWa1e
        3Ab7EbCh9ffCDhegQ=; b=SlaJoQPZ0D8JAqVMzmyHi0sw+sgy7uu/oANeIVxm29
        HFrEmWErsV7kaRg+X1SIr5rXJU6D+FjcqyWejxatHkx2v1KTe4JjEi0W9BS2+cm9
        bPBhbmL5y9XTvKFHq9QBfnezgc0urHipU2U7C6ABvCr6VWIFYI38DByxYYKeHHsX
        bswFcXp5iup85w9pjO4C1VkVckQwdRA6N4HdF9/3YB/cWk0+eeWbp2M928T96bxl
        cjkZ8Gslusr6IgLFnbvtfCGAZJvD7TMO+qiQTXxMrA7+v56pvngE+3cVZSXtKZDV
        aWVgbZa8Wd+olciVeTlQg2LNjVweNcORGWqbKgY/VE0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/cj2kNWq2UVok38Xh
        OoZvbWa1e3Ab7EbCh9ffCDhegQ=; b=dh0I2lx53fPhtPjNglmfjZXV7+KbNoQ/5
        YZkfTZBKl3VGVI4+q6yJwFO861lkDJ2Y5gDT60h30hjEvNaOVq7Tmcj8Hn9Cu7E9
        6SVTNpjJq2xN1wxBSzbHQQGaWtFjd3U3BIIIoYU2Vy84kEDYFRpjyUJdiXYfgl+J
        k1ixViqChTnIEFsnHQwh0/W/uIc8lC4oycDSA7n22JkTMEQiKKQTxnAUicFBzB+s
        aAaT1uH4FMma/annEutUQOVLLXn+qwQi6dh6TQpHkyRvI5hxi/0RhleRArMEZk8T
        8QrHvaHHxPwOc+HMv331o+Uty6WEibTfDlzA8hnGOfUv6DN5ocVEw==
X-ME-Sender: <xms:xsiVYf_fFXbvi0b076db3MsHV3a5_28GkGAg1hB6aGdf9Mg6Y0WOjw>
    <xme:xsiVYbuVmdfJ1HlCBWyDcrOuxIK3N999jUCL8aIbTGiKrR4260iBcPIOZZ7_Z_2vB
    6mDAZQwG6YlRL04CQ>
X-ME-Received: <xmr:xsiVYdAar_JRGDNmKmSamg6bOpH3pHQI_PEjpMylSmDNABveJ60nPHBKLD_6o5qOWzy2cuKdmuTowLfp3Nqs4spxu8cSt7xMKXC1GGhu0sf1P0__27BBhMt6aGNDG7xByXJ5sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeehgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:xsiVYbe2SAOXq52AakDhDwW9wRYj5kzZ-w6LXtnb0W0UkguWvzlVuQ>
    <xmx:xsiVYUP6FRn0RlBvk0ID7YE-Wvb0kGYjFEubjvlf0FHAkCH09BlcEw>
    <xmx:xsiVYdlc3r3S9iphdjBQIE5b-vCRHe5RKdujgdmtTyihozvgTiksRA>
    <xmx:x8iVYVGjS6GTwHVPHNO5xLQN3UmTFXDe83kG0l_ZF9IRHVhSeo_i4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 22:30:13 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Ondrej Jirman <megous@megous.com>,
        Samuel Holland <samuel@sholland.org>
Subject: [RERESEND PATCH v3] Input: sun4i-lradc-keys -  Add wakup support
Date:   Wed, 17 Nov 2021 21:30:13 -0600
Message-Id: <20211118033013.43116-1-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
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

Changes since resend v3:
  - An entirely different, but equivalent, DT binding patch was merged,
    so there is only one patch left...

Changes since v2:
  - Dropped unnecessary pr_err in platform_get_irq() error path
  - Dropped patch 3 (DT update) as it was merged
  - Added Acked-by/Reviewed-by tags

Changes since v1:
  - Add requisite DT binding change
  - Only add wakeup capability if "wakeup-source" is present
  - Warn but do not error out if setting the wake IRQ fails
  - Add "wakeup-source" property to PinePhone device tree

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
2.32.0

