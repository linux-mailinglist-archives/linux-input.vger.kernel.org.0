Return-Path: <linux-input+bounces-14888-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A27B881C1
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 09:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9B516B19D
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 07:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E28A283FD0;
	Fri, 19 Sep 2025 07:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWraXUtm"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EBD2AD24;
	Fri, 19 Sep 2025 07:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758265784; cv=none; b=NJyg+ZLLYW/eqGCcrOgypDqZ31suRlfC6Eq+zK0323Fyp6lvpEVAT59Sy5sqfLR4+zDOiX6sa3fKvFG0xItZGyHPB+2nRwDklubc714YHE9NcwoBxlt90z85sSzIhdKHuIIHxSwkQPrT1R6J2wLlQ+D5QkVpbd5JRzpElqzondQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758265784; c=relaxed/simple;
	bh=rJuniOsWEr71e26cqc2VfiqCH5lz0AGJ2j9qvY0r9i0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lWF5nHpEeRTIRS9hiN3F7822eJTMGnYKmuz4mhAo/Cms7jNRVi9TAPhMQxKEqhGZQnjVQYi4wN1e67TfrZK+ADwVJ4SDGfKLDSW5KEPzniBBlmb0q+a3lZEiIEhMpwBUshnqnBQuq+dbs+yuGFErA+XeDjz1vHi13sKSI3l22Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWraXUtm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758265782; x=1789801782;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rJuniOsWEr71e26cqc2VfiqCH5lz0AGJ2j9qvY0r9i0=;
  b=GWraXUtm6O/YBjQEef1MGWQlm1ZuE0dxDI1sLqldHr5FzuncAMOAlsiS
   c3o+PJzSBHFet37LOk2Ao10K/sge6xKE/iY3LxQSsBogmGkYO7iUD9CJx
   OYIXhULyR1oMdPrGVEUpgq93pN7ashNiwC4ix6Je/K9z3ifPDOt+MUomN
   LH/knsy3uZ+DmJ3/TONg5LeTTsYutvNfQhj+IpeMR4mJrSL/VmbKsvx4s
   cnhMpF6VJYV0VaDY2IwuTd+uOlVSedvls3x51DmV5b+q1uDp9WI+1Xe0J
   +8etkDjMgJZzV+aw72sO0xq8WzQiMgxSmlR4Q/gze0JZ2qUGx3akypcKC
   g==;
X-CSE-ConnectionGUID: SItvLvLxS6y0khzuXy29+w==
X-CSE-MsgGUID: 0p2TyL3NTjmsqQ0VB38BYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83208583"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="83208583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 00:09:41 -0700
X-CSE-ConnectionGUID: d67ybyEqQW+yi65ovAvBiQ==
X-CSE-MsgGUID: VSkS5WiNQ/yQDvpBc151Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="206709358"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa001.fm.intel.com with ESMTP; 19 Sep 2025 00:09:38 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	srinivas.pandruvada@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>
Subject: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first interrupt from level to edge detection
Date: Fri, 19 Sep 2025 15:09:39 +0800
Message-Id: <20250919070939.223954-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation used level detection for the first interrupt
after device reset to avoid potential interrupt line noise and missed
interrupts during the initialization phase. However, this approach
introduced unintended side effects when tested with certain touch panels,
including:
 - Delayed hardware interrupt response
 - Multiple spurious interrupt triggers

Switching back to edge detection for the first interrupt resolves these
issues while maintaining reliable interrupt handling.

Extensive testing across multiple platforms with touch panels from
various vendors confirms this change introduces no regressions.

Fixes: 9d8d51735a3a ("HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation")
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
index e6ba2ddcc9cb..16f780bc879b 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
@@ -280,8 +280,7 @@ int reset_tic(struct quickspi_device *qsdev)
 
 	qsdev->reset_ack = false;
 
-	/* First interrupt uses level trigger to avoid missing interrupt */
-	thc_int_trigger_type_select(qsdev->thc_hw, false);
+	thc_int_trigger_type_select(qsdev->thc_hw, true);
 
 	ret = acpi_tic_reset(qsdev);
 	if (ret)
-- 
2.40.1


