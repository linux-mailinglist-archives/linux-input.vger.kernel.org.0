Return-Path: <linux-input+bounces-14276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA42B32BB6
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 21:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1DE77AC763
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 19:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACD11FF5E3;
	Sat, 23 Aug 2025 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYPncCI0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108014A62B
	for <linux-input@vger.kernel.org>; Sat, 23 Aug 2025 19:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755978329; cv=none; b=ZUYZdb86Zrma0a0P9gYuDOuwfGvWtifZ6e6sgpMeW8SgiM1HS0GoYfDz+KlZlse4rzB6JNkCIdO2Uvm1q+Lmo0eZ8uV765jtyWN9jsg5HxIGftPZKN95GrNeHy8RjfdyhTEKoGmJRGO9M17ESat+xwWFg6Ljk3WvGXwWDYW3xsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755978329; c=relaxed/simple;
	bh=X32LFm7fLA9TbCWBKwozId0Upz2Om58TODsWHfcUbI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O+uATLpwHwqvSLm2LK0lMgJduB+wOH/CPitt0pgbv5fZf9iGLlhZl14UqYmWlryzKdQ2RD8mX3dkHVCpxYYW/hEojobnjP7Gr8djPsOfpcy6aJIfwQqrbFHwoCKGgy29S6zWFO9WZwEmRLgAwVnu4r5ORJXVTxdy8WiyenbvC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYPncCI0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afe6a3ba50aso194766b.1
        for <linux-input@vger.kernel.org>; Sat, 23 Aug 2025 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755978323; x=1756583123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNbbB7IIyEBwHUPySIjl5TTKLDxu/ScAvbSjfAi8CT4=;
        b=NYPncCI02N/EWniRprFsmYsCbRq6mNfaIx/usmQyOpBHMCy35osXJCv992XIrFk0ic
         XXNLPwkScxM7JpXGq79XsW2in1REorHmvvqLZTypAcP+f7/eubmnNxFLkLJNh+E68gIg
         weKjuX3UyTKtVWIdNxc958Af6ULPiQ7kimmbHIBYQ+xHQFFkRSzJ7jp7jLJuwt0XOsFK
         bqS+3sXlO2Wso1VpwhN+SEftbXijshyIxoX9OACbJDtT405L4DiwxkH9ozOkrKDql9Eq
         XPvkCM43fX15GKfvQEF05Tti+w/ly6/zGkO2Z8X1Yo6r9+TZIhYqb4efOdXb7q3nJn9W
         Dmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755978323; x=1756583123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNbbB7IIyEBwHUPySIjl5TTKLDxu/ScAvbSjfAi8CT4=;
        b=YWCTTX0eDS6FEmduZJTonP4mCGcp0Tx61OIz3qs+qp5hr58Z7xT5ZyIftR9G3OqrZv
         S5QtHe7BGUO02SYnrC75u6e9iWccYcqahHBWc4Lyv/rO7kNk8VcC+1GAqJWuoyY3XBEd
         sSFl9C+KWWB95WUPuuUVNPbr349GOPyuYsuIM6Fq/XMtV4sXNuQz8gpg/425/SVniDD/
         N70ZbvHpuKGc56rEhRLKSAhzR9lvEW+fLcVJI2qCEXV8Wxnye9FWj72Cz4qJa95UevL/
         ltDjuUq3C5yALPTQ1RybrO3oYkgH3eZRui37oR7Y89m3JBeq2EfdqjFcH5gJ9Mh9TN9S
         4G3w==
X-Forwarded-Encrypted: i=1; AJvYcCV71uCw5IfIfhVJNcA/+unuEo+4EgefOvp6WDtj79w+Z7m46FhVwy9SJB4cMHWp0wwbxYmeHYrkAE60zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVMZ4dKb14iJFMI6JnvURbOkUyvAkEl2Mrl9SpKup4AMovtg6
	t5L2P0Q+my/eT4A5/DVs/2psDJYWUEYnXoPjfu7g0W+aZeOgnuqf6l3Z
