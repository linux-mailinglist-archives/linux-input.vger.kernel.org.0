Return-Path: <linux-input+bounces-7681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6AC9ADE5F
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 10:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A674A1F22A0C
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 08:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4C05258;
	Thu, 24 Oct 2024 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAWh/hQk"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B7189F4B
	for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729756995; cv=none; b=gLtH+sczUfGo3i2paScLbDkD1DNFWZlUsD6PHVmgZxtRmi8539rWb8/WDW9bXhiHCbWAYNLvypnbjrfYO2GThi/L2wWXxf8IXBmnumMJelF/1pBhUN+LzqEXrgx6zIXTITO4AtmZVc0qdUoiUYCRnBKiSBfrtdlYru7sbahEdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729756995; c=relaxed/simple;
	bh=Q1kfe1t0sp4jY5sNXXPh9kCYnsSIp6kXPNBXZwj0GiI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tr+GjElJDQi14sekVn+DZAdr4wHqKl65lA5uDlAMzA+BnFV4rz9HVVI4evg5j0UJY6bf+B4LcDXYneOr9Gbkq7i8LVRmzcIorhGw7s6Dis2UmDNHZgntGsDRO8HgSGWG+LG/OeaAE4+29uh7/twC5hZJRpDb/EChnrNKuBOYaVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAWh/hQk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729756992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCHAxEtiIjB9/eMXdwm4L84xFlQFaCf3ZNV6cwdqU9g=;
	b=DAWh/hQkLYixjlBwgOo+dDn6feqML1opewPtY1waQA8RUq83yylOsXcVRdFamezniO0URN
	buGBpXnRRE+YFr7ykvuorxO8v3Y94XJNfTNeKDeu+63pUW3yuAI50vszQg4rpYtoRN+Egk
	pxLJQPGIBGkv9vYd1HzjKJRKd7gIvgM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-HBJpUcl3P_eGeloR5pIcEw-1; Thu, 24 Oct 2024 04:03:10 -0400
X-MC-Unique: HBJpUcl3P_eGeloR5pIcEw-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-71817451e83so682950a34.0
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 01:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729756989; x=1730361789;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eCHAxEtiIjB9/eMXdwm4L84xFlQFaCf3ZNV6cwdqU9g=;
        b=uLEP5AFXppm2LYswJqk7inYgjv4X5wsgcWLxJSYjEiw1E6fTgIU0K+8RAW9t1C9Ye9
         efFrWniGhwwepdKEDCz9/pyRuuTftdHdMJ0m4uf/ZeuuHESIaS/JiyEPhaMAyFm1dC+Z
         ZeHc4MKG33rANJiv+YscwaaKWKYnZMvgK2BvefsEFlXrLxEtf5iehJDibc0lpN+dokko
         3i8wR1R9DMh5fSdlHaETRN8VnURGj90Xm6IUnisHKDm34lZExlqDpIT7ZdpDeL+Ss66d
         A19UAUQ7YSWqqmwbMqsV1JAddh3nMGwQOK7L5Ewjgq61J1maGF6RUL7qsNs3+4F5sOF4
         XZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFj4ioTsqsbUXtiFg1lncgAMxNUx/ltGL6PbBrNklne5QHn7S71BYqpQmWmzO7kceE5WWWgmw/8BPNpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXgmohdsYhqwfszNh7u+FSjXk4JDFgTV0VsENjTIA5ObwXuNu
	EjYt7Nj+pmdV6geF0zV7/Ai24V7qR/bNST8ryMdZ4wMmBHXYuwjUoT0xzjDVVV3yd9SSgm/4+Jb
	qSbEAEO3svRWV2tMmsrD1b/j3olCSa37vQBFl0KLl+9iMalRZWWUvVJf9ibL5
X-Received: by 2002:a05:6830:6dc7:b0:718:c0d:6bdb with SMTP id 46e09a7af769-718598599b9mr736369a34.20.1729756989545;
        Thu, 24 Oct 2024 01:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVwKg5C+Tp+G04yjB73N1UyaDqsdgqmmyDICp7Nqm80mYC6tnNIzWvedx2PALg7dJ9abA7Jw==
X-Received: by 2002:a05:6830:6dc7:b0:718:c0d:6bdb with SMTP id 46e09a7af769-718598599b9mr736305a34.20.1729756989132;
        Thu, 24 Oct 2024 01:03:09 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce0099a79fsm47100376d6.90.2024.10.24.01.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:03:08 -0700 (PDT)
Message-ID: <aec23bb79b9ff7dd7f13eb67460e0605eac22912.camel@redhat.com>
Subject: Re: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of
 pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
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
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu
 <yi.l.liu@intel.com>,  Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
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
Date: Thu, 24 Oct 2024 10:02:59 +0200
In-Reply-To: <87ttd2276j.wl-tiwai@suse.de>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-3-pstanner@redhat.com> <87v7xk2ps5.wl-tiwai@suse.de>
	 <6f3db65fe9a5dcd1a7a8d9bd5352ecb248ef57b1.camel@redhat.com>
	 <87ttd2276j.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-23 at 17:03 +0200, Takashi Iwai wrote:
