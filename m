Return-Path: <linux-input+bounces-5745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9A395BAE7
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 17:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE1C282B5B
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284511CC880;
	Thu, 22 Aug 2024 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwPKPr59"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8732C6B6;
	Thu, 22 Aug 2024 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341721; cv=none; b=kaPNVczT2Chm0MWb1ZnENGn3tMYhtxtcAPHk2UZ4rAMUZmsSuxmOjOUFrlZ+5LYLPvphxltAqW9+gPzsFskIilsT8PdG6B2Poy7TP2QappkeXdNdETWO+blgp4MVAM61u9MlY0Iyg+98IOe9qi4HhXAaLacKtC1gEFGkmIw5t9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341721; c=relaxed/simple;
	bh=flplceLvbWqOQXmD4xLlAsLydD2+fHMt4RLLC5VlO/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgyqER4fU3pD6YJQJ7Hhfhcn0EfUwB0sGIk96sFLN3YuwA2cr6j+r0vPFfnPKRj3kHfp6t/CqpIX6jJfs/YUnVxwFF17uMXCwabkc6lSOQ/lyQG+BRQLA1hXoUvVEnkqr0i3nBBU5iVYIH8ZoQYGI3UM91kKPFNsYi/R9ozAAGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwPKPr59; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D80C32782;
	Thu, 22 Aug 2024 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724341720;
	bh=flplceLvbWqOQXmD4xLlAsLydD2+fHMt4RLLC5VlO/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwPKPr59y5eCllYsmKS1phviIs+z5u7zdSOCyw6WZHOyDXx/v6VkdVXTpRTVK0Y86
	 /3JFV9GK9B6TVYc54zYFKIwqK3tElawqDRUPF8NYsCaU8SJjJtAYzwFMwFnaRV74Rs
	 l5vcfeZznWHrzGt2xTp25vh/u69bpWBRuJMmC941p7ykyD3+OkN9xPCGrVo1wUmVIK
	 3wjpEoX8aBqHsWqLhlEqmJc+Y45JQ3rYTlGlknA1pdmb7RyDvrEbJIpkmEouwI7UL5
	 F3WZ8KWdugMM0iiwMkxp8bcwq4oEu7wWrm6aiM8smt6PHSYw4o1PbdUJgMkgXYCFtP
	 N8RQwFet4ZpDw==
Date: Thu, 22 Aug 2024 17:48:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 06/14] Input: samsung-keypad - use guard notation to
 acquire mutex
Message-ID: <e6xkutxnpu7acvm5qfyyces4estm4ihc3rzczqpnxrbrkptdm2@6lwrlssvtt3v>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-7-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-7-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:03PM -0700, Dmitry Torokhov wrote:
> Guard notation is more compact and ensures that the mutex will be
> released when control leaves the function.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/samsung-keypad.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

You need to include cleanup.h (unless some other patch already did it
and I missed it?)

Best regards,
Krzysztof


