Return-Path: <linux-input+bounces-16790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D27CF7087
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 08:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 616293004297
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 07:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E8B3090FE;
	Tue,  6 Jan 2026 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iC/KCDoY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26F4156237;
	Tue,  6 Jan 2026 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767684433; cv=none; b=CAcnOedoEbjr/NwDy3nvgyVLnZ6yLPdAePemDfU7ztjPS6wHSymzu428CU5Bx5cSBZE+FSLuba/GwwNhsqCsTOnGukY2kJ04CMSAjegtbE9MELLYb6dMu0Umyu4riyC+IUkKHU5LeeKDQp1DPgiFeeukv7ZpAMxyTfWkgQDXl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767684433; c=relaxed/simple;
	bh=nYzIn42DZW7rRGWW0FoycPOMIUvyxQY4Eb9ZJEz+3GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXnUl9J5h1x+KoF0VulQJ9vqo0w0vnCp+2YkKwri/5R9YoNXziPRx6ta12akmgJYEX9EL/6VA6/1ERuKxW27nNLQs7wDqkvTUWGR3H5qqRKZdGXmZd9FO2NR1LVeHj15nNdP8Z9NvPqTqHtkf1+nUUKjz4j+N2gfsm4Yhvo3ntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iC/KCDoY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89EAC116C6;
	Tue,  6 Jan 2026 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767684433;
	bh=nYzIn42DZW7rRGWW0FoycPOMIUvyxQY4Eb9ZJEz+3GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iC/KCDoYYlicAdq0+QJUo4QYRoHr5E+8FPE9tUtnk4ESiNluPscTSaAhPJNbgyTf0
	 8jPd88vsMEFfkpYr91AVUvEXJOYNeUL/YxpBjqLsKybt3NuzxfFdTR0z6T7mmcEKI5
	 5Sx0XGAxjjspJvpozqCnjL52/L6yhrDbYqjmlPBoghye43Q7iN4JcV2sN7XVLSNtwR
	 dBfAVJvzIw9hlPGKjibjjZbyAjXJ2rvk0s8lt72M7ktsvYfXVHKwGoY0WULh3suSf7
	 e+PBx0k9C+VLqxkBbei2vEHpWi6Oj8eP0ufTDCHVvM8g9xm7L4QtuZCxmPCM1+yyyu
	 heNbq+qZRRrnA==
Date: Tue, 6 Jan 2026 08:27:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: add has-fn-map
 prop
Message-ID: <20260106-oryx-of-major-protection-10c4e3@quoll>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
 <20251231143538.37483-2-fabiobaltieri@chromium.org>
 <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>
 <aVuYt24q6nihC4t0@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aVuYt24q6nihC4t0@google.com>

On Mon, Jan 05, 2026 at 10:55:51AM +0000, Fabio Baltieri wrote:
> On Mon, Jan 05, 2026 at 08:52:56AM +0100, Krzysztof Kozlowski wrote:
> > On Wed, Dec 31, 2025 at 02:35:37PM +0000, Fabio Baltieri wrote:
> > > Add binding documentation for the has-fn-map property.
> > > 
> > > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > > ---
> > >  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > index fefaaf46a240..fa24b1cbc788 100644
> > > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > @@ -44,6 +44,14 @@ properties:
> > >        where the lower 16 bits are reserved. This property is specified only
> > >        when the keyboard has a custom design for the top row keys.
> > >  
> > > +  google,has-fn-map:
> > > +    description: |
> > > +      The keymap has function key layer. This allows defining an extra set of
> > > +      codes that are sent if a key is pressed while the KEY_FN is held pressed
> > > +      as well. The function codes have to be defined in the linux,keymap
> > > +      property with an offset of keypad,num-rows from the normal ones.
> > > +    type: boolean
> > 
> > You still did not answer to my previous question, why this is not
> > deducible from the key map (presence of KEY_FN in the map).
> 
> The driver behaves differently with the fn layer is present, has to make
> extra space for the extra codes and enable the logic to use it. I can
> certainly detect it in runtime, would have to always allocate the extra
> space even if not needed and check not only that there is an FN key but
> if there's anything in the second half of the map.
> 
> I'm not overly enthusiastic about it, it's a bit wasteful on memory
> (probably no big deal, half a kb of RAM I guess) and somewhat less
> defensive to misconfigurations and in general I don't like the new logic
> to be enabled magically, as a side effect. It'd be extra complexity for
> the sake of saving one boolean property, but sure if you think that's
> the way to go then I guess I can implement it that way.

Driver logic is not an argument here, we don't care about it. You should
answer why presence of google,has-fn-map in DT makes sense when none of
the keymaps has KEY_FN. Why this is a valid and desired configuration?

Best regards,
Krzysztof


