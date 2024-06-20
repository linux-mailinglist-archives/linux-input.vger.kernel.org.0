Return-Path: <linux-input+bounces-4488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943C9108F1
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DAF282AF1
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 14:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302D31AE09E;
	Thu, 20 Jun 2024 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="fOXy4Vrc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FABE1A00E8;
	Thu, 20 Jun 2024 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895035; cv=none; b=PzTGFApON5KrrKwih0nxXDFXTQNrGMNyzjHt186imCC9TV111BQjfP/6Jud2TgjIdzk/CTHQ74cHpDh3Hlszk9rcCxcqOXXT0xEL1XOFlbiD3xI3D9AH+8uCA38g58aYcKjTki9SKgSIS8ryOQYTQZePtJ4SVEFwfPYPYlhSNak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895035; c=relaxed/simple;
	bh=e7ET5z0NH76O9Cj6VARop7hsLimA/o/QRhe+lUYgjas=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHrvyzOiKvYlfJdx1JXRS3vxsLXrdtcshEUi4cg8sBInrXutNbb1BDfo4rGdi3XIx83zii0pUpP9qJppQas6F06J3aSX/F2cDyHFCripmjK33UXTw6JjlgfSMeeqjkmAJLjUDS4yZ4d5IWEExzdIIetGV24PITNx56l4ku0podY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=fOXy4Vrc; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 885D1C0070;
	Thu, 20 Jun 2024 10:52:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1718895132; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=h7BDR8ebm7wi5ol2mXXhFOPU8d2goNXVwlQM/DNXqhQ=;
	b=fOXy4VrcrSmvZVmXj2uQIqsUxnVIrcgn9A6d7f1WRTcKY/T6cAJ/AEgJDou77wgqskRnIN
	9PCY7O9/ZkMBQziYIphwWFgpXXmExJoHxe+ciHfD0xOsyLifsGNXGrMUad9fUtN5XrqF4p
	DjDll9mpx4KXPBTkM3wdiu6CCRLukGw=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] input: himax_hx83112b: add himax_chip struct for multi-chip support
Date: Thu, 20 Jun 2024 10:50:05 -0400
Message-ID: <20240620145019.156187-5-felix@kaechele.ca>
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

In preparation for HX83100A support allow defining separate functions
for specific chip operations.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 drivers/input/touchscreen/himax_hx83112b.c | 51 +++++++++++++++-------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index c9cc69bf242a..5092a357c332 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -20,8 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/regmap.h>
 
-#define HIMAX_ID_83112B			0x83112b
-
 #define HIMAX_MAX_POINTS		10
 
 #define HIMAX_AHB_ADDR_BYTE_0			0x00
@@ -55,7 +53,16 @@ struct himax_event {
 
 static_assert(sizeof(struct himax_event) == 56);
 
+struct himax_ts_data;
+struct himax_chip {
+	u32 id;
+	int (*check_id)(struct himax_ts_data *ts);
+	int (*read_events)(struct himax_ts_data *ts, struct himax_event *event,
+			   size_t length);
+};
+
 struct himax_ts_data {
+	const struct himax_chip *chip;
 	struct gpio_desc *gpiod_rst;
 	struct input_dev *input_dev;
 	struct i2c_client *client;
@@ -167,15 +174,12 @@ static int himax_check_product_id(struct himax_ts_data *ts)
 
 	dev_dbg(&ts->client->dev, "Product id: %x\n", product_id);
 
-	switch (product_id) {
-	case HIMAX_ID_83112B:
+	if (product_id == ts->chip->id)
 		return 0;
 
-	default:
-		dev_err(&ts->client->dev,
-			"Unknown product id: %x\n", product_id);
-		return -EINVAL;
-	}
+	dev_err(&ts->client->dev, "Unknown product id: %x\n",
+		product_id);
+	return -EINVAL;
 }
 
 static int himax_input_register(struct himax_ts_data *ts)
@@ -277,13 +281,19 @@ static bool himax_verify_checksum(struct himax_ts_data *ts,
 	return true;
 }
 
+static int himax_read_events(struct himax_ts_data *ts,
+			     struct himax_event *event, size_t length)
+{
+	return regmap_raw_read(ts->regmap, HIMAX_AHB_ADDR_EVENT_STACK, event,
+			       length);
+}
+
 static int himax_handle_input(struct himax_ts_data *ts)
 {
 	int error;
 	struct himax_event event;
 
-	error = regmap_raw_read(ts->regmap, HIMAX_AHB_ADDR_EVENT_STACK, &event,
-				sizeof(event));
+	error = ts->chip->read_events(ts, &event, sizeof(event));
 	if (error) {
 		dev_err(&ts->client->dev, "Failed to read input event: %d\n",
 			error);
@@ -329,6 +339,7 @@ static int himax_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, ts);
 	ts->client = client;
+	ts->chip = i2c_get_match_data(client);
 
 	ts->regmap = devm_regmap_init_i2c(client, &himax_regmap_config);
 	error = PTR_ERR_OR_ZERO(ts->regmap);
@@ -346,9 +357,11 @@ static int himax_probe(struct i2c_client *client)
 
 	himax_reset(ts);
 
-	error = himax_check_product_id(ts);
-	if (error)
-		return error;
+	if (ts->chip->check_id) {
+		error = himax_check_product_id(ts);
+		if (error)
+			return error;
+	}
 
 	error = himax_input_register(ts);
 	if (error)
@@ -381,15 +394,21 @@ static int himax_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(himax_pm_ops, himax_suspend, himax_resume);
 
+static const struct himax_chip hx83112b_chip = {
+	.id = 0x83112b,
+	.check_id = himax_check_product_id,
+	.read_events = himax_read_events,
+};
+
 static const struct i2c_device_id himax_ts_id[] = {
-	{ "hx83112b" },
+	{ "hx83112b", (kernel_ulong_t)&hx83112b_chip },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, himax_ts_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id himax_of_match[] = {
-	{ .compatible = "himax,hx83112b" },
+	{ .compatible = "himax,hx83112b", .data = &hx83112b_chip },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, himax_of_match);
-- 
2.45.2


