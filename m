Return-Path: <linux-input+bounces-14046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58605B28537
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 19:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D563AAC47
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 17:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791453176E9;
	Fri, 15 Aug 2025 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4BOyRdJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146F3176F2;
	Fri, 15 Aug 2025 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755279374; cv=none; b=PxPB0mg37Ge7Vd6pWv8h8eFG4jMFHWgV4XFkahgpA3BoUIzp140Kpl/n+TG3pm8LhQ+jvT0hAyJ35OHxkfpOzv0a9FHa/VveEHereHCWaXcZhTkrAtO3OVlSZ/zPYKrSiyqcCQ3TFdLoTNZOU271C+doBN6tq+7UaDWKJ6nBjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755279374; c=relaxed/simple;
	bh=OGLzyamRHTQAbugQGENHpZ4fLejLOyzRM7YBzN6tyKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngMjdjKonkpGYMu2EMo4uBuUAAXuEq1zvW/EB44Y4usS7A3t+MGMKERlz8tO6bGq71lrCGRWmxa8EBovPFX/HR39BgQOjXo3ho4yTPvreumRQkriy2JfZq1Cv5tr86FeJe6ORIYrdSMoR47eXgvWXDtGsclatjWamh8ZSjIPRqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4BOyRdJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244580523a0so20459595ad.1;
        Fri, 15 Aug 2025 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755279372; x=1755884172; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AY8C+q6c90Fpaihu28D66lvtwrk1G9GkmyWnx4PXZo=;
        b=R4BOyRdJhttGLU3qFGZuOgOgecgx4ztwaH3Av1kPquezrlxuvCnLHFp17+Njlk65np
         wIb0Bpsjgn6UBE3tUom5QPuGItcbGZ+EFDRVXdNMggw8u220NfPsGFqwA0s+4wOgcocz
         O/5deocfYeMrzmx3bue1gX8quIYG1ml41LbENKO2B8nL8oNVCAh3QHeTPVEkPT/rYjvw
         IGyxzA7affnM4fPVxM/TV/Rr4ASmCv463GvNNZt9Jxym+5RqVrSe8wlTdRF2y/siTKlt
         lnBqB2u3Fdp6r9plPTvRcmFtCWaZj47d3ttO+8P1qLlpLiyzQ6pnl7HsTKNSEo+NyM5/
         nT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755279372; x=1755884172;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AY8C+q6c90Fpaihu28D66lvtwrk1G9GkmyWnx4PXZo=;
        b=GKNKbzTReBVVp77m/C2dESi99qLCdOAQ9CdNdoH3SKXCNNenI0MYcH9ipi8AyqZJEJ
         M1ridg1Ee9zkf8+PMDn0Rvj6Ecvh2idm6WEFo0xbvSZrFTMPCc5CY3WyXqelZM5scPGY
         jN22OzPQZJQnhj6t14wvlH3jx7ATiV+RzTXug4+hUGJ96cqq8UOvGYY+kMv+v18m8R/C
         mFIKuILIGIfdoBAxWGcVg/FaY98Bcn+0qWFN46D4J95TanJ1X1y8+JqhEdEpt93fOsmd
         miBxIvgRT3HsHaDlKheX5ODs3QARNe5MW2RUr7j6G5kbRJKbNL5bCLISq+T0XrThLAGZ
         4mMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrDX9OGmZCz9utC0Bsp3K8rBNocyr/8m59vHqIL4/tk4pnS6C0V6LAa4rfVuN8BKYd82wQlEakErqyP+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQibXlGWcCZB6ZzMxzwiWyAwo6Y6nVnmUUilcwUb0ehu87z4E
	w4GgR0EIu4bmLQC8dTPLducPws7oW856GygtSYmRKcOUL90FTgQclv/ldy7qvw==
X-Gm-Gg: ASbGncvMb7CSaZPJYpUd6CTApWtCVXNGfqUH0N3mRIosYsrJJUT74qCS7EacPG0k17q
	cmFQ+WpXNjlhIY2QoIn75rtfmVr0V0TGc6rbWecCdW7nMQzbdVEMnZigqKO6QsSp1EC+ykkiTrV
	noGfOy6LNa0ITwZPmB10sUyhHBFemteut5Eaipz+8sNpRTr/jMlYzDHaFMhXfXWe8sAsOb2AQG0
	91MIsKouN2uiVgzkW/ZbUR9CZ2uQ0pIxF2F6jx1FFducpZ30qYho7k5lmIYBUGt81yr0pC6Smk9
	Pt6c1Dhw0XsJb1p+3uWxrjJMNDrQpMJuh7Z+Qhkm3uq62u3ByCUAsiMJzZaDbyDWbu2juIlgL8x
	CaXO3Ca24jiH3tq6gY2Uv+Qo=
