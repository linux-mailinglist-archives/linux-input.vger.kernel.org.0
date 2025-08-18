Return-Path: <linux-input+bounces-14105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE33B2AF15
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 19:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A3D41890353
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 17:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00F732C324;
	Mon, 18 Aug 2025 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnGllH9e"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243920322;
	Mon, 18 Aug 2025 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537074; cv=none; b=TI6ZHfJ0w1PuUpRlk58MhyYZLUGRn2D+6ow4NM5xcj+Am/NNQ6O9pWkDH+BnTAP/cZZhT68QUA8aPxXY9HynkVHOIlfcz7HTJTCKsnIJD0QI6CnE2AGimzmQoHMf1o6umkyxSNIQhn+R8yQJyqsAinokzTK5uIqrn+CGzeirdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537074; c=relaxed/simple;
	bh=uvD9Lje1gnJp3DWXLEDE32C5QnDwuvbzSDzpB1cSEj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDK+6nkWNFDnu11v9QwOLZCHnKzx5wm84Q+hoVuHlr4+mRHkA+3z9Sigik4eyq702gq4vJzpgmfls23giVSKxdvqB5P6BTYHAruQaZxYzGc4Zbp1jIaT2FnbqUvfoz/fRowCj15WZoqK7Uv+Mxq1WwIDsyGdj67GDxvF/p0IGFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnGllH9e; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32326e71c31so3970937a91.3;
        Mon, 18 Aug 2025 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755537072; x=1756141872; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HxE95o2q8GXx6WildR7NlQapGg7YDdXNHQ1dL1GhrD4=;
        b=gnGllH9eHhuAe/2zSVHlX/drpLIJLGyheX8AMk6fmGhaWtPW0yOD6zztX1UQjhakbe
         LDnLonbHja7wcmvRGWhIAuI4TmTbAaYYPGiHWHFP33VJD3EOxkg9c+qPBGNPHVsTWkh6
         AM9hAIxpceN/Y4G/wWvWIFMcsO/S3oMZh2jH1fa8bpD1/4wnkYe4vfTbbnJuuNCSKy7o
         VQvX2SngRAwD/g1ZQI9gtTLaiOlNmv9TwKvzKEJbTBM8J7Y0axXX/XUANZYPVQ0MOPYk
         Ha34HuGIq13HcCIhabRGaIqFglw3TpjTGAIIRe0JthXPsRLa/4a9rQeCZuGX2V/SWxA3
         Ax4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755537072; x=1756141872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxE95o2q8GXx6WildR7NlQapGg7YDdXNHQ1dL1GhrD4=;
        b=F+FnkmK24JKdvmS4Go97aRsmlbcPswGrSDsHN6AF+JmgCXOHdf9FCHpVa40U3FtxEF
         WZWER6p9pzmV2JdjdYUbuX9FcHKmE/HrkrUc5ja5h+n5aG930lxp7SHr5UJ0iNdclmlJ
         Aq4jQMo1RSeoPZq0qT0blGh4m3J738ElPpoz7TX9YYnYU9DqauIvSJAYH2nyrNJIh7lc
         LvIE02RI2x8NcAftYqChJ7WFG67TGjs5E2yp8gssNXbWEDd5jqwGAG0oDXM76XKViK/+
         UVBoziQ7Ypb4bTV10cwcxkXEyL55GE1O10twW5E3QcZFX4qEkGbTVKwf/9vyYCxoiR1v
         CLyg==
X-Forwarded-Encrypted: i=1; AJvYcCU6IGOHE16S8wY1vWPPXkuzmSVmMb5UhBLpWmNNpyK13Sg+RV4OrcGgyRJ+U8ZgmeifG/Li7H8Ttx0+GPkd@vger.kernel.org, AJvYcCUy8z+lDvzckzY08zqLAoaqOPForM9UiRebQPTV3wFz+sQc60AIX5IzTan2vETtke4azn+uLN7Mq9QVvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOQQT+wMQNUxRFLifmcjX+XAto9rIhe2nP3RZmBZ+69044+UG
	5SdNNfxgJz8+p+9lqiunvFOYS+tanI8+I2t2w/Gujcjy6y9r518fiGvG
