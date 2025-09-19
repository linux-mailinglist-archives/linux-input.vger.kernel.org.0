Return-Path: <linux-input+bounces-14878-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D66B87914
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EE777BDA53
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943471369B4;
	Fri, 19 Sep 2025 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSoBzn9L"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F9192B90
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243781; cv=none; b=LT2z2Vge2qZuQOuoPPGBTTwRbMeRWhM5p3ehn7nCRQkDriBe1x59AhWzu6ZmAlwjFa+MWnZt8WUPqrkIwEAtWfFjdbjYzl/axdxBFJeDzWgGlVniCrn1/kmtzUxv2n1rkmePcyvHRNzAHnapFErEtUtgUCb7ZLhc0e8UVSvhj0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243781; c=relaxed/simple;
	bh=pUfs7B7uXv514mjIWdy0KY9PHA1Vku0QHLqmr8xxEqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXqjziv+7YzI4edPG1xfesIh6sNQO+uQcpxXWl54itF8vfMGNOsjPgGeD8jwrViDbJlGsFzhE4qMG/yrxhpgjiKB8tUX/f+e43vNTkEA58f0WCb5bFEMwc8RmieL/zF70sOZ2+XDD/8z/U3h/jCOV5neR876tq75HIB+VMoltFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSoBzn9L; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243780; x=1789779780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pUfs7B7uXv514mjIWdy0KY9PHA1Vku0QHLqmr8xxEqM=;
  b=gSoBzn9LPe9GgrKD2UaEVdGBZ/afZhJ8zvVtVeBO81Sypp9DFOs8rcjh
   iPbaVgq92JSdsJ47VmPA71IeEeU/sA4yi51q4WKoJN2NDKYYDjIq2xzci
   bZ0s6KbSgM2VvZX/v3od+UZexQxJM5gpmoFsCJqsi7Kts7P4q/SbfM1dU
   0+2yBIQN6pKhEJ/lvW7aJ+oR0wFjG/4yq4Lcu6Z4X8Aq4VLEMKNlL82fF
   /yi7wxP8BDeWDn8bpssD4gzB0C6hZbCiKxtOwhlSH/Uij2+/eCVH5BZTQ
   MX3v0JmlAJo0fBvkzrBVceXrepnkjMaiJv4rtij7Q/CFwog96wO1fvI3E
   Q==;
X-CSE-ConnectionGUID: AsoVLoZEQyCja5ZcwcGh6w==
X-CSE-MsgGUID: rrVlERxLTD+CknRUoWLmjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60535410"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60535410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:02:59 -0700
X-CSE-ConnectionGUID: 0YLg04SWSn2FdtNp1+9V0w==
X-CSE-MsgGUID: JhrrrWe6Sa2bzfEwvG8T7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180815147"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 18:02:58 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 1/6] HID: intel-ish-hid: Add ishtp_get_connection_state() interface
Date: Fri, 19 Sep 2025 09:05:54 +0800
Message-ID: <20250919010559.165076-2-lixu.zhang@intel.com>
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

Add the ishtp_get_connection_state() function for struct ishtp_cl, allowing
ishtp client drivers to retrieve the current connection state.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/client.c | 6 ++++++
 include/linux/intel-ish-client-if.h      | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index 21a2c0773cc2..40f510b1c072 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -1261,6 +1261,12 @@ void ishtp_set_connection_state(struct ishtp_cl *cl, int state)
 }
 EXPORT_SYMBOL(ishtp_set_connection_state);
 
+int ishtp_get_connection_state(struct ishtp_cl *cl)
+{
+	return cl->state;
+}
+EXPORT_SYMBOL(ishtp_get_connection_state);
+
 void ishtp_cl_set_fw_client_id(struct ishtp_cl *cl, int fw_client_id)
 {
 	cl->fw_client_id = fw_client_id;
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index dfbf7d9d7bb5..cccdf60b0247 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -107,6 +107,7 @@ struct ishtp_device *ishtp_get_ishtp_device(struct ishtp_cl *cl);
 void ishtp_set_tx_ring_size(struct ishtp_cl *cl, int size);
 void ishtp_set_rx_ring_size(struct ishtp_cl *cl, int size);
 void ishtp_set_connection_state(struct ishtp_cl *cl, int state);
+int ishtp_get_connection_state(struct ishtp_cl *cl);
 void ishtp_cl_set_fw_client_id(struct ishtp_cl *cl, int fw_client_id);
 
 void ishtp_put_device(struct ishtp_cl_device *cl_dev);
-- 
2.43.0


