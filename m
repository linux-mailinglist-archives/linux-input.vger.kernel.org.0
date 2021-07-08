Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C8E3BF997
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhGHMCS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:02:18 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43281 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231758AbhGHMCR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 90CAD58057A;
        Thu,  8 Jul 2021 07:59:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 08 Jul 2021 07:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=8knOJ7YElFUkD
        BiiRH7ZJBc2RpziTa8+4Ew7FNGqJ8Y=; b=M+RMCIkkVmL7363VHpfvCGUfeYRH+
        p2W9w9M1FTzXVEmBB+7XZUAmjvKtgx2I6scPpKCjp4H9+w76D3W8UTQfYOj5JW7X
        MTdb8vSIC6ltakuW5s1eHQcN0wW1VPWCCIfBL1muuxEpvCznWqM0VdMWoVICTbMO
        GjgcYJPWy++GZy4RRojLOnGWBHH8rMrJm15sMeCGKki/+eNPwt1pbl7LvJkhPtJW
        I/D8ccaYwWDhYCmpL5YThJf7vb+kEfDz0GGoe/4MviSu84E3WHkc6AhLMwF2GzWw
        00k8hmbruq80MX2wAXIwSKvR66pzXpMXIYbf1RHHvkrek/nmUkQ1vW0Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=8knOJ7YElFUkDBiiRH7ZJBc2RpziTa8+4Ew7FNGqJ8Y=; b=QH/V7T61
        HJcmcIaFFNqSTsndvDj0GAoL++7U1KERF2UJ09RaG5MHjqYFlWSGtnP02KdxgERt
        Jj3WAZ8dlbfIN4uNk50+cLLLuipQQd/jsFJJ457qOFQfjdOHjpaEflhGqSSfXg89
        LCJjng4+5iOhtrZduWCnE3Kecu5ndEUXYS1MTe1CPKxCtvrtL7i/0XNLmw+ojjCH
        vDk92DBg0G6wtMBKGvInXVziO7LTP2WKcMdAW0Ga44B0GvO8oOkjuumPOmRG67Yx
        +pOzzJJeGxLGm1Eh6tVNm2FApoAbRtnpVtKh58wk3K+TkoYIRQfiXA+l63rK/OQL
        bLuo2BpNDb7jLw==
X-ME-Sender: <xms:p-jmYDlV0Tt3c9f1vqYTn2AggN4_Wr6nIxBtfgSn79EHIcFMFt7f6A>
    <xme:p-jmYG2bNNEpNtcT__jkXH4KwUda8lFgqmChc-6ErXEQM4knAjUdgMGmBewpU6V5z
    ZtM-UvBpeKNXl7QAC8>
X-ME-Received: <xmr:p-jmYJpz5hzONfyj7UfOAE-N9O4AP2sAlFQON9487ok402cUEEU_N_NSEHQgBhrYfYYRury5Hko0OJie0xk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:p-jmYLkA17wkKLdxk3snVaOAlbHrJFRCOZhpxMOAplEX9UUuIfMm2g>
    <xmx:p-jmYB1JAeemFnuy_-1XFb--4E6gZ0ppFy6w6E11g5IF-c-_XlJ5Aw>
    <xmx:p-jmYKvL3pAtsC7bxp1wrz6RyGQfWSxFlvC06bu0atZeRI3PkqQRYw>
    <xmx:p-jmYKtccDtfoqae9ddGOjqLhwut5bnbph2oQr_UNLdu4WOLH1m6dw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:31 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 6/9] Input: wacom_i2c - Clean up the query device fields
Date:   Thu,  8 Jul 2021 21:58:50 +1000
Message-Id: <20210708115853.281-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
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

