Return-Path: <linux-input+bounces-16616-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1042CC9386
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 19:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D12B6314FA96
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 18:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803C726299;
	Wed, 17 Dec 2025 18:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RegB8Qiv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92537258ECC
	for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765994751; cv=none; b=nFa7BooMYB7TtB1yziV7bYx2H7QvoEANt5wKLjIU9EI6WKM1FAT5GcZIexmv8J6HkdE51pnB8KyVDuNVgOXOd+53spJAarsUB4LvLDF0zjUZik7SR72/9fnbbXrAafiRCw1HzLp6QLCXTqJx+0+u8bQXW2xBCcbtof6YLnf4pew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765994751; c=relaxed/simple;
	bh=fCWiyQYPca+nvNeYkPrsg8l58+2d9hcv3WRYXCFhOAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omSOu1EqvxTH+giQVLF8bJEy2Iy0JqHo2T0LZ7WDmyDcCsPnlRphywucBlrKsarAvuBQ/QMGhAig7SF++ruHDdSwJTvxWUzMjKE2sv6tIvGzfxurtKAV/Yuzw70ZOUAJGa97kHZ52YruVe3dtjVN4wpQl4E1yJATnFn+DVvhoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RegB8Qiv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f0f875bc5so80498345ad.3
        for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 10:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765994749; x=1766599549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ+Wh0xNBReUdUR45vUeWefJp7cP+N3hdwazYMqKhgo=;
        b=RegB8QivtzPQD0pw9eSZqCr7UBzRIU3AOesOBkazv1ddQGzXlfWsfbSWh7S0AaVJBK
         Xi97hl0uabO/297LBUHiNsRYCtkwQPF09znNWURf/IH9YUK0o3ckIyu8tRuf7GDVYbVP
         UAlxC2jR3Dkyrn/D/tjauKVwpcZSGJR6n8iAWMiDn19jw15lbE95TST3GhnHpsmZbRYr
         CCtqSu2IsOX+nMqRYbiHdOAMmKIbrsV2qEQt7IeKpmyNRcFmeT6gV54RpGdlVuQf+kEO
         m4hr2mPwdtOuPojtqaRYoVTtz6EG0t/A2CXnJhOK8e0/mWyC7npHedMdahvF3dnm2HDg
         9bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765994749; x=1766599549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ+Wh0xNBReUdUR45vUeWefJp7cP+N3hdwazYMqKhgo=;
        b=o0ybpYY+PRrE+SPnKDHJez2VPh1vRb4ZQmUS3C7ij7byUVta/53LHozn/G+rmQhX8C
         4oQh1usSX6TiFq6/2HckY2zluCua/Y5E4whG+D1Eqk5nUHeyqlYevb36/PgNgbaABYJk
         8P1PCFZ0n+4cPmFE1ILaEUBEsUdvEF4S6ypz0YnonzQ9ts7ufMzg3YkIixVQuGpXM9PR
         z6oT4VPXn2RuFeMJN2rnWf318l31RN9R5C98xngVld3QzZisiYkqJXmdiZB1wjmcM2wU
         9Lx8N31ceZdJjL2ftHWckngTBO0skb/sm0zGIvP5HJ4B4ONTF3QTGhJaE7PeexV3LYfb
         rgLg==
X-Forwarded-Encrypted: i=1; AJvYcCX8jifW2gtF0g/u946Oo1ejm0TUpAa/LPIhRmAZBKKpB0yG5LQXy0yoMhtG+MINoejQe+PhFjR1Glby6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxszmCr/3L0ytqwS/6nMIhzhPkTPQlixsZXK78+1bJHRSaTNh5t
	MhojebLihdlegRbP94xPG4g1/UjYknKFrh3NDcvrUMLmDIgCJDSdiid7
X-Gm-Gg: AY/fxX4eZX/qfcXl17Re0JUj0fbdIOIK1NVrNx/lBL1Ei1dL1fQ+/+C2voYSktRcHNl
	/M9UYbCRbUWX9YPFRFtG3+HTRE9xrrWkd9r1rDg9nO5sselqxM+IxbD9SkrQ+hdTM8jjhHQj82U
	mvcoF9vszbanDOK6RtaJ1/5fpheVLmzVGEi23goAJE/K+1a8YCQgsuhKp9EQcHWSiiTN6LgeQnD
	AwZAZFok5gt0p1XweGqk4doVpjTXteuc2L9+ge4awuWkqAAKh+3hoOsMJIx/W4KBdgDdhJdeO8O
	trreAqLEsDPhCn6YCiOaqGiPPsaCdB+BBJ/xYTJjrwkLAGtj/ebpJ3l6ottPfS3TEyRj3JjL/xA
	NBBYaXJuDCuvCgu7VNPN74OvTCI7LGczYznbHiBZD2QQ0gOzNVSi9IlPI2cDn0GkdTYdmF3wEL3
	uqT60TkjpOD09XWZep27ov29SPrjv5O4xruUtvH8yX06bXngEtYQ==
