Return-Path: <linux-input+bounces-4492-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A79491091C
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 162731F219C8
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 14:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F931AED57;
	Thu, 20 Jun 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="BtUFbhxp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F01AE875;
	Thu, 20 Jun 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895381; cv=none; b=F/W262zXmmbd4A8vCZvMtOe0iMSkMY0x3RhOn+yLZtSzD3hewupa5tpxKVJLSWM8/w+qJwLt164FdJGndFvBUXJcHEsonvQFm16G8Kwa5GjlWb58DCc+Tzgf8lLEK0iNB8bSobukrLtoxK6fgyP9TuMS//dvy4Mxsu23yKkIqBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895381; c=relaxed/simple;
	bh=v45ml3qrg1Vhx3Tb6RVFRxV1+YollR6UlAHlQpqsL5I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCtnG1U76cVtpBBR5VlN7SC2c50tZHF1mqlcJEhFSnMaQJ8QY4LHqj1Br5ye6JVK5CGEVl1snHRvfYNgBhKIEdChYz/CjwRAcWyvO81fNIlszJBJjx6W5w0Vd4hdn5Uy51uPBtAPWucw5olMbUEIca6s+QAmkRhDFtPhoecPf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=BtUFbhxp; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63C7EC006E;
	Thu, 20 Jun 2024 10:52:10 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1718895130; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DaqAvMZQgJwWZoTHGQT47OiyxpPitTDwP3ZrPha3UNk=;
	b=BtUFbhxpaCWPb4Ct9QGF6XsihiCnilgfYEv2gKN/QXC2i0wo6GK0atNhyMGPLEyTNtQZPC
	pomHvqwRC6TJD1de/jnP5sR4oyxXFTPH2hzotS3ialvEKyYZQsslR8jzul2ozjuZ5kYrkJ
	Yac1Dzqgr15GC98ZqdjW+oqIhAJXDgg=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] input: himax_hx83112b: use more descriptive register defines
Date: Thu, 20 Jun 2024 10:50:03 -0400
Message-ID: <20240620145019.156187-3-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620145019.156187-1-felix@kaechele.ca>
References: <20240620145019.156187-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Himax uses an AHB-style bus to communicate with different parts of the
display driver and touch controller system.
Use more descriptive names for the register and address defines.
The names were taken from a driver submission for the similar HX83102J
chip.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
Link: https://lore.kernel.org/all/TY0PR06MB561105A3386E9D76F429110D9E0F2@TY0PR06MB5611.apcprd06.prod.outlook.com/
---
 drivers/input/touchscreen/himax_hx83112b.c | 23 ++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index bafabd06dabc..d6c4a68eac23 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -24,12 +24,14 @@
 
 #define HIMAX_MAX_POINTS		10
 
-#define HIMAX_REG_CFG_SET_ADDR		0x00
-#define HIMAX_REG_CFG_INIT_READ		0x0c
-#define HIMAX_REG_CFG_READ_VALUE	0x08
-#define HIMAX_REG_READ_EVENT		0x30
+#define HIMAX_AHB_ADDR_BYTE_0			0x00
+#define HIMAX_AHB_ADDR_RDATA_BYTE_0		0x08
+#define HIMAX_AHB_ADDR_ACCESS_DIRECTION		0x0c
+#define HIMAX_AHB_ADDR_EVENT_STACK		0x30
 
-#define HIMAX_CFG_PRODUCT_ID		0x900000d0
+#define HIMAX_AHB_CMD_ACCESS_DIRECTION_READ	0x00
+
+#define HIMAX_REG_ADDR_ICID			0x900000d0
 
 #define HIMAX_INVALID_COORD		0xffff
 
@@ -67,15 +69,16 @@ static int himax_read_config(struct himax_ts_data *ts, u32 address, u32 *dst)
 {
 	int error;
 
-	error = regmap_write(ts->regmap, HIMAX_REG_CFG_SET_ADDR, address);
+	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_BYTE_0, address);
 	if (error)
 		return error;
 
-	error = regmap_write(ts->regmap, HIMAX_REG_CFG_INIT_READ, 0x0);
+	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_ACCESS_DIRECTION,
+			     HIMAX_AHB_CMD_ACCESS_DIRECTION_READ);
 	if (error)
 		return error;
 
-	error = regmap_read(ts->regmap, HIMAX_REG_CFG_READ_VALUE, dst);
+	error = regmap_read(ts->regmap, HIMAX_AHB_ADDR_RDATA_BYTE_0, dst);
 	if (error)
 		return error;
 
@@ -101,7 +104,7 @@ static int himax_read_product_id(struct himax_ts_data *ts, u32 *product_id)
 {
 	int error;
 
-	error = himax_read_config(ts, HIMAX_CFG_PRODUCT_ID, product_id);
+	error = himax_read_config(ts, HIMAX_REG_ADDR_ICID, product_id);
 	if (error)
 		return error;
 
@@ -235,7 +238,7 @@ static int himax_handle_input(struct himax_ts_data *ts)
 	int error;
 	struct himax_event event;
 
-	error = regmap_raw_read(ts->regmap, HIMAX_REG_READ_EVENT, &event,
+	error = regmap_raw_read(ts->regmap, HIMAX_AHB_ADDR_EVENT_STACK, &event,
 				sizeof(event));
 	if (error) {
 		dev_err(&ts->client->dev, "Failed to read input event: %d\n",
-- 
2.45.2


