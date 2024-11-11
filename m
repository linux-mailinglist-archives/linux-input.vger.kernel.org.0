Return-Path: <linux-input+bounces-8021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D4E9C46B5
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 21:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F77A1F26BB5
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 20:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E156D1AAE19;
	Mon, 11 Nov 2024 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gulmNUEm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0CA199238;
	Mon, 11 Nov 2024 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731356413; cv=none; b=Yo5I5Gd7cwNiWQ8Xbgl1gCxSplwKuwUOmEAA/0+qQ33993ScUaxNgUiglPpKwDSSVPTpXWP2XEcjBL8/zvKQiMXYEL0aUlb8TxfIJgbctiKjABvtD4tYdpjlMJLhD+u54B0HmdntSdvNhGrcATylRvDKUi9cmKTDI+sc7MZOUT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731356413; c=relaxed/simple;
	bh=bZpJYrBE/x9dahvgRHWPbcCzLaJRwwqRTo/EzpO7GIU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DNXbeTUaDuGwF4DZyKkmOJitfMAefWdDzOa+FiPlNdCCSUAHKsEgU8yg6Lm8210ShcyqzoWRdRLqBq1S6WQJtVlxoaRUQGSbewrucVffOceff4V6Mk7nL0uhZJjhCwnZPHhHslnKMSaDZBapypm+IxaCuZPE69mi7hNuU2c6qIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gulmNUEm; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b1434b00a2so388562885a.0;
        Mon, 11 Nov 2024 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731356411; x=1731961211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LSJlyLjY532NW1/+x4WkvQehtFMwlminNzRjWSvrDw=;
        b=gulmNUEmy7zCuRU7NCZFqBNEW38LfZrIlhDueO6K19j/y5foEe/q9p4q84AAGNkEhS
         Sw3R+iVnaa9TbxIJGczfAMX8B5GqnxmaP+cvBttajfMsFg0YcdSuIhKALxneJ364aMtW
         TJ5w8koIBkP41HXovoW86VtEF46E/fAjMp2VB+bSFXpJ6NYcL+ba0bUr9b/Z2G1Tez2h
         bAxHgTwy66W7EAkwhkNYQkT1DPuc3LXg5RjBYFBB3vz+a6iB92wBxG0ObtK8fu6faqQi
         5TWfFqnreU+/VTSu5bKugPwV7wly/SzTvU7GZ1nz3xuq1JNpOfZn3MkPT5MFHS9tzCGt
         w97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731356411; x=1731961211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LSJlyLjY532NW1/+x4WkvQehtFMwlminNzRjWSvrDw=;
        b=SsLHeD5Gm0lxXXNo1wVSBgMrDIiw6xfmXgBEzwYpo3/5UZFGyYN0bgTnQkDQ7Ecc1K
         dQxYUj1ruWf4gCyGfqEnyJ/iTj6FNHwA9FH2BqQHFiJ4f3d70ZM67LTR9Tb0O+OTpdBq
         Y1ahwEYJHD0RO0enB1XAJ8CPvwyPbf80s6caJJyp3xBbbel322Dg470W9OG+K+MCP9Fo
         cT04uZ26Ho+3CK+doRYLZ2qct5UQiSZBZVEHMXWYeGTbDR9KkvBRRLWwYjzJ6xLLeZHs
         t0BIK7nuzDi0LxBaL+tN+z32PXWa5nSkN+09Mym3bT/MzqFAvYL2p8HtY4tshU4dPLZ3
         a+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXmCtSn2hn8Guv3k0yni6VtTaR7r8eiW74pzCTI0NUWefTnmEYH4a8SwPqivecZPXupZ7u5AUbplhYm0Ig=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/s2LvA1NdhOOZvxtF/NyYy4JDgc9QU/eKiKmr7+Dahgb0j4f
	oWqzd7BgQrHfrKmT6RBBoHR9pR9lHOit3WXPLFzGcCiQmq6WFQw1
X-Google-Smtp-Source: AGHT+IEJrCvEIMe4oM8AGmeaRf4b+sdVNtD2V5IVJ2sBpo4m1/3jCKHQ6izedd4wH4NrLqpsbVRsgA==
X-Received: by 2002:a05:6214:418b:b0:6d1:848b:a8ce with SMTP id 6a1803df08f44-6d39e150570mr175777426d6.28.1731356410073;
        Mon, 11 Nov 2024 12:20:10 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ed242sm63254846d6.34.2024.11.11.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:20:09 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: dmitry.torokhov@gmail.com,
	broonie@opensource.wolfsonmicro.com,
	kgene.kim@samsung.com,
	kyungmin.park@samsung.com,
	jy0922.shim@samsung.com,
	vkoul@kernel.org,
	arnd@arndb.de,
	nikita.shubin@maquefel.me,
	hartleys@visionengravers.com,
	christophe.jaillet@wanadoo.fr,
	shiraz.linux.kernel@gmail.com,
	rajeev-dlh.kumar@st.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] Input: ep93xx_keypad - Add check for clk_enable() and clk_prepare_enable
Date: Mon, 11 Nov 2024 20:20:04 +0000
Message-Id: <20241111202006.6669-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() and clk_prepare_enable()
in order to catch the potential exception.

Fixes: e06003af56c3 ("Input: add matrix keypad driver for Cirrus EP93xx")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index dcbc50304a5a..06252694f2da 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -141,10 +141,14 @@ static void ep93xx_keypad_config(struct ep93xx_keypad *keypad)
 static int ep93xx_keypad_open(struct input_dev *pdev)
 {
 	struct ep93xx_keypad *keypad = input_get_drvdata(pdev);
+	int ret;
 
 	if (!keypad->enabled) {
 		ep93xx_keypad_config(keypad);
-		clk_prepare_enable(keypad->clk);
+		ret = clk_prepare_enable(keypad->clk);
+		if (ret)
+			return ret;
+
 		keypad->enabled = true;
 	}
 
@@ -185,13 +189,19 @@ static int ep93xx_keypad_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
+	int ret;
 
 	mutex_lock(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev)) {
 		if (!keypad->enabled) {
 			ep93xx_keypad_config(keypad);
-			clk_enable(keypad->clk);
+			ret = clk_enable(keypad->clk);
+			if (ret) {
+				mutex_unlock(&input_dev->mutex);
+				return ret;
+			}
+
 			keypad->enabled = true;
 		}
 	}
-- 
2.25.1


