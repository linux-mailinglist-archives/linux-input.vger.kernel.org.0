Return-Path: <linux-input+bounces-7057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D915998FCD6
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 06:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1FA81C21D39
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 04:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823D82AD11;
	Fri,  4 Oct 2024 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="NJxNx4jD"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4699475;
	Fri,  4 Oct 2024 04:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017520; cv=none; b=UkqyAfWOqtCVcgBBrTS4j/HAKofvb3y9eAsInk0/aTn+1l15+BJELSPxI3xq9yAzsPRYQ7GHn5ZExxFPOlJkmm8PxVOWCjTf2WiWJCjm47pbq8dQp1WOJQp0ynwtGfIrEA5in9CKiZQw/UEMuASH+q5+COzPWpi8YYOWqHtuH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017520; c=relaxed/simple;
	bh=H3bcColyjMwsCKDiO+ZtAlYvnTL8WuE1r4e2/6liiPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cyKZOXKYSID3N9OQzXIYhMmUwEawybrDQdOG4X4uoE6pAyoMeCZQix5n4P302cjX8ZAj5KZC7TBWmDCBnxA+nnq7bMfa/g0ZYfmQ1ac1kcDUHT50qevqwSP/4RZv9Zx2GM1iE1ES/hLRc88UhYujpib0U5HmxhiYqkTaW82WZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=NJxNx4jD; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:Reply-To:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=lkzFRaxiEWD9m5LIbq8rywqh1Z61f9CsIVIICeQwVGY=; t=1728017518;
	x=1728449518; b=NJxNx4jDFYdUs9a+pML+X3AX0V4G2h7dqya6iHYdMkaq33+fKKWTYW3zQxY0g
	tBccnPmwq06lqrdue3Hv2cSJQG/sKYJXS7ByV1vmi6FAL/gbBFqFMYoWleEHtxVknEE4I1ceHa8C3
	0IZaTZLOV+RH3rRsO48g981qYh8PIg7w4aJhefAbkclRLw2uPhYnzYI7ANd9XrEoPlfVPbiJFXq+e
	eSd9+0REcLDAjLNIqmB0PYi8NjntafbdZNIpSc2DoIPEXRGVkJDGGHm6l9V6KuWCOFFlfJ3U8o8Ui
	WFq7GDncR5dhfA1rAnsI4Kbe8obIGFqLg1PxD2AB+BsWiuZi2A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1swaIF-00033C-Jc; Fri, 04 Oct 2024 06:51:55 +0200
Message-ID: <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info>
Date: Fri, 4 Oct 2024 06:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, jikos@kernel.org,
 bentiss@kernel.org, linux-input@vger.kernel.org,
 Chris Hixon <linux-kernel-bugs@hixontech.com>, Skyler <skpu@pm.me>,
 Richard <hobbes1069@gmail.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728017518;bd9a7455;
X-HE-SMSGID: 1swaIF-00033C-Jc

[CCing the three reporters and the regressions list]

On 03.10.24 18:04, Basavaraj Natikar wrote:
> There is no need for additional cleanup, as all resources are managed.
> Additionally, if no sensor is found, there will be no initialization of
> HID devices. Therefore, return immediately if no sensor is detected.

I'm not a reviewer, so feel free to ignore the follow comment:

I think the patch description should mentioned that this bug caused
Memory Errors / Page Faults / btrfs going read-only / btrfs disk
corruption, as that is a crucial detail for later and downstreams that
need to consider when deciding about backporting.

> Fixes: 8031b001da70 ("HID: amd_sfh: Move sensor discovery before HID device initialization")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219331

Some reported-by tags IMHO would be appropriate to give credit; all
three reporters already agreed to use their email address in public.

There meanwhile is also one comment in the bugzilla ticket that could be
read as a tested-by tag.

Maybe a Link: to
https://lore.kernel.org/all/90f6ee64-df5e-43b2-ad04-fa3a35efc1d5@leemhuis.info/
might be appropriate as well.

Ohh, and participation in stable is optional, but given the severeness
on the problem: would you maybe be willing to add a stable tag to the
commit to ensure this is backported to affected stable series quickly?

Ciao, Thorsten

> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 3 +--
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 4 +++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> index 4b59687ff5d8..3fcb971d5fda 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> @@ -297,8 +297,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
>  	    (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
>  		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n",
>  			 cl_data->is_any_sensor_enabled);
> -		rc = -EOPNOTSUPP;
> -		goto cleanup;
> +		return -EOPNOTSUPP;
>  	}
>  
>  	for (i = 0; i < cl_data->num_hid_devices; i++) {
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 0c28ca349bcd..1300f122b524 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -351,7 +351,9 @@ static void sfh_init_work(struct work_struct *work)
>  
>  	rc = amd_sfh_hid_client_init(mp2);
>  	if (rc) {
> -		amd_sfh_clear_intr(mp2);
> +		if (rc != -EOPNOTSUPP)
> +			amd_sfh_clear_intr(mp2);
> +
>  		dev_err(&pdev->dev, "amd_sfh_hid_client_init failed err %d\n", rc);
>  		return;
>  	}


