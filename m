Return-Path: <linux-input+bounces-14216-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D932FB2E93E
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 02:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3797B5E295B
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 00:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295242F872;
	Thu, 21 Aug 2025 00:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpwgCuht"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63729CEB;
	Thu, 21 Aug 2025 00:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755734890; cv=none; b=fIqILghH10VyHKIv0fyJFg1+vNoeWc9nN4xOtAs7OEyok+5TqV87yv9HbaPtEIW/G+tDfnJVADpiifHm+2ZTiIlO6szyUToGYVvBJbUQF9Ud7TgBFvrxfE0iQ7LjIBfeJk5p8mdMCJDr901OWPwKnMgAm5gl9q5JniSXRx3ysF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755734890; c=relaxed/simple;
	bh=QgrJKEDNsTMloOmaRWYk82/0DWzZ5DY1lY/N1y8Q7Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Norx/9XALQhLE9S9FESX5ICfZqPCrYbiAkTn6mAnYz38kQ0WTRaA2seGWAldRioU6MYdKYz2uE6l594vueLxihNsg4P1j8LxerEBpZlPtomwTNlGKDnF0lknE/WQDoY46/C+Bs6R98gF1GfdljAbZdUFSlHPc3DRlMaETGgdFi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpwgCuht; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584F0C4CEE7;
	Thu, 21 Aug 2025 00:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755734889;
	bh=QgrJKEDNsTMloOmaRWYk82/0DWzZ5DY1lY/N1y8Q7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpwgCuhtUTrrxY4rdEIi9y/NrFnnj4JL1F0ylFg1Pn+oMB5WqRtPJNHuvbXUlTB9u
	 jPpOsn3h4QcQJSeAvT7nwEjPAL9DzQL4MLAg8mGD3oJ7EZbU0J8FcuKfu0a88E7s99
	 PrA+fDLrLwdkDj/wzs4G6G5t/EPyGIk8gaG1fL2VPfqwMEPsxLNTdi9Rkoyuc9u2nk
	 gVPpqwd4Nv3TDbypyIe567k8vNJyDslYwveIOjCASU7J3RS71TvCBajhpxoh5HPpnb
	 9on5I8wTQtTjgz4zElJQzILHTTjMiOpmBMOXYACAucl49mxraI3S4XTZqc3UUsB6KV
	 F3ApseyZt9CDw==
Date: Wed, 20 Aug 2025 19:08:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <175573488775.1779670.2147275445391515237.robh@kernel.org>
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818183814.3603308-1-Frank.Li@nxp.com>


On Mon, 18 Aug 2025 14:38:13 -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add ref to matrix-keymap.yaml.
> - remove properties, which already defined in matrix-keymap.yaml.
> - Add Vladimir Zapolskiy review tag
> ---
>  .../devicetree/bindings/input/lpc32xx-key.txt | 34 -----------
>  .../bindings/input/nxp,lpc3220-key.yaml       | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
>  create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


