Return-Path: <linux-input+bounces-10108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1350A39375
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 07:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EDA916A18F
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 06:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC661B3922;
	Tue, 18 Feb 2025 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/1J6CXd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EC1B21AC;
	Tue, 18 Feb 2025 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739860588; cv=none; b=GO9PKF7BvibKWmMuRA2bBcSDRsxpDSuz9zA8EQVYOfspbtV8HNHbBPwawYEbdrKYNsnTDqnNWzGuGfBpneUcmwB/GlVNskOvhdt4BfEivdeqMa2zJoHrXBxRwdZzpqGyWS3vaTMBERFY1q+bqDmucrZzzMKrhzeIucRt6LFb+jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739860588; c=relaxed/simple;
	bh=/G5DQvVtGAzExmW0Pgmn4jUCkyKoix+syoTOMV610Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2elan4osjr6m33ZXxH6z1lUOaz7ibw94Oi8p6QdMPdu71RqHJO6WwqdJcLczHwx2NHw1+qmvzFdqzsCVpNMWQ0XAx2q70GLnfJ9Ov9BZmnSLsKc6GIh7StVGXCGHQihpKWZdEeKetY4VTHqTZN5Ox1e0cJQY2/5dgh1PVspo0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/1J6CXd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739860586; x=1771396586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/G5DQvVtGAzExmW0Pgmn4jUCkyKoix+syoTOMV610Po=;
  b=T/1J6CXdYC05R6FmvfefIv+QX8KctT7HrC5GQEPp25IRpudfIC7AmHEf
   GFXcLz2VA/nEISfLwV1x7EVnkE/qzxyRj/JxlIjX05OIPaTjgWRCKznCB
   ur8U1QSMdarEWCzqA9f+N8qBDCJr/uWEQWF2r/uF5BTwR/QaT57o1GWnE
   FuQcWcgmqZMcPnNn5JEit+CORuDnRpopMXWr3iYlnzcIwNzRyBpK6pdsI
   SJ2SUL6Bu+w+t8AlZExJZh0nIbtpSEjnVZnhdMqBQetvTu0k7NVV7S9hs
   NAVOwtw//u9+WLeE00iSKOwZwDJm/lkSo8QDMCd9AdBkqks1YMy/Dtre5
   g==;
X-CSE-ConnectionGUID: b07MpPsLTzqqX4I4XOgR8Q==
X-CSE-MsgGUID: ZKJx9t2qQvW0Agv4HBtrTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40248495"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40248495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 22:36:25 -0800
X-CSE-ConnectionGUID: c8XADxSeQY+gQYVD3DHTBQ==
X-CSE-MsgGUID: mOfaWIfNS7ePtTLaBGsS3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151500921"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2025 22:36:24 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] HID: intel-ish-hid: Fix use-after-free issue in hid_ishtp_cl_remove()
Date: Tue, 18 Feb 2025 14:37:29 +0800
Message-ID: <20250218063730.1211542-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218063730.1211542-1-lixu.zhang@intel.com>
References: <20250218063730.1211542-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the `rmmod` operation for the `intel_ishtp_hid` driver, a
use-after-free issue can occur in the hid_ishtp_cl_remove() function.
The function hid_ishtp_cl_deinit() is called before ishtp_hid_remove(),
which can lead to accessing freed memory or resources during the
removal process.

Call Trace:
 ? ishtp_cl_send+0x168/0x220 [intel_ishtp]
 ? hid_output_report+0xe3/0x150 [hid]
 hid_ishtp_set_feature+0xb5/0x120 [intel_ishtp_hid]
 ishtp_hid_request+0x7b/0xb0 [intel_ishtp_hid]
 hid_hw_request+0x1f/0x40 [hid]
 sensor_hub_set_feature+0x11f/0x190 [hid_sensor_hub]
 _hid_sensor_power_state+0x147/0x1e0 [hid_sensor_trigger]
 hid_sensor_runtime_resume+0x22/0x30 [hid_sensor_trigger]
 sensor_hub_remove+0xa8/0xe0 [hid_sensor_hub]
 hid_device_remove+0x49/0xb0 [hid]
 hid_destroy_device+0x6f/0x90 [hid]
 ishtp_hid_remove+0x42/0x70 [intel_ishtp_hid]
 hid_ishtp_cl_remove+0x6b/0xb0 [intel_ishtp_hid]
 ishtp_cl_device_remove+0x4a/0x60 [intel_ishtp]
 ...

Additionally, ishtp_hid_remove() is a HID level power off, which should
occur before the ISHTP level disconnect.

This patch resolves the issue by reordering the calls in
hid_ishtp_cl_remove(). The function ishtp_hid_remove() is now
called before hid_ishtp_cl_deinit().

Fixes: f645a90e8ff7 ("HID: intel-ish-hid: ishtp-hid-client: use helper functions for connection")
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index cb04cd1d980b..6550ad5bfbb5 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -832,9 +832,9 @@ static void hid_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
 			hid_ishtp_cl);
 
 	dev_dbg(ishtp_device(cl_device), "%s\n", __func__);
-	hid_ishtp_cl_deinit(hid_ishtp_cl);
 	ishtp_put_device(cl_device);
 	ishtp_hid_remove(client_data);
+	hid_ishtp_cl_deinit(hid_ishtp_cl);
 
 	hid_ishtp_cl = NULL;
 
-- 
2.43.0


