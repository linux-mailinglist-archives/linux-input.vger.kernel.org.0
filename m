Return-Path: <linux-input+bounces-2256-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7094D872BE2
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 01:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F9AB1F221B7
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 00:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D8D320A;
	Wed,  6 Mar 2024 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvpdaefC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE1118641
	for <linux-input@vger.kernel.org>; Wed,  6 Mar 2024 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709685846; cv=none; b=bgCe/BAQWYYEdf8k0Sn0UZsKrxDKwS1KhJqkmkOSQnSMkGfjbS0ykljuliftTJrITlilVYaRl5E8O4ANx7qJKxD5PMpSagbCgua9mz3QWEaMZfpQFHZNUV4/lRj2jT4lJIvJY5sX/aXijuNxw+Oi/9jcqDHFUEJMnxfykDOPKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709685846; c=relaxed/simple;
	bh=/0r8beR9ksz+n5rOVVYanJFwrbF4a19psUS9GXAtukc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=uIbpLhoTlJeqZvrrILlhar3zqlhQ9J6w6PSTdMrMswpm86jp0vNIVI10MOB3gIcaYKg/bcqqgRLCmAiG2VeHQVKArXNYmfKdKtJZQnyJosK8ia1Nd595mulxjyqLIcQJZysxbQYcyUmedyJ7H8DTOKK0YbICz5n6MdT+Y6MnvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvpdaefC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709685844; x=1741221844;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/0r8beR9ksz+n5rOVVYanJFwrbF4a19psUS9GXAtukc=;
  b=NvpdaefCz+do7EZe247rxMZ73U6+3Q55tpKEJPUvbeAInYaTEM8zL50p
   rrMfZtYQMTgd2NYNwHMcupEmWzP8+4KtRBSWo4sc5mRG9uAQ0QyM3wobt
   cS+VYZ7Mtj+xiOTtBRuqP8NWclkINAXo8Gst1fsN9nRlsEp5be3frNHyp
   toSxD5Vr8fPF8Y4ivfZmqRA7ExhWKYTj6vm5oTTbTxjDkdoNnPnQvi3aw
   fTshqNd+UrerUuJGOrlkqdZ0YLXZdEB6vyrYd9Nyg8db52xehN5vNRbDl
   5JnTKT58Qnw4CqYUXuqBWhPFJR9eL3D6+r/NtQm1IxAUm+2jbWiYM0eeL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15419200"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="15419200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 16:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="40452142"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.198])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2024 16:44:01 -0800
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Subject: [PATCH] HID: intel-ish-hid: ipc: Fix dev_err usage with uninitialized dev->devc
Date: Wed,  6 Mar 2024 00:44:04 +0000
Message-Id: <20240306004404.2770417-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Lixu <lixu.zhang@intel.com>

The variable dev->devc in ish_dev_init was utilized by dev_err before it
was properly assigned. To rectify this, the assignment of dev->devc has
been moved to immediately follow memory allocation.

Without this change "(NULL device *)" is printed for device information.

Fixes: 8ae2f2b0a284 ("HID: intel-ish-hid: ipc: Fix potential use-after-free in work function")
Fixes: ae02e5d40d5f ("HID: intel-ish-hid: ipc layer")
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 7cc412798fdf..adce30f8ebff 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -948,6 +948,7 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 	if (!dev)
 		return NULL;
 
+	dev->devc = &pdev->dev;
 	ishtp_device_init(dev);
 
 	init_waitqueue_head(&dev->wait_hw_ready);
@@ -983,7 +984,6 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 	}
 
 	dev->ops = &ish_hw_ops;
-	dev->devc = &pdev->dev;
 	dev->mtu = IPC_PAYLOAD_SIZE - sizeof(struct ishtp_msg_hdr);
 	return dev;
 }
-- 
2.40.1


