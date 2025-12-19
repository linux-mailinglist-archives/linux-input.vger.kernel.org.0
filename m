Return-Path: <linux-input+bounces-16646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D45CD21C3
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 23:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECFE03012BF1
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 22:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CBD2957C2;
	Fri, 19 Dec 2025 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8LamLWP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8E22259A
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766183726; cv=none; b=IuCr6a30SLdGSyGWx98ZmWMjxa7id9ncce7XCfv4pjhqyhkv+5GQkP8K8z8Y2YfTc4+/i5F2liTX7AhjFHIjG2/dDegoFmV3ixEE7pBzllOpfUe/6mo91Q3hBB6G2Ppn9lN8oTLTSnuDrtXoRf2uZvGft9eiYpuSGFxVVCoEW9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766183726; c=relaxed/simple;
	bh=ejJ9kLUFEKWreeLAOuQOWdIEdrq7l2dfNbMJvEGAtgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJ+pTUkyOorTLuldP8ioeNCWu5VPa1EBQxDAIA823+HB+f6gVxyeNC3ZhiJG/Gxk2QRKLYVLmnSXVtvqoL+IqZym4qbA8b55ZQ8gphw9UGqZXsqhvCPph2J3QEUVR1JKyFooUmhRgnDV2wnune0UCpO0KoEUSgJXKyjuwyAmP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8LamLWP; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b1bfd4b3deso189077585a.2
        for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 14:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766183723; x=1766788523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2boRQHxQAmCCePi+cyThNdAxL0ecv/HwbSUHlqk6OYY=;
        b=D8LamLWP6CLgllJsnLBfwjFBCeYg7T8QQMCO/iTKzI4XPOQRMqt6cOZEdrq00Md4gZ
         bxY6I48wSK5X4zzDdsNfwyKJW+KCi2lxq/Si5+Y9PAQy9Pe47tHzoK+4djA3B15KnByf
         paHlNx5PZ2pByzE5+h9Q8bW4/Vp7U3yfdCC4iafIwtHJZpgEeXhQfSGQIK3TZvxNCgNO
         bOvY68Yr/JoG4eeOQTws55udU4pMJWm7MWWSUtZQGGd89uFyOn9lUv/4gRaHMUOt5MOa
         NS8L9mOqBgQtj7t2ZoJHSAVFj8ptpfBdgDHmnSkL+jygxV63LeJhkBAd1HiitulVnV/A
         fFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766183723; x=1766788523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2boRQHxQAmCCePi+cyThNdAxL0ecv/HwbSUHlqk6OYY=;
        b=cM7GaAnWaEQs9EZpW8/EmFSY3hs4gfDuNgj1Vb9BT87W0SNMJCLIcLSy16LH4fTsn6
         laBfXdfByhHCtK5mRsdOuiI2ND3AyHlin16vJgvZQsI9FCpnu+YfvVFmaEzDqsF/evP8
         HOkdWKvubBZD/lJV9FBC3jxfLNM7Ahcl6OqDRDPEN9XA5GltG8/7y6L51YPDROvN+scG
         dlTPYZVWUpxLWilqztgx1d8OY4dxzdEE8JFZXHjWbcaRBw8euxfOWmRmq0rN/xW2gD2V
         NNRGLW4bMOmJpmqBvW8mhv39qKXSQ6wwM8W2pxi7bQcvhR0DoFFH+8ilGMtKgP4yVLex
         mkFw==
X-Forwarded-Encrypted: i=1; AJvYcCU0C252nU8OE2cbee2PCrKjFQlrDPZGX+XIS8V/e8zZYsRCn084G2VRBR/ZRcWo4QM/oQXpsuoBAK2mzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywov55BvBsUg615icdV/DzzUnpdhyBN+ea6VWENT7CYvnJb1SCv
	L3yYtHGqkpRfMXqdfZ11b2FoXIe0iTJZrCfO3mELjLdW4MippFSejxlL
