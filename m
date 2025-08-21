Return-Path: <linux-input+bounces-14239-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB1B2FD3A
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 16:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A1AA1C85BDC
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 14:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F3C21B185;
	Thu, 21 Aug 2025 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTGELLAd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BD215175;
	Thu, 21 Aug 2025 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787106; cv=none; b=rM/jB5Vi61fp3PVD+2dTsS4fKxxxiVhC4rsn1FyM02xVgrHk7Zzgr/a9ypq8TxOhl1VspWb5v65iUa5hBnWEI/ljkuPr7sOsjjttHgWGT3THrU/Wr900rghJLrcUMdp6bZS7+HTLVqQDKg9IgFHxR3cH9/SCfynk7qSKHGJXVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787106; c=relaxed/simple;
	bh=CRSHc6Vc84YrC2WmGMlDYgT0QJ3LVjv7SG6Lj8AFa+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U54hk7dxdQiKMEvWzBUx2mFN1hUiRdsj+OBREwdC5qgr+jbGBbVDoNilD87xhOKWggKZ9kHEkh8owj9KkGk+AyIU4qBVQatMIoe15lUd6+ri0A1MKlFpX+fvwEQChsuf+IfmN+VxR5SKuYBXiHZ/hHtbbGPw2iEESIokoM8OyA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTGELLAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E3AC4CEED;
	Thu, 21 Aug 2025 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755787105;
	bh=CRSHc6Vc84YrC2WmGMlDYgT0QJ3LVjv7SG6Lj8AFa+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sTGELLAdrcH+pFaMQSLrf3q0XUb09cS4j/4vFlrEZu7Fv705jiky9bidCBywpAUmj
	 mySftYX/Id3FmfXaAzwjw5B7SuNxKffDXE/Rs0oLei66adamffIgnKvH1WGUw6dRmf
	 4NAonPHiW+k7r5j+crcwDrGKh+o0y4ybt8m+HjTc2uoi+z2F9XN1idPjYdQ4WPn5Xr
	 OKv79j2l33YExI0211kp8dnkb4p3gQ6QcU/s/Y/37lA3l/Fz13xZNGfA8y8MVXU8dJ
	 /Nu5jLNzIMrgNftFMe565lj6aG/4o5uJHbWLkrLa2YvePPm9UtJqAyylKRgqpD58W+
	 Elex2KaIqAYAw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Thu, 21 Aug 2025 16:38:13 +0200
Subject: [PATCH 1/2] HID: core: factor out hid_set_group()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-bpf-rescan-v1-1-08f9e2bc01bb@kernel.org>
References: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
In-Reply-To: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755787102; l=1819;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=CRSHc6Vc84YrC2WmGMlDYgT0QJ3LVjv7SG6Lj8AFa+o=;
 b=1tlhsteG2K4EjhNgRBUdtFgE0fy2wD4vOoyRs2vglnBxUeaV0cjqEvujkrMFaYHZw0qYvTUhn
 L2w1pBq04VWDNIDD9nff0LyGQ3WuN8yFDJErzW7fpZPLpAzc88md0bM
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

When we load a bpf, we can change the report descriptor. However, the
current implementation doesn't change the group meaning that we can not
rebind a device from hid-generic to hid-multitouch.

This is a preparatory patch to force a rescan of the device after the
bpf has been loaded.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/hid-core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 5419a6c10907e307df08c3b44e2b3a147f1b154a..cf68fdffe0581eefb29a9d691f4acfc8f0d175d5 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2708,6 +2708,20 @@ static bool hid_check_device_match(struct hid_device *hdev,
 	return !hid_ignore_special_drivers && !(hdev->quirks & HID_QUIRK_IGNORE_SPECIAL_DRIVER);
 }
 
+static void hid_set_group(struct hid_device *hdev)
+{
+	int ret;
+
+	if (hid_ignore_special_drivers) {
+		hdev->group = HID_GROUP_GENERIC;
+	} else if (!hdev->group &&
+		   !(hdev->quirks & HID_QUIRK_HAVE_SPECIAL_DRIVER)) {
+		ret = hid_scan_report(hdev);
+		if (ret)
+			hid_warn(hdev, "bad device descriptor (%d)\n", ret);
+	}
+}
+
 static int __hid_device_probe(struct hid_device *hdev, struct hid_driver *hdrv)
 {
 	const struct hid_device_id *id;
@@ -2903,14 +2917,7 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Scan generic devices for group information
 	 */
-	if (hid_ignore_special_drivers) {
-		hdev->group = HID_GROUP_GENERIC;
-	} else if (!hdev->group &&
-		   !(hdev->quirks & HID_QUIRK_HAVE_SPECIAL_DRIVER)) {
-		ret = hid_scan_report(hdev);
-		if (ret)
-			hid_warn(hdev, "bad device descriptor (%d)\n", ret);
-	}
+	hid_set_group(hdev);
 
 	hdev->id = atomic_inc_return(&id);
 

-- 
2.50.1


