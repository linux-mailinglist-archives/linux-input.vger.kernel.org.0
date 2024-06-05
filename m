Return-Path: <linux-input+bounces-4096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B15188FC5FC
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 10:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A631C20D59
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 08:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5312F3DAC0C;
	Wed,  5 Jun 2024 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoQGzsfj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96BD27459;
	Wed,  5 Jun 2024 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575410; cv=none; b=YZPV4RB/U1veeMkzth8HyHAksUtqkaaT6XzCgd6styNA/RVZFsaWacbmHEi2AusMvcJHNcFbb+AOwrdF1/BEfkyKp7SINuqhyY28qfXRJm7Wej4ZBNgzF/KjauEPgkyJH84PEAOlCNi/t1Q6va12AEYKREpvNjhazTOaZbwlGQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575410; c=relaxed/simple;
	bh=yCSdZ3e1lx6LRcrOcgQB1vKvA0MJ3E7WilX5VXlznxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYdoEItbmW+tfZDNI/Ucyaeb2OzmJdWc/glUG900WwNZuT2H4dZMra11uiOIOQWETbUh/+3mhmB/T/g5mgmczxJZ/OYEXw99vOm1uBv6Rafdy/4tb9T2JQnf4u5RpQ911eP+vx4E7/D13kgHsZUbY37WIyi3AJoN41csvVzyuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoQGzsfj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f44b42d1caso50423985ad.0;
        Wed, 05 Jun 2024 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717575408; x=1718180208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks4bjHSkxWEPP4w44oJVtH18y9jG6kQAaBpxs/Egxp4=;
        b=OoQGzsfjebCs0LuDyopWnSf6rekq4IYlBFHQyQ8nLWaHfHLI52RZuOW5cQQr0mufO8
         xmEkkINmqO6umI4E9U2738Zc9DaHzv4F3dIQoG+cMOw/6WBb1B4zlm7O0iZfNmz2fnZp
         yoHKDBia7kbLfGh1GIYd0IDAr/PSLvHKZiu1qcbv/1s4z8HVhEUSObeCxi/+bVwXGY5Q
         CgjhPsuZyBzz1d3vcxO5Yvdvf90IzTsvfeyxzESI3CX479kzHBrLgSsU5Zrvv5eURKkj
         oG4qBxr+mHTrMV7x1gIk0wDCxyKRNuUc0gLy2NEmX3TdbdiCs7Bbhw/GVyBZtqvN3xHb
         l7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575408; x=1718180208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks4bjHSkxWEPP4w44oJVtH18y9jG6kQAaBpxs/Egxp4=;
        b=O17ljHy9zHTidEBEfShfAYNOiQ9o722gGYZGP/7OTvyGZcT3y56kD5EcoZP1f+GMMP
         Xn5iBIYN2sW8r5XHAO31iiyQvNW4uMc8YPQpH/sDwxrmLtFD5DrBQ+6Ai1wd4iQ4sdeN
         cZoileign4bHavZ6+KaLTAY2eEJ1UOGzufy2CD2Va1w0U/F+dUr6Z1nD7+zG4cWo/5cl
         aspNtkyXF72HUU9mX+MPMAIxye0p8sTFJE8GluronHg4xoAxq372d00tRTvODW4oIUVP
         0VjbXkHsfj6BIlD6t0ezsjfwBvNxVcF4in2y7QkiXpmNkA7f3QdDRgOT5BdCulzUTUBk
         B/1w==
X-Forwarded-Encrypted: i=1; AJvYcCU5w83lsQt8YiW0H5PYPuT9ex2+cqHfy6S+aw2AdGh3mPWz3ZU3KaEqbbSjmdZN+OWGHdVYIvl74R/mnIwMdTFd29FOwaXdS2OFR/b9r9L2BE94k7LVOYiuXCK6JOPYbtjmSw383YrdQqg=
X-Gm-Message-State: AOJu0YwHTo7IFYcNEq/d63wCid5DF7vND0rkF5bz3E7C/YNiwwMeAndp
	p0MAZa5HAvoLXbvM+4yfQU4nxeZWxDOtva5KMXm+CAEfkqhzvb/K
