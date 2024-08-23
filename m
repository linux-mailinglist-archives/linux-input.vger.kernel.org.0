Return-Path: <linux-input+bounces-5802-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46995D79F
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 22:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B1E6B22A80
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 20:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A08B19FA9F;
	Fri, 23 Aug 2024 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rhk5z1D0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DEF1A0721;
	Fri, 23 Aug 2024 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724443855; cv=none; b=fCpUkhtPvOfZ5ShOH9YEwEIw1MVGZxjjhYVespu4/ZVLVYLRLWwefNywb9Q5WEvdcMlwmoJWxyUwtloKspcoA7TRR7eK/QuyxmdEMAApfc65NHw978A9qr5pm8VGQXUj0BIb3FIJIP55e5JP9Zh2IZ0PWGxZmSCyEzqqGnjd5Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724443855; c=relaxed/simple;
	bh=Du/RYq2tpr/Sqy4yHEO5GxH6srgndzhBm2mooAY+UEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeqTpHx17cD0Joo2uxFVnA/wjrEQCKOeMmH0Xe5eVC9j6DO1ji/7OEsNkcBLzvpBm1TcJvcEhF0QEeOUa2KQ0E9K/esKMLSFOw2e6QZbo6zdlBgBsSi0UOZi01dbaut2JQRq+eK4sL+yRQpLfCj87sBbbe8Zc/Ft97wyDJ0Ift4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rhk5z1D0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20230059241so21039775ad.3;
        Fri, 23 Aug 2024 13:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724443853; x=1725048653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z4nJCkPj6s4sP8p66WpCPw3bEM6MqGG5XjCiskrfsyE=;
        b=Rhk5z1D0EqH4U6yLFCvrBAJjNNh44RwYaqELkckuJGRBrPRBHFH+5XSWZDX71D2Uo3
         ERCBRgRxSIdR75zYCQ0/0p5UvAXNbLKL5+iJBBo0ScYJcRXmYZJUB+xZlTuQnkUyXFGo
         VZJzjyJsMdqUwwPqhpbjzpafuBH/uv/IJCLPCAkZk46wiBueDLK3Zl9hUvC6xoNqIkuA
         8SGPov9qSQULgPlwt9S1DSjEMiUdHBRljJ9fUD+1iajv+TLI0RNa91BeOcbThzHdkbTl
         zQerqMEIyAfIX38dcwMMcD25t2ftRVVai/0mImcUg1qmAIfqcsgjxd7klrU5gTEd9+Bj
         nPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724443853; x=1725048653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4nJCkPj6s4sP8p66WpCPw3bEM6MqGG5XjCiskrfsyE=;
        b=Wrv+CUM8Eat261ZQXwg/ViA3wUnA+ElnxWsdkXFEyNwEx4dKB/si4eOZUedzrSW44u
         fZFzsr03INSthSk8wsONgXLg1a6YaPNp7UrWtGq3qk0EGP+30ZF6hSYN+ABeOHltcA3O
         iSYmqDC8p31OiPtJxDf5NU6u3YXYGEeknM/n+fdly1t3c1Y+jEYyQlgn67WrHM5MnHBv
         8C/G/44o437k/yR6GEWmJnq3SVa9NXCW1klaWYbapvC23qguUYG9GJjL04f9CRS+l3Kn
         sQH+6YcBB4QpD7nf2l0wZ8LihSCj++KAkpPNoTYv5ymJt1WGdpTSp00BowN2f9oBp77f
         jFdg==
X-Forwarded-Encrypted: i=1; AJvYcCUiONVRgHqiWLAEjlyVp2jIn/H7F7u3A2kel3DZa21gtf/f/0JxAYggybfQ3QIEna6z2VxQx33pYFRW2HkBWNk=@vger.kernel.org, AJvYcCVPoI50QJhafSN4tf88IOoBKSMWmM409sLBkmgdinHoeY98BRL1bloPIl+WCXZny1XfxDevrMyeAPQkBRU=@vger.kernel.org, AJvYcCWJ0xlQdi2EJYDFTDgqST5rKBt2O+vWxxUrQHi3jxmcZs5OzRwCdnpCQbVzi7P7pSzPVFkgvuFqjNIe1QT6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpj/cmNOZMbBkwE6I/BJE682J77n34E3F2pnNou0uBFJLxAWeA
	irIGcV5coaw+LVbOutraIMSSQ8NW2Sa+NKFvAxc3R1ohHLcpDozH
X-Google-Smtp-Source: AGHT+IE4ysQI9juwECYy2WXwGMuI0Y164UApHfu9aklddIOLYhfJqz081AJwXrDyBlgtUNSQ4KIXkA==
X-Received: by 2002:a17:903:41ca:b0:202:ac8:991f with SMTP id d9443c01a7336-2039e48b9a9mr39383095ad.26.1724443852552;
        Fri, 23 Aug 2024 13:10:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fbc901sm32122605ad.289.2024.08.23.13.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 13:10:52 -0700 (PDT)
Date: Fri, 23 Aug 2024 13:10:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] HID: hid-goodix: Fix a signedness bug in
 goodix_hid_get_raw_report()
Message-ID: <ZsjsydZtMu3RyM0P@google.com>
References: <8e6fe9f1-fcd8-4264-b28d-a1ee99b592b8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e6fe9f1-fcd8-4264-b28d-a1ee99b592b8@stanley.mountain>

Hi Dan,

On Fri, Aug 23, 2024 at 03:51:27PM +0300, Dan Carpenter wrote:
> GOODIX_HID_PKG_LEN_SIZE defined as sizeof(u16) (type size_t).  If the
> goodix_hid_check_ack_status() function times out and return -EINVAL then,
> because of type promotion, the negative error code is treated as a high
> positive value which is success.
> 
> Fix this by adding an explicit check for negative error codes.
> 
> Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/hid-goodix-spi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
> index 5103bf0aada4..59415f95c675 100644
> --- a/drivers/hid/hid-goodix-spi.c
> +++ b/drivers/hid/hid-goodix-spi.c
> @@ -435,7 +435,8 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
>  
>  	/* Step2: check response data status */
>  	response_data_len = goodix_hid_check_ack_status(ts);
> -	if (response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
> +	if (response_data_len < 0 ||
> +	    response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
>  		return -EINVAL;

I think this is too subtle and we may lose your fix again in
restructuring/refactoring. Could you change goodix_hid_check_ack_status()
to take length as an argument to be filled in? And then we'd do:

	error = goodix_hid_check_ack_status(ts, &response_data_len);
	if (error)
		return error;

The check for the correct length of the response could go into
goodix_hid_check_ack_status() as well.

What do you think?

Thanks.

-- 
Dmitry

