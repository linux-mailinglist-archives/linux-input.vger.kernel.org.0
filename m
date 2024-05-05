Return-Path: <linux-input+bounces-3464-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FB8BC409
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 23:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 297A6B21535
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 21:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B9D136E2A;
	Sun,  5 May 2024 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="13Kc15T3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC13136982;
	Sun,  5 May 2024 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714945728; cv=none; b=ofY7tWflgNQJOdAjegWiImJ1zRGtm5BZgmS8w43izKzqhypGuh9s5z+qA6TNzDxbFX4Wrm40zXRFB2Axu3NhfgLje1WjvCf00k4hVtCgW29qPoj8oDNG2wJIytkwrEAJoAukoFFKMLkEdL6PNQCN60EKZ5uCyKb7It9FXWNK1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714945728; c=relaxed/simple;
	bh=G9h5ZxiGzASTMIdvxH0uhwND+SlOLksrdHwTgbps1FY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l97wl22v/XE9ZC0FQyO+DOTp9qQwWGbBvMUvc8mtGiARvBTCOmxL5Axj7DReMNDBLnleiMCScC/BBqCmaMOs7C4sUljo3a7vI6ssbcDIynTmRZENFDUb3VEUtCEQS8uzunOIxNfbzNOb80HXS1t9vs/MqGxjok4MTxn2u1hdyq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=13Kc15T3; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jir-005kkC-1E;
	Sun, 05 May 2024 23:48:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wSAWZ7fK7sRoCuFqtN+GxwBPXM4pBzVJE8SYe+i46ys=; b=13Kc15T3+e95IK6a5RC0No20D0
	MYHvfoJD2yjr2eYyZWjcbhZK1Mp9AS+8R349Y0G2jtJkH499kvBn/h8OQDuFjRc5kvPQQht4ONgEO
	J1vvPLdm88yRhZdXwKAIFT59pELH/J/1FHhkMg1a5GwMF9b+crSK1eevUc2mCWvNqLEbaHwdMBaJ6
	c7P9mb4qm4W3MWbPzLyNYsJZ3bnXFYiPseKD02k3nsRunXlj2TDffNkuHzf1uymhXdx1w26xlFMi7
	/LCANFzKUV6pJtUGEq0xkuymYc84kN3dVaSARGTLo5cRT8gj2yx3QGRXYS9X09RQePbFdQTIxC+bk
	0er998wQ==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jin-000ccD-2F;
	Sun, 05 May 2024 23:48:38 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jio-003jyg-2I;
	Sun, 05 May 2024 23:48:38 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	u.kleine-koenig@pengutronix.de,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] Input: ektf2127 - add ektf2232 support
Date: Sun,  5 May 2024 23:47:54 +0200
Message-Id: <20240505214754.891700-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240505214754.891700-1-andreas@kemnade.info>
References: <20240505214754.891700-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chip is similar, but has status bits at different positions,
so use the correct bits.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/input/touchscreen/ektf2127.c | 41 ++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
index cc3103b9cbfba..028b605d1bb74 100644
--- a/drivers/input/touchscreen/ektf2127.c
+++ b/drivers/input/touchscreen/ektf2127.c
@@ -13,6 +13,7 @@
  * Hans de Goede <hdegoede@redhat.com>
  */
 
+#include <linux/bits.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
@@ -46,6 +47,11 @@ struct ektf2127_ts {
 	struct input_dev *input;
 	struct gpio_desc *power_gpios;
 	struct touchscreen_properties prop;
+	int status_shift;
+};
+
+struct ektf2127_i2c_chip_data {
+	int status_shift;
 };
 
 static void ektf2127_parse_coordinates(const u8 *buf, unsigned int touch_count,
@@ -112,8 +118,8 @@ static void ektf2127_report2_contact(struct ektf2127_ts *ts, int slot,
 
 static void ektf2127_report2_event(struct ektf2127_ts *ts, const u8 *buf)
 {
-	ektf2127_report2_contact(ts, 0, &buf[1], !!(buf[7] & 2));
-	ektf2127_report2_contact(ts, 1, &buf[4], !!(buf[7] & 4));
+	ektf2127_report2_contact(ts, 0, &buf[1], !!(buf[7] & BIT(ts->status_shift)));
+	ektf2127_report2_contact(ts, 1, &buf[4], !!(buf[7] & BIT(ts->status_shift + 1)));
 
 	input_mt_sync_frame(ts->input);
 	input_sync(ts->input);
@@ -246,7 +252,9 @@ static int ektf2127_query_dimension(struct i2c_client *client, bool width)
 
 static int ektf2127_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct device *dev = &client->dev;
+	const struct ektf2127_i2c_chip_data *chip_data;
 	struct ektf2127_ts *ts;
 	struct input_dev *input;
 	u8 buf[4];
@@ -303,6 +311,17 @@ static int ektf2127_probe(struct i2c_client *client)
 		return error;
 
 	ts->input = input;
+
+	chip_data = device_get_match_data(&client->dev);
+	if (!chip_data)
+		chip_data = (const struct ektf2127_i2c_chip_data *)id->driver_data;
+	if (!chip_data) {
+		dev_err(&client->dev, "missing chip data\n");
+		return -EINVAL;
+	}
+
+	ts->status_shift = chip_data->status_shift;
+
 	input_set_drvdata(input, ts);
 
 	error = devm_request_threaded_irq(dev, client->irq,
@@ -325,18 +344,28 @@ static int ektf2127_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct ektf2127_i2c_chip_data ektf2127_data = {
+	.status_shift = 1,
+};
+
+static const struct ektf2127_i2c_chip_data ektf2232_data = {
+	.status_shift = 0,
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id ektf2127_of_match[] = {
-	{ .compatible = "elan,ektf2127" },
-	{ .compatible = "elan,ektf2132" },
+	{ .compatible = "elan,ektf2127",	.data = &ektf2127_data},
+	{ .compatible = "elan,ektf2132",	.data = &ektf2127_data},
+	{ .compatible = "elan,ektf2232",	.data = &ektf2232_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, ektf2127_of_match);
 #endif
 
 static const struct i2c_device_id ektf2127_i2c_id[] = {
-	{ "ektf2127", 0 },
-	{ "ektf2132", 0 },
+	{ .name = "ektf2127", .driver_data = (long)&ektf2127_data },
+	{ .name = "ektf2132", .driver_data = (long)&ektf2127_data },
+	{ .name = "ektf2232", .driver_data = (long)&ektf2232_data },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ektf2127_i2c_id);
-- 
2.39.2