X-Google-Smtp-Source: AGHT+IEeBtjRwxg5oj/gMslQXcacvva+WVK1OlqtetmA5BQlnmJXgo3X94l9iqYLqhpsEJyvH3F6Jg==
X-Received: by 2002:a17:902:fa4f:b0:1f6:7955:5c94 with SMTP id d9443c01a7336-1f6a5a8419amr16906855ad.58.1717575407974;
        Wed, 05 Jun 2024 01:16:47 -0700 (PDT)
Received: from ux-UP-WHL01 ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f66dc963e2sm58908675ad.115.2024.06.05.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:16:47 -0700 (PDT)
Date: Wed, 5 Jun 2024 16:16:41 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	dianders@chromium.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <ZmAe6fNolzw244ft@ux-UP-WHL01>
References: <20240527042945.57054-1-charles.goodix@gmail.com>
 <Zl5kz_S4FJaGzfiW@google.com>
 <Zl75T3ioNqsofyQd@ux-UP-WHL01>
 <Zl9eUVpojZI2Z3ur@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl9eUVpojZI2Z3ur@google.com>

On Tue, Jun 04, 2024 at 11:34:57AM -0700, Dmitry Torokhov wrote:
> On Tue, Jun 04, 2024 at 07:23:59PM +0800, Charles Wang wrote:
> > Hi Dmitry,
> > 
> > On Mon, Jun 03, 2024 at 05:50:23PM -0700, Dmitry Torokhov wrote:
> > > Hi Charles,
> > > 
> ...
> > > > +};
> > > > +
> > > > +static int goodix_spi_read(struct goodix_ts_data *ts, u32 addr,
> > > > +			   u8 *data, unsigned int len)
> > > > +{
> > > > +	struct spi_device *spi = to_spi_device(&ts->spi->dev);
> > > > +	struct spi_transfer xfers;
> > > > +	struct spi_message spi_msg;
> > > > +	u8 *buf;
> > > > +	int error;
> > > > +
> > > > +	buf = kzalloc(GOODIX_SPI_READ_PREFIX_LEN + len, GFP_KERNEL);
> > > > +	if (!buf)
> > > > +		return -ENOMEM;
> > > 
> > > Can you try using ts->xfer_buf without making allocations and copies?
> > > Maybe have goodix_spi_read() have data as u8 **data, and do
> > > 
> > > 	*data = buf + GOODIX_SPI_READ_PREFIX_LEN;
> > > 	return 0;
> > > 
> > > at the end. I.e. callers do not supply buffer but rather are given one.
> > > Of course you need to make sure there are no concurrent calls to
> > > goodix_spi_read(), but I do not think you have them anyways.
> > >
> > 
> > Unfortunately, there are concurrent calls to goodix_spi_read(). The functions
> > goodix_hid_get_raw_report() and goodix_hid_irq() may execute concurrently.
> > 
> > Anyways, I will try to optimize this part and reduce the malloc operations
> > where possible.
> 
> I think you will need to serialize this anyway, as (AFAICS) you write to
> report address, and then perform the read. There is nothing in the upper
> layers that says that several report requests can not be sent at once,
> and I think the device may also raise interrupt at the same time.
> Without serializing/locking you may mix up the data.
> 

Thank you for pointing out this issue. You are correct that
serialization is required to ensure the integrity of report requests.

> 
> > > > +
> > > > +/* Empty callbacks with success return code */
> > > 
> > > Hmm, I see you are using falling edge interrupt. Don't you have concern
> > > of having it "stuck" here? I do not think all these should be stubs...
> > >
> > Thank you for pointing this out. The trigger method shouldn't be fixed
> > within the driver. As for "stuck", I believe this issue does not exit.
> > The firmware won't wait for the host's response.
> 
> It is not the touch controller that will get stuck. The host interrupt
> controller will not repeat signalling the interrupt that is configured
> as edge and it was asserted earlier.
> 
> Or are you saying that the touch controller will de-assert and re-assert
> the interrupt line if it is not serviced within given time?
> 

Yes, to ensure that critical events are not missed by the host, such as the
touch up event, the firmware is designed to re-assert the interrupt line if
it is not serviced within a given time.

Charles

Thanks

