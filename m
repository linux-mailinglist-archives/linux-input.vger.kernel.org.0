Return-Path: <linux-input+bounces-5804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5156495D88F
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 23:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078781F24635
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 21:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750AF1C8247;
	Fri, 23 Aug 2024 21:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="toLW3FYA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1A1C871E
	for <linux-input@vger.kernel.org>; Fri, 23 Aug 2024 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448781; cv=none; b=sEfGy8S3VED9k/DfKeLzArf4XkNjUWVNMnI+2p0wh5nR2Vpk/sbarLAKG7Y9Me1O+AEeckumt9OUq6ou4eTa2Bxld4YJ3lD9v9E05IefvGhrt9JHijbqJ0Fh2FyPumWwdYqNZJ/skEoyc5uc7Xxjjv0q05sccyi2REGntj/7wyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448781; c=relaxed/simple;
	bh=bhJ8m3a5aE86F1hWi6tQ0R8qs6l430aqOIyVDBQCjFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sITeIjq85iRytmfgltgVOUk3YGuD0HFQo++ybT2Rm3HI37EuPJDBHZLLJ/FGl9PjKIwabY4DPUFSd4a8pg9CnFaKBC3JV3LCDoFadDkDbQpiutIf3xXpoV9XoRquQk7tFbxQOBaX6HJy7pRcEzKzkgyW6PC5t0R4owk5rrBSLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=toLW3FYA; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so2788216a12.3
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2024 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724448778; x=1725053578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeDa0GmHdOei2weuqBKZLu+edJ55lut3cT8I7czOmbg=;
        b=toLW3FYA7r3NWMyDePnQg8tbD9jtu/ZPtPQLSNREgo2lKRUZGC8dnnAZMCWM1Hp4dD
         y39vGVDNi6g7UFvovfn5vrfk5l//OjEpoxBA8KfcI0EOvraNQ4V9RSw97v5ob1yyAR3r
         3lTUbKrTVGyw1clis0sSFHqvGe7QqRr8lHTEb6kFV0QBn9A3cXPxlWlSIcGvPE1l/W1C
         5YIQWaiRr41W+QgWApIg1a5jR3JX0qJKr0wQwgODdY3mmAlfadh3q0/7eCgqR2UXndFB
         CedRHsJzP7UBiX65CdWwx6HQ1pe2bVdWDX6Hhc2z8N3J58QjV7b0TShLIZkwjN+xs93l
         q/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724448778; x=1725053578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeDa0GmHdOei2weuqBKZLu+edJ55lut3cT8I7czOmbg=;
        b=bZo/yQXlPRC7F5y7CTy0j5Zu42VZX0lfyZvL5zfK7CzejXrGI/1kG8V6+QZu+vnmij
         aNiLYkTEIl5bPW6a367mICf4AKfrUxN/oH8wpVSLYtt59NsQU+u2jxbOqpf5Q04OcEIB
         Mw1BsFWStK2ar6VJ4JUrL1N/hknEXXcUgf8y6/uPAtlyGNVGdCMCITuI8hc5shYvXA0y
         BApFaT86rkdsOUsIbO81DzfYHdJV+Hj5plbrkLxvcobqT2rcCemKpsDz5W2KIbwZZo71
         QOY6GfobIg1HoXgKD9DIwJWFmtIwFHWs/5HUsKPZ27W4assuizhgLNnfF7ershdPhpNc
         5q1g==
X-Forwarded-Encrypted: i=1; AJvYcCVnfAMzoKplO3zGi9G7KDV4LNV+6W4zN9RI8tOMIsDRxQfqq9BqGshKYMl0PNIwhzSo6e+clpoqUmnfVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJcZGdUh30O8Qk8hseSXf0y87dE+ZV9Dbg3L9sT9eE6DxMaHg
	74Pwelnnc7qV3jPnF8CHW/Yf4bFNk1QEOs7rxBqz0sQe6S9GeWcg57c9W3INUuc=
X-Google-Smtp-Source: AGHT+IGSPLSnz+5Ofjwz50/zu6pwyXz8Bf2c2U5djS46sOgMAm2BFOAknl6Qr9pVZCXaT2A81Hpwmw==
X-Received: by 2002:a05:6402:84c:b0:5c0:9097:b94 with SMTP id 4fb4d7f45d1cf-5c090970cccmr583632a12.22.1724448777795;
        Fri, 23 Aug 2024 14:32:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c4384sm2534706a12.62.2024.08.23.14.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 14:32:57 -0700 (PDT)
Date: Sat, 24 Aug 2024 00:32:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Charles Wang <charles.goodix@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] HID: hid-goodix: Fix a signedness bug in
 goodix_hid_get_raw_report()
Message-ID: <5660b5ea-0806-493e-8364-15b0d519be76@stanley.mountain>
References: <8e6fe9f1-fcd8-4264-b28d-a1ee99b592b8@stanley.mountain>
 <ZsjsydZtMu3RyM0P@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsjsydZtMu3RyM0P@google.com>

On Fri, Aug 23, 2024 at 01:10:49PM -0700, Dmitry Torokhov wrote:
> Hi Dan,
> 
> On Fri, Aug 23, 2024 at 03:51:27PM +0300, Dan Carpenter wrote:
> > GOODIX_HID_PKG_LEN_SIZE defined as sizeof(u16) (type size_t).  If the
> > goodix_hid_check_ack_status() function times out and return -EINVAL then,
> > because of type promotion, the negative error code is treated as a high
> > positive value which is success.
> > 
> > Fix this by adding an explicit check for negative error codes.
> > 
> > Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/hid/hid-goodix-spi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
> > index 5103bf0aada4..59415f95c675 100644
> > --- a/drivers/hid/hid-goodix-spi.c
> > +++ b/drivers/hid/hid-goodix-spi.c
> > @@ -435,7 +435,8 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
> >  
> >  	/* Step2: check response data status */
> >  	response_data_len = goodix_hid_check_ack_status(ts);
> > -	if (response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
> > +	if (response_data_len < 0 ||
> > +	    response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
> >  		return -EINVAL;
> 
> I think this is too subtle and we may lose your fix again in
> restructuring/refactoring. Could you change goodix_hid_check_ack_status()
> to take length as an argument to be filled in? And then we'd do:
> 
> 	error = goodix_hid_check_ack_status(ts, &response_data_len);
> 	if (error)
> 		return error;
> 
> The check for the correct length of the response could go into
> goodix_hid_check_ack_status() as well.
> 
> What do you think?

I'm fine with this.

I bet that you already wrote the patch that your describing.  If you want to
just merge that and give me reported-by credit then that's fine by me.

I can also resend.  I don't mind doing that.  I've already written the patch
that you're describing and I just have to write the commit message and hit send.
I can send it on Monday.  Whatever is easiest.

regards,
dan carpenter

