Return-Path: <linux-input+bounces-16787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D5CF3155
	for <lists+linux-input@lfdr.de>; Mon, 05 Jan 2026 11:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BFF930136EF
	for <lists+linux-input@lfdr.de>; Mon,  5 Jan 2026 10:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9841332ED44;
	Mon,  5 Jan 2026 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kPaJmSLr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E78232ED58
	for <linux-input@vger.kernel.org>; Mon,  5 Jan 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610557; cv=none; b=lnW+FSpg+FuWGOWQmaFQM9ojrpZbj0Ln8pWMfLC1CgIUvRXpFBUW29Cr+2YWAvdOu2JMTQzVAS6fzP0cCb5/8bCLQTv2z87u5vZie7zesHyw6kND2gblh16s5+b49GWllliJVIBnO76WkNeQBKG+BT7y+Gc927KAK6HWYZVkxC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610557; c=relaxed/simple;
	bh=gwAM3gYozmj68G3BkMYx4yPS500ChdCcsRj5wEpBaOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKEHLm86buUZJEMrsLrCw0CXF3dAhEyWROGv/X0KhGsSjvfoycQ3Oor9R0KFIBma88gv/yQ6eqYg9VrVJNGOtLciQqMaadBg6ylW8MPOhDCjm464R2/cQ3inOUePyRSdRIa1ON+RTF2caKTE+o3ig2pGlm1s6Xcdn0IyKZ7Cmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kPaJmSLr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso56429685e9.2
        for <linux-input@vger.kernel.org>; Mon, 05 Jan 2026 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767610554; x=1768215354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnIbT9EGamTtHAub2XVlZI7RjkEaaQIsimhhYGKZi4M=;
        b=kPaJmSLrheOj5Iku9kftAyjUtf9BIpLLuLEeijhDt9TIujariUoxdZ15vsa82Zbg/+
         YfLlQQOwZtAU5P4eJnddD9OYqDR0e5ovONUFpvlFsqBuA+C+ABwwkQMoFLxYdmx/gbGv
         htFtIz4WBDEgntI/0/9G/H3S6/EazJi0H/GKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610554; x=1768215354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnIbT9EGamTtHAub2XVlZI7RjkEaaQIsimhhYGKZi4M=;
        b=T9B5CgijmdCDr3rJfBtgK6v+/cs1ujaeap/m/6fbf6Sq0OCM7CeQhGDcb3VE8e14KQ
         yn8vQi7vfTkUcY+UmDFmKB3UZEp3HZnNVvLr2HN4WCIQLmvZl+OU9KbZmWNfeAmVl3xC
         kWh88x5N1RBxoUDTm1D19kUqrzFpres6nNz2ww3cZMu2FPOkZZ7BOoKdSIcBBRSP9TWr
         x/dnBeGe5E8YizTFGacL90NUemFXmMFOCQolMNsAGGlPh+hzAQsSh3EJ6UUEbeNmRCgi
         a1bU57JQfHaeS+QbO1C0/0yzWkCuZVrqLhJPkJXDVZZWT6YjnfZ9K5aySUpEOQJCliU5
         VC7w==
X-Forwarded-Encrypted: i=1; AJvYcCV+JK/D9z+oJPQ/QjokTDQzKfVcLuG0pdpGqlgeToi8CMe2jT61Q5b7bzm5ZSmO3sWsyhNt7cDvCVs6qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymXVG8o5vY12uyHvSZKxTSijtaXQm3kE/VckmAfhEmdlvtYP/O
	N9oZuttyDCKOb1UTVk+2D+lzsNoQWuK0x8QicSL2M5sAwVNumET0+NtDaXAYa07qpg==
X-Gm-Gg: AY/fxX7DufPCMyRkKFqhKFVtK6pRIcJ6WH4qrcCimh7X/eZNR0fflcXLgW8ZRAHq32I
	QBiieqULCQ6CpSNLfY4qeUhdKB4Ud8mi18Ae4xOYqtrXe3VgxmmtlPMpzGkyIesphSMplaUDtTf
	ckNtiGqKGpcVKPhDhGqXdN9IgYNPG27d2e/ZC2ALpFtyv100k8yN4RDh/2QSeMrgpQQoizTbTxt
	xuyWCx7jqeUHl1wd5ldmvs90MCRwQ3/N1veH8GJ7VsMaHkTRVNNHfPmVTXEen4Gy7TjY4nNH4C4
	gwlO06jFPr0dhfG+0p2SkcEGb6vKEKgDqjwHlbl28vJuVhPghWkmrL3OLZ/pnTIDUs0B5x74xw6
	as7Z+Uo4FitpVRX9XLo1bnSzgBG4s8yPJ72hZClT6pWHeQoR5JlPUj/e9Omz5g4VYrron4k/Obf
	LyGe1Hvg4GZlOgQqAX6A==
X-Google-Smtp-Source: AGHT+IFA865YiL/SGKYZvDw31gF6v3vjD/bgpQhTY+81CJ5vFnSIbiTZ9Gkdx9EH+BTrotYpNM83Zw==
X-Received: by 2002:a05:600c:c1c8:10b0:47d:403c:e5a0 with SMTP id 5b1f17b1804b1-47d403ce6e0mr358741175e9.12.1767610553632;
        Mon, 05 Jan 2026 02:55:53 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6da2425esm146867955e9.12.2026.01.05.02.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:55:53 -0800 (PST)
Date: Mon, 5 Jan 2026 10:55:51 +0000
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
Message-ID: <aVuYt24q6nihC4t0@google.com>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
 <20251231143538.37483-2-fabiobaltieri@chromium.org>
 <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>

On Mon, Jan 05, 2026 at 08:52:56AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 02:35:37PM +0000, Fabio Baltieri wrote:
> > Add binding documentation for the has-fn-map property.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > index fefaaf46a240..fa24b1cbc788 100644
> > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > @@ -44,6 +44,14 @@ properties:
> >        where the lower 16 bits are reserved. This property is specified only
> >        when the keyboard has a custom design for the top row keys.
> >  
> > +  google,has-fn-map:
> > +    description: |
> > +      The keymap has function key layer. This allows defining an extra set of
> > +      codes that are sent if a key is pressed while the KEY_FN is held pressed
> > +      as well. The function codes have to be defined in the linux,keymap
> > +      property with an offset of keypad,num-rows from the normal ones.
> > +    type: boolean
> 
> You still did not answer to my previous question, why this is not
> deducible from the key map (presence of KEY_FN in the map).

The driver behaves differently with the fn layer is present, has to make
extra space for the extra codes and enable the logic to use it. I can
certainly detect it in runtime, would have to always allocate the extra
space even if not needed and check not only that there is an FN key but
if there's anything in the second half of the map.

I'm not overly enthusiastic about it, it's a bit wasteful on memory
(probably no big deal, half a kb of RAM I guess) and somewhat less
defensive to misconfigurations and in general I don't like the new logic
to be enabled magically, as a side effect. It'd be extra complexity for
the sake of saving one boolean property, but sure if you think that's
the way to go then I guess I can implement it that way.

