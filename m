Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4B429F2A0
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 18:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgJ2RJw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 13:09:52 -0400
Received: from thoth.sbs.de ([192.35.17.2]:55353 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbgJ2RJw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 13:09:52 -0400
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09TH48no018553
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Oct 2020 18:04:08 +0100
Received: from dev.vm7.ccp.siemens.com ([139.22.33.215])
        by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 09TH48c0016087;
        Thu, 29 Oct 2020 18:04:08 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 373A770FF87;
        Thu, 29 Oct 2020 18:04:08 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     nick@shmanahar.org, hadess@hadess.net, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH 3/3] Input: atmel_mxt_ts - add option to disable firmware loading
Date:   Thu, 29 Oct 2020 18:03:13 +0100
Message-Id: <20201029170313.25529-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-1-andrej.valek@siemens.com>
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
index 98f17fa3a8926..4656aaf532777 100644
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
+						"touchscreen-do-not-load-fw");
+
 	error = mxt_initialize(data);
 	if (error)
 		return error;
-- 
2.20.1

