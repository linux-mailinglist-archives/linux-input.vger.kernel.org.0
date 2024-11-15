Return-Path: <linux-input+bounces-8113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AB79CDA83
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 09:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D8D9B240D2
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 08:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF121714B3;
	Fri, 15 Nov 2024 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8N1XZMx"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48752189F56
	for <linux-input@vger.kernel.org>; Fri, 15 Nov 2024 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731659546; cv=none; b=h6EJZnOod+OEQz4fplNp/XLd8DW9MRU2rFJJULF5ZTtG+YTBlziampsbYB6oCnWQG53Hfw36IO3hbj18OexDo3IZfL1oU0u5h9RjEUEsyvKRDnl6j/mPZF9Oj5xkBR8epkaTs96mRIzzV7Wu/dqPCDbZ2+j1qFbzIRukRXSbnr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731659546; c=relaxed/simple;
	bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rjYIEpAaU0qWrh3IkZfj5HyshF/X1mvCYZKFxhZy01vA2SpTsvNhVwqJj8PdgG0KHuwtygB03yGZsGFeJmnG/bLHunVvy5/cDYIe8HhNLv8DuBfIM8b5aek2Iwe7ZqARyTgTYueL/YI1mtxgRwFbKG+ew8J4HqqLCTu+mxKBPB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8N1XZMx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731659544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
	b=f8N1XZMxBN9C3i3Z2uPoHDfCCYGDGhzCAwc8eWU9L3bEJYRP8K47Fj5TIp7Hb8FT3efy30
	jPW+tsZVyrCLQy7CjsxUgmhSW+R16/IozujoP39igvyH0jDWjGtdhSrz1o8s2KiEMCu6A6
	hkr63THX/zhIFF9/5ZbE3oPlqWCwAr4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-W_VgVBhmNGmRZqkHS2LIaQ-1; Fri, 15 Nov 2024 03:32:22 -0500
X-MC-Unique: W_VgVBhmNGmRZqkHS2LIaQ-1
X-Mimecast-MFC-AGG-ID: W_VgVBhmNGmRZqkHS2LIaQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3821e0179d1so241479f8f.2
        for <linux-input@vger.kernel.org>; Fri, 15 Nov 2024 00:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731659540; x=1732264340;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
        b=dD9oL2l19J9Ndjs6NLt84NQ9DSN9tUaKisvlzou03Sq6dx/XxZYi8euHBQEios6aqm
         yRn2VEUIksib6HynbSjGssO6gRmcJMm8/q1wp1ZFA9PtgW9foyf+/joS+bYep6xKlK2z
         147vuL+s1e7mWTP4v9GKvnzRRXiVF2Ft0sCH1SxFLuYwQ0Gb721JpNIHUBhOONXWe9zH
         npCc0KLh8sHg2clC5ckfyBG5inwBCE9OcTPr16OCtvpyGKO39V5/YUp1f3lwDy6zXUCh
         lbblbQN/6eNQemPpFNbynbAg1VTZ7SY0LJ4rtrnC0q5JRTH4lSLh4RYTXckVrs2i0Vcn
         baOw==
X-Forwarded-Encrypted: i=1; AJvYcCVTqp9BLM5Mqcc5mQX46uxY2mcOgnBQou4iFjjQn2o5zzRmexIsuuIrcTwHPr+9RCrj3GIzP7/ElfgeXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh42BzudFaSY4fr912cqCQv9YTvGaRoAgz1F6DOw6xO2ksJfmG
	pYYC1v6oK/BHHlsiemVmp5GwkTpUDJqcQc9a8YGGMw/1bxzdYBSbQMvehP8CL5GGxHuELyUWOIi
	rRJlI5ql6skmRL6CPmhQoqtDyhyiFiD4oxcpcVUJmIvK7tjc+/znODBEpho7W
X-Received: by 2002:a5d:64c9:0:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-38225aafc0bmr1382388f8f.52.1731659540184;
        Fri, 15 Nov 2024 00:32:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdh/kmNlYkC/WQKFf2J1h1Btsr4ZUjp0WRHuv0DJX0wKMjNySBXwoM4GCHyqPFiIGeYI7IOw==
X-Received: by 2002:a5d:64c9:0:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-38225aafc0bmr1382314f8f.52.1731659539626;
        Fri, 15 Nov 2024 00:32:19 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2da2sm3716393f8f.15.2024.11.15.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:32:19 -0800 (PST)
