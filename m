Return-Path: <linux-input+bounces-8513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6F9EE97A
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 15:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22DE1887F06
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 14:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A56D216E27;
	Thu, 12 Dec 2024 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ieWMtjHx"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1C215777
	for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734015521; cv=none; b=lr1CF0U9tAxrQWIu7m9imh+P4e9RG0Yu+z/nbSqEryd6/ES4qH7lUj1BVrsn9pbvEOgOtb83WKGEbJO4HEk7OS9xOCuh6x8wXZqzxPDxD/GNpvKErU7bFpKdLRuy+5Z8iRfIk0/12ccss32q+ErIv/qwfhRD+Ue++M+k+1dlPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734015521; c=relaxed/simple;
	bh=G6Z2o7H+YRsuJn5EHuxMgQuZNMoz/Zu4aqlYRNiWXyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJ0i4S+01A5ETXdt/ZI85qijnes2slHTCOGG3KEHvoyDQ7DIUottR3VDRM5sqI/QoexFbWJ/fQ3oBg3QMNOT2O4QyWT6EtRLWUnMZl4PkN0CcSnO3DwelUFcDIFth9tbLWgzaX8KH6+EK8HZI9NQynpUREQZB3o19NYbdK7SdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ieWMtjHx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734015517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mp7PByfrT26c6XlUU6lXZIxvrN1DU5qMvcLQpbxnk5A=;
	b=ieWMtjHx/VA8JrMSRqY63odCgsUs32B8CbSf0fmzSTCiV7aAXJ3Uxxmmio9VfBnYnzw4Db
	5n/VHlD1v+BrNfgsJRb5dF5JoUy/vATckEKVm1XrLdTjwgrc0appiED284JnH/YTXkYbHp
	xugjBJDACvd8J4C0Z9aE59oVsIjH73c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-rB5k5LqHM0qd_sML_E7mAA-1; Thu, 12 Dec 2024 09:58:35 -0500
X-MC-Unique: rB5k5LqHM0qd_sML_E7mAA-1
X-Mimecast-MFC-AGG-ID: rB5k5LqHM0qd_sML_E7mAA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361d4e8359so5684965e9.3
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 06:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734015514; x=1734620314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp7PByfrT26c6XlUU6lXZIxvrN1DU5qMvcLQpbxnk5A=;
        b=sUhZULLBquHF0lZ1LWH/H8W1opU0nrZ3p1RpcuC2Yu2TnZhOz0jSjcweAfTvFBviJs
         wT2W3Kki4OpRmgRp96h4WK7RHQfBjybR3X0lMZuKGq5XNlq1EHXopEiCN7Ogqq94Qas1
         Pi0JZZqy+QZR4sMcHkmubk7SS2QA+1YWZcSgQZN5D58l0zQ1PZw+DtJxKWmrj3H5airo
         CvD0p1j78CME68LdnnWJ7RierJxmSJpwd76c9Sf1gn2W+W00sBc+qm5DbIVnZT00imWX
         PIqbWLkF4oQk1Dm/8SzC1uAq1CbNGDNiEWUYanqr4GpXpfnU5t7MGMKVfxB0IjKeq1A+
         mglA==
X-Forwarded-Encrypted: i=1; AJvYcCVf0UF+TIDva3OkLMZwutacg/vxAwlelQzCa+4aaQ6zWOjt7rcA+aMcPU7cxDAbWzt8Un7o5sgdVKvSIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwojAwUoRSHWHqTU37GUeN3TbkjdsZDTvPwAxhED/+iRpN2tRbX
	XPSBTIDYGgs5TIr93TLTzZyZCsL0vUnRC2YcAmOBc6tYv+st9aRDecedqCHzGfR0WW60e/B2BOL
	hf5Y5iotqSP+H7WcOvT3TWycRIPjj9qE5ShB49KayHpKaB0nYIj7xEBkJgSYr
X-Gm-Gg: ASbGncvi4OvbRoo8EoV3N/P/ebEd7tuqVm5mMokulx5zJzV7puOfsE/MaehYN9950QP
	nKm4AOm5eS009khUHKMnhIizU6upDuCJZR1zqIM1730V6ynorOaw9+dNj4aqlTDh77EPIpIukHl
	1t02zgHNHeX7KtL5BcTAob/KiK2t5+0mDuWAxjf4ax8DccMRiwkrdGxtZX0dlTHNGpHA3ssw+yG
	MCFH9oYTLyyldE2IscgHH1WMrhTnir5pZ2BKrN2tQZ3vPsr+qJ+VUik9DFq+a3gmWa/zv4haUZ6
	IdzkvPk=
X-Received: by 2002:a05:600c:1e89:b0:435:21a1:b109 with SMTP id 5b1f17b1804b1-436228239d4mr34776385e9.2.1734015514550;
        Thu, 12 Dec 2024 06:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoQPXURHNGvrny3f7vl2oVT9jWXY7D4FX6dkSlxmx2R9PGBk/+viTtA90lBPMFXjybTLaFQQ==
X-Received: by 2002:a05:600c:1e89:b0:435:21a1:b109 with SMTP id 5b1f17b1804b1-436228239d4mr34775655e9.2.1734015514130;
        Thu, 12 Dec 2024 06:58:34 -0800 (PST)
Received: from [192.168.88.24] (146-241-48-67.dyn.eolo.it. [146.241.48.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559edc3sm19213025e9.22.2024.12.12.06.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 06:58:33 -0800 (PST)
Message-ID: <a6d7a4ee-929e-4bee-80bf-a7b4f4f89f4a@redhat.com>
Date: Thu, 12 Dec 2024 15:58:30 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] Remove devres from pci_intx()
To: Philipp Stanner <pstanner@redhat.com>, amien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@linutronix.de>,
 Kevin Tian <kevin.tian@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yi Liu <yi.l.liu@intel.com>, Kunwu Chan <chentao@kylinos.cn>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20241209130632.132074-2-pstanner@redhat.com>
 <20241209130632.132074-13-pstanner@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241209130632.132074-13-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/9/24 14:06, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. This hybrid nature is undesirable.
> 
> Since all users of pci_intx() have by now been ported either to
> always-managed pcim_intx() or never-managed pci_intx_unmanaged(), the
> devres functionality can be removed from pci_intx().
> 
> Consequently, pci_intx_unmanaged() is now redundant, because pci_intx()
> itself is now unmanaged.
> 
> Remove the devres functionality from pci_intx(). Have all users of
> pci_intx_unmanaged() call pci_intx(). Remove pci_intx_unmanaged().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/misc/cardreader/rtsx_pcr.c            |  2 +-
>  drivers/misc/tifm_7xx1.c                      |  6 +--
>  .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  |  2 +-
>  drivers/net/ethernet/brocade/bna/bnad.c       |  2 +-
>  drivers/ntb/hw/amd/ntb_hw_amd.c               |  4 +-
>  drivers/ntb/hw/intel/ntb_hw_gen1.c            |  2 +-
>  drivers/pci/devres.c                          |  4 +-
>  drivers/pci/msi/api.c                         |  2 +-
>  drivers/pci/msi/msi.c                         |  2 +-
>  drivers/pci/pci.c                             | 43 +------------------
>  drivers/vfio/pci/vfio_pci_core.c              |  2 +-
>  drivers/vfio/pci/vfio_pci_intrs.c             | 10 ++---
>  drivers/xen/xen-pciback/conf_space_header.c   |  2 +-
>  include/linux/pci.h                           |  1 -
>  14 files changed, 22 insertions(+), 62 deletions(-)

For the net bits:

Acked-by: Paolo Abeni <pabeni@redhat.com>


