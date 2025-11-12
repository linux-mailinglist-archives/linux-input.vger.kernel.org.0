Return-Path: <linux-input+bounces-16043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E03C53D06
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 18:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C68EC505D42
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 17:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14993336EC3;
	Wed, 12 Nov 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TwU8osXX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DE133F39F
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968001; cv=none; b=exfRFRTs9mpz/LgBFdp3XJ5RgoU3It3ApB0BGRrWoslH0hWPeVUufHygqkyrKfI8s9Ila6Pao+4BW6TNTBtvVD2PzDaS0qO3+XvfJZuoer8tdMAfDWFyKjT6z9BG18nqIWK5BHEbPLbxDe8vRLoT4oKSzK+pSHz86ueM6gerGZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968001; c=relaxed/simple;
	bh=cIX1HljknQMLtdyrw/7vo4f6+C4rysEqzacl9pFRVCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YhWdi66oI21aGUgZbqycpFXQpJvCcThUbsfR3sGyi9IAqfb5LoYu9fWgWeawRPqRUgwBWYy7kSJP8/aErvSakiyrLI2OC/+Kj0N8AR5XVXG1WOz/yMZeJcMtfteG6ILG9ZKAVAgL/++bdj2C/fyQJENf/1O8rU32k3WmWxnppn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TwU8osXX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7291af7190so177531866b.3
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 09:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1762967997; x=1763572797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htWCmp/HqOC3LZuhkUtvSCsNEkCvDxqHS6yOGkHh6Qw=;
        b=TwU8osXXi1u3ZLeck+T/GmHnNqUHvsHvWCBdscw5uGz+cKdeBfybv+aJ0t9PzuN2Xk
         0QHAQ03P68tnUfpCYgqz2i2FydWWGInD2rjIN4jBFiYZb6dEW7RzVOx2n3M2B2WPi0bj
         BKinXKQMQA40gWPzGKhfVD4doT6frwlCWL5w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762967997; x=1763572797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htWCmp/HqOC3LZuhkUtvSCsNEkCvDxqHS6yOGkHh6Qw=;
        b=pxlT9alBWc5gHxoKhpSSl536S6yAvB7U3F/NbQj0ZwZtpufKdy9Ohie3aLgOuBfcCC
         2hAEF+i5TI60p6u8v0uDMNXMGMX72EmHdaBIRVUB1OHoLImm6vplynHnbFH4hBv+QEHG
         sND2JQSCdEbVq2WY6GoJHo1IfSQz/1WZrYX1v4mc1NNRV7nQ3jR32bySSAZ6UKrTCN2I
         i+VIFRg2qLtd1Mai1MZkozC86HaInFL/BlxAxsbP7KIUg6dVzCU26CzVG8Wu88C8tkw/
         n/yOY6cj5Eqbqrxvh3eKQ3bbKaZ8SLmGjsFcbjRc9jSnhKDp2eGvMe1evUg+LKdL5IE1
         yOjA==
X-Forwarded-Encrypted: i=1; AJvYcCVCgiv4RRC2ogemTOOKHbNV7OW4LyhsRuvJlnRrF5mfYkXPrCuLNHzllR86votOrJUawkoVVseII7IRYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnpuNUq1Vn/Ja7uzBZEG59vOao3rhp4iEuTSFlHvLgkYpA0E8
	M98pcDaXhn7hDvBNxhJfS+SWC2MsyyOdlLMaXHTF6pRXFJW1cx/VVKCl4EJUxzgqqjM=
X-Gm-Gg: ASbGncsnmsH37Fyp0hCfrHwPn9xe7LvLZAU85KSM1OlkTNtkp3z8a01APmA8AYN05Q5
	0rSn4mnRGz910XCWLkTAlhUWE4kPXhTbQyUXsOfprj8YfdND3bQF2vx/pF7xroVtYMTug0/bF4z
	ZeI+Oxv9JVbHpkfxnMj8Y+voia5eei/fkKB66eolC5WUY1YlT3Rk/r9O3Iad5QK/jqIFyFedkpQ
	OcnJJpzwVKDFZU6s730OMKabLPuN++q+aL9lkKpyU4GjKgWR21OTpgtvow/1B386Ke/3E/gue67
	ORaQP2m791aTuM0LNJEjUoJte3n6LxJtgEsSu9KVwruuoUHjAIKc4AN8U1htPLcFwyHQQX/dO7P
	C1Hdhy4czDVEEupKzVHWrFzf0L2Y/ubf5OvSGjUE0T7fMhrJJtclB8rPYBfX3Mys5yn3oqWa5Gg
	QYGXfLz9MvhZCoCd1gKu7ha8pO6HvVUTH7Ibe3VxkCLQHkDr3jBq7gVP0yKAaaIPA3qBT5pfLCo
	89vO7zIBdNhupc9l04IsKLe7pTYs/5LPEb8cDSgOBj+
