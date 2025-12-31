Return-Path: <linux-input+bounces-16749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E947DCEC173
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 15:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDF2E3005AA1
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 14:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651A52701DA;
	Wed, 31 Dec 2025 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RdJMcsfr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD22274B3A
	for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191749; cv=none; b=hLqwvVWWTqxGBOX2gJ3o2mCbSZ9cEQ8GOPFxoElOpK1XYI6lq7IPeFaT04JpkDqbNxPufUe2nG2Z6+u1QvGGiZaCgUPUIwNjlj0e3lEl0aBYh2XWfKC4/itOgaOlcJqlQKA/BsKx6/tvveEir+kyoMzqsqigsvcGSH9rdw4ZraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191749; c=relaxed/simple;
	bh=O9+tUzr9uyN79tAtBKwl7ESmge84gPW0hNkQZxKq8CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwFOyEADiZo97HRxPhjXYOuezp7zVTy5c6L8CVMiwKPCnegruAKwra6jbOdDHD3ORmxRk0M8RSlFWXDhhfC0A3OMgcbcnYYYHlHpCJnl6tjNW4PZpFc9GzuSjarypBzt5geiRcwLGY0g4zz/4nDuRMqeAKlbytWgMA08jrD4Zpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RdJMcsfr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso2569055e9.0
        for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 06:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767191746; x=1767796546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvGLfgzU/Nu7QjgFI0e6yZbyhUHf+uCJkmxPNiQDL2c=;
        b=RdJMcsfrPkCtFkjXUElS0uWFM/Q8fmK+P2retxoWo9SFsk6DIEaz/JUXbYB2I42rxY
         vFYKz3nTE7J5+bS78BJRKiBg68eeTBaO7Dq9zZXvxBJCe+uaA+kl2p8qFLP4MJvp3cZN
         4WwFnodCNNmceqqNsWdRD/QAjODdKJQIskoeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191746; x=1767796546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XvGLfgzU/Nu7QjgFI0e6yZbyhUHf+uCJkmxPNiQDL2c=;
        b=XtNz72vhm2fS0oRb18ipqYpxTcZ0HtpSSOorFQho/Em0nrm/YQUcWBPvJNeOGsrf+I
         qebYlbq1fwxda6qhzQTx0IhW9S+br0ldd0gR5IL/qVIi2S1vRhPHGa1/HOomEtcLx3FI
         SHXso3g/JbhOQbtJDgsxSN6IJvpmpazCYU3Oo1dPemo40Hk4L9e25bxZfX1MXHNuwTJ6
         u93b272fcC8dOH9+p4vO+sOUeM7D6Q9c5HwQmGff8C5sVoR/JX/A4kZbZlyRrgoZvvSG
         dssd0akyufMKeq7FzLL+TUqqqqrSswAewTqLOoSF083kfVKtDjmAbFV5F3yHnaTq8CFI
         wfbw==
X-Forwarded-Encrypted: i=1; AJvYcCXHrU0ZB2shGQo78onzotYv+aNc4gLFwBp083sDKu2CQbi1o5GcWAgvC/IXi1UZVvWWye0JjgYq/q6RzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxY+TjtuC5Kzrs1edYIL3M1JuiOsvl1p5EYX+nSoop+JPvYMr
	4Yb867qvfyI/TVkjQu7odQUV0qRAeAPvNApOXE62U/9KRBRSga6mziCf/FcGevDfTswEPrBIMsc
	+/zk=
X-Gm-Gg: AY/fxX5NA+P+kygCUCMa0YFnMchdP+aLirwebq4iturd/fWVevzEzKfXLf7StSyJTtZ
	pCs0Cs6xpkBV1Q4qN4jTQBkosAcFa6z0vu62MBVm0F1bMyEvjx3+7xsTQw6+Atyx/CvF3Ry94YV
	HyZDkTTgcAn6dYrLTnfGpYvEOXdpXgFAwBr7J3Mzd2sa3W3DaNQt4Lb4g+ZCz6eACS7ibgeLbGW
	rD88wOuLRFkWYqVQWV91lMeMQa4DG4gPd0k6k0wkdUgUqTyQ7xJHh+cZc38G5BBIwbue5E1b1qb
	xrUNfrOtk3DAOSISZ7VuQWTFp5/U6NBHm22GtW6alk93DIGuIp3F50paonGYuo35iEiPiCizTrx
	hbnnzsZfpig2RcoKsmIiT8fHy1Y42bZdtHOPj7P9B7korCqqA5qqYN/X5GOXQkVd0+Raq276owg
	2h5ekAbD+qYJKjgFY=
X-Google-Smtp-Source: AGHT+IHvR+cy7a7pyZUdGh+DjWUEBxNKW4LqjmW8R2bBcuhZXgZlkJueqcwfNCjJuqSQO+WmZPKOQg==
X-Received: by 2002:a05:600c:4fc6:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-47d19576cc6mr425787465e9.17.1767191745659;
        Wed, 31 Dec 2025 06:35:45 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm630300935e9.13.2025.12.31.06.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:35:45 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] Input: cros_ec_keyb - add function key support
Date: Wed, 31 Dec 2025 14:35:38 +0000
Message-ID: <20251231143538.37483-3-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251231143538.37483-1-fabiobaltieri@chromium.org>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
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
 drivers/input/keyboard/cros_ec_keyb.c | 136 +++++++++++++++++++++++---
 1 file changed, 120 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..bc76f61583c3 100644
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
+ * @has_fn_map: whether the driver use an fn function map layer
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
@@ -166,16 +182,100 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
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
+ * Return the Fn code for a normal key row, col combination.
+ */
+static unsigned int cros_ec_keyb_fn_code(struct cros_ec_keyb *ckdev,
+					 int row, int col)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+	int pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
+
+	return keycodes[pos];
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
+				code = cros_ec_keyb_fn_code(ckdev, row, col);
+
+				ckdev->fn_key_status[col] &= ~BIT(row);
+			} else if (ckdev->normal_key_status[col] & BIT(row)) {
+				ckdev->normal_key_status[col] &= ~BIT(row);
+			} else {
+				/* Discard, key press code was not sent */
+				return;
+			}
+		} else if (ckdev->fn_key_pressed) {
+			code = cros_ec_keyb_fn_code(ckdev, row, col);
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
@@ -192,20 +292,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 
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
@@ -597,12 +690,19 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	struct device *dev = ckdev->dev;
 	struct input_dev *idev;
 	const char *phys;
+	unsigned int rows_keymap;
 	int err;
 
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
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
@@ -635,7 +735,11 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	ckdev->has_fn_map = device_property_read_bool(dev, "google,has-fn-map");
+
+	rows_keymap = ckdev->has_fn_map ? ckdev->rows * 2 : ckdev->rows;
+
+	err = matrix_keypad_build_keymap(NULL, NULL, rows_keymap, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
-- 
2.52.0.351.gbe84eed79e-goog


