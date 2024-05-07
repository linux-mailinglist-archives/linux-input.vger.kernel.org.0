Return-Path: <linux-input+bounces-3568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 868EE8BEBE4
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 20:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7DE21C22044
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 18:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6B316D9CA;
	Tue,  7 May 2024 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Um7kWj50"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30AF16D4F0;
	Tue,  7 May 2024 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715107730; cv=none; b=kr3/qB8ktuzSYU7uPSsvc41siNHc47+Cb1nFQtm2vRuttPoI80hJOfWsryEHGJf4uY9hvkBbzNXckwb6X33SZivnVWBjOAaG69Wo1jmaI8Q2XZqoWYMAULnOFW3xbYcKjM1o2ZCMOHFPSC+KsggLm50J2QpoSDwmfkZ0lfJw/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715107730; c=relaxed/simple;
	bh=I486yunt5jUXHqfmLyl7WYQ6Sw00qQXulcJTUiX1cmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4RA/Q6VnAUzMKefopqxcnerEbvf8nJJq+JBcsGLQIzT7cIvGBHyt+NzJAzZS1+vg2CmF9pnZRUBw52QvizaAaVdSwoa9u7tEtzBcMcZgknEdiSTvwQ/uQG8nbwTuEyc99QBNORmu63p9t5rzte51KpXENGRggen6HrWDzIZ1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um7kWj50; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4FEC2BBFC;
	Tue,  7 May 2024 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715107730;
	bh=I486yunt5jUXHqfmLyl7WYQ6Sw00qQXulcJTUiX1cmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Um7kWj50LDqbv6xAerer6XOd2d+jK6iIhWeW1qEtXC/NNC+gE/V6w+pN6JW0nbTPZ
	 2pKwHgSg8kRcF3IlKIL6enOnBA/L40q7QOoq2DunW/Ijret2U5ghKfq20QvANE8HEK
	 XlcCYYyTwZlygsCoZY4QiCKL/W36cPMys5U+IqZm5TmKOCd7PVsfacGWpgR2ZitxRV
	 dZPXUUHMT+h+qH4xfry8lX54LjsAs84Xha2sH7MBXp/ojtTkEnhGkSRXDUEZnhK0e5
	 csSfv29fFMYEjJcIMmyw+TkkeWHbSIJSb9UBh1XpptPp2f9UB344IyQG0Lod4QcSg5
	 t9SV7CMsxMeUw==
Date: Tue, 7 May 2024 13:48:48 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Felix Kaechele <felix@kaechele.ca>, Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: input: touchscreen: himax,hx83112b: add
 HX83100A
Message-ID: <20240507184848.GA877318-robh@kernel.org>
References: <20240504020745.68525-1-felix@kaechele.ca>
 <20240504020745.68525-2-felix@kaechele.ca>
 <3c2cf6f6-bf57-4fe6-9d79-5419addd6928@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c2cf6f6-bf57-4fe6-9d79-5419addd6928@linaro.org>

On Sat, May 04, 2024 at 02:34:08PM +0200, Krzysztof Kozlowski wrote:
> On 04/05/2024 04:04, Felix Kaechele wrote:
> > This adds a compatible string for the Himax HX83100A touch controller
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> > including the AVDD and VDD supply nodes used by this chip family.
> > 
> > Signed-off-by: Felix Kaechele <felix@kaechele.ca>
> > ---
> >  .../bindings/input/touchscreen/himax,hx83112b.yaml       | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
> > index f42b23d532eb..5809afedb9a2 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
> > @@ -15,6 +15,7 @@ allOf:
> >  properties:
> >    compatible:
> >      enum:
> > +      - himax,hx83100a
> >        - himax,hx83112b
> >  
> >    reg:
> > @@ -26,6 +27,12 @@ properties:
> >    reset-gpios:
> >      maxItems: 1
> >  
> > +  avdd-supply:
> > +    description: Analog power supply regulator
> > +
> > +  vdd-supply:
> > +    description: Digital power supply regulator
> 
> These should not be allowed for other variant, so either you need
> allOf:if:then disallowing them (: false) or just create another binding
> file.

Or the commit message needs some explanation that the supplies also 
apply to the 83112b as the existing binding has no supplies. 

Rob

