Return-Path: <linux-input+bounces-7256-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8EC998E92
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 19:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD951C2378F
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 17:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A17B1CDA2F;
	Thu, 10 Oct 2024 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1tCJDMG"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDB219D880
	for <linux-input@vger.kernel.org>; Thu, 10 Oct 2024 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728582202; cv=none; b=OSOkIwr4N7GMANgL2jCWTrQI+L85Cq6dEKe2DBJ1NLVEX/j/63zDVns/lmEw/tsiYEeV2nMbxxogMo8Bx7a3QaFIwpIXetlpRI7g01D3X/mCQDGnrsrZbjbFiXM+Hp/40cmtYcDBzsVxG95Cl+v9YUGw+3VdwCGcHsL+zljsTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728582202; c=relaxed/simple;
	bh=VkW56jTE0kaiaQu6sdNA9gReyPzVF9DBS+DAGqaddq8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uelFecBv+J9RejphImGn7qIqwsm4yWsjeps4bXO5FlZ414IhfReWp/koJDCWROCstFQbmgiuyKtGHPOz8jkKXq1/XiCAx5FdsNJM8vdbcN6HCj1gY1VafSe+/C6XJ6iRNqU00sa7vKE3rLK1uB3JcT3Oohapc4/x6X692p5Q4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1tCJDMG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728582199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irpjS10coO2t0wwvE3gFasz0R9ftgsaNlPSsljy/7YU=;
	b=A1tCJDMGQoLe7VUEs9vHqF30dovrkJbz1ec1QtVFo5AMOd4G7F+QL6W4KZCTAgAF2uhic4
	eLov1JvrxtfdSdeyMfvH4i4tcNFmwcuiNOU3gz3ldIfI8UNBS7B5hpg4YJlyQBVYtcGNOu
	0varpCNPYSfOuMBT7QzISA8diDSLL5o=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-Ji1DjSh1OfiubvyuC268HQ-1; Thu, 10 Oct 2024 13:43:18 -0400
X-MC-Unique: Ji1DjSh1OfiubvyuC268HQ-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8354906b28bso17258039f.3
        for <linux-input@vger.kernel.org>; Thu, 10 Oct 2024 10:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728582198; x=1729186998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irpjS10coO2t0wwvE3gFasz0R9ftgsaNlPSsljy/7YU=;
        b=MMB5j5v0eNRwGljjDZCXIt9eEjajdi2nbDFcVuvtu4/w020Y6VFIj/saKtqL34caH3
         b5H7cKTjk1hDb29BgKb37ZRDJjBpHCWEYeB8FeX5laFQqQEe8EWXu4Cvxfm7BkNx3+OH
         MeocKnpKEzhHFumLwdj4Nhyxp/Cs2fbYtn05XgOmt1GZOfN5WIMQ0TKA5msmMXekriNE
         /zAy8+tM05dnanwXwudUHIeDVbV23qQ6eQLkvsXvbeT24b1PrpF1SOroAiYGaBmsyiGA
         qKl8v9ZzFVMS80P1r74EOpoh47Mzw5PZ8bcTJx2AROKDsLL8nnc/itmKJxzlqTP+n9+n
         kaCA==
X-Forwarded-Encrypted: i=1; AJvYcCVdn4JuoWqvc1R9YuuIdhPt6XwvJ55SV177ljY3SuyKBhTAJIt1AypQiZPfS6UVvjodkkIAbhFlI5n+Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLrkHWtAEnr1RNajuTtnAqFNrfq61uDMomNDJIcGGUc8heNIqc
	nUzB27+HjMkZOXA9S+0YOkB1t3vMKuVkvE9IFVqBeJrfR7ZMD+sX8nqI9DmXnKHQOjWGNw1fjAu
	FvhgKrDYhpSX23rkT7mRjxl5Ia1qSoBPjBdcVVQPENb0DWB+CytLpQIgnXh52
X-Received: by 2002:a05:6e02:1c46:b0:3a0:a1ab:7ce6 with SMTP id e9e14a558f8ab-3a397cdda26mr18750885ab.1.1728582197760;
        Thu, 10 Oct 2024 10:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaLJzsYWJH/NUMC+IMyT+j/CP16HRwxWkCBGHxtTft8rw7tBisUdCTh60bMs+LHrYbLbadmw==
X-Received: by 2002:a05:6e02:1c46:b0:3a0:a1ab:7ce6 with SMTP id e9e14a558f8ab-3a397cdda26mr18750415ab.1.1728582197304;
        Thu, 10 Oct 2024 10:43:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbadaa9f67sm322910173.153.2024.10.10.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 10:43:16 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:43:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Sergey Shtylyov
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
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi
 Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Eric Auger
 <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org,
 linux-staging@lists.linux.dev, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [RFC PATCH 13/13] Remove devres from pci_intx()
Message-ID: <20241010114314.296db535.alex.williamson@redhat.com>
In-Reply-To: <f42bb5de4c9aca307a3431dd15ace4c9cade1cb9.camel@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	<20241009083519.10088-14-pstanner@redhat.com>
	<7f624c83-115b-4045-b068-0813a18c8200@stanley.mountain>
	<f42bb5de4c9aca307a3431dd15ace4c9cade1cb9.camel@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Oct 2024 11:11:36 +0200
Philipp Stanner <pstanner@redhat.com> wrote:

> On Thu, 2024-10-10 at 11:50 +0300, Dan Carpenter wrote:
> > On Wed, Oct 09, 2024 at 10:35:19AM +0200, Philipp Stanner wrote: =20
> > > pci_intx() is a hybrid function which can sometimes be managed
> > > through
> > > devres. This hybrid nature is undesirable.
> > >=20
> > > Since all users of pci_intx() have by now been ported either to
> > > always-managed pcim_intx() or never-managed pci_intx_unmanaged(),
> > > the
> > > devres functionality can be removed from pci_intx().
> > >=20
> > > Consequently, pci_intx_unmanaged() is now redundant, because
> > > pci_intx()
> > > itself is now unmanaged.
> > >=20
> > > Remove the devres functionality from pci_intx(). Remove
> > > pci_intx_unmanaged().
> > > Have all users of pci_intx_unmanaged() call pci_intx().
> > >=20
> > > Signed-off-by: Philipp Stanner <pstanner@redhat.com> =20
> >=20
> > I don't like when we change a function like this but it still
> > compiles fine.
> > If someone is working on a driver and hasn't pushed it yet, then it's
> > probably
> > supposed to be using the new pcim_intx() but they won't discover that
> > until they
> > detect the leaks at runtime. =20
>=20
> There wouldn't be any *leaks*, it's just that the INTx state would not
> automatically be restored. BTW the official documentation in its
> current state does not hint at pci_intx() doing anything automatically,
> but rather actively marks it as deprecated.
>=20
> But you are right that a hypothetical new driver and OOT drivers could
> experience bugs through this change.
>=20
> >=20
> > Why not leave the pci_intx_unmanaged() name.=C2=A0 It's ugly and that w=
ill
> > discorage
> > people from introducing new uses. =20
>=20
> I'd be OK with that. Then we'd have to remove pci_intx() as it has new
> users anymore.
>=20
> Either way should be fine and keep the behavior for existing drivers
> identical.
>=20
> I think Bjorn should express a preference

FWIW, I think pcim_intx() and pci_intx() align better to our naming
convention for devres interfaces.  Would it be sufficient if pci_intx()
triggered a WARN_ON if called for a pci_is_managed() device?  Thanks,

Alex


