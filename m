Return-Path: <linux-input+bounces-11756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFDEA88FE9
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 01:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD71189A00F
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 23:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB171F4CBE;
	Mon, 14 Apr 2025 23:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzYoGUPH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA271F30C3;
	Mon, 14 Apr 2025 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672107; cv=none; b=OmcL+BQc/UtleM86VgvW/PuhANpxPB406PgvuYHjVL8OGrroxzzgZk+xYRPTs/HVA4+5WEr+QnfTmewAv9Ny4BPv55tBU86zgU9zQL/p/u4k5cnYC9iHGJSp4eVN6B9nHTVTDqgK8CmtK0/Zu0nZkfLENbpxRSlvBpnw0fBygho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672107; c=relaxed/simple;
	bh=HF7Bt3TUi1sVz4PiT1om/GB2WHMxQ8Loa880O3DhKuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GioxBvMUAJsPgv+FgKbeGn7vvF78axbDp4ZcQLi7qRCk5PfHNdMKsrBApUfD+epAHwPvB93EsyIewRDBm6+Wlisl5wAbdH2/Gv2gc8GrS2hsfAbbSSAMqzrFn45DnJuykR47vFlj/0znVuyMkv0KstNQEglPDv35ZKzO1PTolAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzYoGUPH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so77588666b.1;
        Mon, 14 Apr 2025 16:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744672104; x=1745276904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUv6EEilc1Zm/5NTxEe/4QBAi5xz2kQ7QmAgCRsXgjs=;
        b=hzYoGUPHluKT8Ks9V4Hv7GXQK+MagCmwsEQERyiAHZQS4A4SPwIK9ZN+77YKhM7KEl
         caeefGBTfpHf2kKCKy/ULaqWxLucYfLXbxYcjkzXdjFjBUxviBlb+WvCVzJve/ZprUC9
         x7e8sDdT0MJrNnzAAq1hHsa4S9jrHGUh8N0jKF1RRK58ExL0KERg9ovu+RYNAWebvS+l
         uetBiUTWX3rzyIOszxOb55nXbiK1UxWQhppBG1M0eB2L/MtBSVIJN9I9dONcdybHmEIa
         IscoUb7wcf5PUgyl5UQKE6We/7MiNkfPpIU+d/VTdjPTgNsFaeyDSslkp2Xin6BOVB8Y
         zNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672104; x=1745276904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUv6EEilc1Zm/5NTxEe/4QBAi5xz2kQ7QmAgCRsXgjs=;
        b=T5lWmBUDzt7kyjREoYSSDlRJVTu3YAHQkRb6clxeSnw3NJBkMdnzIIsfs6e47j9Q/9
         d+yL3FvKiXzr5eTqp0lB2KfUmTQ8R8SOxuWFB1TOHgQND3zQYT6b8umlb+SUWrnI54eB
         5fdwzKTiAc6f5ZbnL7ipKDWumCDfPmIvWnNYAcbWR1fCM3K5p/KuVVrVtVEx3JDinl2s
         sFP34qXMZJJ8tL1Yj5/fxohIRlXAAJSMNpPsbmDOYjXKCVgBb84+x1r+Ya/5kWpWE04z
         Px4+pPJkE3z/YdHralTxYN1RCIJ1nUIhkTeAUmJThfDFHlXWtm7F/2zVpkxbH9rGQqt4
         D4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkKYoTca9+PBFWVSZagDph2A6jJ56mRJWRgviJCjvwRDqn/GjN1oeQTHEgAbUII74AIyHi3GzMH2IQ@vger.kernel.org, AJvYcCX0PnP1D9kj29vonsSvZWfOGrOm8/Cfnlr2rCU7m1X9C+XZNApDNY7hbUlL7UXAu2YPQxieZ6BCYyFv/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsDsA993s2wRFzJIJbXChDv+Dif1cmT0AD039NoziYBJPyfGi
	ikJjq4a4QiwFiybuSZxdxDS7dw/1vtUgCB8sl10RurmO3AwfqNWAD1On+Q==
