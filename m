Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5313FAA58
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbhH2JVN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:13 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:56541 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235025AbhH2JVM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3781B580B11;
        Sun, 29 Aug 2021 05:20:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 29 Aug 2021 05:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=RTgaVDXWoRXRJ
        wgIVpmycBU/xv+/gC91Z3TySev1IHA=; b=q+6sEqseAb8AOboKlK3XNpo33fJ5C
        LOjg6QGmywutNfcm2OGIvX1qnX7wMsPZcZMAXaXvBIthoTfvG+z9juHC6klCFBwb
        /tt08BKvv6kvfznLn9IMUHQ2oQElj1pM1FBi8H0AgZ8f22JPmEQd4ts+L9NBnjPb
        GuF/lYvUj9koJZv/lMo0y359lHG3NaOiwrJc+i/8wIsQd0dvclT0R51RVoLgfbAt
        c+u2RFyufcTfh/03Z6be6Zl34+vUJElLtnvjrbs54XFDrUKDjycK9NajfEkTSd1e
        uVU/lJQugJCQTHin+lU7LGsbNFglENa45BS8n4UMzf3kh0SNjBzFPQLYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=RTgaVDXWoRXRJwgIVpmycBU/xv+/gC91Z3TySev1IHA=; b=X5HoutB3
        LMo6ClVeRmbi5KWisdg913k2uaFDjh0dGQqcayK23RNEFikyZV2YpbAWxQd5OmsX
        oUf19y4rL8JVizKgQ2xxjTQxJmh5/qheOjHQGm3tz8RWKkxpbxuU5YSoWgnfNUrE
        gAcNpB3cy0wKCkffqACcylNkkXRN+ElpBGcBKJYsevqGgTniTBK3CupIRpkt49Y6
        W3xKRO0I0xdaxZ5El/tt1Ci+BAkBAVER0P4DW9xxVkJBwEPF5bTjc1KFqiLnf2jy
        Cl9RLH1jeAyUzFQ3OQaOua5Vmo+xmVcDTxWdv3wQFY1bpD8qaDgSnTKmVoRliNdh
        5GHZ7kx3DQ20Xw==
X-ME-Sender: <xms:VFErYS96d75ZZ2T8HSHdFvLhPAcZUW4VyflHfXjHy9FK-9Kl9UColA>
    <xme:VFErYStc7x3rsRHDNBInA-8vJcHeH5Uf6Uaeza2g4tBdfIpYLn1QTOCQwCFWPNcUO
    Wa-C9UsFEjCHmXup3Y>
X-ME-Received: <xmr:VFErYYA4vQStcVC2TtpDmnEizGLEiEXH6EyVMVCE_xy_9rtu6b2aV7jcvcY_TYT_U_MdbcaniyLKpSW4MkCdZTwbVqrTQ8Vb__lkssgJUYMj4JWpBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:VFErYad6N2Dy4OvLgrzdQXfMkhbfikHR79itczCsTMyTmQzln7eWRw>
    <xmx:VFErYXMHCfCaqhiH3FxI3nBTS1787T5nsob7q0QXFjnqty5kiVI1Tg>
    <xmx:VFErYUkadGlQKhvkjHAtetp_UMKhqWmLqHw7FwwGD7FYPx6J2PCdSA>
    <xmx:VFErYUlRWTZYbUjX87WBAbraVuJBEozUf_LEm9sTydZcsAJkLKiq5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:15 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 07/12] Input: wacom_i2c - Clean up the query device fields
Date:   Sun, 29 Aug 2021 19:19:20 +1000
Message-Id: <20210829091925.190-9-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Improve the query device fields to be more verbose.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 63 ++++++++++++++++++---------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index d6036406a9f3..a35d8fda7e7b 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -13,16 +13,33 @@
 #include <linux/irq.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
+#include <linux/reset.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
 
+// Registers
 #define WACOM_DESC_REG	0x01
-#define WACOM_CMD_QUERY0	0x04
-#define WACOM_CMD_QUERY1	0x00
-#define WACOM_CMD_QUERY2	0x33
-#define WACOM_CMD_QUERY3	0x02
-#define WACOM_CMD_THROW0	0x05
-#define WACOM_CMD_THROW1	0x00
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
 
 #define WACOM_MAX_DATA_SIZE_BG9     10
@@ -85,27 +102,30 @@ static int wacom_query_device(struct i2c_client *client,
 {
 	int ret;
 	u8 cmd_wac_desc[] = {WACOM_DESC_REG, 0x00};
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
@@ -158,9 +178,12 @@ static int wacom_query_device(struct i2c_client *client,
 	}
 
 	dev_dbg(&client->dev,
-		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
+		"x_max:%d, y_max:%d, pressure:%d, fw:%d, "
+		"distance: %d, tilt_x_max: %d, tilt_y_max: %d\n",
 		features->x_max, features->y_max,
-		features->pressure_max, features->fw_version);
+		features->pressure_max, features->fw_version,
+		features->distance_max,
+		features->tilt_x_max, features->tilt_y_max);
 
 	return 0;
 }
-- 
2.31.1

