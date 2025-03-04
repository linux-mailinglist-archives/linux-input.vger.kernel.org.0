Return-Path: <linux-input+bounces-10514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB0EA4D20C
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 04:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42C1316F985
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 03:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11508154C04;
	Tue,  4 Mar 2025 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3276b6L"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AEBA2E;
	Tue,  4 Mar 2025 03:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741058719; cv=none; b=TmXtw7U4zk8dL7yAHx9smeQ20l3lsSE7XB91fyxqMS95kykXz/lraE4dw99a9evVEnGVF4BDglkxw+sSenTXaUZtxY5Jcn0CjysgaDSewpeLOZQlA3YqnKy1oSU+EH2GvBIWzAEEWtn+J120DLvsJl1luhcFaDmF0SiFtkNZbSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741058719; c=relaxed/simple;
	bh=M5770CcDHR0OcFtJqXIYHmNfPBb74uPQIdJ+bPk9r6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gnaRj/vgvfQzinmT+3RbT6KO5bwu8nYa0DnseVHskrhJXQwcLJKjS0OCBRgcu39M2NhgrlEd5hAnpwdglqrBSHmmqTykRnFju1o6MBnEDC2oNDyYKa/aUphGPAOrH6F57JrrORskSEiGbsEr98JUMhskOKdE/+azhXPU8Jdfqig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3276b6L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741058718; x=1772594718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M5770CcDHR0OcFtJqXIYHmNfPBb74uPQIdJ+bPk9r6U=;
  b=I3276b6LnATCy+Rlc9RiJZeqS9HwDgoERAAJoXMoOLZKtIJtNE0bkkgx
   FsT6Pi6NqnVMvSN0pk9lrSE1bRL5C6ot+Cph2e0Zrddj+BA3Ybl/COweX
   3QqAH840jiJqgwf4NS3FhwrZyGp+mU5opd3T0A0ALDwk5Q5SLbk1Pj8Wj
   iXDPIdqWuRbhXZHHKCzh4OC8l1RzEv/XEjd7MAZNv1qcjpaoADjRyYB3a
   QsoMFEhN99HuagpUYMm7zb3m8/IaqlyJpBMlBi2s8IFgwWDyj45Y5hsYG
   EUMSqG5v5SxDkaFW/vcvJKZiPdphSThJWPQ164d9LBS29kH/oTCCM7bb2
   w==;
X-CSE-ConnectionGUID: tpFJrWSISJqXBuUPCiAt2g==
X-CSE-MsgGUID: L9ahLgVkSWiBD4a5CzzDcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42148535"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="42148535"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 19:23:22 -0800
X-CSE-ConnectionGUID: +zBFBDNmT1a5h1N73+ndQw==
X-CSE-MsgGUID: Rs+MytAXSiWTIGb/32gJAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118244670"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2025 19:23:18 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct device state after S4
Date: Tue,  4 Mar 2025 11:22:55 +0800
Message-Id: <20250304032255.1131067-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During S4 retore flow, quickspi device was resetted by driver and state
was changed to RESETTED. It is needed to be change to ENABLED state
after S4 re-initialization finished, otherwise, device will run in wrong
state and HID input data will be dropped.

Signed-off-by: Even Xu <even.xu@intel.com>
Fixes: 6912aaf3fd24 ("HID: intel-thc-hid: intel-quickspi: Add PM implementation")
---
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 4641e818dfa4..6b2c7620be2b 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -909,6 +909,8 @@ static int quickspi_restore(struct device *device)
 
 	thc_change_ltr_mode(qsdev->thc_hw, THC_LTR_MODE_ACTIVE);
 
+	qsdev->state = QUICKSPI_ENABLED;
+
 	return 0;
 }
 
-- 
2.40.1