X-Gm-Gg: ASbGncum438DKevq5MMod6pDcp78EC+NH6tZ7HpLuwYW44K3/ejtPiA0vAdMD1wwQ0R
	P+KEhj2YxZWBPTDbUtYMOUhcAMGGNiqVnDiVBSNntPZOn5Hv3lYKFpiN9tLTLTwuLvR9IRXdlXY
	51kXwHDHynNuD9aMRSnlujFwiYs/9ftxXlrz4H5C8HDQO1Uj8lMQgmluw79QOAgaJmLWIxBRv9S
	+aT/UEav1eMtXHY6hBOznf50ekygY6nnwgucFpqodHmHe/1QXWrdtKA0aoz7jrsuHTJGOMGxHT0
	erwRV2JAX0OR8q6ixzpz9WxmOIf/mHgwtk574PlKjDxZCAqW0TMVXtUa9QCuybmyweMnfUfEW32
	bs3o634sUkR+YRVXCmrZKZ54ZZtmb84AoWTyxhPjE/ZPecuXIyU2tClT+2ot7iL3ZOsTZOuimQf
	yl
X-Google-Smtp-Source: AGHT+IFfAqaucWVVRH5E/5e+HQxgeMAhtwWzxtYUZR/LyElJDWpg7o9LTkaNyKHeKBj3muXBVlDV4A==
X-Received: by 2002:a17:907:6094:b0:af8:fc60:5008 with SMTP id a640c23a62f3a-afe28f09244mr330099466b.4.1755978322417;
        Sat, 23 Aug 2025 12:45:22 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe48e897d0sm226791366b.16.2025.08.23.12.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 12:45:22 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: [PATCH] HID: pidff: Fix possible null pointer dereference
Date: Sat, 23 Aug 2025 21:45:16 +0200
Message-ID: <20250823194516.2425885-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As reported by Dan Carpenter, if the axes_enable field wasn't found,
trying to find the axes themselves will result in a null pointer
dereference. This could only occur with a broken PID descriptor, but
it's worth protecting from.

Exit early if the axes_enable wasn't found AND add a gate to the
pidff_find_special_keys to exit early if the passed HID field is null.
This will protect again null dereferencing in the future and properly
return 0 found special keys.

Fixes:
Commit 1d72e7bd340b ("HID: pidff: Add support for AXES_ENABLE field")
Made on top of for-6.18/pidff

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 0342c0a3f476..edd61ef50e16 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1194,6 +1194,9 @@ static int pidff_find_special_keys(int *keys, struct hid_field *fld,
 {
 	int found = 0;
 
+	if (!fld)
+		return 0;
+
 	for (int i = 0; i < count; i++) {
 		keys[i] = pidff_find_usage(fld, usage_page | usagetable[i]) + 1;
 		if (keys[i])
@@ -1299,11 +1302,13 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 		return -1;
 	}
 
-	if (!pidff->axes_enable)
+	if (!pidff->axes_enable) {
 		hid_info(pidff->hid, "axes enable field not found!\n");
-	else
-		hid_dbg(pidff->hid, "axes enable report count: %u\n",
-			pidff->axes_enable->report_count);
+		return 0;
+	}
+
+	hid_dbg(pidff->hid, "axes enable report count: %u\n",
+		pidff->axes_enable->report_count);
 
 	uint found = PIDFF_FIND_GENERAL_DESKTOP(direction_axis_id, axes_enable,
 						direction_axis);
@@ -1311,7 +1316,7 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 	pidff->axis_count = found;
 	hid_dbg(pidff->hid, "found direction axes: %u", found);
 
-	for (int i = 0; i < sizeof(pidff_direction_axis); i++) {
+	for (int i = 0; i < ARRAY_SIZE(pidff_direction_axis); i++) {
 		if (!pidff->direction_axis_id[i])
 			continue;
 
-- 
2.50.1


