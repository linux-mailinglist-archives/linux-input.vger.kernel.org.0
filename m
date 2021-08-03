Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0763DE8DA
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhHCItt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:49 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:37927 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234816AbhHCItq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id D23155809FE;
        Tue,  3 Aug 2021 04:49:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 03 Aug 2021 04:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=8knOJ7YElFUkD
        BiiRH7ZJBc2RpziTa8+4Ew7FNGqJ8Y=; b=l7HVrOGYHv0eceIQvRMCd+n2zrz3L
        W32C+ZyHMp1ckbIzKfswITmv9rwe+sPF7vBXf3dX6vczpOOsS1UgoOhwYEPyTVvo
        12K6+xdFr0CeV5kjAg875z9uBu6jL9C2PMM7+50Ry1DBsBqK/xmBENiwfQQlSYLQ
        wvAJ6BgioRb8xcSQqo1yZ7/IJKDXtbulEvokqQKlGNCEIesh7FnLg54PIaTiJK0k
        IQd9k/ec1EyOLOmELssU0njLb5DGdACPXs6TczsPi6gw0GwpiafL7nWBzqV5dHT8
        /0of9ax+k9CqIx2sVpQWCJIJRp6uKkFPX7aD13ml8n1Lt2nF0yHusPQXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=8knOJ7YElFUkDBiiRH7ZJBc2RpziTa8+4Ew7FNGqJ8Y=; b=XJ2gs9C5
        EJwJc3yPSF3mTOJRVPk3AnOV+41lE1CtLtbpb60yUURivHgGwp6hFsQ7u88lMMW7
        Sd7YlpPNq+fA8kQIPd9TyMc66P5CMQlxUSpe6jK+9iTX9g2FhrUPlROoBwy1ZgkR
        JRFDreiZhm1iELeX7iPrDePJwwEeZzR1qmZolruRYHrtypwBlLcgjEIanXJx7Inr
        zWdkjxKzti1LHxlbkL7gJKy4J6V/h1C826oBN1N1q5qgNhyhdjh8LV6Nwxi4B03v
        oZbQrauLHYtppebfs0KkQGTBdZLy/ZbDrR6TkYIH1XnvpG0iprtzSMgkfCa0Hzvo
        N8W8p9q/dhoZ4A==
X-ME-Sender: <xms:HgMJYaLvheRCgqSF5wfnWpJpAsEpoTBGxxKBrvBBWQSWbSAhCZ5VmA>
    <xme:HgMJYSKwoE8N6EnRRzc5S3lZDhCuHe5H8eLEzV-LaQ_wXyUVPmkO5XBQDSQu7jhFe
    ZyrGK7zFmLOerku3L0>
X-ME-Received: <xmr:HgMJYaviYRgUIPQK0wdgHiIrCI_S--4NnSMg1ZBNyw-LDVL48zwkoBTMEhitu3NX30tAzesVe86eFVRl0sTmuNjKUgJDUKBAEibqqC1YipQntQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:HgMJYfaQ2tcFfw-qPopWxNyd-H1_b2ZFFw5SUiI4V_9Pa9PepY10ZA>
    <xmx:HgMJYRaBWHnD3MMOrEXVxoyzJekQ05ZSOZDZvpqFzr0MO7z6E589Mg>
    <xmx:HgMJYbBW18NIhlMVEFCZAFOXLlPaLmB18u3B-nc6XoVEGY2pyOGaoQ>
    <xmx:HgMJYeSE2c546R5896wVVNpRrThIBA4TlQ7S2LB8AF_NrNhqrMz79Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:30 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 6/9] Input: wacom_i2c - Clean up the query device fields
Date:   Tue,  3 Aug 2021 18:48:59 +1000
Message-Id: <20210803084902.336-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
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

