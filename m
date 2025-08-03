Return-Path: <linux-input+bounces-13787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95FB194C8
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 956CB173300
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176771E7C08;
	Sun,  3 Aug 2025 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOnqghBK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0CE1D5CEA
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244855; cv=none; b=WVsIfllyw846YsufjfFbXLmnuw0G6LV77H7E59GkUTYnte5d3puQJY4elYHlggpwRVbANxb+78TNA9UGyXwns2Kwo7ow4AgkoaEnk3lhFsiOWpqdEpofb0LUeqaO0Q37sw6OUzpRFW3MzIVjcjF+P7GIPlIm5A6BCwwmIyAz7yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244855; c=relaxed/simple;
	bh=3BxJxZXbB5unfYwnDzhxIoXz6yB5FGiS4IgugSmolxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UQYh/GAeFe7TXRNk3FqXRqgAKSwz1+dDI4KAJX82i81nd0BUvm6DSt4BZG+gpHpFLmaBbvJYluEmNvZrI+zRLqq9O11FP2q/ormsLz6wgrCRvQT0KDOTqCrvc09raE8vfHEAWLtqP/mugwF/AnNdxD8wz+5uome89BR+kl4W/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOnqghBK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af940717331so38919766b.1
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244852; x=1754849652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0MR75+1AF/iABvrz7m73mqJnwV5J6bUgQ3VjSaYfGs=;
        b=jOnqghBKyCrO0mS62utCWeLXoEd5xpQH8vdVjhdi6nrJMOFhzoKQUfEWSqp2xljdpT
         17yIbyA+Jf6PwVDtyh4j+8MoGPBKEOXddFoF+uUUDI8eJuDRVSrJchplE5umvLsZPW2i
         12xXZhCyMAWL3fXvZIF/RcNUEziVp/lrB0ffaYUlm/4fSfmgjD0p1ZAT4PtY8PslS3KK
         dD8bsJaiMlR+zU77q7AyVTY+GwEKS5jRLjKzQD7UkO9duBlbYmj/CAfsPH6TQZY6yqm0
         +zpwzaHcHr1vPD6ONFL2MQ4F16Y9TXOkUh1tgggBLyH2MOvnC7bL9FrQ8hzwjbkFCx7v
         MW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244852; x=1754849652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0MR75+1AF/iABvrz7m73mqJnwV5J6bUgQ3VjSaYfGs=;
        b=Dz8zYGgxlRcijIKXUtI3jwKMVZI5MVkwtlcaNj9jPCCokbQWfdjeS+17vMNCE5dnug
         oEE7QEd+BKHgm+Zy6WQlOb3u/l7GecWwnwVwej0QLg8uB/gxUnt520ZRMY+tKY3Jze5W
         5J2ceeqYnyP0xsMqceGYxek2fpwveEZLki5Sz8s7TawC3cb+kn2uSlfljypntQoD347Z
         MWbj7c1mYevoBFWmUniZX3Lk1Tv8ek+yEw+sOz/mdJQSbp1or972iJf/J+BsDOIrmfnF
         c5KUkWlzOxSiyQSJgBYKZe0Mb6dydIEYqHQwHwSLEmK8JW3X4WurXDkn/c9YtS+rW222
         FzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/rUtUVLAFwdKLrysjD9HQdnXnIA2QY8Jh2VaKC0TL7rm2mzTXWrKOxcbeAjGxGT6q5H3tNWK7m7/WKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdBQ5zRLhEes+oh6T9ooDGMLMkQOw/X4fAIzMAdpejPnoO4lC/
	lOmpwB8wAlh3tQXcL0dqjjiesHIgqQ2WWi+WkzN0G1S8qRiG0SKMJxcfsU2EGw==
X-Gm-Gg: ASbGnct/97jnAfbK9rEJDJkXTOJSvBf2CXt5UYY01GPz81A7RyS3bXyJI6VH7VpiX7L
	3SIqydXulVlBvGzfyHIfTaw7FSuOG8p97YsAxcWOf7hgNQkLaXf0onFJ8UPaXOl0gRXAA956s5j
	Eq8AOVTQARWnByWhUoQjnetlKGQlEJORXQF/8oqM3KtFm+idPlbx+nHVeSHveazSdApAo+ODeWN
	IxbDwprb+X8hCRaTL1OsOH+PmroWHRrxfnE2Zage1V+EeXJDNqhiPEF57V1Yi3LRS7VOBvxyxnY
	+srpHbotArArThlNTRy+9TG11ZriJur0yivvEILhD15dq17mJu7gccFTKO0B/iDMgQ2pgyXNNOO
	poGSo7TfbLFo5Jd1AVlnsB8CTXKfuQeLwTPcXeSkl/IsESoDHbvAd9dt/APyqwTNScFyVVGJI2O
	EHVY9TkzoBCcuPRdGGuUtK
