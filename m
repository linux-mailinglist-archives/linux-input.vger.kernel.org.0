Return-Path: <linux-input+bounces-10371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C6CA45039
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 23:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49BE3A953F
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC84F218596;
	Tue, 25 Feb 2025 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyGnZW7M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC021764B;
	Tue, 25 Feb 2025 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522614; cv=none; b=tkeJuHK1OeG3qZ/uN/Tz2xecwGN4NGQvq1yQOM3QtZ8vnBeJt6yD/eWmXoIIFy32l2+IRuLQC8vf5SuNawVHoWBeFZq4sDA8YeaQvFiCHN6wzzWzQLf2XW1sBrst12O0GSc86h2Lk7jneSobI6HULW7mzEHSx4TNGGHaMhfJfuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522614; c=relaxed/simple;
	bh=YQExJ7jUd/Cw+KmuNvncQzBndAiLM9ouibxbO6Z7Hb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=labVzZz2++jyaaFcx3XMmOJaWtL+m/9TUP+stKufwdZQV1zkX/7E4+4N6TThkRSsU0Lh9pP8p3HheEOygYuAnqERoTlbOFSGHenjleFuGEmIvielHxi5/FrqM4bic1lqP5WAP9tKLC2vJyPEdlDqu2YWPzoNSe3PNnZuhXVaWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyGnZW7M; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso1200151a12.2;
        Tue, 25 Feb 2025 14:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522611; x=1741127411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLX8/NM8OxV+h6FP7c/FoaB9RiQlmNSOqyds5cH+az8=;
        b=lyGnZW7MmBa0oC2Xqk42KBcB2QEfVFtqp9tKuhtlOLOJLk3Wr8ie+3s5hNeLT1KVH7
         IWd4f2C4+XuMv7NleUUXfW7zwdM3/PPx//xXub8U4Meh2yzRu8f3XnaOuTYLHVszGZ7z
         hhIyFgruThrHCQoQqLwTQsRiNCIo0BCLj70u+IiAPxkkenIjw4WJKjWRIBUSN7aU4yYd
         AkY/A1q3gwZGS/npNj9PU24ovgG8UUG8/0YsZND26Y5lt9L28qyT7ePXK7TjE8namlfl
         KUxNAel8diq5sJk2id9Gd1Pw5f6iJya9vhnqa6uYxAVtZy36cAreI/VncXl5R8ziG7h8
         ugDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522611; x=1741127411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLX8/NM8OxV+h6FP7c/FoaB9RiQlmNSOqyds5cH+az8=;
        b=cE/CwGaQ28JKs6HC9ASuEkt3AjPGPs500noNxfOQhiTnwAkKVc3NQBo4QO7Yt0EyVg
         mGnuI2U/t91UqQ+F/auroGoX1NcZ1uld+yLOzKoEuxXnWItkjJ/10wEixeVeaX5lqbh7
         tSJbuYVzH1It7yHtUiYZfV7ACNiTSLPe9Zigw9peWeSQANx9QRCF3yc+Ac7j9lkPcv4q
         OJFipER/32beNRewd4thxef/BuO0SzwZ7ybIKjOwtJkn5ch2opxqB9tRtDItnHw1eqY8
         DQAz/NQYnEa8x6Q+j/1WOXffYgvzSKlTV9Kjc6SVjDTLjcgMK+qs7g/gd9ErFQbA2V2U
         vMzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7TuBFfifzRKSYMl98prIbD4yOEYtMpFumfbgvqpjX1xUixg4jx6jKYEM+XJJckwjKr8Fy4pr281JN@vger.kernel.org, AJvYcCXTVnya9Cxx2b8RLKvjVy+f/QIPrWrWWs8Y0AswX0IKG5oyx22KPjjKahMxxWaPoIspDIX1GpeAZ36F3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaNNbGQIIFbpa9PlC7jx3cVOhGDVkNt0mRUWkQ/giMGgMFqDVh
	7AMK4zXy5Pxnn/GUxqlC4T3xHtZqVls9w57CdryrRcRi5+5m/6eryhQFy1vt
X-Gm-Gg: ASbGncttA0bP2l4CjkinVDKN/owaoFQwxL5P6nQw7T25PuwQBQBij7QHEjgN6MgKEVu
	aY40tta89aAXVgLkBcTDPZ82PhAn1fov2Oz4TuGQ8CoORTiKZQdZAeK7ysj8T4lbWYXCAyDb3jD
	IykHOofrNl8BZwHRFr2vMB8l+XwkT8rZiZmG1mEoZSsbZTZ4xbAnx9XPxmgZxFC5KycMS18JhcZ
	CuNoQA+s0uTjIF7dokD2AxspnWECfu9HokOanoYjKrvpHjYRGLXwWTITtihOv3HkxabgXqHb0DI
	HOJWKe3aTX9HmE1Eah6MoDV5prIofFl4/6zIu8jxeI83+SJpYhXIrGOB3Iw3XPoH4LqkZ4Yo
X-Google-Smtp-Source: AGHT+IHI8cDfz33GKziKjJ4eAAoTG4XD+Ol4GeOC+G2hVBmwxMY3juXWCtElj1rELPh4lx8JOMOhTA==
X-Received: by 2002:a17:907:7e90:b0:abb:ebfe:d5e9 with SMTP id a640c23a62f3a-abc09becfd6mr656644466b.9.1740522611194;
        Tue, 25 Feb 2025 14:30:11 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010f74sm209122566b.121.2025.02.25.14.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:30:10 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/5] HID: pidff: Compute INFINITE value instead of using hardcoded 0xffff
Date: Tue, 25 Feb 2025 23:30:02 +0100
Message-ID: <20250225223004.415965-4-tomasz.pakula.oficjalny@gmail.com>
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

As per USB PID standard:
INFINITE - Referrers to the maximum value of a range. i.e. if in an 8
bit unsigned field the value of 255 would indicate INFINITE.

Detecting 0xffff (U16_MAX) is still important as we MIGHT get this value
as infinite from some native software as 0 was never actually defined
in Linux' FF api as the infinite value. I'm working on it though.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 74b033a4ac1b..a614438e43bd 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -283,8 +283,9 @@ static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 	if (duration == FF_INFINITE)
 		duration = PID_INFINITE;
 
+	/* PID defines INFINITE as the max possible value for duration field */
 	if (duration == PID_INFINITE) {
-		usage->value[0] = PID_INFINITE;
+		usage->value[0] = (1U << usage->field->report_size) - 1;
 		return;
 	}
 
-- 
2.48.1


