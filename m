Return-Path: <linux-input+bounces-15535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0EBE6185
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 04:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80F273AF2CA
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E432213B280;
	Fri, 17 Oct 2025 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuQ539bL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340B1F4CB3
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 02:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667569; cv=none; b=FMSqxPvKe6/fPYQKSm3Yc2jIuzWJyMIVpG6IeaXlYpctyjoCy/YBiZlXi5J8FLbAohhn3E3+YmzfoOIs/QETlxsg8zOBzRWqwP/iEtdsNqPzNuKtAi0SYO27XFOAIVvu2ax4M+FjOVTGXb6yGwJJwsDR20rXhxZgs+iD/NrBABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667569; c=relaxed/simple;
	bh=HHSwiaPiLKBQZwnvExHfoTIV06twzdLVNb/4Br+epZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGsTBlchRJQOP20LysSFar4I8mAZUaTh118MC+4qaoFNLJ1tTfxaiphnLp/18wYsrAznoxWQbS1tPsWe4WKDTUj2GnGnBKTD+UX3FLhtVW1UAoag9/Vx21Q4dzUziMWUh4ebqh49yjFAui+w6yVG87o4+BngQYRQHuC65HuctL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuQ539bL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667569; x=1792203569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HHSwiaPiLKBQZwnvExHfoTIV06twzdLVNb/4Br+epZI=;
  b=RuQ539bLVEBKCwm/Cace8aVaPdmXx13RSgZm0Fp9IudiD0DTfU88je2y
   ztK4jIwmG1gIuwgr7mPkh2fjbJ6s75SvLHgj9iQD4mP7SSCQI6x22u4uP
   p66TQylPseAdjQkDRBAVxXqeKimpI4vvq2BhXTu3mpIejWiIM22BlnHif
   mYWMTr4plGYqOmjIVkyiJ8ZEmwnFyZWBEUMwNeU2QdAo59/e0LAxMNLKd
   Hhp7qPyE6wE0bCOruNL8QpiapxSoCSy1IPElL/0v2jZg2leOo77JHpuoy
   HgYDqU01FkGU0nyAzg6hNWH+5+JEjp0AAXL6ZDPt7lw6mRcyA6uSgEkmW
   Q==;
X-CSE-ConnectionGUID: GXoHbRLmTvaiX8Bfe2CdTg==
X-CSE-MsgGUID: CG61xld+T9200F3Sqq2Qrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66738703"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66738703"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:19:28 -0700
X-CSE-ConnectionGUID: fVG+zYd0TryXbmlkk5h0ag==
X-CSE-MsgGUID: soHwcvSgTTOANSEzPXbZgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213586351"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 19:19:26 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH v2 1/6] HID: intel-ish-hid: Add ishtp_get_connection_state() interface
Date: Fri, 17 Oct 2025 10:22:13 +0800
Message-ID: <20251017022218.1292451-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017022218.1292451-1-lixu.zhang@intel.com>
References: <20251017022218.1292451-1-lixu.zhang@intel.com>
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
index b235fd84f478..2cd4f65aaa37 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -109,6 +109,7 @@ struct ishtp_device *ishtp_get_ishtp_device(struct ishtp_cl *cl);
 void ishtp_set_tx_ring_size(struct ishtp_cl *cl, int size);
 void ishtp_set_rx_ring_size(struct ishtp_cl *cl, int size);
 void ishtp_set_connection_state(struct ishtp_cl *cl, int state);
+int ishtp_get_connection_state(struct ishtp_cl *cl);
 void ishtp_cl_set_fw_client_id(struct ishtp_cl *cl, int fw_client_id);
 
 void ishtp_put_device(struct ishtp_cl_device *cl_dev);
-- 
2.43.0


