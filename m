Return-Path: <linux-input+bounces-14999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9027B93FF4
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 04:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E33FE3A5AE3
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 02:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D63A270EBB;
	Tue, 23 Sep 2025 02:25:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5691684B4;
	Tue, 23 Sep 2025 02:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758594307; cv=none; b=mZlHWLQ4YiteVpL+90fgYD0r8SWvocbWAcay7Sr/aKd/1LFmhquzgvrlomNRYwkcooYtZ+XNxSdWHiBXKy2ut5ai0lRslvscKGl8roGn7kB4oqgT4XCeaxWRLB+iCc8Qtv52Koritv0lvU86etFF3hM5L9Sxgpny1YWVo4Fv0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758594307; c=relaxed/simple;
	bh=E1KiUWT0nDYOzYp7zblAcfJd0tkRo3eiaRL3mFF6x+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sv3PS+iPj49WpOh47o7DOibXONt/PNoulTQ7VNLHHJqT1BzXgxw/1UqhB+mgtn8+5R4S1Cfscb/JTnGzp1pX8GLJvX2lczn9CMJtt70BfeXmQ3DZ2gZqcIJn5oTEfOtpfxbz05lobP1GNo5csPNHUn2DgNrbeVNARZ2nj5Ng5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7b0c5c4a982411f08b9f7d2eb6caa7cf-20250923
X-CID-CACHE: Type:Local,Time:202509231020+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2a485cec-d77d-4d7a-a66b-0f3904933131,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:3cb8da504e16b0a81b10c81090e2e3f7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b0c5c4a982411f08b9f7d2eb6caa7cf-20250923
X-User: zhangheng@kylinos.cn
Received: from kylin-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 492130721; Tue, 23 Sep 2025 10:24:49 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: jikos@kernel.org,
	bentiss@kernel.org,
	staffan.melin@oscillator.se
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v2] HID: quirks: Add device descriptor for 4c4a:4155
Date: Tue, 23 Sep 2025 10:24:45 +0800
Message-ID: <20250923022445.3276026-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple USB devices have the same ID;
add device descriptors to distinguish them.

Fixes: 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")
Tested-by: staffan.melin@oscillator.se
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 drivers/hid/hid-quirks.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ffd034566e2e..d28b180abd72 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -913,7 +913,6 @@ static const struct hid_device_id hid_ignore_list[] = {
 #endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SMARTLINKTECHNOLOGY, USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155) },
 	{ }
 };
 
@@ -1062,6 +1061,17 @@ bool hid_ignore(struct hid_device *hdev)
 					     strlen(elan_acpi_id[i].id)))
 					return true;
 		break;
+	case USB_VENDOR_ID_SMARTLINKTECHNOLOGY:
+		/* Multiple USB devices with identical IDs (mic & touchscreen).
+		 * The touch screen requires hid core processing, but the
+		 * microphone does not. They can be distinguished by manufacturer
+		 * and serial number.
+		 */
+		if (hdev->product == USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155 &&
+		    strncmp(hdev->name, "SmartlinkTechnology", 19) == 0 &&
+		    strncmp(hdev->uniq, "20201111000001", 14) == 0)
+			return true;
+		break;
 	}
 
 	if (hdev->type == HID_TYPE_USBMOUSE &&
-- 
2.47.1


