Return-Path: <linux-input+bounces-13965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522BB246B7
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 12:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6388E165135
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5385C2F0C61;
	Wed, 13 Aug 2025 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3/RNGQc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A6C2EFDAF;
	Wed, 13 Aug 2025 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079623; cv=none; b=tRXBBr1QpoqsrpLvN6hCwMpADGy4O73HV1a27Ceh7MJwUJdncH1RRWfUro8fUh4apOGDRV3qcpR33Rfg4s2HBlLxUOwT3j2MTReYVBTO7/DPoYVJUetwe8qSYTQfUagupL73VcIvErTXJ85vJhSdB7DpbU5m7FnG0UYwVnJPoTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079623; c=relaxed/simple;
	bh=Lc/hlDKzA1IIBbbdHxhP3s10pkz9axIThbIQfHUGsfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf47VjzN3DP72ViPKSpvd/1Kjjj7SzTaDRGAYUKOpbVAC6zp9fKhgx+qDyF7wjKNnZqhhYVg6wqHZ+UZZpjUimKNFtA5H5NOL7rv+/NvpN5q2TJeX6iz2+Julc5vdoIKjtcXewu13YHXyMoVFb6Mr3OIXQJ9/tGxCvi0/Yf9YK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3/RNGQc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D80C4CEF6;
	Wed, 13 Aug 2025 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755079622;
	bh=Lc/hlDKzA1IIBbbdHxhP3s10pkz9axIThbIQfHUGsfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3/RNGQcioCzbtSJtQZlKc0wTgIjL2zSfAu3SpZrlPUW0jtXKHdTeXREm8+4eTJPn
	 +D4tSn0X4/a4CL9yddjLsVIr0//ZzvMcR5ZWe7hVsg/eXbbY2SxqBFYdHBCEDZnR/j
	 W0YYxjl3mv57wajCsfNfx5tkLXRXc3ERR3RsZmB++CTNqWDI658IcnVsGJU4zjLjms
	 4cVO5EREF+1YCLFLSnvrDWU7RcPBrp0LW1dFZVZgcl02Mh608fpqxItSe76BnKtnY4
	 sA+aBysx1lblV2lrbA2FNYq7tr8lHUrcDkcv/oC+dt65yxv84V68z2k2/Mq4yd4tUG
	 WV2Jq1Njf8ngQ==
Date: Wed, 13 Aug 2025 12:06:59 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Minjong Kim <minbell.kim@samsung.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
Message-ID: <p3rs7zuac4femnpe65afxpdrvturg4tx64t5r2xpmmyorzodgp@fyn2v2z6pe76>
References: <CGME20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38@epcas1p3.samsung.com>
 <20250717-hid-ntrig-page-fault-fix-v1-1-96fa145a137f@samsung.com>
 <rqo85n88-82s2-30s6-qn80-r4r943p4q59o@xreary.bet>
 <20250813051751.z6vxd6tvrfelmxou@minbellkim-500TGA-500SGA>
 <elszhqc5knv2o4mvq2frul6vglqxsdyrjepzgmda45lmrh4ylp@qvdvsgumuigx>
 <20250813092234.ja5qfpvkxocfnchd@minbellkim-500TGA-500SGA>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813092234.ja5qfpvkxocfnchd@minbellkim-500TGA-500SGA>

On Aug 13 2025, Minjong Kim wrote:
> On Wed, Aug 13, 2025 at 10:39:37AM +0200, Benjamin Tissoires wrote:
> > On Aug 13 2025, Minjong Kim wrote:
> > > 
> > > From 75e52defd4b2fd138285c5ad953942e2e6cf2fbb Mon Sep 17 00:00:00 2001
> > > From: Minjong Kim <minbell.kim@samsung.com>
> > > Date: Thu, 17 Jul 2025 14:37:47 +0900
> > > Subject: [PATCH v2] HID: hid-ntrig: fix unable to handle page fault in
> > >  ntrig_report_version()
> > > 
> > > in ntrig_report_version(), hdev parameter passed from hid_probe().
> > > sending descriptor to /dev/uhid can make hdev->dev.parent->parent to null
> > > if hdev->dev.parent->parent is null, usb_dev has
> > > invalid address(0xffffffffffffff58) that hid_to_usb_dev(hdev) returned
> > > when usb_rcvctrlpipe() use usb_dev,it trigger
> > > page fault error for address(0xffffffffffffff58)
> > > 
> > > add null check logic to ntrig_report_version()
> > > before calling hid_to_usb_dev()
> > > 
> > > Signed-off-by: Minjong Kim <minbell.kim@samsung.com>
> > > ---
> > >  drivers/hid/hid-ntrig.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
> > > index 2738ce947434..fa948d9e236c 100644
> > > --- a/drivers/hid/hid-ntrig.c
> > > +++ b/drivers/hid/hid-ntrig.c
> > > @@ -144,6 +144,9 @@ static void ntrig_report_version(struct hid_device *hdev)
> > >  	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
> > >  	unsigned char *data = kmalloc(8, GFP_KERNEL);
> > > 
> > > +	if (!hdev->dev.parent->parent)
> > 
> > Why simply not use if(!hid_is_usb(hdev)) instead?
> > 
> > Cheers,
> > Benjamin
> >
> 
> From 61818c85614ad40beab53cee421272814576836d Mon Sep 17 00:00:00 2001
> From: Minjong Kim <minbell.kim@samsung.com>
> Date: Thu, 17 Jul 2025 14:37:47 +0900
> Subject: [PATCH v3] HID: hid-ntrig: fix unable to handle page fault in
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
> index 2738ce947434..0f76e241e0af 100644
> --- a/drivers/hid/hid-ntrig.c
> +++ b/drivers/hid/hid-ntrig.c
> @@ -144,6 +144,9 @@ static void ntrig_report_version(struct hid_device *hdev)
>  	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
>  	unsigned char *data = kmalloc(8, GFP_KERNEL);
>  
> +	if (!hid_is_usb(hdev))
> +		return;
> +
>  	if (!data)
>  		goto err_free;
>  
> -- 
> 2.34.1
> 
> 
> I checked that crashes didn't occuered this patch
> then, I'm just wondering why it is effective?
> could you explain me about this?
> 
> Best regards,

Could you please properly resend the patch, without replying to the
thread? I can't seem to make b4 happy to apply the patch directly so
there is something wrong with your submission here.

Cheers,
Benjamin