X-Google-Smtp-Source: AGHT+IF1otiCElf9iLJc2Ocd4HqYWx3LehBUen1nhXeeCHjn5N4I9ecnTrAK2kComkRsXGpAJLS0vQ==
X-Received: by 2002:a17:902:c952:b0:240:3c51:1063 with SMTP id d9443c01a7336-2446d78f6e0mr40089335ad.23.1755279371766;
        Fri, 15 Aug 2025 10:36:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6f7f:8c7a:d4f6:cd0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d538e0bsm18279185ad.107.2025.08.15.10.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:36:11 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:36:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>, 
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: twl4030_keypad - drop support for platform data
Message-ID: <tica7ol7xwv5tqb7hlkzu6wkiv4quxwrpqv6croe4wfnwvj6wv@4ob6ktqqi3cr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Support for platform data from dropped from twl in 4a346a03a63c ("mfd:
twl: Remove platform data support") and board files were dropped even
earlier. There are no in-kernel users of twl4030_keypad_data in the
kernel, and the driver supports configuration via generic device
properties.

Drop support of static platform data from the keypad driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/twl4030_keypad.c | 35 +++++--------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/input/keyboard/twl4030_keypad.c b/drivers/input/keyboard/twl4030_keypad.c
index 852f107e8e05..3a5ab61d5347 100644
--- a/drivers/input/keyboard/twl4030_keypad.c
+++ b/drivers/input/keyboard/twl4030_keypad.c
@@ -28,10 +28,6 @@
  * an internal state machine that decodes pressed keys, including
  * multi-key combinations.
  *
- * This driver lets boards define what keycodes they wish to report for
- * which scancodes, as part of the "struct twl4030_keypad_data" used in
- * the probe() routine.
- *
  * See the TPS65950 documentation; that's the general availability
  * version of the TWL5030 second generation part.
  */
@@ -47,7 +43,6 @@
 struct twl4030_keypad {
 	unsigned short	keymap[TWL4030_KEYMAP_SIZE];
 	u16		kp_state[TWL4030_MAX_ROWS];
-	bool		autorepeat;
 	unsigned int	n_rows;
 	unsigned int	n_cols;
 	int		irq;
@@ -322,8 +317,6 @@ static int twl4030_kp_program(struct twl4030_keypad *kp)
  */
 static int twl4030_kp_probe(struct platform_device *pdev)
 {
-	struct twl4030_keypad_data *pdata = dev_get_platdata(&pdev->dev);
-	const struct matrix_keymap_data *keymap_data = NULL;
 	struct twl4030_keypad *kp;
 	struct input_dev *input;
 	u8 reg;
@@ -350,24 +343,10 @@ static int twl4030_kp_probe(struct platform_device *pdev)
 	input->id.product	= 0x0001;
 	input->id.version	= 0x0003;
 
-	if (pdata) {
-		if (!pdata->rows || !pdata->cols || !pdata->keymap_data) {
-			dev_err(&pdev->dev, "Missing platform_data\n");
-			return -EINVAL;
-		}
-
-		kp->n_rows = pdata->rows;
-		kp->n_cols = pdata->cols;
-		kp->autorepeat = pdata->rep;
-		keymap_data = pdata->keymap_data;
-	} else {
-		error = matrix_keypad_parse_properties(&pdev->dev, &kp->n_rows,
-						       &kp->n_cols);
-		if (error)
-			return error;
-
-		kp->autorepeat = true;
-	}
+	error = matrix_keypad_parse_properties(&pdev->dev,
+					       &kp->n_rows, &kp->n_cols);
+	if (error)
+		return error;
 
 	if (kp->n_rows > TWL4030_MAX_ROWS || kp->n_cols > TWL4030_MAX_COLS) {
 		dev_err(&pdev->dev,
@@ -379,7 +358,7 @@ static int twl4030_kp_probe(struct platform_device *pdev)
 	if (kp->irq < 0)
 		return kp->irq;
 
-	error = matrix_keypad_build_keymap(keymap_data,
+	error = matrix_keypad_build_keymap(NULL,
 					   TWL4030_MAX_ROWS,
 					   1 << TWL4030_ROW_SHIFT,
 					   kp->keymap, input);
@@ -389,9 +368,7 @@ static int twl4030_kp_probe(struct platform_device *pdev)
 	}
 
 	input_set_capability(input, EV_MSC, MSC_SCAN);
-	/* Enable auto repeat feature of Linux input subsystem */
-	if (kp->autorepeat)
-		__set_bit(EV_REP, input->evbit);
+	__set_bit(EV_REP, input->evbit);
 
 	error = input_register_device(input);
 	if (error) {
-- 
2.51.0.rc1.163.g2494970778-goog


-- 
Dmitry

