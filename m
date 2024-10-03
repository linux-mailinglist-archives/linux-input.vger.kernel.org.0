Return-Path: <linux-input+bounces-7047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F598F1C4
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 16:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE5B3B228D1
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 14:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5658019C54D;
	Thu,  3 Oct 2024 14:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsSM/ECM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3B126C13;
	Thu,  3 Oct 2024 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966828; cv=none; b=Kzo2k11Jq6ZEYB9cM//2IT9kjfYvFLIBLrYSulMxkYBPQ6mU9EyRxZ3BmVMFyjGYKD5/w9FmV3D0Dz2BunJIcWwYkX9vBqxpgZnM/C/TRf28vLXpNx1nEgCULRU4D1Cyu83l+x5FdBb5cpFsPRpIsB1M0Dm6EkXXdBXHbEWmlOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966828; c=relaxed/simple;
	bh=5Fw+HKP+sxxh+c1EU7Mi61Yo7Df1WH2QfsYOjfzHlvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4dvZ/gE55weBDOHSRJVvEqB0eqFebJ1CB1hJT3/pbKM/UMS3PU6jwnpObonEPlyL/J6eh361Kinl9tdp3PW3a4OtrjAD7aNtvSNk1aY9B8toAFl8QXH9e7KRlwyqrEfEJD6rXQFSrMf7aO01A0clHlhKB4ZFznWCPaCLQG4YqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsSM/ECM; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso827196a12.1;
        Thu, 03 Oct 2024 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727966826; x=1728571626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnQx4mqC4vuIhDoBXPFZOph4vdEFxiBN7R3W58/sprI=;
        b=NsSM/ECM5Y069COBZvRzU2/X/Q5t8lWSYUFylF+zDI5+KPM4pINhKbZ3ek98ZL2ypj
         GKFlrLEg+6YvIb9MxRwOMnQxgcgvNkgm1jTyuobBzvLovQc5ZDnVlwZoJIUSGIIOcJ9d
         gQUg0b+wag3tr/0dov9EEDvfPpsiaaxtCq5Ph8vyFcCEPOAUdjrw8ABwfoOxQW0TS8Bd
         /htUnEiJvu+Dq119u1N5FoluswjOLxWxL0ArIQYx5MpF43yAqU6g19DfDlNW+OSyeSkw
         Scc6jscB7Ut/1ejrA7wMNl7T/8l9kvsXnv03Dt/RSxGapwjO80JGWY3JjyBjFryF3Eao
         P3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727966826; x=1728571626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnQx4mqC4vuIhDoBXPFZOph4vdEFxiBN7R3W58/sprI=;
        b=i5hhCl4KQAh5wAgxCwI0m8eu+2Ps3EuqQeOmfa7TDKuRpm2mPuUQorNwJon5Y6ossG
         0AO9hixDT9bgsh0HiV0blpUpVOZsBCuNywNGyC3YCLO2DUhtYmGtyBkZ4uh25wCiU65t
         Z0XTZ+jpkM/3NPYo3VAGyYiHhPsYHpLj4t6kpWzV/uTDGtyZy4UoP6ro6+A7lUnOBUYr
         1dGBH5/8Xksn1GP6iPtC2Pah6OER1lPpI9sFbVJq21ANwyNTdlA5d6Z9MCJUTCtIrY4n
         2M+y9yht8doKaJDLssxbZIlkBqacBtcCA34wwx+2arjvE4QN2DLr3lXfGeCWMLja7YoY
         sOHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQWs2QqbELJfBrxgw4uwPQpXqrOMM2xiuQggkcdcw+HaDQ4RGNW6uXp1oR821KDws7W6lxyIx2gl29lXoF@vger.kernel.org, AJvYcCW4hLiEUNdh/mqj/RPAhybPthszh3GFdHoKjVrWc3SKCKfQmye+m0yPaGNnL1f59GhT+r5JiU7PCegEOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIFkOk1E/cwOPOw91cAcULhBiB7k5VopJXeXq6oHrJAWYRh22V
	bpjdT7SNzOlx+FvKlEb1rlhvUaxqDYvoe1CZBxoFhlbs08M3Hk7l/mYg8Bfw
X-Google-Smtp-Source: AGHT+IGtsaUKf+nFLJDmfjJc4h3dSeFExyhXMO77QcoGbZFex9udkTjfvVcCNYg5+HJsuOl+qsu1Ag==
X-Received: by 2002:a05:6a20:43a8:b0:1d5:135b:4ac1 with SMTP id adf61e73a8af0-1d5db209e31mr11711948637.13.1727966825988;
        Thu, 03 Oct 2024 07:47:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dcb05a5asm820774a12.24.2024.10.03.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 07:47:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: simplify snto32()
Date: Thu,  3 Oct 2024 07:46:50 -0700
Message-ID: <20241003144656.3786064-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snto32() does exactly what sign_extend32() does, but handles
potentially malformed data coming from the device. Keep the checks,
but then call sign_extend32() to perform the actual conversion.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 00942d40fe08..5f62df91030d 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1313,9 +1313,7 @@ int hid_open_report(struct hid_device *device)
 EXPORT_SYMBOL_GPL(hid_open_report);
 
 /*
- * Convert a signed n-bit integer to signed 32-bit integer. Common
- * cases are done through the compiler, the screwed things has to be
- * done by hand.
+ * Convert a signed n-bit integer to signed 32-bit integer.
  */
 
 static s32 snto32(__u32 value, unsigned n)
@@ -1326,12 +1324,7 @@ static s32 snto32(__u32 value, unsigned n)
 	if (n > 32)
 		n = 32;
 
-	switch (n) {
-	case 8:  return ((__s8)value);
-	case 16: return ((__s16)value);
-	case 32: return ((__s32)value);
-	}
-	return value & (1 << (n - 1)) ? value | (~0U << n) : value;
+	return sign_extend32(value, n - 1);
 }
 
 s32 hid_snto32(__u32 value, unsigned n)
-- 
2.47.0.rc0.187.ge670bccf7e-goog


