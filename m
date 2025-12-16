Return-Path: <linux-input+bounces-16603-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD7CC2AB9
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 13:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 469EC3001189
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 12:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E301D36404C;
	Tue, 16 Dec 2025 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D5CFOYdu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D854936405E
	for <linux-input@vger.kernel.org>; Tue, 16 Dec 2025 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887792; cv=none; b=ftsqEjEC4dB+tYCnaEK7WI4zRCU8OEMfB5ZobTmAXUCWWxrW0EB8USaAF2pjlXnWmNLXlNMhDSwaA6h5oyNdTm/5/Li8sdukD5aqsgjE9ePL0ycvhfXy10OfBJodetXIhMwDGzvlZoFbc6C+bYQwb0qVQHAuIUPWp8ieTUnDF90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887792; c=relaxed/simple;
	bh=dfFLfO0ptAFRHmhExPG4tG+SrOWLV3PRoWoWAvlCWZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QacGIZV8bUbMi7TLkeNyl7/ResItNjDIffUpx/lJpnmSkEbAcRCnzbTuqLPiFpjPv3eCRgIVrF6OaQtvj9rjvapUC9U2lTpUeqMA5bLK3zFbKsffIc1tYpByM/8vcZJFVwRBGv5r4OvGgcPGASKOx2DdYyRYZjIg/08wprE4k7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D5CFOYdu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775ae77516so54160165e9.1
        for <linux-input@vger.kernel.org>; Tue, 16 Dec 2025 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765887789; x=1766492589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h316dcGD2rwPUezt7Sha/j6r4wregmlx5HRe5NTOxZk=;
        b=D5CFOYduLqnqeB4BEsYBTrGgkv3kZaqQxoTE662qxg2Ahxn43kOkQDV4LaD1DIlEnR
         l6deO7/jt8O6CbRiH4Oml0dHdtzc66WK36ZYhG26IOc8kbOv/oNplbvuDCyoCqcfdvSY
         dVnavG0dgtWt1YCmScfiHvMsCZkAjqdNX6vgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887789; x=1766492589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h316dcGD2rwPUezt7Sha/j6r4wregmlx5HRe5NTOxZk=;
        b=EBw7cxF8KnkGawBTCFNfjlm2aJw9cyynJCYExQ5jQZzvEvYKL8nu/Y4eITZ1H4XjHp
         pDGv3djdxhynLKYvfuxKb6zzfMYPVkfKdqRdWxH71uXwqWzJQ+NybKyTDfo2pDcVTPbN
         nWhjy9pXQtw769cQ/wcLhB0agWmhQJh4SP5y0khjpxPcZe3DpGXWyJVm+oDMy98HCOef
         yGlQQ4NkX3YCyYPPabNHNRfwwW8AdMjrYz/IFLL/5UMpfHgm/V72VSWHjwwoXIhUNrzC
         eqJI/PKxPX+kPaSkh07tWvTD7un/ej3Xt2kTKbqAleNxKgmSzrAdyVD9r5Tj5WfwJuYf
         0IEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0MtPWkcMMuyiS6SqZnC7NtGtpyDFS5VdC2x5wIuFjBD3TlVythKta/4HBTwzCo2c05PB8zTHSvYDb7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6puziTZNx8EIqNHgI74NcqxAzCbjlENCvMgvzWKfRT3166Elq
	ceGm/O08GFr0fpsfzjWFPDwHtH+Kv8rXZoJymfbfuqaV4cVPOFCFq54YqWNdogQapA==
