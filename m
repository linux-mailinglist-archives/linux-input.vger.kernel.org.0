Return-Path: <linux-input+bounces-16958-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD776D1182A
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BA173048BBF
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 09:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF8A271A7C;
	Mon, 12 Jan 2026 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rrxja8tx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008625B2F4
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 09:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210397; cv=none; b=cfx4S+ghUSCJws4dkvtn0RT504LRaeOR2iZyIgc6hG1tZ2yDY7TEuaJqlGKmOHS2RI7jYNKRGHZ8h9NpF4K0DFWAZNCAKdCz4e0KauNh7PbOsP9x9M9lubq2/NQX7SsYNsxdSKTTAcMnKA3riMPEIVer3bZjEmKYBV+5Y5H7Ae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210397; c=relaxed/simple;
	bh=h0BsuMOdFIZFpm8SL89CVB40l/jUixNjdg0sAkfN5/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFtWc3p4aEOrNLhaFp8K1EsAk4XUbCd4zvZEMbrMs2VcY6tasp+ejENdUVgFePVk1NUxUYxNT2IP/u8rR3Ybx8mKLhD5/RBRNSV6euvy2wkh6ndqSVCRa+00FwPx7osx/Z/a9cQV8E+2bbLgCWZE1MotuX93K6Z2gvpmb2U6mhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rrxja8tx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb5810d39so3163687f8f.2
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768210394; x=1768815194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nl3ngVJNLpXQU2SZMuSDLRvJaqSe1mw8ao7+H3/RXRg=;
        b=Rrxja8txwWFb/Xu8Jl+UlzdqhvvwIPueUcqSV4RWZC/T9v4WPeXdQb7qC9ReNN6I/V
         IdQSV7GM+BHicybKNyihx8boZmzPcbbLRYOetOtEaPO19UX/+WtQZPx5ew0U47hyTwH6
         PgEokJySeibbycqTsxIuDvmI2zpAtCCLrGrsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210394; x=1768815194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nl3ngVJNLpXQU2SZMuSDLRvJaqSe1mw8ao7+H3/RXRg=;
        b=Mu7ZXh8nz4832X/yKWIJDofx5KV2CTbo/W8KUwMrx4bD5UrES3sWZmxn1uDujNkO4g
         X+MhdEJTGLoUo65eXVQuXjvcBDgnZOZEEW6UsBV7ZbkniFALLEQyQwMG0qn0y9v5QNjm
         eBcyNKK12XsHQmuPK4CK/LKJKp/UZPcRpmyQ3eFC7+l+wjVdFQOW2SaSRVCJjlqKlZrG
         fEwA2MabzZcBo4qxheLppmUo6un9PbhGBEJrxv+ndS1VVWcqT3B39JIvHWc57RP6l4Ke
         KN8mA+GE+XUP75YP6OI42gS+mvtUxw/cp9Ptu6JKUjBUSo7dD5kfk0MRl1VXSDGR9AVh
         XVLg==
X-Forwarded-Encrypted: i=1; AJvYcCULnw9WmDU2JIOCIDnrSyyNz9unPPlGfDj7WdxmROIBp4Txdj0XwNvHe7snipyMFKUug5wxZzG2ypCxwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvXF8QWBtVkyj7CXDQ/wizrRtnfUw7TxLkvW7knE6GCvbsoQh
	08V4i0vZUwf8XKSMjqJCZvmDswrA6ZCrLP5Idm94Puv/KHlJbwAqomFtdySUGtKn9A==
X-Gm-Gg: AY/fxX69XkfLh/4726540QxGnCHH9jZREn9WFzKD9A48nz0TIkAz5/pJ2N16v4njWaw
	2YAFQXPwlFKZcFBaA7a1pCfPj5Jv0K6RWt3X/C0hXrXDKOlu3QWigLlKRSRvopZmQKZ3+Zc0M/I
	B0mbQOtBdCo8nYCsJzVeQ1kekp2NKXVErFKE8gMQRF8KJmVbeqQlz1pDfQUCi5TlTSvPg6zsfJ7
	nMGEcy6m95xFHqe8RPc4q3DDpFheCQKYOEfGG3sRWl5Zhq6CXSzVVjCrMnuR1YbG+6TMjGjfThY
	wC1jLzHfXNj6W4MtTAHKTUFAeklWSPZYsLWqCOXI+c/CY2e+z0VdObvA2vcPX2ew5nCK4YibtaL
	cEKA1rawetDUAbtTc18Eb/qKjEehaYiL0RdJF5DZE6QZTo2f13uyGdtAJT19Qnufzsa5NqJcB5y
	0ppxPy7Yx4SMGLy2s=
