Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283613F17F8
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238781AbhHSLVg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:36 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55923 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238656AbhHSLVe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:34 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 23F20580BC3;
        Thu, 19 Aug 2021 07:20:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 19 Aug 2021 07:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=F3QSg3lIcPoB0
        oTz0kpAR9eudbkvCfgPAbTccns9Gh4=; b=V9b/2nhQ9UALPuwLXWWwMWSvyrMji
        5vf7fjzLGj3A+bwKfsX0h2bQNKAclB4nZPVy4zwIP51xvrSqiCPA/JwvLu0GwTM5
        qtkBK5BuK7dKH1tYASzzZZOCmdZYL7nNwarLRW8viEkMx4bNMldtUo9xrC0+IxzJ
        z1xjP6zdCts6fPiSnoCA21VqyUhokjuOUggcFqcaZgVRvEJeB+bDrljJ27OnTZbl
        sTAifLAj3nacHkqGwHswo57Q6z85/nu0tfAwNhvGSERP8tfI2MHz1YHnjvcSNaDJ
        9s1PBSUppxj8TvPQ8/7eNKsDez/Im9dQqEWDnLLycmLKOZiUI7brFvTcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=F3QSg3lIcPoB0oTz0kpAR9eudbkvCfgPAbTccns9Gh4=; b=phb+6rx4
        gSKfn+IUhm89DTB4am50B/khjz75wa3PM24bRN4xeyUMq77c2n1YQVCi7H2JuRCr
        Pf1Dq5fD3YhzcSHc/vPJeggBaDGeNAF0YNtfS/eDPHtGTvdVPQfGJRddbazdefBm
        9svbgHTvKhJ/DuTeqU2jegIpdNssgV1bf52KDpg1mSO+N5n/GKksjpljXra46ADF
        RQMsHzJh6GN4j2Cy+TAfisDw8NdatBWQ1d4whFhbYrrh20cN8NCDf4j+PqGvo/0t
        5KLirsHOAk6gA/4Cx+BTnOsJh9izEzE4tK+iGwT8Mc2+HRMPzY7LBZOrETEbM3Xz
        AnP2JQGOR9R5tA==
X-ME-Sender: <xms:mj4eYQx0_Vl2K-Ra37xu7JnaZ4jY8wGFl3I-08sFhEKzSVc1Av7bcQ>
    <xme:mj4eYURNM7KDJ2yGAbb-cUCn__8dZypVUV-TCwb4GyQtwkC8OcC0Zcz-BfqfcNXNC
    BjoOejIv8YAO8fW3pk>
X-ME-Received: <xmr:mj4eYSVWUyEuTvYJlAF_MBDQYWP74WIzgDgBstyK31bqWoVCGJfrIcl8TSRsFMcb41BZ6PC5WhaHUiGwEF7DmTXRcgNlgzI9P_bWq-elkiJM-1M8Hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:mj4eYehX4NQpih_jWZVSxtmBAg0j3vtaim4E-QcK7r8CUlCf1S_IeA>
    <xmx:mj4eYSCio6gEORNSkNbb2AkL7Gonbt0FquE0_lB1LEvYdtzEpsHx2g>
    <xmx:mj4eYfJju4eWv7HTPUk-kx98XA0EM7NIuNs0ZQf8b3OxZ3vmJkvc8w>
    <xmx:mj4eYW78th-DqiI4bVcYgB7OAFRWo-njIcGuDQJvX_wQReplwHqEQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:20:54 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 05/11] Input: wacom_i2c - Add support for distance and tilt x/y
Date:   Thu, 19 Aug 2021 01:49:29 +1000
Message-Id: <20210818154935.1154-6-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the distance and tilt x/y.

This is based on the out of tree rM2 driver.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 35 +++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 28255c77d426..4d0c19fbada4 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -22,12 +22,18 @@
 #define WACOM_CMD_QUERY3	0x02
 #define WACOM_CMD_THROW0	0x05
 #define WACOM_CMD_THROW1	0x00
-#define WACOM_QUERY_SIZE	19
+#define WACOM_QUERY_SIZE	22
+
+#define WACOM_DISTANCE_TILT_VERSION	0x30
 
 struct wacom_features {
 	int x_max;
 	int y_max;
 	int pressure_max;
+	int distance_max;
+	int distance_physical_max;
+	int tilt_x_max;
+	int tilt_y_max;
 	char fw_version;
 };
 
@@ -80,6 +86,17 @@ static int wacom_query_device(struct i2c_client *client,
 	features->y_max = get_unaligned_le16(&data[5]);
 	features->pressure_max = get_unaligned_le16(&data[11]);
 	features->fw_version = get_unaligned_le16(&data[13]);
+	if (features->fw_version >= WACOM_DISTANCE_TILT_VERSION) {
+		features->distance_max = data[15];
+		features->distance_physical_max = data[16];
+		features->tilt_x_max = get_unaligned_le16(&data[17]);
+		features->tilt_y_max = get_unaligned_le16(&data[19]);
+	} else {
+		features->distance_max = -1;
+		features->distance_physical_max = -1;
+		features->tilt_x_max = -1;
+		features->tilt_y_max = -1;
+	}
 
 	dev_dbg(&client->dev,
 		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
@@ -97,6 +114,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	u8 *data = wac_i2c->data;
 	unsigned int x, y, pressure;
 	unsigned char tsw, f1, f2, ers;
+	short tilt_x, tilt_y, distance;
 	int error;
 
 	error = i2c_master_recv(wac_i2c->client,
@@ -112,6 +130,12 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	y = le16_to_cpup((__le16 *)&data[6]);
 	pressure = le16_to_cpup((__le16 *)&data[8]);
 
+	/* Signed */
+	tilt_x = le16_to_cpup((__le16 *)&data[11]);
+	tilt_y = le16_to_cpup((__le16 *)&data[13]);
+
+	distance = le16_to_cpup((__le16 *)&data[15]);
+
 	if (!wac_i2c->prox)
 		wac_i2c->tool = (data[3] & 0x0c) ?
 			BTN_TOOL_RUBBER : BTN_TOOL_PEN;
@@ -127,6 +151,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 	input_report_abs(input, ABS_X, x);
 	input_report_abs(input, ABS_Y, y);
 	input_report_abs(input, ABS_PRESSURE, pressure);
+	input_report_abs(input, ABS_DISTANCE, distance);
+	input_report_abs(input, ABS_TILT_X, tilt_x);
+	input_report_abs(input, ABS_TILT_Y, tilt_y);
 	input_sync(input);
 
 out:
@@ -202,7 +229,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_Y, 0, features->y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
 			     0, features->pressure_max, 0, 0);
-
+	input_set_abs_params(input, ABS_DISTANCE, 0, features->distance_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_X, -features->tilt_x_max,
+			     features->tilt_x_max, 0, 0);
+	input_set_abs_params(input, ABS_TILT_Y, -features->tilt_y_max,
+			     features->tilt_y_max, 0, 0);
 	input_set_drvdata(input, wac_i2c);
 
 	error = devm_request_threaded_irq(dev, client->irq, NULL, wacom_i2c_irq,
-- 
2.31.1