X-Gm-Gg: ASbGncstZZeHVyFjISHZZlKDXSQEh4xRWH14b+VMP/EiezyGn0jjN9QdV7062zRR9Tw
	8qpCQFIXso/b5J29+wX4O9azmV3eG9fw3P/8ZrFRIJhQ0ZweBbsucsFywZjaC29F/vhM9XLAiqR
	Qs1hRbuKbIsBenDAB7UleroQHoJlIdzSN/1wFdMTFs3jaNEzG/xnFeYZVrQC0yKNxdCm0K8USUR
	foF9PMh3pN4WYfYZ0M9ebxPBFeknuZvUGK/2qZtB0NsZnd+6ZjEKWCvmB7YV7O0qWpOfBVXI6Rc
	TaYVlhbr4TQ0HlG65SaMbTEoFyuZh9CvNZVl3StdisbifpHfBB+aHROtUi986YbVKe+a0+nuf97
	OcVtVOzfSfqSKrUIgepFz0A==
X-Google-Smtp-Source: AGHT+IHYXBI8/M1isgWQeERz7ruyifgpRjIHlyh4axSUb4fstkhdulG376culEc3ymsgweuRWtBXGw==
X-Received: by 2002:a17:90b:6c6:b0:312:e8ed:758 with SMTP id 98e67ed59e1d1-3234db8e64amr12130269a91.13.1755537072146;
        Mon, 18 Aug 2025 10:11:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3d9c0asm459472a91.9.2025.08.18.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 10:11:11 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:11:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Lee Jones <lee@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mfd: rohm-bd71828: Use software nodes for gpio-keys
Message-ID: <jnf7z5hlljmoxw6ud3vuz4jaohh2ewjnpparh2dpbhef7ea7vp@up74k2viwhad>
References: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
 <20250817224731.1911207-2-dmitry.torokhov@gmail.com>
 <0adb5e0a-ea37-4bd5-87ff-654b770261f2@gmail.com>
 <a3fb7466-6774-4ae6-9e67-d35247ffa765@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3fb7466-6774-4ae6-9e67-d35247ffa765@gmail.com>

On Mon, Aug 18, 2025 at 09:56:07AM +0300, Matti Vaittinen wrote:
> On 18/08/2025 09:54, Matti Vaittinen wrote:
> > On 18/08/2025 01:47, Dmitry Torokhov wrote:
> > > Refactor the rohm-bd71828 MFD driver to use software nodes for
> > > instantiating the gpio-keys child device, replacing the old
> > > platform_data mechanism.
> > 
> > Thanks for doing this Dmitry! I believe I didn't understand how
> > providing the IRQs via swnode works... :)
> > 
> > If I visit the ROHM office this week, then I will try to test this using
> > the PMIC HW. (Next week I'll be in ELCE, and after it I have probably
> > already forgotten this...)
> > 
> > > The power key's properties are now defined using software nodes and
> > > property entries. The IRQ is passed as a resource attached to the
> > > platform device.
> > > 
> > > This will allow dropping support for using platform data for configuring
> > > gpio-keys in the future.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >   drivers/mfd/rohm-bd71828.c | 81 +++++++++++++++++++++++++++-----------
> > >   1 file changed, 58 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> > > index a14b7aa69c3c..c29dde9996b7 100644
> > > --- a/drivers/mfd/rohm-bd71828.c
> > > +++ b/drivers/mfd/rohm-bd71828.c
> > > @@ -4,7 +4,6 @@
> > 
> > // ...snip
> > 
> > > +static int bd71828_reg_cnt;
> > > +
> > > +static int bd71828_i2c_register_swnodes(void)
> > > +{
> > > +    int error;
> > > +
> > > +    if (bd71828_reg_cnt == 0) {
> > 
> > Isn't this check racy...
> > 
> > > +        error = software_node_register_node_group(bd71828_swnodes);
> > > +        if (error)
> > > +            return error;
> > > +    }
> > > +
> > > +    bd71828_reg_cnt++;
> > 
> > ... with this...
> > 
> > > +    return 0;
> > > +}
> > > +
> > > +static void bd71828_i2c_unregister_swnodes(void *dummy)
> > > +{
> > > +    if (bd71828_reg_cnt != 0) {
> > 
> > ...this...
> > 
> > > +        software_node_unregister_node_group(bd71828_swnodes);
> > > +        bd71828_reg_cnt--;
> > 
> > ...and this? Perhaps add a mutex or use atomics?
> > 
> > Also, shouldn't the software_node_unregister_node_group() be only called
> > for the last instance to exit (Eg, "if (bd71828_reg_cnt == 0)" instead
> > of the "if (bd71828_reg_cnt != 0) {")?
> 
> Oh. Probably "if (bd71828_reg_cnt == 1)".

You are right, I am not sure what I was thinking when I wrote this.

I actually doubt that sharing of nodes between devices would work well.
But I believe these devices are singletons, it should not be possible to
have several of them in a single system, right? So maybe the best way is
to simply instantiate them in probe and bail out if they are already
registered.

Thanks.

-- 
Dmitry

