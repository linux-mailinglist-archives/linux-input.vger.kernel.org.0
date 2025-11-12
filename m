Return-Path: <linux-input+bounces-16036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C463BC52656
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 14:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFE873A7455
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 13:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80DB335081;
	Wed, 12 Nov 2025 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="fXH+LZJS"
X-Original-To: linux-input@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5183291C13;
	Wed, 12 Nov 2025 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762952440; cv=none; b=BreNYSiOKcjqkyGaVcGTprqCWcB2j/X+p51MrWwmtjKxpBtuX8UFEVT+sPEvjNpM5A+gJZrvy4ini61Gzt0vBhnkcgc0kRRLQBGdG2Evsc3R3Z9q84Y+PdIYgWJxe8sjqjhteLJdKUG9f5DvWbUvxvHZFKZO8TOIWRguz4vrEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762952440; c=relaxed/simple;
	bh=GMKeJf8ppi1Exy1OWQvHssXhELc7JoVxgyCgXEVPBXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JDxlQO/+u6FKfAFWxUiXbSLY7PXrdcCbvPdVnRri4Grq+Xfsvm1vbx334rM54ChK1XG71yFNGzb0tQL29dAB82K3gFau7dkNf9a/Lzkl2gIsJ1vVhrvrpGIm2Vucn3sD+fqolOFGinszZ9p3mJYPJJ4g32IxixfTg4xzJ9jgAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=fXH+LZJS; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1762952430;
	bh=qk9AdDEOIVPftrsh6xF8w4j0IpPuB/mszbihGW0UAZg=;
	h=From:To:Cc:Subject:Date:From;
	b=fXH+LZJSWd16C3AiRjyXbyfNxXlVM3luODXrEF/pLQycXsYkP/iFToBAYt9j/315O
	 8M01F5OrPb1RNN1Ehxf2YJyVlX5UFWNUcxUJRmySIcayPYzjbb3ODhWgqV/Y0U0bgc
	 DamdtUJZfzSWTS8cAY6heYOO3PRd2SmezwOBgPK8=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id D27E4A01C0;
	Wed, 12 Nov 2025 14:00:30 +0100 (CET)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH] Input: pixcir_i2c_ts - add support for one-time total calibration
Date: Wed, 12 Nov 2025 14:00:19 +0100
Message-ID: <20251112130019.1488005-1-michal.vokac@ysoft.com>
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
 drivers/input/touchscreen/pixcir_i2c_ts.c | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index dad5786e82a4..2215e56b1458 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -24,6 +24,7 @@
  */
 #define PIXCIR_REG_POWER_MODE	51
 #define PIXCIR_REG_INT_MODE	52
+#define PIXCIR_REG_SPECOP	58
 
 /*
  * Power modes:
@@ -82,6 +83,7 @@ struct pixcir_i2c_ts_data {
 	const struct pixcir_i2c_chip_data *chip;
 	struct touchscreen_properties prop;
 	bool running;
+	struct mutex sysfs_mutex;
 };
 
 struct pixcir_report_data {
@@ -462,6 +464,35 @@ static int pixcir_i2c_ts_resume(struct device *dev)
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
+	error = mutex_lock_interruptible(&ts->sysfs_mutex);
+	if (error)
+		return error;
+
+	error = i2c_smbus_write_byte_data(ts->client, PIXCIR_REG_SPECOP, cmd);
+	if (error)
+		dev_err(dev, "calibrate command failed: %d\n", error);
+
+	mutex_unlock(&ts->sysfs_mutex);
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
@@ -488,6 +519,8 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client)
 		return -ENOMEM;
 	}
 
+	mutex_init(&tsdata->sysfs_mutex);
+
 	tsdata->client = client;
 	tsdata->input = input;
 
@@ -600,6 +633,7 @@ MODULE_DEVICE_TABLE(of, pixcir_of_match);
 static struct i2c_driver pixcir_i2c_ts_driver = {
 	.driver = {
 		.name	= "pixcir_ts",
+		.dev_groups = pixcir_i2c_ts_groups,
 		.pm	= pm_sleep_ptr(&pixcir_dev_pm_ops),
 		.of_match_table = of_match_ptr(pixcir_of_match),
 	},
-- 
2.43.0


