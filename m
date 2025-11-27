Return-Path: <linux-input+bounces-16379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B3C8D2E6
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 08:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 38C36351896
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 07:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8F7321F42;
	Thu, 27 Nov 2025 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GV1+3zgH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529DC23372C
	for <linux-input@vger.kernel.org>; Thu, 27 Nov 2025 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229598; cv=none; b=nK5kFmlOf8YDXsYI3OMg7ARwd5Zo9ZaybijSf2cVyEGwD4jmYAO098LKN8MM6PY7p2dMVJiKiGLjmDfMAjD3pJRDcjg1jIFmNlR3qCMuN9temkJXmSuNCIS5tp6qgsJRDFnJSqz+U6HlHs1XchNczRUCu+2K46BD2bOzKsslokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229598; c=relaxed/simple;
	bh=Wm3ZhBOgwnlfY2W5VGIWg1AKkxdXhR9gwKIvXq0Myc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTFMvbqLQt4uuAY8T3hPS0S9rUrQD9dn4XluuMbBBTKcOa9xAnAUyAn24C00pS3GJgQsFRdc7V77XWnhFE6bey9Vmhb3g34iQxa6cHom5Yq5BKW2fgSLuPVJFVmpcXvof4KMORGX8Igg2fbh1V29Qqq7T9zDpPGIdtCRWlyCgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GV1+3zgH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b735487129fso84914766b.0
        for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 23:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1764229594; x=1764834394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I57iSPGSJdvo4hExZdg2/yXzMQCRNalZqIfRbvKW8Ek=;
        b=GV1+3zgHKZy8pzwvaIdmyUULRNouPCskMux1saxhSwg0b/pUr1AKg1YB8tGsuN9L+u
         xzQccoC7e6XO6YW6QA0tHHZklj3oFtv8ku+zRdPeI8SQe0zf4vkr+uOew1UtZmyGvUnq
         OAH9UHSBbuJZ0/6Qdtcacx/8g+96cvdfaCOzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229594; x=1764834394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I57iSPGSJdvo4hExZdg2/yXzMQCRNalZqIfRbvKW8Ek=;
        b=DOdjWLGYQXdlLfEZH0e1TIq3z8qoSeKT33NehTiSGcHJjzSEci6iyQLWJ3IacpRdDf
         ct8LPz2+bMy8T7/FIckAXJPofDWOPdIG+jq8OHjXSfPu+HDXI5B55XnoKDc0fxseRZtK
         lrBOroVt9zOl6f5vJBfYGvgYW9W5VEF1qj9AYfw98KpOxD+sH2aUU8UAJgrvyzl9UTIT
         lB6/wl3rBfDveDNCyM5slFOL3qDz892MaoBRpHixMzNNEJFp5tDeM2wsqJhUcfU407V9
         khaTGQsqSDWXdfMc+DqNnzBGHdDXLblrgn+s/Gu3l3DOVFejw4QFLA/p2GuR7ApIR2zx
         ybtg==
X-Forwarded-Encrypted: i=1; AJvYcCWKI0FvB+/kN7PymOT8MpfrI6or2esMo94IbLWs7QXldm0FOAfOfCmuttnbugilVFwpuojAG9a8nd46eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lbI54j34n90P78adCWxLoh/owcGUXFjGPGhHC3wINzwkpNzS
	viURHIkX6FRli1GDKulsF8B99fcyrxGy8rc7vs+OWKwSGjBOPgnlf3LaSUMTv8hkZHNdWT6uYJh
	lKlRC
X-Gm-Gg: ASbGnctbhq5OLjyzg7p46VAEL5FzdiItk271pP/xAbirND3ALCixtEMZi+eLQmmo9bt
	Visc5rrMXJNTiKjTeIKO+9WlaqQRllmXnavttsiCBpUTcQZ8b6hosNf54LgvGpAyzZdcuY4Mk52
	ckIsTsB44kXDLRtlCIWUmoWIjEBBVEY/trMxkaFTE6yBNXHoOSFTU5WpdExPR3faOk4awOtykCc
	swm2pcYFi0btA0KJjSBZ3gHBYSw5HAx7PHWE6d6N1FTl+2h/zSbj2RRMlw+ZRCDFlg5szTf8VUv
	WP5wawupzE/y1eMv/vTPgfwtIucmxJqxgkwBDf/NPithWeBE1Pu0GlO/C8vhxqBZb/C3k32lAC1
	G/i/uz1uR0Y6GxItRwnyq7tTpt7y3VWUBY69i4EcpYwWHrC2cZmNj3vfUageg+Jj1mc20UvJa+/
	6g0+RyWnP/uuLQmt4nI7LvcVLVrXUJi0vJHDQ5pv1HUPEWjvZDgOhVKrBk10Vn2/L+lIeF00Ke9
	HFNxJ8p8A+WFpOOOuOhcmkvogIUhbljgYKWQ0lqIp2xHak=
X-Google-Smtp-Source: AGHT+IEgx3bglb1EkfZgShJUGyqy+Y6wzWQac9BwM5RQzPqtJgXdrFY9KX/BK/jMNa+Dg7A1opAdfw==
X-Received: by 2002:a17:907:26c2:b0:b4e:f7cc:72f1 with SMTP id a640c23a62f3a-b76715aba47mr2280426566b.22.1764229594426;
        Wed, 26 Nov 2025 23:46:34 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-4-36-237.retail.telecomitalia.it. [87.4.36.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c55e9sm91435666b.26.2025.11.26.23.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:46:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jens Reidel <adrian@mainlining.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH v2] Input: edt-ft5x06 - fix report rate handling by sysfs
Date: Thu, 27 Nov 2025 08:46:21 +0100
Message-ID: <20251127074626.1953741-1-dario.binacchi@amarulasolutions.com>
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

base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
branch: edt-ft5x06-fix-report-rate

