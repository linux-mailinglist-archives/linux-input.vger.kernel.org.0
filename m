Return-Path: <linux-input+bounces-16516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BBCB1C10
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 03:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42E65311B0B0
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 02:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA57421ABBB;
	Wed, 10 Dec 2025 02:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCM4Y1KL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270EB248883
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 02:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765334999; cv=none; b=rJrIf/9SfqUl5rnHWU4hOq3GBL+/Hdm+U/B3L15DNjG5Jjm2JfgW9HViExC5kwa7z0+L2BdiPJu/OA2rk1sR1k/U1i16uaPeVPZOZUyLvbxAb8KSi+Gzml8Ho3nFpbOpbFYE5wYfSWZsAdAyRvIEV4cZzsJoeptQdTPyZV3FkV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765334999; c=relaxed/simple;
	bh=LQRvc60kgrTi6rG5DTCjRgrbpsA8z24xlEJCUlF+CjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpKbVsg2Wg4gSJ1QfA3VFlzWZ6OtHoBwC20EiaVKp5vwty7JzwfYae7kKZueThd1egnYne3uEsOdZS6gskDuYR9l6MVbZJYiEbAJ2c3qn96DxzCsTw40T4ZHjbCqaa52H0r2N4nnEsDcUcppu5dhlFcEGn9csnifIApBUGfyMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCM4Y1KL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765334998; x=1796870998;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LQRvc60kgrTi6rG5DTCjRgrbpsA8z24xlEJCUlF+CjM=;
  b=TCM4Y1KL5geqwqtahzJZeAv5qPZnEVkO7MwKSkBxencibgLshnNzMDeU
   BI31sFj+4+eH8hfdcJ7GBNGHnEE2zN8wwlBgrGQ/hP5hnLVTtzXMLOHRQ
   ywHKlH/NCkaTVbXZY0dvxqk43R60urLZZKSWiZyVBnjAoz8h7aPSTRrzd
   RbYTqpYLM5FMJcw27bljweqr43C73ruaR7yofNwGUYEGAa5Ad2+6Uif1l
   r3eS6q0JEl1oGqrHrZu+7X3RZU3hn9JMtGUf/EP/gWG3zrxoDwLreV4Yq
   QBIw9n7saE6m1SNX+nX7NWba4HvHJcNCTNw/ZfcVjCJz3NQ67YWVYUskP
   A==;
X-CSE-ConnectionGUID: IpnRD+PnR9q0e2qddOvpMw==
X-CSE-MsgGUID: ckC19JNmTSaHxtsvc/X+vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67231263"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67231263"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:49:57 -0800
X-CSE-ConnectionGUID: qSGXs9ypRISASuG5pBY2VA==
X-CSE-MsgGUID: xdWtEwIHTCeXYTkFwptg/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196140594"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2025 18:49:56 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH] HID: intel-ish-hid: Update ishtp bus match to support device ID table
Date: Wed, 10 Dec 2025 10:53:28 +0800
Message-ID: <20251210025328.638436-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ishtp_cl_bus_match() function previously only checked the first entry
in the driver's device ID table. Update it to iterate over the entire
table, allowing proper matching for drivers with multiple supported
protocol GUIDs.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index c6ce37244e49..c3915f3a060e 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -240,9 +240,17 @@ static int ishtp_cl_bus_match(struct device *dev, const struct device_driver *dr
 {
 	struct ishtp_cl_device *device = to_ishtp_cl_device(dev);
 	struct ishtp_cl_driver *driver = to_ishtp_cl_driver(drv);
+	struct ishtp_fw_client *client = device->fw_client;
+	const struct ishtp_device_id *id;
 
-	return(device->fw_client ? guid_equal(&driver->id[0].guid,
-	       &device->fw_client->props.protocol_name) : 0);
+	if (client) {
+		for (id = driver->id; !guid_is_null(&id->guid); id++) {
+			if (guid_equal(&id->guid, &client->props.protocol_name))
+				return 1;
+		}
+	}
+
+	return 0;
 }
 
 /**

base-commit: c75caf76ed86bbc15a72808f48f8df1608a0886c
-- 
2.43.0


