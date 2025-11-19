Return-Path: <linux-input+bounces-16223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F7C7086E
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 18:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 98CBD24228
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C5B31196D;
	Wed, 19 Nov 2025 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="Vx2dLYdv"
X-Original-To: linux-input@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6C304BD3;
	Wed, 19 Nov 2025 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574681; cv=none; b=FI8Tlo9iTLSsJ3jHPOOTpygVQl7696XKmq1ILx/GnwtpXGc5zLUUN2a5GMI7HuFraIt9Gd9/bEDO18VYTnC2FZ4zmVFe56KjrB1URvkPCLPGsgR+i++1qk9xrsF13AtT5icSt4eZfZg9bTthALZLTHGU750f1mevjfCs2e1H6wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574681; c=relaxed/simple;
	bh=rigmObmTQ8ypBd2eY1MQlsO4GqAJqBvPfQmABUp+VsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CnJlh7N0rfnd3MrZoM/GWKAtOxKqWfPlxRGwy/m2PQ/lkbemJnoljs2bt93z16yv6Ubf46E+ThTvNg77taKIKBgV7B23hSMyJn7teBi4ReQZpFX2yFK0pOXHY1Mgs1PTUGIALYpaefKxeM6yTJoqiFpdrxb3w2MWZvJTxZYYaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=Vx2dLYdv; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1763574675;
	bh=YGNi1x2iOW06ypIFNaqzlpyEmRMHUHb0ln8psChvB8k=;
	h=From:To:Cc:Subject:Date:From;
	b=Vx2dLYdvy4k6auVlVQFX5fFcOgJ4FxSJbQ1jy9wRUDY9BIgNwU0LMaz7q0WzyJ1eb
	 feQsyYr6Ft10yCV6qAc69B4la+lZ/EbmtaOJ4Vfv7Gr+gJ+jcFAgMEcMcFdviPp0Fy
	 k5bBLD6+zFUIr1sDuib84rtEQOLuIiCNJ3gNVD2w=
Received: from vokac-nb.ysoft.local (unknown [10.0.30.24])
	by uho.ysoft.cz (Postfix) with ESMTP id 724DAA0365;
	Wed, 19 Nov 2025 18:51:15 +0100 (CET)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v2] Input: pixcir_i2c_ts - add support for one-time total calibration
Date: Wed, 19 Nov 2025 18:51:13 +0100
Message-ID: <20251119175113.39216-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Pixcir Tango controller has support for a one-time total calibration
(manual calibration) procedure. Its purpose is to measure the capacitance
offsets of the electrode system and to store these values into EEPROM.

During normal operation this calibration data is subtracted from the values
measured. This calibration should be necessary only once in the product
lifetime. It should be performed as part of the final adjustment after
the panel is mounted in the product.

Add support for the calibration with sysfs interface.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
changes in v2:
 - Removed redundant lock from calibrate_store().

 drivers/input/touchscreen/pixcir_i2c_ts.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index dad5786e82a4..e52ec8d8e392 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -24,6 +24,7 @@
  */
 #define PIXCIR_REG_POWER_MODE	51
 #define PIXCIR_REG_INT_MODE	52
+#define PIXCIR_REG_SPECOP	58
 
 /*
  * Power modes:
@@ -462,6 +463,30 @@ static int pixcir_i2c_ts_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
 				pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
 
+static ssize_t calibrate_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct pixcir_i2c_ts_data *ts = i2c_get_clientdata(client);
+	static const u8 cmd = 0x03;
+	int error;
+
+	error = i2c_smbus_write_byte_data(ts->client, PIXCIR_REG_SPECOP, cmd);
+	if (error)
+		dev_err(dev, "calibrate command failed: %d\n", error);
+
+	return error ?: count;
+}
+
+static DEVICE_ATTR_WO(calibrate);
+
+static struct attribute *pixcir_i2c_ts_attrs[] = {
+	&dev_attr_calibrate.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(pixcir_i2c_ts);
+
 static int pixcir_i2c_ts_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -600,6 +625,7 @@ MODULE_DEVICE_TABLE(of, pixcir_of_match);
 static struct i2c_driver pixcir_i2c_ts_driver = {
 	.driver = {
 		.name	= "pixcir_ts",
+		.dev_groups = pixcir_i2c_ts_groups,
 		.pm	= pm_sleep_ptr(&pixcir_dev_pm_ops),
 		.of_match_table = of_match_ptr(pixcir_of_match),
 	},
-- 
2.43.0


