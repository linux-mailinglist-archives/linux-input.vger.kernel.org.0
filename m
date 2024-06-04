Return-Path: <linux-input+bounces-4089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F18FBBB4
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 20:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6013E1C24C32
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 18:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E932E839FC;
	Tue,  4 Jun 2024 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrhShOOu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB3A5F;
	Tue,  4 Jun 2024 18:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717526102; cv=none; b=kZNX8MNzouihJexW6wIoVb018SC8GB/EqZ5hxz8eXRuQt5UxUGitcdOOHxDfhh0JFRFfblSDdrvP/V490v/VjtPyULK5Y/suI+Kah/rwiXwjv7XnS1RfKdXbRUYRY0WXLAcPWgT11weRFGjbuFI1HENcM/Hqrty+IBng9wQQ8fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717526102; c=relaxed/simple;
	bh=Ysw4TuWg//Bb/RUzlLDCHt6EmLws6dbL/fBsW5ZHejg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUdtm07uQfkVSCOMZt+Gfxo42kxhlbn61EK7bQzAUKF7TS//7Y0Kt661rKLjKuAljh1Km5D4MIFm1bpEd1qb37z5mpNRlMTXjEDCooNtv8hEJCgIDEecbBdq2meL368hS1fuL5uwzo0z2Pp57FCeZmzftpDwjUCDiTSklWQDUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrhShOOu; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f64ecb1766so12563295ad.1;
        Tue, 04 Jun 2024 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717526101; x=1718130901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yy8ysYSbl02/Pq5QPBuhlejpWviNjy8Nbu+adqMwnQQ=;
        b=WrhShOOu3myIp49Ho2kkR0mLN1KOGp2rAMC72a21ctxe+0MERY3BxcCKPi7gR6ibwH
         pf5quG0KHfm8BXY9fIIrmuyLtjoKlmbO4iRo2qsJ5HjRAaRA+EhxsjtnLnk5UAkxYCDj
         arAEDa8WUHM4OSHaPP4QaEW0ZhpKb5k0qkuAyECriAEKRsIB0oLW0r03DdtlpCzuqrUX
         PaM6tBBMkEQghc6s8aJqncozm4/2RLeEAZVbiq7ChpknWgwII3Kif4/5qHSYIz9o+jUi
         VBuRhtbk+I8w1sP+6Zkp3m6yuvQMRJ6gCMjaG4DO9ZwXKKno9FRqV9rGQhXdCwY2T8AW
         9q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717526101; x=1718130901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy8ysYSbl02/Pq5QPBuhlejpWviNjy8Nbu+adqMwnQQ=;
        b=M6eZ7t6SJX9eyWjqU/kZbdxMNvF5YKnT87ph2/zvQEdgPRFdVSDLvH/MOuZKZfqU+n
         h1cg/6G0VAXvOghrkZVgH8YWKOOBi5HEmfKz6Whz55A81w5M3+NWHGxu43eq6OW1sfVT
         SH+pLEonRjXC+eMu49e5Zt7YT9dUF7x1exb3vt/JOWtE2ss8QbGuYSuoLvEE+Yt+SKyf
         sGk0GGF+/SnaJM9aNfkso/KuD8nqhhdyZQK+LbuqHkAPwDmUQ981ntX3G9JwT+iRmWSI
         Vw3R05gQOX+sxk9RGMHmWN1Rag3aEgShlw5mYXUK5iulD1yzxesKuKb0j0DnqkrgA0p2
         Vknw==
X-Forwarded-Encrypted: i=1; AJvYcCVq5CAFTzvulmOWim7iRdzAC+WK3ZDuDADunqEwJWQZd99QPiP2BRzhzzfcJD4QYc0VQ1qCLdt4Aei3Pd9evxY3kYkthtGNQGr1CoAFxIqBx47wnTUA9OzHYQTF/HviK29gVNjbRleq0Z0=
X-Gm-Message-State: AOJu0YzyVtF85Hkg7jninBMGbaJGdqRrWc9ZmNfqfbb+HZQJSu6KHQsS
	u9Br14qi3TxEgZVyKhHrK54hu3fz8Fw8wtv1YBZ9GyXMg6PjhksG8/1+ug==
