Return-Path: <linux-input+bounces-15356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA2BCBBD4
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 07:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E6D189AAC2
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 05:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DDF1DD543;
	Fri, 10 Oct 2025 05:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpEFPDim"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9553F635
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 05:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760075403; cv=none; b=O4cjDxu3Yf/t24rjIBxIApmqmQm4PRGKSU1khfdPwE04eNYOYi3qAJytt9djWPrqpC4Hd0/M8tE8Le+2aC+48qzl15k7RUlwP9C09qtfLNHuC7Weuara4YsGP/tbhSoQqWtqZ+KjbJxc5zJ3AkQydGTT0AS5DXZVeRoPB5e69CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760075403; c=relaxed/simple;
	bh=DkUuSk+qGMvhs4Vt3gttPK5cFQEPc5oNmNN/O6Jfmbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dLbJbGiwFCW0Zw7ZLtGdRI2UuLn3lakrCdKlwCR6OAFTJhEcxC56KkTYHwVZx9zTafTPWwYVZXCfYQZv7gc6qElY8LzvXa/+lxXwclQVcIhBW5zq+Jw2xijkUp2dniql5ulXIJ0TLZx5PNfN4Q0RPseSIM4zPJPLIfk4Sa3enPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpEFPDim; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760075401; x=1791611401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DkUuSk+qGMvhs4Vt3gttPK5cFQEPc5oNmNN/O6Jfmbs=;
  b=XpEFPDimiHtLYQDbqD5NuMuTohbnl6pTB1yEpf3rf0V1aVSpMk2b5V0a
   /gwUSoKTJ6dQzM+sM7wMWf5sbwbEBB46idIBpkiuAcbwJxWBT5/3FyD+5
   +1OWOcJFUJqJ6onkhAOhTOmAKD7YH4LSRFqxtJ2/nCWzBO+Hqu5dUv3DH
   ceYXwqnRjh5aewtqwbq3KxfnGl0+2W3IVhSxHp0FdDdVsm71cqf3+Ud2T
   k0cDtWOOupaiu1aqfBVqWmnzpy7clrsyX1mw20ab4KY+fLnmeHPTapUQw
   EA5kAfkkMXM57oa7au71JJ1ayfY8C8J5vdAisW0QsXuNpg0CNfJmnsc6F
   A==;
X-CSE-ConnectionGUID: O4d0Lx67T2W/aCqD+7yxug==
X-CSE-MsgGUID: cBp6Og5wSRSFb25KSofCsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66148908"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="66148908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:50:01 -0700
X-CSE-ConnectionGUID: argZpvoqTKyCMBvQYrWlJQ==
X-CSE-MsgGUID: pP8hDIyJRsKTfb8hWj1hfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="181320999"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa008.fm.intel.com with ESMTP; 09 Oct 2025 22:49:59 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	selina.wang@intel.com
Subject: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking
Date: Fri, 10 Oct 2025 13:52:54 +0800
Message-ID: <20251010055254.532925-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During suspend/resume tests with S2IDLE, some ISH functional failures were
observed because of delay in executing ISH resume handler. Here
schedule_work() is used from resume handler to do actual work.
schedule_work() uses system_wq, which is a per CPU work queue. Although
the queuing is not bound to a CPU, but it prefers local CPU of the caller,
unless prohibited.

Users of this work queue are not supposed to queue long running work.
But in practice, there are scenarios where long running work items are
queued on other unbound workqueues, occupying the CPU. As a result, the
ISH resume handler may not get a chance to execute in a timely manner.

In one scenario, one of the ish_resume_handler() executions was delayed
nearly 1 second because another work item on an unbound workqueue occupied
the same CPU. This delay causes ISH functionality failures.

A similar issue was previously observed where the ISH HID driver timed out
while getting the HID descriptor during S4 resume in the recovery kernel,
likely caused by the same workqueue contention problem.

Create dedicated unbound workqueues for all ISH operations to allow work
items to execute on any available CPU, eliminating CPU-specific bottlenecks
and improving resume reliability under varying system loads. Also ISH has
three different components, a bus driver which implements ISH protocols, a
PCI interface layer and HID interface. Use one dedicated work queue for all
of them.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c          | 21 +++++++++++++++++++-
 drivers/hid/intel-ish-hid/ipc/pci-ish.c      |  2 +-
 drivers/hid/intel-ish-hid/ishtp-hid-client.c |  4 ++--
 drivers/hid/intel-ish-hid/ishtp/bus.c        | 18 ++++++++++++++++-
 drivers/hid/intel-ish-hid/ishtp/hbm.c        |  4 ++--
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h  |  3 +++
 include/linux/intel-ish-client-if.h          |  2 ++
 7 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 3ddaa2cd39d5..9958f2968c4f 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -628,7 +628,7 @@ static void	recv_ipc(struct ishtp_device *dev, uint32_t doorbell_val)
 		if (!ishtp_dev) {
 			ishtp_dev = dev;
 		}
-		schedule_work(&fw_reset_work);
+		queue_work(dev->unbound_wq, &fw_reset_work);
 		break;
 
 	case MNG_RESET_NOTIFY_ACK:
@@ -933,6 +933,21 @@ static const struct ishtp_hw_ops ish_hw_ops = {
 	.dma_no_cache_snooping = _dma_no_cache_snooping
 };
 