X-Google-Smtp-Source: AGHT+IE7bK17fVUuGArh3EaIbNW9IKT2ffAI/pqUeoGXFPfQcnyo5QVy2bNe9piLDFmFF8y6mQJDQw==
X-Received: by 2002:a17:906:c78b:b0:b72:b97b:b6fc with SMTP id a640c23a62f3a-b7331a5ac30mr292584666b.30.1762967997438;
        Wed, 12 Nov 2025 09:19:57 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa11367sm1619860266b.68.2025.11.12.09.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:19:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jens Reidel <adrian@mainlining.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH v2] Input: edt-ft5x06 - fix report rate handling by sysfs
Date: Wed, 12 Nov 2025 18:19:50 +0100
Message-ID: <20251112171953.4046990-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the driver probe, the report-rate-hz value from device tree is written
directly to the M12 controller register, while for the M06 it is divided
by 10 since the controller expects the value in units of 10 Hz. That logic
was missing in the sysfs handling, leading to inconsistent behavior
depending on whether the value came from device tree or sysfs.

This patch makes the report-rate handling consistent by applying the same
logic in both cases. Two dedicated functions, report_rate_hz_{show,store},
were added for the following reasons:

- Avoid modifying the more generic edt_ft5x06_setting_{show,store} and
  thus prevent regressions.
- Properly enforce lower and upper limits for the M06 case. The previous
  version accepted invalid values for M06, since it relied on the M12
  limits.
