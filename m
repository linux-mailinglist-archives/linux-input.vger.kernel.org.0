Return-Path: <linux-input+bounces-3280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 165168B3BBB
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 17:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72B2AB2719F
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 15:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AD6149018;
	Fri, 26 Apr 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFXZNW3R"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8614901F;
	Fri, 26 Apr 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145770; cv=none; b=e6MsW/1cNS6gfo3RnnpqDctXxHM4+woDNRhD1JEuugoP2vApH7mBiRxdXpbClMwVzoIC4UGfnxb77PGcJq4/zwyJxIoBioYI+6Z/tK9gQyUheju0Tc2sETuI9Bz2F358paQw08wr14pZou1DyHhTF3i9HiYZ/AyGm7vYRt8EYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145770; c=relaxed/simple;
	bh=HPIphAQxeZzpTfRdrlFxSkbXT7u5cVbL25YurlmJS8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLIWdZwjIJR+DoiHGp6Mp2OsWnz3i5kDsdsFh65oos1JBUfy2BpCOwoJHAd7/YdIhqO969mxgal+EV9Hyt8rV/2Dx5RZWeEz8VyXo4DGRO6UXxtvD2dbQlipo55QCjcsTd3c5bouihf/esPtmojnkRP+hC94Sz7LY9a5gJKJuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFXZNW3R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12366C2BD10;
	Fri, 26 Apr 2024 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714145770;
	bh=HPIphAQxeZzpTfRdrlFxSkbXT7u5cVbL25YurlmJS8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFXZNW3RspF6m1NZBikG6xkmt8VwnsiHjnwZ9VVCDHtnu4/mm3JFnt1WcpyEOa3M8
	 +PRuRV0Sj+6auqQAbeBdGQACoudJZl0vo4T06E1W4cMAAQj1V80UZQ3lACC36KXyIe
	 D7I1jaoQOP9B9zrC6FQbvyV4iAWmuiW9FVHNTTEtJ5KIKlEzDVFOtH8SpfjkrZ3nyM
	 VVROtwI+8r1gOpOdaxh066BRa1BXGEuPrBv1mBe86bKVkgFLxZALjPvYhcS/jBsrMs
	 SpYwSH0oR6nDh9fSH7hrarQlN/Cii6AWS3db/H48VeQGcHwYuWWfrhuJr5bW1HOnv6
	 2PuHCpdxsgVkQ==
Date: Fri, 26 Apr 2024 10:36:07 -0500
From: Rob Herring <robh@kernel.org>
To: James McGregor <jamcgregor@protonmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616
 compatible
Message-ID: <171414571220.1955030.12605658865806218849.robh@kernel.org>
References: <20240426092924.15489-1-jamcgregor@protonmail.com>
 <20240426092924.15489-2-jamcgregor@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426092924.15489-2-jamcgregor@protonmail.com>


On Fri, 26 Apr 2024 09:29:41 +0000, James McGregor wrote:
> The Allwinner H616 SoC has an LRADC which is compatible with the
> versions in existing SoCs.
> Add a compatible string for H616, with the R329 fallback. This is the
> same as the D1, so put them into an enum.
> 
> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




