Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612308FE21
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfHPIi3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:29 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1960 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbfHPIi2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:28 -0400
IronPort-SDR: P9v99KO/A0373jrXFC59gk4K1OXy2EUXdDHnrMj5X0Ow3543X0rmF4rnbglrAkbzEcFCygsDxi
 D5/0LEkIvqCXO+jEMUSfbfNm2ZeXH1NlalgKtVb/HylqlHLFehQPA68dQA7+Pzo1YkbYxlzNOK
 2pjzZtzae9eGq5s+I/jxBgVbNj7OndbZ10V1WHAbxhqzqZWc8LKoesyHrbBwZcqrO5v279841I
 C2AQBLLJmu0TjHN3I5JTBKOoKe8XoGFINjX07SB1jB2KeQpa90paONtaVID2iXCEe/bmjNKS5h
 wRA=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484310"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:24 -0800
IronPort-SDR: FymaRvtcEZgyefw3tFz8fPtBUva+w3c03flBTeNcyGZaEblx2VwlgVhc6obBS4tSjYovossKAp
 Aregv1HHMT8+TSTPTsiAOLaCfbYbfNbHgRFaCi6xqq71aPfpK0XBzYP6EElqjrIOKrpUtD27vA
 qs+GRxloMowmmr/y0J9Z7prAXDeUKlL98W7EMMRWN5UTlBdSuMXLDMywvlx3J1Cavm12wz3yVj
 uySRZs9/GSULtU9TV++rA/vieNyWzUZldLd7prQgaHFkKrm7dSk/wdt/DTyG+MKOAGnGK396Lo
 SkM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 37/63] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Fri, 16 Aug 2019 17:34:59 +0900
Message-ID: <20190816083525.19071-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083525.19071-1-jiada_wang@mentor.com>
References: <20190816083525.19071-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "George G. Davis" <george_davis@mentor.com>

N.B. Modifying the atmel_mxt_ts GPIO reset line during operation will
cause problems with normal driver operation.  This feature is provided
as a diagnostic debug aid.  It does not take into consideration any
pending operations which may be in progress.  Modifying the atmel_mxt_ts
GPIO reset line at any time will inevitably cause the driver to fail.

Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Rajeev Kumar <rajeev_kumar@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a8e2b927bb12..def9f94d73ef 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4240,6 +4240,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
+	if (data->reset_gpio) {
+		error = gpiod_export(data->reset_gpio, 0);
+		if (error)
+			return error;
+
+		error = gpiod_export_link(&client->dev, "reset",
+					  data->reset_gpio);
+		if (error) {
+			gpiod_unexport(data->reset_gpio);
+			return error;
+		}
+	}
+
 	if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
 		error = mxt_acquire_irq(data);
 		if (error)
@@ -4273,6 +4286,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	return error;
 }
 
@@ -4282,6 +4299,10 @@ static int mxt_remove(struct i2c_client *client)
 
 	disable_irq(data->irq);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	mxt_debug_msg_remove(data);
 	mxt_sysfs_remove(data);
 	mxt_free_input_device(data);
-- 
2.19.2

