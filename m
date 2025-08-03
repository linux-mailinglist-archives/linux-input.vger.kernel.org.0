Return-Path: <linux-input+bounces-13772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CEAB194B9
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE31717330A
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C9E1E25ED;
	Sun,  3 Aug 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqcaoQsx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7C1DED63
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244842; cv=none; b=Jfupp8EJ+IwIbPjxGenp7gFLwKuJMVs+zEuf+Mv3/cvA1HX1iOC/GeJrOKle2ppmlBxraiDHf/CR9gy/lInzfRUgPtCjM/7zsLZq/DGKr+Vf+Xsi7lfe5T7c21iM2Mc8vfw0c+4ghh3v5IhwdVy7eQYtdjkCJqXi9QLVafLzeQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244842; c=relaxed/simple;
	bh=fSeXuCNLn50zEFEYr+dX7zcSXr9kE/0zvHaTMnnz4p8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGM8XcjIPtpmkxqbfrVsd40II0vmlOmT9gClCjez9SAljLpQbfgYXaD9oYFwWhK9XjVSRACBXiqy2vCsREhSH7WQhcl66GmzB9A8T1h70oyRVFwS4z4atVVIjLt+n8LgzZYreopQ7/zsZcrrBHwe4XVK1f9p4zosjb83gVURNZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqcaoQsx; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af94440f4ecso26190966b.1
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244839; x=1754849639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtOrb7V+J7PqCFzhJp4YD9Mip/hvCyAShGIDPm0hP+A=;
        b=bqcaoQsxFylKZ6veQMzQkeXUfGEj5rJbxkMmiLIzdf6lUS8oKG7a1YKE6SYk37wMy9
         yLRm5QAwJGFLf1K0m5fy1nUWwvWiJt/IHJboLIpEh9PaPUDjZtKPVHDOmpRzqTz97niJ
         usrRf9GY9TsPqXdkZmCcskPYj0b61GDBnrTC4kGMIUXsRxRuGy565tO5An1WQa+ZUwYg
         UN217qD3YZHFsZogDLcx1D0w8Il1F1gW+X3bpiuQSoS3iAHjYNfGNQDM+LbkV4sRE1v2
         A2I4I8PgTcpGMS5r9pgtDmVtHqFwd6pl7rx/tvO6WOirvGGIy5N0CRbUQgamAmemA4b2
         5x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244839; x=1754849639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtOrb7V+J7PqCFzhJp4YD9Mip/hvCyAShGIDPm0hP+A=;
        b=ZbgZUTP7TEMiESMUyE/t7pzqJ7ZlWV5LieYa25Oiv08K+neuEUZGNT54IQTQImvr9u
         Gjq7AzO/5Zi9HuaxIKlh3Yge9+pOxueGrwUVU4G6yIQ+Ysa3rrX8ovym8a1IuJj0yzzK
         xV0yRljCfshyURQvalbjiPFUDZ3udzzHqUVcl1mlMEoNxwBZCNSYVvgNdIoN7R8ie2+d
         9oHhXlCYLt+73vKryWe73KNFSJs4BYcOGVs3tlwtNryKtexsHNXsBFr1HPhXlt/VhZNe
         uAQaSnVV33MTNugfY4Kc/chWnjTWmwnDZj5MQ8axg06/CCjisfMb+xn5OGQK8lr9tIaO
         XO8A==
X-Forwarded-Encrypted: i=1; AJvYcCWEBx35gU2FjNUaPAwZF5FLfI8x2oClKHAUUcIanPhFGdYbNnkPrbuYNfcZGYyNj/f405WGrsztORb5KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfon2Y5YP2A/bDqQp+ng0UbFXDJw44NP3TzxKCxgKbV60646u
	TIFSa+R54/feMWu/0JRp97bTNKDZqHDV2RWS9qkY4E3rZX7SzO75OAdg
X-Gm-Gg: ASbGncvA0HXOvnmmCqp6scSdU9P+JF4mSayqDNetEjzpzMPfHt7NXZBPS62EoSl/Qb1
	4UNje7cFLnrFzrqiLBkfWDCPhik1e60Z2heCKsd0DpAHs6YlSUrfI9etvfDpx2LuBaUilDE1QeQ
	WWc89NmjwliXBiYIU+Fg23zn/LN8xbFDf+qHOdHPqMWGyTa4CZEqUl2R8joiVHI3kLZR5XHIS3v
	Ztzj4VqSY2ihdeulqYNUhY2soX74pRopqK9qITbX/Y1WEwBIR2tyCNY1GACNTyd0D92f6vviud1
	I/7ArfvxdJ9mKLQ+Or2bxWgqmUs1LC2NcckF5fEZFYl7CAB3WXEbZiirq+Lio5BDJ1hF9fWEdPM
	W4gFMl+Dbeuz/TpAlEFkQRUM2vaEyxB/ai6QgNF+iDcFiKk0bQkfqLC/rtexHw3Uw7eAxKbxgDS
	4sw4jV2Y8MAg==
X-Google-Smtp-Source: AGHT+IHW5dzWHxqhPO33nV8810UmgUwJLMifA5BMXGaJH27TIGxKCuuMgv7voBrRw8WZEvam1EV5Jg==
X-Received: by 2002:a17:907:3fa2:b0:af8:fd22:6e28 with SMTP id a640c23a62f3a-af940085bddmr293055966b.7.1754244838710;
        Sun, 03 Aug 2025 11:13:58 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:13:58 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 02/17] HID: pidff: Remove unhelpful pidff_set_actuators helper
Date: Sun,  3 Aug 2025 20:13:39 +0200
Message-ID: <20250803181354.60034-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Abstracts away too little of the functionality and replaces a nice,
defined value with a magic bool. There's no actual need for it.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c6b4f61e535d..3cf844f7ad4a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -605,16 +605,6 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 	hid_hw_wait(pidff->hid);
 }
 
-/*
- * Modify actuators state
- */
-static void pidff_set_actuators(struct pidff_device *pidff, bool enable)
-{
-	hid_dbg(pidff->hid, "%s actuators\n", enable ? "Enable" : "Disable");
-	pidff_set_device_control(pidff,
-		enable ? PID_ENABLE_ACTUATORS : PID_DISABLE_ACTUATORS);
-}
-
 /*
  * Reset the device, stop all effects, enable actuators
  */
@@ -626,7 +616,7 @@ static void pidff_reset(struct pidff_device *pidff)
 	pidff->effect_count = 0;
 
 	pidff_set_device_control(pidff, PID_STOP_ALL_EFFECTS);
-	pidff_set_actuators(pidff, 1);
+	pidff_set_device_control(pidff, PID_ENABLE_ACTUATORS);
 }
 
 /*
-- 
2.50.1


