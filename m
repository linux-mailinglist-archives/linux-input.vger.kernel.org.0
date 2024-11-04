Return-Path: <linux-input+bounces-7848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD49BAF97
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 10:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 574CEB214D8
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B271AD3E1;
	Mon,  4 Nov 2024 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hs7Ppm7w"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ABD1AC458
	for <linux-input@vger.kernel.org>; Mon,  4 Nov 2024 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712419; cv=none; b=SkuBw9jPJ5kyrl2byJKcP6moBLr/e/xq+zHsUOlio2sP8Hy57lOHmKj40sdlk/2UROI8HoAVQbgprZl8A8MrHoX1zo/zGh7xIecMT8zEXO69SMxS4MfkYr0YkI5I8xSGwpbIQgzKvo/M6qrRjwUuKHAYUBXAKOIs2JCYdf/NecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712419; c=relaxed/simple;
	bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q+Wap/Mri/ThOu1eEwhOmyCCflaqN7kH1m8lWiIruZh251B7DWg70SXHw3c6cXpBn7ISMTPITTDFz8mjrDc/eBu6oeVQMUMjiGZmdSvgn7NWQNmmtFlAAP4FoGqGgT6kc0JDB5ZlooO9zxIlQwafMfbNdVtCkizAGJvBiU1+dHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hs7Ppm7w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730712417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
	b=hs7Ppm7wXaEwXylZk3WlnuRhOBVi9EZFeFaHA5C2kpvSH/VjkVm6K0TiNsnRe0z8Kj9ISO
	QeHbTMdAtNM8OMz7ZsX56g97CaQyWzdOZ7ETkNzghr2NW+8F20RyIMZTCqi56KBYvwZI4U
	2b2TxZfnuV5aUNIoqBdGJ9P5nVrVU+4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-A2OtGrYyPhyc9_haQRqj4w-1; Mon, 04 Nov 2024 04:26:55 -0500
X-MC-Unique: A2OtGrYyPhyc9_haQRqj4w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d5a3afa84so1946244f8f.3
        for <linux-input@vger.kernel.org>; Mon, 04 Nov 2024 01:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712415; x=1731317215;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7ueN/LQ529FLGouL/3BXVgrjx8tY87847WIrlhrom4=;
        b=jBYnGQiM79dd1gu7b0MK4RGcaevXMVtRccvuvSmZ8KlyIG/SnfhGQI0MpGyh4S3xxE
         RfG3pdOoKoSUBoGZ96jJ/Nupn1mLl9ZnjILw6XW3YibXm04neexofsG2RE4jClj1JQLC
         cFQXbNJM5mFzUgt/4qLWKYPTQe11C+Iy4IY8Ykypz7aIwjmHsIXBniT3WvzT7ZiVpxrv
         rdVw41U8k7L5VbL9ktXofKFe3KMhzAkSaWDQWkP6uBlKZpb1ft/vvEQtP8g3vCvgq0pq
         hWtFdW8Dxkix4FBiYPSfkvf6KeJbxZJ1pcCAaQzfy8Ieos43VAKI5N8mtscN5+/KtXsc
         wMWw==
X-Forwarded-Encrypted: i=1; AJvYcCVlztDTaOMiW5diILV6YYDh+unC5gaK12Amw6AUhHLxVvbaHHR6XOsIZv7D3N/oQDZcev3HrfEsUqeIIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17TWTREYJROX4ERjU/ieEe0hebHaQwOHp5HBoy2FH4DtneVeS
	0sLbimL/dmDdJ0HudchUSvCSV6uvvoaBZqjB76GdcPHXyFUFpV+KjmlZpo7viFAFfYN8nRFnj0t
	ANWesvDXrB9eaoJUPWmAAnHK5wz7769jWE2U817/gV2t58AZ9Qe4DSrobHWvK
X-Received: by 2002:a5d:5f54:0:b0:37d:373c:ed24 with SMTP id ffacd0b85a97d-381c7a3a49cmr8192664f8f.4.1730712414702;
        Mon, 04 Nov 2024 01:26:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUG4i3r4RT/0mDz+U1cY7m40dZcu2ijC6eEouX1uNQBldOHTZd5hoduIq2TUsnjYO3wLrnew==
X-Received: by 2002:a5d:5f54:0:b0:37d:373c:ed24 with SMTP id ffacd0b85a97d-381c7a3a49cmr8192628f8f.4.1730712414212;
        Mon, 04 Nov 2024 01:26:54 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f? (200116b82d7fe40007f8722cbb2ebb7f.dip.versatel-1u1.de. [2001:16b8:2d7f:e400:7f8:722c:bb2e:bb7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7d20sm12817150f8f.7.2024.11.04.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:26:53 -0800 (PST)
Message-ID: <a8d9f32f60f55c58d79943c4409b8b94535ff853.camel@redhat.com>
Subject: Re: [PATCH 01/13] PCI: Prepare removing devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Dubov <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mostafa Saleh <smostafa@google.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Christian
 Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, Eric Auger
 <eric.auger@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>, Ye
 Bin <yebin10@huawei.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Mon, 04 Nov 2024 10:26:51 +0100
In-Reply-To: <87cyjgwfmo.ffs@tglx>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-2-pstanner@redhat.com> <87cyjgwfmo.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-10-31 at 14:45 +0100, Thomas Gleixner wrote:
> On Tue, Oct 15 2024 at 20:51, Philipp Stanner wrote:
> > +/**
> > + * pci_intx - enables/disables PCI INTx for device dev, unmanaged
> > version
>=20
> mismatch vs. actual function name.

ACK, will fix

>=20
> > + * @pdev: the PCI device to operate on
> > + * @enable: boolean: whether to enable or disable PCI INTx
> > + *
> > + * Enables/disables PCI INTx for device @pdev
> > + *
> > + * This function behavios identically to pci_intx(), but is never
> > managed with
> > + * devres.
> > + */
> > +void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
>=20
> This is a misnomer. The function controls the INTX_DISABLE bit of a
> PCI device. Something like this:
>=20
> void __pci_intx_control()
> {
> }
>=20
> static inline void pci_intx_enable(d)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __pci_intx_control(d, true);
> }
>=20
> .....
>=20
> makes it entirely clear what this is about.

Well, I would agree if it were about writing a 'real' new function. But
this is actually about creating a _temporary_ function which is added
here and removed again in patch 12 of this same series.

It wouldn't even be needed; the only reason why it exists is to make it
easy for the driver maintainers concerned by patches 2-11 to review the
change and understand what's going on. Hence it is
"pci_intx_unmanaged()" =3D=3D "Attention, we take automatic management away
from your driver"

pci_intx() is then fully restored after patch 12 and it keeps its old
name.

Gr=C3=BC=C3=9Fe,
Philipp


>=20
> Hmm?
>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20


