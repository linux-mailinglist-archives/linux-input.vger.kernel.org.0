Return-Path: <linux-input+bounces-8600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC69F2BEA
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 09:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CDEC1648DF
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 08:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2B21FFC58;
	Mon, 16 Dec 2024 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hlY5Jgct"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76321CB51B
	for <linux-input@vger.kernel.org>; Mon, 16 Dec 2024 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337950; cv=none; b=j1GnAGxVfwGU1QtH6XlfH48xlSt4W4Ah4fCYF6d++veklmyMNQ/K7AFOQl67HtsS01hFKG4eFv7/gAhoaHS5JEG6W1bOLeTiOo4uLKs6nmhQlVVq6Za9EXNVpiGNzodWdEJk8ckb/LWd5FVC3jv85VT4jTxvd4E+/SSobHI3UgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337950; c=relaxed/simple;
	bh=stz1SJq/Snyh4whvwTjwKWhJ4BJeLSUDWvVT8RfU/qE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxlTxOcqVQO1b/qNMfobekJsMtqoxMrnYC3k4Se4Q3wEUjqkB7ynUrCe0EN6cGVqXQtuGC93F+akibzd8yQH7tecfCoWWPmnkw4hpvgCcOXlgJu43JVtGMilcKYc75NpauVJuT6gtAXAN0drZTG5Yt8I01YLY6tY0VFxLnqfvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hlY5Jgct; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f796586so42258355e9.3
        for <linux-input@vger.kernel.org>; Mon, 16 Dec 2024 00:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734337946; x=1734942746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLkgv4Tj9vskkWftFwtwTzw0pR5u98oJo45zy3Xi1Q8=;
        b=hlY5JgctnfSuk1nBtsv+wZXW345ik8bsSvARfnCDKps0KGTfLVzWtiLYho3ZAWpc32
         BA18j7iR3W3JWuI99jJ0LJjSwZOEKB5Ah1+qMN0yexGQV1alcW4ux2NGpCwhPrYU+heW
         SrBzQLozaZce0+p7xqP8tqgtGAps/snsnfynsZhdX0K64V45VVeTgFyaRodjN9V1wlqu
         B+S/u0pteIewCF9WElgin98wO9m7OAiQ/jjp1/4X0Eccrl2dyDlNl8YDO9JNGX4LUeJx
         obTBEBZnXxnt5UNCHtdUaZQE+vc8HQLUCv/yjPvTafmys2fUzkTrpqoLTW66/XwubgP3
         VOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337946; x=1734942746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLkgv4Tj9vskkWftFwtwTzw0pR5u98oJo45zy3Xi1Q8=;
        b=ooHi7SGAn4v4C9kZnHPFcV39c3DUZzyHQcUB9izwD+7MKcjXVWAksWJ3mZcHuvBURx
         DWlUuuepgqcguMR+h9l72LO8j/ZqTbFt5O7j5SCR0zHXCDOl1ULx8cLHFVxGaCdmoLbR
         aVuX+GeH5CUKs/k2XmsrhOTiLK8yrMEJy3VFK9nWMyfSy02frnLbAfhjc2nEyUGf3MNB
         Xhsxo9Pb3HYhNcd1Bba2/mnmlD+JlpcoBdxU6DN5u1R4kIRDn2gPijYiWuR7up8DG7y4
         gq1SfrvCCr5k5JsqWjKVwsP6wEWCbzkXU2fihNKZGRZg0nFQbyWtj0yS63JPvMNnoBkP
         9yLg==
X-Gm-Message-State: AOJu0YzTlZvmHAfAgPJ1HhOJYzA5u30pmyV7Dfw9LlNsEQ/4Vvyy56rb
	v46M0vuU7rZ9ClwyT6fO/9D7F0VuMtPOucyej2LHFhhiFXDl+oEdb34ZQoSV5oM=
X-Gm-Gg: ASbGnct27LeXB+MsKXEKifBniaWxOSRT2ID1ltaE0LKcmka1GjGeUwfF5cEenaGBK0p
	7XGOYvuy6iQXTMOilqt36fA9h0jIQa20kq9Ya3JiL9c7YxpMsgY2lxvqBUcbQQkuOzJzvL4Y3Ms
	2fHB2XaMQ26vSLdgMByuSFAg2NpNwFyuIx2MURhHz2/qVKqh3lW3gYt+1ghctNxMd9+uBIHqJr8
	hQv2PzFGDx422D+yjdy/fM7Rg73xJsqCnI2mGDqhulhFQ7zUrUPH87h
X-Google-Smtp-Source: AGHT+IHpEDK9LPFIzTbxV5qeAnXs2TL2pQ/3jIs5yECkuUiId6xGZT2w1z9K8k3JSr/vVH+sjvZBNw==
X-Received: by 2002:a05:600c:a089:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-4362aaa652emr93906875e9.32.1734337945954;
        Mon, 16 Dec 2024 00:32:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ddd7:943f:c7de:9971])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801acfdsm7384843f8f.57.2024.12.16.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:32:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] Input: davinci-keyscan: remove leftover header
Date: Mon, 16 Dec 2024 09:32:17 +0100
Message-ID: <20241216083218.22926-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The corresponding driver was removed two years ago but the platform data
header was left behind. Remove it now.

Fixes: 3c9cb34939fb ("input: remove davinci keyboard driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/platform_data/keyscan-davinci.h | 29 -------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 include/linux/platform_data/keyscan-davinci.h

diff --git a/include/linux/platform_data/keyscan-davinci.h b/include/linux/platform_data/keyscan-davinci.h
deleted file mode 100644
index 260d596ba0afe..0000000000000
--- a/include/linux/platform_data/keyscan-davinci.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2009 Texas Instruments, Inc
- *
- * Author: Miguel Aguilar <miguel.aguilar@ridgerun.com>
- */
-
-#ifndef DAVINCI_KEYSCAN_H
-#define DAVINCI_KEYSCAN_H
-
-#include <linux/io.h>
-
-enum davinci_matrix_types {
-	DAVINCI_KEYSCAN_MATRIX_4X4,
-	DAVINCI_KEYSCAN_MATRIX_5X3,
-};
-
-struct davinci_ks_platform_data {
-	int		(*device_enable)(struct device *dev);
-	unsigned short	*keymap;
-	u32		keymapsize;
-	u8		rep:1;
-	u8		strobe;
-	u8		interval;
-	u8		matrix_type;
-};
-
-#endif
-
-- 
2.30.2