X-Google-Smtp-Source: AGHT+IEsG5kPC7PFC1E5kE+BODk9O4ruJ6wx9lSNpfYD+lFEkTLCuj5suLNYSIL43zw4PUMGaxx2jQ==
X-Received: by 2002:a05:701a:ca0d:b0:11b:8fc9:9f5d with SMTP id a92af1059eb24-11f34c4d15emr13268343c88.30.1765994748500;
        Wed, 17 Dec 2025 10:05:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86:f92f:a027:b12a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061a93616sm409533c88.14.2025.12.17.10.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 10:05:48 -0800 (PST)
Date: Wed, 17 Dec 2025 10:05:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <nx4lo6qfyfoxha7poyipa2hjc2vogp6twxbcap2555aj4y56gg@ddhkfh7eifvm>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
 <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
 <aUFPKni-iFkxQQGu@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUFPKni-iFkxQQGu@google.com>

Hi Fabio,

On Tue, Dec 16, 2025 at 12:23:06PM +0000, Fabio Baltieri wrote:
> Hi Dmitry,
> 
> On Thu, Dec 11, 2025 at 08:44:02PM -0800, Dmitry Torokhov wrote:
> > On Wed, Dec 10, 2025 at 06:00:29PM +0000, Fabio Baltieri wrote:
> > > Hey Rob, thanks for the review.
> > > 
> > > On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> > > > On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > > > > +  fn-key:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    description: |
> > > > > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > > > > +      col, code) macro, code is ignored.
> > > > > +
> > > > > +  fn-keymap:
> > > > 
> > > > If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> > > > Depends if we still think linux,keymap is Linux specific?
> > > 
> > > I'm open for suggestions, trying to understand the pattern, these are
> > > specific to this binding I think if anything they should be
> > > google,fn-key and google,fn-keymap, similarly to the existing
> > > google,needs-ghost-filter -- no idea why function-row-physmap was not
> > > prefixed but I guess it slipped in and now it's not worth changing it.
> > 
> > Just double the number of rows in the regular keymap to accommodate the
> > FN modifier, no need for separate keymap. Also no need to have fn-key
> > property, use whatever key that reports KEY_FN. See how it is done in
> > drivers/input/keyboard/tegra-kbc.c
> 
> Had a look at the tegra-kbc driver as you suggested, first thing it
> seems like the fn-key functionality there is dead code since 2013,
> `use_fn_map` could only be enabled with platform data, not OF, and that
> has been removed in 3a495aeada2b, as it stands kbc->use_fn_map can only
> be false. I could send a patch to rip off that code if you want me to,
> clearly it hasn't been used in a while (unless I'm missing something).

I guess you are right, we shoudl clean that up. We have another newer
driver that uses the same approach:

drivers/input/keyboard/pinephone-keyboard.c


> About the extended fn map, I've two problems with it:
> - it seems very wasteful: the normal map is loaded in a linear array
>   so it can be access directly, which make sense as that's typically
>   very densely populated, but in the case of the fn keys that's going to
>   be mostly empty, I'd expect ~20 keys top from a 18x8 matrix. So that
>   would waste load of space, direct access is good but for ~20 keys I
>   think it's fine to scan it, especially since it only happens when Fn
>   is pressed.

I am not concerned with this, as this is a singleton device. You
probably "waste" as much space in the code segment by implementing the
custom scanning logic. Additionally with the consolidated keymap
approach you are not breaking ioctls dealing with setting and retrieving
key codes.

> - I'd end up with two values for cols kicking around the driver, the
>   real one and the one used in the map, which I feel adds confusing in
>   the code.

Not sure I follow. You still have the same row and col reported, just
when figuring out the final keycode you need to add an offset.

> - more importantly, one would have to keep the offset in mind when
>   setting the keys in dt, we rely on OEM doing this and I think having a

Do we now? I thought we retain greater control over this. Maybe we
should sync internally.

>   separate property with a meaningful name and a map with the same
>   row,col and different code is more intuitive and would make their life
>   easier, especially since we ship with keyboard of different size
>   and the offset would be different depending on the device.
> 
> As for the fn-key property, unfortunately based on past experience I'd
> expect such OEM to want to change that code, I could specify the code
> rather than the row,col but I would not plain hardcode. Even my
> (thinkpad) laptop sends KEY_WAKEUP for Fn.

Again, we need to make sure we control OEMs better. On Lenovo Fn sends
wakeup only if it is not combined with another key, so it really has
custom logic with events delivered either through the main AT keyboard
or through custom interface in thinkpad platform driver. We do not need
this in oiur designs.

Thanks.

-- 
Dmitry

