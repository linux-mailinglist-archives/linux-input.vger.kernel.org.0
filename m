Return-Path: <linux-input+bounces-9233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6186BA1111F
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 20:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A3D3A79FE
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 19:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC5B200BB8;
	Tue, 14 Jan 2025 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c34Gvt11"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEAA1FA8DE
	for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882829; cv=none; b=DLH8QmNakdjg1aN2QWGO2yj5DeJwynZy7COjuVGfwU5nybEctH//qvoP8jgQhUVOun7dBEsSWSiKtmGsQjm6a0LsAHptybwW9dBLjG7Yk4YAn6bxKoOpcYH0FkMqu90zWWP35cKfBGF/qWAfiZyBhrIOxi2Lee2VuWhMlPSzos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882829; c=relaxed/simple;
	bh=gVJP5Jg81qGZKKRUEwfmgfnWVlw734FUnPO1b91n00Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tWs78MpV/EgWQwOMA4+ywnFCUk9gZo7egg9LcRkrEebQI0v5n2z5Yi0xMAPYjFvhrOL0a7Jt5fnrl3HcKy7SstUf3djQvC8bMMZlGAw9dprO5lNFQBuIh3SgBTSdLEn3ExUpjxamtJOubmMy45m1pVX2GYlMN5RA4Xcvf8vjDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c34Gvt11; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385dc85496dso290513f8f.3
        for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 11:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882825; x=1737487625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bATdNNm6oROH7DmGPi86a2d525hCzDgyz+yfNCQAV8=;
        b=c34Gvt11xT0pyUOV0QiYYkuuEHvkFSx9lVLvehWeqLkq40H8NcZaz9Jw4xyLlNKY2z
         v9HB4DETDiJB/M2iU2NpyQ5+vTK8aRff97Cyb60jx6/ePDOlsWXWluoUcUMbeS6c6pgU
         cWiopWQhQooOTvIPdA/cPiUSyPSNjGBDlpX+WtJKd+b3DpLNVxdSfmaDdDt/aYvOKsg7
         IcIBk3h540cv2zyPiE+0fbQHsy92E1nmTWaJwd7bvd6MuC5B0L3bq9VgJDDXjl3JK4tg
         vAXY+RzAWvHx0XaqE/0NJcikT5HpOvfyzRgT3fuR2ZTyfsIiqJquEYWYh8DScqt/e8U8
         eITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882825; x=1737487625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bATdNNm6oROH7DmGPi86a2d525hCzDgyz+yfNCQAV8=;
        b=hxfwhGVN9NJNqOi+ywH86KGy7xNboYd3Z5Xc4iUx/vW4hwRbK/0iXM6rw769U6eKUS
         /ArR5LPlWzwlf6xoJfoHzKUIxVFlZOWV4U4Zjx8ZXYhZjyRnNRD1mLlUOUJy+qgfT6c2
         rPsFbz20T6K+7cVlyluozZrg7ihAxQEiTwbQ712EPYU7fH1nMiVKCOaXWd8MIuzKYpFe
         y1D0dNG3tkVY+C48UKgWCo9hyXD/I/KUuFIvFRXOrXzMXGEfjHOZpBsNlUZQstfsCaEO
         oFUTdOE43DLCIy/Ofv2xaX6ax8H5628C1SNMRZiTH6IlfQqku0a0W5NiJXk/6bV4qhou
         mvLg==
X-Forwarded-Encrypted: i=1; AJvYcCWoh6L462N44tLtB63+MpzCF/dyRtNXn0tAoSJCTy9q35GTFI4SfL9FuWAoaZbFcUaJ5qI8Piz2/6fzyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGFCzS74CXxoQ6hQXJhpnYxKdKZ04qv+COmH34hJ96JUZh6XE
	wxmubuzfgx5ZM4vczhPbKBPk4wjr2O641ELb0IGt4C5HhiB6hAJx9x526GMaMlE=
X-Gm-Gg: ASbGnctV2O31dFmOb13zkGg8KjV4Wf0MUkzKlbW9P7CjQhEYYQ3u1R1SUksI2MYN+0r
	sKWKWOm01ZZKHvpq/AvuoAVvS2ERng3uoL93Vvm0Ijnblcc96rgl3b1FtQuzLNgma0tkKfEXd42
	TEr5k5SI2fLUMMUCQDMGhh+r7VZ+uHg4zRuNdQIupZ6yN/CDyme2hxsFGpL8bOWNh18aAIeVIjL
	iMzj4i8qb6ObwEpH1kcBq5RxcTNi0rW+QG49ZO1T0436C+BY9paEYCi6CVu2MIWifnCt9U=
