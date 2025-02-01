Return-Path: <linux-input+bounces-9649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B214FA2489F
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371E6188740E
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C3C192B76;
	Sat,  1 Feb 2025 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNuW1V9F"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E99619149F;
	Sat,  1 Feb 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409961; cv=none; b=YkskZvmyXF6G4mA25BzX98Ibyv4S3IieONvV749qMBYbP3Pd2uiOd3Ect2nhA0hCswReU9lAtzk9jngqShf5I2Fv3JCziG47RoSsqIHXkEF+0E+JQPJRvdU39y1KaY8NbnseMt0woBJmWmclYhB8z97fP39DHW3mCTlhMr7VPHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409961; c=relaxed/simple;
	bh=RC8tE5dn6tSLsRcorf8rLKjbfnJbGGPXFMYYip00yv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQP+/B11MASdQPeG3V3/lwnWYB8+al1Ttf7ElqEDJFIt7vRrASpryJHi4IhiOh03R1ahIBp5qqX9lG+4L/5iLfQC9XLTOFESAcX4Gbt26VjVxJyQhtsRfAqKBpcV1jkTRbU13H3uPlpRm5BP9Z1RyEb/RI48Fup2rs18Q5nTr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNuW1V9F; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dbf65c0c4fso569553a12.0;
        Sat, 01 Feb 2025 03:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409957; x=1739014757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFsKbSQabaQ/wTDtrR8MGa2rRCEDwW7N4h99Qb+cx+o=;
        b=KNuW1V9Ft1GFF2aEzdwp6BeEQNuf9Z2dQ53PinoQ++hc7NhMI8SzFQTCJhUrIFOzjZ
         ygFBXuoFIWLB688lTS1VzyNqtle4fm3fIQkytTH0p/mKUpNvSBHDFsFXuhFhUmILw8jU
         BQD8SXFSYmMAuLbd5cGwBndyyCe+DxV5/TyIS283vstlG4IcAY4TqsB59P6d2aHZ8W0t
         PoCTISEU+2EMbj3nkVIKP01LxghVKH9UlK8oZ5ibm1VxXp5Oi559diosoNgV/ZIrbbmg
         OKg6+cCqW49EUfTxsaTwK4W3ol4ttJz9HIpR9JC+xBhD40mmGjVNrrekTRgm8Lc2bGab
         xY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409957; x=1739014757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFsKbSQabaQ/wTDtrR8MGa2rRCEDwW7N4h99Qb+cx+o=;
        b=Dkm4g2agScyN+ttcQhmj2DkbzUsLZO73V4SqcKmdo/UfteO4xWhZIKzBZC9d8l6eL2
         teo67+sivlWykT8IRVyAlS2ZmbYa8STlL+6+lt5DkztZneHCpp7xJIMnxSxMEi1XBAry
         0nW5usCur7BkrsMdz4Y0mjRpHznxA64eUdt8VVfKiwffre5Xppmjdovrkk9u4tIRl833
         FmEtMCa3G7PlMjNpUJZmZBHDlbBB5vLA4l7DD3WeKz+RrX+02ULLxpco2ucLaLWi66yP
         ECZz4XEgtQjEK/lP2OeFzgTr5qyDhjIVZj8QT5+p2gJ0rTYYYI9InP4lUq3coqTgYOI2
         THVg==
X-Forwarded-Encrypted: i=1; AJvYcCUHkbI1SgXwfx/MKx+hbCCoUkBlTkSv9WD1JsNdBcCZFJeELNuri+hJ4mzodJ/c+LKXZ3BoqrF+CkOIXQ==@vger.kernel.org, AJvYcCUoO5hhUf4+7bdWl+iMW/d2wPKOpIuuaMBGlM140NexLK8oGhhoAjV71lqocMJBKvlnZ/reVsOqbAOB@vger.kernel.org
X-Gm-Message-State: AOJu0YysNMnWONUi2M5OphAk2BT5/YmrJc4dPTT0oG/f0N2rItkdLES2
	RAOlfVjNVPuOE+Gh4xVBVX+ZE/Mj8i1LFLEjH9XN6PBNfq4woFr4
X-Gm-Gg: ASbGncvzZcyV1jO6qxAznORwIkcWUuBcm7Of4QDWJhrRXZ72yp8S6bUM018a0Z5U7Uc
	RoqzBVywSiYNpvkuDT4bZGpBoLLhga0CIYC5YENtSj8dvFP0GVsbncBvv38wEnQ6a4VWAyua/hr
	1JKlYlJnE35QIHkZg0h68myKUhjZ2mJ2EvEHeT5s4Z6+M5vbNtE1Di/JD5NkadM7z0qywQrbk9z
	7oYgdhwHaJlzI20Aakre/4bVdtLESMMwByzWdwiEAB3BWeCOZgh8yHl8YrlRaxi1cDy+JJj78VZ
	w27rcBONJL9/zaLdSHrKONpMKOtYTtErjreZMhvSenz0jJzlR+QLqfFLHpRn0w==
X-Google-Smtp-Source: AGHT+IFXDpZoghBwLpdga6qtBZjEsdW9YJRAcPl6/QRw01ZkdCZC2K9kO42HZe80YtnfT8Qj0HSyZw==
X-Received: by 2002:a05:6402:2b93:b0:5dc:87ff:e17f with SMTP id 4fb4d7f45d1cf-5dc87ffe2dbmr1826308a12.8.1738409956562;
        Sat, 01 Feb 2025 03:39:16 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:16 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 07/22] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Sat,  1 Feb 2025 12:38:51 +0100
Message-ID: <20250201113906.769162-8-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This lays out a way to provide an initial set of quirks to enable before
device initialization takes place. GPL symbol export needed for the
possibility of building HID drivers which use this function as modules.

Adding a wrapper function to ensure compatibility with the old behavior
of hid_pidff_init.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 15 ++++++++++++++-
 include/linux/hid.h            |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3f429936d537..298a971c63fd 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1281,8 +1281,9 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 
 /*
  * Check if the device is PID and initialize it
+ * Set initial quirks
  */
-int hid_pidff_init(struct hid_device *hid)
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 {
 	struct pidff_device *pidff;
 	struct hid_input *hidinput = list_entry(hid->inputs.next,
@@ -1304,6 +1305,7 @@ int hid_pidff_init(struct hid_device *hid)
 		return -ENOMEM;
 
 	pidff->hid = hid;
+	pidff->quirks = initial_quirks;
 
 	hid_device_io_start(hid);
 
@@ -1382,3 +1384,14 @@ int hid_pidff_init(struct hid_device *hid)
 	kfree(pidff);
 	return error;
 }
+EXPORT_SYMBOL_GPL(hid_pidff_init_with_quirks);
+
+/*
+ * Check if the device is PID and initialize it
+ * Wrapper made to keep the compatibility with old
+ * init function
+ */
+int hid_pidff_init(struct hid_device *hid)
+{
+	return hid_pidff_init_with_quirks(hid, 0);
+}
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 92a484f65a87..e6e9081d7dac 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1223,8 +1223,10 @@ void hid_quirks_exit(__u16 bus);
 
 #ifdef CONFIG_HID_PID
 int hid_pidff_init(struct hid_device *hid);
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #else
 #define hid_pidff_init NULL
+#define hid_pidff_init_with_quirks NULL
 #endif
 
 /* HID PIDFF quirks */
-- 
2.48.1


