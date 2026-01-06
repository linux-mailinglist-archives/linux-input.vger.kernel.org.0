Return-Path: <linux-input+bounces-16791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9CCF7F40
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 12:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0274C30C3BC0
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 11:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B275E337BA3;
	Tue,  6 Jan 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZRv1uO3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F5335557
	for <linux-input@vger.kernel.org>; Tue,  6 Jan 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697285; cv=none; b=HLpBhN7m4skfmOkJPuzL9X3SzsYb3GQFgPvNeR1N10pxAmL8uQ83DbjzWJ9G/yCu8B7gqxH2MM4rgPBIwYzG4kPs/Jey4kmAxpEPqMpa+aa2kvBgIUzke10aQsNnSbO0BmPsJa3R7StueeCOQrPqglvbyxmBbmtlkcVcQuYH3pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697285; c=relaxed/simple;
	bh=K8B1ITgIq3FUq81iGq9UYGee0jVJIvlcDFoY0m6i980=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dld/u80/x39aBhpLodUVZN65aoV+ZSQAsy/wYuTdMPxBecVdzFbnYOJvw+NFf/FtyGGnV2DlUlYmUlnu9CrHFAlB0LuRizprXUNJJmwka8yfqhOYNuHojroq5ZG5s2UhICvjZyhlzH460q1VF/fkwr7fNG3cVbPOpB6i5sEhU9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nZRv1uO3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so539502f8f.3
        for <linux-input@vger.kernel.org>; Tue, 06 Jan 2026 03:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767697282; x=1768302082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3m/v4VXTV6NMfNLvVjfAE6l9ij7+j/SxZwfjGUHi2c=;
        b=nZRv1uO3zkmd8QC5Vlihl4uoydpF7fR9m2RAkVFjUx9Xdj7uKX2uRSXip1oGOs+YGv
         wpbkvTFeG5xOJQb6GuGWeTLH/pSHdY+bHbRoI3VTCjJAvL9fHnOqiR49oT+w5qU7Lctn
         g5nkdyErB7GxgqhPSz0YLcQeFjkdfIVqKuvI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767697282; x=1768302082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3m/v4VXTV6NMfNLvVjfAE6l9ij7+j/SxZwfjGUHi2c=;
        b=rJ+6dVpHgubmh1N86ggpmuXMuxXFYsYnCuzKyE3crg85PCX1pbt8esuciwVdUKP//1
         cdniO0FvkEBPMoTflgyo4z2wZINLMm6pROACs4l3ryWZB72bDYcqpRA87Bu7ofVbAnBL
         oKvZvGmxXJN96QDLm6iOulMg6+CmIrMxAKDvBafrsH8ZYGn2V6hSi7mW3x0PAX95G+QO
         YDj5xVjbsqIM+h8rgibFyg0QdBfph5rbl2jPtaL+oDnMdjtdhfvhlLhIbVmg8zQ0o86C
         SL9VgnIsQIRG8EwJFQs+/1RvVyGmlIICSGEh+3J73CUAMeFW0+KeDjWHM8kJ7skOeKcs
         l6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX1h3W0rzlb8f8kdzcC+S75P59ODh+FS2ZFjzfsc+KGvHCMCkvDsZGVi+9Gh86NQvO1fgZ0Y0z9k57tWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNh3t4h7J5ZQ4xiA511pTk/RhABsW2aY5JFMtxmnEFz8sIF/eC
	dDUhTQqWw/CW8IFn0sOqYwlDG9p8raAifEg889ucLo2P+sKXT+WXtRCvH0MONF1zjQ==
