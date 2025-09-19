Return-Path: <linux-input+bounces-14879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCDFB878FC
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 548C02A4404
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC58A1B21BD;
	Fri, 19 Sep 2025 01:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEllzyWf"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632561DDC2C
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243782; cv=none; b=f+k6HiT0o40hv0/DEx38h8lofMfB/w74msYQQD77IS25i0LaNXE5v8Sn209HavP5uKCeYGeCrpU9wDq58LV5vPrrPSjBTBq//2DmpOl9Ekyi+vlwOnJyakfzW296/Q4H4MDtQNScJAJ3DE/f5+qOtgeQB0otX4hgsiYgF10rtXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243782; c=relaxed/simple;
	bh=U9JGB+fTVWLojCkLU6Z3hu87s+mv3Zm5bTC5xoWL+9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ic48YhrxQCNW/rZmAykZhxHTh4reQQHibXlEwKXrQkgX/jIx0LrJQHw0wgZZbktfG1Hse0nWDYZYIlzJSpD41XYrRYLFUAr82pOfGycLFzaHNE1z0MGL9+9AqUB2zGyd3wvjKpUB9MiNXFjqocKfa7Vr0smEEQ8XaR0/LB7z+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEllzyWf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243781; x=1789779781;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U9JGB+fTVWLojCkLU6Z3hu87s+mv3Zm5bTC5xoWL+9Y=;
  b=IEllzyWfWd1a6VT1z5tJFv7v5UtfWux+ukFXRF9egmBVhDks+RFp0O3d
   1vHyRmyAKnN6Iarg7IXeI2bOg1h35HDr25q/X9U6PvYOt8UkqqsOJZHrl
   vDDKZUHgwbo5sT1RGqtlIaNYjnmadOjndqi2dcRiPJK9ViQxvPGMRB4Ds
   HrCxGqhFBcSBk7GhK/Xwu7NmhxVu2+GuQMv2irlq6Q89cR2tsC8b2dGfn
   yKAqN6u4KHobL175NfJY5GPmCLBM3Y5OoSWI7kS88VZnwCBM22kA2Rwiq
   YASOM60G0DDzgrCVisDOMBQmpENVLCF+RUcr4rWuQoeGa5DwXh1D5tE5e
   Q==;
X-CSE-ConnectionGUID: oILyv2/vRgeQKajdpNfVuA==
X-CSE-MsgGUID: Pzmg2Tr+QhCybVg3r+YvYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60535413"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60535413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:03:01 -0700
X-CSE-ConnectionGUID: XkppnEqoTNW9EAIiON182g==
X-CSE-MsgGUID: 2dkoEgcdQXa6yjXX4QDNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180815152"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 18:03:00 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 2/6] HID: intel-ishtp-hid: Clear suspended flag only after connected on resume
Date: Fri, 19 Sep 2025 09:05:55 +0800
Message-ID: <20250919010559.165076-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919010559.165076-1-lixu.zhang@intel.com>
References: <20250919010559.165076-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When resuming from suspend-to-RAM or hibernate, the ISH firmware is powered
on from D3, causing all previous client connections between the firmware
and driver to be lost. Although the underlying ishtp bus driver initiates a
client reconnection flow, this process is asynchronous. As a result, when
hid_ishtp_cl_resume_handler() is executed, the connection may not have been
re-established yet. Clearing the suspended flag prematurely in this
scenario can lead to a timeout when the upper-layer HID sensor driver set
feature during resume.

To prevent such timeouts, only clear the suspended flag after confirming
that the connection state is ISHTP_CL_CONNECTED.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index d8c3c54a8c0f..7fb554482100 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -757,8 +757,15 @@ static void hid_ishtp_cl_resume_handler(struct work_struct *work)
 	struct ishtp_cl *hid_ishtp_cl = client_data->hid_ishtp_cl;
 
 	if (ishtp_wait_resume(ishtp_get_ishtp_device(hid_ishtp_cl))) {
-		client_data->suspended = false;
-		wake_up_interruptible(&client_data->ishtp_resume_wait);
+		/*
+		 * Clear the suspended flag only when the connection is established.
+		 * If the connection is not established, the suspended flag will be cleared after
+		 * the connection is made.
+		 */
+		if (ishtp_get_connection_state(hid_ishtp_cl) == ISHTP_CL_CONNECTED) {
+			client_data->suspended = false;
+			wake_up_interruptible(&client_data->ishtp_resume_wait);
+		}
 	} else {
 		hid_ishtp_trace(client_data, "hid client: wait for resume timed out");
 		dev_err(cl_data_to_dev(client_data), "wait for resume timed out");
-- 
2.43.0


