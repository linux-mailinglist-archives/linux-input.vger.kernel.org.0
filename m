Return-Path: <linux-input+bounces-14071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39429B29536
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 23:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C09E196788D
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 21:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F642FC883;
	Sun, 17 Aug 2025 21:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUXhvSXW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E555246782;
	Sun, 17 Aug 2025 21:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755467614; cv=none; b=O3kBY1Hw2fbFjT9S2Z9K1rc3kxAzBE3yQaUcwC39+cjZ+DL3lUuSk+0DWN58z5ex0/PRqjsp3FNbQm8JSG3VgTETTj3+pORWNW5z7NHktdCa308qq0utszvBXquq6HYFzm88uAc5VyFMItqVJVKbcq0c/rkPHHG5FVaGl/bWioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755467614; c=relaxed/simple;
	bh=/XspesSQsI35dU6WlUc3D0cS8m1G5J4dkSaueI8ex1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYb+UQP5UTMFrUrOoT4baG+ELFxFXzP2HFIezZqVZJRNu4cBE3jIWvrw8dSqd5NrbZRURijtJiLco0ByBIDUYb4RWcgRAC9m7k8fWIK6Gzbf/egu+RWWfpOlLU4rdbVe6iOT5BwOZwmqEBHBL6vlNejBM98YeGfk22zIqcFybFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUXhvSXW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2ea887f6so2528951b3a.2;
        Sun, 17 Aug 2025 14:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755467611; x=1756072411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHGTMXQyfW3VC8b9lA94WS0zG1xETpAiukFdIs/JoDg=;
        b=eUXhvSXWg6Y2aDgW05rhi1RoBJnPEDa4gETWVfHyfBOQNfebHaYKQlgJGs7FI+0zIc
         RdkLl0sfgbOwEzNln640+XmQu+6miIBqHumpVHb5n4LNBQAMOpLBjgs5V+pXvCjE6XIS
         bd6PNDGXO6dgm88rsKOs6wWdtsIXwEMHdGPZ8RKAlJ0YrI6h4Z8GoqhphP0h9Nt7plke
         lN3Vivm5UwIHbPq1H9ipzaurwNZJJfbWfIOtNhclJsos04T+JZtBslMUppAwd+SkQECG
         FpTY/Z74MOZ/7iyjfH6fr2iwOqrpoN7/Jzj3E8ayT2HdlfGGjo8ZtWK4xc9qjrbkkFqB
         8L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755467611; x=1756072411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHGTMXQyfW3VC8b9lA94WS0zG1xETpAiukFdIs/JoDg=;
        b=dDDnGB+MKV9x8ehNJK1YXqnuAl+3Jf+2AYeoBTdOqt9lp2PXSKgISirva0LOZsxPg0
         Ah5KUmHrHapR5s5gYELzfRKkqIwfSdpmb6qMVNbYd4K/ul9uU5CQ2GNIl+czDWDNJfI4
         jrlun46caYW1lEBA4qfcxi0DstegEbqm3ftiSj+U/W7vg9SciaUvjFkESdQx7Wx3krmQ
         6UmkhdE37o5QyYF1kU5317BjeQ0j7KKEF2MRRMptyG6AxM5ZNcvrQ0gE0llT03dnUkWX
         ur0Mck2odFyOe81Kz1jz7wfjBOSo9tmk+OvItGYN968JX+ATPrsYh4EeH7nxTTzVd/x/
         pIAA==
X-Gm-Message-State: AOJu0YyzQ8lP/Q4l6NxO97hN7aOozrtvYpVPXRIGy5yvPS4WYbGt58zd
	LOcOQZFduQCAf8GmQHbvxQy6pmmBWXlMgmPsfOr8k/N4KYXdQFXSpWLFimgIsA==
X-Gm-Gg: ASbGncug/kBVmOK10UixklTw72XeezRKvANSut2zkzkbNBUciG0nHfPQGRfjWeecMVE
	jo3IYD/GsbLXt/nelr2j/37s847Th0fykfm4okovBgmcniq4Q3Pjqg2DtUsndNqIXHIycavqjLi
	sn6shLjoU+7xkmoWP3vqDbRHRVWv2tNIJTZttQ9XpANrAbFXhvQdrsmKDjww4IK86SdDsCXhRM4
	gk4XEH1k1ad4Ebr0+0ImcbroIxpFU4Yh79gn4ukI6W2xO1194sRMzJWu4Emj+Gx/GcY45Dw0/vZ
	GaBrPHtE/TlEoM61fj2rKGEG6mXWydzbs1byJuW7JdYNnkRrsISsFdo245UFq/CG7FU2YOfgDBa
	cC9V1MncYO2io2pHciZLwj/1IZsUxs8xEvCGGNSqw4xyi