X-Gm-Gg: AY/fxX4KDlY0/+JPnhpSFmzaJnXClhlHTvdUC3MJaNlbHenZZESKn5q3tIrZZEtCwEH
	LXm4NAN2xgoEOiam0OG+OaHPXWAyp3UAJbCrihZpVItdYGQrqQ274K2KMYtsTdGswYZFoXFR904
	R+SECRfG58s0KbpTF+48wg8nw8baavEDr6NChSBI+44ZidKket3JlD9/f1jgIR4HCoibiHwNAzl
	eRNqTw2fbBqD/tZRwnwjfUhx53ViA7zMoEX/M2OTi9BF9Hg+GVzfEtdsJ6wR0DeYtV6kJ/bZ8kM
	MTwwPidI3DtEAwk0/zewR9RC8Wjwtz8d9lzXDnEBusijVgX3lyPyNBKy9iLQaTFtEsDFSQ/BHUR
	TkvLvwuXviZnrpAbMcXEcCE061aIfXht5saN0mYoDtcZk0rAE/8jCrm4jS47m8XlOuLsKjbgiGN
	ld6FEqeMv55csO7fzsrQ==
X-Google-Smtp-Source: AGHT+IG9g5Uruo7F3IpKCSwx4dA/EzxEcppJATTbysJnloBLnkO2XLfNlAmhjuyITGfSxfeZpj0FHw==
X-Received: by 2002:a05:6000:2c12:b0:430:f9c2:8500 with SMTP id ffacd0b85a97d-432bc9fc09emr2909739f8f.43.1767697281958;
        Tue, 06 Jan 2026 03:01:21 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16d2sm4050362f8f.13.2026.01.06.03.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:01:21 -0800 (PST)
Date: Tue, 6 Jan 2026 11:01:19 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: add has-fn-map
 prop
Message-ID: <aVzrfwY8SrIAGn-e@google.com>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
 <20251231143538.37483-2-fabiobaltieri@chromium.org>
 <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>
 <aVuYt24q6nihC4t0@google.com>
 <20260106-oryx-of-major-protection-10c4e3@quoll>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-oryx-of-major-protection-10c4e3@quoll>

On Tue, Jan 06, 2026 at 08:27:10AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Jan 05, 2026 at 10:55:51AM +0000, Fabio Baltieri wrote:
> > On Mon, Jan 05, 2026 at 08:52:56AM +0100, Krzysztof Kozlowski wrote:
> > > On Wed, Dec 31, 2025 at 02:35:37PM +0000, Fabio Baltieri wrote:
> > > > Add binding documentation for the has-fn-map property.
> > > > 
> > > > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > > > ---
> > > >  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > > index fefaaf46a240..fa24b1cbc788 100644
> > > > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > > @@ -44,6 +44,14 @@ properties:
> > > >        where the lower 16 bits are reserved. This property is specified only
> > > >        when the keyboard has a custom design for the top row keys.
> > > >  
> > > > +  google,has-fn-map:
> > > > +    description: |
> > > > +      The keymap has function key layer. This allows defining an extra set of
> > > > +      codes that are sent if a key is pressed while the KEY_FN is held pressed
> > > > +      as well. The function codes have to be defined in the linux,keymap
> > > > +      property with an offset of keypad,num-rows from the normal ones.
> > > > +    type: boolean
> > > 
> > > You still did not answer to my previous question, why this is not
> > > deducible from the key map (presence of KEY_FN in the map).
> > 
> > The driver behaves differently with the fn layer is present, has to make
> > extra space for the extra codes and enable the logic to use it. I can
> > certainly detect it in runtime, would have to always allocate the extra
> > space even if not needed and check not only that there is an FN key but
> > if there's anything in the second half of the map.
> > 
> > I'm not overly enthusiastic about it, it's a bit wasteful on memory
> > (probably no big deal, half a kb of RAM I guess) and somewhat less
> > defensive to misconfigurations and in general I don't like the new logic
> > to be enabled magically, as a side effect. It'd be extra complexity for
> > the sake of saving one boolean property, but sure if you think that's
> > the way to go then I guess I can implement it that way.
> 
> Driver logic is not an argument here, we don't care about it. You should
> answer why presence of google,has-fn-map in DT makes sense when none of
> the keymaps has KEY_FN. Why this is a valid and desired configuration?
> 

Think I answered that, it felt like a clarer design to me. Anyway I got
the message will send a v4 with runtime detection, it's certainly a
valid option and works out for me.