X-Google-Smtp-Source: AGHT+IGPbWjjYkFdfJq6UKa4khA8hkbPBST8x3huxI7s1lfeg+632TaCASmeJwmdalSB0Fn2aAn46Q==
X-Received: by 2002:a17:907:9455:b0:af9:30b1:aed7 with SMTP id a640c23a62f3a-af940048c1bmr297806366b.7.1754244851543;
        Sun, 03 Aug 2025 11:14:11 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:11 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 17/17] HID: pidff: Reduce PID_EFFECT_OPERATION spam
Date: Sun,  3 Aug 2025 20:13:54 +0200
Message-ID: <20250803181354.60034-18-tomasz.pakula.oficjalny@gmail.com>
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

Keep track of effect's loop_count to reduce the spam of ffb play
commands coming from some games. This should speed up normal magnitude
etc updates and slightly increase max possible FFB refresh rate.

Helps games like Dirt Rally 2.0, F1 2023, WRC from KT

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 36 ++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 50a8924edfcc..0342c0a3f476 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -184,6 +184,12 @@ struct pidff_usage {
 	s32 *value;
 };
 
+struct pidff_effect {
+	int pid_id;
+	int is_infinite;
+	unsigned int loop_count;
+};
+
 struct pidff_device {
 	struct hid_device *hid;
 
@@ -202,6 +208,8 @@ struct pidff_device {
 	struct pidff_usage effect_operation[ARRAY_SIZE(pidff_effect_operation)];
 	struct pidff_usage block_free[ARRAY_SIZE(pidff_block_free)];
 
+	struct pidff_effect effect[PID_EFFECTS_MAX];
+
 	/*
 	 * Special field is a field that is not composed of
 	 * usage<->value pairs that pidff_usage values are
@@ -230,8 +238,6 @@ struct pidff_device {
 	int operation_id[ARRAY_SIZE(pidff_effect_operation_status)];
 	int direction_axis_id[ARRAY_SIZE(pidff_direction_axis)];
 
-	int pid_id[PID_EFFECTS_MAX];
-
 	u32 quirks;
 	u8 effect_count;
 	u8 axis_count;
@@ -798,6 +804,12 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 	return -EIO;
 }
 
+static int pidff_needs_playback(struct pidff_device *pidff, int effect_id, int n)
+{
+	return pidff->effect[effect_id].is_infinite ||
+	       pidff->effect[effect_id].loop_count != n;
+}
+
 /*
  * Play the effect with PID id n times
  */
@@ -829,9 +841,14 @@ static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct pidff_device *pidff = dev->ff->private;
 
+	if (!pidff_needs_playback(pidff, effect_id, value))
+		return 0;
+
 	hid_dbg(pidff->hid, "requesting %s on FF effect %d",
 		value == 0 ? "stop" : "playback", effect_id);
-	pidff_playback_pid(pidff, pidff->pid_id[effect_id], value);
+
+	pidff->effect[effect_id].loop_count = value;
+	pidff_playback_pid(pidff, pidff->effect[effect_id].pid_id, value);
 	return 0;
 }
 
@@ -852,10 +869,9 @@ static void pidff_erase_pid(struct pidff_device *pidff, int pid_id)
 static int pidff_erase_effect(struct input_dev *dev, int effect_id)
 {
 	struct pidff_device *pidff = dev->ff->private;
-	int pid_id = pidff->pid_id[effect_id];
+	int pid_id = pidff->effect[effect_id].pid_id;
 
-	hid_dbg(pidff->hid, "starting to erase %d/%d\n", effect_id,
-		pidff->pid_id[effect_id]);
+	hid_dbg(pidff->hid, "starting to erase %d/%d\n", effect_id, pid_id);
 
 	/*
 	 * Wait for the queue to clear. We do not want
@@ -906,12 +922,16 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *new,
 
 		pidff->effect_count++;
 		hid_dbg(pidff->hid, "current effect count: %d", pidff->effect_count);
-		pidff->pid_id[new->id] =
+		pidff->effect[new->id].loop_count = 0;
+		pidff->effect[new->id].pid_id =
 			pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	}
 
+	pidff->effect[new->id].is_infinite =
+		pidff_is_duration_infinite(new->replay.length);
+
 	pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] =
-		pidff->pid_id[new->id];
+		pidff->effect[new->id].pid_id;
 
 	PIDFF_SET_REPORT_IF_NEEDED(effect, new, old);
 	switch (new->type) {
-- 
2.50.1


