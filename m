Return-Path: <linux-input+bounces-7365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A36BD99A3AD
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 14:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2257A1F22869
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 12:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A925B21731B;
	Fri, 11 Oct 2024 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZsmP0WJv"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED31BE857
	for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648974; cv=none; b=AmD63Win2dwGhBO4QZm8zq9tPxT5575X1ar7Yc0xrwDdoY/AqyzFE4vlioLK16YZiY7b/Q8ueVFHgZlnCNvHGJVzscaPSP21Pwp1uDkppfjaI6U8ZVhk9wCb/SmhJKK3aEay/fFLEC19UlWanl4SBoYUurqITdStP9qIvnug0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648974; c=relaxed/simple;
	bh=Ua4saN/auvT/81KeOxYQZAnafhhGA0y+W7JZWy3BjS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LUowh+7tniwjYCNhvxJI8jexVrpZSLM4yvLRazLhTvoTYEjxmOF4dogyeT9UcO+tDPb1s/COd2y3LYRfExlBtiHBoZWgOYbGT8A+hzsqw2PJPGGV+iFN/EdXgmawwijcpYcta4xH0p39kT+FA5H5hDl5fQW/daBRaY1msTOfdR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZsmP0WJv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728648971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3YR/eN7EDVZPnEUtVVl/DT7O1jzPEky1m6YBwoyhuE=;
	b=ZsmP0WJvWW9igs9wdCLZ17nJ3zFMiUK054b3NgBAzVFAtgVURyVx467x7F9qMAzFs77STb
	SIFCKWgh6uaPSNSqDL/sHY+peKg8z/hYssIc70UGCJEymjmYB7VackXQThnpOgcLCkzeGI
	CUQJ7j684rjqTxfDPT3zX5Ed2AuNT4w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-Sc8AA-yTN0aAk3HUBlYuJQ-1; Fri, 11 Oct 2024 08:16:10 -0400
X-MC-Unique: Sc8AA-yTN0aAk3HUBlYuJQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb635b108so12315645e9.2
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 05:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648969; x=1729253769;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3YR/eN7EDVZPnEUtVVl/DT7O1jzPEky1m6YBwoyhuE=;
        b=HSIB6CIlIUfX/P3pVOHdH1tN+mPe3TX0redq/lg5eOs8W/Fqf3nDNqapljuVkYFogj
         gyfWAkEmr12KK5SvgM3RNLNOXTpm8WKhfFOTxeNSB7D+Rukal208lTJ9yPAjnnWA4wph
         wJFl4OewoCELHuZes1Ptapq+oZM+EbSESQXqIavVPTVrJVUzXJRunx6jI6H1wR9fxCsP
         dKxWdsypl/e3j/+5NykV8AZ1DVVrmjpw4btIWmL1ru6yvOLs05ztzXwAPpzPhPluviCA
         rCjYNvz8BGkaB3UBm/eQMHLmtxKEzwP1czxAo4Y//f1TbhCAWxslERfrlK3Vq4XLWRnZ
         4ToA==
X-Forwarded-Encrypted: i=1; AJvYcCXsTTzvh43CZhOoZ3v5H3P/MhUxUBO2sQhHpinMhrD9menDcjpIrophr/PVdNsFm2fS+MRGBO8mGj2t3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3I01XZ5is+/g7BZ3UxwurUK3yIJqvWS1ucyTt+DJ2NFWqalS
	IavJz5AdGBtjppXtWauYaxtjPSVEEI7ubRGtvh9LZb/FFVDyesBeIC9yyw7a5I6fp1ybaNrbgqW
	JutcrV+rLweXJUKaCqWAixIfidP7RZJdmuzqntnEzU9czxg0s3MMW/IiIyYhF
X-Received: by 2002:a05:600c:1d0e:b0:42c:b2fa:1c0a with SMTP id 5b1f17b1804b1-4311df429c8mr19539145e9.23.1728648969394;
        Fri, 11 Oct 2024 05:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ7w0P8euwuh1uWsgO1hBzdaK+5QHv+AFGT0Iwx99lPo3ic55Ocuel+lqlVPvlsAnC7ezD6A==
X-Received: by 2002:a05:600c:1d0e:b0:42c:b2fa:1c0a with SMTP id 5b1f17b1804b1-4311df429c8mr19538645e9.23.1728648968995;
        Fri, 11 Oct 2024 05:16:08 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d05:4700:3e59:7d70:cabd:144b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf4841asm73010925e9.19.2024.10.11.05.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:16:08 -0700 (PDT)
Message-ID: <f65e9fa01a1947782fc930876e5f84174408db67.camel@redhat.com>
Subject: Re: [RFC PATCH 01/13] PCI: Prepare removing devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Hannes Reinecke <hare@suse.de>, John Garry
 <john.g.garry@oracle.com>, Soumya Negi <soumya.negi97@gmail.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-input@vger.kernel.org,
 netdev@vger.kernel.org,  linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-staging@lists.linux.dev, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Fri, 11 Oct 2024 14:16:06 +0200
In-Reply-To: <ZwfnULv2myACxnVb@smile.fi.intel.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-2-pstanner@redhat.com>
	 <ZwfnULv2myACxnVb@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-10-10 at 17:40 +0300, Andy Shevchenko wrote:
> On Wed, Oct 09, 2024 at 10:35:07AM +0200, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which sometimes performs devres
> > operations, depending on whether pcim_enable_device() has been used
> > to
> > enable the pci_dev. This sometimes-managed nature of the function
> > is
> > problematic. Notably, it causes the function to allocate under some
> > circumstances which makes it unusable from interrupt context.
> >=20
> > To, ultimately, remove the hybrid nature from pci_intx(), it is
> > first
> > necessary to provide an always-managed and a never-managed version
> > of that function. Then, all callers of pci_intx() can be ported to
> > the
> > version they need, depending whether they use pci_enable_device()
> > or
> > pcim_enable_device().
> >=20
> > An always-managed function exists, namely pcim_intx(), for which
> > __pcim_intx(), a never-managed version of pci_intx() had been
> > implemented.
>=20
> > Make __pcim_intx() a public function under the name
> > pci_intx_unmanaged(). Make pcim_intx() a public function.
>=20
> To avoid an additional churn we can make just completely new APIs,
> namely:
> pcim_int_x()
> pci_int_x()
>=20
> You won't need all dirty dances with double underscored function
> naming and
> renaming.

=C3=84hm.. I can't follow. The new version doesn't use double underscores
anymore. __pcim_intx() is being removed, effectively.
After this series, we'd end up with a clean:

	pci_intx() <-> pcim_intx()

just as in the other PCI APIs.


>=20
>=20
> ...
>=20
> > +	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> > +
> > +	if (enable)
> > +		new =3D pci_command & ~PCI_COMMAND_INTX_DISABLE;
> > +	else
> > +		new =3D pci_command | PCI_COMMAND_INTX_DISABLE;
> > +
> > +	if (new !=3D pci_command)
>=20
> I would use positive conditionals as easy to read (yes, a couple of
> lines
> longer, but also a win is the indentation and avoiding an additional
> churn in
> the future in case we need to add something in this branch.

I can't follow. You mean:

if (new =3D=3D pci_command)
    return;

?

That's exactly the same level of indentation. Plus, I just copied the
code.

>=20
> > +		pci_write_config_word(pdev, PCI_COMMAND, new);
>=20
> ...
>=20
> Otherwise I'm for the idea in general.

\o/

>=20


