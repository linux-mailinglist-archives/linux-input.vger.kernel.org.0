Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7101D349F20
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhCZBxO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56307 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230331AbhCZBwr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id DA6675C0164;
        Thu, 25 Mar 2021 21:52:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Mr3SVxqvYtIDd
        YbZ+RVwG8ZSS/FVFdLi7hAy5Rzig2E=; b=G2wSsXraOQqLSMaTaMO22gcTlliR+
        xdsg1c6dRAtmCASGeJw2RtIA6UkZg8SQCQa4q6Nu3G5KRrhEchq1mwaC91CZA/Pr
        vJlpNNvS7UaA1G/4T1xbB7jzCA0ofF/4XE/krGBzdHGLhasDj+S2ou0YuzwoDryp
        5kD+Zbl3OqV7/MBVtXY2CxSrr/8NFMxf1rmNrFh04Db2axnB9muFsVDs4fjaZRl+
        uO6BAyMGgdo2hztEzQfTClnoS86t/EPF+axydn/CIBg/Au+9VJ2460EyflgOxm3r
        XrCJvhvV+yAx7rZeyspTART/Jmc32oBr22Z3eTMMDkWj9KTGB5AY5tMHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=Mr3SVxqvYtIDdYbZ+RVwG8ZSS/FVFdLi7hAy5Rzig2E=; b=HABi8Atz
        ZHmwyJX8hWJX63rsZOeCARIQcrHWS7USMZL09GhVjXUuIIHwjP/n8eqd/cEv7+Uu
        AarMwvhTHVwzfblEX291bZvsCYnhR2CH1hANBzT6n4HRdtBGPZSPdqmmzi632Ug4
        utczVMjKKO+p4iOkPZqD8sNNuEOe+qcMzQfo0XltCMEDv4F/wtjD0wSK+a5D9OyZ
        MPsBqu8BYPNDlcl1ZXMkfWY30Jfw2LRoral8qr6YgTI2dYu11pI7lvMRbzeOLsuR
        LOT4X6sqfeNp7LfSTH+pQUleOVwE6DHag7rEGK2AW3Up7qFyRzNkIxSTsSNoWTVQ
        Ite5/MPjH0QixQ==
X-ME-Sender: <xms:bj5dYDAVTueLyjWF32kkgDTPkLMRfjsa-6Fu4B1EdrxVLmfTnxuUpA>
    <xme:bj5dYJhBfhNXk_7YxsJOEHEdJMJ23ncj_spV72yV543KiWIrLvnjD9okfqF01YRJU
    4lRrzHzh8uiTWa2iA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:bj5dYOnVMPv343LAJyx6qySWrbcQrsfvY62KbNuyHmhObynSXpbnuA>
    <xmx:bj5dYFzWqVlUhApe4XjSWYyfhoPWKStO6gWFq2nTP5TWW3M4v_YssQ>
    <xmx:bj5dYISx-mQFv4uJ2L5uPkZ0CdxCG9hQqfK6kgqY7owkIQ0cBKhgfQ>
    <xmx:bj5dYOeZGuCZ2sqyd_rNSWOGYtwjY6RQvsVcQLa7768EhJmy5bPaOg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id CCC9C108005C;
        Thu, 25 Mar 2021 21:52:45 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 06/10] Input: wacom_i2c - Clean up the query device fields
Date:   Thu, 25 Mar 2021 21:52:26 -0400
Message-Id: <20210326015229.141-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Improve the query device fields to be more verbose.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
v4:
 - Remove the reset_control_reset() logic

 drivers/input/touchscreen/wacom_i2c.c | 64 ++++++++++++++++++---------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 3b4bc514dc3f..84c7ccb737bd 100644
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
@@ -48,27 +65,30 @@ static int wacom_query_device(struct i2c_client *client,
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
@@ -89,9 +109,13 @@ static int wacom_query_device(struct i2c_client *client,
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
2.31.0

