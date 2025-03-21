Return-Path: <linux-input+bounces-11046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE79A6B2E4
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 03:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A20719C3BBC
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 02:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9BA1DF965;
	Fri, 21 Mar 2025 02:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tju9ABUA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30711A7264;
	Fri, 21 Mar 2025 02:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742523946; cv=none; b=c0/pLZpqvpCHNnJIXxHm29lY2/sMEzKvywYsJ+PmQaPyXQhH7lFfGzK6s+f/WpDPRUA9kymAVDPCKD32UjKxRUSR7lUIyfk96irY3QLVIe6BSrG4ptpNnHzJn1wp7++M4FMIFKjFR2yyp8cTsjAh2queoqZNT+agL277Vqi40n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742523946; c=relaxed/simple;
	bh=f8Q5gFv76Yqzy7eSwBd46q4NtWdgVRvKR4UJwRCum7s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JUFm4CRvkwE8YmLZrDICRbi5itXXxiGRQ0UnSMAqKNrPEF6+6v57DKOBPbRIW0wnl+20HH8kE54TWAVZa29pg/k9acOE9lSKc+DbtfOpYCPk3/NbwH1CQGRyDxwzDfcrpz8iJN0ZOk2L4nVOOBa5eZstlhrXI3B1n9TS+CDURII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tju9ABUA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22622ddcc35so37490405ad.2;
        Thu, 20 Mar 2025 19:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742523942; x=1743128742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+DxvPmAFs621/zKMJ4zXjt30xecPkzXgHkzi7VvKLgc=;
        b=Tju9ABUAJoVp8WyG1Q4QN9KCgFxCnezEa1LEcjBsuxy7huPb5x5AGiFZpnJvydEF71
         XvI2XS6FzX5BzVZbYfHJ3nEUL3Ik0e8n2OxuGAD5uqg85ZH2pZIbjqfPoEduzUjUYItO
         TiHbhsUwvbscDCuacZCaFbjTPB/sUTUSTendBExDrrz+Yh0osl0hrAymHqyRP2FMKHlM
         e/1H9OcYIrd98PF02ducluR9tPsCI8As/nuEwHO0/QlJX09N8tYQel2/P6ZJ9pRgKzEi
         AOhrG7ggOXJ4Wjo40cHgI96kizkTwHBj3OycK69LUNOZQruULax8WxO4XG6WlHFupu4S
         R2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742523942; x=1743128742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DxvPmAFs621/zKMJ4zXjt30xecPkzXgHkzi7VvKLgc=;
        b=AG4IVgiSaN8qWCoztPugQ4tNSsqIS4N+LLXaGqhGT5/NWrfaclyvftSq5vOVsx5bpk
         h5TUaTI13fqib0WZxy0BRTG/gr+UA53PoaHSiKntSqXjOJ5bqaPP1SX8EM8WQt4Yfvg7
         5D9BdYeOMczmH9qc9Nb+De9R+/3mQl4KFy3x+fp96Kvp8h1DXhtLrmEzE6i0WZeMkLTS
         B8ZJhOhd3sJhwd+TBTUxp0T/sYKAjg8NUSpHR0b740oaTOWfr9bewAqyd2tur0Ktfj1d
         9iQDjUw+rfPrt9JWoRBpk/pziVVgsqJ1YNe5vwa2PyRRl8/vuHvW2UC/2tF9GAMolTNn
         tjnA==
X-Forwarded-Encrypted: i=1; AJvYcCW80Xe0HL6Dr1IlQATxsTA72bHBrE1BsW7Pgn04my7oMyf5UguSH0Hxrd0uHhTuzdrBGr9udlIL3AbRrg==@vger.kernel.org, AJvYcCWF2pbP4TIL3RNHHIEaV0FNQY+13UijCHq5I5ev84rk0KyjY8DCoCcXyamt9doPAxrCe1JUXcElJKInwhSy@vger.kernel.org
X-Gm-Message-State: AOJu0YwggGO+8sDOVJHTrh1H/GQz2YKeyEHaqXX6Gz9h5P9CPUqL7n/x
	12Cjar5a6DSFq0hFLD9JWIcwofi7XYWLbUvyki9x4SYJR7t6tJXXzkImGaZynX1mcg==
X-Gm-Gg: ASbGncvbpHsJi8m86z71rQKt9GSJdgMlM70Lh87Ham1QqkDQdGWye1+ya7aDlEjKn4N
	qJgOfLqJOXQPw0J3CxFwYQjW6YiDbunOANlniTNQRKv/p3LbB53+QVvwD6gsIK26fpbr40ttJ8y
	c59FvTQwukT5WZDhLktW+ia1Kwo8AeivuM3h1xDGK3ot/SAR4v97Lr/l8vpfZLAoYoCw3AwpCDf
	UtWHEKnsRYA7r50ejDbrhuO0+tnth5nxQrHNrmP//0xZcyUR9RaWWqUWumC3dU59Kq9MPmrQgQU
	aWs+DbHsbW1hQqOweMrIIPKclitgiT+7SNPdfIb3GwOeXURIlkL+AX13QF/Uo8/DnYUJN0M=
X-Google-Smtp-Source: AGHT+IGAYzPXIW3C7GhdeNHZHyfqTAkL6j4RiHaeMPqcvuug3znIOTZLhC6HretCJc3arNYS6OsrSQ==
X-Received: by 2002:a17:90b:1848:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-3030fe9e646mr2875641a91.12.1742523942052;
        Thu, 20 Mar 2025 19:25:42 -0700 (PDT)
Received: from localhost (220-135-95-34.hinet-ip.hinet.net. [220.135.95.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f7ea89esm650725a91.32.2025.03.20.19.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 19:25:41 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: quirks: Add quirk for another Chicony Electronics HP 5MP Camera
Date: Fri, 21 Mar 2025 10:25:40 +0800
Message-ID: <20250321022540.4016923-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chicony Electronics HP 5MP Camera (USB ID 04F2:B824) reports a HID
sensor interface that is not actually implemented. Attempting to access
this non-functional sensor via iio_info causes system hangs as runtime PM
tries to wake up an unresponsive sensor.

Add this device to the HID ignore list since the sensor interface is
non-functional by design and should not be exposed to userspace.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5fdea9116a3e..554dbed3f3ed 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -298,6 +298,7 @@
 #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
 #define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA	0xb82c
+#define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA2	0xb824
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 452fac15550b..91b3d121bb1f 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -371,6 +371,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACER_SWITCH12) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA2) },
 #endif
 #if IS_ENABLED(CONFIG_HID_CMEDIA)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM6533) },
-- 
2.43.0


