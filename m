Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DC33F17FF
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238834AbhHSLVs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:48 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47217 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238865AbhHSLVi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:38 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6DD3C580C0E;
        Thu, 19 Aug 2021 07:21:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 19 Aug 2021 07:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=Mgyn0Pl2gvmbZ
        jH/br8z7Blip4/G4e2q+jWo6laMznU=; b=e0eFTJbK5kh75ZDI9RYXUvFBkO5Cz
        5fymH92saeXQZuC/zq4j6WtYt42x6sTQj0FQ7kOMTiP1473E9DzGbvHt+cMGdiYp
        jLfxzv5znY1sle1B9UXl8EfFfu6I77lxXlfWPvdDRrvOsptaPkdxdFHYmlAiufe7
        V/NdUrrUhDyqpVlAJey6qH9LsB6HyzOxoz8HXDepA7o+ye65uUFleuM2dReph0nY
        2U8fY1ZmY/dRwNOi6bcTajzO4wL/HTXCMKfe99iupGpXO88OW66mnMuzRnm2Gmx2
        ct/UebxKkDj8rI5QIB0sPHNTj06UDh4sAfwcymwetP+eG8jXmb3FqAamA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Mgyn0Pl2gvmbZjH/br8z7Blip4/G4e2q+jWo6laMznU=; b=I0lt1uUp
        50mR5rQpcKWuc69yJa2nJOTD2TOt4uNP7yTnmCy9XukvJgejYdQQj7R6eMhCPVmn
        IzdGcu5dVR5tdw9rg0tMMJC526K00nJBKOX5XkZWi47AcqOs+1Xasw163ls8thd4
        DpyOWoazuqpuBnSXEXOIK44GcNH6AF7O6kqpPrIdHYEWlLlS+0B0lg65on/+Js9D
        7+5q2sK7QhN18drZyVAWYY/x1/uRDWEeY14QVQvXMA8ggbx8IkLqL8jaY7/NxMB7
        h6vcQdYGLEzwByP0D+N7mLMryONc4nZbNIhKkOv8xIjajjo8xmhZ2IxcZtuwkoa4
        TeHx8WQtnSIMeA==
X-ME-Sender: <xms:nj4eYck0Sd6_EVlBIw9IeKEONHQH5i_Ht4al5CbykVi7jZ1lQNP_hw>
    <xme:nj4eYb0r2qmIm68xLMr1O6WV64X8c378baH-yKZO67EE_I8YrZK7cgdNB7T4cDLek
    qgSs5g2qrH3lL0uIW0>
X-ME-Received: <xmr:nj4eYarFzIRj6An2eAIQWLmIGW7o1m_8EqbjRhFgyoGCgTHXkTxr4Myn1qbYeiaJhPaAcTGHg_Zw22gtznCR-kg5D4Wq7p8aWs9G5xjzhMudlJ_0OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:nj4eYYlRYm5y7nq-Hz88bQ7TaK0v3AHLxbTjW65FBjnnKHfb8PalgQ>
    <xmx:nj4eYa2RrYny_8efMxuQVudN_ryVEip50L3EyF1RTg9OksEj_IBFhQ>
    <xmx:nj4eYfsQK2JZLa8gkdyuQ2RN3Q9ouWlwAt56UeBpJPcEaYNBXi3fOg>
    <xmx:nj4eYTvp_8LWVEl_XlcRVweS1xk5FfAorfZTmyuVyI66wrXi879Ljw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:20:58 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 06/11] Input: wacom_i2c - Clean up the query device fields
Date:   Thu, 19 Aug 2021 01:49:30 +1000
Message-Id: <20210818154935.1154-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
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
index 4d0c19fbada4..33a3ba110171 100644
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

