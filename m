Return-Path: <linux-input+bounces-9136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30EA09326
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 15:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDD871883517
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 14:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7217820FAA4;
	Fri, 10 Jan 2025 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhlyVtc6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DF20FAA7;
	Fri, 10 Jan 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736518487; cv=none; b=gAyyDxnuZdy3hT0VC3QsTLqOvu7QCW/sCagrLsZNlrWZcsmbyCvlY2+pbTFekods1FE7+UN28wYUCxuCluB5UOWzkbg3Bbrn9NRFzyw6DH5tCt/CH/SFURrvmQlTMIEl8O4Z0MIHyP6Vx2iJfAp6Qh257ZpkmUrRjcgAFhWShJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736518487; c=relaxed/simple;
	bh=klMdPGZGBksEmSeAAWUtdajUpausbpD30JTUwLhJRgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiGzjQYp3qzxHPI6cjmm65ISSKkE8EvuoJ8VBCU1/Ax7Hw3ZbG7YpDtMI1x74qFm8OcCpnwYR53eDAyZUzG5UdT0htgcKsf2OMzNfXnc7GY3JjSo4HjbRtaj1msoIMJj+IdqdWMp3Q+X7V2OimbbFinQg/uY+/jRILJjpLy/8xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhlyVtc6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21628b3fe7dso35537865ad.3;
        Fri, 10 Jan 2025 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736518485; x=1737123285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNT4g3RDw4lSVu4UInzNOJilsU3l0jI+FF/iwu3wmQo=;
        b=mhlyVtc6ru0c6j52JcF7EL7q8daa7deh3BmYe51HewNB6cr+TvM9A2KtLK8uMt4fzl
         DAuQtXINAOp9fdof2KqgCM5nsyPggSjxmobaeLSsejv8t8qYB+PlxJkOQnOv76IWzVbD
         5Zkffkfg7fcImD/US//iWIqMg4+QPqvA0lV3a/R2TKNToKhMTmQPGpYx4OjI+/r9fwqZ
         jTNMFD+bYe04vHbKgcee1TNkMjhZ7v+0dUPTV4/XM0UQEOvwQFv8j0OvIJFqUgMTJtrj
         F5PtonPkyl7AYNJcS0dHA+xju7n0DLEShq43KpnUb24gkZp/WSkeIJDphT9YzT5fUuHm
         GgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518485; x=1737123285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNT4g3RDw4lSVu4UInzNOJilsU3l0jI+FF/iwu3wmQo=;
        b=wuBLd+WqSVQ6g6JrOfJdW679zkB3z3rtQi880Nbpo+n3Nrr4KkAvUhft3IbUfRPuOW
         3rgw3DggHWKOVnVoImHO05N4y3EH1gUEWiYQe3g44F1h1tP6jv8XCx3t5XEcTB0T9Jxd
         D5vYUKrggRfgCRQdELHN+tx6jEG7ZZs07SZcgCvp8ognuUW5qTnfcBBvq7F6DYi8WjKU
         fp9E4LzpDmZ+oultVoFJqZWhC0rlRPBbyxqp6w9oH4HE9BhksNcKhA3i5gu/tBVn8awJ
         rBfji9bcu4oF1BTvPyePWTQ3dQ/3+vjgW33CSuP4R7IqYDRZvH2WD8cPcbcjwiYmVtGt
         i6ew==
X-Forwarded-Encrypted: i=1; AJvYcCUXBdjsCCOL2h9+1dqVBE0roo/zpCKkdO7A2ih+AszJpqcjY4sBxN1xTa19Ukw+idSy6II5yiRn5ELXi+j+@vger.kernel.org, AJvYcCWTgPk3gEJpPtcfe1hXwGHJAhrdg70nlfZtY+NgfCRB+krPoutbEAIN7rZCYH9t4J7b/Ef4yYPLdTgj6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54VDarVtunSg5JwATL+TUwkJs2aBBggfillbdRg6r+JhQR0cI
	v3HcLhLy3/7hNlGGpVdWrjLp3wsmuzFMm9Z2dMZsv78wU1lvXFIM
X-Gm-Gg: ASbGncuG+2Tc2pQcPRoAQCGCBMNWDBPX91U6OqFR6Kgx8nUL57SRyNFu7xY/XJu3/1A
	PGtIR6nPm/O9m7MAW06zPp52nuux8dVOCOQ/TLRzMauHuyLyObOoduTgvmnz67MDriF1xUEmslk
	3Yk2mtY7IGuxUErTkBiynO23j+1NslP+FpJfEi2CR62OxH8vbz9fd5eeDNJ4WAKL7UnYDsQlkWM
	0eWMq+vB2VWE6u7d0hbcixBcX+l2shvufyo+IJRwOr6nXt9p5eDdrbuqyB9GxTt7Nwetm8ZRj3F
	xy33zYANuNze3jq0gM5v
X-Google-Smtp-Source: AGHT+IEELXyjQWYl+1ozKcWWAnLi7zBaxCcWDNp5AG93azGQLNB4uhryLTyVzbvFKX/Ck7kFncyqRg==
X-Received: by 2002:a17:903:244d:b0:216:7175:41bd with SMTP id d9443c01a7336-21a83fb0b26mr157624775ad.39.1736518485013;
        Fri, 10 Jan 2025 06:14:45 -0800 (PST)
Received: from hera-2-ThinkPad-X12-Detachable-Gen-2.. ([2404:7a80:b9a1:7100:f50a:e947:acb2:3352])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22c97asm14088645ad.165.2025.01.10.06.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:14:44 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] HID: lenovo: Fix undefined platform_profile_cycle in ThinkPad X12 keyboard patch
Date: Fri, 10 Jan 2025 23:14:09 +0900
Message-ID: <20250110141409.96959-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit "HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys"
introduced an issue where the CI failed with the following error:
ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] undefined!

This issue occurs because platform_profile_cycle is used without ensuring
the kernel is configured with CONFIG_ACPI_PLATFORM_PROFILE.
To address this, this patch adds conditional support for platform profile
management to the Fn+F8 key handling.
The functionality for platform_profile_cycle is now included only when
CONFIG_ACPI_PLATFORM_PROFILE is enabled in the kernel configuration.

This ensures compatibility with kernels that do not include the ACPI
platform profile feature, resolving the CI build issue.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
Suggested-by: Benjamin Tissoires <bentiss@kernel.org>
Suggested-by: Jiri Kosina <jikos@kernel.org>
---
 drivers/hid/hid-lenovo.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index bfaadd54cba1..4d00bc4d656e 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -31,7 +31,10 @@
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/workqueue.h>
+
+#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
 #include <linux/platform_profile.h>
+#endif /* CONFIG_ACPI_PLATFORM_PROFILE */
 
 #include "hid-ids.h"
 
@@ -724,10 +727,17 @@ static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
 			 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
 			 * Power modes
 			 */
-			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
-				report_key_event(input, KEY_RFKILL) :
+			if (hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) {
+				report_key_event(input, KEY_RFKILL);
+				return 1;
+			}
+#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
+			else {
 				platform_profile_cycle();
-			return 1;
+				return 1;
+			}
+#endif /* CONFIG_ACPI_PLATFORM_PROFILE */
+			return 0;
 		case TP_X12_RAW_HOTKEY_FN_F10:
 			/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
 			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
-- 
2.43.0


