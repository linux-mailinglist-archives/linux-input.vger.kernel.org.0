Return-Path: <linux-input+bounces-8056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAD9C6F8F
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 13:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8184B25D1E
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 12:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C5F20651A;
	Wed, 13 Nov 2024 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZzBEo0Y"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736E205E05
	for <linux-input@vger.kernel.org>; Wed, 13 Nov 2024 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501769; cv=none; b=OmIhaEzkgi5xxMoPD8THMIXDZbPULM6ZWZXrFQd2KjuV3ElKeqQLp4xP6A+Otm8/4to0ZQcyqSqP44kzLqUNeTyFUPYO80Q2+2GC/4ZnG9sByanAyNu/KfnmpK6dYrtQbKpiEt8xSMpQks4W530dn03muS9YavgUuoqT/Ey6zb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501769; c=relaxed/simple;
	bh=aRW1yWnGapeZAVe/15kwhBfTtKfyb2GHv/JRGJfOWSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHmC7A05epiSa6r17h/uBnnBEc9xrGKAJq7ynQivVTMdEb1rWpreCH/QMI4lpa6GFdHg+OZGXbeYMCgojEfqqM9SQ5QJBrJg6hkNbR6E7Pslld7iyZiVAauU6xF0FOvZtRjMi8l4Nppsx+m4RRMcY8xl1UsUF9eA1iXF1ZwcD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZzBEo0Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=op+AvZ1YCKZsOQFtb06qEXzMr+HQn8e2wB0EdtWp+RY=;
	b=FZzBEo0Y36lHPreVhGIEUG0zLd9nMskUaGWlNDdrqrm89vU1bFesIAkNIqOL0mwkcwrvkG
	VXQdQIDTkESK10wUulxLGMPFo+3SJ38IGGkFEYpJqDbPYDoyX1DLxserQpkfYu4//bTgUF
	isnbHYTkrW8aPZCGbZEszaleUEV/lHI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-Fa4GRkr4NI2JgXGu8aC8tQ-1; Wed, 13 Nov 2024 07:42:45 -0500
X-MC-Unique: Fa4GRkr4NI2JgXGu8aC8tQ-1
X-Mimecast-MFC-AGG-ID: Fa4GRkr4NI2JgXGu8aC8tQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d531a19a9so3827785f8f.1
        for <linux-input@vger.kernel.org>; Wed, 13 Nov 2024 04:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501764; x=1732106564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op+AvZ1YCKZsOQFtb06qEXzMr+HQn8e2wB0EdtWp+RY=;
        b=jKSnO3LBNqASHsbFaumFcmYzZCARPiDgb4dKLRxtT43MsmMYOo1fDWjA3in6Iwq03g
         O5NVzHBRNcln2faqznGAcDopWgZTRGjpcGnhaCeC3AVicw/DymQmvNpHYY23z1AzCVfN
         QYHqoxdN5DkWG5cyYYpDOb6nrMiOsQPOmeHCSV58RCzdJeLC3Bno+Lenp9X8nVNvm7Hh
         +ibWcmJb8DenctVLl9DL8XVETYuzbX0BrGfdwFmZI5Ywy3bFSnGtm0szkqtXjUweIulP
         Guq4Dyj+OTnBmdKSqQlCR6HnFDmrOhJQlvm4Az5zgh/it2xzWEBhDqz968BEkBBnfj66
         VrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL8ugaP1M0meJCveWqHJ9NRD/Of5YYMIQkT/QD/Wmo2Qdvv+YKXt96AtazajDj5A7tD4LdFV/ShyeuUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJki4DnPHQ/DIdxUVEN1tftTVKJlvxtEEp0ieG5IU3R31DoAL8
	VUV8UtlgGjW/FKrDsVakS/1QxPg7As5qCPGzoJlFE9ZEFC/wFNDOWZ5528HxJw1qPEKH65vuWFP
	Jqqr3FGkyA8sBGdML4R9gbbbLutZzUeQmEVjbYclhptKju25C1KvWy9pJcU4G
X-Received: by 2002:a05:6000:704:b0:382:d0a:fe4e with SMTP id ffacd0b85a97d-3820df7add5mr2320636f8f.40.1731501763945;
        Wed, 13 Nov 2024 04:42:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvKoYvBUp37kzzcOw/kNuKZIW7fG0pUujGd0dqmiteiiQa85bm4vAcxVjs1ubCq0XbXcf6/A==
X-Received: by 2002:a05:6000:704:b0:382:d0a:fe4e with SMTP id ffacd0b85a97d-3820df7add5mr2320584f8f.40.1731501763480;
        Wed, 13 Nov 2024 04:42:43 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:42:43 -0800 (PST)
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
Subject: [PATCH v2 06/11] vfio/pci: Use never-managed version of pci_intx()
Date: Wed, 13 Nov 2024 13:41:54 +0100
Message-ID: <20241113124158.22863-8-pstanner@redhat.com>
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

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

vfio enables its PCI-Device with pci_enable_device(). Thus, it
needs the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vfio/pci/vfio_pci_core.c  |  2 +-
 drivers/vfio/pci/vfio_pci_intrs.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1ab58da9f38a..90240c8d51aa 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -498,7 +498,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
 		if (vfio_pci_nointx(pdev)) {
 			pci_info(pdev, "Masking broken INTx support\n");
 			vdev->nointx = true;
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		} else
 			vdev->pci_2_3 = pci_intx_mask_supported(pdev);
 	}
diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 8382c5834335..40abb0b937a2 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -118,7 +118,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		goto out_unlock;
 	}
 
@@ -132,7 +132,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 		 * mask, not just when something is pending.
 		 */
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		else
 			disable_irq_nosync(pdev->irq);
 
@@ -178,7 +178,7 @@ static int vfio_pci_intx_unmask_handler(void *opaque, void *data)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 1);
+			pci_intx_unmanaged(pdev, 1);
 		goto out_unlock;
 	}
 
@@ -296,7 +296,7 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 	 */
 	ctx->masked = vdev->virq_disabled;
 	if (vdev->pci_2_3) {
-		pci_intx(pdev, !ctx->masked);
+		pci_intx_unmanaged(pdev, !ctx->masked);
 		irqflags = IRQF_SHARED;
 	} else {
 		irqflags = ctx->masked ? IRQF_NO_AUTOEN : 0;
@@ -569,7 +569,7 @@ static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
 	 * via their shutdown paths.  Restore for NoINTx devices.
 	 */
 	if (vdev->nointx)
-		pci_intx(pdev, 0);
+		pci_intx_unmanaged(pdev, 0);
 
 	vdev->irq_type = VFIO_PCI_NUM_IRQS;
 }
-- 
2.47.0


