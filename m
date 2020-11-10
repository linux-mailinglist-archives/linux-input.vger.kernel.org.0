Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F17B2AD215
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 10:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730094AbgKJJIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 04:08:17 -0500
Received: from goliath.siemens.de ([192.35.17.28]:34125 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbgKJJIP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 04:08:15 -0500
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AA982J7023055
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 10:08:02 +0100
Received: from dev.vm7.ccp.siemens.com ([167.87.134.60])
        by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 0AA981bP019060;
        Tue, 10 Nov 2020 10:08:02 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id E296370FF89;
        Tue, 10 Nov 2020 10:07:59 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v3 3/4] Input: atmel_mxt_ts - add option to disable firmware loading
Date:   Tue, 10 Nov 2020 10:07:19 +0100
Message-Id: <20201110090720.6650-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-4-andrej.valek@siemens.com>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Firmware file loadind for mXT336U controller takes too much time (~60s).
There is no check that configuration is the same which is already present.
This happens always during boot, which makes touchscreen unusable.

Add there an option to prevent firmware file loading, but keep it enabled
by default.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 98f17fa3a8926..491d5088d2826 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -311,6 +311,7 @@ struct mxt_data {
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
 	bool use_retrigen_workaround;
+	bool cfg_loading_disabled;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2191,9 +2192,15 @@ static int mxt_initialize(struct mxt_data *data)
 	if (error)
 		return error;
 
-	error = request_firmware_nowait(THIS_MODULE, true, MXT_CFG_NAME,
-					&client->dev, GFP_KERNEL, data,
-					mxt_config_cb);
+	/* Load firmware if enabled */
+	if (!data->cfg_loading_disabled) {
+		error = request_firmware_nowait(THIS_MODULE, true, MXT_CFG_NAME,
+						&client->dev, GFP_KERNEL, data,
+						mxt_config_cb);
+	} else {
+		mxt_config_cb(NULL, data);
+	}
+
 	if (error) {
 		dev_err(&client->dev, "Failed to invoke firmware loader: %d\n",
 			error);
@@ -3158,6 +3165,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
+	/* prevent firmware flashing for each start */
+	data->cfg_loading_disabled = device_property_read_bool(&client->dev,
+						"atmel,do-not-load-fw");
+
 	error = mxt_initialize(data);
 	if (error)
 		return error;
-- 
2.20.1

