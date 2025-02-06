Return-Path: <linux-input+bounces-9830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD6A2B6B4
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 00:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD38E3A71CA
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 23:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98B62417D3;
	Thu,  6 Feb 2025 23:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="VVGFkhx6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C160224B12
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885695; cv=none; b=Eb+7lcZxi1y1xkbuf2AIgaVeimL35UTeAIOKrIk4L0VEMCkDHLPV8VK2pW07fpGSePFk0qz6NhEhtApScGwHmZ2D1yeRuq47g6DZcXYNc+iwU0OOZroyFlKqGcBhyPxWYUmpAivxXypCIyWf4ClG0sVqeecdUzEwXK5oKiP6NT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885695; c=relaxed/simple;
	bh=cRX2D6Uk0G8sW03d6VeOR8x7YuQ67Er/VVAEmNNitnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYxlozbahOziTWhGd9Ft9SfjJOE9l7XmndMEShSfqJ1vpw6waYem/eFbu3II8qkx5FfpekORTdnImX09mdyB2NJJoY7oowpxPdpmPcVcq2tN6pffySrHyIkqibHAfUoFZRXP8/UCwvEKo/ZKozT6PSIHbLe7PPMMy4cUX+OO0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=VVGFkhx6; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738885694; x=1770421694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fay57Bt11P8LlGBHftqkOgXQJFV/H4j/nOWmJziP5xM=;
  b=VVGFkhx65ny3AsbEox5jVQ0Vu+yG7DQqTEsi/DUCNKQpVJdEeVjHfRqL
   zv+lghWswU0xKqk2dXpIwSb5BiXk/nHtPqzJbMXkKPeYD+UbxjyTbCD5B
   rnzlgKnW3cJIjAfAiEh7MWdPNpvg1jPXoSJg/DihfVRXgQelgixN8HIER
   M=;
X-IronPort-AV: E=Sophos;i="6.13,265,1732579200"; 
   d="scan'208";a="796775401"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 23:48:13 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:47476]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.14.41:2525] with esmtp (Farcaster)
 id 125163d5-4f56-44eb-a11a-78e4f1bf4686; Thu, 6 Feb 2025 23:48:13 +0000 (UTC)
X-Farcaster-Flow-ID: 125163d5-4f56-44eb-a11a-78e4f1bf4686
Received: from EX19D006UWC004.ant.amazon.com (10.13.138.189) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 6 Feb 2025 23:48:04 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19D006UWC004.ant.amazon.com (10.13.138.189) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 6 Feb 2025 23:48:04 +0000
Received: from email-imr-corp-prod-iad-all-1a-47ca2651.us-east-1.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Thu, 6 Feb 2025 23:48:04 +0000
Received: from dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com (dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com [172.19.238.164])
	by email-imr-corp-prod-iad-all-1a-47ca2651.us-east-1.amazon.com (Postfix) with ESMTPS id 82433405B8;
	Thu,  6 Feb 2025 23:48:03 +0000 (UTC)
From: Alex Henrie <dhenrale@amazon.com>
To: <thunderbird2k@gmail.com>, <roderick@gaikai.com>,
	<roderick.colenbrander@sony.com>, <jkosina@suse.cz>,
	<linux-input@vger.kernel.org>, <alexhenrie24@gmail.com>
CC: Alex Henrie <dhenrale@amazon.com>
Subject: [PATCH v2 1/2] HID: Enable playstation driver independently of sony driver
Date: Thu, 6 Feb 2025 16:44:45 -0700
Message-ID: <20250206234708.7214-2-dhenrale@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206234708.7214-1-dhenrale@amazon.com>
References: <20250205202532.2586-1-dhenrale@amazon.com>
 <20250206234708.7214-1-dhenrale@amazon.com>
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
2.47.1


