Return-Path: <linux-input+bounces-4550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBA912C4D
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 19:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8D1E1C21BA0
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 17:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5031D40856;
	Fri, 21 Jun 2024 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMiWg0Pc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B151E48B;
	Fri, 21 Jun 2024 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718990180; cv=none; b=E1rfyj8ynfCOTPZFgkJ98hWtzqBhKXu5CJQtAoxPVMwecEwE6rOD7urOKzVG5KT8ThhKofm4KKI4ezX/KRtNdGtnhLfHrXl0j+FPsFB/tVV7OzFjsKRQ7lXocQGlWUIbKb7i8Q8/O5g+wL5HClqlAYgxzuTwmCYMI/eHcl+Ktcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718990180; c=relaxed/simple;
	bh=1dINPmcDfd4B9O1+P613nZtnQngLi1KpoprMS1q4DjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+p2yYdSK4MU8A98A4hTlOI2u5ZOAUkXPa73p8Q4pUMuPqRs/YZ2w3NqGdg5DJKwY5xIcBI4Gpfi2zpCjH4exRCduUOCy39TUktZEwv1qZ6gvX/j9LeKCb5cY8zG14yduGs6+p4cWmoGXzSvAsJzax2Y+qhXl8C/od/T+vpPUFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMiWg0Pc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c7cd714268so1636575a91.1;
        Fri, 21 Jun 2024 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718990178; x=1719594978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8z4gVvCzxeZlUeiVl+daSgFA3zxEp4uopDr2HvEl3M=;
        b=YMiWg0PccrtaqFjm+R5OIbEjHFqdQGMnNfSK6kki4d8LFysaEE98VAlN0PlnhRlPII
         aquyeKJU2pw9DOVU+EAdGmAi4Byb/v/LFSdjtzzpeUg1etoRh6dHXxmz2hpA5eOxbisL
         TIkqHIOTZHSD7JAIuZvEbD+nq6u53n/rp8W+CcTh3rq8yjYRdJEAMj9+/FI/gk2eyrvm
         /xjUUAwjHzg/JSAlI6qfA5zp7twrYR0K6xUgwCbeE+TqH90u8Zmp6hRiJ9VzOKBqRImG
         1rMiq11lowWRn5E4aAmS7c3T/B0HGAjourDUVZZWGNNj63LKuoJtuNq+XKcGcI1fF8+F
         r0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718990178; x=1719594978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8z4gVvCzxeZlUeiVl+daSgFA3zxEp4uopDr2HvEl3M=;
        b=giLd+vFxHz4CF82NqIo1R0gaIsOxioATEtE4iT5/oHTh/NPaFy59j6TTx6kRa8BYU+
         dFvvI9/rUdlagnpQE3/wr35S7d3uQ2D6bA41xOUwG+NHcaHydR2aP6YXozR92ie1jiTJ
         OfX/cBTwQm/SHO4O3iNjAkVup4kgCwvTaPOZPr12YDaY+wrlyIn2tBfHtI8pkg1UtSTY
         ObmhweEimLsaxu5jYP5YkxnfumTY3aL4sf1BVKau5aQLJOgXpTJw6gvmqYchxBI2WnLx
         ST46p5xce+fO3+Yz5NtLaTpV9FrrpSR/Nyj46xITjBHiN+wvu1HG2+Eh1+c4d18n5i3Z
         WDTw==
X-Forwarded-Encrypted: i=1; AJvYcCVMiodD4T46MEkki8H6G3p8aVv9w5OVNZFojUYaHsuqlz4Mrw76W0r2vofJ7zbIgEcM8ol0PiA/k7dtcG0+UgBVGmwYDcm8r8+8ewNY
X-Gm-Message-State: AOJu0YwQCrBtyYJelWcuk+SOiv6FgjstaCjwbAmWYKe3Bidre/uTROtv
	mqnuQJf1pxUUzeeDRMvesgOUmAmpspPks6vNVJgdVyjAJATEJ0mR
X-Google-Smtp-Source: AGHT+IEYq+hNMBU7XQxy2OeQX6CVGBNXO66sdnB0/uq7gtUmZqi4Gs6ongNrb46YKZgMaIwgJ9jYRA==
X-Received: by 2002:a17:90a:ea97:b0:2c6:f5bf:5175 with SMTP id 98e67ed59e1d1-2c83c200b30mr520197a91.10.1718990177516;
        Fri, 21 Jun 2024 10:16:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:30ae:a791:227a:a35f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a622fdsm1847939a91.6.2024.06.21.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 10:16:17 -0700 (PDT)
Date: Fri, 21 Jun 2024 10:16:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Artur Rojek <contact@artur-rojek.eu>
Cc: linux-input@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: adc-joystick - move axes data into the main
 structure
Message-ID: <ZnW1XmYET39CwGsu@google.com>
References: <ZmkrgTlxNwm_oHxv@google.com>
 <af45d1dd82b6abf5ec3633fdef5093d2@artur-rojek.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af45d1dd82b6abf5ec3633fdef5093d2@artur-rojek.eu>

Hi Artur,

