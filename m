Return-Path: <linux-input+bounces-2602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7788F2D1
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 00:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0E091F2A02D
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 23:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FD7155383;
	Wed, 27 Mar 2024 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gdYn2HNs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B8154C0F
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 23:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581547; cv=none; b=GWGV3XXYxufcNqrohGlSvStYaCC4M4+0OtFriHs++b65RIDaTN8SiTb22YjFDSxmP3h37zRsFUOsu1gQnD7riT3GdJq4IOapngIK+CQqp+e4WbaNJPzOLH+AjmKgeWSbldJuleh8becD1/DJ5QC01Hhan1edvFpiqKhzuVmFKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581547; c=relaxed/simple;
	bh=ly8n7SxGz9Lf2EUP25mArGs3mqGcGcPAZGBiTMozfFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1eILeSpmkjrgwcfvrnGUsL9f/8dvCGuCIJMscDrNpsMLNn0l7oBWuTkKkXiJhdXVNZMo2jtqqXILq2kRoT+Vt3AY0YquaUWbtylNZDU8GunkCXS3sNDCVNi5N267m5Q6dvhVSiqaNfq0W5X8V+JtVKO5C6Sre9lDVc3nHHyIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gdYn2HNs; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-221e6bf537dso253423fac.1
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 16:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581544; x=1712186344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE6UqUKX3G/FV5HVYmxMOtqukpZG7UeidX96eu+NYsg=;
        b=gdYn2HNs6K4qNEtXCegpSeDGvDV8ACFqhl6Vw7p9/9Zn5KL7U7CJyRzv4oEUP2PMR5
         AKCmYlJhBTSAEsxYPxJ86q1ivvhTcUFZgFSuV1IOS2YTJQbS6t4gfXZsaVYvLW/gd4V3
         +BaPLv351a9TJ3oTxqqzPeBLOMFKo/+DCu++5GtOZgLvE4O+LnX8bKtlgWbIofTNmSrR
         WFdGNJqz2nZWysZ1zrflE6XVoa8EvSoGsQmeFNaYFRevPflnCftuprK54+Sjn4WRyxG3
         p7QvTOg4/8kuwS5Y2OKt/x6LHKoBihgpkdzBouj2haJea7QiHmCDPVHWIBMJGbX7EyDr
         Jy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581544; x=1712186344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE6UqUKX3G/FV5HVYmxMOtqukpZG7UeidX96eu+NYsg=;
        b=TSdeQ2eb5/bO5Sylu2MrKvnirxx306FzUsVpY45Eb5YgXB4qMLnIohvvu8F1OSsG/D
         RkQRgE7OpJgNRQVQgn+c/rnycHngfnxSQ8lUnoN8ujMA02CyBEccvUXmmi+vQkqPQlIX
         sJzfhPxVVxNvJTKzRsW+mEMo20QWfhDELaCn1hSruRDLO0EaRmswo9enjGRHH/i1XZJk
         1OKen21P9oD8q/D5eHzj0tdsXI258QXBFjdzdPJVBbRQG3uTmLzPPJ+ECg1jRS//RW+k
         Qph2tGd6kOk1mbywv8ZC6OdsAQGgwgJzm0yRsGRfKVG2w1awF4DfaoD1DTruRlmaS3Pe
         S2TA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Z5yrlk+3R1z0qg4+2Ok3Tb0YElqynH/9SshZOddOzsi0oEQEDt3yFy26qb2XoJxszjmnebuL7xrcuRDrdoiYYeSuVHXU4Conrt8=
X-Gm-Message-State: AOJu0YwEa5LRZ0m31GYqGQMLOaHeVi5/QEBspSU4HlfUUGgPyFxlCjOR
	8aM6Lx77XRrMcJVFsqKrtemMyOsWz8cFZ9urVzVeXdO7C0mJyTZMJ2wA4aKeN/I=
X-Google-Smtp-Source: AGHT+IEoTHHATEQkuJa2BbeiTLbiTgSE1yaSMq5ULG3gGF3llvbq0XtMCg26/o3L5+Q/P6Gnym6iXw==
X-Received: by 2002:a05:6870:7d19:b0:22a:5690:f056 with SMTP id os25-20020a0568707d1900b0022a5690f056mr1316238oab.44.1711581543700;
        Wed, 27 Mar 2024 16:19:03 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:03 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH RFC 1/7] regulator: devres: add APIs for reference supplies
Date: Wed, 27 Mar 2024 18:18:50 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-1-5f4517faa059@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

A common use case for regulators is to supply a reference voltage to an
analog input or output device. This adds two new devres APIs to get,
enable, and get the voltage in a single call. This allows eliminating
boilerplate code in drivers that use reference supplies in this way.

devm_regulator_get_enable_get_voltage() is intended for cases where the
supply is required to provide an external reference voltage.

