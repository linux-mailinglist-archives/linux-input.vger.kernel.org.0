Return-Path: <linux-input+bounces-8532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B36F9EFCB9
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 20:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B501F1881462
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 19:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDBB192D97;
	Thu, 12 Dec 2024 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gjOL4fMq"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384A0189F2F
	for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734032965; cv=none; b=JUJfLtO+vBl3dMTIICDDmY2XPdPoavU9fnzPWyXbMypxDdMs946UOsHPtrdrakLDjC9eOk6q/U5WmuHYCajPLOqoqkfBBp/wNg1PQGnrlJ5axObqokcmaAZRS4kF9IPKPmNdRtgGhnETKA4VMNpLFLqQwA3B08rQu5OTc5IyByQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734032965; c=relaxed/simple;
	bh=c0lIVwJsvJS8Q8StF7zcpZ/c/aEc5d0bbzatxAJuRSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMWVlkKfgyJ0nLF3703/6X9TqlIHsKszJhMLgnVF6u8+exk9DGDf+/CN/uye7ewV0Et+RLUllsEhUUgM8HBIC00171L1PBaLYJn7p2R297fHtAW9btwbeLqXahA/BYP1KSturylQ0VGXHhCS3eobXc8hCwZv2UQrcSL5zTCNh1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gjOL4fMq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734032963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sBiPw5OuI7dlO4Z4t4oS+jtz5kPmxd4ZnxuDxig2hUM=;
	b=gjOL4fMqzHZ/IO3tgHl8lojM40em91HWsjhswwEkjgbgXAikWI9wt319d7d6BhryRyrxqm
	U8bs5vPMtxGGa+G4RZvgeBjb8Q04zJU94syrREkfOpe37B4YCEaOQq1abGQ8RldEtWu4ew
	69ZGaFqQRIWJB2FvH5E8/xoT5Y/JYto=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-eD1phJXHPoeutK02mLznNA-1; Thu, 12 Dec 2024 14:49:22 -0500
X-MC-Unique: eD1phJXHPoeutK02mLznNA-1
X-Mimecast-MFC-AGG-ID: eD1phJXHPoeutK02mLznNA
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-841a803534fso10476739f.0
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 11:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032961; x=1734637761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBiPw5OuI7dlO4Z4t4oS+jtz5kPmxd4ZnxuDxig2hUM=;
        b=Cl2aoUfYssILBgIsaCBZdSPyNRHoGdT+u66NCgBV9w3UkAXApQznAlKFbfNEnD/zjt
         0zc/Of3+vPPQusU4jwDAx/eJTD9ISTSCPuZnpWiOi4FbjrLMLK0q3l4hSOhsEw3F7PjS
         GgUw4VMD6jxGqC48EKZqqAk2+QzKwAHyrD8JjI3aso/7tv3nEq3UPIIEc/PbV0ZzD6Sa
         4z8Bv/sw8nNNVGtZhr5O9/yXAaWmgR1rGHZQ676tOoUD5EtGfb8BoRxCwPNTfDJ8R01j
         Jh37MX4uxTkndLuOGvr1G2b0KFDZ1koqwgGIzPYcr3sR2YZkafXDk0tkiAhRM83W3mrW
         N9gw==
X-Forwarded-Encrypted: i=1; AJvYcCXCoRF1gkFpm5WCll5Ogr4lQGP1Z/4M3zbiW4YvvZqTtEorrIwTjhfvz5uNR+IvyD57wkCJMBMX3ZhhaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziD4ZVtxGLg58JNEskBwKa/yh+vUVRNVodgrAuC/F+0BMWQi/1
	zbntz96mAyrqLviFs2j6FEZ6hBk5OKhWIapwVYwSVI4YRIoznFuXk9zeQg8JGabwhysgaGz5LOo
	6ou7+2743Ae401VaB7qx3Muqb/cJXCUpeYBeI3cElvQYIctlAG2IoD+CWrpdH
X-Gm-Gg: ASbGncsLVUdSPhpzc2L1JYbuM/r0CwzUpgU4TT4y4vkO/FBxC/s/h2GZN8WBUSCwcjM
	V+fDjR1arBvsYvvNhaeCG0+6UjluIJ4DdhOKApni4qYbbbyGVMNYTicXhYqw6oyK4MaWLLzAJvJ
	RkTtH5JRbBj+bzI0J5Z33iWVGPORPCwAY2Gn5KiRzE2tMjHZabdcAPXmKyZ5D81ZTBg74a7rqSl
	cMbo69pVOzlgaNk6IKEVtIQ+GreWIAiaOkoGB/+GWKXx5H3dXl/BL6Khvtz
X-Received: by 2002:a05:6602:1593:b0:83a:acc8:5faf with SMTP id ca18e2360f4ac-844e8a3f0b7mr2642839f.5.1734032961311;
        Thu, 12 Dec 2024 11:49:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERcvaNomxn8th3z3SWMQIAn0f18rUBb5b4dBUVRvcRJcJEoHv6gpei7+xXPBScGwtQKEbPgQ==
