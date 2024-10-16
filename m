Return-Path: <linux-input+bounces-7489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52C9A04BE
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 10:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC7A61C2235A
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 08:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D40204F78;
	Wed, 16 Oct 2024 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0qtLo/o"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F4720493E
	for <linux-input@vger.kernel.org>; Wed, 16 Oct 2024 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068805; cv=none; b=GJzVpvS1jEWFPztfiW5LzV2+YlPcPDwsNIZCkdQjBnuXOEmLIQZ9g0SYUDvryvlHh/2O1BKtp9oB0Pd1/yDOCxrrYPK2e+i4212n7/E6w9e7em66JCbVvQaDlQ73GneA1/nj3eZAWmyZXhIWQTeVEInvbOwYLK8iuRklgKAO0EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068805; c=relaxed/simple;
	bh=7moOe8UL5Meb+BC0gY7ndfubUporns0eDJleSN460jA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cwIvpLVWkDAEpD73+5BDjrbDqYjpJcKXFL1V4g1YX5XJ80ld3SgRsg7GM+eaXatgtFVuM4zQ8Ko+sjwjSw4m+G+G1TfeLGEIJjtyqxsuakTDVdqljU/kAZzCwH7P9Dxo596W7cxHDiMoaHDU8suY0MiuXfTqiYJPGpZX+pPNZy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0qtLo/o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729068802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7moOe8UL5Meb+BC0gY7ndfubUporns0eDJleSN460jA=;
	b=X0qtLo/of206/I60fg6+8CVSKd8ayAAaSc/uLBuqEJoy0rMotAxkxOWhyNCxIShBNbK+/u
	lz3acTuZ/7HFEFj8jmO/2blCqAu7XAQ11jqFr/Mv8h6lH3sNkXz2AU5t2eBl12uKakkJFx
	YB7k+f21NtDmSioz4fS+olLrvi7S0EQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-1hpldygcNuacIe1WZcUOmA-1; Wed, 16 Oct 2024 04:53:20 -0400
X-MC-Unique: 1hpldygcNuacIe1WZcUOmA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d4a211177so3175981f8f.0
        for <linux-input@vger.kernel.org>; Wed, 16 Oct 2024 01:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729068799; x=1729673599;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7moOe8UL5Meb+BC0gY7ndfubUporns0eDJleSN460jA=;
        b=pdbwg4fEtld/S7KadyPL+dI6iJL9j7fTGdBRaDpnVV1y1Lqp0nd7Jn5uK2p/PWAN9+
         kKk0PdHdOXarJP4cAaeEuS0ZMqKbeXsqwAD3BjW5dSWnion5DfTZf+U8e49E7NLZ9c2/
         Itj0sbsZwQCvQ7pvOKcMTt79aGd5ENvKSeyJ63vzFY+lIntb0d0DhFB6vd7b4sOw4uR9
         ExEO3KFKaNS5xyFZL2GMagW9H6g2HDjpzZm0BQNbboe5O1RlALujmY/7sZ3ztaEWZ+e2
         tY9MS9XYROzMaXLQHw9U2fFSBM+QWSh/yNml0MvNAL41CsaLJF8zBCit6Lx3gKJ3t3gy
         xy+g==
X-Forwarded-Encrypted: i=1; AJvYcCVKTXb4eylEaTARsf+6QeD20kYe9w3uiIGBVIBBT7IkfmW2N4HWv0F5pwhvCPC9F0x3GLPWgI54b3zJLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZfrcg7gKqzkzDPu48JKbdUGGbCNOFkxhr0WW3Bvhx5sog0A5
	agJIdp+GepPQxOHHBCRWscr+9C5GuuZw9ry4psxHVAwmjvAN7nRrwokMW7Ppj/7MAxxvmntVXTF
	gHdGN79u6Teyb7Gu2jAXwJSLEElW7NX6Fb7JuSTvvilmTP25kjRePHVZ7CASx
X-Received: by 2002:a5d:550c:0:b0:37c:fc25:ef39 with SMTP id ffacd0b85a97d-37d86bd470dmr2064093f8f.16.1729068799451;
        Wed, 16 Oct 2024 01:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE813FEz+S0lBaHgTBV6vax4I3zZfvuNTqrbIYEeCSE1sgZYKS0gEVByh3SssZ+D4YfCA6CQQ==
X-Received: by 2002:a5d:550c:0:b0:37c:fc25:ef39 with SMTP id ffacd0b85a97d-37d86bd470dmr2064075f8f.16.1729068798945;
        Wed, 16 Oct 2024 01:53:18 -0700 (PDT)
Received: from dhcp-64-113.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf8143sm3795916f8f.70.2024.10.16.01.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 01:53:18 -0700 (PDT)
Message-ID: <f871a77fb51e54332886882e8ecb1a4a5f5d296b.camel@redhat.com>
Subject: Re: [PATCH 13/13] PCI: Deprecate pci_intx(), pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Alex Williamson
	 <alex.williamson@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
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
 <oleksandr_tyshchenko@epam.com>,  Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>,  Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>,  Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>,  Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>,  Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu
 <yi.l.liu@intel.com>, Christian Brauner <brauner@kernel.org>, Ankit Agrawal
 <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Wed, 16 Oct 2024 10:53:16 +0200
In-Reply-To: <297b5511-8f6a-4798-a2b4-d4c634969aed@gmail.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-14-pstanner@redhat.com>
	 <20241015135336.0de9795e.alex.williamson@redhat.com>
	 <fc7244823a5665d3db40c94aea099a2973032a0b.camel@redhat.com>
	 <297b5511-8f6a-4798-a2b4-d4c634969aed@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-16 at 10:43 +0200, Heiner Kallweit wrote:
