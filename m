Return-Path: <linux-input+bounces-13781-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47CB194C2
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE6AC1733D5
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5A41DED63;
	Sun,  3 Aug 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPFZbCMH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878271DF755
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244850; cv=none; b=qcpJRaYqMnsBWKmmbDADcGPPaozll+mp+1YMnZz2L5edf5dHcvv443KUSvvqpliuOwiGHm+X1YL9Sav6JTjn2T5mpdqVgxH6K4EoqAnCQEL2YOAz1aoy4eR8Y82s5PwyiBrrtfPDGcvCVKGbXmwIp94lvgm4kVBpBIyykrXc6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244850; c=relaxed/simple;
	bh=u6xhrPZq4e6pyBVA7t/jlIxK5Hnm18fptJHtRpS8x6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JE87bffc+JLa1EDQ2Mnfdwp+pcb+xzBJ2HN7rXRpnJvSZGFl7Y8WCJ4jDcpjd1ArG6Jp9k/HAZvKllvRLKiE1BM13LTmSjHaTyJp+a1tn1SNr1uyCULVcV5miZOqLJTBJdHHs9bZ6YBLBX4Z/qe1v93R/dzJBrYaTOqi6CKlW3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPFZbCMH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6158745f51dso589459a12.0
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244847; x=1754849647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2vVIAzZ4dAg+21sRBLYMSNKm9HT703Ug1VaYJSoKUw=;
        b=DPFZbCMHuz3Kpkqpdk+0VpC21TW0ecyjWJJvZlrKmmzcPhU4h9KTV8h/ljPCA3NF1u
         fv0WHOBS4Vb4JXlQCFZNKRcI7EmJD5sVuSu4gpV4Cw4reY0mX+i3S0qGfWeligwSFjgS
         ElBwl7r2NPPGF/LgYM0tzc3lLcmZYuW6GVzaXUa1Me+7ZXQD8OotP1ynhtTBiw8z7MzJ
         iviGMbM16EaiWkbZ6X+fYWmunWuV8XJffdCIxZt1o4/e+TaZ1toIpNHecZAB6x43T8la
         GMKlDQehxVsBymmFKv+Bkrw/W8xtUgRPUiICeTKmPQRjOeSoaa4P0CLetAh1bRkfBL+X
         Wxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244847; x=1754849647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2vVIAzZ4dAg+21sRBLYMSNKm9HT703Ug1VaYJSoKUw=;
        b=HyyDrhtfDzAHKfK1/SGES0EaMck6u0s5UsYK0gaFdPRDP+oqhpPsBZAfk7QjJBxsuZ
         8nKilj4uiocqMdt9uyqs6ftm8DXe2fny8davIrjzB2kM8MulBkLoA/J9s5bBcRXk9wcw
         kJINpmlNj17fUTArh4zkFek2KdsKqZ+CCE+FNKui9xU8ACrR1NgU6B9TveLvrA0IJS1l
         AjsqNbPcbO7Qp4yfa6vLJyjdZMsTYY2oLfo6BTOdywOjLWgk/3S0NFpoZLLBoy+gkz15
         KJe73vFgkDJVu0hFqs6sYhX9fHu3EjLHIcOogLUrv1qKSrDdr5kzzum/gYRWr3zLBkC0
         kzbw==
X-Forwarded-Encrypted: i=1; AJvYcCXT8SOt4OP66u7RSrqZYygdaqb6qtaWr6w9Nv3rTYx33cieEBULTxBHJdMgDL2z0octeIbFv5lKrAobBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww18TBKL9o8zwTGjSUZXxzjnDUQrXRB2BGw/Zs0FQdWDnsJjkz
	ZN2XSqCRuea9pnoJwU/hL68GTYVjvf3ivUYNwC+kI9dQWP9aMbRiB+h+
X-Gm-Gg: ASbGncttAs3dujNYdAUFlSZ5s2m1FowkiTeDWI063Lo4JYxbCWld9HJEDwLppSWlvB4
	j82xWb5kxvFApHLP5FBmnq2dtVOznhEnF7F5XEMShHMR9eRwcL5dGKPL39HcH4esOY6g/J5xQi5
	d5b+LCsdyNe3EXCRSdO35NUcCDPmPU3jL9d/neMm11Yw7PdCBmnAa47NDGRhI3pZPURLispL7jG
	al7hYLdvh0MC0wVpkA1USQAU1zxyXl4I5oUicHarYSispRwJH5m7pOYxNgak1hH8hRLT86+va+o
	CCpwwXKidOP/dy8fDE4EUe10dB/lTOu91rQTirhM2pzWUkN8/+j9SRQX2cMxzrINOrNR5NjarsW
	pNsF332rVbRwzXJ/AsZCaGlvaCeP3C29ICrz905SoITo3TVF+tWrRJTvfYiyZMlOO0pybmPDN08
	70hg2YjMM5IYrvYszGU5K7
X-Google-Smtp-Source: AGHT+IEdTR3EZD3s2BG9rQS0NBW2wkkRUqb6IzdUyeOQ3A4caHYT46NRQg/juZ5yhl4J2syBTiLmiA==
X-Received: by 2002:a17:907:3da9:b0:ae0:ba0e:ae59 with SMTP id a640c23a62f3a-af940048cc0mr256748066b.7.1754244846876;
        Sun, 03 Aug 2025 11:14:06 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:06 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 12/17] HID: pidff: PERMISSIVE_CONTROL quirk autodetection
Date: Sun,  3 Aug 2025 20:13:49 +0200
Message-ID: <20250803181354.60034-13-tomasz.pakula.oficjalny@gmail.com>
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

Fixes force feedback for devices built with MMOS firmware and many more
not yet detected devices.

Update quirks mask debug message to always contain all 32 bits of data.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 534fb28f6e55..3fd51ad5cf56 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1210,8 +1210,16 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 PID_DIRECTION, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-			PID_DEVICE_CONTROL_ARRAY,
-			!(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
+			PID_DEVICE_CONTROL_ARRAY, 1);
+
+	/* Detect and set permissive control quirk */
+	if (!pidff->device_control) {
+		pr_debug("Setting PERMISSIVE_CONTROL quirk\n");
+		pidff->quirks |= HID_PIDFF_QUIRK_PERMISSIVE_CONTROL;
+		pidff->device_control = pidff_find_special_field(
+			pidff->reports[PID_DEVICE_CONTROL],
+			PID_DEVICE_CONTROL_ARRAY, 0);
+	}
 
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
@@ -1552,7 +1560,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	ff->playback = pidff_playback;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
-	hid_dbg(dev, "Active quirks mask: 0x%x\n", pidff->quirks);
+	hid_dbg(dev, "Active quirks mask: 0x%08x\n", pidff->quirks);
 
 	hid_device_io_stop(hid);
 
-- 
2.50.1


