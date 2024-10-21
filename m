Return-Path: <linux-input+bounces-7589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F49A6C66
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 16:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533971F232CD
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 14:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E8D1F9A9A;
	Mon, 21 Oct 2024 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXuBW79+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A41F6661;
	Mon, 21 Oct 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729521669; cv=none; b=TPJLOp9wiOXfBCWJAAzid8n07nwiHtLwKWeef6b+eVRDKfxNKEpiwjCibM96BpAIX9jV5cLysbW9JI1kabOX7jiPRXmx197maud+1se/uRJJuGHrOv32aghBUXnYLYpyi0RkA1i2TJFPl5JB/dfcdnXViK3qXu3lYoY4ZA6uuEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729521669; c=relaxed/simple;
	bh=wEJWjkfmcIKHp4iFivlAhHssAMAlpxNOvJ38VUX1szw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aJxSzTPlw5oAyiLtTMr1wd6n8A0iH5dkdcKHu/2lVwhXTQ+o3Bgw3M+0zsFFnAPWpyzPV3oIRZa1jh3HzwzwIlrXH/AH9KbZW3PpbuO8BIgLTVmRGXdKZxVVFOiIesMnoew8ptqKCDKpOmo/Rxl7Q8EanH59hRBiPvCt3OF3b/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXuBW79+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43161c0068bso31709165e9.1;
        Mon, 21 Oct 2024 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729521666; x=1730126466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uH4DYrdYY8L09XhmIMIGq2jeejoQelZaPPckG7Z0QvY=;
        b=GXuBW79+4Gr935ZVMGhGM66/NGFeL0AMBNNZyt2zTnKlUU6Zz5SElUHIBQRJAGruLU
         t9cwmCaW/Pe7DTPfMIz2HfXcrzlS+4gAQ/sP7lL6tBQHtiC/Xk1DCLVOZ/ZBZdvlIsyk
         nxeI3NJ0bz/6FDi1YvdtxMZalCRZ+Nis+FQvxUgzsJeBAD39vZda07mY1gy3YaVd0cIF
         G9iUMUrAjtzjs10GVqXEY/ttmLVua7sWhs8/sD22XXKJ6y95P0QfWnpoQOImZnK3+9qm
         u5TWrV89emxdruCE8F5s1qm6lAs1xrAaKY6a+DChrkW/XndrFqDj2kkJXJHfcmyLibN4
         UtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521666; x=1730126466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uH4DYrdYY8L09XhmIMIGq2jeejoQelZaPPckG7Z0QvY=;
        b=beH14Y+nLgtIAnZ4OU0pWmgvTfPBilSUTPw3y9udK9UzbTIazkUqDDeMdwNrSDaXdK
         8lX4aEK8hPyEZra91/5O92ptUe4AI5++EpKnvXHyZ2w0cqhv0quvrT+Z1lZz9cGxZyoV
         dtR6PMKYLs5DEcG9B7jrSbF9gr108gcwkdbLoZZXiUTsdmpVcWpfKyqMTiBJhJxua74w
         yYT0aYsUzaINCpn7WDvvxIsZJCB1ykpazemNcPDM3HXcEOqBjQ0a38Ky7AcWvuW4mY6p
         iEIhZ9RvhECszoOwa8/wD2qQXNnpqQe5kUPn//OjFDli5iS1YAmz5ccjypmU4WIy/UBE
         2gVA==
X-Forwarded-Encrypted: i=1; AJvYcCUaX9f+rgLszwfNwOSks772unKHcTRHTZmFjjFcSihOFNq2QyYasuFAYOtbBx0i6vdWuBjLV1MUzpplUw==@vger.kernel.org, AJvYcCXcgl01oechym9XqRKMdgkCJMvqJs9btTI3D/K0kIj2HVRwzZS9LH1WbJHHTeP3vb0+ELmLtigZIFMxJYKE@vger.kernel.org
X-Gm-Message-State: AOJu0YyJz9GYT+3930+fvLX52aIWQzF6EoaP5aO/KVVnp3IohfMIZIbj
	u10+wYhk+NMPCmK1TdVMiMc7SLWLSxkobVwfZ/C9MvVHYUoHEQlWQvtKzQ==
X-Google-Smtp-Source: AGHT+IED1aGCt1yMsc3SxJEZZdr6y+3uXzAWdgpu65AhZbo4N+sbPYfiaV0ZPST7QuCCjvgI8LLCzQ==
X-Received: by 2002:adf:f88d:0:b0:371:82ec:206f with SMTP id ffacd0b85a97d-37ea2174e92mr6426192f8f.16.1729521665691;
        Mon, 21 Oct 2024 07:41:05 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bd6esm4483177f8f.104.2024.10.21.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:41:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] Input: serio_raw: Fix uninitialized variable 'written'
Date: Mon, 21 Oct 2024 15:41:03 +0100
Message-Id: <20241021144103.928386-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable written is not initialized and subsequent increments of the
variable are using an uninitialized value. Fix this by initializating it
at the start of the function.

Fixes: 5b53a9d40c4f ("Input: serio_raw - use guard notation for locks and other resources")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/input/serio/serio_raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/serio_raw.c b/drivers/input/serio/serio_raw.c
index e058fef07f57..4d6395088986 100644
--- a/drivers/input/serio/serio_raw.c
+++ b/drivers/input/serio/serio_raw.c
@@ -185,7 +185,7 @@ static ssize_t serio_raw_write(struct file *file, const char __user *buffer,
 {
 	struct serio_raw_client *client = file->private_data;
 	struct serio_raw *serio_raw = client->serio_raw;
-	int written;
+	int written = 0;
 	unsigned char c;
 
 	scoped_guard(mutex_intr, &serio_raw_mutex) {
-- 
2.39.5