X-Google-Smtp-Source: AGHT+IF6q490HClEhdZmgoS4S5apSZYYJnTB4JY4m+rlzfj3OMPpQCOzlYEQo90XMPvSUZryyO3+5g==
X-Received: by 2002:a17:903:2442:b0:23f:6fa4:1567 with SMTP id d9443c01a7336-2446d6e5659mr141236155ad.8.1755467611349;
        Sun, 17 Aug 2025 14:53:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-244903222fcsm3832995ad.84.2025.08.17.14.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 14:53:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Miao <eric.y.miao@gmail.com>
Subject: [PATCH 3/3] Input: pxa27x-keypad - drop support for platform data
Date: Sun, 17 Aug 2025 14:53:15 -0700
Message-ID: <20250817215316.1872689-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250817215316.1872689-1-dmitry.torokhov@gmail.com>
References: <20250817215316.1872689-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-kernel users of pxa27x_keypad_platform_data in the
kernel, and the driver supports configuration via device tree, so drop
support of static platform data and move properties parsing from
OF-specific methods to generic ones.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/pxa27x_keypad.c      | 378 +++++++-------------
 include/linux/platform_data/keypad-pxa27x.h |  73 ----
 2 files changed, 121 insertions(+), 330 deletions(-)
 delete mode 100644 include/linux/platform_data/keypad-pxa27x.h

diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 376e943dc3dd..bb57bd4c56b1 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -21,13 +21,13 @@
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/input/matrix_keypad.h>
 #include <linux/slab.h>
 #include <linux/of.h>
 
-#include <linux/platform_data/keypad-pxa27x.h>
 /*
  * Keypad Controller registers
  */
@@ -100,54 +100,69 @@
 #define keypad_readl(off)	__raw_readl(keypad->mmio_base + (off))
 #define keypad_writel(off, v)	__raw_writel((v), keypad->mmio_base + (off))
 
+#define MAX_MATRIX_KEY_ROWS	8
+#define MAX_MATRIX_KEY_COLS	8
+#define MAX_DIRECT_KEY_NUM	8
+#define MAX_ROTARY_ENCODERS	2
+
 #define MAX_MATRIX_KEY_NUM	(MAX_MATRIX_KEY_ROWS * MAX_MATRIX_KEY_COLS)
 #define MAX_KEYPAD_KEYS		(MAX_MATRIX_KEY_NUM + MAX_DIRECT_KEY_NUM)
 