> On 16.10.2024 08:57, Philipp Stanner wrote:
> > On Tue, 2024-10-15 at 13:53 -0600, Alex Williamson wrote:
> > > On Tue, 15 Oct 2024 20:51:23 +0200
> > > Philipp Stanner <pstanner@redhat.com> wrote:
> > >=20
> > > > pci_intx() and its managed counterpart pcim_intx() only exist
> > > > for
> > > > older
> > > > drivers which have not been ported yet for various reasons.
> > > > Future
> > > > drivers should preferably use pci_alloc_irq_vectors().
> > > >=20
> > > > Mark pci_intx() and pcim_intx() as deprecated and encourage
> > > > usage
> > > > of
> > > > pci_alloc_irq_vectors() in its place.
> > >=20
> > > I don't really understand this.=C2=A0 As we've discussed previously
> > > pci_alloc_irq_vectors() is, unsurprisingly, for allocating PCI
> > > IRQ
> > > vectors while pci_intx() is for manipulating the INTx disable bit
> > > on
> > > PCI devices.=C2=A0 The latter is a generic mechanism for preventing
> > > PCI
> > > devices from generating INTx, regardless of whether there's a
> > > vector
> > > allocated for it.=C2=A0 How does the former replace the latter and wh=
y
> > > do
> > > we
> > > feel the need to deprecate the latter?
> > >=20
> > > It feels like this fits some narrow narrative and makes all users
> > > of
> > > these now deprecated functions second class citizens.=C2=A0 Why?=C2=
=A0 At
> > > it's
> > > root these are simply providing mask and set or mask and clear
> > > register
> > > bit operations.=C2=A0 Thanks,
> >=20
> > I got the feeling from the RFC discussion that that was basically
> > the
> > consensus: people should use pci_alloc_irq_vectors(). Or did I
> > misunderstand Andy and Heiner?
> >=20
> I think there are two different use cases for pci_intx().
> At first there are several drivers where the direct usage of
> pci_intx()
> can be eliminated by switching to the pci_alloc_irq_vectors() API.
>=20
> And then there's usage of pci_intx() in
> drivers/vfio/pci/vfio_pci_intrs.c
> drivers/xen/xen-pciback/conf_space_header.c
> There we have to keep the (AFAICS unmanaged) pci_intx() calls.

There is also the usage within PCI itself, in MSI. Patch =E2=84=968 touches
that.

It's why I think this series should land before anyone should port
direct pci_intx() users to the irq vectors function, because the latter
also uses pci_intx() and its own devres, which sounds explosive to me.


P.

>=20
> > I'm perfectly happy with dropping this patch and continue offering
> > pci{m}_intx() to users, since after removing that hybrid hazzard I
> > don't see any harm in them anymore.
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Alex
> > > =C2=A0
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > > =C2=A0drivers/pci/devres.c | 5 ++++-
> > > > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0 | 5 ++++-
> > > > =C2=A02 files changed, 8 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> > > > index 6f8f712fe34e..4c76fc063104 100644
> > > > --- a/drivers/pci/devres.c
> > > > +++ b/drivers/pci/devres.c
> > > > @@ -435,7 +435,7 @@ static struct pcim_intx_devres
> > > > *get_or_create_intx_devres(struct device *dev)
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0/**
> > > > - * pcim_intx - managed pci_intx()
> > > > + * pcim_intx - managed pci_intx() (DEPRECATED)
> > > > =C2=A0 * @pdev: the PCI device to operate on
> > > > =C2=A0 * @enable: boolean: whether to enable or disable PCI INTx
> > > > =C2=A0 *
> > > > @@ -443,6 +443,9 @@ static struct pcim_intx_devres
> > > > *get_or_create_intx_devres(struct device *dev)
> > > > =C2=A0 *
> > > > =C2=A0 * Enable/disable PCI INTx for device @pdev.
> > > > =C2=A0 * Restore the original state on driver detach.
> > > > + *
> > > > + * This function is DEPRECATED. Do not use it in new code.
> > > > + * Use pci_alloc_irq_vectors() instead (there is no managed
> > > > version, currently).
> > > > =C2=A0 */
> > > > =C2=A0int pcim_intx(struct pci_dev *pdev, int enable)
> > > > =C2=A0{
> > > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > > index 7ce1d0e3a1d5..dc69e23b8982 100644
> > > > --- a/drivers/pci/pci.c
> > > > +++ b/drivers/pci/pci.c
> > > > @@ -4477,11 +4477,14 @@ void pci_disable_parity(struct pci_dev
> > > > *dev)
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0/**
> > > > - * pci_intx - enables/disables PCI INTx for device dev
> > > > + * pci_intx - enables/disables PCI INTx for device dev
> > > > (DEPRECATED)
> > > > =C2=A0 * @pdev: the PCI device to operate on
> > > > =C2=A0 * @enable: boolean: whether to enable or disable PCI INTx
> > > > =C2=A0 *
> > > > =C2=A0 * Enables/disables PCI INTx for device @pdev
> > > > + *
> > > > + * This function is DEPRECATED. Do not use it in new code.
> > > > + * Use pci_alloc_irq_vectors() instead.
> > > > =C2=A0 */
> > > > =C2=A0void pci_intx(struct pci_dev *pdev, int enable)
> > > > =C2=A0{
> > >=20
> >=20
> >=20
>=20