X-Google-Smtp-Source: AGHT+IGHjojzoarfyqXZHU/dDA0FLz8AS1GIB0FZy7guqzhdsULMLXZSHc9FSdB6QWLMh3bSuBq0CA==
X-Received: by 2002:a05:6000:420c:b0:431:67d:5390 with SMTP id ffacd0b85a97d-432c37757demr24039697f8f.54.1768210394411;
        Mon, 12 Jan 2026 01:33:14 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm38608881f8f.12.2026.01.12.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:33:13 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/1] Input: cros_ec_keyb - add function key support
Date: Mon, 12 Jan 2026 09:33:09 +0000
Message-ID: <20260112093309.240905-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112093309.240905-1-fabiobaltieri@chromium.org>
References: <20260112093309.240905-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for handling an Fn button and sending separate keycodes for
a subset of keys in the matrix defined in the upper half of the keymap.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
 1 file changed, 158 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..93540f0c5a33 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -29,6 +29,11 @@
 
 #include <linux/unaligned.h>
 
+/* Maximum size of the normal key matrix, this is limited by the host command
+ * key_matrix field defined in ec_response_get_next_data_v3
+ */
+#define CROS_EC_KEYBOARD_COLS_MAX 18
+
 /**
  * struct cros_ec_keyb - Structure representing EC keyboard device
  *
@@ -44,6 +49,11 @@
  * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
  * @notifier: interrupt event notifier for transport devices
  * @vdata: vivaldi function row data
+ * @has_fn_map: whether the driver uses an fn function-map layer
+ * @normal_key_status: active normal keys map
+ * @fn_key_status: active function keys map
+ * @fn_key_pressed: tracks the function key status
+ * @fn_key_triggered: tracks where any function key fired
  */
 struct cros_ec_keyb {
 	unsigned int rows;
@@ -61,6 +71,12 @@ struct cros_ec_keyb {
 	struct notifier_block notifier;
 
 	struct vivaldi_data vdata;
+
+	bool has_fn_map;
+	u8 normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
+	u8 fn_key_status[CROS_EC_KEYBOARD_COLS_MAX];
+	bool fn_key_pressed;
+	bool fn_key_triggered;
 };
 
 /**
@@ -166,16 +182,104 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
 	return false;
 }
 
+/*
+ * Process a function key state change, send an event report if appropriate.
+ */
+static void cros_ec_keyb_process_fn_key(struct cros_ec_keyb *ckdev,
+					int row, int col, bool state)
+{
+	struct input_dev *idev = ckdev->idev;
+	int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+
+	ckdev->fn_key_pressed = state;
+
+	if (state) {
+		ckdev->fn_key_triggered = false;
+	} else if (!ckdev->fn_key_triggered) {
+		/*
+		 * Send the original code if nothing else has been pressed
+		 * together with Fn.
+		 */
+		input_event(idev, EV_MSC, MSC_SCAN, pos);
+		input_report_key(idev, KEY_FN, true);
+		input_sync(idev);
+
+		input_event(idev, EV_MSC, MSC_SCAN, pos);
+		input_report_key(idev, KEY_FN, false);
+	}
+}
+
+/*
+ * Return the Fn code for a normal key row, col combination, optionally set a
+ * position code too.
+ */
+static unsigned int cros_ec_keyb_fn_code(struct cros_ec_keyb *ckdev,
+					 int row, int col, int *pos)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+	int fn_pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
+
+	if (pos)
+		*pos = fn_pos;
+
+	return keycodes[fn_pos];
+}
+
+/*
+ * Process the new state for a single key.
+ */
+static void cros_ec_keyb_process_one(struct cros_ec_keyb *ckdev,
+				     int row, int col, bool state)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+	int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+	unsigned int code = keycodes[pos];
+
+	dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n", row, col, state);
+
+	if (ckdev->has_fn_map) {
+		if (code == KEY_FN)
+			return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
+
+		if (!state) {
+			if (ckdev->fn_key_status[col] & BIT(row)) {
+				code = cros_ec_keyb_fn_code(ckdev, row, col, &pos);
+
+				ckdev->fn_key_status[col] &= ~BIT(row);
+			} else if (ckdev->normal_key_status[col] & BIT(row)) {
+				ckdev->normal_key_status[col] &= ~BIT(row);
+			} else {
+				/* Discard, key press code was not sent */
+				return;
+			}
+		} else if (ckdev->fn_key_pressed) {
+			code = cros_ec_keyb_fn_code(ckdev, row, col, &pos);
+
+			ckdev->fn_key_triggered = true;
+
+			if (!code)
+				return;
+
+			ckdev->fn_key_status[col] |= BIT(row);
+		} else {
+			ckdev->normal_key_status[col] |= BIT(row);
+		}
+	}
+
+	input_event(idev, EV_MSC, MSC_SCAN, pos);
+	input_report_key(idev, code, state);
+}
 
 /*
  * Compares the new keyboard state to the old one and produces key
- * press/release events accordingly.  The keyboard state is 13 bytes (one byte
- * per column)
+ * press/release events accordingly.  The keyboard state is one byte
+ * per column.
  */
 static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 			 uint8_t *kb_state, int len)
 {
-	struct input_dev *idev = ckdev->idev;
 	int col, row;
 	int new_state;
 	int old_state;
@@ -192,20 +296,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 
 	for (col = 0; col < ckdev->cols; col++) {
 		for (row = 0; row < ckdev->rows; row++) {
-			int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
-			const unsigned short *keycodes = idev->keycode;
-
 			new_state = kb_state[col] & (1 << row);
 			old_state = ckdev->old_kb_state[col] & (1 << row);
-			if (new_state != old_state) {
-				dev_dbg(ckdev->dev,
-					"changed: [r%d c%d]: byte %02x\n",
-					row, col, new_state);
-
-				input_event(idev, EV_MSC, MSC_SCAN, pos);
-				input_report_key(idev, keycodes[pos],
-						 new_state);
-			}
+
+			if (new_state == old_state)
+				continue;
+
+			cros_ec_keyb_process_one(ckdev, row, col, new_state);
 		}
 		ckdev->old_kb_state[col] = kb_state[col];
 	}
@@ -582,6 +679,43 @@ static void cros_ec_keyb_parse_vivaldi_physmap(struct cros_ec_keyb *ckdev)
 	ckdev->vdata.num_function_row_keys = n_physmap;
 }
 
