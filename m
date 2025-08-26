Return-Path: <linux-input+bounces-14330-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CE3B3753D
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 01:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F19047A3624
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 23:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431E52FC89F;
	Tue, 26 Aug 2025 23:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhPcIGWT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348B30CD8A;
	Tue, 26 Aug 2025 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756249730; cv=none; b=spIPrTFseHDf8LTkPB2ofjHDzp0pk1SbkwR1+w8sGPr48yR8+J9dInPDWcUwxd32C79BdvIYfcvs1vhrW1BP5jL2KtHIFMtvjrwutc1LH4NHUykkMMMhxWgVbiq79fq8O7jWVZ6YFUr4J8k0h71BBaJpJ+F5kZID5gHhLdko5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756249730; c=relaxed/simple;
	bh=/7Es7k8q/TTf9xlUC/4mFl33babD/JA1SjkLwjg4rTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnmAe2jQjSfB2NZPBFOZj0kRm0W8QqyEfH0oZxasQkApiIC/x2e/6UHzSczxltBxuN9W1WuzpI5FzbxziJ7AaLjk3ijllcd2T4+ihvkcX8uHUN+SQvQ0YP84PJh05umVsF272oht+EJMYe5pIgHMGwTlZvzH0Aql/to6h1QZ7cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhPcIGWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD2DC4CEF1;
	Tue, 26 Aug 2025 23:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756249729;
	bh=/7Es7k8q/TTf9xlUC/4mFl33babD/JA1SjkLwjg4rTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhPcIGWTqJsOkpMvAzECoTboPc/5frmdKHtyUHs8Iu6JIE73XuIuf7apZdJbtr0eJ
	 f1stvjjgZ52zQl6nY7vM8ur4XMO4JAQQO6IWuxBRLUoiXr9/KayU4nIs95kAUwxlDK
	 S/pz2mG6R5m23cjtEL9I7r3rWcZ7McKv9kVd7pJiSer+gdiC5tmxgCHvyHTNYRenDx
	 B335XQliwPHesADGIcuTdHav4j+u2QVv4CXD0IeKd93ZyBQdRhUxHzkgs85BfbpZc9
	 rXhyGCCF7FjoomEIgc92Ud8JUzut8QOFKoq6XeR1S/DSpkXbbUPkVQDklskqFt98ec
	 ZvgMDY4rUn/iQ==
Date: Tue, 26 Aug 2025 18:08:48 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: mfd: fsl,mc13xxx: add buttons node
Message-ID: <20250826230848.GA685049-robh@kernel.org>
References: <20250823144441.12654-1-akurz@blala.de>
 <20250823144441.12654-7-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823144441.12654-7-akurz@blala.de>

On Sat, Aug 23, 2025 at 02:44:38PM +0000, Alexander Kurz wrote:
> Add a buttons node and properties describing the "ONOFD" (MC13783) and
> "PWRON" (MC13892/MC34708) buttons available in the fsl,mc13xxx PMIC ICs.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
> index 94e2f6557376..761267b42c85 100644
> --- a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
> @@ -39,6 +39,41 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  buttons:
> +    type: object
> +    $ref: /schemas/input/input.yaml#

       unevaluatedProperties: false

(And then fix the errors in the example)

> +    description: Buttons

Drop.

> +    properties:
> +      reg:
> +        description: |
> +          One of
> +          MC13783 BUTTON IDs:
> +            0: ONOFD1
> +            1: ONOFD2
> +            2: ONOFD3
> +          MC13892 BUTTON IDs:
> +            0: PWRON1
> +            1: PWRON2
> +            2: PWRON3
> +          MC34708 BUTTON IDs:
> +            0: PWRON1
> +            1: PWRON2

'maximum: 2' here and then only need 'maximum: 1' in one spot below.

> +
> +      debounce-delay-ms:
> +        enum: [0, 30, 150, 750]
> +        default: 30
> +        description: |
> +          Sets the debouncing delay in milliseconds.
> +          Valid values: 0, 30, 150 and 750ms.

Don't repeat schema constraints in free-form text.

> +
> +      active-low:
> +        description: Set active when pin is pulled low.
> +
> +      fsl,enable-reset:
> +        description: |

Don't need '|'.

> +          Setting of the global reset option.
> +        type: boolean
> +
>    leds:
>      type: object
>      $ref: /schemas/leds/common.yaml#
> @@ -119,6 +154,10 @@ allOf:
>              const: fsl,mc13783
>      then:
>        properties:
> +        buttons:
> +          properties:
> +            reg:
> +              enum: [0, 1, 2]
>          leds:
>            properties:
>              fsl,led-control:
> @@ -137,6 +176,10 @@ allOf:
>              const: fsl,mc13892
>      then:
>        properties:
> +        buttons:
> +          properties:
> +            reg:
> +              enum: [0, 1, 2]
>          leds:
>            properties:
>              fsl,led-control:
> @@ -155,6 +198,10 @@ allOf:
>              const: fsl,mc34708
>      then:
>        properties:
> +        buttons:
> +          properties:
> +            reg:
> +              enum: [0, 1]
>          leds:
>            properties:
>              fsl,led-control:
> @@ -183,6 +230,17 @@ examples:
>              fsl,mc13xxx-uses-rtc;
>              fsl,mc13xxx-uses-adc;
>  
> +            buttons {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                onkey1@0 {
> +                    reg = <0>;
> +                    debounce-delay-ms = <30>;
> +                    active-low;
> +                    fsl,enable-reset;
> +                };
> +            };
> +
>              leds {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> -- 
> 2.39.5
> 