> On Wed, 23 Oct 2024 15:50:09 +0200,
> Philipp Stanner wrote:
> >=20
> > On Tue, 2024-10-22 at 16:08 +0200, Takashi Iwai wrote:
> > > On Tue, 15 Oct 2024 20:51:12 +0200,
> > > Philipp Stanner wrote:
> > > >=20
> > > > pci_intx() is a hybrid function which can sometimes be managed
> > > > through
> > > > devres. To remove this hybrid nature from pci_intx(), it is
> > > > necessary to
> > > > port users to either an always-managed or a never-managed
> > > > version.
> > > >=20
> > > > hda_intel enables its PCI-Device with pcim_enable_device().
> > > > Thus,
> > > > it needs
> > > > the always-managed version.
> > > >=20
> > > > Replace pci_intx() with pcim_intx().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > > =C2=A0sound/pci/hda/hda_intel.c | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/sound/pci/hda/hda_intel.c
> > > > b/sound/pci/hda/hda_intel.c
> > > > index b4540c5cd2a6..b44ca7b6e54f 100644
> > > > --- a/sound/pci/hda/hda_intel.c
> > > > +++ b/sound/pci/hda/hda_intel.c
> > > > @@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx
> > > > *chip,
> > > > int do_disconnect)
> > > > =C2=A0	}
> > > > =C2=A0	bus->irq =3D chip->pci->irq;
> > > > =C2=A0	chip->card->sync_irq =3D bus->irq;
> > > > -	pci_intx(chip->pci, !chip->msi);
> > > > +	pcim_intx(chip->pci, !chip->msi);
> > > > =C2=A0	return 0;
> > > > =C2=A0}
> > > > =C2=A0
> > >=20
> > > Hm, it's OK-ish to do this as it's practically same as what
> > > pci_intx()
> > > currently does.=C2=A0 But, the current code can be a bit inconsistent
> > > about
> > > the original intx value.=C2=A0 pcim_intx() always stores !enable to
> > > res->orig_intx unconditionally, and it means that the orig_intx
> > > value
> > > gets overridden at each time pcim_intx() gets called.
> >=20
> > Yes.
> >=20
> > >=20
> > > Meanwhile, HD-audio driver does release and re-acquire the
> > > interrupt
> > > after disabling MSI when something goes wrong, and pci_intx()
> > > call
> > > above is a part of that procedure.=C2=A0 So, it can rewrite the
> > > res->orig_intx to another value by retry without MSI.=C2=A0 And after
> > > the
> > > driver removal, it'll lead to another state.
> >=20
> > I'm not sure that I understand this paragraph completely. Still,
> > could
> > a solution for the driver on the long-term just be to use
> > pci_intx()?
>=20
> pci_intx() misses the restore of the original value, so it's no
> long-term solution, either.

Sure that is missing =E2=80=93 I was basically asking whether the driver co=
uld
live without that feature.

Consider that point obsolete, see below

>=20
> What I meant is that pcim_intx() blindly assumes the negative of the
> passed argument as the original state, which isn't always true.=C2=A0 e.g=
.
> when the driver calls it twice with different values, a wrong value
> may be remembered.

Ah, I see =E2=80=93 thoguh the issue is when it's called several times with=
 the
*same* value, isn't it?

E.g.

pcim_intx(pdev, 1); // 0 is remembered as the old value
pcim_intx(pdev, 1); // 0 is falsely remembered as the old value

Also, it would seem that calling the function for the first time like
that:

pcim_intx(pdev, 0); // old value: 1

is at least incorrect, because INTx should be 0 per default, shouldn't
it? Could then even be a 1st class bug, because INTx would end up being
enabled despite having been disabled all the time.

>=20
> That said, I thought of something like below.

At first glance that looks like a good idea to me, thanks for working
this out!

IMO you can submit that as a patch so we can discuss it separately.

Greetings,
Philipp

>=20
>=20
> thanks,
>=20
> Takashi
>=20
> -- 8< --
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -438,8 +438,17 @@ static void pcim_intx_restore(struct device
> *dev, void *data)
> =C2=A0	__pcim_intx(pdev, res->orig_intx);
> =C2=A0}
> =C2=A0
> -static struct pcim_intx_devres *get_or_create_intx_devres(struct
> device *dev)
> +static void save_orig_intx(struct pci_dev *pdev)
> =C2=A0{
> +	u16 pci_command;
> +
> +	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> +	res->orig_intx =3D !(pci_command & PCI_COMMAND_INTX_DISABLE);
> +}
> +
> +static struct pcim_intx_devres *get_or_create_intx_devres(struct
> pci_dev *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> =C2=A0	struct pcim_intx_devres *res;
> =C2=A0
> =C2=A0	res =3D devres_find(dev, pcim_intx_restore, NULL, NULL);
> @@ -447,8 +456,10 @@ static struct pcim_intx_devres
> *get_or_create_intx_devres(struct device *dev)
> =C2=A0		return res;
> =C2=A0
> =C2=A0	res =3D devres_alloc(pcim_intx_restore, sizeof(*res),
> GFP_KERNEL);
> -	if (res)
> +	if (res) {
> +		save_orig_intx(pdev);
> =C2=A0		devres_add(dev, res);
> +	}
> =C2=A0
> =C2=A0	return res;
> =C2=A0}
> @@ -467,11 +478,10 @@ int pcim_intx(struct pci_dev *pdev, int enable)
> =C2=A0{
> =C2=A0	struct pcim_intx_devres *res;
> =C2=A0
> -	res =3D get_or_create_intx_devres(&pdev->dev);
> +	res =3D get_or_create_intx_devres(pdev);
> =C2=A0	if (!res)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	res->orig_intx =3D !enable;
> =C2=A0	__pcim_intx(pdev, enable);
> =C2=A0
> =C2=A0	return 0;
>=20


