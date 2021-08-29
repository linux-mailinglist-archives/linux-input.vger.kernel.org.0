Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5303C3FAA53
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbhH2JVD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:03 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:45459 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234990AbhH2JVC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:02 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5FAAC580B11;
        Sun, 29 Aug 2021 05:20:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 29 Aug 2021 05:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=00k/cE/VEfTz/
        +dQ9yaE8zGdsiZBwAiNjh1K23Pi1yc=; b=1dSzrr5YQgzRyafCzkmNdpZkQJ8wD
        Pn0Z7M8IFhl5/higyORImVky4GaHqrhYsFOVVXpG/J9aB8K9k2cR4AC3VzIHbuWE
        dTvLAsD0mFnJL+Wi2wBdfFZBl8lU3DTUak2HOw3Jfn7XFPnQPzo4HekHojXLfjYI
        r4sQfCmsG/xKzxUOIOtIbs+C7RXzjua1z5xYcnphZfes3G5eNp67o+XSxD6Bd/Rc
        fvksOTrDdOfaVzk3y7XjKxmOvGykiVLjSgwA4Maiquee+3/tfB1m8EKIZ0Cd7Ero
        13XDGzag+rRDrQC+uIzvg5rSBgVO5r+VmkmlJeH8orMBHIx73G4mff6Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=00k/cE/VEfTz/+dQ9yaE8zGdsiZBwAiNjh1K23Pi1yc=; b=lAcBFIi+
        tEugxtw5tamyDhgH/0BOd5n76H+CYWiG8BKzYJXuvvO1vi00WiICoozEKedniPPc
        D2Id11EX/xdtik+CfiPrfO/+++C+xKYSAe4NvyrmkrXRXr3IARLrn8ud75/kxcyl
        QgIgcM19b86jZIG6n0P0cSAP+9SL82tkVYtSvqjjnUEZ8L7xFOrbsyyQEM5vmNUZ
        xrSHClGmXMcT1h1xtNtD+1AW/Sto/m7KIcVHPcEVMfaZy5vHpQBV85ks5YIii8fy
        G9erClRG6fi3DFhiJhPlxC9GQlm8WDQiaSVisNPk5/QsIh1gEKYhjde1+z1j7YdH
        O9VvznakMq4SDQ==
X-ME-Sender: <xms:SlErYcQmRbZ8JhrRjXt3eUhoNOtmpS-cd3MCbUKV45QXFwlzCxrSBw>
    <xme:SlErYZy167iqUG69VVbO6nbWdvZAAJKopdkDm9COB83KH2wLQ179JbWSsXUCB9PFP
    1d4XvccwxmeCFxp8dE>
X-ME-Received: <xmr:SlErYZ3TtiyYDhJH5Erw7uICbLDW7oEnIugXExhHW0OFhI7UDmRvaAk09x620qNo6bWaFv6fTi-5Y57QJ2uvMfF2p5E2alQoDhZ7xiEbQWHsR4UnTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:SlErYQCUlsvTOeXgDbAMqVtBkLNZV6Z4v5f7USoTiBGtmRm99-wiNA>
    <xmx:SlErYVjIWKSF1IVvpLf4G0IMAvhQx-GdFVr0RM9cw_ybxdx3WT7B1g>
    <xmx:SlErYcr50j-dram_9I-GYHimSC5yD6rf5fs2Ba5PwQ_xu1JC2rHsKQ>
    <xmx:SlErYQoTowihg9gn00exQi-8P4tbsZbCSjZD65cISYSf_XVghSrNaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:05 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Date:   Sun, 29 Aug 2021 19:19:18 +1000
Message-Id: <20210829091925.190-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When we query the device let's also read the descriptor from the device.
This tells us useful information, including the version, which we use to
determine a generation.

This is based on the driver from Wacom.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 28255c77d426..72ba4a36459b 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <asm/unaligned.h>
 
+#define WACOM_DESC_REG	0x01
 #define WACOM_CMD_QUERY0	0x04
 #define WACOM_CMD_QUERY1	0x00
 #define WACOM_CMD_QUERY2	0x33
@@ -24,11 +25,46 @@
 #define WACOM_CMD_THROW1	0x00
 #define WACOM_QUERY_SIZE	19
 
+#define WACOM_MAX_DATA_SIZE_BG9     10
+#define WACOM_MAX_DATA_SIZE_G12     15
+#define WACOM_MAX_DATA_SIZE_AG14    17
+#define WACOM_MAX_DATA_SIZE         22
+
+/* Generation selction */
+/* Before and at G9 generation */
+#define WACOM_BG9	0
+/* G12 generation the IC supports "height"*/
+#define WACOM_G12	1
+/* After and at G14 generation the IC supports "height" and
+ * it is defined as "Z" axis
+ */
+#define WACOM_AG14	2
+
+struct wacom_desc {
+	u16 descLen;
+	u16 version;
+	u16 reportLen;
+	u16 reportReg;
+	u16 inputReg;
+	u16 maxInputLen;
+	u16 outputReg;
+	u16 maxOutputLen;
+	u16 commReg;
+	u16 dataReg;
+	u16 vendorID;
+	u16 productID;
+	u16 fwVersion;
+	u16 misc_high;
+	u16 misc_low;
+};
+
 struct wacom_features {
+	struct wacom_desc desc;
 	int x_max;
 	int y_max;
 	int pressure_max;
 	char fw_version;
+	unsigned char generation;
 };
 
 struct wacom_i2c {
@@ -45,6 +81,7 @@ static int wacom_query_device(struct i2c_client *client,
 			      struct wacom_features *features)
 {
 	int ret;
+	u8 cmd_wac_desc[] = {WACOM_DESC_REG, 0x00};
 	u8 cmd1[] = { WACOM_CMD_QUERY0, WACOM_CMD_QUERY1,
 			WACOM_CMD_QUERY2, WACOM_CMD_QUERY3 };
 	u8 cmd2[] = { WACOM_CMD_THROW0, WACOM_CMD_THROW1 };
@@ -70,6 +107,33 @@ static int wacom_query_device(struct i2c_client *client,
 		},
 	};
 
+	/* Read the description register */
+	ret = i2c_master_send(client, cmd_wac_desc, sizeof(cmd_wac_desc));
+	if (ret < 0)
+		return ret;
+	ret = i2c_master_recv(client, (char *)&features->desc, sizeof(features->desc));
+	if (ret < 0)
+		return ret;
+
+	switch (features->desc.maxInputLen) {
+	case WACOM_MAX_DATA_SIZE_BG9:
+		features->generation = WACOM_BG9;
+		break;
+
+	case WACOM_MAX_DATA_SIZE_G12:
+		features->generation = WACOM_G12;
+		break;
+
+	case WACOM_MAX_DATA_SIZE_AG14:
+		features->generation = WACOM_AG14;
+		break;
+
+	default:
+		/* Cover all generations possible */
+		features->generation = WACOM_AG14;
+		break;
+	}
+
 	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (ret < 0)
 		return ret;
-- 
2.31.1

