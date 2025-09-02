Return-Path: <linux-input+bounces-14440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC5B40EEB
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 22:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5451D16D3BD
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7EB2E3B07;
	Tue,  2 Sep 2025 20:54:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3341745C0B
	for <linux-input@vger.kernel.org>; Tue,  2 Sep 2025 20:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756846459; cv=none; b=G2UjNxDr0G6MRa0NJUbpMgNuYu6JNHzty5lb3O/MfceXl7F0rdDKbCukvqldQZBRh0WpFyn4gM1V4K1Xw7MPv5SU+gnP9ycRNZhGLRXF8rOfIMPE27v7ui2Nyud8HWKANOxtFZ3gl7bwAr2Z6Wcm+o1R/ja8sfMPkMZYhXoM2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756846459; c=relaxed/simple;
	bh=YY94nwIh7dlnQ98MZthN4AL8lz9jZ0YNsC16aZc3jao=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=tZPHmZ0ITiuSZJAgrHDa1EJDnN9vRqdoTcJBw7zwuTuauvZbtumKnCQqzfz7bjqfKsMDCSjwwUvsbpLFhcRxaSucDEIvHJQSQpKPXzvLXBprLX7XuPotjtuOfQ9tjmmqxdq/Gh9hIGs3S+wo892gob3ovfwj/sqnBLAdhdYv6Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbybitsp.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbybitsp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7724cacc32bso2327591b3a.0
        for <linux-input@vger.kernel.org>; Tue, 02 Sep 2025 13:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756846457; x=1757451257;
        h=content-transfer-encoding:cc:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9M78Iyi3IzNWHlWKKAxeJNPsqQQlPf24K++epM0hzfY=;
        b=Qv41AW738m6iVM60Tce6gLidg1ADXb51a4M98eAMOpT5O9OGcEOkCTawVMa/P36mXb
         JUdiPK7kejtqWSM0s/POnKyAfvQI8njEBoYZJNTEzWrmEF6+C+XkAlcfzRQgJv1YDIj7
         0FXL8b/Ja0L1BAe7ZHOufwAQ8/Tj4TVEgkoUTYTpawWhHR+rZgYGrxvyLgElpvVesoV+
         sSOEshYMdmUaXE5eh/On0QJJxu+q15nWglMmXIJa8qUFjZEH2iZbpoZKScgOs7ZLE2R/
         3zS/StKMsXv4e8TZ2RfXzzEouYVMpoyeG8SubZK8d7n3t48h07osELJPyXtmufGVBzun
         TdvA==
X-Gm-Message-State: AOJu0YxqVNeX8kQD5ugdL7HZ/Mo8pPfEeMSTeCHKPE0OsXASdxU5KucZ
	Cedh8thxYaa/kSKdRJYrnHhh8K1Wuk6xFZJxIfZAjcdxtwQTFMZjseD6iusr/UWQg5Q=
X-Gm-Gg: ASbGncu8R9EGgWIv7DdyYmPg9FzCxue7+i1BIwYOoUxQ4fu3LcpG08mmDvgHLn0OubT
	fmwT2QM4NyjzeUKXeKsah0aiKmuTbnSK47BSsCRXUsAVqCzme1nXTankrfcnKyuX4ipNgfxa+g9
	ZQ7jyrfy0YQ7kgnWub+A49FSf5NfHBQdZiBuvslkAbMp4qyqdu48goE2Xk8ujoKGdKWSPBz4pq4
	aPove56CPMquFHbb0P4x2k0eUd8gmY1eiW5/H49eBNr+4L6V3lsts9A6MzdHCaaEwd+dm6g/F/e
	irD0qEF++S1P3+Uxoi3m+xi1mnGaaNfprbmFMJ1BqZMiKJtCxkHWMMFeopUbFMdrIsxnHlUkaut
	v9HrBbHxcZxqsuHqMeEQFHhbuzpEQLd9SCL+kh1lDN3ShfH+719km7QFUHfwRjsjttHyziw==
X-Google-Smtp-Source: AGHT+IHhWScmuT77Fb7+5nu2PGXDXZVhyl1za4VVydA6Vd776nie25kH0js3i9VCTaKUU3IEr9Fztw==
X-Received: by 2002:a17:903:ac8:b0:248:75da:f791 with SMTP id d9443c01a7336-24944aed0c1mr166423755ad.47.1756846457183;
        Tue, 02 Sep 2025 13:54:17 -0700 (PDT)