On Thu, Jun 20, 2024 at 11:13:27PM +0200, Artur Rojek wrote:
> Hi Dmitry,
> 
> On 2024-06-12 07:00, Dmitry Torokhov wrote:
> > There is no need to allocate axes information separately from the main
> > joystick structure so let's fold the allocation and also drop members
> > (such as range, flat and fuzz) that are only used during initialization
> > of the device.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > 
> > v2:
> > 
> > - fixed issue with uninitialized "axes" in adc_joystick_set_axes()
> >   pointed out by Dan Carpenter
> > - fixed issue with checking wrong variable in adc_joystick_probe()
> >   pointed out by Dan Carpenter
> > 
> >  drivers/input/joystick/adc-joystick.c | 113 ++++++++++++++------------
> >  1 file changed, 60 insertions(+), 53 deletions(-)
> > 
> > diff --git a/drivers/input/joystick/adc-joystick.c
> > b/drivers/input/joystick/adc-joystick.c
> > index 916e78e4dc9f..1e30cbcd8c61 100644
> > --- a/drivers/input/joystick/adc-joystick.c
> > +++ b/drivers/input/joystick/adc-joystick.c
> > @@ -15,19 +15,15 @@
> > 
> >  struct adc_joystick_axis {
> >  	u32 code;
> > -	s32 range[2];
> > -	s32 fuzz;
> > -	s32 flat;
> >  	bool inverted;
> >  };
> > 
> >  struct adc_joystick {
> >  	struct input_dev *input;
> >  	struct iio_cb_buffer *buffer;
> > -	struct adc_joystick_axis *axes;
> >  	struct iio_channel *chans;
> > -	int num_chans;
> > -	bool polled;
> > +	unsigned int num_chans;
> > +	struct adc_joystick_axis axes[] __counted_by(num_chans);
> >  };
> > 
> >  static int adc_joystick_invert(struct input_dev *dev,
> > @@ -135,9 +131,11 @@ static void adc_joystick_cleanup(void *data)
> > 
> >  static int adc_joystick_set_axes(struct device *dev, struct
> > adc_joystick *joy)
> >  {
> > -	struct adc_joystick_axis *axes;
> > +	struct adc_joystick_axis *axes = joy->axes;
> >  	struct fwnode_handle *child;
> > -	int num_axes, error, i;
> > +	s32 range[2], fuzz, flat;
> > +	unsigned int num_axes;
> > +	int error, i;
> > 
> >  	num_axes = device_get_child_node_count(dev);
> >  	if (!num_axes) {
> > @@ -151,10 +149,6 @@ static int adc_joystick_set_axes(struct device
> > *dev, struct adc_joystick *joy)
> >  		return -EINVAL;
> >  	}
> > 
> > -	axes = devm_kmalloc_array(dev, num_axes, sizeof(*axes), GFP_KERNEL);
> > -	if (!axes)
> > -		return -ENOMEM;
> > -
> >  	device_for_each_child_node(dev, child) {
> >  		error = fwnode_property_read_u32(child, "reg", &i);
> >  		if (error) {
> > @@ -176,29 +170,25 @@ static int adc_joystick_set_axes(struct device
> > *dev, struct adc_joystick *joy)
> >  		}
> > 
> >  		error = fwnode_property_read_u32_array(child, "abs-range",
> > -						       axes[i].range, 2);
> > +						       range, 2);
> >  		if (error) {
> >  			dev_err(dev, "abs-range invalid or missing\n");
> >  			goto err_fwnode_put;
> >  		}
> > 
> > -		if (axes[i].range[0] > axes[i].range[1]) {
> > +		if (range[0] > range[1]) {
> >  			dev_dbg(dev, "abs-axis %d inverted\n", i);
> >  			axes[i].inverted = true;
> > -			swap(axes[i].range[0], axes[i].range[1]);
> > +			swap(range[0], range[1]);
> >  		}
> > 
> > -		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
> > -		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
> > +		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
> > +		fwnode_property_read_u32(child, "abs-flat", &flat);
> > 
> >  		input_set_abs_params(joy->input, axes[i].code,
> > -				     axes[i].range[0], axes[i].range[1],
> > -				     axes[i].fuzz, axes[i].flat);
> > -		input_set_capability(joy->input, EV_ABS, axes[i].code);
> > +				     range[0], range[1], fuzz, flat);
> >  	}
> > 
> > -	joy->axes = axes;
> > -
> >  	return 0;
> > 
> >  err_fwnode_put:
> > @@ -206,23 +196,49 @@ static int adc_joystick_set_axes(struct device
> > *dev, struct adc_joystick *joy)
> >  	return error;
> >  }
> > 
> > +
> > +/*
> > + * Count how many channels we got. NULL terminated.
> > + * Do not check the storage size if using polling.
> > + */
> > +static int adc_joystick_count_channels(struct device *dev,
> > +				       const struct iio_channel *chans,
> > +				       bool polled,
> > +				       unsigned int *num_chans)
> 
> You forgot to assign *num_chans = i; at the end of this function,
> which leaves it uninitialized in the caller context.

Indeed, and it needs to return 0 on success, not "i". Fixed.

> 
> > +{
> > +	int bits;
> > +	int i;
> > +
> 
> Let's move that "NULL terminated." comment here, since it's about the
> for loop.

Done and pushed out.

> 
> With the above comments addressed:
> Acked-by: Artur Rojek <contact@artur-rojek.eu>

Thanks.

-- 
Dmitry

