Return-Path: <linux-input+bounces-8051-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B839C6F45
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 13:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D82B01F22B41
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5952201013;
	Wed, 13 Nov 2024 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XL+m+3ib"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273E1FF7C6
	for <linux-input@vger.kernel.org>; Wed, 13 Nov 2024 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501758; cv=none; b=oxLpt1LHLcE/wH3AIvr8CjQPvxOU+jejeLNmI7RTy1e8OY/+d/aHd9ondfD5BwrWMwEi/F6g0KKTJPBL5lutv3aU8M3K8ZAWJt8ACeXpET64ud/jOYmebNdPqJmxzQCwIfT/6Ycon4GAzwfaeNdxMkJRlvk7lPLPl6hh1+/1dyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501758; c=relaxed/simple;
	bh=bgMBIrqJQ9t8T1fEYfqtJT8lwKygdOf5COXhN7ImFl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YM57ph8dR419wOWbrodYa6BQ6eGFAtW7aj64frI8vp+tdJa1kslR/0FyqWuca9TtJGphEuHPpKw3HIdZxlbDMllKycORGatMNwLpZYKZKQpJZ8dXBW5mudIzIdalMOkbf4Gd7R/EblNsRLqQxleYDixLxamIPkypOTPBjr3VgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XL+m+3ib; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40yBQL1XcEoYGtru1ianOSHWnjsf7gEjQJGHFwcCtv4=;
	b=XL+m+3ibNuYo5FUr+cUZKKak7uafOUgPanYIv+ypG51R1NA0nI5zC6hEjRqQBEmsDfjuzV
	xYVztn2y803+TFoSGWsqgKxFRx3xoagP0U7pdWqlRv1M82cZpcMyxRsLJ/ukKx+NRP9Nhj
	GJh0ABHv/YdlbgllmCHwtEuQQToRme4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-Q5BxRhEwPEaNZ_XjR_Rh4A-1; Wed, 13 Nov 2024 07:42:34 -0500
X-MC-Unique: Q5BxRhEwPEaNZ_XjR_Rh4A-1
X-Mimecast-MFC-AGG-ID: Q5BxRhEwPEaNZ_XjR_Rh4A
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d462b64e3so3574146f8f.3
        for <linux-input@vger.kernel.org>; Wed, 13 Nov 2024 04:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501753; x=1732106553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40yBQL1XcEoYGtru1ianOSHWnjsf7gEjQJGHFwcCtv4=;
        b=FClAdD+nioPWZQcP6PUic31sdBwnVNfc4mNOcuDTzZi/itKAs6FbmrxItqBRZ/lBRb
         HtoEjh/7MzMsiLbxDTvi0nL3VTt7b7AbRRnBngKfIbMUMZt/lcNIUys4X/VyFD2cgDfa
         odIbWKvbB3gYRjCcbUdw1y11aXd/Y1ZSgwbrU75b2zMEeW7xgUWqaWLZ6xxQ6SUvoTYT
         1Ww7ZeYaGsnVTRfDVQWc3YGGHg7XO6HgLhWRlGlX+HlYq70EceM6mIKBcakt/ibslIcp
         /naba4CPabAqnaL2U+WjUr9AYYj2Rh8Xg7GICcHEK9YrK7UkrykN+8S80gNrkgG2Wl1K
         b9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWsFAAu1lKiMJlMhAyvGJHmCQXZKpyxWLnB1SkH5btDBs3Gwu8BDpWaGJb16uhQsnP5jsSLKby2GAaoqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbbKLrQ2jcMF+X0PSaQAK6akuJvlf64uhrwahBfZ/PuPTc3oDK
	+OiZ6qOcd2CUxNidn+l6LYE5/MS/2ThD23sUCjgjVxdG4lLY3DthE2RhNHJt0V09KH0yN1y3sK1
	KMD3TMHwlQtxTFAetv08nKyXtDriKbSOvf7o1fgqJ0etr0ETT9ucXaC0Sp1Mj
X-Received: by 2002:a05:6000:1566:b0:37d:501f:483f with SMTP id ffacd0b85a97d-381f187fa4fmr18333256f8f.44.1731501752914;
        Wed, 13 Nov 2024 04:42:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG88cAt9vbjd+Fv+tUe500AG/cZtHBmig9dl5++H5KHNhJiR6Bbh9nCCmpa1PrZQ9oi5jDTmQ==
