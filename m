Return-Path: <linux-input+bounces-2112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B010286AC66
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 11:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63CBD28899E
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 10:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5577E57F;
	Wed, 28 Feb 2024 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ug9Dhxun"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4ED7E577
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709117834; cv=none; b=NZmLD+qNvbj34fa1kChjYcBImK9DrDcE+zMReOuT3cqgkcAhtyvwNtCQ8LEOB00RF+3Y3lMVbGI14I/3VghGOpWG1FAp9HTthcomCIGa+rG8wbIGnDgM3aotmmQ8CPZoMaKhf5JYTGsYvWQJUxyEXzcgcn1Q92jDRzIsGkN2t7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709117834; c=relaxed/simple;
	bh=9L8En+czjCF8/3ZQXdr26OXPQIehEdKym7c3Fn84QYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z8XpiEM0opHj5IveA6bxLzW9xwHNj829valUGGH4WIrgG8PKvWcxp7QkJ3zIXA7hqXUUZ8VOGrmUue5oLjNQcjljdIXX2Ffh3FW1N/0xBAGoS2wiKvOLV44Lvs3Vg+7w/pxFjgQ4KgeMXAw+lL6ghynWXvkLJ/viVWnnVaf2hK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ug9Dhxun; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04634C433F1;
	Wed, 28 Feb 2024 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709117834;
	bh=9L8En+czjCF8/3ZQXdr26OXPQIehEdKym7c3Fn84QYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ug9DhxunicgnklYe+9/TCIEh+Gcjs4Ia0YR2zkMbwrsxv9XBFYtQ6kJPEtxyOJiCo
	 oPJ1HT+t+ZnxdEGF98KSSoiox92jFOlkwUPqY3MCX6zWkbYuRwtVxDVaflX/lfgF0P
	 g8A+K9Z3V3j05npbjI92L94BqQh9g0I9NB57wXLqYPHMXIYrosvOuxxwQqk9YjLLd9
	 3XKVyUqkjQC4Y8ukiwpFUH/RW3no4Pm1703dRRPOi7USfFOkmPGXc/LCEaHYd1QMpJ
	 B8uOdp/h5ieP3XSOxRBlR+/STvhauQdHY9GCweMC0RiMHudm1aCC+NKmx4Mk4zELXu
	 5pyiKBVUahJkA==
Date: Wed, 28 Feb 2024 11:57:15 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <bnatikar@amd.com>
cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
    benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH hid-next] HID: amd_sfh: Fix build error without x86
 kconfig
In-Reply-To: <22f150f7-b56d-460b-b964-9c873957d5a6@amd.com>
Message-ID: <nycvar.YFH.7.76.2402281156370.21798@cbobk.fhfr.pm>
References: <20240228075104.3495081-1-Basavaraj.Natikar@amd.com> <nycvar.YFH.7.76.2402281003030.21798@cbobk.fhfr.pm> <22f150f7-b56d-460b-b964-9c873957d5a6@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Feb 2024, Basavaraj Natikar wrote:

> >> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> >> index 9e97c26c4482..c815f2f54321 100644
> >> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> >> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> >> @@ -410,8 +410,10 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
> >>  
> >>  	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
> >>  	if (privdata->sfh1_1_ops) {
> >> +#ifdef CONFIG_X86
> >>  		if (boot_cpu_data.x86 >= 0x1A)
> >>  			privdata->rver = 1;
> >> +#endif
> > Does it even make sense to build this driver outside of x86 architecture?
> 
> Do you mean to say just add depends on X86 like below ?
> "
>  config AMD_SFH_HID
>         tristate "AMD Sensor Fusion Hub"
>         depends on HID
> +       depends on X86
>         help
>           If you say yes to this option, support will be included for the
>           AMD Sensor Fusion Hub.
> "

Yeah, that was my idea; as far as I understand, there is no way this 
driver would ever have any use outside of x86 architecture, right?

Thanks,

-- 
Jiri Kosina
SUSE Labs


