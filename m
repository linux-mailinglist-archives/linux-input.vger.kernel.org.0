Return-Path: <linux-input+bounces-14047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB496B2855F
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 19:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 966BDBA1F7B
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 17:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56BC1F4CB7;
	Fri, 15 Aug 2025 17:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX6cRv0c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AE292B38;
	Fri, 15 Aug 2025 17:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755280024; cv=none; b=WIb+fY7/Jyt/ByQFA0zE1qBHMqWxkHjGlpQsa4ftzgG6uYYHWgKzMviwlWx0c1kOrboyZgm5Gm3m38bm5GcJh4UNY3zry2qLQx2H/+Xl3HY3UOhpt6R/vYh1pcgdRQYe32AJDq5aeuYJ0pOcN5kWml8qZulN9fRYzhWOpyM2Czo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755280024; c=relaxed/simple;
	bh=ZbEU7D3Of2TdzJeHEZ048b7BNERUf+24IMsTSOetFUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfgiQtnIEGe1jUus9d2UAAu/FT2OH9Eo631ucdGUbjjTg4eHWR22uzZ+0MGe+rM6iz4x3OVMoUzICRdA9F+YYw0Le2Uiqq/CFYaEH8BWuRHuzPo07rVEJ4wwBcvOdJD6T2JFdAWY/987zf9S2I6sAPzZDvTzoBpwnhB+hM0lmFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX6cRv0c; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e39ec6f52so1845010b3a.1;
        Fri, 15 Aug 2025 10:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755280022; x=1755884822; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNBr5+Cv5gahAvB6qfqdM6eusudcQXW9Q24nrLtRcg4=;
        b=PX6cRv0c6+DSqdlu40qxWVI4Cc//Z7nD5DkC30p8+Cumae/uZ7r5s7Zg+UueHqW0zH
         hxLwUyQxefoAN7VyBtWHkE35+7VF21Hv+5Jj3fTusOzXHFdTZOmqy+dLoCBxicpF6WS4
         y6fcClSJT2JP7Q62879ZkL7/qxS1lCnm/GzKUtyF644r5bpgBmZcqvFKcT3DUwytyFay
         eT24Z5mMRXN1TojWmOi5R/XoiQxNgkQqqQM9tUBMgVdPEwO9PYNHVfz/jXYL8gRnaQX5
         g/b6vn9EoXXRZfNe+IAmVTN+DqKxXhv1hfdyH7B+SMqTBr3vVL6jmesg6r6nLn/eTYFz
         RA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755280022; x=1755884822;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNBr5+Cv5gahAvB6qfqdM6eusudcQXW9Q24nrLtRcg4=;
        b=IfihnDDt4f9WpFxVoBqquOg/eEwl2Bk66EwJ9Lcx6/R9oYttpIe7+BV89zjgtz//Bz
         SQeLSBjL63dOjuE8zpe11+m4EFpxz+kEOvIV+8Q0IW8cpye+m2GPoBIQwwIDdukNrTOH
         YTbV2WxTfP3g46E3ZCslS0auLJG9Xal1WBfv3mzq4g9fDJuhMfXog7+Z/7qNg3iNK8DV
         KcC3COvKNMF11Xo61XhQyZDRZ9sYSkkR+nSQRQn/chxsg0jQwRUfLwQzqYfTIXSwq0N/
         miVSwBcPI+jmNsjP5AxeYZEk2Fw6H9VH8UIgTdI0j65z/L9Ust1+z9TXDu/46hpIaNAm
         X+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWekSQ0kInjYPTslWIwIBjjQXqqdw5Khh1x6W2+7oqXzfO5mTlvxCd+pSo6twdQ3xbhMAn8+9EKiHNKl+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwwqjhs6g5SmctWUyk6ONqlgEJBYZW72jFZRgrwmB0F5l8Xn9o
	tTxzairj738yixjUsGRrjg2HfIz1Oj+m6NzLbINBQkxdBYZCxJxTAuU5AzzDkg==