X-Received: by 2002:a05:6602:1593:b0:83a:acc8:5faf with SMTP id ca18e2360f4ac-844e8a3f0b7mr2638439f.5.1734032960861;
        Thu, 12 Dec 2024 11:49:20 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844737bc5e7sm434751139f.7.2024.12.12.11.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:49:20 -0800 (PST)
Date: Thu, 12 Dec 2024 12:49:18 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>, amien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>, Ricky Wu
 <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao
 <leitao@debian.org>, Thomas Gleixner <tglx@linutronix.de>, Kevin Tian
 <kevin.tian@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mostafa Saleh <smostafa@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kunwu Chan
 <chentao@kylinos.cn>, Dan Carpenter <dan.carpenter@linaro.org>, "Dr. David
 Alan Gilbert" <linux@treblig.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Eric Auger
 <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 06/11] vfio/pci: Use never-managed version of
 pci_intx()
Message-ID: <20241212124918.0dd284fe.alex.williamson@redhat.com>
In-Reply-To: <20241212192130.GA3359535@bhelgaas>
References: <20241209130632.132074-8-pstanner@redhat.com>
	<20241212192130.GA3359535@bhelgaas>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Dec 2024 13:21:30 -0600
Bjorn Helgaas <helgaas@kernel.org> wrote:

> [cc->to: Alex W]
> 
> On Mon, Dec 09, 2024 at 02:06:28PM +0100, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which can sometimes be managed through
> > devres. To remove this hybrid nature from pci_intx(), it is necessary to
> > port users to either an always-managed or a never-managed version.
> > 
> > vfio enables its PCI-Device with pci_enable_device(). Thus, it
> > needs the never-managed version.
> > 
> > Replace pci_intx() with pci_intx_unmanaged().
> > 
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>  
> 
> Not applied yet, pending ack from Alex.

Acked-by: Alex Williamson <alex.williamson@redhat.com>

> 
> > ---
> >  drivers/vfio/pci/vfio_pci_core.c  |  2 +-
> >  drivers/vfio/pci/vfio_pci_intrs.c | 10 +++++-----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 1ab58da9f38a..90240c8d51aa 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -498,7 +498,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
> >  		if (vfio_pci_nointx(pdev)) {
> >  			pci_info(pdev, "Masking broken INTx support\n");
> >  			vdev->nointx = true;
> > -			pci_intx(pdev, 0);
> > +			pci_intx_unmanaged(pdev, 0);
> >  		} else
> >  			vdev->pci_2_3 = pci_intx_mask_supported(pdev);
> >  	}
> > diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> > index 8382c5834335..40abb0b937a2 100644
> > --- a/drivers/vfio/pci/vfio_pci_intrs.c
> > +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> > @@ -118,7 +118,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
> >  	 */
> >  	if (unlikely(!is_intx(vdev))) {
> >  		if (vdev->pci_2_3)
> > -			pci_intx(pdev, 0);
> > +			pci_intx_unmanaged(pdev, 0);
> >  		goto out_unlock;
> >  	}
> >  
> > @@ -132,7 +132,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
> >  		 * mask, not just when something is pending.
> >  		 */
> >  		if (vdev->pci_2_3)
> > -			pci_intx(pdev, 0);
> > +			pci_intx_unmanaged(pdev, 0);
> >  		else
> >  			disable_irq_nosync(pdev->irq);
> >  
> > @@ -178,7 +178,7 @@ static int vfio_pci_intx_unmask_handler(void *opaque, void *data)
> >  	 */
> >  	if (unlikely(!is_intx(vdev))) {
> >  		if (vdev->pci_2_3)
> > -			pci_intx(pdev, 1);
> > +			pci_intx_unmanaged(pdev, 1);
> >  		goto out_unlock;
> >  	}
> >  
> > @@ -296,7 +296,7 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
> >  	 */
> >  	ctx->masked = vdev->virq_disabled;
> >  	if (vdev->pci_2_3) {
> > -		pci_intx(pdev, !ctx->masked);
> > +		pci_intx_unmanaged(pdev, !ctx->masked);
> >  		irqflags = IRQF_SHARED;
> >  	} else {
> >  		irqflags = ctx->masked ? IRQF_NO_AUTOEN : 0;
> > @@ -569,7 +569,7 @@ static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
> >  	 * via their shutdown paths.  Restore for NoINTx devices.
> >  	 */
> >  	if (vdev->nointx)
> > -		pci_intx(pdev, 0);
> > +		pci_intx_unmanaged(pdev, 0);
> >  
> >  	vdev->irq_type = VFIO_PCI_NUM_IRQS;
> >  }
> > -- 
> > 2.47.1
> >   
> 


