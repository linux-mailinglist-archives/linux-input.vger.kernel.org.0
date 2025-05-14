Return-Path: <linux-input+bounces-12354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B9AB62E1
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49987860986
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6931FE47C;
	Wed, 14 May 2025 06:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2ZNHqXs"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748341FAC4D;
	Wed, 14 May 2025 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203641; cv=none; b=kJyc9KwqpMi7qPrbsTmg+dzU0lsmHcrEfhySyKehyflzPcgtOAMk9EA5v1j90AuLFfprtFmnRZ+JZWQx6nprykdRk0HCff034U+vaCKQvs5erAfq3LKLJN7Bo5c8ZUAI9avTQZU7UQzZvCoPKMPQwlq2ThhA1tYLJhabrTsf4WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203641; c=relaxed/simple;
	bh=9gEXGjSwEKkSMbwqmvncKN7KY6/6NkqrP/2j+6EE6ac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q+1rcbCOQ90T8hrXwr5lWl24yolGuOm1dmaRPBHW5ipBINFBAQaBv6RNsLXrUlOJX52TmUlB/2oMXv6X7MWn+vVh8gfKKV0t6LmfbF5IHYE+3hzaQdfmRLQ1thttsUwjpr/ABAcku02LoR/01E3Fws4H6gOB3kIh/b74HaJ4RAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2ZNHqXs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203639; x=1778739639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9gEXGjSwEKkSMbwqmvncKN7KY6/6NkqrP/2j+6EE6ac=;
  b=V2ZNHqXsK8gOHcB+6Zdg0cgv0GU2nnf1xhn4AayYrngrnj2LQ2h91jUy
   2ZxQ7kI4RFAqS3aJMs+5Se8tBh+w9jXuQ3RDtXscfGn/xD2U+6mwDXiU3
   lJN/6ekWZeB+bbbwygts+8ZmVRowVL7UMdh4w4QmXYefFqh69qa19X+At
   zfpo+ZTEZDo9grOuMGUljn7Z8Cnr8m/wchrQhRTeCk02A52Xg6CJ2DtZv
   xSZYxXnF47kXwjZOyrKynQdN1dMEsc3t8wnezGtHIqVxFdV33DDfMW8sm
   tVK8TkZ/1coUXAuwOBFKUyTJ8cCYBllCXmz1BWI/M2LnNVZpTwDNEvkgx
   w==;
X-CSE-ConnectionGUID: bAYvh/PYSc6f16L0/bqy8Q==
X-CSE-MsgGUID: O8K91o8ZQfmQ9duZl44OeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192359"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:38 -0700
X-CSE-ConnectionGUID: /lBCPBrfTzeR97McFm+kAg==
X-CSE-MsgGUID: r48F/lXVS2+sTS41Gy3L3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138866968"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:38 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 1/7] HID: Intel-thc-hid: Intel-thc: Add thc_dma_content into kernel doc
Date: Wed, 14 May 2025 14:19:38 +0800
Message-Id: <20250514061944.125857-2-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250514061944.125857-1-even.xu@intel.com>
References: <20250514061944.125857-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert thc_dma_content structure comments format into kernel doc
format, let it can be included into kernel doc.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
index ca923ff2bef9..f799d1180e55 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
@@ -117,9 +117,10 @@ struct thc_dma_configuration {
 	u32 dma_cntrl;
 };
 
-/*
- * THC DMA context
- * Store all THC Channel configures
+/**
+ * struct thc_dma_context - THC DMA context
+ * @thc_dma_configuration: Array of all THC Channel configures
+ * @use_write_interrupts: Indicate TxDMA using interrupt or polling
  */
 struct thc_dma_context {
 	struct thc_dma_configuration dma_config[MAX_THC_DMA_CHANNEL];
-- 
2.40.1


