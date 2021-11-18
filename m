Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30B6455B9A
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 13:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244216AbhKRMiy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 07:38:54 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50283 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244153AbhKRMix (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 07:38:53 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id E91D35C014D;
        Thu, 18 Nov 2021 07:35:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 18 Nov 2021 07:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=iKI+aVjgA+kJtYX60R+9iXQ/EJ
        QYl+sXi1s+u7msgzs=; b=Z3fSUJC4WoYakZFAMN4PdJLPbj6Bl6lpO4STEwcbcb
        qw6sq4MYPPBoXkT2bsww5iDI3veUoP5uiPpduenUP27s1fMZQpsu7TFsIVwAk8P1
        +pm2A6zyzQa89womAfoS0jUO75nDHRebsevSTH3ps/67lWfWjulXoQPocCegmbJk
        KxhjnVItePlScWGgIU9JA4cTpbcqz8GpDhApUug4e12ZG6AfCyc049rZQAsGBEMd
        WlKc68xleJJRHN6pa3gZCFK4FnsgrsGa3zdl9+W2NVobTWmsOG0qJwzUJkECLwd7
        ckRgwoX3j9ErGNK0I/Ap8ue4H59kF/6re1e33/jVMLbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iKI+aVjgA+kJtYX60
        R+9iXQ/EJQYl+sXi1s+u7msgzs=; b=bEQTUr0hBe0I23xM82Gp+QhPPC94P7Alt
        J0FAwShWri1/VWATAYh7dHUkNGPtHOppsGxRc8lkm0fvthph4x8p+3XrJZGVBtpv
        mHc/uUzpWVHV2Muj3rmMm8RV+J38XMO8pXX+k07jqxXi+jqZsnW8RQZYW9c/Q4HC
        gVxNN7s4kBqk+fHcI3SEw2ZK9hDDjYLwwHCkDDTYVnl8uqRNoyu3Vnata+0XYwUN
        uS9sZYZM/6mNx+vTR9KnnMPKxi3rB2mOIdYEgPIEAY1bO/glmQ+kABn5rte2smHp
        ppTBfVPDP/fttjld1/9lNSkYbpvSyaKZY1ohlu/Zt8FRWgcNn6MbA==
X-ME-Sender: <xms:qEiWYXdXqc45QjtBslOEYVxZR6EzwhUs8Xg-RjPgm_6I5_dt7jLZWQ>
    <xme:qEiWYdNDWT6olo6SE637rBrSy6rjrcad8UiWlxPRLhz7Y54NYMCbYmWUHro09h5u_
    ATCzkv8BhxbwlIUBfk>
X-ME-Received: <xmr:qEiWYQjL1TbmqdEoI0MDRyJEFredjlzqLIshsa1bIgf_Us7kt91cMDkLki9ZMZEdQ0qRwp-9sRU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrg
    hirhdvfedrmhgv
X-ME-Proxy: <xmx:qEiWYY8OtM2y21edjN8lt8d-RzX0GpjdnIdBJitqFE3OiVDHSEt83A>
    <xmx:qEiWYTtx1gS-3Ahhuo7fiUotfXwLbUzr-De7ondXIaF_Wdi2E8R4vA>
    <xmx:qEiWYXHUU8Ybvq9wFCC0KpTVBFd95ETOleAomFUgDuLxEQmLMOSeVw>
    <xmx:qEiWYTL3vWptxGJHV4EBr3_JABpeyrYsY4EDMucn4S7gW66EyutE4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 07:35:50 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     alistair@alistair23.me, alistair23@gmail.com
Subject: [PATCH v2] Input: wacom_i2c - Clean up the query device fields
Date:   Thu, 18 Nov 2021 22:35:45 +1000
Message-Id: <20211118123545.102872-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Improve the query device fields to be more verbose.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 45 ++++++++++++++++-----------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index fe4ea6204a4e..50d159919bd1 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -23,13 +23,20 @@
 #define WACOM_BARREL_SWITCH_2	BIT(4)
 #define WACOM_IN_PROXIMITY	BIT(5)
 
-/* Registers */
-#define WACOM_CMD_QUERY0	0x04
-#define WACOM_CMD_QUERY1	0x00
-#define WACOM_CMD_QUERY2	0x33
-#define WACOM_CMD_QUERY3	0x02
-#define WACOM_CMD_THROW0	0x05
-#define WACOM_CMD_THROW1	0x00
+// Registers
+#define WACOM_COMMAND_LSB	0x04
+#define WACOM_COMMAND_MSB	0x00
+
+#define WACOM_DATA_LSB		0x05
+#define WACOM_DATA_MSB		0x00
+
+// Report types
+#define REPORT_FEATURE		0x30
+
+// Requests / operations
+#define OPCODE_GET_REPORT	0x02
+
+#define WACOM_QUERY_REPORT	3
 #define WACOM_QUERY_SIZE	19
 
 struct wacom_features {
@@ -51,22 +58,24 @@ static int wacom_query_device(struct i2c_client *client,
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
 		{
 			.addr = client->addr,
-- 
2.31.1

