Return-Path: <linux-input+bounces-9107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4AA0718B
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8881A1889F28
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902132153C9;
	Thu,  9 Jan 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ga7VHJ/G"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500721519C;
	Thu,  9 Jan 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415332; cv=none; b=KL1uncfiornRstsC/6r9TzBtj89SxlhiuuCRtKCwAuCg6U+OFKw8tTzwuMD5+flN4whfjg5smYTNPzQ6CEKJGIkcKeduRcE0gZOF4zULRFtZtgGwlgODRQ46EYaFJwAIMjhujCBWoPvs+Qx0fh+OnpvNTh9Bi18H0EJM4WJqAao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415332; c=relaxed/simple;
	bh=joVUBR4jGM2OAv2XzxNbn4PsH0WapVmaOuX8qCX/0HA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jhCNIh7TXEZhWTkAaAj+ewXqpqSzZiOEu9aWuaUaLkdEfRh5eMlG58S2fHYCL7rZgKPHj8WoTRghtxQw9VT/matXqvZv5mPcIzV1Svs4dwnpY3GT2LBXU8C2o2CneP7IIj6UwRGdsSbHJGnT1SBOciPMj2wcvbU2FN1KpEL0mVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ga7VHJ/G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8ECC4CED2;
	Thu,  9 Jan 2025 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736415331;
	bh=joVUBR4jGM2OAv2XzxNbn4PsH0WapVmaOuX8qCX/0HA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ga7VHJ/GEBLOtwMXf5LEIHlO/GlEieVhcI0CbLZBw4DJYO+qWH44UH0mALbT71K/0
	 UlvOw+9rIHVWMYwrOBzcBOdakmJqM/B3KVCnJyCuuwLO08IErP/C7ctFyRaEmyxJ00
	 eL282D8bhsHekNHhk9740bcTBSm96HAHDm9oFG0nLxCcTmUP34RGS7iVEKA2ojBl95
	 WktwtLhxvi+SNzSGLYbiyz/TpYSeds7J8ia34sD4DvHTrz3rCpHRqf/T9GtcQ7UIpo
	 oX3neVxWxjuzl3wac0tbV5TujGa85UTvKT/ajWIzQuWq/WV0FWIR7MnAFMGgrAqGCU
	 ePKYdEqRiTeWg==
Date: Thu, 9 Jan 2025 10:35:29 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Akshata MukundShetty <akshata.mukundshetty@amd.com>, 
    Patil Rajesh Reddy <patreddy@amd.com>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Get SRA sensor data from
 AMD SFH driver
In-Reply-To: <10e983eb-f82a-aac9-a92e-3dce659e7ffa@linux.intel.com>
Message-ID: <n2n15qs7-8079-3n90-552r-71nqq6r2sorr@xreary.bet>
References: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com> <20241217151627.757477-3-Shyam-sundar.S-k@amd.com> <2937457n-6519-50p4-2696-oq391s2no1s7@xreary.bet> <10e983eb-f82a-aac9-a92e-3dce659e7ffa@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Jan 2025, Ilpo J=E4rvinen wrote:

> > > The AMD SFH driver includes APIs to export SRA sensor data. This data=
 is
> > > utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
> > > enabling the AMD PMF driver to implement the output actions specified=
 by
> > > the PMF TA.
> > >=20
> > > Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > > Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > ---
> > >  drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
> > >  drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++++=
++
> > >  2 files changed, 68 insertions(+), 1 deletion(-)
> >=20
> > Hans, can I please get your Acked-by: for these bits so that I could ta=
ke=20
> > the whole lot via hid.git?
>=20
> Hi Jiri,
>=20
> I already merged those to pdx86 repo (the changes are only in my=20
> review-ilpo-next staging branch currently waiting for LKP's build check).
> There will be conflict with other amd/pmf changes made in this cycle if=
=20
> you route this patch through your tree. So either I take both or you make=
=20
> an immutable branch out of the first patch, which way you want?
>=20
> I figured as the amd-sfh-hid maintainer is among the submitters that=20
> counts some form ack (and amd-sfh-hid seems really low volume to begin=20
> with) but perhaps you'd have wanted me to wait yours as well?

Feel free to take both through your tree, thanks.

=09Acked-by: Jiri Kosina <jkosina@suse.com>

--=20
Jiri Kosina
SUSE Labs


