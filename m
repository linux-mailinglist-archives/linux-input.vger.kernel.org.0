Return-Path: <linux-input+bounces-9805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6CBA29B30
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 21:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1CF165F8C
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 20:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC9A1DDC28;
	Wed,  5 Feb 2025 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="juF9VLfK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15341519AD
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 20:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787324; cv=none; b=Guf2Q4yKuXpI1mU/oX8SzcIvukrxjSX3jV0lDgXknKdNDffezRGXO1Ov5ciXrIdRUmeI5BdeHV8a25ZxBIg5+RPUC956TYxevDBROetsh4GvhJde4510NGmcRkiLoee16yXLSDbjwCSwkVVNZP5CSLwPWR2mjT1F7D0VHGXcW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787324; c=relaxed/simple;
	bh=6AqtCRfUio8euZn3o5TAcExTMwscrwjMdpOTIDpR7tg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DqKHEwPeNCr89clySapHnyl+6K4IXtGOovepVAl1vYhodTejmEZpxBT/pD5sa46CdhqPvuCrAk04odOzVlS0dW4NUazUeOnSVP3Yc770FZQvsR75sH1TjFSKlreDfM4+AAWdCCUc8kA1Y5zkvGKEJoCopqhDvzD17S7rZXPRhM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=juF9VLfK; arc=none smtp.client-ip=99.78.197.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738787323; x=1770323323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fybCgMzbJ01dn1aq9Mej/noh0h6285yIEK/MnntvgNY=;
  b=juF9VLfKPx3hOgf7xtKrdLS0F+V8JN0pVKmGYXoh1MRMW+Gt6rSBNqiC
   jgo8rqj6/TPUUsjRNhSzI7hupFq0BEZVufMu7kFPTj5Z7achyfEfi42xd
   soGFKU0hW/nxiNfbDjYBSJ1HNdCJM1ZDjz38YZwthvuIzqtP83WFa1DC2
   o=;
X-IronPort-AV: E=Sophos;i="6.13,262,1732579200"; 
   d="scan'208";a="20054007"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 20:28:42 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:42112]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.19.117:2525] with esmtp (Farcaster)
 id 567f57f4-b085-4c3b-bf52-9a452595f70e; Wed, 5 Feb 2025 20:28:41 +0000 (UTC)
X-Farcaster-Flow-ID: 567f57f4-b085-4c3b-bf52-9a452595f70e
Received: from EX19D006UWB002.ant.amazon.com (10.13.138.113) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 5 Feb 2025 20:28:40 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19D006UWB002.ant.amazon.com (10.13.138.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 5 Feb 2025 20:28:40 +0000
Received: from email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Wed, 5 Feb 2025 20:28:40 +0000
Received: from dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com (dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com [172.19.238.164])
	by email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com (Postfix) with ESMTPS id C1ED14124A;
	Wed,  5 Feb 2025 20:28:39 +0000 (UTC)
From: Alex Henrie <dhenrale@amazon.com>
To: <roderick@gaikai.com>, <roderick.colenbrander@sony.com>,
	<jkosina@suse.cz>, <linux-input@vger.kernel.org>, <alexhenrie24@gmail.com>
CC: Alex Henrie <dhenrale@amazon.com>
Subject: [PATCH] HID: Enable playstation driver independently of sony driver
Date: Wed, 5 Feb 2025 13:25:25 -0700
Message-ID: <20250205202532.2586-1-dhenrale@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

PlayStation 4 controllers use the hid-playstation driver now, but they
are still not included in the hid_have_special_driver table unless the
hid-sony driver is enabled. Split up that section of the table so that
hid-playstation works even in the absence of hid-sony.

Fixes: 4f1f391869ee ("HID: sony: remove DualShock4 support.")
Signed-off-by: Alex Henrie <dhenrale@amazon.com>
---
 drivers/hid/hid-quirks.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e0bbf0c6345d..ff23a7ac7001 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -595,6 +595,13 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_PLANTRONICS)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
 #endif
+#if IS_ENABLED(CONFIG_HID_PLAYSTATION)
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE) },
+#endif
 #if IS_ENABLED(CONFIG_HID_PRIMAX)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, USB_DEVICE_ID_PRIMAX_KEYBOARD) },
 #endif
@@ -664,11 +671,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_BDREMOTE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTROLLER) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTROLLER) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
-	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
-	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_VAIO_VGX_MOUSE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_VAIO_VGP_MOUSE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SINO_LITE, USB_DEVICE_ID_SINO_LITE_CONTROLLER) },
-- 
2.46.0


