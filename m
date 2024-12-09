Return-Path: <linux-input+bounces-8464-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62F9E964A
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 14:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B16188844B
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 13:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6373F1ACEC0;
	Mon,  9 Dec 2024 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HvF9pQ7y"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE777238752
	for <linux-input@vger.kernel.org>; Mon,  9 Dec 2024 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749632; cv=none; b=BH7BFaxcjayUgBtABV3adUrPwOuvxK1CIdjQyZbeWswgtJVINvjIxmkcfoR9ogC5oKueXhR5gQ9YMGgq+Wg/p2E6c2uPWxkhXRPhO/S5XYsVK7I98nGznl6u4X9QvgH0oF/amSrrFrrrAbcy0f81vMhsCgON4SOluYl6pV7BkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749632; c=relaxed/simple;
	bh=jwv6lYop8TdP9htf7xZwf/ELhC2D1ascIg4aYDeJpYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLJyR3YFiSHuk1xwtOl/c9V6/lupcQKLRSu4fXqVSYNAIHUbEMTVSvQlT3xQrY8CReV9Me24X378W6XuW2f5b/2BjM1ZtlW2JOjjQtewcf5qQEtMZ1TIYLxVgnbMqJ5cSYtAGX+WQMh28D58UlD0fLt1se+O9l2NOaheHsNeKao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HvF9pQ7y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QrzFiyozzKwphrmER/QLBGC9UXhx6Rbz0xOMvDA9uiM=;
	b=HvF9pQ7yxte6Zj086vXS91oaZk0/BiR9FRxajzADYmI3wYBZ6K9ueL46ONKCU9smD/prKM
	6z5yNRewwV/FiyKFJNM6HoFts798lmpGUDfDGn+FSYeJf3yZ1Bv0PypyVRD+zmP5liLxdP
	q05Qgi6XbllBr/6TxojIkTCBkgQXCKg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-WeLYMdSdPDWczGoxpJ4m-g-1; Mon, 09 Dec 2024 08:07:07 -0500
X-MC-Unique: WeLYMdSdPDWczGoxpJ4m-g-1
X-Mimecast-MFC-AGG-ID: WeLYMdSdPDWczGoxpJ4m-g
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385e27c5949so2661782f8f.3
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2024 05:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749626; x=1734354426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrzFiyozzKwphrmER/QLBGC9UXhx6Rbz0xOMvDA9uiM=;
        b=RqQdy94Z3NjmWjXWK8MMhCegooX/pKzTYkduRpOIMqTHgZoTpyYzQDOpqZC0KZgXF9
         WHTystudNiPoPv+fiwKZIr1JiuyKoo1miOWbdS6QTWF/RqRTP9SHZgCYG7NV2FSJ2gut
         q7RpN6JoPUo72mXK0Nq8GLbU6aNrt19oc/uRjqAZpAWAG5LWSXju0ZNVGslMACfWqO6m
         tL+/KjGEp5QjiAIwlQ0YT+g1TujS4EYLncx7pS/GVjEJl8CYf0dDCfVWvyRZOkopvyxa
         oq0a9VGl+nrPqnIH7jkhxLk5qyP6yAWhgGhT3w9nOn54iMG55lHmCwI5q7Qo91/8HPFi
         7x3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUc5H+vsCajWmUftEkV9aRE3mwGBQByhCVkeAaC96MRtJCtZDOoqaA6RFlJyOVFd+O5/KF3G4uSfkrtYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPUElt0CawfxeCQbagan9IVgM6ezatLMlbwuntgGamTkRYWZMu
	bL+U3qI3F7vseQVW++5sWrxrDNFgku6GzZ/IutbcUEyf4+MVPGyNJG0l/UEp63rJnm/J9hSrTtU
	vHVe0DsToA/J2npahgk30VAQmQPX37sxFrtx+YTZDT9Jjg0nfuK23FZdf68kh
X-Gm-Gg: ASbGncujlf0hFqetkbjFMS429GMGUW/5JfcFfyojCIv5REaOTagHhwvwAfoEQHiPaW7
	LwCtMvFtXfsbsXwORrhYBeq3GbpYWzZvRCPvjnzMnsBAaIhNm4wi8lLChIAvx60ndyLmTxjW7rc
	NuzO+SSYZLadoIByp12jiPvHa7VcSHbeoG6oDhK4x/2lcG1M1LnBlY31JYpBGHROUSbJAoob5X0
	eYZfWntYQc/QaWI8BUl2HBNZMxpWCg+49h6+IIj4lkxxmWXgoJ89qd9fczyIeBNrEeU+Nt4rHlY
	9cLdfkHQ
X-Received: by 2002:a05:6000:79e:b0:385:e9c0:c069 with SMTP id ffacd0b85a97d-3862b3d0941mr9603891f8f.57.1733749626169;
        Mon, 09 Dec 2024 05:07:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERHmOpW9Cz/hix9sJGhQKCFL65VOvqT0smHQwQu2JVZ9uttb5F5Byv3ep6mSTcPHbKk0ee2g==
X-Received: by 2002:a05:6000:79e:b0:385:e9c0:c069 with SMTP id ffacd0b85a97d-3862b3d0941mr9603809f8f.57.1733749625729;
        Mon, 09 Dec 2024 05:07:05 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:07:05 -0800 (PST)
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
Subject: [PATCH v3 09/11] wifi: qtnfmac: use always-managed version of pcim_intx()
Date: Mon,  9 Dec 2024 14:06:31 +0100
Message-ID: <20241209130632.132074-11-pstanner@redhat.com>
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
2.47.1


