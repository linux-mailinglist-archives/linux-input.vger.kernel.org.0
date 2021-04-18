Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1891A363DBE
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238158AbhDSIkK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:40:10 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60009 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238092AbhDSIkE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:40:04 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id F37165C0081;
        Mon, 19 Apr 2021 04:39:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=lDkbZW17jQ9Hi
        vg2vxo/6OxHO8cpcehBux958bfFEjA=; b=D0yCvfOOZGQUcARrkW+AJ1BBx/ZgP
        JQEFxuUr5tJF3g6o52Mbxy5nLaPULw0TimIM2U/mw+aWT288ZvPT2/MS3EQAx6MM
        +yJRueAy5kjyIsBS3cJrq3oKnk6Qb3TT/dFQCiuX9Gay4OSFNMRq9lRxpVv54CO5
        9K0LJ/hZ6QUSbuVpLacRHvY9lQUcjwO8yyf4GDeiPX7uPtGzSN0+oHUTzWcpr2IY
        EOCtjreTakTok0LaHYCidKpZ82Z8pqxL87eghXlEWYNl/gvM7GGdNXe7SY+h3uOJ
        xP8wWdqAR2HRvQdh4w/yG9IpLyp+TjuuCpwV1sKDiuRAaierKDvfy/eWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=lDkbZW17jQ9Hivg2vxo/6OxHO8cpcehBux958bfFEjA=; b=WnQVCYfD
        hXST6OXX1IDVzsWRAQWokENeaTuFju1XKUmZhV1fYHgDPp8xybjnMqtLrYKC66h6
        fdeHhNryNyVakZAJTGROaUa1C+bnQJEuBLn6mFc+QkymzuH6ZTPlo1rCxI2q6q5A
        OJ2tCbFezxvZdF3/C4jgLHc7uxzN/zYxOkz28j3f8iIM1jZZb9ccSVGF8oUr5tWB
        A+92l+grPaPbdTd1e00lVJkvzFXvxC9wK3MMHstGuhj7zzp6ijm8xQJYwZY2DnDf
        393PAPkSkNtmR65Uo5Ge3dLHeT4kYQTjQ3v6JW2AvZE4iNgU0aXO7C9r1Y4P8aCW
        cHDnKBec5n7I7A==
X-ME-Sender: <xms:xkF9YHyOv4Agg8UFZyPzIWz7dhHhnZL1VsCyQzvM1cJkOwViREI-yA>
    <xme:xkF9YPQu2RX5FmkBtN6DIChNIwiClZaeCaIWRbl4kidS3XE237Bk1YzTcXMuBqvFg
    e_2jTj3aurtJlyBM7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepkeelrdeg
    gedruddtrdduvdefnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:xkF9YBWO-EUFgG6ulGXHLUYdJcqKNF2C2inLc8syCeR6cxAFhGz3MA>
    <xmx:xkF9YBjJupAv1-nkiO5qkqshH9JZASzU9gnEti_1B9xWGFbfm7zQ5Q>
    <xmx:xkF9YJDzlt55KVLxsXgSS7KfJbtcMltx4Q1wWWG4jeZBHMFTrjui6A>
    <xmx:xkF9YIPIfECm7mLsDCiN2n14-agGGpkNG6siL9mbNznRilHIofk8YQ>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id DA1B5108005B;
        Mon, 19 Apr 2021 04:39:31 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v5 6/9] Input: wacom_i2c - Clean up the query device fields
Date:   Mon, 19 Apr 2021 07:01:01 +1000
Message-Id: <20210418210104.2876-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210418210104.2876-1-alistair@alistair23.me>
References: <20210418210104.2876-1-alistair@alistair23.me>
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
index e0a69e63204d..26881149d509 100644
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
@@ -50,27 +67,30 @@ static int wacom_query_device(struct i2c_client *client,
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
@@ -98,9 +118,13 @@ static int wacom_query_device(struct i2c_client *client,
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

