Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450E32FF612
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 21:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbhAUHsg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:48:36 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59637 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbhAUG6D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 01:58:03 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id EFEF45C00EF;
        Thu, 21 Jan 2021 01:56:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 Jan 2021 01:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Jzi3cSowWS5S7
        0nBZeVOs2bPOJ//6VSXwxqn9sDhYyQ=; b=ekqWlwwehrCpGozy5ekgMgAmIq947
        rgcFOXZb98n4PxN+YIsDAlwruO4URYKcgCGMQI5qhPTE8Aja0fM+RPgXOuEq7DDV
        jGW5H3BLd9s3T9Wc8A5xPdGSRurcGVn2s23/kiLxV43iJe4GkbLktpO8pTNfB64F
        RXzdR13ACWGZIxDz89i2rZ1qTEF9nV+DYWCQp/DjGvoeLzQvrUmJvgupd+ox/Q5t
        psmNBcIQitPcJCRAYYKNKXrjmcAqP0amCttCXTkV6BUYmHPjk/jVhQmsP06vZ1GF
        YNaKmjip13YUjNjCtalsYt3nCo+mO9b2Ti8WrUo4h4pIhkSbu0X9MOBOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Jzi3cSowWS5S70nBZeVOs2bPOJ//6VSXwxqn9sDhYyQ=; b=FPYlGcpY
        VfR3s9YbX0ztpLdn2QKiXioWuNuupEMddxBh8T3gUfh6gUJU34optlDn5sN+mIzV
        6ycNuQEUZkZRoIuerg+2X0oNQGSBjjDqHFOyI37UPfvv6rO5a3HVdXKDV0+DTsw4
        GZ3hoTxdwa6RBTlIL2T5snYkBzKk4hjJTtU5AwQ8UAVv2uuItL38UGiONWdZLKxW
        rhOil4lWDmDeMIHFkERDO3owgnbsMz8KDsI2vLRsio5YBY8dXZdmbPTcQ6vZnb4k
        1/yQMMT8IWWZG3jPRaMKVNZo+SzzgtfJg0VDJbuX4iOKf3k6IWZJnKwRdrJNcIpG
        4N/H0iMs21yIgw==
X-ME-Sender: <xms:syUJYPoFzdXVdQkzB_iGX1Gf7TPmWCgGHshmrBB03nfrv611nZU6iA>
    <xme:syUJYJpDGNItjtV3e4gQfYyE7McnfCh7Ro8rutUP1NUS7mEgGwNF0X-znxv4IMO4S
    9Sb3i2kjzbWiN5zYGs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepjeefrdel
    fedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:syUJYMN8aRYfqOZ27vW2YJa0p2r1tKY4zdTWXSFAOUtTv3v05nNiFw>
    <xmx:syUJYC69qLOEGd7aUYWsEEac2TwOTC35SYl6Cag_Phr1bETS0Dg-TQ>
    <xmx:syUJYO6ke58QJcvYrXVooAAD6UrQtevhlIhbSbbXTZYomCubLC-aHw>
    <xmx:syUJYEmcpl0i5mQkDcNzurn6CGHgUnrSRRcBu2rn_G3FQsZORUdHGA>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0779E1080057;
        Thu, 21 Jan 2021 01:56:50 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 4/6] touchscreen/wacom_i2c: Clean up the query device fields
Date:   Wed, 20 Jan 2021 22:56:41 -0800
Message-Id: <20210121065643.342-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121065643.342-1-alistair@alistair23.me>
References: <20210121065643.342-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Improve the query device fields to be more verbose.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 73 +++++++++++++++++++--------
 1 file changed, 52 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 5f0b80d52ad5..a22570adc939 100644
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
 
 struct wacom_features {
@@ -45,34 +62,44 @@ struct wacom_i2c {
 };
 
 static int wacom_query_device(struct i2c_client *client,
-			      struct wacom_features *features)
+				  struct wacom_features *features)
 {
 	int ret;
-	u8 cmd1[] = { WACOM_CMD_QUERY0, WACOM_CMD_QUERY1,
-			WACOM_CMD_QUERY2, WACOM_CMD_QUERY3 };
-	u8 cmd2[] = { WACOM_CMD_THROW0, WACOM_CMD_THROW1 };
 	u8 data[WACOM_QUERY_SIZE];
+	struct reset_control *rstc;
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
 
+	rstc = devm_reset_control_get_optional_exclusive(&client->dev, NULL);
+	if (IS_ERR(rstc))
+		dev_err(&client->dev, "Failed to get reset control before init\n");
+	else
+		reset_control_reset(rstc);
+
 	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (ret < 0)
 		return ret;
@@ -89,9 +116,13 @@ static int wacom_query_device(struct i2c_client *client,
 	features->tilt_y_max = get_unaligned_le16(&data[19]);
 
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
2.29.2