+static struct workqueue_struct *devm_ishtp_alloc_workqueue(struct device *dev)
+{
+	struct workqueue_struct *wq;
+
+	wq = alloc_workqueue("ishtp_unbound_%d", WQ_UNBOUND, 0, dev->id);
+	if (!wq)
+		return NULL;
+
+	if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
+				     wq))
+		return NULL;
+
+	return wq;
+}
+
 /**
  * ish_dev_init() -Initialize ISH devoce
  * @pdev: PCI device
@@ -953,6 +968,10 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 	if (!dev)
 		return NULL;
 
+	dev->unbound_wq = devm_ishtp_alloc_workqueue(&pdev->dev);
+	if (!dev->unbound_wq)
+		return NULL;
+
 	dev->devc = &pdev->dev;
 	ishtp_device_init(dev);
 
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 9d150ce234f2..b748ac6fbfdc 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -384,7 +384,7 @@ static int __maybe_unused ish_resume(struct device *device)
 	ish_resume_device = device;
 	dev->resume_flag = 1;
 
-	schedule_work(&resume_work);
+	queue_work(dev->unbound_wq, &resume_work);
 
 	return 0;
 }
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index d8c3c54a8c0f..f61add862b6b 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -860,7 +860,7 @@ static int hid_ishtp_cl_reset(struct ishtp_cl_device *cl_device)
 	hid_ishtp_trace(client_data, "%s hid_ishtp_cl %p\n", __func__,
 			hid_ishtp_cl);
 
-	schedule_work(&client_data->work);
+	queue_work(ishtp_get_workqueue(cl_device), &client_data->work);
 
 	return 0;
 }
@@ -902,7 +902,7 @@ static int hid_ishtp_cl_resume(struct device *device)
 
 	hid_ishtp_trace(client_data, "%s hid_ishtp_cl %p\n", __func__,
 			hid_ishtp_cl);
-	schedule_work(&client_data->resume_work);
+	queue_work(ishtp_get_workqueue(cl_device), &client_data->resume_work);
 	return 0;
 }
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index 93a0432e7058..c6ce37244e49 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -541,7 +541,7 @@ void ishtp_cl_bus_rx_event(struct ishtp_cl_device *device)
 		return;
 
 	if (device->event_cb)
-		schedule_work(&device->event_work);
+		queue_work(device->ishtp_dev->unbound_wq, &device->event_work);
 }
 
 /**
@@ -876,6 +876,22 @@ struct device *ishtp_get_pci_device(struct ishtp_cl_device *device)
 }
 EXPORT_SYMBOL(ishtp_get_pci_device);
 
+/**
+ * ishtp_get_workqueue - Retrieve the workqueue associated with an ISHTP device
+ * @cl_device: Pointer to the ISHTP client device structure
+ *
+ * Returns the workqueue_struct pointer (unbound_wq) associated with the given
+ * ISHTP client device. This workqueue is typically used for scheduling work
+ * related to the device.
+ *
+ * Return: Pointer to struct workqueue_struct.
+ */
+struct workqueue_struct *ishtp_get_workqueue(struct ishtp_cl_device *cl_device)
+{
+	return cl_device->ishtp_dev->unbound_wq;
+}
+EXPORT_SYMBOL(ishtp_get_workqueue);
+
 /**
  * ishtp_trace_callback() - Return trace callback
  * @cl_device: ISH-TP client device instance
diff --git a/drivers/hid/intel-ish-hid/ishtp/hbm.c b/drivers/hid/intel-ish-hid/ishtp/hbm.c
index 8ee5467127d8..97c4fcd9e3c6 100644
--- a/drivers/hid/intel-ish-hid/ishtp/hbm.c
+++ b/drivers/hid/intel-ish-hid/ishtp/hbm.c
@@ -573,7 +573,7 @@ void ishtp_hbm_dispatch(struct ishtp_device *dev,
 
 		/* Start firmware loading process if it has loader capability */
 		if (version_res->host_version_supported & ISHTP_SUPPORT_CAP_LOADER)
-			schedule_work(&dev->work_fw_loader);
+			queue_work(dev->unbound_wq, &dev->work_fw_loader);
 
 		dev->version.major_version = HBM_MAJOR_VERSION;
 		dev->version.minor_version = HBM_MINOR_VERSION;
@@ -864,7 +864,7 @@ void	recv_hbm(struct ishtp_device *dev, struct ishtp_msg_hdr *ishtp_hdr)
 	dev->rd_msg_fifo_tail = (dev->rd_msg_fifo_tail + IPC_PAYLOAD_SIZE) %
 		(RD_INT_FIFO_SIZE * IPC_PAYLOAD_SIZE);
 	spin_unlock_irqrestore(&dev->rd_msg_spinlock, flags);
-	schedule_work(&dev->bh_hbm_work);
+	queue_work(dev->unbound_wq, &dev->bh_hbm_work);
 eoi:
 	return;
 }
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index 23db97ecf21c..4b0596eadf1c 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -175,6 +175,9 @@ struct ishtp_device {
 	struct hbm_version version;
 	int transfer_path; /* Choice of transfer path: IPC or DMA */
 
+	/* Alloc a dedicated unbound workqueue for ishtp device */
+	struct workqueue_struct *unbound_wq;
+
 	/* work structure for scheduling firmware loading tasks */
 	struct work_struct work_fw_loader;
 	/* waitq for waiting for command response from the firmware loader */
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index dfbf7d9d7bb5..b235fd84f478 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -87,6 +87,8 @@ bool ishtp_wait_resume(struct ishtp_device *dev);
 ishtp_print_log ishtp_trace_callback(struct ishtp_cl_device *cl_device);
 /* Get device pointer of PCI device for DMA acces */
 struct device *ishtp_get_pci_device(struct ishtp_cl_device *cl_device);
+/* Get the ISHTP workqueue */
+struct workqueue_struct *ishtp_get_workqueue(struct ishtp_cl_device *cl_device);
 
 struct ishtp_cl *ishtp_cl_allocate(struct ishtp_cl_device *cl_device);
 void ishtp_cl_free(struct ishtp_cl *cl);

base-commit: 0b2f041c47acb45db82b4e847af6e17eb66cd32d
-- 
2.43.0


