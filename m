Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A403427975
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 13:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhJILjP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 07:39:15 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60655 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232413AbhJILjO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 07:39:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B7FF13200D78;
        Sat,  9 Oct 2021 07:37:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 09 Oct 2021 07:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=sAuAlg1YEQ5sq8r/I8rO3wTnzL
        EwPBPmuYw2IxS2njI=; b=AFHT5YmC0qtgGh+vs2uFH0DOBHo2gOE/6wmv+vmGCL
        cnUDTgoR9F41Zn6tB0niSL3Hp7zIUjOojLC0UIdSbWBm9gvLU4I8U4aXV0S2Kwwh
        M+SAI0HigW71gkmRnibIbFwzAT8rhJWCF82znzD/r/esp7qU7NP9+aN9G0UiJfo4
        yqjPxT7idIAeQQowJTAB5lBomufZ5Z/qH98LCvY5EyX9FCwp3+5St2U3lDFHAj5m
        tc2wCAN6n2N7Y9przgL/3F2pMGU+u2RyTkYcLHzMH6YDiwirQ6tNF9q8PC9ne5o1
        +RvPLFzQgYcP7PfsnGToQerJgwJ02KWDMJGauMVr+Xkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sAuAlg1YEQ5sq8r/I
        8rO3wTnzLEwPBPmuYw2IxS2njI=; b=FbT/qW9OKhDpqGvQ/IvGvoLEuStMK3kXb
        c7lAKA4LDi+u9v512rJPk53LvrRlSTCdWr2yWyoN7xTaVW9/fTi3eyR0u5s5Xa4y
        GyzNSTUaIyv81TtuVy0R5pIz5BlThHXCe9/l3wh1b3SILriQlZFDC27iqJWOdD53
        4/Naod5Roe/8F7q/38K8zrzH6GSJmQTe7aEQJIWFFPAzJCHA1GQi/f1217P5bW8+
        xlzvFVB82TxBQ7qAEKRik+jHdB+nxIEGXg0829k/a9U+59FzCiGmOVx5F82uGKiY
        AmS7sfc+CzoeiJmeD4dllQt62LP/APojtD+g1u2AzFgLPUsxPBoxg==
X-ME-Sender: <xms:7X5hYcdcsv5haV0R66l87Jx-LJOZleICzXDSMeTQL9d7BR5YQnvVXw>
    <xme:7X5hYeNmthL1pvfGztEHM9YD_sceRENNvA4owezKv3hKLTCUuM_9UQM4X_j1Y-MtV
    3VMEDBfpB5boHvYc9A>
X-ME-Received: <xmr:7X5hYdgYvoIm8vI8D0OaJQAesImGmjOKIgjwsv_uO4uOYEbT0oNC278OajsZfeTgwXMd-FZv1jocGvJWsBAk5nVX7FIdGbCYg38>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsth
    grihhrvdefrdhmvg
X-ME-Proxy: <xmx:7X5hYR8QRvFrb_7cvgZJxa6n0NLp3BuT5PCl0pM30pc1QjNKqH_ZgA>
    <xmx:7X5hYYt7KKhY-07scbi1N4E4gSNjRs835c220xsNbPOM8Clgwek-Ow>
    <xmx:7X5hYYEYRufMN4bS9bjvc1fStnZtnLeiTJX1kfculareI_n1_NqMOw>
    <xmx:7X5hYUKtjugbcqwgXdwnJp3DOhgZL9Y14prPw0gEdEfgrjv4ZkvofA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Oct 2021 07:37:14 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     alistair@alistair23.me, alistair23@gmail.com
Subject: [PATCH 1/2] Input: wacom_i2c - Clean up the query device fields
Date:   Sat,  9 Oct 2021 21:37:06 +1000
Message-Id: <20211009113707.17568-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Improve the query device fields to be more verbose.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 49 ++++++++++++++++-----------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 22826c387da5..8d7267ccc661 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -14,13 +14,21 @@
 #include <linux/interrupt.h>
 #include <asm/unaligned.h>
 
-#define WACOM_CMD_QUERY0	0x04
-#define WACOM_CMD_QUERY1	0x00
-#define WACOM_CMD_QUERY2	0x33
-#define WACOM_CMD_QUERY3	0x02
-#define WACOM_CMD_THROW0	0x05
-#define WACOM_CMD_THROW1	0x00
-#define WACOM_QUERY_SIZE	19
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
+#define WACOM_QUERY_REPORT	3
+#define WACOM_QUERY_SIZE	22
 
 struct wacom_features {
 	int x_max;
@@ -41,27 +49,30 @@ static int wacom_query_device(struct i2c_client *client,
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
-- 
2.31.1

