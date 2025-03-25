Return-Path: <linux-input+bounces-11255-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86FA708A9
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74DA01761FC
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7CE26460B;
	Tue, 25 Mar 2025 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxzils29"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AF025E802;
	Tue, 25 Mar 2025 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925715; cv=none; b=Tg/7nnIIu5Z+W4n/QoXZ2KiGPqZKRsP9k7rJDPBJcsD+EdQOMW/DCttj32VTijcVugtO1f1LG+x2VEyqCzCL/OGVbP4BzKDz3Ujk50RIRy4E4+c5A6/IY2nEQfya6C1z5DXNwMQq6g2mDHxcyN8ObaR4z8uql6QeW7mxAhwopn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925715; c=relaxed/simple;
	bh=AABUJV60jkoyk9pf4/HftEI1WuCcagwn1KgS4S9M+Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etRJzcXxE/xlpNUd4EvB6WMb5q2WCAO7yhKnD47RD6plbwH3U/xFGGEDyAxHnX4c9Xz/NWki1yQ+am5x/jSHqzBT1AcIOPM+g9CoFACCWYfY1n/hu0fSOzVYYRWtTwvRPkSCCRBpdISb7DEqdjFGZUOcASefXdkmzd7Vj65rqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xxzils29; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso224301a91.1;
        Tue, 25 Mar 2025 11:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742925712; x=1743530512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYHWEs+E0rUU0Aaji7IOwn3khWFDU08OfBnWr8FMw+E=;
        b=Xxzils29Axle0XkmSCv1tmrtZHtLA0KmJYgtqFf5ZCen+CVkmxVJ6E8jcke9poARne
         pH5gIPJwfNFRl92u+1Wu4Kzj8PZaxP6QnD64mh/q76BFvLWdoHizzX6RsJENbdG6GPsy
         k65imo2VR25Hw1s3o7ZzfnzEVqZmCLSZfXlhVTLcMIJB1eq17BiwsIx7LJjy6o+WMJtc
         bn8MuJO5gQGhtcD1lPKi8l/HJLqmSDlUZvtF4N27wNm+DYM2oX+aknlL197m6AikelKR
         6r3xaO52On5qr8DdS103+ZRmAGs10QC/mYxY+PkYMJorWl6DrHITZc6VlLc2A1vtWJfR
         TROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925712; x=1743530512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYHWEs+E0rUU0Aaji7IOwn3khWFDU08OfBnWr8FMw+E=;
        b=dsGGUC7gIOf6RU2IBiNxEzsUuvKTPJrvE96qG3DTsY6O00GngRxxoeQuUgZWAAvLeT
         eKLq9duT6oXxtffCmfh/wZz9amixypiW9BdYGI2eJyEsLJ//htUazegHJxotPH9ndpvl
         zYCSOa+n3NQpXh0KGNh/ssIcIqbNsZpdwEAtSyk9BccViqxCaN2C/KxY9NB5YccNxHyE
         DI2Or+8M2JQaQeHKrJ628B4jbYjd8741uZ9HWilZBpE4mDerVdQluQWCp0xZPJwD9Yb6
         l4QNr771eQBodKaSrMpyHmSru2fOZg8LN/nMR3srMWJ+r1LvHIl4hjk25CX6uNwnZ0BT
         xcdw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Czy5RvaWS87/mUa2YtY0XJ0zsCX73uILPEZ9rnoDhz8RIfM8E2aEwFIHYz36LAl8zRyg43MxBBItIzeD@vger.kernel.org, AJvYcCV3UecDYnJbi2Gq05ZBOxK0DR9C3xJK1eKp6ZWO0/dvYrbkIf7M5OswjLBbfNkFyyBXAQTz8ClPZNwySQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznhdTnrKurJk/yRRZ1O2vzKeDqNbsanemY4pY09Zama1I0ygX4
	mUHR/rkW7WReEuJHYVutMuMXO7oqYz6jUwOsdgKb7lSqzx8I+hFy
X-Gm-Gg: ASbGncts4hDnm55ke+iKZwovvkQ0+e7EVJHIDC1MW0HJ3USqLS6yYd63UeM76Dnr/qR
	kvbZ7ClM7M/Q7dgQq0qqk6/iw11kq6ivNJvNO2F+jEpfQjQvg94jxnejht7wcHnSepxs5tFAn76
	Mw7sBA2yEAK7G+QaZKNgtiROYPLE4TROEOR3f0jjDQIO8jzf0NmbbyXkX+oUEa3dsNaw0KQPrVH
	vhB00WZ84cLbF4DNKAAyUPtXSCwq7ohmkaxA4sTgLaxS1gCACE9Czi9QwrCyllZyv4zS7hB5QpC
	PrbJyocQOrbbKeOzBjAhUApAIoRhg8TBhTYhCB0cMvD6oB1mDiSshBjyHaou1ezpo+1mlLF0/qo
	EUVpVB9ohMBQ2Hf6TZhOOOpttyOVAf1K2zFvMTAt9dDcZAg==
X-Google-Smtp-Source: AGHT+IEAikfz1BZgLGfDnLZZKl9QRyIQFDnvGETV4pxBAJSOHVFWcbuTI0SHqkls9wJ5EqQFOC6tuw==
X-Received: by 2002:a17:90b:57c6:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-3037893f30emr870675a91.17.1742925711594;
        Tue, 25 Mar 2025 11:01:51 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d8287sm10683796a91.15.2025.03.25.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:01:50 -0700 (PDT)
From: adityagarg1208@gmail.com
X-Google-Original-From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: gargaditya08@live.com,
	kekrby@gmail.com,
	orlandoch.dev@gmail.com,
	admin@kodeit.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
Date: Tue, 25 Mar 2025 17:57:24 +0000
Message-ID: <20250325180138.15113-2-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325180138.15113-1-gargaditya08@live.com>
References: <20250325180138.15113-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the contact ID is contained in fields with the
HID_DG_TRANSDUCER_INDEX usage rather than HID_DG_CONTACTID, thus differing
from the HID spec. Add a quirk for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e50887a6d..6e7f34a47 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -73,6 +73,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -625,6 +626,7 @@ static struct mt_application *mt_find_application(struct mt_device *td,
 static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 						      struct hid_report *report)
 {
+	struct mt_class *cls = &td->mtclass;
 	struct mt_report_data *rdata;
 	struct hid_field *field;
 	int r, n;
@@ -649,7 +651,11 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 
 		if (field->logical == HID_DG_FINGER || td->hdev->group != HID_GROUP_MULTITOUCH_WIN_8) {
 			for (n = 0; n < field->report_count; n++) {
-				if (field->usage[n].hid == HID_DG_CONTACTID) {
+				unsigned int hid = field->usage[n].hid;
+
+				if (hid == HID_DG_CONTACTID ||
+				   (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR &&
+				   hid == HID_DG_TRANSDUCER_INDEX)) {
 					rdata->is_mt_collection = true;
 					break;
 				}
@@ -827,6 +833,14 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 						     EV_KEY, BTN_TOUCH);
 			MT_STORE_FIELD(tip_state);
 			return 1;
+		case HID_DG_TRANSDUCER_INDEX:
+			/*
+			 * Contact ID in case of Apple Touch Bars is contained
+			 * in fields with HID_DG_TRANSDUCER_INDEX usage.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return 0;
+			fallthrough;
 		case HID_DG_CONTACTID:
 			MT_STORE_FIELD(contactid);
 			app->touches_by_report++;
-- 
2.49.0


