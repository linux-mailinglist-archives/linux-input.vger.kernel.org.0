Return-Path: <linux-input+bounces-8025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A949C4836
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 22:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947C71F21700
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 21:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B9E1AC427;
	Mon, 11 Nov 2024 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUDhXPMX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED1159596;
	Mon, 11 Nov 2024 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731361122; cv=none; b=Yww5xVUMPqHs22JU6tmTJWm+Ne8uwMlVYCzMbT1WCXrqUlvN0Ziq9zQjwALtsPRo48d84tRz59UYsKltSmPAuIgofX7l68Fzpz77lI+XOtDul9tvd8RZMPLJmiTK9cLvqwZvznxKp4yM2tO+weOXdYLbFiy116/eFmT52vV2ihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731361122; c=relaxed/simple;
	bh=m/TDhMtNe8dgzkyLbvsV8g5cdyk3fhi1g/TB0QQFibo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6UZX/0YE6JEXAbdcC4m3d1OgeEgf41ody93s3gMVGo6KveoyZoN+WjwrKXEXkzTa0nmL5wx1uAPxhntKcgZ7VKKRv76YM05LZ4jPP+lR8iapjFAVG+HKzOBWtTjqZxo0EaoAaLuDAqEs+fPKZovvKSSLOsoeAH1HF6zfNBmwqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUDhXPMX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDD7C4CECF;
	Mon, 11 Nov 2024 21:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731361121;
	bh=m/TDhMtNe8dgzkyLbvsV8g5cdyk3fhi1g/TB0QQFibo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUDhXPMXJi7xkPdiyG60uSnJVK8oNKDHySdqZjFSv5Ihs3SKgf3IfV5kjPFygDViS
	 F8mdwYvJllf1rMjyoIfC94kvQoD4xBQo240StoPEOl3piE+oy2aZSct51zuFeIM4/m
	 oU0KIRHzkiKjHMgieJuOkXTrm34KgUent7S+T9bjpJVEGic0L0gb5zslDhGBiImgXB
	 +n2F0yY5M3qxyt7Awek2hl+fJ1pALE5XToAoO+O/NQW+F5xUBtU+CAYJcmBCOYBZIN
	 cksyzblelM249615Q/MfiN6AIPm3v9ktOqRcFon52BHuY3clXXnaPDYHlEdF06KWTe
	 5CAX1kc4CYzZA==
Date: Mon, 11 Nov 2024 15:38:38 -0600
From: Rob Herring <robh@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/7] dt-bindings: input: matrix_keypad - add settle
 time after enable all columns
Message-ID: <20241111213838.GA1990975-robh@kernel.org>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
 <20241105130322.213623-6-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105130322.213623-6-markus.burri@mt.com>

On Tue, Nov 05, 2024 at 02:03:20PM +0100, Markus Burri wrote:
> matrix_keypad with high capacity need a longer settle time after enable
> all columns.
> Add optional property to specify the settle time
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> index 9ea66b3..0ce89a6 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -66,6 +66,12 @@ properties:
>        before we can scan keypad after activating column gpio.
>      default: 0
>  
> +  all-cols-on-delay-us:
> +    description: |

Don't need '|'.

> +      Delay, measured in microseconds, that is needed
> +      after activating all column gpios.

Wrap at 80 char.

> +    default: 0
> +
>    drive-inactive-cols:
>      type: boolean
>      description: |
> -- 
> 2.39.5
> 

