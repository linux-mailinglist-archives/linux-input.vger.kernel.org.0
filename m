Return-Path: <linux-input+bounces-7800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAFA9B7683
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 09:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C44BA1C21CC6
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 08:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294AF1494CA;
	Thu, 31 Oct 2024 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IM+kHmLN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2331EB48;
	Thu, 31 Oct 2024 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363578; cv=none; b=PWwqOxfvhJo+E/dvB2Xh8HegO3n98sn37oSLL17w/uBaEuB1/Opf7AZahpKiN3xrxQu99oe80oeOs+DO99oU0NiCFvaiZ8myKFiTEOLsadrd1S+vPwhVlKWfVs3qPeNHZ27OTtQlYjsVuto8jRsn5tVSL60WYLn8WTz+xeey2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363578; c=relaxed/simple;
	bh=8BdANRCNqUJ7y6PJqi0/2zODdtC+G/iJGZ8fBcvl8v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZt8OFSiFnlvVqJSCC4kcKuPGVzMqA/n4qG6tW53uZ4DTK1yJ08ijvwJy2cHzd4aU+vDAeSr3BbJL1GIEY081N8mkijjFHkMXw4ygUlJXIzm2uHXtkvIZwW8x+2XmibfoqUp4GyAS3bpr47UDo7+JUSuYMyC10tPgLoNpSWeTG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IM+kHmLN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C52C4CEC3;
	Thu, 31 Oct 2024 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730363577;
	bh=8BdANRCNqUJ7y6PJqi0/2zODdtC+G/iJGZ8fBcvl8v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IM+kHmLNHBm0yfvBgCD8uh4elkxRZOIFv0jlnt/0JIesZJeNuxlE4/CToMJQ0XOam
	 //99pZQ3n4eXfsjhPz25CVqFjYbr+6cQ9ocq8HmRxyFGny1+yhPyDUbWrbfVRbYvB4
	 fwZXZ6tYkyW2MHRwTBjjSir3sQtUcqO99Y1/FXbkSSV1tTcRGdooDnQDLXEmir/WKw
	 JUVuNl11E/CmF1LmmAQp77ge7/7MuNnQZHq1DmveiUxROXRJLUI2XhZYkSQAMq+Fc5
	 xQOW130cW5GkHJpW3pO88nTrddSyoY+nWFV+qnPEnv6TV3zKxlK8affYhlvb+IErWO
	 DRK7Mn5e2sV1w==
Date: Thu, 31 Oct 2024 09:32:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>, 
	HeDong Zhao <hedong.zhao@mt.com>
Subject: Re: [PATCH 4/6] dt-bindings: input: matrix_keypad - add settle time
 after enable all columns
Message-ID: <all3yq7g2ovuiszbjnmvmnyimx4fdrpecnef5si366o72vmwtk@psffqupomzgz>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241031063004.69956-5-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031063004.69956-5-markus.burri@mt.com>

On Thu, Oct 31, 2024 at 07:30:02AM +0100, Markus Burri wrote:
> Matrix_keypad with high capacity need a longer settle time after enable
> all columns.
> Add optional property to specify the settle time
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> Reviewed-by: Manuel Traut <manuel.traut@mt.com>
> Tested-by: HeDong Zhao <hedong.zhao@mt.com>

How was a TXT binding tested?

Both tags look fake, where were they given?

> ---
>  Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> index 570dc10..cf43fa0 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> @@ -24,6 +24,8 @@ Optional Properties:
>  - debounce-delay-ms:	debounce interval in milliseconds
>  - col-scan-delay-us:	delay, measured in microseconds, that is needed
>  			before we can scan keypad after activating column gpio
> +- all-cols-on-delay-us:	delay, measured in microseconds, that is needed
> +			after activating all column gpios, default is no delay.

Binding should be converted to DT schema first.

Best regards,
Krzysztof


