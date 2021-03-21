Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E003432E4
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhCUOLQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:16 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47153 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229920AbhCUOLK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6B6A85C0116;
        Sun, 21 Mar 2021 10:11:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=x+Hb78RjpnhpB
        kIL3qRebVWJuGh/fm1C5mpC8sGyBiU=; b=ionGDJ5KgwcKjEi+yH2c6/i6IEHVZ
        3F3T48rR0wj4YIjEi4q6vb6BgrNcXsADsosui5GuFmTMhFoI6Hr+4NDiPXPmkj0h
        t8NGaIh64C5mFbKqhKAaHExrpljpXfD3uvoUNYpDmUSm0M8+37HXV89bnwvhnCYC
        WgCgcl6odsv0RzK/LdSMU0hYkfncr+mvgpIHO8IrQSI6wlhQgofTt++ayGRDGs+8
        FQscrCO2dOlobJdFPPKqD05s5AOTS7gdn3gJuT/IRL8g3F25M0DA2wJdFNLU7KV1
        0P7mzKaomTVcM2TX1q6QG4QdHPSDYa61+pq7t5eovI90Uw3HAZDN1653A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=x+Hb78RjpnhpBkIL3qRebVWJuGh/fm1C5mpC8sGyBiU=; b=rJc9jhRQ
        oYYVUuXWzLSOf9QloJFqvMXWyucM8BHPJn3ozludbVuEUEPQhoO9j8UCaVjMnHZy
        zakQ4DI0KBuDlpIn3Lj5Ye7uHxIPxyGtIWvGJwRhjoEu5aKVD93j+V82QoR1Qp46
        pwBp64WWPEoqOfqwWgt+55nJZ1BhVE+uDevqDyxZRWltaDNmdOWvRFHFh8JMehtI
        clsW2fV80LdhOnOlCltWXkfGljAAb24wlyujiLWFHtjpAPr/zPlxLBYUjzdTlhS0
        Es2sGuBOQlL94xGg3d74EcGDIdP8QYGHYO6XHB1B+vsh28hX24gIdSaQrFBmyg8g
        XxoQVlws4ATw6Q==
X-ME-Sender: <xms:_lNXYOD4BzV0Qc0twvkjYYJSw-lIZZWgvOjKqpHpDNXxjgg3exvTTg>
    <xme:_lNXYIhTdLSGE_lx3I1x9GaluJ1_Cujkyqk0NKCko1lg-kR0g_W0yAu5HjqZFfyKb
    Aa6e4DMBA_QIQ6qsGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:_lNXYBkZVEH-96VJRGLib3Sa6qqig9QhbZJ9kqpX03UYwM6bxjyn9w>
    <xmx:_lNXYMyRSnWnKkMcxOA4Ywn9jnyMrPmmI8zRN7QsHz0oBrEpsFZzFQ>
    <xmx:_lNXYDQgEXxdx9FZMHK-o5EcPMCaxS5BgJXq-AJPsGuiWkiR7Ra5BA>
    <xmx:_lNXYNcIRwpuANQyW1r3l6b5dEjx02RvEtdcZNuWGE7vazKtZtd3-w>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7E6B4240138;
        Sun, 21 Mar 2021 10:11:09 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 6/9] Input: wacom_i2c - Clean up the query device fields
Date:   Sun, 21 Mar 2021 10:10:46 -0400
Message-Id: <20210321141049.148-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Improve the query device fields to be more verbose.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 71 +++++++++++++++++++--------
 1 file changed, 51 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 929680dce9cf..7aa0d1c3dbc9 100644
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
@@ -48,31 +65,41 @@ static int wacom_query_device(struct i2c_client *client,
 			      struct wacom_features *features)
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
2.30.1

