Return-Path: <linux-input+bounces-10882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A46A64798
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 10:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96EAB3A6DC7
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274C9226D09;
	Mon, 17 Mar 2025 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqbPJk5Q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB52225A3E;
	Mon, 17 Mar 2025 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204154; cv=none; b=hzI0QMyUt6s+IFZXWNcPDniAPzsJXZlZRuOgzPAb4Xf0cV4I0JsrfFw8JFLacFHgZzQW54ncDX90cuC+DIhrXobIecqS3GObA+4SfOQZZoOXAwp4/JhzfqF8Ezj8XPTe5ioLuz2tAeHNwkt3mGksbcQ4wVTbzduCZI88zgJQBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204154; c=relaxed/simple;
	bh=GjvD1ewWzETOMGlfQ7B3N9h5hZXjx7lZzpixsXgl16E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3U48FrrmNR1Kw93UTtvfIbjg3FQgeH9np1eId+3Ezao8klf95UGUvRLJj/s7nQNjfJVzL5lnOw/EmGR5CFE/J2WfSOefe7A6NI40y5OA48Dj2TOUn8SWuyaP+RPVGQuxjKeNxCvnDFVXye+oQ2/FW+BHL2+SUJH7dGxSWsLETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqbPJk5Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D44C4CEEF;
	Mon, 17 Mar 2025 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742204152;
	bh=GjvD1ewWzETOMGlfQ7B3N9h5hZXjx7lZzpixsXgl16E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqbPJk5Q186gRSpCJlqlboZIDiG1TnMQJaedonqAVzDsxu63zDWvAwL7KBiQGns6l
	 ezfwS2d9R+RbaEsbxHnts6JgHeTzQ3blYdsjX0/7MnrSAsCATLs3J91SHyQdrKcYOQ
	 975cYve+yp1GFFT8y53o2ajRLMaoOjlVpBdckafYMtSbNHhyDOpEvzNisVjQAuskWC
	 xtFGfg8Yo7nolmeJ/r9U5dQHwq1Al8/glJaM5eQ5UFv78QEVilGgJEAgVf9BvQCOYS
	 J53EmVtUtI3HUuVhdO9Z4l8wqWVdT1HDKfjfKTKuPfMI+SZN8Ty1+1SGSlBAtlxnZp
	 cQLBdFdk2zrPw==
Date: Mon, 17 Mar 2025 10:35:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: crypto: fsl,sec-v4.0-mon: Add
 "power-off-time-sec"
Message-ID: <20250317-fine-swift-of-acumen-ea2bad@krzk-bin>
References: <20250315093455.1100-1-ian.ray@gehealthcare.com>
 <20250315093455.1100-2-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250315093455.1100-2-ian.ray@gehealthcare.com>

On Sat, Mar 15, 2025 at 11:34:54AM +0200, Ian Ray wrote:
> Update to reference the input.yaml schema, thus enabling the use of the
> common 'power-off-time' property.
> 
> The hardware supports one of four fixed values, and the new property is
> optional.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  .../devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


