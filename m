Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351FF4803AA
	for <lists+linux-input@lfdr.de>; Mon, 27 Dec 2021 20:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbhL0TEl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Dec 2021 14:04:41 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41324 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbhL0TEb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Dec 2021 14:04:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 75393B8113F;
        Mon, 27 Dec 2021 19:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4CCC36AE7;
        Mon, 27 Dec 2021 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640631869;
        bh=7UA+qwc6U1JEnLC9yTOJ+Ig8LQb6ookJ+ctpJLHyoVY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cSN2ywrO4nLqh2oUPM8NzOyQ8laYSdOhv5rpHiWtVzG5Z1tXXj1DUE5fNMGmJESY1
         OXa5YSXppULr/ZCZOncBbyq1GcL4Vq5wLAg18rdvgdbsUgf0Yx8+UjlE0IE3dJqTTQ
         BB3Qxtt6PQStE/lKDXxeQVy0WbGfVeHYXRavEMMMejaLwojufrFUOmVp+4mSapTfKb
         /eZ7mzXQCnqKTc9ph7CjSOUhaIdb/KQsY+7orWN7qDFS4fqcWGoK9oVBoKUwCgkv44
         L3pjVhdRhOeibYlIMRLXrl7Z6QH91F/IdqGMm7Kfpdz9j89Ly173tK9No27OVXPiwr
         QNYrQWNcKD2YQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, digetx@gmail.com,
        mirq-linux@rere.qmqm.pl, tiwai@suse.de,
        benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        jpoimboe@redhat.com, caihuoqing@baidu.com,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 18/26] Input: elants_i2c - do not check Remark ID on eKTH3900/eKTH5312
Date:   Mon, 27 Dec 2021 14:03:19 -0500
Message-Id: <20211227190327.1042326-18-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227190327.1042326-1-sashal@kernel.org>
References: <20211227190327.1042326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Johnny Chuang <johnny.chuang.emc@gmail.com>

[ Upstream commit 4ebfee2bbc1a9c343dd50565ba5ae249fac32267 ]

The eKTH3900/eKTH5312 series do not support the firmware update rules of
Remark ID. Exclude these two series from checking it when updating the
firmware in touch controllers.

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
Link: https://lore.kernel.org/r/1639619603-20616-1-git-send-email-johnny.chuang.emc@gmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/elants_i2c.c | 46 +++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 68f542bb809f4..b9e2219efbb8f 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -117,6 +117,19 @@
 #define ELAN_POWERON_DELAY_USEC	500
 #define ELAN_RESET_DELAY_MSEC	20
 
+/* FW boot code version */
+#define BC_VER_H_BYTE_FOR_EKTH3900x1_I2C        0x72
+#define BC_VER_H_BYTE_FOR_EKTH3900x2_I2C        0x82
+#define BC_VER_H_BYTE_FOR_EKTH3900x3_I2C        0x92
+#define BC_VER_H_BYTE_FOR_EKTH5312x1_I2C        0x6D
+#define BC_VER_H_BYTE_FOR_EKTH5312x2_I2C        0x6E
+#define BC_VER_H_BYTE_FOR_EKTH5312cx1_I2C       0x77
+#define BC_VER_H_BYTE_FOR_EKTH5312cx2_I2C       0x78
+#define BC_VER_H_BYTE_FOR_EKTH5312x1_I2C_USB    0x67
+#define BC_VER_H_BYTE_FOR_EKTH5312x2_I2C_USB    0x68
+#define BC_VER_H_BYTE_FOR_EKTH5312cx1_I2C_USB   0x74
+#define BC_VER_H_BYTE_FOR_EKTH5312cx2_I2C_USB   0x75
+
 enum elants_chip_id {
 	EKTH3500,
 	EKTF3624,
@@ -736,6 +749,37 @@ static int elants_i2c_validate_remark_id(struct elants_data *ts,
 	return 0;
 }
 
+static bool elants_i2c_should_check_remark_id(struct elants_data *ts)
+{
+	struct i2c_client *client = ts->client;
+	const u8 bootcode_version = ts->iap_version;
+	bool check;
+
+	/* I2C eKTH3900 and eKTH5312 are NOT support Remark ID */
+	if ((bootcode_version == BC_VER_H_BYTE_FOR_EKTH3900x1_I2C) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH3900x2_I2C) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH3900x3_I2C) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312x1_I2C) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312x2_I2C) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312cx1_I2C) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312cx2_I2C) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312x1_I2C_USB) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312x2_I2C_USB) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312cx1_I2C_USB) ||
+	    (bootcode_version == BC_VER_H_BYTE_FOR_EKTH5312cx2_I2C_USB)) {
+		dev_dbg(&client->dev,
+			"eKTH3900/eKTH5312(0x%02x) are not support remark id\n",
+			bootcode_version);
+		check = false;
+	} else if (bootcode_version >= 0x60) {
+		check = true;
+	} else {
+		check = false;
+	}
+
+	return check;
+}
+
 static int elants_i2c_do_update_firmware(struct i2c_client *client,
 					 const struct firmware *fw,
 					 bool force)
@@ -749,7 +793,7 @@ static int elants_i2c_do_update_firmware(struct i2c_client *client,
 	u16 send_id;
 	int page, n_fw_pages;
 	int error;
-	bool check_remark_id = ts->iap_version >= 0x60;
+	bool check_remark_id = elants_i2c_should_check_remark_id(ts);
 
 	/* Recovery mode detection! */
 	if (force) {
-- 
2.34.1

