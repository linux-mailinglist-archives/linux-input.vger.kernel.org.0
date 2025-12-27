Return-Path: <linux-input+bounces-16701-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E84CDFC21
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 13:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E1853033D4A
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 12:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F0C319606;
	Sat, 27 Dec 2025 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPrTbs+F"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7062B316907;
	Sat, 27 Dec 2025 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766839492; cv=none; b=Cx4WPN+514SAXA6sJipr8vacL8hBgJxtIdGKa13YQ+UJnStSpbSI7cUY4IUSR790cj9XKNAYTo0vnUavLirshQBTY7XLy02G0guwi9txP9SQlON8Jq/4spmaxYY1FxfPCED9LI6Jlsl9hFKMwZspokLDFe8D/zAnikjxabnTDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766839492; c=relaxed/simple;
	bh=2jOj8oNDslYBZVMXX5ja+3Q+899129JuW4oQuGiedZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSMR4Qqk5fpIqB9AxhnS2w8K+GNzEfhNozz6/nUzGRBjWZ6wzrWvsneZ27G24/oZJTuB0A+MVlb9zmYXY2XjzZGjQ/RTCvoBpxd/gJyO2W/4ul+ibBLMOoLenuqBi+Gh8g13SA2sd2OOLpYsuZfVm76jhIyZeXH7V9j9/ZMDx7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPrTbs+F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB784C4CEF1;
	Sat, 27 Dec 2025 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766839492;
	bh=2jOj8oNDslYBZVMXX5ja+3Q+899129JuW4oQuGiedZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPrTbs+F9zMhvOhm4CY31tQTEANFKdTHn/gaoeowfD8R+yE6sgDnWpVvf0d7iz8z+
	 ok4G4HHjZQWmm93zNuM1zgsXP6f8W3DBb9Vj3VjvvRu6hb1p3MEUfXdhi4El8TSYJ0
	 tcOVKsa6shZ6drkc+I4xHxQ22bA7GMU7nXgQnTlw2eMhanMtRcaMzfhhn0TVT3DKta
	 ldGwU1aEph3PENL1DOvYRF3RkRyPnjmV0CjYIyi2Iw4SbGK6CYvjNrLMbjDsTNfhlr
	 wK+nsXAcLklnPZ3h+CfGbZDvVUBDRC6WmadKeOVhpiyP1ym7UHqLCncKQaYQh+eN41
	 moBQ8Dex8Y6Pw==
Date: Sat, 27 Dec 2025 13:44:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: google,cros-ec-keyb: add
 use-fn-overlay prop
Message-ID: <20251227-imperial-ambrosial-emu-bebaae@quoll>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224152238.485415-3-fabiobaltieri@chromium.org>

On Wed, Dec 24, 2025 at 03:22:38PM +0000, Fabio Baltieri wrote:
> Add binding documentation for the use-fn-overlay property.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Best regards,
Krzysztof


