Return-Path: <linux-input+bounces-8462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F19E960A
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 14:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688FC280C07
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 13:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFEF238721;
	Mon,  9 Dec 2024 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BN8Ca6cj"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37D233D80
	for <linux-input@vger.kernel.org>; Mon,  9 Dec 2024 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749628; cv=none; b=GO1yyrjTdGCiR/6Cfnc0vivsfPXN9b7lO50E+Jm4EvG0io8aCRTgRQW1HTfo5YOdK5DWDa7oBaWMTQNarIiGrgoptZK+bRgzZcs9wtGMb6n6lKFxSUgdxyrtk65pq3tRf8cjkz9ZfAnVb8bPzrrD53HvAbCI+KH9F6qLNoXdvDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749628; c=relaxed/simple;
	bh=9Z1Cy2anDz0HAw/5Tw9Wb58QkDW/mnPO9GaPuFYE3VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTXpn9lFoqJlf7rx/GMeZX6gdQaOYZhTHi2wZI+tjnzKoYFfgiVGRqYS/oFaL7c7k3a6NsWjqEJnyytxvo1fpr85IF7Db4FhozaE9EZC4X03FkLqbJp214KvgvBaM0QKsz9KjmqGM6axq5HcQdWUlxAUtYvM/VMN1j0uH/sISq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BN8Ca6cj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oiILKR2a3QjvArtxAPrSG5MTRD3aI59eir0l7Eg71/Q=;
	b=BN8Ca6cj59vvXYYuhNe3ZKRRHZFODoFZicp6sHJevZdTUj1dosBljMlI8PFM+TVsZ6M7Oq
	S2XD0gdXl7i6le2eVMUqcS557SBG3WGlzN2QJvNw1S+HuWWOxmHBkeuNbMuR0BWFGIe8aA
	8wv1KhdLOSN9vwsmKuZKP4qzlyawzPU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-KYA1JlF5NbOJBJPXCU13jA-1; Mon, 09 Dec 2024 08:07:03 -0500
X-MC-Unique: KYA1JlF5NbOJBJPXCU13jA-1
X-Mimecast-MFC-AGG-ID: KYA1JlF5NbOJBJPXCU13jA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d51ba2f5so1674244f8f.2
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2024 05:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749622; x=1734354422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiILKR2a3QjvArtxAPrSG5MTRD3aI59eir0l7Eg71/Q=;
        b=CC7hc8NiznTcPimKVe/DxzJ0JDn8D1jEOexvesAgVL+4e8XfRyZWN5w7D1dZPlJPkI
         BHtN6p43bigOexmu5TjMQfWNjKMB/gEItn9ybMQ2UhRPT5wTCmswFJwYp0nJYm1YfsTA
         rsiZWu0o2FmCVoK2OX8yhVCYbFdAh9BWUTRVf3agSbidHLo3JxdO+QgLxTk4mFEtJgE+
         tGOn6wJKXDcm1uijrkat852TLTTAfKoMlVNY5yXiiHrxm6217zjJCLZl0pUcmEqZjGI7
         nn9SJ4O3lL2NioB1lXH2u0IzeA7WMvzWNAdojnsKHl23U/A7aF5xdiYu4ve+oLWg/oFu
         yR0g==
X-Forwarded-Encrypted: i=1; AJvYcCUed0+7DYOY2n0k84HlxOg3CM6UMWsN5qFHpO3gJFQb1xJV3lHv3+nZ2KJEsx7qxmWfgVAwyZISE55LkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdncfcCkpFMEXum4JWmcoLA+641P8axmn9R4hD/NKH1LPBS7A7
	/jQO3QDqAwwnr+AciaLX/Gk7ooG2kEqFDCFxyZjmIVPD72DBpt8lXc6yDNQ2K4dJoE67QxsACZn
	c+tMbGp9hS8jx+jPcWVHuODEcplKB6YKtxPImzTnBGqX8ymXmMK08NIO4dHVx
X-Gm-Gg: ASbGncs9/dZSgjwyeZeVx0mb8jBO8mOc5OEVokQ0tDf3oCibxZoio9h443T1SmVNc2w
	LzjszkdzJyEhZ+nZTBHq3OlWfk2nOSa/vWr4L0+NKSIyaM+L2LUt+h0tnul2KvjHxEd+aSHWYGL
	OPpsTjc3w+eCmD81fEZmhwzu5tm1OYbEizbXbdKK15TjLrGlyQMW3+IKmjym8SEdp8GitKyP1ll
	gVjD/Oy7CzLpctjjYxsAN4c/VZDdCj04IZy/rJxOGX3gNzGMna6XYIOWtLICKd7oHYM2817gN3b
	NU+sea4h
X-Received: by 2002:adf:e18a:0:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-3862b355ed9mr8982766f8f.14.1733749621856;
        Mon, 09 Dec 2024 05:07:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEcWIoVaHlqXXOi6I/o8U0Sx4v85WRQCbXdmf3r6S4bXIGyWlICGFsXbMo+gcSn1pLdSeKWw==
X-Received: by 2002:adf:e18a:0:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-3862b355ed9mr8982697f8f.14.1733749621414;
        Mon, 09 Dec 2024 05:07:01 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:07:01 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: amien Le Moal <dlemoal@kernel.org>,
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
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
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
Subject: [PATCH v3 07/11] PCI: MSI: Use never-managed version of pci_intx()
Date: Mon,  9 Dec 2024 14:06:29 +0100
Message-ID: <20241209130632.132074-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
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

MSI sets up its own separate devres callback implicitly in
pcim_setup_msi_release(). This callback ultimately uses pci_intx(),
which is problematic since the callback of course runs on driver-detach.

That problem has last been described here:
https://lore.kernel.org/all/ee44ea7ac760e73edad3f20b30b4d2fff66c1a85.camel@redhat.com/

Replace the call to pci_intx() with one to the never-managed version
pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/api.c | 2 +-
 drivers/pci/msi/msi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index b956ce591f96..c95e2e7dc9ab 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -289,7 +289,7 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 			 */
 			if (affd)
 				irq_create_affinity_masks(1, affd);
-			pci_intx(dev, 1);
+			pci_intx_unmanaged(dev, 1);
 			return 1;
 		}
 	}
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 3a45879d85db..53f13b09db50 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -268,7 +268,7 @@ EXPORT_SYMBOL_GPL(pci_write_msi_msg);
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
 {
 	if (!(dev->dev_flags & PCI_DEV_FLAGS_MSI_INTX_DISABLE_BUG))
-		pci_intx(dev, enable);
+		pci_intx_unmanaged(dev, enable);
 }
 
 static void pci_msi_set_enable(struct pci_dev *dev, int enable)
-- 
2.47.1


