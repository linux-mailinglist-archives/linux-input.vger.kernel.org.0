Return-Path: <linux-input+bounces-8059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F99C6F98
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 13:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D20B1F217C5
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 12:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DE620B7F1;
	Wed, 13 Nov 2024 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dopkn/pP"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4F2076C5
	for <linux-input@vger.kernel.org>; Wed, 13 Nov 2024 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501777; cv=none; b=DtKPaX8LafsM+WzlBl0o2svaPUBzsruq99/zlHYjN56U5ZNCCwPse+xs0+u0/1UcN4qy/pzz8+KxMiRMrughniWGhgE3+ZH8q79XvaAJuBhG+3SB5kZ8uEE4mmlkSlOrfXjDCzXd2PP9C+gNePYUbdOY3mOU5xfF0vM9GWxnOq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501777; c=relaxed/simple;
	bh=MBsD3LRvT8a2cfMDXV+fpnigYjcMu2XVeQIVlBba0hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+tIQiNTBnxmsL7yy3y/0sBqqxc5HjhPsz5uPPGzQzhwq0PAJJhFE6g1ihgJMke8EjQsl42Ox3W5DaUwgBWssuvKAARBKW6++sD9ambMdJRUrQIelV5Cwv4YEE423OyId6/+DULOodA9jnO36F8tnM2ZNVHIlu2QoLtEpD3nG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dopkn/pP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYummHyMeO18Vto9q2ZMMfeLT6TZU1cjZPgJKtQfrDY=;
	b=Dopkn/pPpVANfj5j+iqitLtJX1sR7kmhTzVXei4U9f9UIuPEKg0HLKyOsG6rXt5Z7HKeNg
	9WIFvjFmmFpFWjagneq5xqpyHJ2WhxhDtrqKN4NznMXDt8RmpZCGNImDGl4cfr/kh3h5yJ
	bzD2YZt7c+fgc/kbABoJNnBBhN5Ggs4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-CKLwiUONO72NMEURgu4Dkw-1; Wed, 13 Nov 2024 07:42:52 -0500
X-MC-Unique: CKLwiUONO72NMEURgu4Dkw-1
X-Mimecast-MFC-AGG-ID: CKLwiUONO72NMEURgu4Dkw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d462b64e3so3574299f8f.3
        for <linux-input@vger.kernel.org>; Wed, 13 Nov 2024 04:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501771; x=1732106571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYummHyMeO18Vto9q2ZMMfeLT6TZU1cjZPgJKtQfrDY=;
        b=S8UK7uc3kOvz8dqaVRaQIeYmsZW9h2S6Fs/d/MmDFexrdrR8DAlCKcXXEfnMOf+NbH
         lcpHgXgdq+QBUghlwhohVlt67woJbld/xPhtKnz1B5JzighzYbeAAHmTOkuTti07XN4l
         nE6WbRHIL4P51YlmKqpnx0ss9JLavMi2rAxeD9v0c8h1TF4D0ppXv+0Pyz43CU/fE6vA
         8MazLFz0OltP2p744kKRnADVPLlPv8oV/1yzWTHIYkKAf4zwKsMtZ7iulx89ldmP/Q2y
         A1VIbtESPA/EJI41L6hxej3XWFylg5Xqym5Uk4WJwEDvSAAa/yFydcaEvhnJCpYbdTcN
         cP5g==
X-Forwarded-Encrypted: i=1; AJvYcCUOEYD5e1k2yrJSFpTKDmJKHHW/ceom2OTWVX7ismnadSWEiR3nwvY5QLlwOVR6fZVUQmx7a6XgBjcoWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfD1xyQOvPxKy0r+S4iNIbGcN4nww9fEWMaZZ14IHoXI63bXN
	yiieOz1Ci6j0FTrT4kgB0/WZsgk3APYbAohvKRHpIKU1wWztSRMYbw0uUg+V0ZPxBv9iX7BlsDo
	D8MtYEF2fJml2t5gIqX+bQSdJtRRnTnmY4b37Czcwosnjz6kDlDzexRVclxCL
X-Received: by 2002:a05:6000:18af:b0:36c:ff0c:36d7 with SMTP id ffacd0b85a97d-381f1863104mr17590026f8f.2.1731501770813;
        Wed, 13 Nov 2024 04:42:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaBVI43qrL6OFk13wQNBZS22ld2QbZy7MjquOncWveKQvBM2tKSYuVKq3Lye0eFRQdag4y9Q==
X-Received: by 2002:a05:6000:18af:b0:36c:ff0c:36d7 with SMTP id ffacd0b85a97d-381f1863104mr17589974f8f.2.1731501770406;
        Wed, 13 Nov 2024 04:42:50 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:42:50 -0800 (PST)
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
Subject: [PATCH v2 09/11] wifi: qtnfmac: use always-managed version of pcim_intx()
Date: Wed, 13 Nov 2024 13:41:57 +0100
Message-ID: <20241113124158.22863-11-pstanner@redhat.com>
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

qtnfmac enables its PCI-Device with pcim_enable_device(). Thus, it needs
the always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
index f66eb43094d4..3adcfac2886f 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
@@ -204,7 +204,7 @@ static void qtnf_pcie_init_irq(struct qtnf_pcie_bus_priv *priv, bool use_msi)
 
 	if (!priv->msi_enabled) {
 		pr_warn("legacy PCIE interrupts enabled\n");
-		pci_intx(pdev, 1);
+		pcim_intx(pdev, 1);
 	}
 }
 
-- 
2.47.0


