Return-Path: <linux-input+bounces-16495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5DCAF347
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 08:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A1823038A0A
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 07:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91BA283CA3;
	Tue,  9 Dec 2025 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGw/opoo"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFC028D83D;
	Tue,  9 Dec 2025 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266681; cv=none; b=NlMoHiWPt/mO1Me18o1rQ3fi/q3acHD7SaWPhzlHC7R0f/XhpH8ITmw3s5K77hZJF9rb93PfR267IeZoK8XIUE/NdoReaFiz3sQ1OFwKdWRvsRS4LHFbbdMJ6RawbtOB5rD3KUhR981j9BH3TKsdGCtX9HJvTAqTkDN+Sk3Gw+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266681; c=relaxed/simple;
	bh=G898iUbe2qQBPUD3ohaw3FS8dYlUa4YTX2bWEkPQMrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DkJWaccY/ug96Mx/w54HEarleM37nBp6BO3PO74rwT9T5rIsNUBVWd83yOiZDhjI6J3UvDuOdR00SOmtppG8N3g11ZECwsA0Wt8XPGkHzI85Cl4/pfxxk64tZ/rCMYG21W9uKGR/I5sIGR7vP4h7zcwu3hJXeDsC9egoFqg52+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGw/opoo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765266681; x=1796802681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G898iUbe2qQBPUD3ohaw3FS8dYlUa4YTX2bWEkPQMrs=;
  b=NGw/opoohb0Pizut8IGjaIdQZaT5vMCmONLOAYVHzjW2GYMPR1U/PuBR
   CA2KXiqXaylXZsfN9oW6VHRgfISDfSjrqylNsk5wbRvjmEH8g3xX79zsY
   CVQuqQp+R1QT9AEgwRlvn2AhiN0nLEd5vMxpq1GZSBw1WTGaMUj79OCpa
   SxGzR0j3AhH4DLWi8mLN8siaAznmt+wy1IMGzKzITbsG6qbREDWuCEk00
   km4eXGVWgMtiNQIJiTAwfhowhIklgOO2ESCYojba1N0nQJuGQOs9R818a
   8vAxyqKTTSfw7OZAiV+Lpx2Phl+MME9FGoFuJLw7PtjscFia6nEz7Ox1n
   Q==;
X-CSE-ConnectionGUID: vPQ05OaHQdGGRI3I5qVkyw==
X-CSE-MsgGUID: wD3j4qmjT/C6iAQn9dYXXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66942722"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="66942722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:51:20 -0800
X-CSE-ConnectionGUID: PvMbmxZYSeebGPP/ZHUUMg==
X-CSE-MsgGUID: W6OWAU2eTbWZ9ok2qmLXaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200599891"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 23:51:17 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 3/4] HID: Intel-thc-hid: Intel-quicki2c: Support writing output report format
Date: Tue,  9 Dec 2025 15:52:14 +0800
Message-Id: <20251209075215.1535371-4-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251209075215.1535371-1-even.xu@intel.com>
References: <20251209075215.1535371-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are two output formats requested in the HID-over-I2C specification:
- Command format (set feature/set report): encoded command written to
  command register, followed by data written to data register
- Output report format: all data written directly to output register

Current quicki2c_init_write_buf() implementation only supports the
command format.

Extend quicki2c_init_write_buf() to automatically detect the output
format based on the presence of command parameters and prepare the
appropriate output buffer accordingly.

Tested-by: Rui Zhang <rui1.zhang@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 .../intel-quicki2c/quicki2c-protocol.c          | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index ab390ce79c21..a287d9ee09c3 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -30,13 +30,18 @@ static ssize_t quicki2c_init_write_buf(struct quicki2c_device *qcdev, u32 cmd, s
 	if (buf_len > write_buf_len)
 		return -EINVAL;
 
-	memcpy(write_buf, &qcdev->dev_desc.cmd_reg, HIDI2C_REG_LEN);
-	offset += HIDI2C_REG_LEN;
-	memcpy(write_buf + offset, &cmd, cmd_len);
-	offset += cmd_len;
+	if (cmd_len) {
+		memcpy(write_buf, &qcdev->dev_desc.cmd_reg, HIDI2C_REG_LEN);
+		offset += HIDI2C_REG_LEN;
+		memcpy(write_buf + offset, &cmd, cmd_len);
+		offset += cmd_len;
 
-	if (append_data_reg) {
-		memcpy(write_buf + offset, &qcdev->dev_desc.data_reg, HIDI2C_REG_LEN);
+		if (append_data_reg) {
+			memcpy(write_buf + offset, &qcdev->dev_desc.data_reg, HIDI2C_REG_LEN);
+			offset += HIDI2C_REG_LEN;
+		}
+	} else {
+		memcpy(write_buf, &qcdev->dev_desc.output_reg, HIDI2C_REG_LEN);
 		offset += HIDI2C_REG_LEN;
 	}
 
-- 
2.40.1