-struct pxa27x_keypad {
-	const struct pxa27x_keypad_platform_data *pdata;
+struct pxa27x_keypad_rotary {
+	unsigned short *key_codes;
+	int rel_code;
+	bool enabled;
+};
 
+struct pxa27x_keypad {
 	struct clk *clk;
 	struct input_dev *input_dev;
 	void __iomem *mmio_base;
 
 	int irq;
 
-	unsigned short keycodes[MAX_KEYPAD_KEYS];
-	int rotary_rel_code[2];
-
+	unsigned int matrix_key_rows;
+	unsigned int matrix_key_cols;
 	unsigned int row_shift;
 
+	unsigned int direct_key_num;
+	unsigned int direct_key_mask;
+	bool direct_key_low_active;
+
+	/* key debounce interval */
+	unsigned int debounce_interval;
+
+	unsigned short keycodes[MAX_KEYPAD_KEYS];
+
 	/* state row bits of each column scan */
 	u32 matrix_key_state[MAX_MATRIX_KEY_COLS];
 	u32 direct_key_state;
 
-	unsigned int direct_key_mask;
+	struct pxa27x_keypad_rotary rotary[MAX_ROTARY_ENCODERS];
 };
 
-#ifdef CONFIG_OF
-static int pxa27x_keypad_matrix_key_parse_dt(struct pxa27x_keypad *keypad,
-				struct pxa27x_keypad_platform_data *pdata)
+static int pxa27x_keypad_matrix_key_parse(struct pxa27x_keypad *keypad)
 {
 	struct input_dev *input_dev = keypad->input_dev;
 	struct device *dev = input_dev->dev.parent;
-	u32 rows, cols;
 	int error;
 
-	error = matrix_keypad_parse_properties(dev, &rows, &cols);
+	error = matrix_keypad_parse_properties(dev, &keypad->matrix_key_rows,
+					       &keypad->matrix_key_cols);
 	if (error)
 		return error;
 
-	if (rows > MAX_MATRIX_KEY_ROWS || cols > MAX_MATRIX_KEY_COLS) {
+	if (keypad->matrix_key_rows > MAX_MATRIX_KEY_ROWS ||
+	    keypad->matrix_key_cols > MAX_MATRIX_KEY_COLS) {
 		dev_err(dev, "rows or cols exceeds maximum value\n");
 		return -EINVAL;
 	}
 
-	pdata->matrix_key_rows = rows;
-	pdata->matrix_key_cols = cols;
+	keypad->row_shift = get_count_order(keypad->matrix_key_cols);
 
 	error = matrix_keypad_build_keymap(NULL,
-					   pdata->matrix_key_rows,
-					   pdata->matrix_key_cols,
+					   keypad->matrix_key_rows,
+					   keypad->matrix_key_cols,
 					   keypad->keycodes, input_dev);
 	if (error)
 		return error;
@@ -155,20 +170,17 @@ static int pxa27x_keypad_matrix_key_parse_dt(struct pxa27x_keypad *keypad,
 	return 0;
 }
 
-static int pxa27x_keypad_direct_key_parse_dt(struct pxa27x_keypad *keypad,
-				struct pxa27x_keypad_platform_data *pdata)
+static int pxa27x_keypad_direct_key_parse(struct pxa27x_keypad *keypad)
 {
 	struct input_dev *input_dev = keypad->input_dev;
 	struct device *dev = input_dev->dev.parent;
-	struct device_node *np = dev->of_node;
-	const __be16 *prop;
 	unsigned short code;
-	unsigned int proplen, size;
+	int count;
 	int i;
 	int error;
 
-	error = of_property_read_u32(np, "marvell,direct-key-count",
-				     &pdata->direct_key_num);
+	error = device_property_read_u32(dev, "marvell,direct-key-count",
+					 &keypad->direct_key_num);
 	if (error) {
 		/*
 		 * If do not have marvel,direct-key-count defined,
@@ -177,151 +189,121 @@ static int pxa27x_keypad_direct_key_parse_dt(struct pxa27x_keypad *keypad,
 		return error == -EINVAL ? 0 : error;
 	}
 
-	error = of_property_read_u32(np, "marvell,direct-key-mask",
-				     &pdata->direct_key_mask);
+	error = device_property_read_u32(dev, "marvell,direct-key-mask",
+					 &keypad->direct_key_mask);
 	if (error) {
 		if (error != -EINVAL)
 			return error;
 
 		/*
 		 * If marvell,direct-key-mask is not defined, driver will use
-		 * default value. Default value is set when configure the keypad.
+		 * a default value based on number of direct keys set up.
+		 * The default value is calculated in pxa27x_keypad_config().
 		 */
-		pdata->direct_key_mask = 0;
+		keypad->direct_key_mask = 0;
 	}
 
-	pdata->direct_key_low_active = of_property_read_bool(np,
-					"marvell,direct-key-low-active");
-
-	prop = of_get_property(np, "marvell,direct-key-map", &proplen);
-	if (!prop)
-		return -EINVAL;
+	keypad->direct_key_low_active =
+		device_property_read_bool(dev, "marvell,direct-key-low-active");
 
-	if (proplen % sizeof(u16))
+	count = device_property_count_u16(dev, "marvell,direct-key-map");
+	if (count <= 0 || count > MAX_DIRECT_KEY_NUM)
 		return -EINVAL;
 
-	size = proplen / sizeof(u16);
-
-	/* Only MAX_DIRECT_KEY_NUM is accepted.*/
-	if (size > MAX_DIRECT_KEY_NUM)
-		return -EINVAL;
+	error = device_property_read_u16_array(dev, "marvell,direct-key-map",
+					       &keypad->keycodes[MAX_MATRIX_KEY_NUM],
+					       count);
 
-	for (i = 0; i < size; i++) {
-		code = be16_to_cpup(prop + i);
-		keypad->keycodes[MAX_MATRIX_KEY_NUM + i] = code;
+	for (i = 0; i < count; i++) {
+		code = keypad->keycodes[MAX_MATRIX_KEY_NUM + i];
 		__set_bit(code, input_dev->keybit);
 	}
 
 	return 0;
 }
 
-static int pxa27x_keypad_rotary_parse_dt(struct pxa27x_keypad *keypad,
-				struct pxa27x_keypad_platform_data *pdata)
+static int pxa27x_keypad_rotary_parse(struct pxa27x_keypad *keypad)
 {
-	const __be32 *prop;
-	int i, relkey_ret;
-	unsigned int code, proplen;
-	const char *rotaryname[2] = {
-			"marvell,rotary0", "marvell,rotary1"};
-	const char relkeyname[] = {"marvell,rotary-rel-key"};
+	static const char * const rotaryname[] = { "marvell,rotary0", "marvell,rotary1" };
 	struct input_dev *input_dev = keypad->input_dev;
 	struct device *dev = input_dev->dev.parent;
-	struct device_node *np = dev->of_node;
-
-	relkey_ret = of_property_read_u32(np, relkeyname, &code);
-	/* if can read correct rotary key-code, we do not need this. */
-	if (relkey_ret == 0) {
-		unsigned short relcode;
+	struct pxa27x_keypad_rotary *encoder;
+	unsigned int code;
+	int i;
+	int error;
 
-		/* rotary0 taks lower half, rotary1 taks upper half. */
-		relcode = code & 0xffff;
-		pdata->rotary0_rel_code = (code & 0xffff);
-		__set_bit(relcode, input_dev->relbit);
+	error = device_property_read_u32(dev, "marvell,rotary-rel-key", &code);
+	if (!error) {
+		for (i = 0; i < MAX_ROTARY_ENCODERS; i++, code >>= 16) {
+			encoder = &keypad->rotary[i];
+			encoder->enabled = true;
+			encoder->rel_code = code & 0xffff;
+			input_set_capability(input_dev, EV_REL, encoder->rel_code);
+		}
 
-		relcode = code >> 16;
-		pdata->rotary1_rel_code = relcode;
-		__set_bit(relcode, input_dev->relbit);
+		return 0;
 	}
 
-	for (i = 0; i < 2; i++) {
-		prop = of_get_property(np, rotaryname[i], &proplen);
+	for (i = 0; i < MAX_ROTARY_ENCODERS; i++) {
+		encoder = &keypad->rotary[i];
+
 		/*
 		 * If the prop is not set, it means keypad does not need
 		 * initialize the rotaryX.
 		 */
-		if (!prop)
+		if (!device_property_present(dev, rotaryname[i]))
 			continue;
 
-		code = be32_to_cpup(prop);
+		error = device_property_read_u32(dev, rotaryname[i], &code);
+		if (error)
+			return error;
+
 		/*
 		 * Not all up/down key code are valid.
 		 * Now we depends on direct-rel-code.
 		 */
-		if ((!(code & 0xffff) || !(code >> 16)) && relkey_ret) {
-			return relkey_ret;
-		} else {
-			unsigned int n = MAX_MATRIX_KEY_NUM + (i << 1);
-			unsigned short keycode;
-
-			keycode = code & 0xffff;
-			keypad->keycodes[n] = keycode;
-			__set_bit(keycode, input_dev->keybit);
-
-			keycode = code >> 16;
-			keypad->keycodes[n + 1] = keycode;
-			__set_bit(keycode, input_dev->keybit);
-
-			if (i == 0)
-				pdata->rotary0_rel_code = -1;
-			else
-				pdata->rotary1_rel_code = -1;
-		}
-		if (i == 0)
-			pdata->enable_rotary0 = 1;
-		else
-			pdata->enable_rotary1 = 1;
-	}
+		if (!(code & 0xffff) || !(code >> 16))
+			return -EINVAL;
+
+		encoder->enabled = true;
+		encoder->rel_code = -1;
+		encoder->key_codes = &keypad->keycodes[MAX_MATRIX_KEY_NUM + i * 2];
+		encoder->key_codes[0] = code & 0xffff;
+		encoder->key_codes[1] = code >> 16;
 
-	keypad->rotary_rel_code[0] = pdata->rotary0_rel_code;
-	keypad->rotary_rel_code[1] = pdata->rotary1_rel_code;
+		input_set_capability(input_dev, EV_KEY, encoder->key_codes[0]);
+		input_set_capability(input_dev, EV_KEY, encoder->key_codes[1]);
+	}
 
 	return 0;
 }
 
-static int pxa27x_keypad_build_keycode_from_dt(struct pxa27x_keypad *keypad)
+static int pxa27x_keypad_parse_properties(struct pxa27x_keypad *keypad)
 {
 	struct input_dev *input_dev = keypad->input_dev;
 	struct device *dev = input_dev->dev.parent;
-	struct device_node *np = dev->of_node;
-	struct pxa27x_keypad_platform_data *pdata;
 	int error;
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "failed to allocate memory for pdata\n");
-		return -ENOMEM;
-	}
-
-	error = pxa27x_keypad_matrix_key_parse_dt(keypad, pdata);
+	error = pxa27x_keypad_matrix_key_parse(keypad);
 	if (error) {
 		dev_err(dev, "failed to parse matrix key\n");
 		return error;
 	}
 
-	error = pxa27x_keypad_direct_key_parse_dt(keypad, pdata);
+	error = pxa27x_keypad_direct_key_parse(keypad);
 	if (error) {
 		dev_err(dev, "failed to parse direct key\n");
 		return error;
 	}
 
-	error = pxa27x_keypad_rotary_parse_dt(keypad, pdata);
+	error = pxa27x_keypad_rotary_parse(keypad);
 	if (error) {
 		dev_err(dev, "failed to parse rotary key\n");
 		return error;
 	}
 
-	error = of_property_read_u32(np, "marvell,debounce-interval",
-				     &pdata->debounce_interval);
+	error = device_property_read_u32(dev, "marvell,debounce-interval",
+					 &keypad->debounce_interval);
 	if (error) {
 		dev_err(dev, "failed to parse debounce-interval\n");
 		return error;
@@ -333,91 +315,11 @@ static int pxa27x_keypad_build_keycode_from_dt(struct pxa27x_keypad *keypad)
 	 */
 	input_dev->keycodemax = ARRAY_SIZE(keypad->keycodes);
 
-	keypad->pdata = pdata;
-	return 0;
-}
-
-#else
-
-static int pxa27x_keypad_build_keycode_from_dt(struct pxa27x_keypad *keypad)
-{
-	dev_info(keypad->input_dev->dev.parent, "missing platform data\n");
-
-	return -EINVAL;
-}
-
-#endif
-
-static int pxa27x_keypad_build_keycode(struct pxa27x_keypad *keypad)
-{
-	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
-	struct input_dev *input_dev = keypad->input_dev;
-	unsigned short keycode;
-	int i;
-	int error;
-
-	error = matrix_keypad_build_keymap(pdata->matrix_keymap_data,
-					   pdata->matrix_key_rows,
-					   pdata->matrix_key_cols,
-					   keypad->keycodes, input_dev);
-	if (error)
-		return error;
-
-	/*
-	 * The keycodes may not only include matrix keys but also the direct
-	 * or rotary keys.
-	 */
-	input_dev->keycodemax = ARRAY_SIZE(keypad->keycodes);
-
-	/* For direct keys. */
-	for (i = 0; i < pdata->direct_key_num; i++) {
-		keycode = pdata->direct_key_map[i];
-		keypad->keycodes[MAX_MATRIX_KEY_NUM + i] = keycode;
-		__set_bit(keycode, input_dev->keybit);
-	}
-
-	if (pdata->enable_rotary0) {
-		if (pdata->rotary0_up_key && pdata->rotary0_down_key) {
-			keycode = pdata->rotary0_up_key;
-			keypad->keycodes[MAX_MATRIX_KEY_NUM + 0] = keycode;
-			__set_bit(keycode, input_dev->keybit);
-
-			keycode = pdata->rotary0_down_key;
-			keypad->keycodes[MAX_MATRIX_KEY_NUM + 1] = keycode;
-			__set_bit(keycode, input_dev->keybit);
-
-			keypad->rotary_rel_code[0] = -1;
-		} else {
-			keypad->rotary_rel_code[0] = pdata->rotary0_rel_code;
-			__set_bit(pdata->rotary0_rel_code, input_dev->relbit);
-		}
-	}
-
-	if (pdata->enable_rotary1) {
-		if (pdata->rotary1_up_key && pdata->rotary1_down_key) {
-			keycode = pdata->rotary1_up_key;
-			keypad->keycodes[MAX_MATRIX_KEY_NUM + 2] = keycode;
-			__set_bit(keycode, input_dev->keybit);
-
-			keycode = pdata->rotary1_down_key;
-			keypad->keycodes[MAX_MATRIX_KEY_NUM + 3] = keycode;
-			__set_bit(keycode, input_dev->keybit);
-
-			keypad->rotary_rel_code[1] = -1;
-		} else {
-			keypad->rotary_rel_code[1] = pdata->rotary1_rel_code;
-			__set_bit(pdata->rotary1_rel_code, input_dev->relbit);
-		}
-	}
-
-	__clear_bit(KEY_RESERVED, input_dev->keybit);
-
 	return 0;
 }
 
 static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 {
-	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
 	struct input_dev *input_dev = keypad->input_dev;
 	int row, col, num_keys_pressed = 0;
 	u32 new_state[MAX_MATRIX_KEY_COLS];
@@ -435,8 +337,8 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 		row = KPAS_RP(kpas);
 
 		/* if invalid row/col, treat as no key pressed */
-		if (col >= pdata->matrix_key_cols ||
-		    row >= pdata->matrix_key_rows)
+		if (col >= keypad->matrix_key_cols ||
+		    row >= keypad->matrix_key_rows)
 			goto scan;
 
 		new_state[col] = BIT(row);
@@ -459,7 +361,7 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 		new_state[7] = (kpasmkp3 >> 16) & KPASMKP_MKC_MASK;
 	}
 scan:
-	for (col = 0; col < pdata->matrix_key_cols; col++) {
+	for (col = 0; col < keypad->matrix_key_cols; col++) {
 		u32 bits_changed;
 		int code;
 
@@ -467,7 +369,7 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 		if (bits_changed == 0)
 			continue;
 
-		for (row = 0; row < pdata->matrix_key_rows; row++) {
+		for (row = 0; row < keypad->matrix_key_rows; row++) {
 			if ((bits_changed & BIT(row)) == 0)
 				continue;
 
@@ -496,14 +398,16 @@ static inline int rotary_delta(u32 kprec)
 
 static void report_rotary_event(struct pxa27x_keypad *keypad, int r, int delta)
 {
+	struct pxa27x_keypad_rotary *encoder = &keypad->rotary[r];
 	struct input_dev *dev = keypad->input_dev;
 
-	if (delta == 0)
+	if (!encoder->enabled || delta == 0)
 		return;
 
-	if (keypad->rotary_rel_code[r] == -1) {
-		int code = MAX_MATRIX_KEY_NUM + 2 * r + (delta > 0 ? 0 : 1);
-		unsigned char keycode = keypad->keycodes[code];
+	if (encoder->rel_code == -1) {
+		int idx = delta > 0 ? 0 : 1;
+		int code = MAX_MATRIX_KEY_NUM + 2 * r + idx;
+		unsigned char keycode = encoder->key_codes[idx];
 
 		/* simulate a press-n-release */
 		input_event(dev, EV_MSC, MSC_SCAN, code);
@@ -513,30 +417,28 @@ static void report_rotary_event(struct pxa27x_keypad *keypad, int r, int delta)
 		input_report_key(dev, keycode, 0);
 		input_sync(dev);
 	} else {
-		input_report_rel(dev, keypad->rotary_rel_code[r], delta);
+		input_report_rel(dev, encoder->rel_code, delta);
 		input_sync(dev);
 	}
 }
 
 static void pxa27x_keypad_scan_rotary(struct pxa27x_keypad *keypad)
 {
-	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
 	u32 kprec;
+	int i;
 
 	/* read and reset to default count value */
 	kprec = keypad_readl(KPREC);
 	keypad_writel(KPREC, DEFAULT_KPREC);
 
-	if (pdata->enable_rotary0)
+	for (i = 0; i < MAX_ROTARY_ENCODERS; i++) {
 		report_rotary_event(keypad, 0, rotary_delta(kprec));
-
-	if (pdata->enable_rotary1)
-		report_rotary_event(keypad, 1, rotary_delta(kprec >> 16));
+		kprec >>= 16;
+	}
 }
 
 static void pxa27x_keypad_scan_direct(struct pxa27x_keypad *keypad)
 {
-	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
 	struct input_dev *input_dev = keypad->input_dev;
 	unsigned int new_state;
 	u32 kpdk, bits_changed;
@@ -544,14 +446,14 @@ static void pxa27x_keypad_scan_direct(struct pxa27x_keypad *keypad)
 
 	kpdk = keypad_readl(KPDK);
 
-	if (pdata->enable_rotary0 || pdata->enable_rotary1)
+	if (keypad->rotary[0].enabled || keypad->rotary[1].enabled)
 		pxa27x_keypad_scan_rotary(keypad);
 
 	/*
 	 * The KPDR_DK only output the key pin level, so it relates to board,
 	 * and low level may be active.
 	 */
-	if (pdata->direct_key_low_active)
+	if (keypad->direct_key_low_active)
 		new_state = ~KPDK_DK(kpdk) & keypad->direct_key_mask;
 	else
 		new_state = KPDK_DK(kpdk) & keypad->direct_key_mask;
@@ -561,7 +463,7 @@ static void pxa27x_keypad_scan_direct(struct pxa27x_keypad *keypad)
 	if (bits_changed == 0)
 		return;
 
-	for (i = 0; i < pdata->direct_key_num; i++) {
+	for (i = 0; i < keypad->direct_key_num; i++) {
 		if (bits_changed & BIT(i)) {
 			int code = MAX_MATRIX_KEY_NUM + i;
 
@@ -574,21 +476,11 @@ static void pxa27x_keypad_scan_direct(struct pxa27x_keypad *keypad)
 	keypad->direct_key_state = new_state;
 }
 
-static void clear_wakeup_event(struct pxa27x_keypad *keypad)
-{
-	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
-
-	if (pdata->clear_wakeup_event)
-		(pdata->clear_wakeup_event)();
-}
-
 static irqreturn_t pxa27x_keypad_irq_handler(int irq, void *dev_id)
 {
 	struct pxa27x_keypad *keypad = dev_id;
 	unsigned long kpc = keypad_readl(KPC);
 
-	clear_wakeup_event(keypad);
-
 	if (kpc & KPC_DI)
 		pxa27x_keypad_scan_direct(keypad);
 
@@ -600,7 +492,6 @@ static irqreturn_t pxa27x_keypad_irq_handler(int irq, void *dev_id)
 
 static void pxa27x_keypad_config(struct pxa27x_keypad *keypad)
 {
-	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
 	unsigned int mask = 0, direct_key_num = 0;
 	unsigned long kpc = 0;
 
@@ -608,35 +499,33 @@ static void pxa27x_keypad_config(struct pxa27x_keypad *keypad)
 	keypad_readl(KPC);
 
 	/* enable matrix keys with automatic scan */
-	if (pdata->matrix_key_rows && pdata->matrix_key_cols) {
+	if (keypad->matrix_key_rows && keypad->matrix_key_cols) {
 		kpc |= KPC_ASACT | KPC_MIE | KPC_ME | KPC_MS_ALL;
-		kpc |= KPC_MKRN(pdata->matrix_key_rows) |
-		       KPC_MKCN(pdata->matrix_key_cols);
+		kpc |= KPC_MKRN(keypad->matrix_key_rows) |
+		       KPC_MKCN(keypad->matrix_key_cols);
 	}
 
 	/* enable rotary key, debounce interval same as direct keys */
-	if (pdata->enable_rotary0) {
+	if (keypad->rotary[0].enabled) {
 		mask |= 0x03;
 		direct_key_num = 2;
 		kpc |= KPC_REE0;
 	}
 
-	if (pdata->enable_rotary1) {
+	if (keypad->rotary[1].enabled) {
 		mask |= 0x0c;
 		direct_key_num = 4;
 		kpc |= KPC_REE1;
 	}
 
-	if (pdata->direct_key_num > direct_key_num)
-		direct_key_num = pdata->direct_key_num;
+	if (keypad->direct_key_num > direct_key_num)
+		direct_key_num = keypad->direct_key_num;
 
 	/*
 	 * Direct keys usage may not start from KP_DKIN0, check the platfrom
 	 * mask data to config the specific.
 	 */
-	if (pdata->direct_key_mask)
-		keypad->direct_key_mask = pdata->direct_key_mask;
-	else
+	if (!keypad->direct_key_mask)
 		keypad->direct_key_mask = GENMASK(direct_key_num - 1, 0) & ~mask;
 
 	/* enable direct key */
@@ -645,7 +534,7 @@ static void pxa27x_keypad_config(struct pxa27x_keypad *keypad)
 
 	keypad_writel(KPC, kpc | KPC_RE_ZERO_DEB);
 	keypad_writel(KPREC, DEFAULT_KPREC);
-	keypad_writel(KPKDI, pdata->debounce_interval);
+	keypad_writel(KPKDI, keypad->debounce_interval);
 }
 
 static int pxa27x_keypad_open(struct input_dev *dev)
@@ -719,19 +608,12 @@ static int pxa27x_keypad_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(pxa27x_keypad_pm_ops,
 				pxa27x_keypad_suspend, pxa27x_keypad_resume);
 
-
 static int pxa27x_keypad_probe(struct platform_device *pdev)
 {
-	const struct pxa27x_keypad_platform_data *pdata =
-					dev_get_platdata(&pdev->dev);
-	struct device_node *np = pdev->dev.of_node;
 	struct pxa27x_keypad *keypad;
 	struct input_dev *input_dev;
-	int irq, error;
-
-	/* Driver need build keycode from device tree or pdata */
-	if (!np && !pdata)
-		return -EINVAL;
+	int irq;
+	int error;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -746,7 +628,6 @@ static int pxa27x_keypad_probe(struct platform_device *pdev)
 	if (!input_dev)
 		return -ENOMEM;
 
-	keypad->pdata = pdata;
 	keypad->input_dev = input_dev;
 	keypad->irq = irq;
 
@@ -775,29 +656,12 @@ static int pxa27x_keypad_probe(struct platform_device *pdev)
 	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REP);
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
 
-	if (pdata) {
-		error = pxa27x_keypad_build_keycode(keypad);
-	} else {
-		error = pxa27x_keypad_build_keycode_from_dt(keypad);
-		/*
-		 * Data that we get from DT resides in dynamically
-		 * allocated memory so we need to update our pdata
-		 * pointer.
-		 */
-		pdata = keypad->pdata;
-	}
+	error = pxa27x_keypad_parse_properties(keypad);
 	if (error) {
-		dev_err(&pdev->dev, "failed to build keycode\n");
+		dev_err(&pdev->dev, "failed to parse keypad properties\n");
 		return error;
 	}
 
-	keypad->row_shift = get_count_order(pdata->matrix_key_cols);
-
-	if ((pdata->enable_rotary0 && keypad->rotary_rel_code[0] != -1) ||
-	    (pdata->enable_rotary1 && keypad->rotary_rel_code[1] != -1)) {
-		input_dev->evbit[0] |= BIT_MASK(EV_REL);
-	}
-
 	error = devm_request_irq(&pdev->dev, irq, pxa27x_keypad_irq_handler,
 				 0, pdev->name, keypad);
 	if (error) {
diff --git a/include/linux/platform_data/keypad-pxa27x.h b/include/linux/platform_data/keypad-pxa27x.h
deleted file mode 100644
index a376442b9935..000000000000
--- a/include/linux/platform_data/keypad-pxa27x.h
+++ /dev/null
@@ -1,73 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_ARCH_PXA27x_KEYPAD_H
-#define __ASM_ARCH_PXA27x_KEYPAD_H
-
-#include <linux/input.h>
-#include <linux/input/matrix_keypad.h>
-
-#define MAX_MATRIX_KEY_ROWS	(8)
-#define MAX_MATRIX_KEY_COLS	(8)
-#define MATRIX_ROW_SHIFT	(3)
-#define MAX_DIRECT_KEY_NUM	(8)
-
-/* pxa3xx keypad platform specific parameters
- *
- * NOTE:
- * 1. direct_key_num indicates the number of keys in the direct keypad
- *    _plus_ the number of rotary-encoder sensor inputs,  this can be
- *    left as 0 if only rotary encoders are enabled,  the driver will
- *    automatically calculate this
- *
- * 2. direct_key_map is the key code map for the direct keys, if rotary
- *    encoder(s) are enabled, direct key 0/1(2/3) will be ignored
- *
- * 3. rotary can be either interpreted as a relative input event (e.g.
- *    REL_WHEEL/REL_HWHEEL) or specific keys (e.g. UP/DOWN/LEFT/RIGHT)
- *
- * 4. matrix key and direct key will use the same debounce_interval by
- *    default, which should be sufficient in most cases
- *
- * pxa168 keypad platform specific parameter
- *
- * NOTE:
- * clear_wakeup_event callback is a workaround required to clear the
- * keypad interrupt. The keypad wake must be cleared in addition to
- * reading the MI/DI bits in the KPC register.
- */
-struct pxa27x_keypad_platform_data {
-
-	/* code map for the matrix keys */
-	const struct matrix_keymap_data *matrix_keymap_data;
-	unsigned int	matrix_key_rows;
-	unsigned int	matrix_key_cols;
-
-	/* direct keys */
-	int		direct_key_num;
-	unsigned int	direct_key_map[MAX_DIRECT_KEY_NUM];
-	/* the key output may be low active */
-	int		direct_key_low_active;
-	/* give board a chance to choose the start direct key */
-	unsigned int	direct_key_mask;
-
-	/* rotary encoders 0 */
-	int		enable_rotary0;
-	int		rotary0_rel_code;
-	int		rotary0_up_key;
-	int		rotary0_down_key;
-
-	/* rotary encoders 1 */
-	int		enable_rotary1;
-	int		rotary1_rel_code;
-	int		rotary1_up_key;
-	int		rotary1_down_key;
-
-	/* key debounce interval */
-	unsigned int	debounce_interval;
-
-	/* clear wakeup event requirement for pxa168 */
-	void		(*clear_wakeup_event)(void);
-};
-
-extern void pxa_set_keypad_info(struct pxa27x_keypad_platform_data *info);
-
-#endif /* __ASM_ARCH_PXA27x_KEYPAD_H */
-- 
2.51.0.rc1.163.g2494970778-goog


