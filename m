Return-Path: <linux-input+bounces-4491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E3910918
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 029622836EF
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 14:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2A01AED38;
	Thu, 20 Jun 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="nX/Yyaj/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06441AE87B;
	Thu, 20 Jun 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895381; cv=none; b=eSRthLXf0zg0As7kRfPo9Vz9fxBZ+qfdmkpEfLS3Ceih+V1rfML+HLlYL7+UV0OpQaIvZqLo2ww4eceoII6NmxKlWn71amfhtR1GLY/J6BcQ9wjwfIeQBMOXIFVi5+oZ0aM+CWjUDIH9H3yLJcXiXAgSxrMb8uMtJtiU+LbtrCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895381; c=relaxed/simple;
	bh=P6ZB7eRoL9WbM2pQ1OT1O5ZVJyTNiQWzqQ/G5mHIpRc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asuCeeLijK7TKmFlejCsb6j308P2JVClsnpP2mLV7/pOU0JOvXetuY3yoPNydFRGMgJZHhog9A2tAXs/6+4oAPhgc12nDHNhRsD4G0drqESLcUM7KeyumHXQezLCVHtWb66gALkEW5ktd6NlNpFKom4bQk3KYZhCM9Ba8lvtE7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=nX/Yyaj/; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F749C006F;
	Thu, 20 Jun 2024 10:52:11 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1718895131; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=D5fyFObgeas/78EcwxhU0nwIdPJp396uaXo7hzaSXjE=;
	b=nX/Yyaj/558YycxrJdcN9vsnp39pS9FY90rvC4+6m9feaowGJT7U+7qmP8j9Nu3cN2G+FF
	/VBGj2joIPOJDX1O7u6Ky770OzUNdLLAWkARnXvN5n6C+tDbA9h+FL+DtQMGtQzhcgSwfy
	F3dfRDJly++Ap5goAWA4vyK/BrWpO3I=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] input: himax_hx83112b: implement MCU register reading
Date: Thu, 20 Jun 2024 10:50:04 -0400
Message-ID: <20240620145019.156187-4-felix@kaechele.ca>
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

Implement reading from the MCU in a more universal fashion. This allows
properly handling reads of more than 4 bytes using the AHB FIFO
implemented in the chip.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 drivers/input/touchscreen/himax_hx83112b.c | 50 ++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index d6c4a68eac23..c9cc69bf242a 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -27,9 +27,13 @@
 #define HIMAX_AHB_ADDR_BYTE_0			0x00
 #define HIMAX_AHB_ADDR_RDATA_BYTE_0		0x08
 #define HIMAX_AHB_ADDR_ACCESS_DIRECTION		0x0c
+#define HIMAX_AHB_ADDR_INCR4			0x0d
+#define HIMAX_AHB_ADDR_CONTI			0x13
 #define HIMAX_AHB_ADDR_EVENT_STACK		0x30
 
 #define HIMAX_AHB_CMD_ACCESS_DIRECTION_READ	0x00
+#define HIMAX_AHB_CMD_INCR4			0x10
+#define HIMAX_AHB_CMD_CONTI			0x31
 
 #define HIMAX_REG_ADDR_ICID			0x900000d0
 
@@ -65,10 +69,34 @@ static const struct regmap_config himax_regmap_config = {
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
-static int himax_read_config(struct himax_ts_data *ts, u32 address, u32 *dst)
+static int himax_bus_enable_burst(struct himax_ts_data *ts)
 {
 	int error;
 
+	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_CONTI,
+			     HIMAX_AHB_CMD_CONTI);
+	if (error)
+		return error;
+
+	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_INCR4,
+			     HIMAX_AHB_CMD_INCR4);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int himax_bus_read(struct himax_ts_data *ts, u32 address, void *dst,
+			  size_t length)
+{
+	int error;
+
+	if (length > 4) {
+		error = himax_bus_enable_burst(ts);
+		if (error)
+			return error;
+	}
+
 	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_BYTE_0, address);
 	if (error)
 		return error;
@@ -78,7 +106,23 @@ static int himax_read_config(struct himax_ts_data *ts, u32 address, u32 *dst)
 	if (error)
 		return error;
 
-	error = regmap_read(ts->regmap, HIMAX_AHB_ADDR_RDATA_BYTE_0, dst);
+	if (length > 4)
+		error = regmap_noinc_read(ts->regmap, HIMAX_AHB_ADDR_RDATA_BYTE_0,
+					  dst, length);
+	else
+		error = regmap_read(ts->regmap, HIMAX_AHB_ADDR_RDATA_BYTE_0,
+				    dst);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int himax_read_mcu(struct himax_ts_data *ts, u32 address, u32 *dst)
+{
+	int error;
+
+	error = himax_bus_read(ts, address, dst, sizeof(dst));
 	if (error)
 		return error;
 
@@ -104,7 +148,7 @@ static int himax_read_product_id(struct himax_ts_data *ts, u32 *product_id)
 {
 	int error;
 
-	error = himax_read_config(ts, HIMAX_REG_ADDR_ICID, product_id);
+	error = himax_read_mcu(ts, HIMAX_REG_ADDR_ICID, product_id);
 	if (error)
 		return error;
 
-- 
2.45.2