X-Google-Smtp-Source: AGHT+IGXPCXeQx4UIj0+03VF4+hdQBAEhj4aKnE4LS88SAvSnedbQdE9BRrO+WazB0n1lPeBwa7TSQ==
X-Received: by 2002:a17:903:32cf:b0:1f3:2e5d:902d with SMTP id d9443c01a7336-1f6a5a02fb9mr4274645ad.4.1717526100588;
        Tue, 04 Jun 2024 11:35:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1327:f82:3fa9:728f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232ddd1sm89040305ad.11.2024.06.04.11.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 11:35:00 -0700 (PDT)
Date: Tue, 4 Jun 2024 11:34:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Wang <charles.goodix@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	dianders@chromium.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <Zl9eUVpojZI2Z3ur@google.com>
References: <20240527042945.57054-1-charles.goodix@gmail.com>
 <Zl5kz_S4FJaGzfiW@google.com>
 <Zl75T3ioNqsofyQd@ux-UP-WHL01>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl75T3ioNqsofyQd@ux-UP-WHL01>

On Tue, Jun 04, 2024 at 07:23:59PM +0800, Charles Wang wrote:
> Hi Dmitry,
> 
> On Mon, Jun 03, 2024 at 05:50:23PM -0700, Dmitry Torokhov wrote:
> > Hi Charles,
> > 
...
> > > +};
> > > +
> > > +static int goodix_spi_read(struct goodix_ts_data *ts, u32 addr,
> > > +			   u8 *data, unsigned int len)
> > > +{
> > > +	struct spi_device *spi = to_spi_device(&ts->spi->dev);
> > > +	struct spi_transfer xfers;
> > > +	struct spi_message spi_msg;
> > > +	u8 *buf;
> > > +	int error;
> > > +
> > > +	buf = kzalloc(GOODIX_SPI_READ_PREFIX_LEN + len, GFP_KERNEL);
> > > +	if (!buf)
> > > +		return -ENOMEM;
> > 
> > Can you try using ts->xfer_buf without making allocations and copies?
> > Maybe have goodix_spi_read() have data as u8 **data, and do
> > 
> > 	*data = buf + GOODIX_SPI_READ_PREFIX_LEN;
> > 	return 0;
> > 
> > at the end. I.e. callers do not supply buffer but rather are given one.
> > Of course you need to make sure there are no concurrent calls to
> > goodix_spi_read(), but I do not think you have them anyways.
> >
> 
> Unfortunately, there are concurrent calls to goodix_spi_read(). The functions
> goodix_hid_get_raw_report() and goodix_hid_irq() may execute concurrently.
> 
> Anyways, I will try to optimize this part and reduce the malloc operations
> where possible.

I think you will need to serialize this anyway, as (AFAICS) you write to
report address, and then perform the read. There is nothing in the upper
layers that says that several report requests can not be sent at once,
and I think the device may also raise interrupt at the same time.
Without serializing/locking you may mix up the data.

...

> > > +
> > > +/* Empty callbacks with success return code */
> > 
> > Hmm, I see you are using falling edge interrupt. Don't you have concern
> > of having it "stuck" here? I do not think all these should be stubs...
> >
> Thank you for pointing this out. The trigger method shouldn't be fixed
> within the driver. As for "stuck", I believe this issue does not exit.
> The firmware won't wait for the host's response.

It is not the touch controller that will get stuck. The host interrupt
controller will not repeat signalling the interrupt that is configured
as edge and it was asserted earlier.

Or are you saying that the touch controller will de-assert and re-assert
the interrupt line if it is not serviced within given time?

Thanks.

-- 
Dmitry