Received: from [192.168.167.204] (ip72-208-129-79.ph.ph.cox.net. [72.208.129.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906594319sm138227485ad.114.2025.09.02.13.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 13:54:16 -0700 (PDT)
Message-ID: <7e2f3193-a1c0-4e08-9a57-840d718919a7@bitbybitsp.com>
Date: Tue, 2 Sep 2025 13:54:13 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-input@vger.kernel.org
Content-Language: en-US
From: Ross Martin <ross@bitbybitsp.com>
Subject: [PATCH 001/001] hid: Fix for Lenovo Yoga Book 9i top screen
Cc: rydberg@bitmath.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Issue:  The current multitouch detection causes the Lenovo Yoga Book 9i 
to be detected as type  MT_CLS_WIN_8.  This has 
MT_QUIRK_CONTACT_CNT_ACCURATE set, which causes the touchscreen to 
recognize only a single touch, not multitouch.

This patch creates a unique type MT_CLS_LENOVO_YOGA_BOOK_9I for this 
laptop, with MT_QUIRK_CONTACT_CNT_ACCURATE removed.  The result is that 
multitouch works properly on the top screen.  This laptop has two 
screens, and the bottom one still doesn't work. Partial progress.

Note that this patch defines MT_CLS_LENOVO_YOGA_BOOK_9I as 0x0115, 
making it the next in the sequence of IDs.  There is a possible issue if 
other patches have gone in and also use 0x0115. The number may need to 
be adjusted.

Signed-off-by:  Ross Martin <ross@bitbybitsp.com>


START OF PATCH

diff -rup linux-orig/drivers/hid/hid-ids.h linux/drivers/hid/hid-ids.h
--- linux-orig/drivers/hid/hid-ids.h    2025-09-02 12:56:48.870143225 -0700
+++ linux/drivers/hid/hid-ids.h    2025-09-02 13:17:55.987704096 -0700
@@ -837,6 +837,7 @@
  #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6093    0x6093
  #define USB_DEVICE_ID_LENOVO_LEGION_GO_DUAL_DINPUT    0x6184
  #define USB_DEVICE_ID_LENOVO_LEGION_GO2_DUAL_DINPUT    0x61ed
+#define USB_DEVICE_ID_LENOVO_YOGA_BOOK_9I            0x6161

  #define USB_VENDOR_ID_LETSKETCH        0x6161
  #define USB_DEVICE_ID_WP9620N        0x4d15
diff -rup linux-orig/drivers/hid/hid-multitouch.c 
linux/drivers/hid/hid-multitouch.c
--- linux-orig/drivers/hid/hid-multitouch.c    2025-09-02 
12:56:48.874143269 -0700
+++ linux/drivers/hid/hid-multitouch.c    2025-09-02 13:18:51.722450468 
-0700
@@ -222,6 +222,8 @@ static void mt_post_parse(struct mt_devi
  #define MT_CLS_RAZER_BLADE_STEALTH        0x0112
  #define MT_CLS_SMART_TECH            0x0113
  #define MT_CLS_APPLE_TOUCHBAR            0x0114
+#define MT_CLS_LENOVO_YOGA_BOOK_9I        0x0115
+
  #define MT_CLS_SIS                0x0457

  #define MT_DEFAULT_MAXCONTACT    10
@@ -413,6 +415,14 @@ static const struct mt_class mt_classes[
              MT_QUIRK_APPLE_TOUCHBAR,
          .maxcontacts = 11,
      },
+    { .name = MT_CLS_LENOVO_YOGA_BOOK_9I,
+        .quirks = MT_QUIRK_ALWAYS_VALID |
+            MT_QUIRK_IGNORE_DUPLICATES |
+            MT_QUIRK_HOVERING |
+            MT_QUIRK_STICKY_FINGERS |
+            MT_QUIRK_WIN8_PTP_BUTTONS,
+        .export_all_inputs = true,
+    },
      { .name = MT_CLS_SIS,
          .quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
              MT_QUIRK_ALWAYS_VALID |
@@ -2388,6 +2398,11 @@ static const struct hid_device_id mt_dev
          HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8, 
USB_VENDOR_ID_GOOGLE,
              USB_DEVICE_ID_GOOGLE_WHISKERS) },

+    /* Lenovo Yogo Book 9i (adds support for top screen of two screens) */
+    { .driver_data = MT_CLS_LENOVO_YOGA_BOOK_9I,
+        HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_LENOVO,
+            USB_DEVICE_ID_LENOVO_YOGA_BOOK_9I) },
+
      /* sis */
      { .driver_data = MT_CLS_SIS,
          HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_SIS_TOUCH,


END OF PATCH


-- 
Ross Martin
Bit by Bit Signal Processing LLC
ross@bitbybitsp.com
+1-623-487-8011


