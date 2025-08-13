Return-Path: <linux-input+bounces-13959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B09FB24481
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 10:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4353C189ECB2
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 08:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E51D2C159A;
	Wed, 13 Aug 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO9FLdGU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252521B87E9;
	Wed, 13 Aug 2025 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074382; cv=none; b=cQZt593t3JgrNDGq9IpFapM5cFpXKmPIFrZ+9dKf+FW5NS9lIsjlTsB4eJlCUDx7rnekL+zRqbSNrBfOIMXdwvOfTwAjuKn+jOqIG8gXVccmOuj8LKXgU3QSM9SLLiZisfrazt+fnEUFukFdfU5f77rD+YdAaKRItac0fpE9FQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074382; c=relaxed/simple;
	bh=V2oeHkS6TTGlY6yRjmgpoRxjLDxrCM4X/2ojO98uGpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjZEFRw7plCkQbKJKBvIQQDu0TX+UvMyULCkS71KuW9Uil0CNYPfVqR2tYXA0z99GVpsHmlrPG7WKktkT18p/kbuj3ZDwzdSiF2wwZXlCfe9ACJTph4yM8d5W/Ml8HDXZRr/lZtLuCoflZftMEx3FTVFTGKydUItkFIbahaF/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO9FLdGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE34C4CEEB;
	Wed, 13 Aug 2025 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755074381;
	bh=V2oeHkS6TTGlY6yRjmgpoRxjLDxrCM4X/2ojO98uGpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nO9FLdGUjDnv/8wvM1hR/r5R1CAkof8Z5uwGjUqgT+cE/oWRb6SmL27Evb963Dd+h
	 Mod/yDiKmGSf7WjjN2lEblTYelgTQf7qiHbv4qOqPsVvhhCflgM9S0P5BuSnikESc9
	 34EQ3ds2YBGjHBmx6dVHD6Xr5TIaGD6S+WtKgnfQ6Ci+2nN5arkPfMuMukXtVyUQSY
	 +5218ZPoXuJo4V5yKMpL8MT3Yi/Qgf8QX+jW30OPMcolmt4MXp5OtQjopPOL1AfZMj
	 rmpkaiJvt+fBYUAKCei/jnplOuXxduFDF0i2216vNrBSx4YakrgqO5vnqcJ/EM06WG
	 rwbLVVIcmsT6g==
Date: Wed, 13 Aug 2025 10:39:37 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Minjong Kim <minbell.kim@samsung.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
Message-ID: <elszhqc5knv2o4mvq2frul6vglqxsdyrjepzgmda45lmrh4ylp@qvdvsgumuigx>
References: <CGME20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38@epcas1p3.samsung.com>
 <20250717-hid-ntrig-page-fault-fix-v1-1-96fa145a137f@samsung.com>
 <rqo85n88-82s2-30s6-qn80-r4r943p4q59o@xreary.bet>
 <20250813051751.z6vxd6tvrfelmxou@minbellkim-500TGA-500SGA>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813051751.z6vxd6tvrfelmxou@minbellkim-500TGA-500SGA>

On Aug 13 2025, Minjong Kim wrote:
> On Tue, Aug 12, 2025 at 02:46:24PM +0200, Jiri Kosina wrote:
> > 
> > I know that mixing declarations and code is fine these days, but we 
> > haven't been progressive enough to switch to that coding style in HID 
> > subsystem yet :) Would you be willing to move it below the declarations?
> >  
> 
> From 75e52defd4b2fd138285c5ad953942e2e6cf2fbb Mon Sep 17 00:00:00 2001
> From: Minjong Kim <minbell.kim@samsung.com>
> Date: Thu, 17 Jul 2025 14:37:47 +0900
> Subject: [PATCH v2] HID: hid-ntrig: fix unable to handle page fault in
>  ntrig_report_version()
> 
> in ntrig_report_version(), hdev parameter passed from hid_probe().
> sending descriptor to /dev/uhid can make hdev->dev.parent->parent to null
> if hdev->dev.parent->parent is null, usb_dev has
> invalid address(0xffffffffffffff58) that hid_to_usb_dev(hdev) returned
> when usb_rcvctrlpipe() use usb_dev,it trigger
> page fault error for address(0xffffffffffffff58)
> 
> add null check logic to ntrig_report_version()
> before calling hid_to_usb_dev()
> 
> Signed-off-by: Minjong Kim <minbell.kim@samsung.com>
> ---
>  drivers/hid/hid-ntrig.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
> index 2738ce947434..fa948d9e236c 100644
> --- a/drivers/hid/hid-ntrig.c
> +++ b/drivers/hid/hid-ntrig.c
> @@ -144,6 +144,9 @@ static void ntrig_report_version(struct hid_device *hdev)
>  	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
>  	unsigned char *data = kmalloc(8, GFP_KERNEL);
> 
> +	if (!hdev->dev.parent->parent)

Why simply not use if(!hid_is_usb(hdev)) instead?

Cheers,
Benjamin

> +		return;
> +
>  	if (!data)
>  		goto err_free;
> 
> --
> 2.34.1
> 
> I move it below the declarations.
> 
> Best regards,
> 



