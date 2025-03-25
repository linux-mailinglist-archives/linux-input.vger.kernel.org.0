Return-Path: <linux-input+bounces-11173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDAFA6EF4B
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6807D3B9DC3
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 11:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48439256C92;
	Tue, 25 Mar 2025 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/DFD+DE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731B2566EE;
	Tue, 25 Mar 2025 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900899; cv=none; b=BPopCmtS/mYRu/ogV9cnQAeJh1fRRNwytfBvbUt+6NW7fhHV3oY7szC2UlNnSnGhcGNVYIFBfH5B+m5+7koNJAPrTujV9lKaMPGU6dZtPFQfpLkdxG5L/1GZj1Dx5EwVQih7OsfP13urChFGU9aeYRwti8XR9xeFuGTY/XWBK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900899; c=relaxed/simple;
	bh=wsf6HQ3e9ANkj1wavedwTlk4WkJIb+tXkAOYeXEKyrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEzXM+ehWiYvG1eoa3h8gBdnVtNbbAbWfOIo2WzEjSZkqxkX92DvaJivJgZw3yNRFS7hxAzutBUaHcNV42l05jOpH8Uo5GZ3hm68+kBiw7ZoHJAlI0tCLZawK6ZDgFNzwMtmo04bgZSvCjwi6EotaAaVLpdkN+/r5Sx8JZJQBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/DFD+DE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso108476435ad.1;
        Tue, 25 Mar 2025 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900897; x=1743505697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhivfD4EuQErtuhsFEEmuwqN+9F7EVr8Uz1K/b/I6E8=;
        b=E/DFD+DEAPKOkiS82slgQn241YEvKDvsPUwRNMMVkvYxrhu9merHBKlp9NAwbVIYKp
         kAePGrJ21p8mHdeKrutoURZ5WUP/GF493/lOsn0z4bMGONgPrgQo2owL+d1oQJgDvXJB
         uNa7ZH7z1R4izXSGmqUDl50b/RFeyl/SlxJVbE1r7iTm5J94D+97C5y89+HfuycSjOaK
         n4s3zWbGfrjtUJmbtv3IhlllizhTn7A7AV4RXi7/fQWvt8ZJmHqDwH3FHO7RnBOlGQ7Q
         PpvqD98aC3qmoegXlOvpXduKIHAwLsyq19SwrncnofaM595vwq+cIA5USJTjykvrTTfE
         bcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900897; x=1743505697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhivfD4EuQErtuhsFEEmuwqN+9F7EVr8Uz1K/b/I6E8=;
        b=ljBATaRYsoDIZa8B58ekNTYrZSRnTxrI+bm//6ElCucThkSof+dgqA2PsLtSsFS5jy
         XBWFYzWPDMz0KWYirwxHS6SexeY89BcVb5yaIvazOPJd5wEvZCGQ/Bc3tmej35W1tzRp
         1eiF08VdxuXdqxel7QajIQBaEYPH8fka1Njk6yFdbldSfwhH0E/E9n7AyEXOpTQSdNNP
         boHtq7mObVhPUbGtlSavIlsKQil0kXAG4Q9XNFN7flF6miLD+6GzaFHuH4LEBqUl4jll
         nC5txPbdyeKGD/I7uLiUnOIavdBm1h1jWfkUrC3tbiVeS8ivqvExIDM3VEQJk+j5RU5m
         2+rg==
X-Forwarded-Encrypted: i=1; AJvYcCViEnWX9uSfDn09RX4VLMTo+UYxXLBJZwtmcJaHKAsZBF0Y0MpBETQzSAXqpG+CbFZXNRBht78i3gtw8g==@vger.kernel.org, AJvYcCX6ReV24Xt5EuGrJBdJF+tfn3RtaqZisUhGKqcv0hjS5OQfcWmDh6kN3IRBClGvdIBpx3f9uBh1lMOPLSDw@vger.kernel.org
X-Gm-Message-State: AOJu0YwNeYCMCqoyPspgGDkdRdiftgc9FsZ9JUEMbayUYGREiyBD+yhZ
	SPJf9LW5t5n7BEkSl4P52A/LEDvwoQFVXU6BwecQnUhOwXbtZ36q1Zfm4E2tSyg=
X-Gm-Gg: ASbGncugnWK0ziOZCV8LLkB+EM5uqZH91k5uh42v4Uo5gulUm5HA2OybqVBLWizVeKW
	h5AYLIMM8mS6zvN2YV5tD9+YvqkPz94PPkDpZ7S6jUvuJvox/Eq3UJMXjfoHpqWj6XUtnMjVdV3
	nm1wtaFWg8gIYhyLIPiiMOlhJKSZpYUR76VT9Id+CwenUumiYXvNa6z04zKxlAih1hbeWLLmTy6
	rUB5zQWokTWAxVX0KTC/8gIBpD1ccCx5/S4CPlSC9WUy+3JJTsmoF7TLBWZXzIT8HcWHbqEbZg7
	0CKVsGc/Xp0bF6wfr76G39QyW1sZF+4Zy+jJmu1Ay7voRT4MaI+sxR1TkPXe9W/E0hXyXvhWVmI
	qH4wDOzN/ez90J1RB52V/dKlzIaceOg6g8GMUcukl8FSu0A==
X-Google-Smtp-Source: AGHT+IFAEj5uu/zcfGHVZlAFWlin3o60E9QxXNcBZxqcl7bVTv1Q5Kvgnkidn6vc4i6BPtUSjE2DPw==
X-Received: by 2002:a17:903:22c7:b0:224:2717:798d with SMTP id d9443c01a7336-22780e44079mr243169665ad.50.1742900896945;
        Tue, 25 Mar 2025 04:08:16 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm9787667b3a.152.2025.03.25.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:08:16 -0700 (PDT)
From: Aditya Garg <adityagarg1208@gmail.com>
X-Google-Original-From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	gargaditya08@live.com
Subject: [PATCH v3 3/5] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Date: Tue, 25 Mar 2025 11:05:25 +0000
Message-ID: <20250325110754.28359-4-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325110754.28359-1-gargaditya08@live.com>
References: <20250325110754.28359-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The APPLE_IGNORE_MOUSE quirk was not used anywhere in this driver, so can
be removed.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3d7befe0a..fde438bee 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -30,7 +30,7 @@
 #include "hid-ids.h"
 
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
-- 
2.49.0


