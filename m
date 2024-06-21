Return-Path: <linux-input+bounces-4556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D48913086
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 00:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2962B27743
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 22:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F16D16FF5F;
	Fri, 21 Jun 2024 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="U7fmM4bS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA79616F8FC;
	Fri, 21 Jun 2024 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719009645; cv=none; b=ctROaBoccFlRho6UV6KFmpxzr/e63q3Zqk/AiK5jmQVJbk+g2fZLKhdj6I8foqd8+M4EQWDLYcHEh1jGbbUeUijYpceD9NnD9b/MhvwxO880BESwnF/gmqn1ElLVAY0qeE5nYuNaPtTADFxNE49uyDqSdzP1JKaDxB3YrSFzAoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719009645; c=relaxed/simple;
	bh=Uybd/th4afdJYueMsyszSrqC9bf6dhBOk6xYGLfGkrc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pxJasbUeJUrL6adjYZ0WJTwmV0dT/jW29W3uw2+zo4eZGQBNr+BceXXo1HhRDIwsX6b6eDDulDixNvYoS0aLRCXmubefzsJRWwBWhOduPm564v8Y1v9qKpzrZ7+Wx6E82GxNp/BBLfhQAvhJVnzXdVxnBJI5S7pWgsgKwSyi8Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=U7fmM4bS; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvl-000Uu3-07;
	Sat, 22 Jun 2024 00:40:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VMoQa2KSRqpNbUkmMpoILf1hc3Bv7ijAt3K+kr38SlY=; b=U7fmM4bSU/lt4+VfW9C/8pSJCK
	g2Go5DAUQcStoQGJHtesb5k9wHSjoZo/QE/mxV/25jjXjWmzpWclOXczwjaIOPD0xMFPflHpzEhyT
	f4oYvzsLC6zDUPRNuPiot6FK5VVLHVJSoJDnweAuw8YdPuR83s2O9Wpm1DqXoMLziM0qSE7CYvX94
	aYuOP+PdnPf4oKdSK0yw4nAh5JFUVfKAsL10bFIZnqfTsRuDMBr3+kWo6KGKI3j6hiWPPSTupomXK
	Fak3VO5HMz9tkMPzsGjwpJekaHm9yRUhJLSfMrkTdchf7wpU9/2pOSwdFvelSGmUsKNuh8tS4Rsb8
	8jMdvuxg==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvj-003Plh-2U;
	Sat, 22 Jun 2024 00:40:29 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvk-006nfu-2T;
	Sat, 22 Jun 2024 00:40:28 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	u.kleine-koenig@pengutronix.de,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v3 3/3] Input: ektf2127 - add ektf2232 support
Date: Sat, 22 Jun 2024 00:40:22 +0200
Message-Id: <20240621224022.1620897-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621224022.1620897-1-andreas@kemnade.info>
References: <20240621224022.1620897-1-andreas@kemnade.info>
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
 drivers/input/touchscreen/ektf2127.c | 36 +++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
index cc3103b9cbfba..b6f5046f4b917 100644
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
@@ -247,6 +253,7 @@ static int ektf2127_query_dimension(struct i2c_client *client, bool width)
 static int ektf2127_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	const struct ektf2127_i2c_chip_data *chip_data;
 	struct ektf2127_ts *ts;
 	struct input_dev *input;
 	u8 buf[4];
@@ -303,6 +310,13 @@ static int ektf2127_probe(struct i2c_client *client)
 		return error;
 
 	ts->input = input;
+
+	chip_data = i2c_get_match_data(client);
+	if (!chip_data)
+		return dev_err_probe(&client->dev, -EINVAL, "missing chip data\n");
+
+	ts->status_shift = chip_data->status_shift;
+
 	input_set_drvdata(input, ts);
 
 	error = devm_request_threaded_irq(dev, client->irq,
@@ -325,18 +339,28 @@ static int ektf2127_probe(struct i2c_client *client)
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