Message-ID: <ff7f7358cec4bb03423879a2e4efd16d0a3e8ed7.camel@redhat.com>
Subject: Re: [PATCH v2 11/11] Remove devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>,  Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>, Ricky Wu
 <ricky_wu@realtek.com>,  Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao
 <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kunwu Chan
 <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>, Christian Brauner
 <brauner@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, Eric
 Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2024 09:32:16 +0100
In-Reply-To: <8734jtl3xm.ffs@tglx>
References: <20241113124158.22863-2-pstanner@redhat.com>
	 <20241113124158.22863-13-pstanner@redhat.com> <87msi3ksru.ffs@tglx>
	 <49bb6fc9ebff3cae844da0465ceadeef8d3217c7.camel@redhat.com>
	 <8734jtl3xm.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-11-15 at 01:46 +0100, Thomas Gleixner wrote:
> On Thu, Nov 14 2024 at 10:05, Philipp Stanner wrote:
> > On Wed, 2024-11-13 at 17:22 +0100, Thomas Gleixner wrote:
> > > On Wed, Nov 13 2024 at 13:41, Philipp Stanner wrote:
> > > > pci_intx() is a hybrid function which can sometimes be managed
> > > > through
> > > > devres. This hybrid nature is undesirable.
> > > >=20
> > > > Since all users of pci_intx() have by now been ported either to
> > > > always-managed pcim_intx() or never-managed
> > > > pci_intx_unmanaged(),
> > > > the
> > > > devres functionality can be removed from pci_intx().
> > > >=20
> > > > Consequently, pci_intx_unmanaged() is now redundant, because
> > > > pci_intx()
> > > > itself is now unmanaged.
> > > >=20
> > > > Remove the devres functionality from pci_intx(). Have all users
> > > > of
> > > > pci_intx_unmanaged() call pci_intx(). Remove
> > > > pci_intx_unmanaged().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > > =C2=A0drivers/misc/cardreader/rtsx_pcr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/misc/tifm_7xx1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 +--
> > > > =C2=A0.../net/ethernet/broadcom/bnx2x/bnx2x_main.c=C2=A0 |=C2=A0 2 =
+-
> > > > =C2=A0drivers/net/ethernet/brocade/bna/bnad.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/ntb/hw/amd/ntb_hw_amd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > =C2=A0drivers/ntb/hw/intel/ntb_hw_gen1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > =C2=A0drivers/pci/msi/api.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/msi/msi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 43 +----------
> > > > ----
> > > > ----
> > > > =C2=A0drivers/vfio/pci/vfio_pci_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/vfio/pci/vfio_pci_intrs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++---
> > > > =C2=A0drivers/xen/xen-pciback/conf_space_header.c=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > > > =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > > > =C2=A014 files changed, 22 insertions(+), 62 deletions(-)
> > >=20
> > > Now I'm utterly confused. This undoes the pci_intx_unmanaged()
> > > churn
> > > which you carefully split into several patches first.
> >=20
> > Have you read the email I have linked?
> >=20
> > There is also the cover-letter (does anyone in the community ever
> > read
> > those?) which explicitly states:
> >=20
> > "Patch "Remove devres from pci_intx()" obviously reverts the
> > previous
> > patches that made drivers use pci_intx_unmanaged(). But this way
> > it's
> > easier to review and approve. It also makes sure that each checked
> > out
> > commit should provide correct behavior, not just the entire series
> > as a
> > whole."
>=20
> I read it and I assume your intention was to force an eye on every
> use
> case of pci_intx() and not just on those which need to be converted
> to
> pcim_intx().
>=20
> I'm not convinced that this is needed, but fair enough.

Whether pcim_enable_device() is really not used could have been
overlooked, or the driver could move to "managed mode" in parallel for
v6.13 for example. Then a bug would be silently introduced into those
drivers.

Besides, me touching pci_intx() unfortunately caused a few explosions
in the past already, in

fc8c818e756991f5f50b8dfab07f970a18da2556 and
00f89ae4e759a7eef07e4188e1534af7dd2c7e9c

So this time I prefer to be rather safe than sorry.


BTW, if you can review the MSI patch and check whether removing devres
from there really is fine, that would be helpful.


Regards,
P.


