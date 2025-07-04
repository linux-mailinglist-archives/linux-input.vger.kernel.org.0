Return-Path: <linux-input+bounces-13377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C96AF8B7E
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 10:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DAB0189F91A
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 08:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59A72D660D;
	Fri,  4 Jul 2025 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCV/J84Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC42D4B6F;
	Fri,  4 Jul 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615667; cv=none; b=XbO2jWiS/wGzCxT70GHiY6+oo59GswBW/FTAyjRIW+eFFvB8Q31Ux/8bgGoks07sY0I6xoHqs4yZT+mjGUZe8YrRb//50q/40dTROHrutuFBVsP/GxGZabjsGQnAonlvnPFZCkxkyPzSwF8Tjuyv455prj5A9a/MSuECHPN4B/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615667; c=relaxed/simple;
	bh=2WLiRATfI8wJEoYB6D4uEr4LXTXjQ0McJ6+WbU8bC9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uq3nzM+xDJOrT75G0x5c89PA+fXnjs9/qfAbUrXXgYIBg/M+4wNU/Cb/UhkQFtofBYhy3HKGXKqxpCAzlfcLoE1zayRR7EhOy4VvrZLWMztM2B8WTSRiTzClbLr4Ch69/8wWnGUYot/nq2SCDkJYpBzc1NlcvaHaaJqsuHEsHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCV/J84Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615665; x=1783151665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2WLiRATfI8wJEoYB6D4uEr4LXTXjQ0McJ6+WbU8bC9E=;
  b=TCV/J84Z4uLR/lrh1pazSewrZ+BhzmY1i68jYyh88IudOXvQzpdMSLjM
   xL/C4K4nfKR0jP7JQu73TxSFdFpEfrcgxzvgGwunQfoUGDpaZC01hzMI0
   M2Unl0v0wqMBOaqsLv8arWiiDtA0bfuMfuJ5BSKDF2bu6lGyQI/I4Ooe6
   rQRFUclUa4oxlbkVofYv0/UzSxM1d0Og0DJZUoslu3oCvAyppsLASsxL3
   60j7Ke9zJA9fTzLAE35zynaYiqJmbRL3OD6rYU5GMLiG5QTl3k/ZRcI8W
   ++aipTF5GMBgUobVlENfluIepf0jxpZj3Burfrz5JJrdO/r0zgEiAw5DT
   g==;
X-CSE-ConnectionGUID: OvyPaj4rQn+kkwN/IHfQ5A==
X-CSE-MsgGUID: aX6jAeOCQF2EvEMvvv8VEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494607"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494607"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:23 -0700
X-CSE-ConnectionGUID: rWIsyR0XT9WSWSB/utMKWA==
X-CSE-MsgGUID: Rz/jGlQuRYKzIxLB5RvwdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924266"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:20 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 5208844433;
	Fri,  4 Jul 2025 10:54:18 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Philipp Stanner <phasta@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 26/80] HID: intel-thc-hid: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:18 +0300
Message-Id: <20250704075418.3218839-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
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
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 --
 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c | 1 -
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 2 --
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c | 1 -
 4 files changed, 6 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index e944a6ccb776..599f12d3e657 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -328,7 +328,6 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 		if (try_recover(qcdev))
 			qcdev->state = QUICKI2C_DISABLED;
 
-	pm_runtime_mark_last_busy(qcdev->dev);
 	pm_runtime_put_autosuspend(qcdev->dev);
 
 	return IRQ_HANDLED;
@@ -711,7 +710,6 @@ static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
index 5e5f179dd113..2b518d88645a 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -335,7 +335,6 @@ static irqreturn_t quickspi_irq_thread_handler(int irq, void *dev_id)
 		if (try_recover(qsdev))
 			qsdev->state = QUICKSPI_DISABLED;
 
-	pm_runtime_mark_last_busy(qsdev->dev);
 	pm_runtime_put_autosuspend(qsdev->dev);
 
 	return IRQ_HANDLED;
@@ -670,7 +669,6 @@ static int quickspi_probe(struct pci_dev *pdev,
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
2.39.5


