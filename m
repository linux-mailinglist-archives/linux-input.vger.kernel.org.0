Return-Path: <linux-input+bounces-5646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D849562E6
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 592F51C21382
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805CD158DC5;
	Mon, 19 Aug 2024 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB3UID4h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB7C158866;
	Mon, 19 Aug 2024 04:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043520; cv=none; b=WS/fdQEKpOfWSHKTZbLZtZKq3d1rmOUUXZGvv6rFBsIqJbmqj8MK/EHaLvPYiACFHoMqrTUZt2g/aXQZ7JDNYNVkgz0aV4EivuB0CeWWTqmsl9sTjIScdinpX6cDVfuCWTHR87ViRMn/Rr/SNI3CtU+CJjWcva91F+Na5gmDIsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043520; c=relaxed/simple;
	bh=0Y6SvS6wUHhmrgnziF3Zcfml6zOO2CYzjzMgrYgGEPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8R81wnSh3/GZWvdoHeHCa8++d+YcK2wvFGVbjGtq//jDYqAcJnl8Z6ecjQondVN9OToUY8KIy32+d0o/P8q7X0YtWPft41S7EO5vX7qJUHsQoVugK1qQAT0CmnBRoGvAyL40wuqsuW9Kj3Xc5+puy0ntoSh1Pe122bqp4xBqBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB3UID4h; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-710ce81bf7dso2777397b3a.0;
        Sun, 18 Aug 2024 21:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043518; x=1724648318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L9I6imIfpvf63yPfkptA7xMzZO0c5Qjz4Mu6DS54Gw=;
        b=OB3UID4hcemTPekK3ZcGwhQ8IAanJQVrznQBakCGQeszRnj3P5Br85pPMp/yUI6LQ/
         ivPyPHKU51a5sx/fBfraLFVe4eq0PJ+NE+W1JUg2mUtzNC9SAIDTXcxHJq7oacRBAS/q
         nsUve1XIMoQvcNBYo3Sf2FXortJ5WFkjpouGjJKv1nxA2pRoCUGq3jAZs61AsSunSytB
         gqVPgtESLHOzEf5NX+RQUNlHJAOl1hT8u+tQEGVTay1ADMs1iTXDKJHt6jBJwT6Z1WUh
         WDpuq6J8chzrWkJ3RttBj6s1Bu8KIMYGXdGk07ZyUlVniNu4gl5biaiOzDr50QNOwKNB
         oSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043518; x=1724648318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L9I6imIfpvf63yPfkptA7xMzZO0c5Qjz4Mu6DS54Gw=;
        b=ghdHiLyN50xrNijK89lRn2M1gSRSNR2crvzoF3CNr2szv7lSoujG06tOEZHyvaAFev
         Paw6Pm4beqWVH/KsYGfRXHaCck4v+dUD2FMCo19qg2AJlSTyeZH6DRQ7uz7XSSKPElpX
         QvFnHyj1uFnRFFz4djsi7v3JY03YrDC9oPOYBPZweBFufgxK8CKWTfd7nPW00rjVaZ19
         9eAEffx8v3sta5nFfbb5LEciU2EmzAeoC4Ise/uomUW3vfdAdk8rhnGy9RVAv2yajscq
         MUYr8HdyXgQ88Ibh7Z4P98AQbFSx/FACflACkP3Yonz4AJuW2O6qTZ6CaHfKbxVb7HfD
         sttQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo5/wMf243aHkgLrti56ixPNQTgiE0vXASSCyBSbMEZ4jnH8abGJVSNHTQksVm3cOT9Li6LQOWPd395pIN6LQFCbwGSEr1Hk9lWvOZG8Zn+xZ2rouku8B45YNMQJ2zFRkrlCY0LySoBeeXvC8++luPRERvKfO96L419lEpDpwEJ/4XYnaF/1PJjD1X
X-Gm-Message-State: AOJu0YwoFL6ZOqMgndT3Kc5nPOSE6WRXRP85p1doxnKjNJQGb0Uy4Nzy
	bLrYenVZQCQnC0MdZHaP/TGVHMtZdTiPkTS8drEtYzBfCXcI24Jz
X-Google-Smtp-Source: AGHT+IFOXUP47XrlReJyTvezC1ueWJrGGZqHqPG5DuxuErxhgxqYthREfB9dhnYaAiK/2wzqkmdXDQ==
X-Received: by 2002:a05:6a21:8181:b0:1c9:bb89:4d66 with SMTP id adf61e73a8af0-1c9bb894f08mr7201660637.3.1724043517786;
        Sun, 18 Aug 2024 21:58:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 10/14] Input: samsung-keypad - handle compact binding
Date: Sun, 18 Aug 2024 21:58:07 -0700
Message-ID: <20240819045813.2154642-11-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for standard matrix keymap binding (in addition to the
existing verbose binding with a sub-node for each key). This will
allow easier conversions from platform data to device properties when
using static device properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 122 +++++++++++++-----------
 1 file changed, 64 insertions(+), 58 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index e262137b6838..df2427ac63d7 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -231,78 +231,85 @@ static void samsung_keypad_close(struct input_dev *input_dev)
 	samsung_keypad_stop(keypad);
 }
 
