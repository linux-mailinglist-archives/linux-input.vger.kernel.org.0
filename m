Return-Path: <linux-input+bounces-7434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B69AF99F784
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D10491C21CA7
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 19:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAAD1F582E;
	Tue, 15 Oct 2024 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GW5kbgnr"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05941DD891
	for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022024; cv=none; b=tSddGGFzLMsFVNfJlVRm3fRhtGppbqWoXAY9A6xwmBbwrmB0Pp6VBsbC+QpKSn4HmlHQAyxrTCBO+Z1Kscg4PfRb8tOHMj6AW+dxG+s9fQxMAbuIWT8IKA8JlqSpLGFHGjTPnyN+DN7+/37boyQUGg6wB6LvfUHQnGpka2/CfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022024; c=relaxed/simple;
	bh=EyK44VVSzqK0VVd6JZRUhzDLFA8N/4UuvEHVd2mlOVk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tngu/84NFC+WExVktb5OY2zVlx4H0IvE+mnsJ/dPhpxZUo7Ay4A9u6aO97EnljHvQCwuxNmeq6oG9f0YbLmDwySo0OaXqT4A7oDOAKhgq6EWr/+0TdvCOI+I4s7mL7Vq6WSuJNMR49k0BVAYZfRnw77kPo5+AJkVPETD96feZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GW5kbgnr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729022021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDdlfoCJodlBAEHv18hly2baxUxV3CY1ROqq62ZwNfA=;
	b=GW5kbgnroZdypZ0pri7f9IK/W/kIDeKtNVySbDcPp6EDis7zRB6U7TwcovpS1hjJHSBhx4
	DrRJuB3jWOEnhigNPJMq+ISDVH/+4Ys/o3vwInG9p3jQQU0hoqvCQaGF4DfLZIqpUcJzsR
	cNTygXR/ZlZ9LJOL56rpiwq9BEpuEqo=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-McQS7vngOdSMqsOYuUooag-1; Tue, 15 Oct 2024 15:53:40 -0400
X-MC-Unique: McQS7vngOdSMqsOYuUooag-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-83547df1194so65413839f.3
        for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 12:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022020; x=1729626820;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iDdlfoCJodlBAEHv18hly2baxUxV3CY1ROqq62ZwNfA=;
        b=ZDeXIZzh6PHV3kLEKSZXhXko1JLX2zFnl2xBv8j4thkUA7EujFR36NRtdIJLWO2abM
         G0RQ7x0jYDwdBG2D8HBOJgNxT8ulQecTS8AwVGVli23Qf8IE3ubbgt20Qo4+DG91cEpo
         XqW8NXxsEvglPcIkkXp2D6BNZSV43R1Jq5CtphD+gjc4CvDj/VBMzN1irIp//rtWkSY8
         q8XpV0OddS6g0JLmUAOUsTDHH9YlLlUzZ1wHdpqv399zkIAr0a4Fp5iqk6sn6LatPt3W
         upjqVsE9bTQBDiIlB64wWyBuZU8l07U9J5zDn7rvulKeM62uMLsdFy/Na+JGlwt+QNKZ
         eL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSiH7uATJOBxqJ81LyckzEs9Tpc4WZWl83wYsKE2k+knpDJMms887guTDQdobog8n7eG5srnB5dSP3YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOicqN3lbfhWghuurRH51xvpA3cqcjB5aCSKdBGbvzIDnnbmSu
	YdinNX+zoEeU0iVkTUasjJfR2oXCgOUVaehnD9gjnGvD2aJBtfPNcsTPiE90bJXORKtlDmCXHK6
	u+tzIKi3t3LCMt/N+g2XkfzDfUSqhfEoka9rZDukSCk+MMPMovQfkaMuKHvtQ
X-Received: by 2002:a05:6e02:20e6:b0:3a2:57d2:3489 with SMTP id e9e14a558f8ab-3a3de12de3emr696315ab.3.1729022019796;
        Tue, 15 Oct 2024 12:53:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESXVYWbDvg1wxgtSYFRG8WjdQ6j0NF7QGGfISEgWPkRfl6g2CRlLVPppWhf9Avs6HBI8mwDw==
X-Received: by 2002:a05:6e02:20e6:b0:3a2:57d2:3489 with SMTP id e9e14a558f8ab-3a3de12de3emr696075ab.3.1729022019438;
        Tue, 15 Oct 2024 12:53:39 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbec9b24b5sm462948173.59.2024.10.15.12.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 12:53:39 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:53:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mostafa Saleh <smostafa@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Christian
 Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, Eric Auger
 <eric.auger@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>, Ye
 Bin <yebin10@huawei.com>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 13/13] PCI: Deprecate pci_intx(), pcim_intx()
Message-ID: <20241015135336.0de9795e.alex.williamson@redhat.com>
In-Reply-To: <20241015185124.64726-14-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
	<20241015185124.64726-14-pstanner@redhat.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Oct 2024 20:51:23 +0200
Philipp Stanner <pstanner@redhat.com> wrote:

> pci_intx() and its managed counterpart pcim_intx() only exist for older
> drivers which have not been ported yet for various reasons. Future
> drivers should preferably use pci_alloc_irq_vectors().
> 
> Mark pci_intx() and pcim_intx() as deprecated and encourage usage of
> pci_alloc_irq_vectors() in its place.

I don't really understand this.  As we've discussed previously
pci_alloc_irq_vectors() is, unsurprisingly, for allocating PCI IRQ
vectors while pci_intx() is for manipulating the INTx disable bit on
PCI devices.  The latter is a generic mechanism for preventing PCI
devices from generating INTx, regardless of whether there's a vector
allocated for it.  How does the former replace the latter and why do we
feel the need to deprecate the latter?

It feels like this fits some narrow narrative and makes all users of
these now deprecated functions second class citizens.  Why?  At it's
root these are simply providing mask and set or mask and clear register
bit operations.  Thanks,

Alex
 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/pci/devres.c | 5 ++++-
>  drivers/pci/pci.c    | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 6f8f712fe34e..4c76fc063104 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -435,7 +435,7 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
>  }
>  
>  /**
> - * pcim_intx - managed pci_intx()
> + * pcim_intx - managed pci_intx() (DEPRECATED)
>   * @pdev: the PCI device to operate on
>   * @enable: boolean: whether to enable or disable PCI INTx
>   *
> @@ -443,6 +443,9 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
>   *
>   * Enable/disable PCI INTx for device @pdev.
>   * Restore the original state on driver detach.
> + *
> + * This function is DEPRECATED. Do not use it in new code.
> + * Use pci_alloc_irq_vectors() instead (there is no managed version, currently).
>   */
>  int pcim_intx(struct pci_dev *pdev, int enable)
>  {
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7ce1d0e3a1d5..dc69e23b8982 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4477,11 +4477,14 @@ void pci_disable_parity(struct pci_dev *dev)
>  }
>  
>  /**
> - * pci_intx - enables/disables PCI INTx for device dev
> + * pci_intx - enables/disables PCI INTx for device dev (DEPRECATED)
>   * @pdev: the PCI device to operate on
>   * @enable: boolean: whether to enable or disable PCI INTx
>   *
>   * Enables/disables PCI INTx for device @pdev
> + *
> + * This function is DEPRECATED. Do not use it in new code.
> + * Use pci_alloc_irq_vectors() instead.
>   */
>  void pci_intx(struct pci_dev *pdev, int enable)
>  {


