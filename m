Return-Path: <linux-input+bounces-16410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D2647C96021
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 08:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 070FC343280
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 07:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B4A2C08D9;
	Mon,  1 Dec 2025 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWoV/tZd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B462BF3CA;
	Mon,  1 Dec 2025 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764574227; cv=none; b=T0KCmmrRwrt0mA0cQexgglnpkclpQIaW4hh8I2/EfVBmzUIDo3JO7YZOoc5X9XGFlWPVDO9O7lRq8pPip1XzeKdGciAhNEr/Fvs8QBQuPH+PnCP2s3bO0UzYzG1Ami2v9dNu5FX8at9iZ+p8mSSxYRsJiabxzdk7NyDK/casojA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764574227; c=relaxed/simple;
	bh=G898iUbe2qQBPUD3ohaw3FS8dYlUa4YTX2bWEkPQMrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WO0tLH/2/3MDg1Hp+RDX9fQ/6TBX3MCODx+vhdJafiN+PC+mpPLowHficMijlQ4v7dB9wwsgvZfgvIs8AlK1mGhB1N34Kjs13DV21QFNtXKZrOci3p0vWNnJR1LarWWhCafvgTIJwGUYMW7OdK9nFbAyEp5E+QEkORGr7JID48o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWoV/tZd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764574225; x=1796110225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G898iUbe2qQBPUD3ohaw3FS8dYlUa4YTX2bWEkPQMrs=;
  b=fWoV/tZdEKTQpC2wOtm95CWOZd1ThyyLuihsJfmYfjCQzgTwUuGpd/hj
   460Al2Jwbecdf0w1H1+dqXMujczysuGsFToexHf4zPBU7LWW4CnnnITkn
   UCnm8tqu1tQbZrDdC84gwHJVO87r3U435kp/nf06OumOSzPuwVaezrhZO
   bPB3ZHmmoKgAQv7P7ucYJiCh3rSnrpFc4JgOaPN57GpXxZ1W9WVhfFgp5
   gBsAsfLi6PVhpMrkcGJtrPuChLeYWOaG0kzAkssZq/dA2zVPsMfrh2H0E
   7VhM9FKRedidtiGj+rLT6Rvhr/spErfkDpcqQwIyYmYKcPYlZwfYcQqdM
   g==;
X-CSE-ConnectionGUID: pvlg4eGnQHCEhVW6WoIViw==
X-CSE-MsgGUID: UKmNkNLETRiCMa1KztnV8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69097656"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="69097656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 23:30:25 -0800
X-CSE-ConnectionGUID: YieI7aCtTkmUP1Kl7rzHeA==
X-CSE-MsgGUID: ABAZSBDeRxyZ3uCkqhBrqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193886823"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2025 23:30:24 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v1 3/4] HID: Intel-thc-hid: Intel-quicki2c: Support writing output report format
Date: Mon,  1 Dec 2025 15:30:46 +0800
Message-Id: <20251201073047.3313824-4-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201073047.3313824-1-even.xu@intel.com>
References: <20251201073047.3313824-1-even.xu@intel.com>
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


