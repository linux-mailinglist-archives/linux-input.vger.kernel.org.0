Return-Path: <linux-input+bounces-9521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478EA1C36C
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B503A8E65
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D05209686;
	Sat, 25 Jan 2025 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRD0eNrx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEF9209678;
	Sat, 25 Jan 2025 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809698; cv=none; b=S9R5Y+jmXrPbGuNWEK3q8xJKkscz+n9TLRkZdRUh0ohuF6jgivo1HgjSk6H2EF4T/bn2Pi+uR7uZYaM1o1M1p1Jp4GI5CDn4JqpEj0MF69rMBiY/pJWZ4ZpHOGvpfRvq95dYwitOkqte2cIUkT7cSgTjUsRECa+8kuBRW/Xmx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809698; c=relaxed/simple;
	bh=lhNyDbqPT/A5BuGm77CZdSiqP3jG/Vu6qUEGM5mTO38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cb8lbtY6o2N05Wdlz1+y3cu7ZuAX8isJNbmlhQ/L7gxDBS7z8yLup11ylq8WO2iKE/pm5fal/4erNWzlbuCrOBIt8vNJ6j8IG56E8uK1w67WGwXHLkY3h2WiDUgj/eXzbTapMGEgFM0GgplshNGIVbcEsypqHSiI2+x93CeVN0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRD0eNrx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5426f715afeso413032e87.3;
        Sat, 25 Jan 2025 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809695; x=1738414495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmnykWrVlt0sJdJV1uVzbEe7K1M5/Cz3pmV3NtFHvbM=;
        b=GRD0eNrxpM1aAyXuSz5PSOwlphNxiUhWq86vcmBvOnEkjwv1ijSgjmGG7dfkeI8F0k
         ed31oFhycYcgzGo5TQo+NJSkYjs5GYjFpUtIEByMfBOn62B8f3NE20IzdxG2shgSkYHS
         QfaTxWyORaM4HDDlHJX6nP1Llue0u16gT6Z39Yc8x7mQvrFfg5UBA32Qy4OXtQvhdtP4
         PQMie+fdCbeT03apzHaR98nEb/biEWXUlI9jbMtZlmmdKKBKmoXRkmBaHoz0BrIaHYQr
         TQIproI/q8jxvTQ7sp0U+v2XiAhPeRx72GLMDSNSHUptCqLgmLawCoRJvKVK57Swye9o
         KmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809695; x=1738414495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmnykWrVlt0sJdJV1uVzbEe7K1M5/Cz3pmV3NtFHvbM=;
        b=aZN0unA7qLpR+hmVPT+qul+2cw1PvC+GDlzfdjGQpLbIxrmThsWXDr06MaoI/CaYmD
         RhB0rPAQODQKfgpXtmnpsJsAjuCf5jJe+y/pTdQsB16ZuhMVfKXM7DMTKRdEMFbsb8HS
         IfT3d6HhC3fNmg6BDuMb0LrEc49CY3GKrCfXqEZcJcDDG2BBgb6sm9jmYAR8Mc1Y4VMP
         ZlTMNFepF8n6OsNXkg0GAXD6HRMcWy/qPUqPQzXDDZOxFFCogjYay1FlWraz67U4Uxe9
         JeryUXN5KudPLutxQaX8xWH9ev+gL8NHbZS2xrfztxSnGtn3vgLjcUlFeHWJcdbY6pC2
         Nfyw==
X-Forwarded-Encrypted: i=1; AJvYcCVKwsLo7BvbZDEW7/dXiWYd99HTQMgBq+4ueBGRrYUorT/gdP2KpECQihp/xnqIm3+V3As88a+oycXu@vger.kernel.org, AJvYcCVrgrmHz/x5xojDwD5poLl+s/ankdWWBRzXgIpZrRKMJueb4OqqOXMOTgFirsDNhn/wsMd31R/fi4FCyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4+RiteoASW2HTXPiAqlweyFOvx3QNPe+As+yg8k89cpN+mEM
	PAbBWFbdrazLrT3hWUc4+QOfFuSJpaUIilBewaIkxWxNAsbn2HjX
X-Gm-Gg: ASbGncuIqYOZCyZH14gQdQsFpmAW22obb+rEDYZy8Y2aGFDcSDORKbJUWljUkAZdLMl
	I6d1Ww33KZBDWnR/Wf63lmSroB6iZ/urKsraAIJja5EwOyKAaxUBNH93gAb1ElEC+to9noR3uN0
	ZPAUHokW1VO/EY4uSitbdoSzTWjQyS2z3aZm7Chzx0oaTIbpS+qN4z+mAKHppr83Av1V/oQd/VR
	UfbFTACJu35th7s4sUfXXH9WQHMlSvxN2Rma0G9dN8TI0MWyaIaREZSKc3u9nNDyI7zeUzuY/Ge
	ucsbKV8fRwO3YunIxm/gmBfAoweXAKxedEy+SnJatX66DwzfExg=
X-Google-Smtp-Source: AGHT+IHlSX/Xfpgb3H5g+dUNlTeoj8yB7Ao8NpK7SRN7H0YambSJuJDNZ1ade1MAuKDm4s92vXzpNA==
X-Received: by 2002:a05:651c:198b:b0:300:3a15:8f21 with SMTP id 38308e7fff4ca-3072cb20f5dmr39012411fa.8.1737809694735;
        Sat, 25 Jan 2025 04:54:54 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:54 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 07/17] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Sat, 25 Jan 2025 13:54:29 +0100
Message-ID: <20250125125439.1428460-8-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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