X-Received: by 2002:a05:6000:1566:b0:37d:501f:483f with SMTP id ffacd0b85a97d-381f187fa4fmr18333208f8f.44.1731501752404;
        Wed, 13 Nov 2024 04:42:32 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:42:32 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Ankit Agrawal <ankita@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 01/11] PCI: Prepare removing devres from pci_intx()
Date: Wed, 13 Nov 2024 13:41:49 +0100
Message-ID: <20241113124158.22863-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113124158.22863-2-pstanner@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_intx() is a hybrid function which sometimes performs devres
operations, depending on whether pcim_enable_device() has been used to
enable the pci_dev. This sometimes-managed nature of the function is
problematic. Notably, it causes the function to allocate under some
circumstances which makes it unusable from interrupt context.

To, ultimately, remove the hybrid nature from pci_intx(), it is first
necessary to provide an always-managed and a never-managed version
of that function. Then, all callers of pci_intx() can be ported to the
version they need, depending whether they use pci_enable_device() or
pcim_enable_device().

An always-managed function exists, namely pcim_intx(), for which
__pcim_intx(), a never-managed version of pci_intx() has been
implemented.

Make __pcim_intx() a public function under the name
pci_intx_unmanaged(). Make pcim_intx() a public function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/pci/devres.c | 24 +++---------------------
 drivers/pci/pci.c    | 29 +++++++++++++++++++++++++++++
 include/linux/pci.h  |  2 ++
 3 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index b133967faef8..d32827a1f2f4 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -411,31 +411,12 @@ static inline bool mask_contains_bar(int mask, int bar)
 	return mask & BIT(bar);
 }
 
-/*
- * This is a copy of pci_intx() used to bypass the problem of recursive
- * function calls due to the hybrid nature of pci_intx().
- */
-static void __pcim_intx(struct pci_dev *pdev, int enable)
-{
-	u16 pci_command, new;
-
-	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
-
-	if (enable)
-		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
-	else
-		new = pci_command | PCI_COMMAND_INTX_DISABLE;
-
-	if (new != pci_command)
-		pci_write_config_word(pdev, PCI_COMMAND, new);
-}
-
 static void pcim_intx_restore(struct device *dev, void *data)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pcim_intx_devres *res = data;
 
-	__pcim_intx(pdev, res->orig_intx);
+	pci_intx_unmanaged(pdev, res->orig_intx);
 }
 
 static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
@@ -472,10 +453,11 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 		return -ENOMEM;
 
 	res->orig_intx = !enable;
-	__pcim_intx(pdev, enable);
+	pci_intx_unmanaged(pdev, enable);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pcim_intx);
 
 static void pcim_disable_device(void *pdev_raw)
 {
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 225a6cd2e9ca..c945811b207a 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4480,6 +4480,35 @@ void pci_disable_parity(struct pci_dev *dev)
 	}
 }
 
+/**
+ * pci_intx_unmanaged - enables/disables PCI INTx for device dev,
+ * unmanaged version
+ * @pdev: the PCI device to operate on
+ * @enable: boolean: whether to enable or disable PCI INTx
+ *
+ * Enables/disables PCI INTx for device @pdev
+ *
+ * This function behavios identically to pci_intx(), but is never managed with
+ * devres.
+ */
+void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
+{
+	u16 pci_command, new;
+
+	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
+
+	if (enable)
+		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
+	else
+		new = pci_command | PCI_COMMAND_INTX_DISABLE;
+
+	if (new == pci_command)
+		return;
+
+	pci_write_config_word(pdev, PCI_COMMAND, new);
+}
+EXPORT_SYMBOL_GPL(pci_intx_unmanaged);
+
 /**
  * pci_intx - enables/disables PCI INTx for device dev
  * @pdev: the PCI device to operate on
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 573b4c4c2be6..6b8cde76d564 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1353,6 +1353,7 @@ int __must_check pcim_set_mwi(struct pci_dev *dev);
 int pci_try_set_mwi(struct pci_dev *dev);
 void pci_clear_mwi(struct pci_dev *dev);
 void pci_disable_parity(struct pci_dev *dev);
+void pci_intx_unmanaged(struct pci_dev *pdev, int enable);
 void pci_intx(struct pci_dev *dev, int enable);
 bool pci_check_and_mask_intx(struct pci_dev *dev);
 bool pci_check_and_unmask_intx(struct pci_dev *dev);
@@ -2293,6 +2294,7 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
 				    struct pci_dev *dev) { }
 #endif
 
+int pcim_intx(struct pci_dev *pdev, int enabled);
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
 				const char *name);
-- 
2.47.0