X-Gm-Gg: AY/fxX5x5N3XMVh730Fm9Dph3ofJVtHRUreDKEkOkgqUCG/KqXslLC8jq5b5+pIr9vY
	8hhsg9H09d0LpfUtsR9Zlzyh3kbGK3Yeje0oHkPQy0OgB3OBCM+VBL2zsP9PgND0pZSdiOYXK3s
	TE2BT9ksbUO+OW0iB0bs45zzRlX+qkb7z20x04VPKuExHigbjF5wZoxC0yxyEQ9yHAXH//N5afz
	k1lpaYxFWFtNl9hUMejDowr3CsP7yfE7qSnv0xcNtf59MDky6M1/8Eyyl/NVWJk+BugzTtToe3w
	oPz/LuevYZCeTomyOBm8fvUnoXPtp+ndwIH4zOETuHsLnXHxrtvAZxudNIJeaIUp7Woantc/HVV
	TBDIFGfGhqfE4K0WWQI33nyAZqS8+TGb0GcNOM5eCX597hsahPWY4KsfH+zcQ0cS3TubmriTKdT
	2IxkJam7dnzlxk1cGR/As685bPQnUlf1Ya9ecqUKMO67Tb8gRx3fVWgqBwHM6ioc+O7PWauzBK+
	tUWpDwz+iZo/43khyMazaT/F6a5jUZF6z/DlO5fpg==
X-Google-Smtp-Source: AGHT+IEntVcbm2AAYMffiTKbRmIuUqjzd9IzqikvFWCT/0nUm70nXPP/xM+LDZPyAOFmJOb4I/xnzA==
X-Received: by 2002:a05:620a:f06:b0:8b2:f31f:ae18 with SMTP id af79cd13be357-8c08fd038fbmr775412985a.34.1766183723307;
        Fri, 19 Dec 2025 14:35:23 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7a08asm28972506d6.38.2025.12.19.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 14:35:22 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ims-pcu - fix heap-buffer-overflow in ims_pcu_process_data()
Date: Fri, 19 Dec 2025 17:34:18 -0500
Message-ID: <20251219223417.369278-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The `ims_pcu_process_data()` processes incoming URB data byte by byte.
However, it fails to check if the `read_pos` index exceeds
IMS_PCU_BUF_SIZE.

If a malicious USB device sends a packet larger than IMS_PCU_BUF_SIZE,
`read_pos` will increment indefinitely. Moreover, since `read_pos` is
located immediately after `read_buf`, the attacker can overwrite
`read_pos` itself to arbitrarily control the index.

This manipulated `read_pos` is subsequently used in
`ims_pcu_handle_response()` to copy data into `cmd_buf`, leading to a
heap buffer overflow.

Specifically, an attacker can overwrite the `cmd_done.wait.head` located
at offset 136 relative to `cmd_buf` in the `ims_pcu_handle_response()`.
Consequently, when the driver calls `complete(&pcu->cmd_done)`, it
triggers a control flow hijack by using the manipulated pointer.

Fix this by adding a bounds check for `read_pos` before writing to
`read_buf`.

Fixes: 628329d524743 ("Input: add IMS Passenger Control Unit driver")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/input/misc/ims-pcu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 4581f1c53644..402bf03ca8f6 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -451,7 +451,8 @@ static void ims_pcu_process_data(struct ims_pcu *pcu, struct urb *urb)
 
 		if (pcu->have_dle) {
 			pcu->have_dle = false;
-			pcu->read_buf[pcu->read_pos++] = data;
+			if (pcu->read_pos < IMS_PCU_BUF_SIZE)
+				pcu->read_buf[pcu->read_pos++] = data;
 			pcu->check_sum += data;
 			continue;
 		}
@@ -491,7 +492,8 @@ static void ims_pcu_process_data(struct ims_pcu *pcu, struct urb *urb)
 			break;
 
 		default:
-			pcu->read_buf[pcu->read_pos++] = data;
+			if (pcu->read_pos < IMS_PCU_BUF_SIZE)
+				pcu->read_buf[pcu->read_pos++] = data;
 			pcu->check_sum += data;
 			break;
 		}
-- 
2.43.0


