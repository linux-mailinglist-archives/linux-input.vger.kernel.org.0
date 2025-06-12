Return-Path: <linux-input+bounces-12856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD3AD7B38
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 21:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7188616763A
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 19:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC6C2D5406;
	Thu, 12 Jun 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CN6yUXBv"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE72D4B4B;
	Thu, 12 Jun 2025 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757327; cv=none; b=LrMEk8ZoBOHgGVnIkOFasWlhqLB579iXgky+Vn7ihY3xCUhDX5F+XK49b3+fbxAimCAKIIOPqTYTPV0qDQ2I8qUIW49wf9SZT4tS457DXLbS88Kpbgs0BLS+zlV5Dl1NoV6JaJw1vYFImb2qRttosVvzW1IDG+MW4qHpPZ5pSeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757327; c=relaxed/simple;
	bh=fg5AoTsDiUevWYSsxPAW01tdMPFTPzlekM5HpegsD7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNCZwnMM1Ds8CB8M0Hep9JLEn65ywWz0ed1CVIer++s9QY+qXVjz/zN+bKtGovsLmA2RGUHBHomEGqa//PgCm3B1e4umgD8Zv0vvlDOqslr72bOTr+HBjPy4wMUsYSdpBv/yr5osc3Zf+Cy0NDFY9PMrjk8cerDWGP9hVyR5OkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CN6yUXBv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DCFA42599D;
	Thu, 12 Jun 2025 21:42:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Op5vm5NIpRe3; Thu, 12 Jun 2025 21:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749757322; bh=fg5AoTsDiUevWYSsxPAW01tdMPFTPzlekM5HpegsD7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CN6yUXBvFlqRxKpIAbU1qFojDvr0e+8TXIV6Aa7FSPAlMezflk28ZTO3IxkSPeZEe
	 yYQPU4kPjKFsne4ffoLo2Hv+Q/efWTT1x96PotDy2iG74fIzY3i1mspCrHneuq4T1I
	 /J4lkje3O1B2aP9VRVG3+wmdq/VGU/Il+RrpUnkRKjKgfcO40ZCqTAnP859May6Tyc
	 p3SunbNcJzaJi1ITbC+6pLiY7ePbgHVjsl2R+qZUawbntK4APaOKEtPqfjxdWxvJ9w
	 lyGLFE5MkAwJ9K+7MqF9AfIUQRuz2rRq3tAdwf1gnb5CFX8R8uHTIuzwSyaoO5dWLW
	 d8F3Ay+5j0euA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 13 Jun 2025 01:11:35 +0530
Subject: [PATCH RFC v2 3/5] Input: melfas-mip4 - add support for touchkey
 input events
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-mip4-touchkey-v2-3-9bbbe14c016d@disroot.org>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
In-Reply-To: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749757299; l=3116;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=fg5AoTsDiUevWYSsxPAW01tdMPFTPzlekM5HpegsD7U=;
 b=n9c7NV53Qs/O2OG5V9FEfY12MmwA79kF1CRjpGS+MEDKLnKkeVNZIGiSvrP3594oVDr0uj+Db
 Y1usLjH0kKkCszzQRXF+xjuKNXvouOp69r/jUViSOgU4z1b2Bu64k5K
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

The MIP4 protocol are supposed to support touchscreens, touchkeys, and
combo-devices. The driver handles touchscreen events, but touchkey
events are unimplemented.

Implement them. If compiled with devicetree support, the driver attempts
to retrieve keycodes from a property named "linux,keycodes".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/melfas_mip4.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index a6946e3d8376d7e9b4c26f4194409e0ba78bb075..061ac353bc7a2e28f17581411af81f35c89733a1 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -169,7 +169,7 @@ struct mip4_ts {
 	unsigned int event_format;
 
 	unsigned int key_num;
-	unsigned short key_code[MIP4_MAX_KEYS];
+	unsigned int key_code[MIP4_MAX_KEYS];
 
 	bool wake_irq_enabled;
 
@@ -337,8 +337,13 @@ static int mip4_query_device(struct mip4_ts *ts)
 			ts->ppm_x, ts->ppm_y);
 
 		/* Key ts */
-		if (ts->node_key > 0)
+		if (ts->node_key > MIP4_MAX_KEYS) {
+			dev_warn(&ts->client->dev,
+				"Too many keys (%u) found\n", ts->node_key);
+			ts->key_num = MIP4_MAX_KEYS;
+		} else {
 			ts->key_num = ts->node_key;
+		}
 	}
 
 	/* Protocol */
@@ -1080,6 +1085,7 @@ static int mip4_flash_fw(struct mip4_ts *ts,
 			 const u8 *fw_data, u32 fw_size, u32 fw_offset)
 {
 	struct i2c_client *client = ts->client;
+	unsigned int i;
 	int offset;
 	u16 buf_addr;
 	int error, error2;
@@ -1149,6 +1155,11 @@ static int mip4_flash_fw(struct mip4_ts *ts,
 	input_abs_set_res(ts->input, ABS_X, ts->ppm_x);
 	input_abs_set_res(ts->input, ABS_Y, ts->ppm_y);
 
+	for (i = 0; i < ts->key_num; i++) {
+		if (ts->key_code[i])
+			input_set_capability(ts->input, EV_KEY, ts->key_code[i]);
+	}
+
 	return error ? error : 0;
 }
 
@@ -1425,6 +1436,7 @@ static int mip4_probe(struct i2c_client *client)
 {
 	struct mip4_ts *ts;
 	struct input_dev *input;
+	unsigned int i;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -1471,6 +1483,17 @@ static int mip4_probe(struct i2c_client *client)
 
 	input_set_drvdata(input, ts);
 
+#ifdef CONFIG_OF
+	error = of_property_read_u32_array(client->dev.of_node, "linux,keycodes",
+					   ts->key_code, ts->key_num);
+	if (error && ts->key_num) {
+		dev_warn(&client->dev,
+			 "Failed to get codes for %u supported keys", ts->key_num);
+		/* Disable touchkey support */
+		ts->key_num = 0;
+	}
+#endif
+
 	input->keycode = ts->key_code;
 	input->keycodesize = sizeof(*ts->key_code);
 	input->keycodemax = ts->key_num;
@@ -1491,6 +1514,11 @@ static int mip4_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
+	for (i = 0; i < ts->key_num; i++) {
+		if (ts->key_code[i])
+			input_set_capability(input, EV_KEY, ts->key_code[i]);
+	}
+
 	i2c_set_clientdata(client, ts);
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,

-- 
2.49.0


