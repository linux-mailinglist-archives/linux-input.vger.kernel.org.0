Return-Path: <linux-input+bounces-8461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F39E9626
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 14:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1339A168875
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 13:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFBE23496E;
	Mon,  9 Dec 2024 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jP0F2H5k"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7C1ACEB5
	for <linux-input@vger.kernel.org>; Mon,  9 Dec 2024 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749626; cv=none; b=haq0WEbRmf/KS4T1I2Bmayoisci+Dtt191UDpKYVqaBKlSbZhTwwbRt57FgNtIaOM60JyIu36O5++eu/KviqEZ7y+3bOrcsChTtzQ7lhIkuIJm+6puhxWmLNt9Ad1xVqNQtRJrpaU/P8zw1rbh0vWhEbps4lZ99tfzX8tu7typY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749626; c=relaxed/simple;
	bh=p0/gWxUTpmVAZUhoNYoMEndzzz2nBwZ50lbcwipiIRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQAgxQ2Kc0BYXuohS8sMETRoE/ibmS0a2p0mLfSK0HGDPSxzB/xBRJt40NQ64R5QmUTPn5TNVMIWZ+KeYDqGo+q3ZCnO1HCKEZSRm+Vy4UIuxOnut5IJe5D2UoHkPWjISx47E/KY9++1bMXzTEHFgu0lBsSQGeCI6QkhcMNTKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jP0F2H5k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGrvh/xDUNx0Zym0wN3Xe7A7dJtO5ZhSWVvmuSF27ww=;
	b=jP0F2H5kfj0VHUnncCJ7umywp1CFjdcnSCGPwHy7K3guRx/Z56aSMpOq7zMmmG8z1yZDk3
	wBOVx02MFye2AQEo7heCKeT174LD0x8W7tCzfv+I7uXsr5i8vR4KyieLJF3YAoRT1BKfSN
	21kaaMuRlHN9jU9VoKbqOmzN1Kpc5BU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-pDFWrDNkMHa5HgCKFwiJsA-1; Mon, 09 Dec 2024 08:06:58 -0500
X-MC-Unique: pDFWrDNkMHa5HgCKFwiJsA-1
X-Mimecast-MFC-AGG-ID: pDFWrDNkMHa5HgCKFwiJsA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385e49efd59so1691283f8f.0
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2024 05:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749617; x=1734354417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGrvh/xDUNx0Zym0wN3Xe7A7dJtO5ZhSWVvmuSF27ww=;
        b=Fw0IXlrHeziUlxBFiqcrSk8g1Rla94eJOpu3M8JfFoDBfZitahK7K+sSTByrqZZKmP
         L+byN+dZUM4CxkVr1tSMT0marHfylf2v1xvnB/nUHvgKbaJI13MFRWIWcVJNzWY86bus
         qLi3MiMDq06obKAwdKE6i2Z9zgQ4sILZh1sAKDJXtOAN0nBbAifonNkujMLcA7Yjmau4
         8/4hMx0jbXaCBMALtuluZ+IUcIBt39naViSYgwnanNwHGywIa6BAJ++xh+NEMKrMIckz
         crA6TKhvBD7hSLEQ3Dq3K+7HM7en6Tm0rn30UpUhQaZONcFP1mgQgbtItcYPqzpkNh+z
         uABg==
X-Forwarded-Encrypted: i=1; AJvYcCW7pwkoicdZvDSz89hDa12UOtL8WeHKbGwwbXt9cRZETQJIdRCMuztVAwgFq+hpEBpACx2CVy3F+sQGhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6KNxKa+q5fdYU5RnjzIwFkIiHc7kPGfCvTMthmgyqtiDdabH
	PdvigeluF/QQzhY3Uk/lx+sbLUP3EErAambmZzjKyJlO4ThvcsNiUDZcx1hy4tbaS00xWvQOAF1
	LbyfsaQVMBuNdhyzXTfzaHw1VqP0yNmWjfMM1EOjAtQlRPB/I0GjTufO+R6ix
X-Gm-Gg: ASbGncsmjt595K5RcAEY8rmpbf2+pzi130cpXq1V/hSYBXZ/f3wBupx8TPaeNaHf10p
	22aq0Aiw5jTEF+2qeHbMFJTiz9WzZbLN5fNAg1XhpAv3qUzPtek0dz9TUbGDZaNcTbP1kzRP2Rv
	MUoVooUhUW8FuHgu7rDsdstsXHBMMM5wUc3lljk0G8j1KDx57Jz5j2avdjwMp+eucEQvcYu/j/c
	Et8VOs8k2Acp9oVVmhuSrlQrclsfR8YXnsUhTD1BDpdWYSJ5He+diMFl4xoHLnsGEYV4EdjmJ+f
	yfBt98bV
X-Received: by 2002:a5d:47c9:0:b0:385:db11:badf with SMTP id ffacd0b85a97d-386453d6c46mr225649f8f.22.1733749617416;
        Mon, 09 Dec 2024 05:06:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+w+VXnhTGgYCQrqoxE7Q0eQycE2/xL59lBRJp9LXmIJ3oiAACyABfaofCQ1IoSgKVucKxLg==
X-Received: by 2002:a5d:47c9:0:b0:385:db11:badf with SMTP id ffacd0b85a97d-386453d6c46mr225568f8f.22.1733749616959;
        Mon, 09 Dec 2024 05:06:56 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:06:56 -0800 (PST)
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
Subject: [PATCH v3 05/11] misc: Use never-managed version of pci_intx()
Date: Mon,  9 Dec 2024 14:06:27 +0100
Message-ID: <20241209130632.132074-7-pstanner@redhat.com>
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

cardreader/rtsx_pcr.c and tifm_7xx1.c enable their PCI-Device with
pci_enable_device(). Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/misc/cardreader/rtsx_pcr.c | 2 +-
 drivers/misc/tifm_7xx1.c           | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index be3d4e0e50cc..e25e6d560dd7 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1057,7 +1057,7 @@ static int rtsx_pci_acquire_irq(struct rtsx_pcr *pcr)
 	}
 
 	pcr->irq = pcr->pci->irq;
-	pci_intx(pcr->pci, !pcr->msi_en);
+	pci_intx_unmanaged(pcr->pci, !pcr->msi_en);
 
 	return 0;
 }
diff --git a/drivers/misc/tifm_7xx1.c b/drivers/misc/tifm_7xx1.c
index 1d54680d6ed2..5f9c7ccae8d2 100644
--- a/drivers/misc/tifm_7xx1.c
+++ b/drivers/misc/tifm_7xx1.c
@@ -327,7 +327,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 		goto err_out;
 	}
 
-	pci_intx(dev, 1);
+	pci_intx_unmanaged(dev, 1);
 
 	fm = tifm_alloc_adapter(dev->device == PCI_DEVICE_ID_TI_XX21_XX11_FM
 				? 4 : 2, &dev->dev);
@@ -368,7 +368,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 err_out_free:
 	tifm_free_adapter(fm);
 err_out_int:
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 err_out:
 	if (!pci_dev_busy)
@@ -392,7 +392,7 @@ static void tifm_7xx1_remove(struct pci_dev *dev)
 		tifm_7xx1_sock_power_off(tifm_7xx1_sock_addr(fm->addr, cnt));
 
 	iounmap(fm->addr);
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 
 	pci_disable_device(dev);
-- 
2.47.1