X-Gm-Gg: ASbGncu/yYuKZcE3MpDV5D9yHmX3C3qKzqIIv0YPux8TJbeGY9LYFU8/RkJNNVd9jGa
	jpVZ3xaqFAb+WO1DYE+D34u3R8TW+6iWPMgqpInxuxa24dRL4JwXyivQGkYh0GfTXWbpRB49MIS
	LTDIKK81ynHoM1DJNA6uacv2fefpuLnSNVyLR8TbYNHoyWpMEFE1KG1hzdXfD7ocmAc9/GCnKST
	ZxPy9uBeePqOcIsX0Ngye38PcIs+He1Qf74KH8iT3Hl8TndAd7L63zM4ABWrH1BT1cjrFAbO+vs
	T2Eu+jKbAREGov4KqQZCBbzCzH1tPvmoj2IKu44bC/AVIChTlYzYbtEoG2VCjmUgpR/KFLE3G2y
	okOqKXGjK/hmGbebMt3Ggo4d+o0aKeb7SoA==
X-Google-Smtp-Source: AGHT+IFOIf3u2z99FHPCOkw3OYn0L9MfXPKexwdKsnXnOvua5ttcYV7F4N9HyYc6XjIvVfcDwsY3kQ==
X-Received: by 2002:a05:6a00:2342:b0:76b:f0ac:e7b2 with SMTP id d2e1a72fcca58-76e447cd663mr4022026b3a.13.1755280021575;
        Fri, 15 Aug 2025 10:47:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6f7f:8c7a:d4f6:cd0a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45567dbdsm1546327b3a.57.2025.08.15.10.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:47:01 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:46:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Robin van der Gracht <robin@protonic.nl>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: matrix-keymap - remove unused keymap_name parameter
Message-ID: <vaakfeog4twpfpvcwn676arueynbzig2omphl4baqimapj3zvk@7hzkcp4yb3gc>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The keymap_name parameter of matrix_keypad_build_keymap() is used to
specify the device tree property containing the keymap. If NULL, it
defaults to 'linux,keymap'.

All current callers pass NULL for this parameter, relying on the default
value. Remove the redundant parameter from the function declaration,
definition, and all call sites to simplify the API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Robin, Andy, Geert, ht16k33 is the only driver using this API that is
outside of drivers/input. Would you mind if I merge the patch through my
tree and not try t introduce intermediate API variant and split
the merge across multiple releases?

 drivers/auxdisplay/ht16k33.c                |  2 +-
 drivers/input/keyboard/adp5585-keys.c       |  2 +-
 drivers/input/keyboard/adp5588-keys.c       |  2 +-
 drivers/input/keyboard/bcm-keypad.c         |  2 +-
 drivers/input/keyboard/clps711x-keypad.c    |  2 +-
 drivers/input/keyboard/cros_ec_keyb.c       |  2 +-
 drivers/input/keyboard/ep93xx_keypad.c      |  2 +-
 drivers/input/keyboard/imx_keypad.c         |  2 +-
 drivers/input/keyboard/lm8333.c             |  2 +-
 drivers/input/keyboard/lpc32xx-keys.c       |  2 +-
 drivers/input/keyboard/matrix_keypad.c      |  2 +-
 drivers/input/keyboard/max7359_keypad.c     |  2 +-
 drivers/input/keyboard/mt6779-keypad.c      |  2 +-
 drivers/input/keyboard/nspire-keypad.c      |  2 +-
 drivers/input/keyboard/omap-keypad.c        |  2 +-
 drivers/input/keyboard/omap4-keypad.c       |  2 +-
 drivers/input/keyboard/pinephone-keyboard.c |  2 +-
 drivers/input/keyboard/pmic8xxx-keypad.c    |  2 +-
 drivers/input/keyboard/pxa27x_keypad.c      |  4 ++--
 drivers/input/keyboard/samsung-keypad.c     |  2 +-
 drivers/input/keyboard/spear-keyboard.c     |  2 +-
 drivers/input/keyboard/st-keyscan.c         |  2 +-
 drivers/input/keyboard/stmpe-keypad.c       |  2 +-
 drivers/input/keyboard/tc3589x-keypad.c     |  2 +-
 drivers/input/keyboard/tca8418_keypad.c     |  2 +-
 drivers/input/keyboard/tegra-kbc.c          |  2 +-
 drivers/input/keyboard/twl4030_keypad.c     |  2 +-
 drivers/input/matrix-keymap.c               | 16 ++++------------
 include/linux/input/matrix_keypad.h         |  1 -
 29 files changed, 32 insertions(+), 41 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 0b8ba754b343..eff8e93bc172 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -536,7 +536,7 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	keypad->cols = cols;
 	keypad->row_shift = get_count_order(cols);
 
