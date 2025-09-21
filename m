Return-Path: <linux-input+bounces-14948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B4B8D547
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 07:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B4F73BFC88
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 05:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2B41EBFE0;
	Sun, 21 Sep 2025 05:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QecKSyIB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807C13B284
	for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 05:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758432687; cv=none; b=ML7prbSON3qr7iHPwxBILS5oOAEjEoIEOIIHyAB+EEewjLwr2/a1s4aZQLhBrE7W3q0ijSd89yF8OFneCNVk4qj9rytO7HDdf0Fa1eOV0RGiFbvwxeX67QpQdbCW8J2X77UAYNMWtGjpQJUqC2n1DdoYVp5SnRJoBhaYJ+ePXPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758432687; c=relaxed/simple;
	bh=HleFLPeUvaEcqn/0PXc1U+sGzWdcOrBF4wDM+LDGl6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoGHnqTwjmriNvtoJJAP3OLnqSTjZX7caxfpxR1RgT/bjAvp7kEI3JO0Hc5KtS3CKFY6cqO+PL88iYitwYNSF+1lLRP53Zxy+WPZDSHQMjMdmnp7HbRXNmHOXZeILNP7NGh5E9MjcRlqEvxeB2fahHpwkFJyc2Lmoau4JefZ06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QecKSyIB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-269639879c3so33440635ad.2
        for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 22:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758432686; x=1759037486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bXUQHTmnBfGtfX7iEITnx6oxhdVdrA+nHLfzwZOPN4=;
        b=QecKSyIBiOiLvPH7RAEHSkjiRDTkiywlKnNs/l7o6crV/rrYAdXsZFvS9sFnPiCpIm
         v/Z45fCHnMtI3+h5Gpg/4KPrdxKLMJkoqdQCvGxFY1BDxfg19E6EYPLRgPVhMRmJ3s83
         AheTh9RSD3L4cT+x7rdv3f1ZtzqJ0Cs9eTLJSHz5TqBQoiFS4oAmLjp0ln0xFi2Sc9yL
         ne6SDTAyHD2A2jjUTdNmEL6CEHom4t8t/J5jvRw1xMgms4VHErpfF0AgYgEdASdYPGnE
         RHruecvUXdyOv+CdXfPfDZHYWOND9XORB+BPDFXJiYO+bHVYsXcZUIN833fVarmnCjfG
         nmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758432686; x=1759037486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bXUQHTmnBfGtfX7iEITnx6oxhdVdrA+nHLfzwZOPN4=;
        b=qmbhUKTDKHAmA2DpT7kSdjflvCOYb3Ph0uhseSGCgM7lPGrT8b/iq/yq2Wv8NXjgs7
         WLxUkS8KNN+mplHkiPi2CfwggnFi3nzqPBDqg9Tk+FoXsLymSVI2dBpqJHhiOD2Foh52
         tpZkp8AU3AH25EUacA5/E5FeMo7zhPYa41KPwrYJiyrAI1h6iaK3saI8rqlacb3UOjtm
         x9yMG3DO7XWAEjnCpClnsumV2Tq9rZn1Zdl901udTPtQwVshBvJVYWWU3sZMIdu+DdNk
         CRQJR8Gs5VHvzwUrD39xd3JRSZBrXX+cMUADUq14IpNuoBnwaixhZ3DsK/1+aXm1nWsc
         GaWw==
X-Forwarded-Encrypted: i=1; AJvYcCVwyCmJM6m5nYSC9M+WxUAZouI9T1bNQkb1kXYuGxxOAEtT2jFRikHVUTa0CcOuLV7dGeSuJ+pXTz10wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3PGIq/PG8NqwlobNoV576dUagZcRHxTmddS9aw5Ah2zoKA/M4
	CzpdM+J2RpbzUROFSpU32Y8ZGlNqvQHGNKhB+mL1gPrw0gHkOX4kaliU
X-Gm-Gg: ASbGncuUnGtWJJnlsYb1QK5fvlDZvHy9R3AlV+NICL/1M/KXh/RoIrbDmMQ+kY4GcBM
	YTjcHfY9UtC6OBXYCpFCqQEim55uffmbC87hbU625YML3f0fhWuir6kFUaraqq5HPHdUD7CCcqM
	wDruz1N9XP5WDt8WimCQ924uUEXUQsoerI7765cjM8f5TEHCWOeO1/Awpd3md2MuDxMG8Yp5o6N
	ahDZ8DUbQ0O0K2W5rB9DWadMDGkJSH7Fx68NC7tXtpIgpyRtsEumJoRdFQQuSmyr/oYoPSbq45m
	3x3H5vmkorcbk/STxPVaPihW0brNPb+EyAWH8BtM3AG4O4vvCwC+rT2xU23G7C610E/essn4SWg
	xpzDr0Ca3G+FlPbWopO/qb+2ioibfY9cAG0LVKEr7sdUyam3vjI/xGDb/SKI=
X-Google-Smtp-Source: AGHT+IEpkQw1QkNUhuiZ+x3z/qRYz/267S9IR2W58CWz9qesSZGnwbL5E9ovayRrnpFVMvIiko29WQ==
X-Received: by 2002:a17:902:d483:b0:269:805c:9447 with SMTP id d9443c01a7336-269ba3ec74bmr102451495ad.4.1758432685731;
        Sat, 20 Sep 2025 22:31:25 -0700 (PDT)
Received: from orion (FL1-125-194-6-184.tky.mesh.ad.jp. [125.194.6.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df630sm97225825ad.81.2025.09.20.22.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 22:31:24 -0700 (PDT)
From: Masami Ichikawa <masami256@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: minbell.kim@samsung.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masami Ichikawa <masami256@gmail.com>
Subject: [PATCH v2] HID: hid-ntrig: Prevent memory leak in ntrig_report_version()
Date: Sun, 21 Sep 2025 14:31:02 +0900
Message-ID: <20250921053102.150182-1-masami256@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a scope-based cleanup helper for the buffer allocated with kmalloc()
in ntrig_report_version() to simplify the cleanup logic and prevent
memory leaks.

Fixes: 185c926283da ("HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()")
Signed-off-by: Masami Ichikawa <masami256@gmail.com>
---
Changes from v1:
- Rewrite patch title
- Use scope-based cleanup to drop goto-based error path
---
 drivers/hid/hid-ntrig.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index 0f76e241e0af..a7f10c45f62b 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -142,13 +142,13 @@ static void ntrig_report_version(struct hid_device *hdev)
 	int ret;
 	char buf[20];
 	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
-	unsigned char *data = kmalloc(8, GFP_KERNEL);
+	unsigned char *data __free(kfree) = kmalloc(8, GFP_KERNEL);
 
 	if (!hid_is_usb(hdev))
 		return;
 
 	if (!data)
-		goto err_free;
+		return;
 
 	ret = usb_control_msg(usb_dev, usb_rcvctrlpipe(usb_dev, 0),
 			      USB_REQ_CLEAR_FEATURE,
@@ -163,9 +163,6 @@ static void ntrig_report_version(struct hid_device *hdev)
 		hid_info(hdev, "Firmware version: %s (%02x%02x %02x%02x)\n",
 			 buf, data[2], data[3], data[4], data[5]);
 	}
-
-err_free:
-	kfree(data);
 }
 
 static ssize_t show_phys_width(struct device *dev,
-- 
2.51.0


