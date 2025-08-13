Return-Path: <linux-input+bounces-13962-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF93B24607
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 11:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 909D13AB20B
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 09:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7E12F2910;
	Wed, 13 Aug 2025 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJ7BbSf8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2484C2ED16D;
	Wed, 13 Aug 2025 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078102; cv=none; b=l0uqRKCl5TMfhnt0CZMDFJ5ODPV6UqyYcHWDketjbZ3byYCiv5ABwzAPc7AGG9jpPh6NQjBeXKXxTPqGBnBz6R4CWoHjxZpfYlhpoDEh6ffzRgivsJMGvjOmXKETfYB0C1eXprySr8TUd4HSI1hhczP+I4aaiQAg+m025IU4s6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078102; c=relaxed/simple;
	bh=uiPIPOH/oX+kh+Fm75zjM5o93wJTsklX3fdXosMjObw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVnFcRM3xW6sNxzsjLCOaPUrUnCxpAljuhozq03AtgykOJU7rH4rwXbnodwZNemBRY1UnvX4wW1VZVmOcvbAkkQZ6Fb5tHXQA+YA82PK3Al0SgquR5QsT3qtJZTMz4CG5UNeuY5ptW/KdnxvFjMEyjeHbx/Dr1DMzMLlVK4wxKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJ7BbSf8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB14C4CEEB;
	Wed, 13 Aug 2025 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078101;
	bh=uiPIPOH/oX+kh+Fm75zjM5o93wJTsklX3fdXosMjObw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJ7BbSf8AyS9ziwbGDbjmkdtrIhNM1GiqzH2PyV/G2f53BrkWbX5/zCYM9I3Ip9ro
	 xB9nVuZU3fpQRRa1lG4aSYf78SxBlgdRKMaOq8FbIlXRFQ8O+0SU+WV0rS67XtaJ4b
	 V5qKMryELnAl88wo/x5C9JXOMk+UGIddaIqQIXzaswKAWbTfi2iHrX2+VPlQCx2Xye
	 7zdAQHnzJpGXBCSCmNTaMMeS8/hjC5y3VqLfAfA7u2RLF5PGtlMym4osXXdFL2NdLn
	 DtqxFRbj7wcoUyClqufQghF6/nysroRuQs5VkvOWqS99UzTulaO80iMuVQZGHx/z6S
	 932AczzlrXkvA==
Date: Wed, 13 Aug 2025 11:41:38 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Minjong Kim <minbell.kim@samsung.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
Message-ID: <53uert6bh3h5iieft6hokij5sq73zs3scpoqtmtpg3tuhfc6w4@vxf5m4gmkc57>
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

You are basically trying to detect if a device is connected through uhid
or usb. uhid doesn't set the hdev->dev.parent->parent field, which is
only available when connected over an actual USB port.

So instead of relying on struct internals, I just told you to use the
proper mechanism to ensure that the function which will call usb
specifics will actually work on usb connected devices only, not emulated
devices.

Cheers,
Benjamin

> 
> Best regards,



