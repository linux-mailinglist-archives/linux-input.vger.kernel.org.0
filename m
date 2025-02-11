Return-Path: <linux-input+bounces-9947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686BFA30D20
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EC133A828C
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 13:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C12621D5A7;
	Tue, 11 Feb 2025 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="cQ9tbpEo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C409A243965;
	Tue, 11 Feb 2025 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281205; cv=none; b=XnqtXH/ItwTkC5T97fa5aArsncCNIgJzv96HHualADEQsPQHCTw60lcNmJu2XQSeaKyAatQg0fFYnA3RNLKim2e3vxliFNI7GUkZPDrHz0kZJJ00xig2H0/1dJ2DOirBG1yb/ElFbiVyhE2f+lA9ifyaJAzYS2d7CRufjgada34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281205; c=relaxed/simple;
	bh=xWgNXPNKZM03oUis7O6rUJXGQZfLIM7VkOP+M2x6oOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYoOtO34iZ0dwdlnfiFyI37fCiLHDT2QuOyRguriKC5LkzHfcUC8clAvc83v3En0hldVph409ju98aDnD3pThRSxmajIkbLeJw4VNGyAEILCbJziZ0jfEdgG1qFVXbt6WJXlIE9IQLxd5q7Z5pWH1x9JIXkDSyEroL1CPd1UyhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=cQ9tbpEo; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59260.dip0.t-ipconnect.de [217.229.146.96])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5E76B2FC0050;
	Tue, 11 Feb 2025 14:39:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1739281194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XL4YdXnK949uXLMtLZEecfF+8yrfks6KMpFtdAL3gA=;
	b=cQ9tbpEonawPU8Y7E9jssi4XMybXyt6ioGDvAgYc3DtzzU5wgEvbVOrESam/7uZoNbvWar
	rIKnLxrCE6rhUxLqK4dghZoPTjDWw9tN0x318qFcKs0BW3TQGJ2O8mgPS/nG0iPKSFxdIv
	R9GXRAgpjGt5JE0X5fbxsACfstKx1x0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Disable touchpad on firmware level while not in use
Date: Tue, 11 Feb 2025 14:39:06 +0100
Message-ID: <20250211133950.422232-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211133950.422232-1-wse@tuxedocomputers.com>
References: <20250211133950.422232-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the new on_hid_hw_open and on_hid_hw_close functions to disable the
touchpad on firmware level while not being in use.

This safes some battery and triggers touchpad-disabled-leds hardwired to
the touchpads firmware, that exist for example on some TongFang barebones.

For a lengthy discussion with all the details see
https://gitlab.freedesktop.org/libinput/libinput/-/issues/558

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/hid/hid-multitouch.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 82900857bfd87..7289c04f47f17 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1884,6 +1884,16 @@ static void mt_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
+static void mt_on_hid_hw_open(struct hid_device *hdev)
+{
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
+}
+
+static void mt_on_hid_hw_close(struct hid_device *hdev)
+{
+	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
+}
+
 /*
  * This list contains only:
  * - VID/PID of products not working with the default multitouch handling
@@ -2351,5 +2361,7 @@ static struct hid_driver mt_driver = {
 	.suspend = pm_ptr(mt_suspend),
 	.reset_resume = pm_ptr(mt_reset_resume),
 	.resume = pm_ptr(mt_resume),
+	.on_hid_hw_open = mt_on_hid_hw_open,
+	.on_hid_hw_close = mt_on_hid_hw_close,
 };
 module_hid_driver(mt_driver);
-- 
2.43.0


