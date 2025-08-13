Return-Path: <linux-input+bounces-13984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EABB2545E
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F299F5C0426
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED072FD7C6;
	Wed, 13 Aug 2025 20:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLmwga7w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADC32FD7D1
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115814; cv=none; b=Xd79zkTFGe7AM4qjB7uASb30MEeE34HiukwoVuywIcYEzs4DE5ImtK8/FiQmJz8TLgXm6EcfXQbLAurP5db/ljsBKMlfsoahlmx2UtobbI7gkL5tSy0rudYN6ZqhgGeO/20Z7p0T8UDHZmgJYSKxh2gBqX1qQO724DxBqJIxn2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115814; c=relaxed/simple;
	bh=lmQCYuiB8cJ0sD5nWDFYrirOcxGYW3wfx0CpyN/ivf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7SlwdZlF+B/9552hpXCp4D7SveobIO6Gmpm/c56yOfQInMlxRpS2hoCi3GyjKX7Fb4dEMfzS0uqrRhgTxgchAotyn62U+U8dgUtMp8157hUJMP+98UkDj7WaYj3LhvmTbKQ+U3Q3iJQgfEEDdOD/yJWhuiS5usRE6nk1zDHyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLmwga7w; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7a01426so3218866b.2
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115811; x=1755720611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkxXoPM2b/9stxw3ZvcHoJGbm8nE7V0HStNjmgO+bBE=;
        b=XLmwga7wcaKQvbn2R4kwo7NKNSh6M5sYzu4kpQrrogHqXNHp3MCtows4eR3/tb0Vq1
         hnscdMDeZrNNHaTVEF0qYxXjoYSp0qAIB35PhGJnBmCjiiSaRtRRWYy4uaHWfZy8hCuq
         UdyV//QYvnPiBbKIt0U2rHm10KE/eIK2Uw6+G3cwqsBQjpC2dr4vvEikiZ8jTc1h7XHL
         ynt1W5e/AFR9hCUIaffWFbTwjoxhEGPMZ3+KOY2sHREl8C0eiqvIw8CqmctnBCkPw1Ts
         z8BsevPZMBm0fdcMeVzAoO5YDeqOgv74LchZsSLxu+uW4uqA0bps37bbzJBOxPTsb9E4
         mPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115811; x=1755720611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkxXoPM2b/9stxw3ZvcHoJGbm8nE7V0HStNjmgO+bBE=;
        b=YPcwItkRah7X50cTx9yFH7XeuBb3ZNjr/qo2cRamI5uJuMDz+IL4pc2NXBIBi4knbv
         +OaPyPs8jno1TbSSJn7XLHbAbIMJijTJgXiGUYTXyYNxVeZB3ZHWZAmuoQISm0uP3MBh
         35bg251PReULV464LMzSGvFRgNgsoh+i+h1E8s3JmVBUIJQWM7VDMU1ea80LwaXL606n
         f/MMumqzXygzTk6CFdeNHemSdXREuLnlg27TycsaLP4NSv7wyNexXDasKSXgmzdLo86h
         wfNX8YCBFs1S+xYfQP/7jWaTZurlPiAhjKZvAaacSZyMy3AR4Sf2U3YranzPIJgEtkPS
         8FUw==
X-Forwarded-Encrypted: i=1; AJvYcCX6uTEytaIbTQqbXdMjzqwkSweB3B/9+IY567EUCrYmCDMC4zk2d1SBb9oNawjmQwDEdH8Oy2GLybdglA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Gte9m+hdR9krqlSKof3ySx2GybGuWmZMF0ZIbGMzINYEb90D
	bC+D6knJeE+wCM3pZvBXXpwXttriBHy2NSdBXJ7SSF0WbdxLHTYE8xfgGKApNw==
X-Gm-Gg: ASbGncspC8VoMpX0JhXF/Ln/AOIlb3q1hBnFUjzwMJQVIR6Qx5RtSG1xIvCRuRFK+Xj
	Z16bRfqbpX+6uUDVMH8a58ZQL/3p16Yqm7XKYwe8b9WwajiYZqQXDLBEZ6BrQB/O1nDKc5CNb1K
	htI61QLu+wH8KXYU+mv/FwH7QKX82BX6AqqSO0i4EpED/3pQ+uZnocBJKSy240JUY/chFI31s+D
	c2rOHV3cnKVhMtdroiK90ZvBLbB3bdh3g7GIHQF9fbDQSre3axyLH358OZGO2noy30yGG+OwOuW
	zhWOG0rti4LBPyl5d4BmLXCNxgu/NTH/r5i2v0YVcEkMg9Nn2DQko7owyaUxLqGVXd4HexVfLdM
	+wKAcuHiAEP+ZqdKRoRazSBStxaMfIGOoLRIEaF6A9pT48Z70+DrkSivpVw5++Z6Ffpjkf9TNLm
	xiBXa1ZjwNhw==
X-Google-Smtp-Source: AGHT+IFGiENT9bo/KYnc/SaMcOwWaA3Qp5QPI55nxJzWPb9rVJvf1hUhKIgBXV0vb63SKGIlNcdDBA==
X-Received: by 2002:a17:906:c145:b0:af9:3d0a:f383 with SMTP id a640c23a62f3a-afca4d61532mr187400666b.6.1755115810602;
        Wed, 13 Aug 2025 13:10:10 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:10 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 05/17] HID: pidff: Treat PID_REQUIRED_REPORTS as count, not max
Date: Wed, 13 Aug 2025 22:09:53 +0200
Message-ID: <20250813201005.17819-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's naming suggests it's a count of the records required by the USB PID
standard and this driver.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 2f9fbe4c52d7..cff79e76c211 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -33,7 +33,7 @@
 #define PID_DEVICE_CONTROL	6
 #define PID_CREATE_NEW_EFFECT	7
 
-#define PID_REQUIRED_REPORTS	7
+#define PID_REQUIRED_REPORTS	8
 
 #define PID_SET_ENVELOPE	8
 #define PID_SET_CONDITION	9
@@ -1056,7 +1056,7 @@ static int pidff_reports_ok(struct pidff_device *pidff)
 {
 	int i;
 
-	for (i = 0; i <= PID_REQUIRED_REPORTS; i++) {
+	for (i = 0; i < PID_REQUIRED_REPORTS; i++) {
 		if (!pidff->reports[i]) {
 			hid_dbg(pidff->hid, "%d missing\n", i);
 			return 0;
-- 
2.50.1


