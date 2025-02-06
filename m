Return-Path: <linux-input+bounces-9828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8BAA2B6B3
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 00:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 717511656D0
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 23:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBE62417F3;
	Thu,  6 Feb 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="fHpoozsF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010842417D3
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.190.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885692; cv=none; b=H48HeykqrtL4HO1Siqhf6pvW9HAefSbE7CjJH8naQUtx4tgKXwhu4AGGpqD779/8JRP1Uh1Vxzp5uO8VRnT8LXhTT8O5JFXSnXSOtHrbY31iD6kK5oSPRLwvF3EOwbD63nLRaSdP4jS1Pja1Ff91X9W5tfnqAfnnLhQfAMM84iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885692; c=relaxed/simple;
	bh=ovoRDYUbev8v9bYH6l3TBMXE9kVwThG+NLV721UcF5o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WY+4JZ6w1YrmR8OhwFKvN2/jlDWRTcbb7fwucss8cv/csMb+RjrwM2lufV8U5XujzPCSFDBzqDTx5CMbqWRpSPNZqxVlWMSvEX0dWHLeRyjsaKPDeqWoOd+Tf5PG8G3PbZVRwhIbB+C2fOlWfSvReLDXOKhJCPUKIxzXqSidBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=fHpoozsF; arc=none smtp.client-ip=207.171.190.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738885691; x=1770421691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i2dmU1yL9FuhH3lWEGiTnkRAX1XfD7xE6tlWvUNtQOQ=;
  b=fHpoozsFylv413jOMU5ZXmuKNv2hgiltfIcnS5VmvuWITCQ2t6bBRn9S
   pegFjrNngiljXIWf6cbi06045Nf5WvpdMrQI2lLMmNuwQyEAqH5ugxEqI
   sktj5Gk1sleGYKqnsH+IutyF8EdDKbqauaqIjJR4F8aybdf+o1U1shRi4
   E=;
X-IronPort-AV: E=Sophos;i="6.13,265,1732579200"; 
   d="scan'208";a="406592383"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 23:48:09 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:29833]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.120:2525] with esmtp (Farcaster)
 id 20c0dc12-e581-4f8b-a8da-7899501eebdb; Thu, 6 Feb 2025 23:48:08 +0000 (UTC)
X-Farcaster-Flow-ID: 20c0dc12-e581-4f8b-a8da-7899501eebdb
Received: from EX19D006UWC003.ant.amazon.com (10.13.138.133) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 6 Feb 2025 23:48:05 +0000
Received: from EX19MTAUWA002.ant.amazon.com (10.250.64.202) by
 EX19D006UWC003.ant.amazon.com (10.13.138.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 6 Feb 2025 23:48:05 +0000
Received: from email-imr-corp-prod-iad-all-1a-47ca2651.us-east-1.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Thu, 6 Feb 2025 23:48:05 +0000
Received: from dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com (dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com [172.19.238.164])
	by email-imr-corp-prod-iad-all-1a-47ca2651.us-east-1.amazon.com (Postfix) with ESMTPS id 3A2624023B;
	Thu,  6 Feb 2025 23:48:04 +0000 (UTC)
From: Alex Henrie <dhenrale@amazon.com>
To: <thunderbird2k@gmail.com>, <roderick@gaikai.com>,
	<roderick.colenbrander@sony.com>, <jkosina@suse.cz>,
	<linux-input@vger.kernel.org>, <alexhenrie24@gmail.com>
CC: Alex Henrie <dhenrale@amazon.com>
Subject: [PATCH v2 2/2] HID: Enable playstation driver for PlayStation 5 controllers
Date: Thu, 6 Feb 2025 16:44:46 -0700
Message-ID: <20250206234708.7214-3-dhenrale@amazon.com>
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

Without entries in the hid_have_special_driver table, PS5 controllers
default to the hidraw driver instead of the hid-playstation driver.

Signed-off-by: Alex Henrie <dhenrale@amazon.com>
---
 drivers/hid/hid-quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ff23a7ac7001..a2975e994bc1 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -601,6 +601,10 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) },
 #endif
 #if IS_ENABLED(CONFIG_HID_PRIMAX)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, USB_DEVICE_ID_PRIMAX_KEYBOARD) },
-- 
2.47.1


