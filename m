Return-Path: <linux-input+bounces-5207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993694105A
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 13:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3AF41F2468C
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 11:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2649919DF52;
	Tue, 30 Jul 2024 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2hZBrnn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CCF195F3A
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338297; cv=none; b=tuKHmqjgDlmn5/LJCe8ktWVNv0LhfSYjblDq/Er6ZDs33dOll3AONZw6j/Z+VEpHrKe11vXErHp0OlUHa9o+nhfn7K5ZlmHQgr6+2NlySy2bWr5zo+B/Q0h9NPqRUuSsnBSPBuNojsy0SQed4A/aS9vKqkaSEkYSSJlxmaR5xv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338297; c=relaxed/simple;
	bh=emu2WIvwyO6/p/LotTUUlS2nbvSB04ybNi2qi3ND6lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=osUmMAjp+hk4I0CGAEuLYcIDHkOID3bJ1y0eTOlRNINKTE7NmXPT+2gpI1mCH1atrOhmoILzXGrP3xj3bW+2LMbf7uwJui412ZYmlRNmIhWgT6/svtnBqDCiS2pUsID3G/2Mk7KQkvT3pnEkIJGTcT0i90R1nj1s2ehxeYmhdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2hZBrnn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a843bef98so469382366b.2
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722338294; x=1722943094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/lB3uSgzrF7JggXtZTiUk0HNBbSz+s7ih2s5fn5YqQ=;
        b=g2hZBrnnMgbDQCdmPI0+IA5keaIkrstRWihqgMp2wLrMfVNM+Cl2SZOHsFThHuPLRs
         EB7W6pMZOaFKAwKn19FUedo7Vg5chZwI+wBeZwWG6WRqX3VCFVydaKuu/uRjLox0YL4r
         brH+vEmOTzGayk/Ji7JHbX1uveVYwNQVBh9ordDQDd+vOTexHREUDplQB15y3lhQRaLh
         X/a8xkdi6pZvtherftlrTacDJDjV6vpk5nqOWz2L2KS0L9JfJvMokIlfYcyMvFwgmeEq
         Wg9oLsZIUwrGcwgwhwrRwP53KmFGno0P6ndcJZkLsBFXBgPFSjydKXSRugF6ZSgS9v3B
         tYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722338294; x=1722943094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/lB3uSgzrF7JggXtZTiUk0HNBbSz+s7ih2s5fn5YqQ=;
        b=ffbNdKPXNDUngplzBHg22gmZtnSw5kc4HDOmCFNnV1zr/UbkQj4pcp8C5NDyuDyDdl
         EHQuKDEtB86eFrDm7tlPQ9Dpj//n8UzissAr7r/iWEFAq9k2peItmzGGq4JMhVXZnODb
         CIZ4Uvm5mnbxncGhC+jYGM/KkTp9VBLywfXsp59+EEqcBwy8re0JtuBGPm9Gjkdegi7E
         J9eON+YUHnnb6hKbAEReNe0pyhmQMU/n21+jyQ5LvNzFsounqNWHCRLHRGYxe8GhqZXh
         Eumh69hUlt2GdrGsmbErTTxbocdxeOk3eDgTlY7FjkkvguBouI+OyrWTrWNX7T/Q4PFt
         TNfg==
X-Forwarded-Encrypted: i=1; AJvYcCXwdV2qJbd92LE4zt55BRgM6nSpz9yoFXfp0rIxqi3epsTbeIzk5rrwtthd1k1Tf1uiLrUPaMQCig1zriY6t3ujgMe2wy+NOhIfvdM=
X-Gm-Message-State: AOJu0Yxu524wLdSb3XwuiTM4cWEAicV4EW75chsu3pHhIMLnjoJ2otCV
	w4FyiWW0rk1TBDc4caSNn43Bllo087srKVy8RpSkR1odghnQ/oN0
X-Google-Smtp-Source: AGHT+IGLX9ujp5eIq+UZ1e7xWSL128xNAP58YPs5zK11pUO4o1qAvx+Ml7vmaQ4GqVLmG8vf4oPcEQ==
X-Received: by 2002:a17:907:3f1f:b0:a7a:a7b8:ada3 with SMTP id a640c23a62f3a-a7d3ffde804mr816491166b.3.1722338293305;
        Tue, 30 Jul 2024 04:18:13 -0700 (PDT)
Received: from laptok.lan (89-64-31-171.dynamic.chello.pl. [89.64.31.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab52d46sm626557766b.80.2024.07.30.04.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 04:18:12 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: bentiss@kernel.org,
	benjamin.tissoires@redhat.com,
	jikos@jikos.cz,
	linux-input@vger.kernel.org
Subject: [PATCH] [v2] Input: increase max button number to 0x340
Date: Tue, 30 Jul 2024 13:17:16 +0200
Message-ID: <20240730111810.1017708-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 of this patch increased the number of buttons to 0x3ff. This version
reduces this number to 0x340 to decrease the size of some static arrays
by almost 200.

Maximum number of buttons is limited to 0x2ff. This makes it so game
controllers like joysticks, racing wheelbases etc. are limited to 80
buttons.

A lot of input devices for flight simulators and racing simulators take
full advantage of defining a large number of buttons in HID descriptor,
in turn, some of their buttons simply don't show up under linux. Linux
became quite a viable gaming platform in the recent years so this makes
it so it supports all the HID peripherals without fuss and confusion
(there aren't any dmesg errors if HID device exceeds the 0x2ff
button id).

I'm a part of linux simracing community and we encoutered this issue
with Moza Racing wheelbases, as they use top of the range for things
like h-pattern shifters, sequential shifters. These accessories simply
don't work, be it connected through the wheelbase or directly with USB.

Upcoming Moza Flight Sim devices will face the same issue, and there
were Saitek/Logitech/Honeycomb and custom-made products that also have
more than 80 buttons.

0x2ff was already sort of an arbitrary number, I'm increasing it to
0x340 to still keep the array not too big, while allowing additional 65
buttons.

Change has been verified on my Moza Racing R9 wheelbase + Moza racing
sequential shifter (it uses buttons 112-117). I didn't encounter any
issues whatsoever. Evey button works, every axis works. Keyboards and
other peripherals unaffected.

This patch is important as SDL uses this defines and we'll have to
wait until it propagates into release versions built on top of
(hopefully) 6.11

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4338b1b4ac44..e1699f4b1858 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -333,7 +333,7 @@ struct pcmcia_device_id {
 /* Input */
 #define INPUT_DEVICE_ID_EV_MAX		0x1f
 #define INPUT_DEVICE_ID_KEY_MIN_INTERESTING	0x71
-#define INPUT_DEVICE_ID_KEY_MAX		0x2ff
+#define INPUT_DEVICE_ID_KEY_MAX		0x340
 #define INPUT_DEVICE_ID_REL_MAX		0x0f
 #define INPUT_DEVICE_ID_ABS_MAX		0x3f
 #define INPUT_DEVICE_ID_MSC_MAX		0x07
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index a4206723f503..5f10f09ac174 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -808,7 +808,7 @@
 
 /* We avoid low common keys in module aliases so they don't get huge. */
 #define KEY_MIN_INTERESTING	KEY_MUTE
-#define KEY_MAX			0x2ff
+#define KEY_MAX			0x340
 #define KEY_CNT			(KEY_MAX+1)
 
 /*
-- 
2.45.2


