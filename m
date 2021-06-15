Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148BB3A7BED
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhFOKdI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:33:08 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57961 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231706AbhFOKdH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:33:07 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id DA2E1580729;
        Tue, 15 Jun 2021 06:31:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 15 Jun 2021 06:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=8knOJ7YElFUkD
        BiiRH7ZJBc2RpziTa8+4Ew7FNGqJ8Y=; b=NodUZB64NxqRyqR8Ted5Vd68+dIMD
        bUAatAJWkpZsaoxI3QrYifEWVVsXkGsWspipUg4v6ukhN/sYwIjP4KK8xIsw6Dxw
        /PJpUcF+iKSxRu7ztBSVuLbKb1LWjDTHDDkX44MRfZrAJr9pR0nyGPl9k87k/t3H
        XbkpDNMPyzSucSDixCdLQ02ZFpQkX7S5N1qCwRM3hZ0T3P9u4sOVDWHsu0llR06k
        h2mPxZxCQIhKqHZ/rFMAljlNfzcYwVjqneSv0KanQihtwR1V7jDX0wVt+WRZ+jeF
        QmpakBbICeL/ESBkPPE1sLgJMeHHx1aWKMVp5vg3DeWMl7Yy7wSau5dfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=8knOJ7YElFUkDBiiRH7ZJBc2RpziTa8+4Ew7FNGqJ8Y=; b=nRz1XLoG
        tdxDMkupfNqD7UNLrjVm8ryCvwZW3imV7vfyQaRjXlO8pRjmuuHkKJHZLpPXRYGO
        z6FyLWBQzDUaPd2cH8X6UhmiNLdFm6XAwK/Zl3iD/a3NrmnjUx0hHOhYAF4pOhBF
        M9gYJngWs23f4mIYitCulpKaljvgEkfe3YOzfo2VheylAs81JGKDalwDdcP1tJwE
        76XbAZZoMGJW0n9twuwbhKwFPc5WFXWqeWrUoA2SY9ejwOdT8saRKNdzIYMCDQCT
        M1YA5hEOXcspj3ESX6KNh0eijJH+tVYDJWCx5tSWIqoIguhBqgPZ2OIU3drK6pcB
        7uZlWPmGqQYWtQ==
X-ME-Sender: <xms:ZoHIYNt4jbthcAR2zZAhoFCRlmU-YHCc1BbEn6xp52HP42mWH5TlSw>
    <xme:ZoHIYGdTq5Gon3XNMfobVqjG6eWvFRUY5c5EX2ZNLAkfOj_67qm5fAPhm_cuIxgk4
    GzCxHFX1Nua5FCHzFQ>
X-ME-Received: <xmr:ZoHIYAxlNR9RzKYGMKXJAeC4vYClYlAJ3g6cBWsx-uSpZ9yzEYDWbO8VV6g3yl2yczJPBak_xtMTLxlz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:ZoHIYEM6eBZgVjL5uGspE44UH8nSmGXD-MuR1U6Qhy1rtH03ztbSnQ>
    <xmx:ZoHIYN_EkKEEKkeYWLDvEoGY5jBkk2z3-eMnMSQf1w5_TlsyBaEiSg>
    <xmx:ZoHIYEXJ_js5Ha-9szbwV4vzD864vMWvsvTq78dMIcWlE34VeLaMLQ>
    <xmx:ZoHIYJSod9h3vsIRepmMKiCtSC0vPYOT332kJCyNfPICHWNvtxNwcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:30:58 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 6/9] Input: wacom_i2c - Clean up the query device fields
Date:   Tue, 15 Jun 2021 20:30:11 +1000
Message-Id: <20210615103014.798-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Improve the query device fields to be more verbose.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 64 ++++++++++++++++++---------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index e2449a4fa2e3..49d1c15e623c 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -13,15 +13,32 @@
 #include <linux/irq.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
+#include <linux/reset.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
 
-#define WACOM_CMD_QUERY0	0x04
-#define WACOM_CMD_QUERY1	0x00
-#define WACOM_CMD_QUERY2	0x33
-#define WACOM_CMD_QUERY3	0x02
-#define WACOM_CMD_THROW0	0x05
-#define WACOM_CMD_THROW1	0x00
+// Registers
+#define WACOM_COMMAND_LSB   0x04
+#define WACOM_COMMAND_MSB   0x00
+
+#define WACOM_DATA_LSB      0x05
+#define WACOM_DATA_MSB      0x00
+
+// Report types
+#define REPORT_FEATURE      0x30
+
+// Requests / operations
+#define OPCODE_GET_REPORT   0x02
+
+// Power settings
+#define POWER_ON            0x00
+#define POWER_SLEEP         0x01
+
+// Input report ids
+#define WACOM_PEN_DATA_REPORT           2
+#define WACOM_SHINONOME_REPORT          26
+
+#define WACOM_QUERY_REPORT	3
 #define WACOM_QUERY_SIZE	22
 
 #define WACOM_DISTANCE_TILT_VERSION	0x30
@@ -51,27 +68,30 @@ static int wacom_query_device(struct i2c_client *client,
 			      struct wacom_features *features)
 {
 	int ret;
-	u8 cmd1[] = { WACOM_CMD_QUERY0, WACOM_CMD_QUERY1,
-			WACOM_CMD_QUERY2, WACOM_CMD_QUERY3 };
-	u8 cmd2[] = { WACOM_CMD_THROW0, WACOM_CMD_THROW1 };
 	u8 data[WACOM_QUERY_SIZE];
+
+	u8 get_query_data_cmd[] = {
+		WACOM_COMMAND_LSB,
+		WACOM_COMMAND_MSB,
+		REPORT_FEATURE | WACOM_QUERY_REPORT,
+		OPCODE_GET_REPORT,
+		WACOM_DATA_LSB,
+		WACOM_DATA_MSB,
+	};
+
 	struct i2c_msg msgs[] = {
+		// Request reading of feature ReportID: 3 (Pen Query Data)
 		{
 			.addr = client->addr,
 			.flags = 0,
-			.len = sizeof(cmd1),
-			.buf = cmd1,
-		},
-		{
-			.addr = client->addr,
-			.flags = 0,
-			.len = sizeof(cmd2),
-			.buf = cmd2,
+			.len = sizeof(get_query_data_cmd),
+			.buf = get_query_data_cmd,
 		},
+		// Read 21 bytes
 		{
 			.addr = client->addr,
 			.flags = I2C_M_RD,
-			.len = sizeof(data),
+			.len = WACOM_QUERY_SIZE - 1,
 			.buf = data,
 		},
 	};
@@ -99,9 +119,13 @@ static int wacom_query_device(struct i2c_client *client,
 	}
 
 	dev_dbg(&client->dev,
-		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
+		"x_max:%d, y_max:%d, pressure:%d, fw:%d, "
+		"distance: %d, phys distance: %d, "
+		"tilt_x_max: %d, tilt_y_max: %d\n",
 		features->x_max, features->y_max,
-		features->pressure_max, features->fw_version);
+		features->pressure_max, features->fw_version,
+		features->distance_max, features->distance_physical_max,
+		features->tilt_x_max, features->tilt_y_max);
 
 	return 0;
 }
-- 
2.31.1