-	err = matrix_keypad_build_keymap(NULL, NULL, rows, cols, NULL,
+	err = matrix_keypad_build_keymap(NULL, rows, cols, NULL,
 					 keypad->dev);
 	if (err) {
 		dev_err(dev, "failed to build keymap\n");
diff --git a/drivers/input/keyboard/adp5585-keys.c b/drivers/input/keyboard/adp5585-keys.c
index 4208229e1356..cc7bcb2792e9 100644
--- a/drivers/input/keyboard/adp5585-keys.c
+++ b/drivers/input/keyboard/adp5585-keys.c
@@ -169,7 +169,7 @@ static int adp5585_keys_parse_fw(const struct adp5585_dev *adp5585,
 
 	cols = cols + 1 - kpad->info->max_rows;
 
-	error = matrix_keypad_build_keymap(NULL, NULL, rows, cols,
+	error = matrix_keypad_build_keymap(NULL, rows, cols,
 					   kpad->keycode, kpad->input);
 	if (error)
 		return error;
diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 2b2aca08423a..0582b5455f41 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -664,7 +664,7 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 		return -EINVAL;
 	}
 
-	ret = matrix_keypad_build_keymap(NULL, NULL, kpad->rows, kpad->cols,
+	ret = matrix_keypad_build_keymap(NULL, kpad->rows, kpad->cols,
 					 kpad->keycode, kpad->input);
 	if (ret)
 		return ret;
diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
index 6b46f83a9edb..b0a6f48a2dcf 100644
--- a/drivers/input/keyboard/bcm-keypad.c
+++ b/drivers/input/keyboard/bcm-keypad.c
@@ -344,7 +344,7 @@ static int bcm_kp_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   kp->n_rows, kp->n_cols,
 					   NULL, input_dev);
 	if (error) {
diff --git a/drivers/input/keyboard/clps711x-keypad.c b/drivers/input/keyboard/clps711x-keypad.c
index 4c1a3e611edd..d069e04ab417 100644
--- a/drivers/input/keyboard/clps711x-keypad.c
+++ b/drivers/input/keyboard/clps711x-keypad.c
@@ -137,7 +137,7 @@ static int clps711x_keypad_probe(struct platform_device *pdev)
 	input->id.product	= 0x0001;
 	input->id.version	= 0x0100;
 
-	err = matrix_keypad_build_keymap(NULL, NULL, priv->row_count,
+	err = matrix_keypad_build_keymap(NULL, priv->row_count,
 					 CLPS711X_KEYPAD_COL_COUNT,
 					 NULL, input);
 	if (err)
diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index c1e53d87c8a7..718fb360b568 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -629,7 +629,7 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	err = matrix_keypad_build_keymap(NULL, ckdev->rows, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 817c23438f6e..dba9f9ddc10a 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -237,7 +237,7 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	input_dev->open = ep93xx_keypad_open;
 	input_dev->close = ep93xx_keypad_close;
 
-	err = matrix_keypad_build_keymap(NULL, NULL,
+	err = matrix_keypad_build_keymap(NULL,
 					 EP93XX_MATRIX_ROWS, EP93XX_MATRIX_COLS,
 					 keypad->keycodes, input_dev);
 	if (err)
diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 069c1d6376e1..9d60b151c730 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -462,7 +462,7 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	input_dev->open = imx_keypad_open;
 	input_dev->close = imx_keypad_close;
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   MAX_MATRIX_KEY_ROWS,
 					   MAX_MATRIX_KEY_COLS,
 					   keypad->keycodes, input_dev);
diff --git a/drivers/input/keyboard/lm8333.c b/drivers/input/keyboard/lm8333.c
index 384baabf9924..26002077dcbc 100644
--- a/drivers/input/keyboard/lm8333.c
+++ b/drivers/input/keyboard/lm8333.c
@@ -158,7 +158,7 @@ static int lm8333_probe(struct i2c_client *client)
 
 	input_set_capability(input, EV_MSC, MSC_SCAN);
 
-	err = matrix_keypad_build_keymap(pdata->matrix_data, NULL,
+	err = matrix_keypad_build_keymap(pdata->matrix_data,
 					 LM8333_NUM_ROWS, LM8333_NUM_COLS,
 					 lm8333->keycodes, input);
 	if (err)
diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
index 2392e7ec3b19..758f12278bfb 100644
--- a/drivers/input/keyboard/lpc32xx-keys.c
+++ b/drivers/input/keyboard/lpc32xx-keys.c
@@ -202,7 +202,7 @@ static int lpc32xx_kscan_probe(struct platform_device *pdev)
 
 	input_set_capability(input, EV_MSC, MSC_SCAN);
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   kscandat->matrix_sz,
 					   kscandat->matrix_sz,
 					   kscandat->keymap, kscandat->input);
diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index e50a6fea9a60..644813644345 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -438,7 +438,7 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 	input_dev->open		= matrix_keypad_start;
 	input_dev->close	= matrix_keypad_stop;
 
-	err = matrix_keypad_build_keymap(NULL, NULL,
+	err = matrix_keypad_build_keymap(NULL,
 					 keypad->num_row_gpios,
 					 keypad->num_col_gpios,
 					 NULL, input_dev);
diff --git a/drivers/input/keyboard/max7359_keypad.c b/drivers/input/keyboard/max7359_keypad.c
index c10726b5e4d1..2f81cdcaf62e 100644
--- a/drivers/input/keyboard/max7359_keypad.c
+++ b/drivers/input/keyboard/max7359_keypad.c
@@ -208,7 +208,7 @@ static int max7359_probe(struct i2c_client *client)
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
 	input_set_drvdata(input_dev, keypad);
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(keymap_data,
 					   MAX7359_MAX_KEY_ROWS,
 					   MAX7359_MAX_KEY_COLS,
 					   keypad->keycodes,
diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index e5eb025c5e99..942d1d3b7d0a 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -185,7 +185,7 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
 		keypad->n_rows, keypad->n_cols, debounce);
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   keypad->n_rows, keypad->n_cols,
 					   NULL, keypad->input_dev);
 	if (error) {
diff --git a/drivers/input/keyboard/nspire-keypad.c b/drivers/input/keyboard/nspire-keypad.c
index 096c18d7bca1..9f3e9b30d472 100644
--- a/drivers/input/keyboard/nspire-keypad.c
+++ b/drivers/input/keyboard/nspire-keypad.c
@@ -226,7 +226,7 @@ static int nspire_keypad_probe(struct platform_device *pdev)
 	__set_bit(EV_REP, input->evbit);
 	input_set_capability(input, EV_MSC, MSC_SCAN);
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   KEYPAD_BITMASK_ROWS,
 					   KEYPAD_BITMASK_COLS,
 					   NULL, input);
diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index 9e13f3f70a81..6d318c649425 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -233,7 +233,7 @@ static int omap_kp_probe(struct platform_device *pdev)
 	if (pdata->rep)
 		__set_bit(EV_REP, input_dev->evbit);
 
-	ret = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
+	ret = matrix_keypad_build_keymap(pdata->keymap_data,
 					 pdata->rows, pdata->cols,
 					 omap_kp->keymap, input_dev);
 	if (ret < 0)
diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index bffe89c0717a..cf1fe98e662f 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -440,7 +440,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   keypad_data->rows, keypad_data->cols,
 					   keypad_data->keymap, input_dev);
 	if (error) {
diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
index 147b1f288a33..c1e37a13e6fb 100644
--- a/drivers/input/keyboard/pinephone-keyboard.c
+++ b/drivers/input/keyboard/pinephone-keyboard.c
@@ -405,7 +405,7 @@ static int ppkb_probe(struct i2c_client *client)
 	input_set_capability(ppkb->input, EV_MSC, MSC_SCAN);
 	__set_bit(EV_REP, ppkb->input->evbit);
 
-	error = matrix_keypad_build_keymap(&ppkb_keymap_data, NULL,
+	error = matrix_keypad_build_keymap(&ppkb_keymap_data,
 					   2 * PPKB_ROWS, PPKB_COLS, NULL,
 					   ppkb->input);
 	if (error) {
diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
index 35d1aa2a22a5..2bc84a2db4f4 100644
--- a/drivers/input/keyboard/pmic8xxx-keypad.c
+++ b/drivers/input/keyboard/pmic8xxx-keypad.c
@@ -562,7 +562,7 @@ static int pmic8xxx_kp_probe(struct platform_device *pdev)
 	kp->input->open		= pmic8xxx_kp_open;
 	kp->input->close	= pmic8xxx_kp_close;
 
-	rc = matrix_keypad_build_keymap(NULL, NULL,
+	rc = matrix_keypad_build_keymap(NULL,
 					PM8XXX_MAX_ROWS, PM8XXX_MAX_COLS,
 					kp->keycodes, kp->input);
 	if (rc) {
diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 38ec619aa359..d4eb839ffbf5 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -135,7 +135,7 @@ static int pxa27x_keypad_matrix_key_parse_dt(struct pxa27x_keypad *keypad,
 	pdata->matrix_key_rows = rows;
 	pdata->matrix_key_cols = cols;
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   pdata->matrix_key_rows,
 					   pdata->matrix_key_cols,
 					   keypad->keycodes, input_dev);
@@ -346,7 +346,7 @@ static int pxa27x_keypad_build_keycode(struct pxa27x_keypad *keypad)
 	int i;
 	int error;
 
-	error = matrix_keypad_build_keymap(pdata->matrix_keymap_data, NULL,
+	error = matrix_keypad_build_keymap(pdata->matrix_keymap_data,
 					   pdata->matrix_key_rows,
 					   pdata->matrix_key_cols,
 					   keypad->keycodes, input_dev);
diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 5b3f83112b42..67a1072fccc1 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -266,7 +266,7 @@ static int samsung_keypad_parse_keymap(struct samsung_keypad *keypad)
 	}
 
 	retval = matrix_keypad_build_keymap(key_count ? &keymap_data : NULL,
-					    NULL, keypad->rows, keypad->cols,
+					    keypad->rows, keypad->cols,
 					    keypad->keycodes,
 					    keypad->input_dev);
 	kfree(keymap_data.keymap);
diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 2fae337562a2..e3abc1484520 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -234,7 +234,7 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	input_dev->open = spear_kbd_open;
 	input_dev->close = spear_kbd_close;
 
-	error = matrix_keypad_build_keymap(keymap, NULL, NUM_ROWS, NUM_COLS,
+	error = matrix_keypad_build_keymap(keymap, NUM_ROWS, NUM_COLS,
 					   kbd->keycodes, input_dev);
 	if (error) {
 		dev_err(&pdev->dev, "Failed to build keymap\n");
diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index e53ef4c670e4..3a10cd3fe58f 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -157,7 +157,7 @@ static int keyscan_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	error = matrix_keypad_build_keymap(NULL, NULL,
+	error = matrix_keypad_build_keymap(NULL,
 					   keypad_data->n_rows,
 					   keypad_data->n_cols,
 					   NULL, input_dev);
diff --git a/drivers/input/keyboard/stmpe-keypad.c b/drivers/input/keyboard/stmpe-keypad.c
index 0acded4fb9c9..15f492dc7e64 100644
--- a/drivers/input/keyboard/stmpe-keypad.c
+++ b/drivers/input/keyboard/stmpe-keypad.c
@@ -367,7 +367,7 @@ static int stmpe_keypad_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	error = matrix_keypad_build_keymap(NULL, NULL, rows, cols,
+	error = matrix_keypad_build_keymap(NULL, rows, cols,
 					   keypad->keymap, input);
 	if (error)
 		return error;
diff --git a/drivers/input/keyboard/tc3589x-keypad.c b/drivers/input/keyboard/tc3589x-keypad.c
index 11988cffdfae..042665d146ea 100644
--- a/drivers/input/keyboard/tc3589x-keypad.c
+++ b/drivers/input/keyboard/tc3589x-keypad.c
@@ -410,7 +410,7 @@ static int tc3589x_keypad_probe(struct platform_device *pdev)
 	input->open = tc3589x_keypad_open;
 	input->close = tc3589x_keypad_close;
 
-	error = matrix_keypad_build_keymap(plat->keymap_data, NULL,
+	error = matrix_keypad_build_keymap(plat->keymap_data,
 					   TC3589x_MAX_KPROW, TC3589x_MAX_KPCOL,
 					   NULL, input);
 	if (error) {
diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 68c0afafee7b..6a1ecd0d5a15 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -317,7 +317,7 @@ static int tca8418_keypad_probe(struct i2c_client *client)
 	input->id.product = 0x001;
 	input->id.version = 0x0001;
 
-	error = matrix_keypad_build_keymap(NULL, NULL, rows, cols, NULL, input);
+	error = matrix_keypad_build_keymap(NULL, rows, cols, NULL, input);
 	if (error) {
 		dev_err(dev, "Failed to build keymap\n");
 		return error;
diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index bc1c80a456f2..663e0c6abab7 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -648,7 +648,7 @@ static int tegra_kbc_probe(struct platform_device *pdev)
 	if (kbc->keymap_data && kbc->use_fn_map)
 		keymap_rows *= 2;
 
-	err = matrix_keypad_build_keymap(kbc->keymap_data, NULL,
+	err = matrix_keypad_build_keymap(kbc->keymap_data,
 					 keymap_rows,
 					 kbc->hw_support->max_columns,
 					 kbc->keycode, kbc->idev);
diff --git a/drivers/input/keyboard/twl4030_keypad.c b/drivers/input/keyboard/twl4030_keypad.c
index 77e0743a3cf8..852f107e8e05 100644
--- a/drivers/input/keyboard/twl4030_keypad.c
+++ b/drivers/input/keyboard/twl4030_keypad.c
@@ -379,7 +379,7 @@ static int twl4030_kp_probe(struct platform_device *pdev)
 	if (kp->irq < 0)
 		return kp->irq;
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(keymap_data,
 					   TWL4030_MAX_ROWS,
 					   1 << TWL4030_ROW_SHIFT,
 					   kp->keymap, input);
diff --git a/drivers/input/matrix-keymap.c b/drivers/input/matrix-keymap.c
index 3bea3575a0a9..8de9bad3865a 100644
--- a/drivers/input/matrix-keymap.c
+++ b/drivers/input/matrix-keymap.c
@@ -66,10 +66,10 @@ int matrix_keypad_parse_properties(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(matrix_keypad_parse_properties);
 
-static int matrix_keypad_parse_keymap(const char *propname,
-				      unsigned int rows, unsigned int cols,
+static int matrix_keypad_parse_keymap(unsigned int rows, unsigned int cols,
 				      struct input_dev *input_dev)
 {
+	static const char propname[] = "linux,keymap";
 	struct device *dev = input_dev->dev.parent;
 	unsigned int row_shift = get_count_order(cols);
 	unsigned int max_keys = rows << row_shift;
@@ -77,9 +77,6 @@ static int matrix_keypad_parse_keymap(const char *propname,
 	int size;
 	int error;
 
-	if (!propname)
-		propname = "linux,keymap";
-
 	size = device_property_count_u32(dev, propname);
 	if (size <= 0) {
 		dev_err(dev, "missing or malformed property %s: %d\n",
@@ -116,8 +113,6 @@ static int matrix_keypad_parse_keymap(const char *propname,
 /**
  * matrix_keypad_build_keymap - convert platform keymap into matrix keymap
  * @keymap_data: keymap supplied by the platform code
- * @keymap_name: name of device tree property containing keymap (if device
- *	tree support is enabled).
  * @rows: number of rows in target keymap array
  * @cols: number of cols in target keymap array
  * @keymap: expanded version of keymap that is suitable for use by
@@ -129,8 +124,7 @@ static int matrix_keypad_parse_keymap(const char *propname,
  * keyboard driver that uses row and col as indices.
  *
  * If @keymap_data is not supplied and device tree support is enabled
- * it will attempt load the keymap from property specified by @keymap_name
- * argument (or "linux,keymap" if @keymap_name is %NULL).
+ * it will attempt load the keymap from "linux,keymap" property.
  *
  * If @keymap is %NULL the function will automatically allocate managed
  * block of memory to store the keymap. This memory will be associated with
@@ -141,7 +135,6 @@ static int matrix_keypad_parse_keymap(const char *propname,
  * function.
  */
 int matrix_keypad_build_keymap(const struct matrix_keymap_data *keymap_data,
-			       const char *keymap_name,
 			       unsigned int rows, unsigned int cols,
 			       unsigned short *keymap,
 			       struct input_dev *input_dev)
@@ -180,8 +173,7 @@ int matrix_keypad_build_keymap(const struct matrix_keymap_data *keymap_data,
 				return -EINVAL;
 		}
 	} else {
-		error = matrix_keypad_parse_keymap(keymap_name, rows, cols,
-						   input_dev);
+		error = matrix_keypad_parse_keymap(rows, cols, input_dev);
 		if (error)
 			return error;
 	}
diff --git a/include/linux/input/matrix_keypad.h b/include/linux/input/matrix_keypad.h
index 90867f44ab4d..04562627dd77 100644
--- a/include/linux/input/matrix_keypad.h
+++ b/include/linux/input/matrix_keypad.h
@@ -35,7 +35,6 @@ struct matrix_keymap_data {
 };
 
 int matrix_keypad_build_keymap(const struct matrix_keymap_data *keymap_data,
-			       const char *keymap_name,
 			       unsigned int rows, unsigned int cols,
 			       unsigned short *keymap,
 			       struct input_dev *input_dev);
-- 
2.51.0.rc1.163.g2494970778-goog


-- 
Dmitry

