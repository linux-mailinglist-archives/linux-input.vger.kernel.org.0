Return-Path: <linux-input+bounces-10370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86AA45040
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 23:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769CA4242E7
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03F121770D;
	Tue, 25 Feb 2025 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAYio6MZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094572165E5;
	Tue, 25 Feb 2025 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522613; cv=none; b=tBznM1rhfFJQTn4sTeXdwf6gkIyiLJg6VPC/2xKL2qM4StmGq2VTahHW4P3cLYoNb7dtAvOe8mFax4BXMMlvxQHtVnWt6wLxgjjemOfo1G09fTTldw3+GQKvjc/FJ30ka5Uh0sclrgdR8nBRdNe+DedH2q9VjPpRHS2Tz40TmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522613; c=relaxed/simple;
	bh=ESWHMUxmV52Qaj36P2x83E7I7NyZYOkBXsH2Fo96Pno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMo59I0lzQYMgfUooaC9OAyxAFpJYJybXIP3J6N87HN1aXpO8jsmtdIda6vq6Y/Woo9hHjuW4lVYZHNgi1gnpqh8rOoRidhwv67iqB1ZdZHVQhejVORKz/xGrtJ8pKKwu9qJNfWKv3vZdwdkbl4MprbRAuBjlvf1kuI+64VxBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAYio6MZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb88d2b67eso72916766b.0;
        Tue, 25 Feb 2025 14:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522610; x=1741127410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRf1ILuW4AlRtlcIymAG7O6j8cyk58JheUtEmycHXyM=;
        b=RAYio6MZBJiDgY939ftTEYuZOJbY2eJ9O3zc8OeUGFQPFRLcTp5cUmu2X8Mxvvtj9I
         3F4mC+3f7bQjeGzqANp7IkLbmrOLmucFBG2LqQBkJ0E0Kd3f5kjF1JjfF9KQe57FGRLb
         /nX/XDd0i2gkyagLlWPokz4eTbEOP+rWwDYxB9dO2fVs/a95q7FNVb1/SttlEnxxBo4s
         EG8lTER+2+xjW0/w1HDQFAYqIi5oymLO17ROhLXUPBRHGBC0iSqoyoHJO+U5al7I3oZC
         Ch8vyELa8npsLDeIQTIObDHd/U4XydB8mLvZyKoIRrJo3mDnQ1nOjeCnNd+E/Q8lHzSn
         ibmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522610; x=1741127410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRf1ILuW4AlRtlcIymAG7O6j8cyk58JheUtEmycHXyM=;
        b=Rvj9Idrz43EHa8BIzBZE772rGUeiZ+n3Wb7F1ti4hj/M9qTMq5X0OqR4RTct1wz7Fr
         TUkrFmCVaX8AsGf99ev021FwQHIYMdtRiUPI7wQiLd8evce7AsCc/zxyApybNXT5E8Y9
         vM2TJty1u/xYccp9ub2hdqKLi1OH9D7HTzpYSHDMQCLAekkHzBkKhmLKw8RfxOC6ZaGJ
         HCrjoxVTrtZPvwOpmLl0LSE8u7UW3/Q2+SkRYEeW2LWU35vIT4kaR/8hfvc7aPIe+FMf
         ZbK5GZengjg5i5fJpif1/rQVmN0SyWb3tRNVS/SUXudrT7AZ7qWA33+fRZy16LBopPGC
         Jgrw==
X-Forwarded-Encrypted: i=1; AJvYcCVY4Ztsz6TVNXBtku80H+uOd5TJ4RwbyitsUeZFhmNI/i6Nn+FYbrjWtlSzuT88JDUSRKGCROZzuNDrFQ==@vger.kernel.org, AJvYcCWEnhlgPWPSITR64IGQKVa/UWmNBUpGGLGhN/Lec29qZvDofKV9xXgDsjhAqBtq9za8PehncYtf0eCK@vger.kernel.org
X-Gm-Message-State: AOJu0YzQgBZEpXZevq1UyG0VHZ/i7mdNBSR0JXLI7Yn6RpdiyFb5sowQ
	gnEjJSqqNnuRDZ6O2491S/9EWYh3PnQYo+hTda9jU/CSKAfSjWZb
X-Gm-Gg: ASbGncvThB4n1I//VCbbVkHYWt81H58wlj6PyJ2hY20dIxYN9qvHey6unYOZr6a9XtP
	lYYNiYMdyAEaFYIGDF5U1pNplQ4l5KEoqXHRbk+NF2l810amOeMTyaZFXel8M5dMtC+rWmZOI42
	ddFu8Do1lkErVzqWC0GFtRN95ujOhqzTPkvezI6OA7kvQVoFsyryjv4AaE9wjuwDSCXs7nRIw1X
	aZYNpGYWWsxMwvjmFFUhjCPrsEqoo+jbvqdz9EhvLbyZihkc02shklUK2+m1XaRdK0qFhJLAHLZ
	+dL/jGzEQ0s50wkknvJUsfAdrHdQ78QcspDlMK45Ia2pmdJA9YVOSC9YY8X8nXLPfvLQn7nb
X-Google-Smtp-Source: AGHT+IHBX02/xI4FOdQxhX0adLlAWoHjoIp9ates0dEErgTqSCD+AyeIlyK1LkogAycDgE8tAx0hwQ==
X-Received: by 2002:a17:906:7312:b0:ab6:d660:c84a with SMTP id a640c23a62f3a-abc09a0c05fmr859688666b.4.1740522610111;
        Tue, 25 Feb 2025 14:30:10 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010f74sm209122566b.121.2025.02.25.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:30:09 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 2/5] HID: pidff: Clamp effect playback LOOP_COUNT value
Date: Tue, 25 Feb 2025 23:30:01 +0100
Message-ID: <20250225223004.415965-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ensures the loop count will never exceed the logical_maximum.

Fixes implementation errors happening when applications use the max
value of int32/DWORD as the effect iterations. This could be observed
when running software both native and in wine.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index ffecc712be00..74b033a4ac1b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -690,7 +690,8 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 	} else {
 		pidff->effect_operation_status->value[0] =
 			pidff->operation_id[PID_EFFECT_START];
-		pidff->effect_operation[PID_LOOP_COUNT].value[0] = n;
+		pidff->effect_operation[PID_LOOP_COUNT].value[0] =
+			pidff_clamp(n, pidff->effect_operation[PID_LOOP_COUNT].field);
 	}
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_EFFECT_OPERATION],
-- 
2.48.1