X-Gm-Gg: ASbGncsWumB2XgANtf5MmHF5zyCN2Og+zfpaUA/G3fuTi5bGTBYmnqaRYQdB8az0Ntg
	zw68BAHcn6ZfMCmoXyjvHHIbVTHNsqPPOS3ocfWiTyscgXOr6fRjV7P4cGw7l1G3S3vG3G/cfRQ
	wWvkmdXCmw/SZ2oA5JyxIS2CCUvpB/dOGyDhRRqf+VFBAMAqAJ8EXsiH9oBcnjfFVZ+15eoRY3m
	c29c7QyAgnUOjTsixpvpn9Oo0AmPwOjrYuctY7u2SechbaoN5hbny8ElVoSddN93ro16pafHhiP
	/1rV0ShtEvloViTCoYQb0VE4VUNjNGLQfJjhXNYWi/trjSImt5EELvLFuLvv4oq2gRK2L9vdtsI
	jfGofL/93gzI=
X-Google-Smtp-Source: AGHT+IH2sQqccokmjctQNeA2XNtr1JbutIyHIEEl5UI9wjv0enFOsNxeWzv5bSGK3NWzeKj2NjxJdw==
X-Received: by 2002:a17:907:948e:b0:ac2:e2bf:d440 with SMTP id a640c23a62f3a-acad31ef8dcmr460852166b.0.1744672103634;
        Mon, 14 Apr 2025 16:08:23 -0700 (PDT)
Received: from laptok.lan (89-64-31-184.dynamic.chello.pl. [89.64.31.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3e08sm1001328166b.14.2025.04.14.16.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:08:23 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND 1/2] HID: hid-universal-pidff: Fix errors from checkpatch
Date: Tue, 15 Apr 2025 01:08:17 +0200
Message-ID: <20250414230818.957678-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414230818.957678-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250414230818.957678-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-universal-pidff.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 001a0f5efb9d..dc3ed69dac72 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -56,7 +56,8 @@ static int universal_pidff_input_mapping(struct hid_device *hdev,
 static int universal_pidff_probe(struct hid_device *hdev,
 				 const struct hid_device_id *id)
 {
-	int i, error;
+	int error;
+
 	error = hid_parse(hdev);
 	if (error) {
 		hid_err(hdev, "HID parse failed\n");
@@ -71,7 +72,7 @@ static int universal_pidff_probe(struct hid_device *hdev,
 
 	/* Check if device contains PID usage page */
 	error = 1;
-	for (i = 0; i < hdev->collection_size; i++)
+	for (int i = 0; i < hdev->collection_size; i++)
 		if ((hdev->collection[i].usage & HID_USAGE_PAGE) == HID_UP_PID) {
 			error = 0;
 			hid_dbg(hdev, "PID usage page found\n");
@@ -91,8 +92,8 @@ static int universal_pidff_probe(struct hid_device *hdev,
 
 	/* Check if HID_PID support is enabled */
 	int (*init_function)(struct hid_device *, u32);
-	init_function = hid_pidff_init_with_quirks;
 
+	init_function = hid_pidff_init_with_quirks;
 	if (!init_function) {
 		hid_warn(hdev, "HID_PID support not enabled!\n");
 		return 0;
@@ -114,14 +115,13 @@ static int universal_pidff_probe(struct hid_device *hdev,
 static int universal_pidff_input_configured(struct hid_device *hdev,
 					    struct hid_input *hidinput)
 {
-	int axis;
 	struct input_dev *input = hidinput->input;
 
 	if (!input->absinfo)
 		return 0;
 
 	/* Decrease fuzz and deadzone on available axes */
-	for (axis = ABS_X; axis <= ABS_BRAKE; axis++) {
+	for (int axis = ABS_X; axis <= ABS_BRAKE; axis++) {
 		if (!test_bit(axis, input->absbit))
 			continue;
 
-- 
2.49.0