X-Gm-Gg: AY/fxX5hD3AvjhZPdemsRAAsfSNWEwS0SaKMY9oFCUNW8CDjLvbAxajTTxIscZTG0dh
	HTwtOIFKVYaWZjAavddYATHzi7Cm1HCWBoTodjh+6tebRKAu8IdGBFvZprxeon/oJY4M3zSMb5q
	QwV3JmY8UupW/XKhVJHlM+fHtIQuERNvudoZBxK7b5FzhVEh9lZpWQ8jKiE74HgJiAuQdjx1HdV
	bsJaYxBpuRGPwVDPdcyxtCkmy+fnISJmEeFoggeHMgMn/rVem5sKJrZo6YUDsC/lHORUddsNDAD
	aJ5anMU/0kx3tgZul+q1T6S0XOf7BiNOppVW0LP569Vg/0D4EQp6/BcY1XhEAoq90Z4XdCG0qsl
	0O4v+VtJuwPpe2r3/OrWDO1aX55vahbc5tubFSqzU8hYUizyD7aJxKrwqIVYY07wW/BMhu4EL/4
	K+joygbWa/dqkoLwlpKA==
X-Google-Smtp-Source: AGHT+IEm+5HCpyXQp1oGKIquvN54q28Rxd93e/rPeh39dklBFP6Br1IgDSqj5RZRcvjkEJoAcLyZ/A==
X-Received: by 2002:a05:600c:4f84:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-47a8f904528mr153930615e9.22.1765887789170;
        Tue, 16 Dec 2025 04:23:09 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f38a4e9sm308116605e9.2.2025.12.16.04.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:23:08 -0800 (PST)
Date: Tue, 16 Dec 2025 12:23:06 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <aUFPKni-iFkxQQGu@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
 <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>

Hi Dmitry,

On Thu, Dec 11, 2025 at 08:44:02PM -0800, Dmitry Torokhov wrote:
> On Wed, Dec 10, 2025 at 06:00:29PM +0000, Fabio Baltieri wrote:
> > Hey Rob, thanks for the review.
> > 
> > On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> > > On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > > > +  fn-key:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: |
> > > > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > > > +      col, code) macro, code is ignored.
> > > > +
> > > > +  fn-keymap:
> > > 
> > > If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> > > Depends if we still think linux,keymap is Linux specific?
> > 
> > I'm open for suggestions, trying to understand the pattern, these are
> > specific to this binding I think if anything they should be
> > google,fn-key and google,fn-keymap, similarly to the existing
> > google,needs-ghost-filter -- no idea why function-row-physmap was not
> > prefixed but I guess it slipped in and now it's not worth changing it.
> 
> Just double the number of rows in the regular keymap to accommodate the
> FN modifier, no need for separate keymap. Also no need to have fn-key
> property, use whatever key that reports KEY_FN. See how it is done in
> drivers/input/keyboard/tegra-kbc.c

Had a look at the tegra-kbc driver as you suggested, first thing it
seems like the fn-key functionality there is dead code since 2013,
`use_fn_map` could only be enabled with platform data, not OF, and that
has been removed in 3a495aeada2b, as it stands kbc->use_fn_map can only
be false. I could send a patch to rip off that code if you want me to,
clearly it hasn't been used in a while (unless I'm missing something).

About the extended fn map, I've two problems with it:
- it seems very wasteful: the normal map is loaded in a linear array
  so it can be access directly, which make sense as that's typically
  very densely populated, but in the case of the fn keys that's going to
  be mostly empty, I'd expect ~20 keys top from a 18x8 matrix. So that
  would waste load of space, direct access is good but for ~20 keys I
  think it's fine to scan it, especially since it only happens when Fn
  is pressed.
- I'd end up with two values for cols kicking around the driver, the
  real one and the one used in the map, which I feel adds confusing in
  the code.
- more importantly, one would have to keep the offset in mind when
  setting the keys in dt, we rely on OEM doing this and I think having a
  separate property with a meaningful name and a map with the same
  row,col and different code is more intuitive and would make their life
  easier, especially since we ship with keyboard of different size
  and the offset would be different depending on the device.

As for the fn-key property, unfortunately based on past experience I'd
expect such OEM to want to change that code, I could specify the code
rather than the row,col but I would not plain hardcode. Even my
(thinkpad) laptop sends KEY_WAKEUP for Fn.

Cheers,
Fabio

-- 
Fabio Baltieri

