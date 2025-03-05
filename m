Return-Path: <linux-input+bounces-10548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C479EA4F56E
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 04:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3FA516F7E6
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 03:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0BB188722;
	Wed,  5 Mar 2025 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSajs5dv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E172E3398;
	Wed,  5 Mar 2025 03:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741145660; cv=none; b=G9YlVrrS2lkjOmSFHSTtZTKvjZwgzhC13fAi1X0D23tmoFhmK0/h5QjXdnYBZ6QRTPHUIVCP0iHqR8pkaYUgndXEDqC7kB3YfKGRewK5hsfPYg+VqrcobxVyGZNqNTUDYpLNdEuXx2cK0MWjHcztkRrkAQm+rhKDfnfmOVNuX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741145660; c=relaxed/simple;
	bh=5SZnYqKtintM6MElQl5EBSZk67lFq4gMneY8nZvCMv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m7eNmCpNcb9+oLttW4kWtOM056GprEaGwvHei20BkkX+a14OmKp/arKOPoftoq/bT3oAvZKXjKJfFXA1tcoODPSJPe9oFenNZCdrmUNE0VmqZQOK5N8xVcMomDc8A5T79c/R2hVduzHhKbR+CAHWR2wqGZyU6hepHtasS1B9gvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSajs5dv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741145659; x=1772681659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5SZnYqKtintM6MElQl5EBSZk67lFq4gMneY8nZvCMv4=;
  b=CSajs5dvYj6P4+YQfpMKa+0ytsSAwFNEj5AWBRIfuvc2LiYPaJ00aE8s
   Z1soPFx0l+I7GQrMAe4dd1zzDi1m5ECvGyu9WY0H1Jh/zNvqHQWmgN8Xa
   xiZ9CSdtSz3j0qoYBv0oXFV9EyJjDWZz5hOUtIeh2kEQucjknBzhfq8sM
   kUM5yWKP5dTqnLZaoFSlKVnzwyhUDxE7rGl3jk5a4e9wq8J/bkDd0IqYg
   E0BUm8epVKmHdL6K2bJ5diTl5My6vQ9kPuMddC13n+V12YRPIH+RPo8d+
   xoNKtBwclqYF/Tgcb/cPv9/7XwyzYmGh3UiOxRc73k5vkR4EgT4S6IxlT
   Q==;
X-CSE-ConnectionGUID: HPtqvoI+TWaXg2cZoVRuXg==
X-CSE-MsgGUID: SLxA9uLIS92/23i8GpcS0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45864374"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="45864374"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 19:34:17 -0800
X-CSE-ConnectionGUID: HlFpmsfDSeG07EW4IBuqew==
X-CSE-MsgGUID: TQeBKdYwQQSJqQYe6oZ1NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="118284014"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 19:34:15 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v2 1/2] HID: Intel-thc-hid: Intel-quickspi: Correct device state names gramatically
Date: Wed,  5 Mar 2025 11:33:30 +0800
Message-Id: <20250305033331.2544941-2-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250305033331.2544941-1-even.xu@intel.com>
References: <20250305033331.2544941-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct quickspi device state name and change the list order to follow
device state working flow.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c      | 2 +-
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h      | 4 ++--
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 4641e818dfa4..59d0b71e6e4f 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -426,7 +426,7 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 
 	thc_interrupt_enable(qsdev->thc_hw, true);
 
-	qsdev->state = QUICKSPI_INITED;
+	qsdev->state = QUICKSPI_INITIATED;
 
 	return qsdev;
 }
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index 75179bb26767..6fdf674b21c5 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -57,9 +57,9 @@
 
 enum quickspi_dev_state {
 	QUICKSPI_NONE,
+	QUICKSPI_INITIATED,
 	QUICKSPI_RESETING,
-	QUICKSPI_RESETED,
-	QUICKSPI_INITED,
+	QUICKSPI_RESET,
 	QUICKSPI_ENABLED,
 	QUICKSPI_DISABLED,
 };
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
index 7373238ceb18..935a6684926c 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
@@ -333,7 +333,7 @@ int reset_tic(struct quickspi_device *qsdev)
 		return -EINVAL;
 	}
 
-	qsdev->state = QUICKSPI_RESETED;
+	qsdev->state = QUICKSPI_RESET;
 
 	ret = quickspi_get_device_descriptor(qsdev);
 	if (ret)
-- 
2.40.1


