Return-Path: <linux-input+bounces-8465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 147B29E962E
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 14:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 190D92812D1
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 13:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9086B222D72;
	Mon,  9 Dec 2024 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uk7DOXS0"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E731B0401
	for <linux-input@vger.kernel.org>; Mon,  9 Dec 2024 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749635; cv=none; b=uj+GyVtM/cXwmHZSmEytmcY3t/KEgw/pfuSrdYk4kTPZ1U3md3snSIw/LLeo0W0wLHR73lyzU+AGkh67nhgow4gs9+tjZxQ8U580a/uiCusR5bxiPKDl3OKDSI63cnAoEHEqgtQgXI0RM0HWq9D8KkmBIpnu91bVEfmayheOjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749635; c=relaxed/simple;
	bh=kEzRZlYHQ35CA9CnBRQZ7a8YwaQDWA/y9wHnTg2Gq0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2T9qJNP1WuVmUJP6G4T2TBFVujazIZxMcuc0CY4EcWMtEr69DrQ803Hem/qfIEyleY7MBvbaBBJXVkJ4hQ1MLMJv2obULAH4GJxPS50tuZcpmZhJ89b3XlN2HKVMNUwGHrXVIw2HCocj598rLhAUwmqMlVTmve1nzSSLEPlaDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uk7DOXS0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cg5FDrf0+9NG9f4wa7LEIeg49zn7uGzDf8HKpIKXKbU=;
	b=Uk7DOXS0pKDwwgrUE7AoI6sJGb49Otm4W9tOm3pILEAqne+s1qpqntlah4kIpK7x2VaJ44
	lAqhpTMAbbgU1w+D0Npa5DvbNw0OQ0rBUq5dR+o0h1809b9tvfiN/j80oF4PdL9VaBw6J7
	UPcjJbCCLDpyiY6H6tLYsUjktJBR8o8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-uznvo6r9MlSomhze0Y4b9w-1; Mon, 09 Dec 2024 08:07:09 -0500
X-MC-Unique: uznvo6r9MlSomhze0Y4b9w-1
X-Mimecast-MFC-AGG-ID: uznvo6r9MlSomhze0Y4b9w
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-434edbbc3a7so14951205e9.3
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2024 05:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749628; x=1734354428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cg5FDrf0+9NG9f4wa7LEIeg49zn7uGzDf8HKpIKXKbU=;
        b=kwR0brG5btEfewUvcEa0XHUOXONE91p42XunwTwpCZnOLSgY4rNal46mVQ+Vkw73rL
         Zcp0/JLVzUwPNUFJT8NC0SJaI0UHpA8JclaTxlcrzumCXydKfkH/CDw4ki8n1ZJG0MjL
         nMgbuy2i/xDtxKI5AjKk88bIL4rYRxhwLE3ra6UDMVdp07TXXPmFlOLonouQqZE5e5RA
         ADbEBbGzDTD1d5Bd7KVI5GjuTtweqbPO/eY5nlXAhdM1qCgqqG/k12RBxnh3Whn0GbPG
         rZ/ceZo8qtGxMce3aRUNAVKeubvbe0umh5kUWQ6IOi6rZG/SxXv2qaw6YL562lsbAacX
         oNZg==
X-Forwarded-Encrypted: i=1; AJvYcCXXwmlj9RUMGk22ZuMr9mv+4lWGNVLJT4H6mi1vmK5L1MQELubI/uFc5dafc2Xmka+zCXL+su8xiws2lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5t7BcXnZIMjp8M1nqMs0ZH60Y2lTe0eNaaCPU1ChAkUzDjWMT
	/ja/YHy5Aw4eN/VXhLB1VTeTpmMUEJEdZuDzabaeV2nP2maagcor5awNj2//L7Nhuf7o8cuF60o
	cW3hEnXGniIWMrwALFCEXzPhNJ7r2aE4AVj8qpERLAN/RlBF9zYGN8KOxNWno
X-Gm-Gg: ASbGncsA2LjSTW/WzTC0M7eloH1OpRvYmMOhtVTIhHk6YBjFrTd4IkghXvIPm5KD+Wp
	kp3/CTX63teiJ9cgKL160rLGGgQD26ppTWiHLqOBmjQ+e8dbaAwQdPn9PUaKuBEux5q2u+TsvjE
	fypialPElg//yS8LBX4KKnR2+qjeLQuAAcIOT2S4qOtZ6e2KeUb6kr8zDj29T8k/3atWGGQ3cDv
	hK4vsEq8FM+EBEDVUmgg02ZFnoQPr7vGf6BnbSS+BiJ1Y1PHYEBEQeE9iwOjNVUHOp7yi0JfWRM
	xKUggZeJ
X-Received: by 2002:a05:6000:2d12:b0:385:faec:d94d with SMTP id ffacd0b85a97d-3862b3e2f99mr6786218f8f.51.1733749628290;
        Mon, 09 Dec 2024 05:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzvkT5DctzF6sU2GBgKgYj4TZMfZMHtf63D+x4hcRmPdkPLtxCBfCUCCjCewKM8z5+rRuxWg==
X-Received: by 2002:a05:6000:2d12:b0:385:faec:d94d with SMTP id ffacd0b85a97d-3862b3e2f99mr6786186f8f.51.1733749627860;
        Mon, 09 Dec 2024 05:07:07 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:07:07 -0800 (PST)
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
	xen-devel@lists.xenproject.org,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 10/11] HID: amd_sfh: Use always-managed version of pcim_intx()
Date: Mon,  9 Dec 2024 14:06:32 +0100
Message-ID: <20241209130632.132074-12-pstanner@redhat.com>
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

All users of amd_mp2_pci_remove(), where pci_intx() is used, call
pcim_enable_device(), which is why the driver needs the always-managed
version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 4 ++--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 0c28ca349bcd..48cfd0c58241 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -122,7 +122,7 @@ int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
 {
 	int rc;
 
-	pci_intx(privdata->pdev, true);
+	pcim_intx(privdata->pdev, true);
 
 	rc = devm_request_irq(&privdata->pdev->dev, privdata->pdev->irq,
 			      amd_sfh_irq_handler, 0, DRIVER_NAME, privdata);
@@ -248,7 +248,7 @@ static void amd_mp2_pci_remove(void *privdata)
 	struct amd_mp2_dev *mp2 = privdata;
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
-	pci_intx(mp2->pdev, false);
+	pcim_intx(mp2->pdev, false);
 	amd_sfh_clear_intr(mp2);
 }
 
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index db36d87d5634..ec9feb8e023b 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -289,7 +289,7 @@ static void amd_mp2_pci_remove(void *privdata)
 	sfh_deinit_emp2();
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
-	pci_intx(mp2->pdev, false);
+	pcim_intx(mp2->pdev, false);
 	amd_sfh_clear_intr(mp2);
 }
 
-- 
2.47.1


