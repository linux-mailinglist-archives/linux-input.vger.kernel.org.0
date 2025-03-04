Return-Path: <linux-input+bounces-10513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB0EA4D1FC
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 04:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A9DA188A8E6
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 03:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AF113C81B;
	Tue,  4 Mar 2025 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cD1D4dDt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88AB640;
	Tue,  4 Mar 2025 03:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741058256; cv=none; b=dZ51si/lkiKZjN+ZkU0HD1nn3I37vCWvl9gcTofGrdzRI9BF/gK8162WmN7HDmgIo+5AE2HTticUzw5FwdK9vPnU5WoTsSfC0bvgbGjHqEsgWH2qTktWSsAX84iVeG8xWaihXQRxrZV2vpPMjvnLTc9t1Rqp1hpDi8X8fRdrMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741058256; c=relaxed/simple;
	bh=RjFzEFu3OskJe+RxmaWU2bDZFfHIp0XQfkUysFEbJxE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ICISIchVOzo5Du/onMOgEL6wCcR8emOJlSrl4A42Jl9VdeExOCqfEuV2wKdt3wPpCjanjSxOoZvP9LdnECMLXIHsB6YeZllZ1sebaYYIZChwn+t68FU4BM3anh9eh7Ul8BLKBRFVgS9gJavgKiWB4bODurzhlAdYx6ajf3psrJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cD1D4dDt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741058255; x=1772594255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RjFzEFu3OskJe+RxmaWU2bDZFfHIp0XQfkUysFEbJxE=;
  b=cD1D4dDtvNQOtFG2HKO6ERlKVuWyTeqgBmlBN6VmMGhv3z/spnIzoN8w
   wcitf4+8ayvinpo6z8MthzgtmBi+kkWjEJEVWlFI3qAORziRvT9s90JxW
   u8GEg4DtBN4mQd7U11WUxW77xiLQ03eWfECeJZ+qrjTJeWdfLNcd41G/F
   z6UFWWWqM27HnJ6MftQkcG+lLQ9fDOSPxydVDGorVhMR4OmyiVbRtrt1l
   doznYUskLLALdJpKMJTYR1+wADRtt8K+kihjGbkXqvtJubMiCKM3psukQ
   yQ9arZMMTNny69SUlO1qyVuDz14/pA0uGhyeOe9D1rKfhRPHKh6qN5XIL
   A==;
X-CSE-ConnectionGUID: p3aoajnJRw+q1obl5yDMug==
X-CSE-MsgGUID: abuQzXcAT/eyritQIU4mDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41131279"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41131279"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 19:17:34 -0800
X-CSE-ConnectionGUID: ZtsF1NfeStaYZlTXGqV/KA==
X-CSE-MsgGUID: aS9JGoKyQKmayoS4Huxavg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="141456323"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 19:17:32 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: Intel-thc-hid: Intel-quickspi: Correct device state after S4
Date: Tue,  4 Mar 2025 11:16:58 +0800
Message-Id: <20250304031658.1125075-1-even.xu@intel.com>
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
index 4641e818dfa4..fb0807622a97 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -939,6 +939,8 @@ static int quickspi_runtime_resume(struct device *device)
 
 	thc_change_ltr_mode(qsdev->thc_hw, THC_LTR_MODE_ACTIVE);
 
+	qsdev->state = QUICKSPI_ENABLED;
+
 	return 0;
 }
 
-- 
2.40.1


