Return-Path: <linux-input+bounces-9625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFDA225D6
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA461672F0
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2B41E9B35;
	Wed, 29 Jan 2025 21:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq9wWDnQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997241E9B39;
	Wed, 29 Jan 2025 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186212; cv=none; b=kJz0dTMs66gKnLDQBZQFm/C8WOSmJFm6f2ReBAFU2F5V5ad2mFVk7tW+r75RciCGxQ15zM+3zEGH8OEYbwZngjlyCUaxmtXRiT9yk4eH4cXEmYvH/VekIc/qlRtPoEX6y62VL/fgBg3/9m87woKjWMBfbTXEBImre56nx/dLda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186212; c=relaxed/simple;
	bh=nGlxgwNI+4XUAU76n2XwXoXNYdQEY+cofE9/d16VU1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V9zpxqPTO0YZo+mskU6QXKCLS2cJ5HBf9YXRg3jmPFvWrKC2DPOTE6R5BmjjviF3KCCz0jqnKoyKFP74ye4mdRFe0w7Wm11LQvZ0Uv5M9Yg6AV3+xL+AqHWXGynN+BhHi1wYGLwoeTbnjDDMt4r+G5b1CRSORxntTXEv0mrz4nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq9wWDnQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-542aae6ef6aso14905e87.3;
        Wed, 29 Jan 2025 13:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186209; x=1738791009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arVVYQpYmE70vfH12qGw4QsMHoT6tNXR87uxBHDMgO8=;
        b=Oq9wWDnQuikEk1s2cfxgjRsZ8VkxSuhs3sqcs8EbD4vcseeb19SzI/sCdNnWPYoiRf
         O9TzqfjdZDSEV8Z0Yg0la3Jt5g5fRrWbojrB7PaDSwIAliqmynDob8fL3XOvvzD5ckKJ
         E/qSYK91/J3RPjoJsdb/SABAv4bC9vSNRLH9l1uZoxI8R/XPZAxksukMYLMsAy+1whkH
         aaGK4uTJoBKLkoTC/UKvWwhyaCf15gMPMspDy0PfjPIaqxGYtB+Hu0d9SIWxWk8FNBEV
         cnZKsfbcY3lfoGXFY55zeSdLoiL+XXqCP4gFXE0sFZn00ZmWq35/5Xa01NfypnWYB1jP
         lHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186209; x=1738791009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arVVYQpYmE70vfH12qGw4QsMHoT6tNXR87uxBHDMgO8=;
        b=vEKCWdoY8JWLtugeZQnMfQWoakk6AmS3hfyW5DgFeAHeOjVSpQYuT+CfyG3cvKhxGl
         T4B6O8eS9aCskDOpcSmSVn37XgAzxFJTf0H5VF93le9VGOECf4f8ApWdvIZVdLJPzqzA
         IXXQ+9MxhY7fTBVksqwwVOH0XDHNdAZecdl+5HFc9avPXsvlhH/zmQ2SPZiISXY/MbxQ
         6mVc942OnfCLALYBPIWbkCTsqsuyoE8ogxCsw2MCSkV5r5jKtq7rspyYXUxILdIhCZ91
         FIAXFqlt6kYUgoou25cZdKdwNp+Yq3OiwsjSIjIZhWPPSrUgdU6uLE04B4GHfYlOg+ci
         JWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4GZ4Zmpgu9xISvs9LbZL9ajS6w1P1bstTrAwp5XMzhOT5r38hd4MUkGAvVHhhn5wwGKhW9NLI6GOK@vger.kernel.org, AJvYcCVpKsLqUai7R11r02o11VpIZW0i5+bxs77aR8CD5Yd+NP59vjKv4Dq93mfvQ1JxzMYxH2BqzdeU5XD1OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HLaYk3g6sJbL93oyK91WKbs5vGH8m8jxWs4IYqWhAg5DBbvA
	l7DwP8nMm9NOj2cPKIr1nJwE1CO7ypitHbMP6SiqxyjRH2QEbwco
X-Gm-Gg: ASbGncs7G81RpceLGzeY1kwKsj4DLVHz3QOQ//nRQo55S/lj50J9ivu1vd3P6Aj4PGH
	NBjuRTyz9tVPnHdZt9qBLcKKLkrlfsTg6vMRH6NvHfJkAClcJlnJXKaBG/0JGEITBGs50+IQAxf
	Vr9jlEcdSVqiXq3UExZGd6A1yZbOBXseblPgVTPDTmcNFgsVhwV3QSqo8vR66TXcbevA5XLB+1a
	8NnkldHU6jVmNjNLxjwrlbvQYLLI40ZKtmifyaMl8/HV5RLHC9FV0QghBjqW0BrOOdoLGafBThy
	eQwKk+zOK/pWHylqWfZkLPEbVfwyL1hl6ojC95pTlqbm09Y2tKUK9Cjxiof7fw==
X-Google-Smtp-Source: AGHT+IFbF1YsWBuWLxZpybTtRAuQfMh5MsuHyalzYid8Diwg11Re3So4mBLyNnJWRgbPEfjGL7yQ9A==
X-Received: by 2002:a05:6512:130e:b0:542:9883:26e with SMTP id 2adb3069b0e04-543e4be967fmr560721e87.6.1738186208478;
        Wed, 29 Jan 2025 13:30:08 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:30:07 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 20/21] HID: pidff: Simplify pidff_rescale_signed
Date: Wed, 29 Jan 2025 22:29:34 +0100
Message-ID: <20250129212935.780998-21-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This function overrelies on ternary operators and makes it hard to parse
it mentally. New version makes it very easy to understand.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index cb044a239ab5..f478859682ad 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -230,9 +230,9 @@ static int pidff_rescale(int i, int max, struct hid_field *field)
  */
 static int pidff_rescale_signed(int i, struct hid_field *field)
 {
-	return i == 0 ? 0 : i >
-	    0 ? i * field->logical_maximum / 0x7fff : i *
-	    field->logical_minimum / -0x8000;
+	if (i > 0) return i * field->logical_maximum / 0x7fff;
+	if (i < 0) return i * field->logical_minimum / -0x8000;
+	return 0;
 }
 
 /*
-- 
2.48.1


