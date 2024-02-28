Return-Path: <linux-input+bounces-2109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B84B86AAD8
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 10:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3C2282719
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 09:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BB133CC2;
	Wed, 28 Feb 2024 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSKLzsJd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC7339A8
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709111011; cv=none; b=ec+ENuYwO/POeHsEyEq52kESrjDMymv7XGbL0jUNtdIVUWd8x+unGs2/LsW6mMXBvASZokEwnUz6BcuQXm6zrcyntbEVR7RW5DUaNlwdyqoXeFDfSA5olisJb6jpRxt0bGQQ78WvxciLY8fI9lMgGH8jPOpL4EwIam/p77f24Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709111011; c=relaxed/simple;
	bh=ku7xNniIudmd1NT+mS97oLagbdUAG4zeWk9/4Q7xzQg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LlUjc0Fzt2BN/IaAXt+MC/Kz4PPLJpDfSJV+SxZTgLaLkXbc4NqzT6deoql4KeQdxCdbUlBC89vTX/2HmzyVw951XejEeZG70aqGQmIwcRrwPYZigRcWi34zCy+Icpdu8+GNRTPlVlWafVRBSV47ZewnhDnhwYcXL2ndUsgLrRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSKLzsJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2046DC43394;
	Wed, 28 Feb 2024 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709111011;
	bh=ku7xNniIudmd1NT+mS97oLagbdUAG4zeWk9/4Q7xzQg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nSKLzsJdofvyA8mU5qvrlAIao7jkDbHFKi847d8qG+rR2bxL+rt/8PHDK5CMjZ3YU
	 0ilTcAqeWuGfPRqTrf89qFNeraavN8xJnqga2vgeKbo+tWuk6TOGVYMvZSYJP10fyj
	 ZchIkWqjq3oj0HWuO1Dt3+G1h+4eWZPygYzVc9vKnCBmuihWxqk49lnu+9bHqj2mmq
	 tEiYz2f1GmoUXaMo+4DDuVX9pygk3ez7RsDS08aMbA/ZCaogQA5aUWRtNgOXrNkVX8
	 REE5vrYJUFtTGv+bbEhZkqe++8kegGVVOY+BeYL6pqjcz74OnD6FwpNhfdqCa0VWVk
	 F8A38TMN3R+pA==
Date: Wed, 28 Feb 2024 10:03:32 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH hid-next] HID: amd_sfh: Fix build error without x86
 kconfig
In-Reply-To: <20240228075104.3495081-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2402281003030.21798@cbobk.fhfr.pm>
References: <20240228075104.3495081-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Feb 2024, Basavaraj Natikar wrote:

> This patch is to fix below build error while using the kconfig without
> x86.
> 
> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c: In function 'amd_mp2_pci_probe':
> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:21: error: 'boot_cpu_data'
> undeclared (first use in this function); did you mean 'boot_cpu_hwid'?
>   413 |                 if (boot_cpu_data.x86 >= 0x1A)
>       |                     ^~~~~~~~~~~~~
>       |                     boot_cpu_hwid
> 
> Fixes: 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to SFH")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240228145648.41c493ec@canb.auug.org.au/
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 9e97c26c4482..c815f2f54321 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -410,8 +410,10 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  
>  	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
>  	if (privdata->sfh1_1_ops) {
> +#ifdef CONFIG_X86
>  		if (boot_cpu_data.x86 >= 0x1A)
>  			privdata->rver = 1;
> +#endif

Does it even make sense to build this driver outside of x86 architecture?

-- 
Jiri Kosina
SUSE Labs


