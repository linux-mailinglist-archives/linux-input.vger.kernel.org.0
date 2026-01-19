Return-Path: <linux-input+bounces-17195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27825D3A90D
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 13:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CCD73008197
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 12:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C30535BDC0;
	Mon, 19 Jan 2026 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="UIbHlAjU"
X-Original-To: linux-input@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5C1314D25
	for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826190; cv=none; b=AJIivNQ0KJWluVJICbmjGUIfgNRsqX6qDjhVyOa02sVpWcrjmIG7dUeY3kSucjEWmrrVXkVBg/BkfJH3Y9YAdkPCRfmiKxYGp0nGVojhfHi81fUZ9hWmu8KrvI0A/yfSdFTArB+A2i0le2CjjYBqDaRzhNLw705UVjscxrjOK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826190; c=relaxed/simple;
	bh=NN6MBU2I3A8g4d6J35iyEXCANr4wGR31Y+h1ZV1yZrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZfIH5WpiFCQCzUx2zsfQuk2ymO3Nsc6+ZP+5uFLt8/tyHIHw+RAAK0H7jGSNnWq+SEQ/z+lYAoLgncFQnYdGZRYZ/0Rhu+w5gyAO2DE15gka3Uc8rcoqzFcwzl4rXlR/BtIpGUTUqOM1u/m0JChwtQ6tprL7WUFi/KuhhYLgRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=UIbHlAjU; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 4ef7d8fb-f533-11f0-8fef-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 4ef7d8fb-f533-11f0-8fef-005056999439;
	Mon, 19 Jan 2026 13:35:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=CF5zGlNcy+IMJqT4DekOutrDUYWtKKQxaOIguAyti5Y=;
	b=UIbHlAjUfj3k7QkTyuWgGdZLOpojtp8tmpECDjqlhXCnO+a/WrOVxxiL8jjBRKW5bYxDlJBywf2Ao
	 qEuBMaALQJdgQpnABkJYeUm2ZM0MNboNlkx60qycmSt2H1R18bycjiiSQlRemjo5LdkN+dIbupiAdR
	 aZVvPSuK+6qRFO9GTV0eRZSZ71IAWIcjYKdWCwiNNfbN/+Rtg5t2ts0NkQHp+TBE1ECalyfrN9xw+7
	 3S7OaCRYsjDLIAmB8s6cWzACtOqnXkcSVsAcnLkZ9IZ9ar12lZR9JmcLUATyo2x/GXuSdM2UqlQgLP
	 j6wpJv3kEpYDSWJWgUMgMIEpK7zPRtg==
X-KPN-MID: 33|mJNPi4O7DDHM1eAyvcTJiu6HNNPF3O/j51qI6aPTtOlVdxxp/FM6/EpmoBEZIol
 5s+l8gnvWeAxI3OYyWnkmaVWVPiVji346c2xiNtVhZS4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ae49KTnyVBsOZhT3mFbjWBapdPwG8L2+d/FGPDEcVrKcL9tRtzBR2zuDTp/2lBk
 N/ONcrhscQ7s7+12/WuqhVg==
Received: from htpc (88-159-74-111.fixed.kpn.net [88.159.74.111])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 4ec1749d-f533-11f0-bff7-00505699772e;
	Mon, 19 Jan 2026 13:35:17 +0100 (CET)
Date: Mon, 19 Jan 2026 13:35:09 +0100
From: Philippos Boon Alexaki <palexaki@xs4all.nl>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for the ZD O+ Excellence
 controller
Message-ID: <aW4k_eiMTHT1mU2x@htpc>
References: <aQPtBpx6bQMCw1tF@htpc>
 <copxfwjjvudsgq3s72wqimsdcqmrwxzjry3wweg7yrifr6s3cd@gv6w23g4open>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <copxfwjjvudsgq3s72wqimsdcqmrwxzjry3wweg7yrifr6s3cd@gv6w23g4open>

Hi Dmitry,

On Thu, Dec 18, 2025 at 09:08:03PM -0800, Dmitry Torokhov wrote:
> Hi Philippos,
> 
> On Thu, Oct 30, 2025 at 11:56:06PM +0100, Philippos Boon Alexaki wrote:
> > Adds support for the ZD O+ Excellence controller.
> > Tested with a wired connection.
> > 
> > Signed-off-by: Philippos Boon Alexaki <palexaki@xs4all.nl>
> > ---
> >  drivers/input/joystick/xpad.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> > index 4c94297e17e6..3805780d5be3 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -296,6 +296,7 @@ static const struct xpad_device {
> >  	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
> >  	{ 0x10f5, 0x7008, "Turtle Beach Recon Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
> >  	{ 0x10f5, 0x7073, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
> > +	{ 0x11c0, 0x5505, "ZD O+ Excellence", 0, XTYPE_XBOX360 },
> >  	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
> >  	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
> >  	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
> > @@ -541,6 +542,7 @@ static const struct usb_device_id xpad_table[] = {
> >  	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori controllers */
> >  	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries controllers */
> >  	XPAD_XBOXONE_VENDOR(0x10f5),		/* Turtle Beach Controllers */
> > +	XPAD_XBOXONE_VENDOR(0x11c0),		/* ZD O+ Excellence */
> 
> It is really weird that the matching is added for XboxOne but the type
> is set for Xbox360...

This is a typo, it behaves like a Xbox360 so this should be changed
to reflect that. Should I resubmit my patch?

> 
> >  	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
> >  	XPAD_XBOX360_VENDOR(0x11ff),		/* PXN V900 */
> >  	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Philippos

