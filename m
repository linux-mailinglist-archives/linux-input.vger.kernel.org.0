Return-Path: <linux-input+bounces-16494-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE3CAF34D
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 08:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 388A93019B49
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 07:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830CB29D275;
	Tue,  9 Dec 2025 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYITJIUt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA78274B59;
	Tue,  9 Dec 2025 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266680; cv=none; b=ouZsVmTzyFiwhXzF6ol35dptl2Dzmg85yUYQkiHvXL0rqdND1xjgPFVK6GDBw/PqCy1uBxmHFFjy9yORYL31zwgCw7tl0y2EZaKanS5QlpkX7SHEGuOWuO8PYyq948uD6bdLdqdsyByEsM9UAi8TSWbcHb311BZUKSpth9QE9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266680; c=relaxed/simple;
	bh=vkCl+SoH183sKdoLe4tyyDGe0pgHxw+Cz2RDoVj2blM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R6S/V0p6nt14G9GHoIYX6yQ8JA/s7hfGe6u7EvrtME9WfWHHsEtAzbmXyFBc2tAKQaPdkOjKs2ZK4xkf3uieSCJgn0Y6xavxZCMQyZ/Wt9nAQNuBry1g+PIzbJxGJYQAVYfBWPUG5j4P5jAE049QIE6X3rWFfr0KyyeVqYMw0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYITJIUt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765266679; x=1796802679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vkCl+SoH183sKdoLe4tyyDGe0pgHxw+Cz2RDoVj2blM=;
  b=BYITJIUt2MJIpK7VYXyRmlrkqt2W21gsiwPopcfc1B8K/IgEloqNfrQh
   WZ1W9lioXk6NJzcL5N/ESb7WfI5+LZkHZnzSG+rQMqxm3fqKzf1JMZ2Wp
   7gG+996Q+UpN1iAfNySPb7VHaXlnCebjjv8lPHAedc1kO5Zev0m3dR5zb
   9WolkztNUY+mqNvMf0SawFDeXeCtuP4Gd8QvEGzBfpXa3BBiik7KzVIwP
   qRNr4Ot9j0ogIRgDYGNgvG0vyaPFr/TEqEyNehm1OJuud/hK6qj0y9+Nn
   i2vyY1WckDDkvTKx08TFTBicolnNEd+LPJya5iamg0W8sYi7ZFDBmudPK
   A==;
X-CSE-ConnectionGUID: 3wz8eM2qSaOwbpJqaBiNzA==
X-CSE-MsgGUID: vNBUT/uWSTKx1IRX5jm4tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66942716"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="66942716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:51:18 -0800
X-CSE-ConnectionGUID: lVQcfihQTbKAzzl62BpKaw==
X-CSE-MsgGUID: 8VE3lFBLS/ipfPSc1A00yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200599868"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 23:51:16 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v2 2/4] HID: Intel-thc-hid: Intel-quicki2c: Use put_unaligned_le16 for __le16 writes
Date: Tue,  9 Dec 2025 15:52:13 +0800
Message-Id: <20251209075215.1535371-3-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251209075215.1535371-1-even.xu@intel.com>
References: <20251209075215.1535371-1-even.xu@intel.com>
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