+/* Returns true if there is a KEY_FN code defined in the normal keymap */
+static bool cros_ec_keyb_has_fn_key(struct cros_ec_keyb *ckdev)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+
+	for (int row = 0; row < ckdev->rows; row++) {
+		for (int col = 0; col < ckdev->cols; col++) {
+			int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+
+			if (keycodes[pos] == KEY_FN)
+				return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * Returns true if there is a KEY_FN defined and at least one key in the fn
+ * layer keymap
+ */
+static bool cros_ec_keyb_has_fn_map(struct cros_ec_keyb *ckdev)
+{
+	if (!cros_ec_keyb_has_fn_key(ckdev))
+		return false;
+
+	for (int row = 0; row < ckdev->rows; row++) {
+		for (int col = 0; col < ckdev->cols; col++) {
+			if (cros_ec_keyb_fn_code(ckdev, row, col, NULL) != 0)
+				return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * cros_ec_keyb_register_matrix - Register matrix keys
  *
@@ -603,6 +737,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	if (err)
 		return err;
 
+	if (ckdev->cols > CROS_EC_KEYBOARD_COLS_MAX) {
+		dev_err(dev, "keypad,num-columns too large: %d (max: %d)\n",
+			ckdev->cols, CROS_EC_KEYBOARD_COLS_MAX);
+		return -EINVAL;
+	}
+
 	ckdev->valid_keys = devm_kzalloc(dev, ckdev->cols, GFP_KERNEL);
 	if (!ckdev->valid_keys)
 		return -ENOMEM;
@@ -635,7 +775,7 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows * 2, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
@@ -650,6 +790,8 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	cros_ec_keyb_compute_valid_keys(ckdev);
 	cros_ec_keyb_parse_vivaldi_physmap(ckdev);
 
+	ckdev->has_fn_map = cros_ec_keyb_has_fn_map(ckdev);
+
 	err = input_register_device(ckdev->idev);
 	if (err) {
 		dev_err(dev, "cannot register input device\n");
-- 
2.52.0.457.g6b5491de43-goog


