Return-Path: <linux-input+bounces-5805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112AE95D8CA
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 23:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DCDDB2101C
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 21:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EC71C86E1;
	Fri, 23 Aug 2024 21:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTaN229Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79414A4C9;
	Fri, 23 Aug 2024 21:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724450299; cv=none; b=FiBcHOOMn9kJfiKHBtDJNHvkTidTZBU7ymIr5QzrJ9yGAx/G755JH87/rjTkTubsd+eZxLdkgdwxbcJ+Pvzp2yG83Q+BYMZJ8DVW27oHgITXkSdV28vftsLbTvqf1YdJkvcebuO7ihT609dp6jjxOJRfhIKuby0B5kG09kMD5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724450299; c=relaxed/simple;
	bh=lg3Uc/jhFuoahbUi9F3Vpk67g8yVEGHuU4c51n+eWxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2hNbobE9r+bedYzGnGehK18UESIIZmRQXR3jX7/YCWwsadhntuRabjcFMxfxCCsm92dMxwQ9g8LBGNzvkBzlg/2a0HPO0618E7qxsBYv6beVXxVoPeNvV67MWDoJkLKY64/FfJ5EOTcQyI+2jVTVQG4sHDg+iDI6bsX2Ul1h0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTaN229Q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-201d5af11a4so22123235ad.3;
        Fri, 23 Aug 2024 14:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724450297; x=1725055097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VG0Tv5RmbpXG3vKP0HVLEZo/F77zi6hjk+JqanIRtJ4=;
        b=gTaN229QSzy7JHCJV9udZVYYavr1QDQYT7hVdnHUBPVVdrV9Uzexkvah0EsAas3ZIV
         Dr4w5Oh3pMxBN6Eo0ZmUI/X+3htk/3J/GhYlvUY4ter2A2zqA3rDj3f3VlZlcSFIXdzY
         BEJtopyZuDAaFIkrUdJcZk3u88heskkZuM7coZbXwB2exe/Cy+VgXHe7MqJQc6rMUgP5
         yNOlheVUoKKyxtHWLsUyeQz+DzHwUX0TouWGDB65RlP7Yp3y+hGfxmBVDMhdpwQ5AXD+
         tjcrIoQ5S23xWxN5rQkVDBOcmLU3SlEhrS7SQ/tOOONIWshOORDwqKhAC+7vZoMUfJXS
         9sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724450297; x=1725055097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VG0Tv5RmbpXG3vKP0HVLEZo/F77zi6hjk+JqanIRtJ4=;
        b=CCqouzivldoM9zA46jAadE5CrBMujILNv6lpaOLhl+mFwnLfTCmcuYjrxh5jn8m3mn
         3ekLLQEUAC6/NCr5LGIZhKrkXwssEhX0JONwZczjSlRYxCCTMGOwWWMZqS6rvg41icY5
         726BDfO4aNeZVz2As5HvkuoFN2O4XDxvUnIctheqj02RxxP8vnyD3U9bgdwmhfD+CbWN
         Xj9xz4OcoCVHW0JzFXBWhLNycT8tRpD7oPOKgnBX3/70V+5W6rOEUGpLMqkqch2fNS7p
         DYrTZAfRCwudHkgxEXQqCfsEWFO/nMTv40MOQRKnYH4k8SPj1NE1roHd2kVYpPuGx5Hw
         Al6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCnfGkAZZZgKHhfuVE28bFYZmKLmFn9AFSjx7FAtjqj2794ifl2Tw6i3IiMtmn+5FOthAO1PhtSH/24nMV@vger.kernel.org, AJvYcCWH6eCPjQhMbSBycBRQIIIFwN0P0b7ilZH3fQLpAXEei5mvmeFiJcJDbLDAwgu9eGYGR1TDNfXli16r4t0aNuY=@vger.kernel.org, AJvYcCXIrpmIeEvlxh/4weuJXCCCW5Zd29GPixU9u4TpaGngweHyPxcCO9APchGWZudXm//MNrJSHKDZvxluURc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCOGH7/ud9r8gYLKyZi1xMdwDQ0izz8aNiHDpSoHES1ensdFB
	oDdxBnhc9LbbqkVDSJjzEXq4eBtKewC/8qNOe6cSSsFQznfasffA
X-Google-Smtp-Source: AGHT+IHktXpMpVQGurDikraRASWzmxPDLIepL2iD3YzkrE3fg4SglDeeZbxqR1bQlRuOShjY1uDgsw==
X-Received: by 2002:a17:902:f541:b0:202:3174:9d44 with SMTP id d9443c01a7336-2039e486f7bmr53408575ad.20.1724450296738;
        Fri, 23 Aug 2024 14:58:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560dc8csm32645955ad.224.2024.08.23.14.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 14:58:16 -0700 (PDT)
Date: Fri, 23 Aug 2024 14:58:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] HID: hid-goodix: Fix a signedness bug in
 goodix_hid_get_raw_report()
Message-ID: <ZskF9ROgsO-mfIJ2@google.com>
References: <8e6fe9f1-fcd8-4264-b28d-a1ee99b592b8@stanley.mountain>
 <ZsjsydZtMu3RyM0P@google.com>
 <5660b5ea-0806-493e-8364-15b0d519be76@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5660b5ea-0806-493e-8364-15b0d519be76@stanley.mountain>

On Sat, Aug 24, 2024 at 12:32:53AM +0300, Dan Carpenter wrote:
> On Fri, Aug 23, 2024 at 01:10:49PM -0700, Dmitry Torokhov wrote:
> > Hi Dan,
> > 
> > On Fri, Aug 23, 2024 at 03:51:27PM +0300, Dan Carpenter wrote:
> > > GOODIX_HID_PKG_LEN_SIZE defined as sizeof(u16) (type size_t).  If the
> > > goodix_hid_check_ack_status() function times out and return -EINVAL then,
> > > because of type promotion, the negative error code is treated as a high
> > > positive value which is success.
> > > 
> > > Fix this by adding an explicit check for negative error codes.
> > > 
> > > Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/hid/hid-goodix-spi.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
> > > index 5103bf0aada4..59415f95c675 100644
> > > --- a/drivers/hid/hid-goodix-spi.c
> > > +++ b/drivers/hid/hid-goodix-spi.c
> > > @@ -435,7 +435,8 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
> > >  
> > >  	/* Step2: check response data status */
> > >  	response_data_len = goodix_hid_check_ack_status(ts);
> > > -	if (response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
> > > +	if (response_data_len < 0 ||
> > > +	    response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
> > >  		return -EINVAL;
> > 
> > I think this is too subtle and we may lose your fix again in
> > restructuring/refactoring. Could you change goodix_hid_check_ack_status()
> > to take length as an argument to be filled in? And then we'd do:
> > 
> > 	error = goodix_hid_check_ack_status(ts, &response_data_len);
> > 	if (error)
> > 		return error;
> > 
> > The check for the correct length of the response could go into
> > goodix_hid_check_ack_status() as well.
> > 
> > What do you think?
> 
> I'm fine with this.
> 
> I bet that you already wrote the patch that your describing.  If you want to

No I haven't yet.

> just merge that and give me reported-by credit then that's fine by me.

This is HID so it has to go through Jiri/Benjamin anyway.

> 
> I can also resend.  I don't mind doing that.  I've already written the patch
> that you're describing and I just have to write the commit message and hit send.
> I can send it on Monday.  Whatever is easiest.

Yes, please send it unless you hear from Jiri/Benjamin that they like
current version more.

Thanks.

-- 
Dmitry

