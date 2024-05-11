Return-Path: <linux-input+bounces-3677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B48C312B
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 14:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ED532820C1
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 12:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A4956472;
	Sat, 11 May 2024 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="fpgeJmV6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507455C0A;
	Sat, 11 May 2024 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715429574; cv=none; b=B+faztdR8pGt4XysDZtuYwhlx5cKTrANMvkSbynkeg3233+8fxY+TQkro7TYGAcM13mbg81rP13XasiQk3km6QZWBhtjvZ0g9GznbpPXrD+61FH/AJPeJgVI1v99BQOuArmoXbr0PDCBs/MVAGkGOHGxj6rpR/DOVxi+HxliWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715429574; c=relaxed/simple;
	bh=H0Im0qX63SRxpHQz/lYlIkHF+B2W4uq3xkd17h7BaO0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVOnieEkroP4QUcGkKowE5Z/9SiLAFlRwPiCULFE18Uc1ZWgqjpsjkrHBkB5oPQ+g9b6+igB6XB74fbMAUvOjbC2Twd6vtzEl4uBDHsVO7+RYDGXOHZ2CpOp/5yitAp1ahLtJER+H+4qSJYGVADvYEsRG+j2z1pmkN/kfR3apjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=fpgeJmV6; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34AFBC006E;
	Sat, 11 May 2024 08:13:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1715429598; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NBm+j+qEY8UP7hlSQosJ6iHZvw/xPQ3EltkR+zHi8nk=;
	b=fpgeJmV6vHGDG66DhcOt7rkrXDa/saur3qmsvufhJ+0ko5iBsuzKOmm14SpilVaZ9Bu6c/
	fJrME7WpZ6J21jMuwmzCxQqeJDu11CjvGEYUTSbIix4/HOiLu44tI26msQ4kSfnevkpb1P
	skORXTuPZhF0/EWDnogkTnUWT5Zc/Vg=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] input: himax_hx83112b: use more descriptive register defines
Date: Sat, 11 May 2024 08:12:23 -0400
Message-ID: <20240511121245.109644-3-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240511121245.109644-1-felix@kaechele.ca>
References: <20240511121245.109644-1-felix@kaechele.ca>
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
index 4f6609dcdef3..2da2920d43f9 100644
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
2.45.0