devm_regulator_get_optional_enable_get_voltage() is intended for cases
where the supply is optional and device typically uses an internal
reference voltage if the supply is not available.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst |  2 +
 drivers/regulator/devres.c                       | 83 ++++++++++++++++++++++++
 include/linux/regulator/consumer.h               | 14 ++++
 3 files changed, 99 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 7be8b8dd5f00..fd954d09e13c 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -433,9 +433,11 @@ REGULATOR
   devm_regulator_bulk_put()
   devm_regulator_get()
   devm_regulator_get_enable()
+  devm_regulator_get_enable_get_voltage()
   devm_regulator_get_enable_optional()
   devm_regulator_get_exclusive()
   devm_regulator_get_optional()
+  devm_regulator_get_optional_enable_get_voltage()
   devm_regulator_irq_helper()
   devm_regulator_put()
   devm_regulator_register()
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 90bb0d178885..e240926defc5 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -145,6 +145,89 @@ struct regulator *devm_regulator_get_optional(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_get_optional);
 
+static int _devm_regulator_get_enable_get_voltage(struct device *dev,
+						  const char *id,
+						  bool silent_enodev)
+{
+	struct regulator *r;
+	int ret;
+
+	/*
+	 * Since we need a real voltage, we use devm_regulator_get_optional()
+	 * here to avoid getting a dummy regulator if the supply is not present.
+	 */
+	r = devm_regulator_get_optional(dev, id);
+	if (silent_enodev && PTR_ERR(r) == -ENODEV)
+		return -ENODEV;
+	if (IS_ERR(r))
+		return dev_err_probe(dev, PTR_ERR(r),
+				     "failed to get regulator '%s'\n", id);
+
+	ret = regulator_enable(r);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to enable regulator '%s'\n", id);
+
+	ret = devm_add_action_or_reset(dev, regulator_action_disable, r);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add disable action for regulator '%s'\n",
+				     id);
+
+	ret = regulator_get_voltage(r);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to get voltage for regulator '%s'\n",
+				     id);
+
+	return ret;
+}
+
+/**
+ * devm_regulator_get_enable_get_voltage - Resource managed regulator get and
+ *                                         enable that returns the voltage
+ * @dev: device to supply
+ * @id:  supply name or regulator ID.
+ *
+ * Get and enable regulator for duration of the device life-time.
+ * regulator_disable() and regulator_put() are automatically called on driver
+ * detach. See regulator_get_optional(), regulator_enable(), and
+ * regulator_get_voltage() for more information.
+ *
+ * This is a convenience function for supplies that provide a reference voltage
+ * where the consumer driver just needs to know the voltage and keep the
+ * regulator enabled. Also, as a convenience, this prints error messages on
+ * failure.
+ *
+ * Returns: voltage in microvolts on success, or an error code on failure.
+ */
+int devm_regulator_get_enable_get_voltage(struct device *dev, const char *id)
+{
+	return _devm_regulator_get_enable_get_voltage(dev, id, false);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_get_enable_get_voltage);
+
+/**
+ * devm_regulator_get_optional_enable_get_voltage - Resource managed regulator
+ *                                                  get and enable that returns
+ *                                                  the voltage
+ * @dev: device to supply
+ * @id:  supply name or regulator ID.
+ *
+ * This function is identical to devm_regulator_get_enable_get_voltage() except
+ * that it does not print an error message in the case of -ENODEV. Callers are
+ * expected to handle -ENODEV as a special case instead of passing it on as an
+ * error.
+ *
+ * Returns: voltage in microvolts on success, or an error code on failure.
+ */
+int devm_regulator_get_optional_enable_get_voltage(struct device *dev,
+						   const char *id)
+{
+	return _devm_regulator_get_enable_get_voltage(dev, id, true);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_get_optional_enable_get_voltage);
+
 static int devm_regulator_match(struct device *dev, void *res, void *data)
 {
 	struct regulator **r = res;
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 4660582a3302..35596db521a0 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -164,6 +164,8 @@ struct regulator *__must_check devm_regulator_get_optional(struct device *dev,
 							   const char *id);
 int devm_regulator_get_enable(struct device *dev, const char *id);
 int devm_regulator_get_enable_optional(struct device *dev, const char *id);
+int devm_regulator_get_enable_get_voltage(struct device *dev, const char *id);
+int devm_regulator_get_optional_enable_get_voltage(struct device *dev, const char *id);
 void regulator_put(struct regulator *regulator);
 void devm_regulator_put(struct regulator *regulator);
 
@@ -329,6 +331,18 @@ static inline int devm_regulator_get_enable_optional(struct device *dev,
 	return -ENODEV;
 }
 
+static inline int devm_regulator_get_enable_get_voltage(struct device *dev,
+							const char *id)
+{
+	return -ENODEV;
+}
+
+static inline int devm_regulator_get_optional_enable_get_voltage(struct device *dev,
+								 const char *id)
+{
+	return -ENODEV;
+}
+
 static inline struct regulator *__must_check
 regulator_get_optional(struct device *dev, const char *id)
 {

-- 
2.43.2


