Return-Path: <linux-input+bounces-3521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670C8BD6FD
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5031F220DA
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D0D15B57D;
	Mon,  6 May 2024 21:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IowHurbd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E727269;
	Mon,  6 May 2024 21:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032345; cv=none; b=eYZRhfkTCut+M8M86OtTFYUEVkL4i38kbB3Nqrik5S/Wvn+b3XqzYA5po1sS2Wh/2GDzQfoY0NRl+cFl7EhyMxDdG2RXnWCc+Uc9sz5aFEZhjqicon0aUqKAQJefq1CbUADyM9hnEC6rP0BhC/aT9vuVf3EZmr2MTCaYo8mn4K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032345; c=relaxed/simple;
	bh=BPrmCFqXtPEO1acXe62yITzXDjWL5bqKkX/XD8Q/GbM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=thZpJtqi1UTFtWDpaCTbCqHyQKeVkIoMT7I7/YdK8znvTusFaSUCIC4AOdVlP46SbWQ68p+GKc+WD0IePTOk0iq497SHQQB9EUXJI4Ci/7CHICBdSoZtwG5Ru/Ucew4PQAgNQlsrFpMBvj5pbF2CGUMffF4+EpY3T9x9ckO6U9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IowHurbd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715032344; x=1746568344;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=BPrmCFqXtPEO1acXe62yITzXDjWL5bqKkX/XD8Q/GbM=;
  b=IowHurbd1E3FDN2MgzGvDZm7DWPdYodiKt4PVB5rbIR2CMtqjehwMGbw
   lsXQ8QWGGMLB6ctnYPAxL9FFpeFPsv0bA/+qbNjUJ7TeDpR2DBqsMy0uW
   KykJVYg/ndAP+vr0kQM5sJhp06sbVxA7WzlkatbRv9lbOAolk6+savn+X
   fjLovjUYOJ4XrVg16YXDUEq1zF2QYvdQt1ekn7ufd0YLoyfPPoJFR5e7S
   npgy6fdOHTAGP72fSU91RmkZgaVlVPKSXO7fMuj78ov8pnF/GttvEhtql
   eYMaKVsKqXjXQMGfdxqs35GnloI7xsyZDWUJ1ny/IMVTQs3yLpMW8F732
   A==;
X-CSE-ConnectionGUID: 6sbdjl75T5S2svmOxvC7ww==
X-CSE-MsgGUID: fCD6D/EfT/+DoEY1MyzeHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10676304"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="10676304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 14:52:24 -0700
X-CSE-ConnectionGUID: YeAAWZ6qSLmJtMaerwbNeA==
X-CSE-MsgGUID: QTTafSZiQJ+oxSZrDSFWjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="28279688"
Received: from penghsia-mobl.amr.corp.intel.com (HELO spandruv-desk1.amr.corp.intel.com) ([10.209.82.93])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 14:52:23 -0700
Message-ID: <5523c4770ce2de9e804a3020e0bd5c60fb401fc2.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add check for
 pci_alloc_irq_vectors
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Chen Ni <nichen@iscas.ac.cn>, bentiss@kernel.org, even.xu@intel.com, 
	lixu.zhang@intel.com, kai.heng.feng@canonical.com, hongyan.song@intel.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 06 May 2024 14:52:22 -0700
In-Reply-To: <nycvar.YFH.7.76.2405062311100.16865@cbobk.fhfr.pm>
References: <20240429085422.2434036-1-nichen@iscas.ac.cn>
	 <95fadbf4772d575bff777ddb738cb6c25b85b779.camel@linux.intel.com>
	 <nycvar.YFH.7.76.2405062311100.16865@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-05-06 at 23:11 +0200, Jiri Kosina wrote:
> On Thu, 2 May 2024, srinivas pandruvada wrote:
>=20
> > On Mon, 2024-04-29 at 16:54 +0800, Chen Ni wrote:
> > > Add check for the return value of pci_alloc_irq_vectors() and
> > > return
> > > the error if it fails in order to catch the error.
> > >=20
> > You can write as
> > "
> > Add a check for the return value of pci_alloc_irq_vectors() and
> > return
> > error if it fails.
> > "
>=20
Hi Jiri,

> Srinivas,
>=20
> my understanding is that with the changelog rewroding this patch has
> your=20
> Ack?
Yes, just to make it more clear. With that.


Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks,
Srinivas


>=20
> Thanks,
>=20


