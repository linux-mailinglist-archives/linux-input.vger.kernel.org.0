Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416B269A406
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 03:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjBQCwO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Feb 2023 21:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBQCwN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Feb 2023 21:52:13 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720E538B6F
        for <linux-input@vger.kernel.org>; Thu, 16 Feb 2023 18:52:12 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E892685B91;
        Fri, 17 Feb 2023 03:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1676602323;
        bh=bxnokXviLfNfyuP50mexqTiinxPclAt0nt5C04s3V20=;
        h=From:To:Cc:Subject:Date:From;
        b=MDc4YjadaoZrD+WgFz61KJcFMqSEDl+uAEEk11ZJmJrjpD8yDqDtdLw40e4pql9gz
         P73F7efi1is1DYT3g1bLdah2T5bCi2cbNE2PWSm8ROrBKOyvxmV54K9h2H4ZGNU2J3
         2sxlSOHFs1AINNKIobaSl/7/jFEdPtXb2Gw3bWN9PlEBSxhm1PInwYA/j+j5kV42/S
         qltO3jBesUOScbOQfYsTBtyps7rIlxqV2aSTC5+qLrv1/82zjR9q0/uQp0EaD7nFWC
         n1Tponiub1Azg8u5Nzo1oSZSvmztH+aZrYxST9+GLeO0FjWmZIB9dXGGdhdGTqbGCu
         U5IV+9fO+T7Fg==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH v2] Input: ili210x - Probe even if no resolution information
Date:   Fri, 17 Feb 2023 03:52:00 +0100
Message-Id: <20230217025200.203833-1-marex@denx.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Probe the touch controller driver even if resolution information is not
available. This can happen e.g. in case the touch controller suffered a
failed firmware update and is stuck in bootloader mode.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
V2: Add dev_warn() in case resolution is invalid
---
 drivers/input/touchscreen/ili210x.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 4897fafa4204d..d64b6d77d2e08 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -370,22 +370,33 @@ static int ili251x_firmware_update_resolution(struct device *dev)
 
 	/* The firmware update blob might have changed the resolution. */
 	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
-	if (error)
-		return error;
+	if (!error) {
+		resx = le16_to_cpup((__le16 *)rs);
+		resy = le16_to_cpup((__le16 *)(rs + 2));
 
-	resx = le16_to_cpup((__le16 *)rs);
-	resy = le16_to_cpup((__le16 *)(rs + 2));
+		/* The value reported by the firmware is invalid. */
+		if (!resx || resx == 0xffff || !resy || resy == 0xffff)
+			error = -EINVAL;
+	}
 
-	/* The value reported by the firmware is invalid. */
-	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
-		return -EINVAL;
+	/*
+	 * In case of error, the firmware might be stuck in bootloader mode,
+	 * e.g. after a failed firmware update. Set maximum resolution, but
+	 * do not fail to probe, so the user can re-trigger the firmware
+	 * update and recover the touch controller.
+	 */
+	if (error) {
+		dev_warn(dev, "Invalid resolution reported by controller.\n");
+		resx = 16384;
+		resy = 16384;
+	}
 
 	input_abs_set_max(priv->input, ABS_X, resx - 1);
 	input_abs_set_max(priv->input, ABS_Y, resy - 1);
 	input_abs_set_max(priv->input, ABS_MT_POSITION_X, resx - 1);
 	input_abs_set_max(priv->input, ABS_MT_POSITION_Y, resy - 1);
 
-	return 0;
+	return error;
 }
 
 static ssize_t ili251x_firmware_update_firmware_version(struct device *dev)
@@ -980,7 +991,6 @@ static int ili210x_i2c_probe(struct i2c_client *client)
 	if (error) {
 		dev_err(dev, "Unable to cache firmware information, err: %d\n",
 			error);
-		return error;
 	}
 	touchscreen_parse_properties(input, true, &priv->prop);
 
-- 
2.39.1

