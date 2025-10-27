Return-Path: <linux-input+bounces-15736-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08BC0D683
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 13:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9333A4E25
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 12:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37F71DFCE;
	Mon, 27 Oct 2025 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8bj5KSQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1359FEEAB
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566492; cv=none; b=SkE0V5s8MgXaJ3tcCQJiMxrzSVy2GSh3V2zwZ+y6zGCEMw7szd2jnFrDWyLok+YTSF31BwQcZqdtJQlo6RGwVUjoX2+oVDuxN2cnprVBxpuHpdoeaxOjim3xKEw7tDLmIu3sZo6uVSxPqB8Hbmuj60KvPyjPzjmp6RrbWXSwFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566492; c=relaxed/simple;
	bh=wK8ysbk1fE1bPUTLt5ClaVGp9U4zGv9eumWTPfwfQio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MA7F4k3VqGpCgW1hWckfe2LcJSZsboiKUHgoBIPyj/4fWLgV73cWP7CZQbXkL3jEmYVx1C56hrML5OwBwNWfStpFv4TEJFy8Y7YuQx/jV/qms/Uxvn/jrNmGVfwyi9JhoIUMcOB4NknE9J65FOp7Nm2e6AM/MDcC2e6hE1Is2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8bj5KSQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761566491; x=1793102491;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wK8ysbk1fE1bPUTLt5ClaVGp9U4zGv9eumWTPfwfQio=;
  b=A8bj5KSQCs0pbisvUqvEOEpeoNHuLUCU9PLHH2IskZjAT2l3SWA+VfJ1
   lMp8PEjWNkFpa9/lj3evT2gF7DYNoemIZdwxx4Yu+XUe8f9TLDxGbCIay
   A5GYhJ/uJn0pXq+qDdXgo+WfttQq72ipfaA4NgPHHt2agByOkBm6a03QP
   oPtzbAY9mYvYq3fr4H3QgDCPoaJQusudJRENhZBgS8ECkExMoIKvfDkc3
   kFTp8SMs1pC9eIiaaRQlMOInIdLReAw9khkNjBGz1qsBcByZfCEv4onMa
   Jci86g8wc/nU0AD77pZBlsg/S64ekXhffiSGNuy/HhOL5gl44Cg43Qp2l
   g==;
X-CSE-ConnectionGUID: AVtiLTGPQtGa0S50VZFQfQ==
X-CSE-MsgGUID: YpxEbKkcQDqksyxw5l+b1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73930110"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="73930110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 05:01:30 -0700
X-CSE-ConnectionGUID: AcPIsoFDSP63HQuJMhk6sQ==
X-CSE-MsgGUID: ZMZVliSxQEuBY4K/jfBlHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189065045"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 05:01:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A2B1A121E63;
	Mon, 27 Oct 2025 14:01:25 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLud-00000001dkf-2F6F;
	Mon, 27 Oct 2025 14:01:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-input@vger.kernel.org
Cc: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Philipp Stanner <phasta@kernel.org>,
	Wentao Guan <guanwentao@uniontech.com>,
	Abhishek Tamboli <abhishektamboli9@gmail.com>
Subject: [PATCH 1/1] HID: intel-thc-hid: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 14:01:23 +0200
Message-ID: <20251027120123.391125-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 --
 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c | 1 -
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 2 --
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c | 1 -
 4 files changed, 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 0156ab391778..cfda66ee4895 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -344,7 +344,6 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 		if (try_recover(qcdev))
 			qcdev->state = QUICKI2C_DISABLED;
 
-	pm_runtime_mark_last_busy(qcdev->dev);
 	pm_runtime_put_autosuspend(qcdev->dev);
 
 	return IRQ_HANDLED;
@@ -735,7 +734,6 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Enable runtime power management */
 	pm_runtime_use_autosuspend(qcdev->dev);
 	pm_runtime_set_autosuspend_delay(qcdev->dev, DEFAULT_AUTO_SUSPEND_DELAY_MS);
-	pm_runtime_mark_last_busy(qcdev->dev);
 	pm_runtime_put_noidle(qcdev->dev);
 	pm_runtime_put_autosuspend(qcdev->dev);
 
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
index 5c3ec95bb3fd..834a537b6780 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
@@ -72,7 +72,6 @@ static int quicki2c_hid_raw_request(struct hid_device *hid,
 		break;
 	}
 
-	pm_runtime_mark_last_busy(qcdev->dev);
 	pm_runtime_put_autosuspend(qcdev->dev);
 
 	return ret;
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 14cabd5dc6dd..ad6bd59963b2 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -339,7 +339,6 @@ static irqreturn_t quickspi_irq_thread_handler(int irq, void *dev_id)
 		if (try_recover(qsdev))
 			qsdev->state = QUICKSPI_DISABLED;
 
-	pm_runtime_mark_last_busy(qsdev->dev);
 	pm_runtime_put_autosuspend(qsdev->dev);
 
 	return IRQ_HANDLED;
@@ -674,7 +673,6 @@ static int quickspi_probe(struct pci_dev *pdev,
 	/* Enable runtime power management */
 	pm_runtime_use_autosuspend(qsdev->dev);
 	pm_runtime_set_autosuspend_delay(qsdev->dev, DEFAULT_AUTO_SUSPEND_DELAY_MS);
-	pm_runtime_mark_last_busy(qsdev->dev);
 	pm_runtime_put_noidle(qsdev->dev);
 	pm_runtime_put_autosuspend(qsdev->dev);
 
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
index ad52e402c28a..82c72bfa2795 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
@@ -71,7 +71,6 @@ static int quickspi_hid_raw_request(struct hid_device *hid,
 		break;
 	}
 
-	pm_runtime_mark_last_busy(qsdev->dev);
 	pm_runtime_put_autosuspend(qsdev->dev);
 
 	return ret;
-- 
2.47.3


