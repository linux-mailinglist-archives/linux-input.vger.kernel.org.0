Return-Path: <linux-input+bounces-16409-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECCDC9601E
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 08:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7413334349F
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 07:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72EE2BDC25;
	Mon,  1 Dec 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrNurtPK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D42BE7D9;
	Mon,  1 Dec 2025 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764574224; cv=none; b=WPxxRvzprWAHQFrhsv4pMfjvtVgyeFMQEJrZIW0STJh28OgqCBlj/nafaPqc3BRWcb3kqyW3H5QUyC0tBmjFVmZBidxDqzLxhY9nBBME4njCusRlZRvJmpOpYi3D3eBJTA5GvNiMLwXemKyBqxfywazF4f8e7p+cPuvuaI/rlbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764574224; c=relaxed/simple;
	bh=vkCl+SoH183sKdoLe4tyyDGe0pgHxw+Cz2RDoVj2blM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ka0UDQ2hAjHVP9z5UkFnrvEs0vrQ9HVC+RkFerp1ny/Dcw+JmCajHa7iwTm4/8EQSWCzdGPl0BeeOpjv+Vqn8h+7da5KXmGOLXs147wnNmY+Sqjgr8s/H6/aNqnoLeszB6Vy8ziG67uln4ibO2sjT+me7dj0eZ5OkaipXaHLrSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrNurtPK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764574223; x=1796110223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vkCl+SoH183sKdoLe4tyyDGe0pgHxw+Cz2RDoVj2blM=;
  b=TrNurtPKnLSz5xOSVmkvWnyTYGj+OJOnlWYTy6km9jyZpnL66p8kIWeI
   WpBOBEp0/zvQzeQ4zlMMgyArPf8T9JLmJA9DBhVNbdJaUALsbo66OQviq
   pKT0vqt0VCXltOVHWMwebBDOdlZIYXMI4jTjpFVf0n3rH3nOl/pvXqyTD
   NYltcO4zLBLg0MnMnvAtiiaPqxhm8PfWVzga9kaRMe8NezB9DVu8fURdI
   GjoCSNGwnVBL4gAV3/+b1AlDzC4z4cGMhrl5qPRmnlCJ8K//BKcTwzmhw
   tu2yQMyEJWqTeW/nrdUynVoGVL4l5/NinhqbETcaOKVDTkqxog0ItbYlR
   Q==;
X-CSE-ConnectionGUID: QMVJxvFhQiOQcAm2l9tbBQ==
X-CSE-MsgGUID: bTheBPdMQYGkkRYSM0v1ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69097653"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="69097653"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 23:30:21 -0800
X-CSE-ConnectionGUID: fQDbG0p/S/GQOih+hHdPoQ==
X-CSE-MsgGUID: Hieg8sToS4+J3zrZQ5qT9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193886784"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2025 23:30:20 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 2/4] HID: Intel-thc-hid: Intel-quicki2c: Use put_unaligned_le16 for __le16 writes
Date: Mon,  1 Dec 2025 15:30:45 +0800
Message-Id: <20251201073047.3313824-3-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201073047.3313824-1-even.xu@intel.com>
References: <20251201073047.3313824-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace memcpy operations with put_unaligned_le16() when writing 16-bit
little-endian values to the write buffer.

This change improves code clarity and ensures proper handling of unaligned
memory access.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index 013cbbb39efd..ab390ce79c21 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -41,9 +41,7 @@ static ssize_t quicki2c_init_write_buf(struct quicki2c_device *qcdev, u32 cmd, s
 	}
 
 	if (data && data_len) {
-		__le16 len = cpu_to_le16(data_len + HIDI2C_LENGTH_LEN);
-
-		memcpy(write_buf + offset, &len, HIDI2C_LENGTH_LEN);
+		put_unaligned_le16(data_len + HIDI2C_LENGTH_LEN, write_buf + offset);
 		offset += HIDI2C_LENGTH_LEN;
 		memcpy(write_buf + offset, data, data_len);
 	}
-- 
2.40.1


