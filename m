Return-Path: <linux-input+bounces-12551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A62AC30CB
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91E316F916
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942061F0E50;
	Sat, 24 May 2025 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4rQGyeb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67551F12EF;
	Sat, 24 May 2025 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108855; cv=none; b=LoJ/6eEy8q0Ux1lce33u5w0pkdNYbaTf1Q3gU3Fdn3Yvst/xnYXz8D3wfzccpM5N+x0dFhqlfqz7vyuiWP2ywWJCY7K4ebYxhigvo2WUnTrYh4nNfJIwbSe3HP+Y+ORYXKh7hYPe2we8o6WsFdAnXYVr8PVWvsAEMU8qINVKfTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108855; c=relaxed/simple;
	bh=zy8rXkQR/12XJIv/cyUeyxPTECu7UTXOB4DMs/lKhVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hnqa12OIpOvLm+OrKSSIAdoiH0nfZxR5G85dQg1ijdL+pql1MIJEGzME34t2uD7bbr7thixqAW73PSfhsThtdxY7icYmR+6iC5EiQfArVo0hRbH/BcbVRSz7omyOvffMEZvhFWfTZ6KhguN4zF135wgt+8XzpEn/pfoGXOKEyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4rQGyeb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6024302aa2bso59700a12.0;
        Sat, 24 May 2025 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108852; x=1748713652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcKgn3xaxIsFlAalN0V77zP4gMDiiYFlSgkF4QoAeSU=;
        b=Y4rQGyebkRGPwRpBKyWdz+u3MdDjIFJ9dDAO6mWUwcbgg7umT3RY/zRtJ59T3KmqlP
         WcawPcGJc8d8BN28QTHkZNf6rN+ndKslnsUna/mI/hkBi0+0VZ7oTbGng2wOdmvddWCk
         3cAIgXs7NVa6wVE3XFHDH3bgNIySz62HxnjTnygLLw51tpWuviWvIEn/SGoRHfLvBB4F
         Lf9n3O5E6uqqRtDRMzy9qXL9wTNzEsMCQ9YyG+4RL8y+IOQp9L5AWa/yAr1uBQPbsYV9
         0/2TI3sznHcA6lA4FtyWrL8LETKDNr+JNqyms15s4FDh1m73MQpBDoda3dsAjg7ApG/g
         D8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108852; x=1748713652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcKgn3xaxIsFlAalN0V77zP4gMDiiYFlSgkF4QoAeSU=;
        b=EWAGk0haiqbiPUommJI8kl1ucEPGbI0csCsz/ojtIFXAtk6Ge/LOpyLx9e9qulnsAd
         z0Z89r0S5MiDObhL5w3wyIw2EGwAyQZ6aTt0ojEH5CJdetEK8CNn+lvsjMc0F9V8TOS9
         o5arIwrw5LyWHIOwkF3w52X4OVBNX+GwctIxzApFtlHuDcghwrV8NGPtAwDH48PftdI4
         NyFHBcmASykAO9bZJIYP6sdk72eGrFJteYO1nPs3KJ1F0SF+rfR0bcJYVZ9k6EODjNlD
         tl6ZV2Ef0EWBWJ6xHAPiVcwKTGWd/NGC3Nk8PWJJTE8bjd1mzw70RB8Y7bRQ6t7mbBU8
         d/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUvhJHc/nyLbWj/6yGhQa2xMutkOPUWYGBsrod3G/G0RBHrKR9o0OYgMH9t2tR6HnCYiNrgs6XBEaJbrg==@vger.kernel.org, AJvYcCVgxpaL21sga0knknso9Ct9DkadUa6Le3VTyrHEhnA0tl9oW5QPC3RRGW3B6TN4rKLjJWKcwXI1ruoZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwLL27MBsxbQAwv7U6851RhjUYOIqIC3aYvvvQFogPSfNuU9bdL
	dYHXIygkQk2stLxgiH5r993Eldx3E3+09aXWIJur08ZejnGFbUHKi0L/
X-Gm-Gg: ASbGncu0BQYrIKjQNZZnxqmq82sGo5pyYipfh07TAcxz8f1gfmKWgAQgOSs6AS82iq/
	6LSKWDUTuPNP+5dM9Vmr4ZRyatgdP2zNr88UD7KPoI9RjrOavZglFDeR+X/9+xg+231+XIvyhRi
	ABc9V0qczToQf18TUh0G53OtMDHyQcF6zPqa6PbKBNyJDYU7zn9jWRQSC3pIryf2vp3mWRfUMuM
	JSfxPgxZdHzVSxHMpsMS8klRdggOgdp2JqOiXpNa8b2zmHR5hYYzm5wEw7s6wiENpt5DoC6kxzS
	5+cH/yFUqD6Lw6dERV+88PDsWvz4OhKcKjYD4UnXbWnlLBHfzjquMqogbYRap0+4Zd1NuaZ4jR2
	H
X-Google-Smtp-Source: AGHT+IHH//BIT5GiUxtdk0bodMEIXn2tMUESaLZ9E88lb5sQnxDSYJz/aQvX8kLUyaK0jJxmlo5SPQ==
X-Received: by 2002:a05:6402:26d4:b0:5f9:2a29:543b with SMTP id 4fb4d7f45d1cf-602d9dfccf7mr994423a12.5.1748108851936;
        Sat, 24 May 2025 10:47:31 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:31 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 05/11] HID: pidff: Remove unneeded debug from pidff_clamp()
Date: Sat, 24 May 2025 19:47:18 +0200
Message-ID: <20250524174724.1379440-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes chechpatch.pl warning about missing blank line

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3c2b20cf7853..44cbd2a0461a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -210,9 +210,7 @@ struct pidff_device {
  */
 static s32 pidff_clamp(s32 i, struct hid_field *field)
 {
-	s32 clamped = clamp(i, field->logical_minimum, field->logical_maximum);
-	pr_debug("clamped from %d to %d", i, clamped);
-	return clamped;
+	return (s32)clamp(i, field->logical_minimum, field->logical_maximum);
 }
 
 /*
-- 
2.49.0


