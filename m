Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50F25764CF
	for <lists+linux-input@lfdr.de>; Fri, 15 Jul 2022 17:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbiGOP70 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jul 2022 11:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbiGOP7W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jul 2022 11:59:22 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E7D18B2A
        for <linux-input@vger.kernel.org>; Fri, 15 Jul 2022 08:59:18 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 858D381E76;
        Fri, 15 Jul 2022 17:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1657900755;
        bh=IU8uEUC3W4Qv5uoEqEdXTEpzZx7FlTTL93TN2TntD7w=;
        h=From:To:Cc:Subject:Date:From;
        b=uc3vcw5O3BoxZMVp1KLTyRtGXM7Zyszt7dcetli9f+IialKFSR6dF9diDltJ0B+bj
         s99gy83XqMFDISDbwKpTsHwRbefdYngeGxd7KwG1QSCoVilCTVQO0XvcrllSxi7sGH
         4o9HIS5BHmy7GZp4RCOXJNJMJ9uvj3WLSmcNCyfLo+a8wiGX4h9sC2UeK18X2rtpFA
         scc/yauZg/e27PwvNFOpUBIryV57NY7EaR/QjTbxHi5OPSxzSdSi4Yk6xvwW7c1VB7
         k9Csyw/cgvDgoW2hgxPnu7biLvWhqaa2qyitkpM6aSTaoPu0GXwbvFADMf1rkT1KGF
         iOIPGtnXs7Abg==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH] Input: ili210x - Probe even if no resolution information
Date:   Fri, 15 Jul 2022 17:59:05 +0200
Message-Id: <20220715155905.219391-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
 drivers/input/touchscreen/ili210x.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index e9bd36adbe47d..ad25081e301c6 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -370,22 +370,32 @@ static int ili251x_firmware_update_resolution(struct device *dev)
 
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
@@ -980,7 +990,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	if (error) {
 		dev_err(dev, "Unable to cache firmware information, err: %d\n",
 			error);
-		return error;
 	}
 	touchscreen_parse_properties(input, true, &priv->prop);
 
-- 
2.35.1

