Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC94456852
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 03:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhKSC5U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 21:57:20 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:45889 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229521AbhKSC5T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 21:57:19 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 25ECF3201C84;
        Thu, 18 Nov 2021 21:54:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 18 Nov 2021 21:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=0q45aXuIDeOq9GYXNRS8Khr2Q4
        N2QhRZ9vUqoPIDuWA=; b=KEZWG7wyB/TKyVSN7oWsaNCiACYQi2DJSDomG57uwB
        yuvbW0syqC4jOmnpKYJa5puhJuuaS0FWi7Qm1ag0GH1NcOB3HBog2SIwD0nNbQxD
        Y+r6K+FPPyy7yDpycho8XuwPVF+oxH9hXeg0Z0RnFUPxQ8yM5nsUNu/8gDhYvhXc
        6lqLGi0se3KxhYyoqZav1mcMkSoZgp84PPzAokOXn2ZkTMMeQPval+TnM+PtU+GX
        lBqHLJdWyugz95KIbig93DkjnPYe8z6/4kRB5zDUpLH5Q/+WWecnv97zhhExHZQk
        IAryKPJc2P/1ThdiKiOB3D+VqW9O9mK7CPvNIaaiNa4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0q45aXuIDeOq9GYXN
        RS8Khr2Q4N2QhRZ9vUqoPIDuWA=; b=QaYyrP1KmXmo8B6yqmj119y6VEQPBhjbZ
        w+QUXdidzYX1lR3nWBuCtMnTlrAdRCWyVfjJsIdf2q8qgR+CazThbz7KSUkuJekH
        /qzzDHlheVy3mNspG1aXLonxhqIyf1yPK3OY/k1J/R/Y6NGXb/0GjbwkjsjJi6c5
        qa3hlmy38sfbVLPO/ftwp4TlhkTaszplPJhrh8ufvWntbCl0tQAxez0BzJnQXa5b
        uAigjA8kojQjRZ4Bjnlr0sAKZGfIEq0pNTFPYqCzQ0lGFnpIATT/wnnoZtRTLXjH
        DGhqITT/ZiM2zcOv4SoTVSpMFEcQG3n0Ymt6hKUS/juIsmbTXWNUw==
X-ME-Sender: <xms:2RGXYa5U2yKukZbcSBXQlt2kG6eiPle144VKCNkvOC0Dg-RKJmeRWg>
    <xme:2RGXYT5-1SFuiKzKzPO26y6xzLhKpRAFJ0o9-z-C8blgHJdn0s-IG4Dj6g0hEkKxP
    J__pqGKQm9s-aHBpg>
X-ME-Received: <xmr:2RGXYZfM2lN7McPUqODD3YCNbwuLJem-pMdDyu45PdEkU0sOoPLAo7KXaOg31_CftFGmae_E0WUwXgRxY_BHsxt15TI8nYREr07a8h7Jcw7wUSo2ijlom7jidJ1FrJuucFJ5-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:2RGXYXIyEBpxq37HoCt7se8c0gUMtgt96zrRfgJ_YXOlp7x1M8uCag>
    <xmx:2RGXYeKqkz9VvOWImyeHExYOcCmmHMjhM9JUx1LYmmtn53sMBQ7DiQ>
    <xmx:2RGXYYxqpcL-Jm3lQ4o7XPI-yTUshIszSFJh3WJ9ab5S8E4x0KVhHw>
    <xmx:2RGXYd8IQowD8kP1x88YHLVGtw9Vapmxj1Nvadbn6STTfCZ23HcxLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 21:54:16 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Ondrej Jirman <megous@megous.com>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4] Input: sun4i-lradc-keys -  Add wakup support
Date:   Thu, 18 Nov 2021 20:54:15 -0600
Message-Id: <20211119025415.18642-1-samuel@sholland.org>
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

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>

---

Changes since v3:
  - Only mark device as wakeup capable if setting the wakeirq succeeds
  - An entirely different, but equivalent, DT binding patch was merged,
    so there is only one patch left

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
index 4a796bed48ac..781f9b053115 100644
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
+		error = dev_pm_set_wake_irq(dev, irq);
+		if (error)
+			dev_warn(dev, "Failed to set wake IRQ\n");
+		else
+			device_set_wakeup_capable(dev, true);
+	}
+
 	return 0;
 }
 
-- 
2.32.0