- Return an error when the property is not supported (e.g. M09), to avoid
  misleading users into thinking the property is handled by the
  controller.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Drop the patch:
  1/2 Input: edt-ft5x06 - rename sysfs attribute report_rate to report_rate_hz
  because not accepted.

 drivers/input/touchscreen/edt-ft5x06.c | 158 +++++++++++++++++++++----
 1 file changed, 135 insertions(+), 23 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bf498bd4dea9..d7a269a0528f 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -516,9 +516,136 @@ static EDT_ATTR(offset_y, S_IWUSR | S_IRUGO, NO_REGISTER, NO_REGISTER,
 /* m06: range 20 to 80, m09: range 0 to 30, m12: range 1 to 255... */
 static EDT_ATTR(threshold, S_IWUSR | S_IRUGO, WORK_REGISTER_THRESHOLD,
 		M09_REGISTER_THRESHOLD, EV_REGISTER_THRESHOLD, 0, 255);
-/* m06: range 3 to 14, m12: range 1 to 255 */
-static EDT_ATTR(report_rate, S_IWUSR | S_IRUGO, WORK_REGISTER_REPORT_RATE,
-		M12_REGISTER_REPORT_RATE, NO_REGISTER, 0, 255);
+
+static int edt_ft5x06_report_rate_get(struct edt_ft5x06_ts_data *tsdata)
+{
+	unsigned int val;
+	int error;
+
+	if (tsdata->reg_addr.reg_report_rate == NO_REGISTER)
+		return -EOPNOTSUPP;
+
+	error = regmap_read(tsdata->regmap, tsdata->reg_addr.reg_report_rate,
+			    &val);
+	if (error)
+		return error;
+
+	if (tsdata->version == EDT_M06)
+		val *= 10;
+
+	if (val != tsdata->report_rate) {
+		dev_warn(&tsdata->client->dev,
+			 "report-rate: read (%d) and stored value (%d) differ\n",
+			 val, tsdata->report_rate);
+		tsdata->report_rate = val;
+	}
+
+	return 0;
+}
+
+static ssize_t report_rate_show(struct device *dev,
+				struct device_attribute *dattr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+	size_t count;
+	int error;
+
+	mutex_lock(&tsdata->mutex);
+
+	if (tsdata->factory_mode) {
+		error = -EIO;
+		goto out;
+	}
+
+	error = edt_ft5x06_report_rate_get(tsdata);
+	if (error) {
+		dev_err(&tsdata->client->dev,
+			"Failed to fetch attribute %s, error %d\n",
+			dattr->attr.name, error);
+		goto out;
+	}
+
+	count = sysfs_emit(buf, "%d\n", tsdata->report_rate);
+out:
+	mutex_unlock(&tsdata->mutex);
+	return error ?: count;
+}
+
+static int edt_ft5x06_report_rate_set(struct edt_ft5x06_ts_data *tsdata,
+				      unsigned int val)
+{
+	if (tsdata->reg_addr.reg_report_rate == NO_REGISTER)
+		return -EOPNOTSUPP;
+
+	if (tsdata->version == EDT_M06)
+		tsdata->report_rate = clamp_val(val, 30, 140);
+	else
+		tsdata->report_rate = clamp_val(val, 1, 255);
+
+	if (val != tsdata->report_rate) {
+		dev_warn(&tsdata->client->dev,
+			 "report-rate %dHz is unsupported, use %dHz\n",
+			 val, tsdata->report_rate);
+		val = tsdata->report_rate;
+	}
+
+	if (tsdata->version == EDT_M06)
+		val /= 10;
+
+	return regmap_write(tsdata->regmap, tsdata->reg_addr.reg_report_rate,
+			    val);
+}
+
+static ssize_t report_rate_store(struct device *dev,
+				 struct device_attribute *dattr,
+				 const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+	unsigned int val;
+	u8 limit_low;
+	u8 limit_high;
+	int error;
+
+	mutex_lock(&tsdata->mutex);
+
+	if (tsdata->factory_mode) {
+		error = -EIO;
+		goto out;
+	}
+
+	error = kstrtouint(buf, 0, &val);
+	if (error)
+		goto out;
+
+	if (tsdata->version == EDT_M06) {
+		limit_low = 30;
+		limit_high = 140;
+	} else {
+		limit_low = 1;
+		limit_high = 255;
+	}
+
+	if (val < limit_low || val > limit_high) {
+		error = -ERANGE;
+		goto out;
+	}
+
+	error = edt_ft5x06_report_rate_set(tsdata, val);
+	if (error) {
+		dev_err(&tsdata->client->dev,
+			"Failed to update attribute %s, error: %d\n",
+			dattr->attr.name, error);
+		goto out;
+	}
+
+out:
+	mutex_unlock(&tsdata->mutex);
+	return error ?: count;
+}
+
+static DEVICE_ATTR_RW(report_rate);
 
 static ssize_t model_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -572,7 +699,7 @@ static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_offset_x.dattr.attr,
 	&edt_ft5x06_attr_offset_y.dattr.attr,
 	&edt_ft5x06_attr_threshold.dattr.attr,
-	&edt_ft5x06_attr_report_rate.dattr.attr,
+	&dev_attr_report_rate.attr,
 	&dev_attr_model.attr,
 	&dev_attr_fw_version.attr,
 	&dev_attr_header_errors.attr,
@@ -595,8 +722,7 @@ static void edt_ft5x06_restore_reg_parameters(struct edt_ft5x06_ts_data *tsdata)
 	if (reg_addr->reg_offset_y != NO_REGISTER)
 		regmap_write(regmap, reg_addr->reg_offset_y, tsdata->offset_y);
 	if (reg_addr->reg_report_rate != NO_REGISTER)
-		regmap_write(regmap, reg_addr->reg_report_rate,
-			     tsdata->report_rate);
+		edt_ft5x06_report_rate_set(tsdata, tsdata->report_rate);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -1029,8 +1155,8 @@ static void edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
 	if (reg_addr->reg_offset_y != NO_REGISTER)
 		regmap_read(regmap, reg_addr->reg_offset_y, &tsdata->offset_y);
 	if (reg_addr->reg_report_rate != NO_REGISTER)
-		regmap_read(regmap, reg_addr->reg_report_rate,
-			    &tsdata->report_rate);
+		edt_ft5x06_report_rate_get(tsdata);
+
 	tsdata->num_x = EDT_DEFAULT_NUM_X;
 	if (reg_addr->reg_num_x != NO_REGISTER) {
 		if (!regmap_read(regmap, reg_addr->reg_num_x, &val))
@@ -1289,21 +1415,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	if (tsdata->reg_addr.reg_report_rate != NO_REGISTER &&
 	    !device_property_read_u32(&client->dev,
 				      "report-rate-hz", &report_rate)) {
-		if (tsdata->version == EDT_M06)
-			tsdata->report_rate = clamp_val(report_rate, 30, 140);
-		else
-			tsdata->report_rate = clamp_val(report_rate, 1, 255);
-
-		if (report_rate != tsdata->report_rate)
-			dev_warn(&client->dev,
-				 "report-rate %dHz is unsupported, use %dHz\n",
-				 report_rate, tsdata->report_rate);
-
-		if (tsdata->version == EDT_M06)
-			tsdata->report_rate /= 10;
-
-		regmap_write(tsdata->regmap, tsdata->reg_addr.reg_report_rate,
-			     tsdata->report_rate);
+		edt_ft5x06_report_rate_set(tsdata, report_rate);
 	}
 
 	dev_dbg(&client->dev,
-- 
2.43.0

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
branch: edt-ft5x06-fix-report-rate

