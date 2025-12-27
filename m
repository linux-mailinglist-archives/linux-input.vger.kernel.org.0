Return-Path: <linux-input+bounces-16704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11475CDFE86
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 16:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE5B43010CCA
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 15:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BB0261B8C;
	Sat, 27 Dec 2025 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fk53Uzd4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07E257851
	for <linux-input@vger.kernel.org>; Sat, 27 Dec 2025 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766850497; cv=none; b=eIrCELwk//zrlsn9iDxBdVcasac6oKlNdgnBHix78IhrHtQWnjzq3E4c4wuc1J5Uqy+MLNRfvbsmU60qLSRO9n93gTMp5xtHwW/apOyz9g8yfmgMRd47h1RHrn92ZyesMPMWzHc6Qf1N1xLNyMZNYfab/cucgPH1FVuM5tb6Ga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766850497; c=relaxed/simple;
	bh=6EyvenFkUbRfEc/p3VGn5q6/vzpXU8dt1a2C1/gKoHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxK/ddH+TV/QImNC3m11Ym5PrXxTPM3ytOcpnrqt05ghpwwnPpTKrwIddny3O+hNMFZGJXaIW1ls1tyn5opkJieMfGEshgFB/aD4ldoV0SI4NH9o9sAbnm8mpQLv8P5OQ/o/n5ih+NRzyZOr/1SX+yN3vnWEUyegZYTod8mYCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fk53Uzd4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so47245735e9.3
        for <linux-input@vger.kernel.org>; Sat, 27 Dec 2025 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766850494; x=1767455294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+FpSWC3Nc9MHvTyQKmZfza7qICMlSOsmY2JJtFLFDE=;
        b=Fk53Uzd4i7UdaJwJC6PZ4zKjkdsmvbtL98FOY2BlbEFJix6Q1zsQ227YrJ8dZYzB6X
         b2ObaJu14FC8AQSmm5ZTatNvhGfA+1VVKeIHhuVHhc3pu6XEHKMtSq3c/Y9rG6NY8QkC
         3Y9NaHDc6tuSWvvqiPlqky2YRitYTM0k6PYL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766850494; x=1767455294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+FpSWC3Nc9MHvTyQKmZfza7qICMlSOsmY2JJtFLFDE=;
        b=H+VSRD8fF0euT5VrtcrY4OvnJjo1K2xiLsQZuSpVf8CrcQiGTapPN+8iBfCqbEAHZn
         FF5VD7Hmsg1V1XvSGT+VNh9ZqwOJ6qLwTlVa9QMszTq3e1OBbtXFQ9iUOa3uks6ZnqgG
         hReXwHB7A9gOfca766l0r10bMVwYCHGfJ8+eVcBKYEPA6Ne9TkRhWsrESpXdLMCNSM5j
         pHqAVd2efo5SX8iwLJO/77IKUlQiBUGsT/f09nTFUOL0UEUe0DgJa1lql+fzvgi+cvKJ
         deN9luIFIrWR9X6D7XDHi8r8/lJMDUm7vi8jvZeTaATNFdqT1xpbgSu3I13s0KEF9ufw
         riEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD1o1BRPKj9M4dKqCdocImHJlwh38O1v+Dn+VH75X69/L9IJq9c/23V6KkJEKHj2eprlPTDvHAhQOZGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzonRqYfpsTFjzorBe2YepGqCh8NgtthV9YXVVMC98yWF3PwIL
	5O3v1OUB89Vtty1CFlQ6zYsje4EN73t2uuXgqvMlDkoaEUWDXq/T0MVY1NQvAE8Rzg==
X-Gm-Gg: AY/fxX7l5dYz6yEdkuFVs27W/4W6jNzTLmoWcHAGaqCqphO+1K4N4fibu4jK85nCuAz
	Uxfy4ilqveD4cA86kD0YUzjIaADqPjDRqnjdVj1k6r/ZgPbRhikFwYe4f6+YXE+JBs6tECEb4n4
	z/RBJ0OQu+n4PBPXMu7wHLi5JilLoURPWtEAUFP3Ta9a1hhLx8q3tDEKsc6JPMMWHo6QmPfUtLt
	qodxw0if98ynLBM4IdVrJtQpGK8A1lhIlymGqTE1CWPtwVpKsx7JKCqMutxvWK7Umflh/b2wOLu
	ZknEfmOxE8FizGjdHVO/MwVuZ+lSWBOICEnN0COG01OevfxNTdAgNdRWep39d/2YwY1bGDACdH9
	EAlIe+kFRZIbWGJxtRGGt1L6fLmqltEnbqMola8w02jIxO9kYgEEFTsBOIc2lDvPH7LlvvSos72
	qgm3HZ4X9eOSCVS/hrpQ==
X-Google-Smtp-Source: AGHT+IEgCUZpTF8yVMFQbUK1f2VfqWGes79Q7SFq4BTt5go/LyghCIYXvXp0oSXhz5n1SME9CswxKg==
X-Received: by 2002:a05:600c:470e:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47d19589469mr282225585e9.26.1766850494231;
        Sat, 27 Dec 2025 07:48:14 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm51705043f8f.36.2025.12.27.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 07:48:13 -0800 (PST)
Date: Sat, 27 Dec 2025 15:48:11 +0000
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
Subject: Re: [PATCH v2 2/2] dt-bindings: google,cros-ec-keyb: add
 use-fn-overlay prop
Message-ID: <aU__uxDmeUq20Mg3@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
 <20251227-laughing-white-dalmatian-f9d98a@quoll>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-laughing-white-dalmatian-f9d98a@quoll>

On Sat, Dec 27, 2025 at 01:44:26PM +0100, Krzysztof Kozlowski wrote:
> > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > index fefaaf46a240..437575cdf352 100644
> > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > @@ -44,6 +44,14 @@ properties:
> >        where the lower 16 bits are reserved. This property is specified only
> >        when the keyboard has a custom design for the top row keys.
> >  
> > +  google,use-fn-overlay:
> > +    description: |
> > +      Use a function key overlay. This allows defining an extra set of codes
> 
> What is a function key overlay? Overlays are DT term and therefore are
> not suitable for bindings.

Ok, guess I can rename it to `use-fn-key` or `use-fn-layer`, open to
suggestions really.

> > +      that are sent if a key is pressed while the KEY_FN is held pressed as
> > +      well. The function codes have to be defined in the linux,keymap property
> > +      with an offset of keypad,num-rows from the normal ones.
> > +    type: boolean
> > +
> >  dependencies:
> >    function-row-physmap: [ 'linux,keymap' ]
> >    google,needs-ghost-filter: [ 'linux,keymap' ]
> > @@ -132,6 +140,23 @@ examples:
> >              /* UP      LEFT    */
> >              0x070b0067 0x070c0069>;
> >      };
> > +  - |
> > +    /* With function keys */
> > +    #include <dt-bindings/input/input.h>
> > +    keyboard-controller {
> > +        compatible = "google,cros-ec-keyb";
> > +        keypad,num-rows = <8>;
> > +        keypad,num-columns = <18>;
> > +        google,use-fn-overlay;
> 
> Difference in one property does not justify new example.

Sure but when the property is set then one has to specify the extra
codes in the linux,keymap property and this examples shows how. I'll
drop it if you want me to but I think there's value in it.

> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Ack, will do for v3.

Thanks for the review.
Fabio

