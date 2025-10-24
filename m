Return-Path: <linux-input+bounces-15697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0755C063D3
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 14:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69BA13BB24E
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 12:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260DF316199;
	Fri, 24 Oct 2025 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmNgcWm6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAE316198;
	Fri, 24 Oct 2025 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308720; cv=none; b=pA17dSWbihhfxzrfLnD7ZEwmlpiHA9VUCTnOoVgncLaiOVdXNIuK4cLhGCP0dkjcnvoeZnzuns97myKxC/nD05zlWeqbqlgJUX0jwAu1nMlQLItHQdpxdkN3IoKHIVeWcdIJrTeGu38nK9zYlp1pbAZvR0CO52r3y5xnhNwNRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308720; c=relaxed/simple;
	bh=/ripWD4i939v52NyZPdaI3icbaNF8u6CynY8m1Lh/aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfZI4tPtYpjB/s7j5WKOwB4hmLrXJ2Fk9KpV2+LI6kAFmb9yBvfUiTDUZtnhXgFL7wRMbD46XQsAUPlaKFyjdkInLLBNO1Fuk0k6tcoPR3YovfV/TFOjbTRAGgH4q52sbDbi7QDNWlEj58IPks6ZHso6MESfxIg39f/0IZ4Us/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmNgcWm6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761308717; x=1792844717;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/ripWD4i939v52NyZPdaI3icbaNF8u6CynY8m1Lh/aA=;
  b=MmNgcWm6NENeWi7K1bxKm8AFYpCtYmSOwC6bOoiN5y3yzHbfBq2cAo6Z
   r3JpLcYNbGt4rpTq+L0xh/l7+TuOw3vL+y97vKG+IRv5NrtyEht7G1QRz
   OIgbNcIc4V/miYsEn4TMp8nJz5GBupU1swJM1TiATAddq3iLeF1X0umOH
   WTZbhHkE1SOiGErBENviYcbSxnYNjumOrTM0Zq7UUKL1i5kqkeEXsJwR8
   LAiHMplrTQa+I/XkGzZVy9cFkzkwFn1rylxg6vMqv4o3+BkrRtoKPVN73
   JWugqrGNRqa45ySmm3pWpSCN9IRyNmCXefBHryr6QSvswgIpH4c6/wI3n
   g==;
X-CSE-ConnectionGUID: LoH7FnWeTD+E00/gs0hPhQ==
X-CSE-MsgGUID: cJg+t4nySxa1X8di1N0hXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63381354"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63381354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 05:25:16 -0700
X-CSE-ConnectionGUID: 5xwqTLR3RBKrBpUmLFUZow==
X-CSE-MsgGUID: ClHm7EI9TuWFLY+sPyGa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="188482847"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2025 05:25:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6B9B695; Fri, 24 Oct 2025 14:25:12 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhang Lixu <lixu.zhang@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] HID: intel-ish-hid: Fix a build error in devm_ishtp_alloc_workqueue()
Date: Fri, 24 Oct 2025 14:25:11 +0200
Message-ID: <20251024122511.1422492-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang 19 is not happy about the cast and in conjunction with CONFIG_WERROR=y
(which is default) leads to a build error:

drivers/hid/intel-ish-hid/ipc/ipc.c:935:36: error: cast from 'void (*)(struct workqueue_struct *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  935 |         if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by providing an intermediate callback that has a correct type.

Fixes: 0d30dae38fe0 ("HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 59355e4a61f8..7bf4356d8ee6 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -5,10 +5,11 @@
  * Copyright (c) 2014-2016, Intel Corporation.
  */
 
+#include <linux/delay.h>
 #include <linux/devm-helpers.h>
+#include <linux/err.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
-#include <linux/delay.h>
 #include <linux/jiffies.h>
 #include "client.h"
 #include "hw-ish.h"
@@ -924,17 +925,23 @@ static const struct ishtp_hw_ops ish_hw_ops = {
 	.dma_no_cache_snooping = _dma_no_cache_snooping
 };
 
+static inline void devm_ishtp_destroy_workqueue(void *wq)
+{
+	destroy_workqueue(wq);
+}
+
 static struct workqueue_struct *devm_ishtp_alloc_workqueue(struct device *dev)
 {
 	struct workqueue_struct *wq;
+	int ret;
 
 	wq = alloc_workqueue("ishtp_unbound_%d", WQ_UNBOUND, 0, dev->id);
 	if (!wq)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
-	if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
-				     wq))
-		return NULL;
+	ret = devm_add_action_or_reset(dev, devm_ishtp_destroy_workqueue, wq);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return wq;
 }
@@ -950,6 +957,7 @@ static struct workqueue_struct *devm_ishtp_alloc_workqueue(struct device *dev)
 struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 {
 	struct ishtp_device *dev;
+	struct workqueue_struct *wq;
 	int	i;
 	int	ret;
 
@@ -959,9 +967,10 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 	if (!dev)
 		return NULL;
 
-	dev->unbound_wq = devm_ishtp_alloc_workqueue(&pdev->dev);
-	if (!dev->unbound_wq)
+	wq = devm_ishtp_alloc_workqueue(&pdev->dev);
+	if (IS_ERR(wq))
 		return NULL;
+	dev->unbound_wq = wq;
 
 	dev->devc = &pdev->dev;
 	ishtp_device_init(dev);
-- 
2.50.1