X-Google-Smtp-Source: AGHT+IGb8aq00KxoF5vxDMZtXfYyxv0xsd0RB8pv4GDq4SzRtVE48lDFpnjuIxIeZoA6YQ2UxGGtBA==
X-Received: by 2002:a5d:47a6:0:b0:385:faec:d93d with SMTP id ffacd0b85a97d-38a8731c585mr8176695f8f.13.1736882825551;
        Tue, 14 Jan 2025 11:27:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b82ddsm15555179f8f.71.2025.01.14.11.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:27:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Input: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:27:01 +0100
Message-ID: <20250114192701.912430-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/keyboard/dlink-dir685-touchkeys.c | 3 ++-
 drivers/input/keyboard/lm8323.c                 | 3 ++-
 drivers/input/misc/max77693-haptic.c            | 3 ++-
 drivers/input/misc/regulator-haptic.c           | 3 ++-
 drivers/input/mouse/elan_i2c_core.c             | 3 ++-
 drivers/input/touchscreen/egalax_ts.c           | 3 ++-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/dlink-dir685-touchkeys.c b/drivers/input/keyboard/dlink-dir685-touchkeys.c
index 993cdbda509e..4184dd2eaeeb 100644
--- a/drivers/input/keyboard/dlink-dir685-touchkeys.c
+++ b/drivers/input/keyboard/dlink-dir685-touchkeys.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/input.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/bitops.h>
 
 struct dir685_touchkeys {
@@ -48,7 +49,7 @@ static irqreturn_t dir685_tk_irq_thread(int irq, void *data)
 	changed = tk->cur_key ^ key;
 	for_each_set_bit(i, &changed, num_bits) {
 		dev_dbg(tk->dev, "key %d is %s\n", i,
-			test_bit(i, &key) ? "down" : "up");
+			str_down_up(test_bit(i, &key)));
 		input_report_key(tk->input, tk->codes[i], test_bit(i, &key));
 	}
 
diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index e26bf2956344..e19442c6f80f 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -21,6 +21,7 @@
 #include <linux/platform_data/lm8323.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 /* Commands to send to the chip. */
 #define LM8323_CMD_READ_ID		0x80 /* Read chip ID. */
@@ -269,7 +270,7 @@ static void process_keys(struct lm8323_chip *lm)
 		unsigned short keycode = lm->keymap[key];
 
 		dev_vdbg(&lm->client->dev, "key 0x%02x %s\n",
-			 key, isdown ? "down" : "up");
+			 key, str_down_up(isdown));
 
 		if (lm->kp_enabled) {
 			input_event(lm->idev, EV_MSC, MSC_SCAN, key);
diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index 0e646f1b257b..cdb9be737e48 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/workqueue.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/max77693.h>
@@ -94,7 +95,7 @@ static int max77843_haptic_bias(struct max77693_haptic *haptic, bool on)
 				   on << MAINCTRL1_BIASEN_SHIFT);
 	if (error) {
 		dev_err(haptic->dev, "failed to %s bias: %d\n",
-			on ? "enable" : "disable", error);
+			str_enable_disable(on), error);
 		return error;
 	}
 
diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index 3666ba6d1f30..9711f5c7c78a 100644
--- a/drivers/input/misc/regulator-haptic.c
+++ b/drivers/input/misc/regulator-haptic.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #define MAX_MAGNITUDE_SHIFT	16
 
@@ -44,7 +45,7 @@ static int regulator_haptic_toggle(struct regulator_haptic *haptic, bool on)
 		if (error) {
 			dev_err(haptic->dev,
 				"failed to switch regulator %s: %d\n",
-				on ? "on" : "off", error);
+				str_on_off(on), error);
 			return error;
 		}
 
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index a841883660fb..fee1796da3d0 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
+#include <linux/string_choices.h>
 #include <linux/input.h>
 #include <linux/uaccess.h>
 #include <linux/jiffies.h>
@@ -199,7 +200,7 @@ static int elan_set_power(struct elan_tp_data *data, bool on)
 	} while (--repeat > 0);
 
 	dev_err(&data->client->dev, "failed to set power %s: %d\n",
-		on ? "on" : "off", error);
+		str_on_off(on), error);
 	return error;
 }
 
diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index f4e950920e84..eb3cc2befcdf 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -23,6 +23,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/bitops.h>
 #include <linux/input/mt.h>
 
@@ -102,7 +103,7 @@ static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
 	input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, down);
 
 	dev_dbg(&client->dev, "%s id:%d x:%d y:%d z:%d",
-		down ? "down" : "up", id, x, y, z);
+		str_down_up(down), id, x, y, z);
 
 	if (down) {
 		input_report_abs(input_dev, ABS_MT_POSITION_X, x);
-- 
2.43.0


