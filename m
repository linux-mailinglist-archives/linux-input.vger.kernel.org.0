Return-Path: <linux-input+bounces-7989-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2459C21BC
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 17:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC7C71C23581
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 16:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC4F13C69E;
	Fri,  8 Nov 2024 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWEtsAbt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90813B29F;
	Fri,  8 Nov 2024 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082433; cv=none; b=V11Qfu9ShxEEHbsuB988arZeK9IlfbfhZ8iZzkKgNhDhl5gvqy0HmEe8FbDyPVBjpBuiP+g79lGOcuqZtc7gjpxR1b9txa2cgSRs6NJq5MPjOrAYFHaW3J30sfBC/faGERtPVZWCZJchxx4YClR591s4O3M3d7wW5F0CvACM4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082433; c=relaxed/simple;
	bh=q+pj4CsKKVOJkRtrq3XZI2SWz5Z+xBXMT9k2KfygvEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/kfygchvBn/iV4aQrBdeFtFhK4hTh6h0JWmAtuIYiLIEWsDTvDy2taW7wswuPgIQPbuh4ZYqm/EoM7OjLt22Ndne+6Djt+MVUVnWj1YlS7mH/CLHiETlCNGij2vI/HuULP9e2dSZifKHaHnytqfzZOu/LFDKnGXvKwCXrVn20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWEtsAbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA50C4CECD;
	Fri,  8 Nov 2024 16:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731082432;
	bh=q+pj4CsKKVOJkRtrq3XZI2SWz5Z+xBXMT9k2KfygvEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWEtsAbt40kdv09DSyV2FM6o9bmE2kSr3UHzWy8bLTrZdogVmHJH4LOZIqdMy6KTP
	 z87E/8ICfhfHeEMnU58i3Y7mhWHfRpxkqBR0Usmsz8FZSvNx6YlAvDt8uH81j2tB1F
	 SqYUGi6GUbPeQcm1yWtmbPgvZIQmy5Yz7TRwm1ey2KEgCNrsrShcwNVjUX2ufvZJdh
	 BmC4YGyU/ffmoMnjmD+R5rN+fydz8cqE0bcW0WUrQT8SzhYK/j/RluT/fPZMUm2WPs
	 oPvUHqPCHbu/RfMFHFRe6SxAj5VeRZLb1sHjsj/q7G2RGCMSChEpCRadZjYTwqmMOZ
	 4EvW7RDqJcRRA==
Date: Fri, 8 Nov 2024 10:13:50 -0600
From: Rob Herring <robh@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: krzk@kernel.org, hbarnor@chromium.org, dianders@chromium.org,
	conor.dooley@microchip.com, dmitry.torokhov@gmail.com,
	jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: input: gt7986u-spifw: Remove
 hid-report-addr property
Message-ID: <20241108161350.GA2313139-robh@kernel.org>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-3-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108120311.87795-3-charles.goodix@gmail.com>

On Fri, Nov 08, 2024 at 08:03:11PM +0800, Charles Wang wrote:
> Since all boards use the same address, drop the goodix,hid-report-addr
> property and hardcode it in the driver as a default value.

Where's the driver change?

I don't see the point in defining this and then removing it in the next 
patch.

> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../devicetree/bindings/input/goodix,gt7986u-spifw.yaml    | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> index 8105b9ce2..c9e346a60 100644
> --- a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> @@ -36,11 +36,6 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> -  goodix,hid-report-addr:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description:
> -      The register address for retrieving HID report data.
> -
>    spi-max-frequency: true
>  
>  required:
> @@ -48,7 +43,6 @@ required:
>    - reg
>    - interrupts
>    - reset-gpios
> -  - goodix,hid-report-addr

Dropping a required property is an ABI break.

A devicetree that passes with the schema will not work on current 
kernels that require this property.

>  
>  unevaluatedProperties: false
>  
> @@ -68,7 +62,6 @@ examples:
>          interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
>          reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
>          spi-max-frequency = <10000000>;
> -        goodix,hid-report-addr = <0x22c8c>;
>        };
>      };
>  
> -- 
> 2.43.0
> 