-#ifdef CONFIG_OF
-static struct samsung_keypad_platdata *
-samsung_keypad_parse_dt(struct device *dev)
+static const struct matrix_keymap_data *
+samsung_parse_verbose_keymap(struct device *dev)
 {
-	struct samsung_keypad_platdata *pdata;
 	struct matrix_keymap_data *keymap_data;
-	uint32_t *keymap, num_rows = 0, num_cols = 0;
-	struct device_node *np = dev->of_node, *key_np;
+	struct fwnode_handle *child;
+	u32 *keymap;
 	unsigned int key_count;
 
-	if (!np) {
-		dev_err(dev, "missing device tree data\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "could not allocate memory for platform data\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	of_property_read_u32(np, "samsung,keypad-num-rows", &num_rows);
-	of_property_read_u32(np, "samsung,keypad-num-columns", &num_cols);
-	if (!num_rows || !num_cols) {
-		dev_err(dev, "number of keypad rows/columns not specified\n");
-		return ERR_PTR(-EINVAL);
-	}
-	pdata->rows = num_rows;
-	pdata->cols = num_cols;
-
 	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
 	if (!keymap_data) {
 		dev_err(dev, "could not allocate memory for keymap data\n");
 		return ERR_PTR(-ENOMEM);
 	}
-	pdata->keymap_data = keymap_data;
 
-	key_count = of_get_child_count(np);
-	keymap_data->keymap_size = key_count;
-	keymap = devm_kcalloc(dev, key_count, sizeof(uint32_t), GFP_KERNEL);
+	key_count = device_get_child_node_count(dev);
+	keymap = devm_kcalloc(dev, key_count, sizeof(*keymap), GFP_KERNEL);
 	if (!keymap) {
 		dev_err(dev, "could not allocate memory for keymap\n");
 		return ERR_PTR(-ENOMEM);
 	}
+
+	keymap_data->keymap_size = key_count;
 	keymap_data->keymap = keymap;
 
-	for_each_child_of_node(np, key_np) {
+	device_for_each_child_node(dev, child) {
 		u32 row, col, key_code;
-		of_property_read_u32(key_np, "keypad,row", &row);
-		of_property_read_u32(key_np, "keypad,column", &col);
-		of_property_read_u32(key_np, "linux,code", &key_code);
+
+		fwnode_property_read_u32(child, "keypad,row", &row);
+		fwnode_property_read_u32(child, "keypad,column", &col);
+		fwnode_property_read_u32(child, "linux,code", &key_code);
+
 		*keymap++ = KEY(row, col, key_code);
 	}
 
-	pdata->no_autorepeat = of_property_read_bool(np, "linux,input-no-autorepeat");
+	return keymap_data;
+}
 
-	pdata->wakeup = of_property_read_bool(np, "wakeup-source") ||
-			/* legacy name */
-			of_property_read_bool(np, "linux,input-wakeup");
+static const struct samsung_keypad_platdata *
+samsung_keypad_parse_properties(struct device *dev)
+{
+	const struct matrix_keymap_data *keymap_data;
+	struct samsung_keypad_platdata *pdata;
+	u32 num_rows = 0, num_cols = 0;
+	int error;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata) {
+		dev_err(dev, "could not allocate memory for platform data\n");
+		return ERR_PTR(-ENOMEM);
+	}
 
+	device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+	device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
+
+	error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+	if (error)
+		return ERR_PTR(error);
+
+	pdata->rows = num_rows;
+	pdata->cols = num_cols;
+
+	if (!device_property_present(dev, "linux,keymap")) {
+		keymap_data = samsung_parse_verbose_keymap(dev);
+		if (IS_ERR(keymap_data))
+			return ERR_CAST(keymap_data);
+
+		pdata->keymap_data = keymap_data;
+	}
 
-	return pdata;
-}
-#else
-static struct samsung_keypad_platdata *
-samsung_keypad_parse_dt(struct device *dev)
-{
-	dev_err(dev, "no platform data defined\n");
 
-	return ERR_PTR(-EINVAL);
+	pdata->no_autorepeat =
+		device_property_read_bool(dev, "linux,input-no-autorepeat");
+
+	pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
+			/* legacy name */
+			device_property_read_bool(dev, "linux,input-wakeup");
+
+	return pdata;
 }
-#endif
 
 static void samsung_disable_runtime_pm(void *data)
 {
@@ -314,7 +321,6 @@ static void samsung_disable_runtime_pm(void *data)
 static int samsung_keypad_probe(struct platform_device *pdev)
 {
 	const struct samsung_keypad_platdata *pdata;
-	const struct matrix_keymap_data *keymap_data;
 	const struct platform_device_id *id;
 	struct samsung_keypad *keypad;
 	struct resource *res;
@@ -323,18 +329,17 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	int error;
 
 	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		pdata = samsung_keypad_parse_dt(&pdev->dev);
+	if (pdata) {
+		if (!pdata->keymap_data) {
+			dev_err(&pdev->dev, "no keymap data defined\n");
+			return -EINVAL;
+		}
+	} else {
+		pdata = samsung_keypad_parse_properties(&pdev->dev);
 		if (IS_ERR(pdata))
 			return PTR_ERR(pdata);
 	}
 
-	keymap_data = pdata->keymap_data;
-	if (!keymap_data) {
-		dev_err(&pdev->dev, "no keymap data defined\n");
-		return -EINVAL;
-	}
-
 	if (!pdata->rows || pdata->rows > SAMSUNG_MAX_ROWS)
 		return -EINVAL;
 
@@ -398,7 +403,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
 					   pdata->rows, pdata->cols,
 					   keypad->keycodes, input_dev);
 	if (error) {
@@ -439,11 +444,12 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	if (pdev->dev.of_node) {
+	if (!dev_get_platdata(&pdev->dev)) {
 		devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
 		devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
 		devm_kfree(&pdev->dev, (void *)pdata);
 	}
+
 	return 0;
 }
 
-- 
2.46.0.184.g6999bdac58-goog


