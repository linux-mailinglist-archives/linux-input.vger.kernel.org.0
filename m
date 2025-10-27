Return-Path: <linux-input+bounces-15742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B033AC0F398
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 17:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C5491891484
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 16:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5137312828;
	Mon, 27 Oct 2025 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ksadmCAq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931E3312819
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581790; cv=none; b=bZTxM2I/Gy6yha87yrZJWe7l/T+cCbUcv/CiHSLtI5WM6mOL7hqlA4XvwVVaVTorFCmkHqbo5vCncdnsdSiUGs67nV+LPplHB+d51aTdFE9TS6++rHTA909S6ENEU9rSoHAUBdzqzFMyGjIcFGGkKisBV+Y2fPxXTRiQO1ZU6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581790; c=relaxed/simple;
	bh=S0TJRT9I6u85I8rir2bVhEGUHAKgwkhgyEcDxxXmpA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XUFNq8X77HGNGxxjBqwCs/AkYKgESj4wrQ6LyimKt3OtIY6miph/LH6u3z4arumBNdryb1MqS+UKl9jExoieA4baHEM/sf1hMW/VmmW9I8xAMZmllvrwko8/hwTMawUGUwyapOp+y2xhPfqdWJKMFFZaqDN80Gjm2m73qXjsWmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ksadmCAq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so919795066b.0
        for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1761581786; x=1762186586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPYho8Qu09IQiF/d4ybgLxhO4EcHqRatvEGSDjzG4FM=;
        b=ksadmCAqJi261GxurTRjUDxtbEl8zIO/E/DqB4LkibCwb5zF0iS39qvEXxfgjjspVa
         kxHKVpx7TZvOtYS8RTYOUTuU9/6lVB0Ehs0EOSu6POSM6IlleG8YM3msBFq2IzyjEeDk
         rFD5hu45RCJC3zG8gsJW0kCgIDFJ+QHxLWbu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581786; x=1762186586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPYho8Qu09IQiF/d4ybgLxhO4EcHqRatvEGSDjzG4FM=;
        b=I8OqO07aU1/1X+wVpOJhL6TnZJVb+F4Q/i9o3mg4AUAl5xAseDmzF6g0DK0A0WBPJj
         IZEzz0jZk6k42a1Hj7deq089RNytKfbnC11wmgxFxRDMfXIvdrGZNICsB2IRvaG/Npfm
         a3ce24IHqp1rkJDPLBFxX8ulLjpwHnQBuryivG0oQKO2FW1KGpVM9gAoHOJzM0seLI2n
         u+tinEdmNHmAeU7ylun2XEtfCAQSlI2H5GxTJcfZhj1clC+XG5x+CpY0W9KAgCrtnXFs
         34Zc6KM+yHovJfiqOSk5QQWKUVgesew+vOjh7k36LA6AqLLrjarIJL4oKeU2jIc/ktAO
         uaLg==
X-Forwarded-Encrypted: i=1; AJvYcCUsX49xGZtjLexf+Ovo4pIEaDgI+aW97Gcl21uMi2Jc+OxjyVud3h16CZ6Hv6l0rb36ZmGLmlwLOEKpWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZ/2tFagyUGQya5oplNYpqmP0X9km1b+dkyPdiDbcq4WkIQiZ
	UIejOIaXukNl+Na4vM668FzRjHLiqMCBERVTgwraSdiG/DH9hvvLCm6y9PsTdeSupM3k6GQ0vSE
	qX++n
X-Gm-Gg: ASbGncv4YcEsr0XotESAYgrKJKSnk1/0qEkJluegkRaFgatX/p733OositKu1DiHh57
	ukSGy1dKPHLkOPRUZAzJCVcvJt0TwQXhPOncfa63Qx8J/SuT1q+CBSIuo1CTV7J41LBTTquEJln
	Cqax0Eie9iM84e/W6D4gGTX/tAc22dONbTsuAHu1kCc9uqPfu/FHQ5BJqo4ZJpTppRYa0EwMdmV
	G/d9ITSGEL6prazeXZoKDYEZHylmKaXf7at4MPNbsrPikh2EJDC3Mq+ITijECBBt4SkIGOdGfaN
	q/Wg5raJ3cmYfU2G6xqn+KSYjLLbChdkvidHXteDFdUzkDvOObF9RnI6YXctJ5+MaiGJwR+v4E5
	gjxSSRXH5yXAkOZUhxeYknFPDDdf0q+QM3ndqhzCsrnxx28bK5tK5dWlfvxLIrJsyfiH5E4VB+F
	akI+QRbsMZYtbbcIAUETPXTuiSnzZZluwaAulHNDsoHShdjK9ngoI0PdoRxAcSCc30xNc6iVelE
	FbTAde6j2SBVQOy++mm5wPLNBBeaocFG2kWFrXK/WTu
X-Google-Smtp-Source: AGHT+IGC3DtKxJ+lK6DUYWoBdT0g+Qnm0l1Sp8U84Jz677mjx6t11jEpUUoTlzXS0zEOB/FeUQ6H7Q==
X-Received: by 2002:a17:907:94c7:b0:b6d:573d:bbc5 with SMTP id a640c23a62f3a-b6dba525d87mr43276466b.37.1761581785729;
        Mon, 27 Oct 2025 09:16:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-50-34-170.retail.telecomitalia.it. [82.50.34.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d854430dbsm798403666b.63.2025.10.27.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 09:16:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jens Reidel <adrian@mainlining.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH v2] Input: edt-ft5x06 - fix report rate handling by sysfs
Date: Mon, 27 Oct 2025 17:16:05 +0100
Message-ID: <20251027161622.2021180-1-dario.binacchi@amarulasolutions.com>
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

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
branch: edt-ft5x06-fix-report-rate

