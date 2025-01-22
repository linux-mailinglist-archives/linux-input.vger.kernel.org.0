Return-Path: <linux-input+bounces-9478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C7FA1987A
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 19:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA794164E94
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 18:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BEB2153CF;
	Wed, 22 Jan 2025 18:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+IjRY6u"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD0215171;
	Wed, 22 Jan 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570791; cv=none; b=B66CoNzevJfvgxec68q6HnC7s+bkebeML63u0jCGFUvl69oOBPSV0AJui+GxisGkOm6PgRhwhi6rBSLYXs5KDpL9xkbQ/HWDwaE/M8PdqodiffVKxQ6ivjiDTkGkvkzkxkKyx6xW0QZdziL0XWcGqTrZLz1AzvK1nJKaAjKg6vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570791; c=relaxed/simple;
	bh=JGbcoN7cGb3jh+qZ8vvEgIReoX/pFz2JclEC553QMIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS8SZoV1j7UuhjcUUcCtJWVNdwFvdMefaA8sJbdK+tzJIpfG8QgzmeBS0p1zYvkroAwPAUr6PMkjQo1aAITLbpb3qHgVwM3U+iln2b7OpWPOE+VOChNhzu6S/1wXXWMfctg1XJpOTvXl0+e7QMTrx3YZEo8huxVVIu5XpSBe7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+IjRY6u; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f42992f608so217569a91.0;
        Wed, 22 Jan 2025 10:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737570789; x=1738175589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGxAfr1RErIaTjlH3ywSl69/Jh18iaYDydnvNAEir6k=;
        b=f+IjRY6uOQ2lm5cHdHXyTJfqHbavbOEDvpW5clj/EphpHMh6T0SBzLW6B/YvGOJJ4H
         HvzKraPzLM4eVVBSYrBu0zM2KdHC2gaWoKWq9mt1qY2PJhqSI7Qu0CyX2ybp3Y+IzTv3
         VNQI1IeNBPtu6+CBowMZ9r2lx9xNIVRmDE782sVmGNi+umRm63ne+EfqVeoUYfNtMgZ0
         LnTRZwRp2hbmU+HtNzhwKbrbFGbo4JqyX+HmPD60rNeCDmrRCXtb7OYydrxEpOuLLCWx
         gdTamjQAngRRzO0aQaKcbm22gvUBi04YRtbRPOZwF/rvY7ZkhDE+528nGNXi1zRDEoqQ
         zj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737570789; x=1738175589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxAfr1RErIaTjlH3ywSl69/Jh18iaYDydnvNAEir6k=;
        b=oi5TR5EKpCTpQYG1h7p5ugEFr+vzoFkNB16hTPvrlb/PKdfTrMRkrJSOQDi8U3bZYN
         18PUpWkVl4BjdYkdiXRBNHt9HQCdoHaebFvlavEgQelaruatGiaw748w1PxgVUDHPlWh
         5ZvvUbjLJ55B3J38gnh/neUrHlrIZAMWTQA6QmlwM0rycGDRev+QhjoVBPvfSSLeVbGA
         APsipcxyUWgAYLJ4pjimBjcVwIy5yC0I0K9aiOXhGgTCWrzGDSsPXSDjAY8zE1l95rPp
         2b5PlVkx3gyRILGGCjlfP8Ng5L/dClPxabVG1xeMo+u2dClZF9oAhpMMOe/pAklEu9eP
         ttOw==
X-Forwarded-Encrypted: i=1; AJvYcCVjBijGX6qq+UYvB+g4k2DUaEmbXspe3DOKUlo3iCCcSanti348Q40sxuBiMVHJlm3zkZyzAumE8lvTfvg=@vger.kernel.org, AJvYcCVokjQ5gEvOStuySVksFs0wydW93bU57nAK/4zm/IJJkgm+Z5csoOs4Ih+9Ep+lBglLQzTLlk/GoxKj@vger.kernel.org, AJvYcCXfu79KytxiQHEkAewRy5CfLf/3KSZxYiuxtTcH+7M+3GnXpjm7NW31rrvZjmOHj1ov5nOoZJNbwY7YvP4y@vger.kernel.org
X-Gm-Message-State: AOJu0YxZq8Y9z4DJTCuqLC0rj4CJsy2Mbj3tcZs4Gwab+S2pvRUE4uNW
	zLbe5NF1XqHobNXABGB0pSeDC70R+EZMxaIlVsBO+JuL7T3QdR3P4zkv2A==
X-Gm-Gg: ASbGncvUEiOWSPhZ856PJ7H675fH/fCmqCC0wlF6NKxVqlTgSdMhRqs4LnaU6orjYgN
	hya5KKMRSajWOi8/mR9ZKCWvV8tHu8YdQnSOjadFNESx1Lf64OgNPnzqMEX9xXkOWz1OjbGvFlj
	6bMH+WWawfJJg91CbHoAv5vnFZqhDSeEto0nb02s8VqjasqLT/m6uvnMsP2rtxDEhDyK7MGaLTe
	lyHg9gXfmz8Q7/US/B79EjTgkkfJUVViUjVR5qDZMcuuoyw00nKilohrpLTEIgH8MxYQw==
X-Google-Smtp-Source: AGHT+IH7KCx6ZerR7Y/ysqk3oOOXRwJAIgtVJJs/HwWggKSL+QPKg6M5ZcOSafU6EcNPqL9uv2Ogdg==
X-Received: by 2002:a17:90b:51ca:b0:2ee:5bc9:75c7 with SMTP id 98e67ed59e1d1-2f782c4bdc3mr28221471a91.5.1737570789085;
        Wed, 22 Jan 2025 10:33:09 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:824e:c27f:8742:e4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaca04sm2015449a91.27.2025.01.22.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:33:08 -0800 (PST)
Date: Wed, 22 Jan 2025 10:33:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z5E54dQQl9LE2znf@google.com>
References: <20250118-z2-v5-0-6d38b2582169@gmail.com>
 <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
 <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>

On Wed, Jan 22, 2025 at 06:40:50PM +0100, Sasha Finkelstein wrote:
> On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > +     z2->input_dev->phys = "apple_z2";
> >
> > Phys is supposed to be unique, however my understanding there could be 2
> > devices in the system?
> 
> All existing devices have at most one z2 device, and while i do not
> have visibility
> into future apple product decisions, judging by the current stack, it seems
> unlikely for them to make one that needs two of them.
> 
> > -static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> > +/* Build calibration blob, caller is responsible for freeing the blob data. */
> 
> A comment on a previous version of this patch requested to not have functions
> that require the caller to free the return value
> https://lore.kernel.org/all/ZAlM2DzMmwzWIZEF@nixie71/

You have to pick your poison. Either the caller has to inspect the
property to figure out the size of the allocation, handle errors, and
provide diagnostic, and then have apple_z2_build_cal_blob() re-parse the
property and fill the provided buffer, or you can hide it all in
apple_z2_build_cal_blob() and task the caller with freeing the blob when
they're done with it. Similar to request_firmware() and put_firmware().

I think the latter works better in this particular case.

Thanks.

-- 
Dmitry

