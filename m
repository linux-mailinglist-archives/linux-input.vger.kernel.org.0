Return-Path: <linux-input+bounces-14439-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7363B40ECF
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 22:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B8F2561C35
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693DE26CE12;
	Tue,  2 Sep 2025 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQGeIPGl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2552253EB;
	Tue,  2 Sep 2025 20:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756846148; cv=none; b=aSErZ08zSX8r/+GjbAQ27CgiwfG9O59up7lVs9Uy0B4sIcPm/8sJ2MgdO7lImGjB3RskFLEgSsoFD4k1+A7hdE+iyLaKmgWwac7rYEe69HLTQDMfVKqlgvB6qdygzNjhTyGDCblD9dXwTa1m8qCzj97pBE7XtHExr96Lb8Khs2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756846148; c=relaxed/simple;
	bh=Pr1wu64cTiWnW5NF0Mxcc4fL7y6TV7kC88hov/faBLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkWPA49VOdOC1CYZUIkm36+rk/Shw5Yu33gYXvtuZ+scZ1f0d1yAY/smQ21WFNPe2iS7WO9Or1LLj3lcsn/sNPWqVaDHa9bmY4+IDeZmO6TuHD9e5p5FKiDDVPVF6jNyDpK9IT7qZeBdD1ArCTdYCI2kDtjWZ1Qx+8zcTc7z44o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQGeIPGl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F970C4CEED;
	Tue,  2 Sep 2025 20:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756846147;
	bh=Pr1wu64cTiWnW5NF0Mxcc4fL7y6TV7kC88hov/faBLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQGeIPGl7+3I3azKgEImCizIYM5cFNzZqYuwdaL5kP8KZ7kU19Tbjcmrx3xGTHyF9
	 YBFMmEFkgItGB13DfW8CaTWSzI8Ti7WS5y0wbEOk8Dn9d8Nq/g1PnkVFlm0OGj062X
	 fOIq3uxJW1M4xU0VXmREpOU/n+4K8T1HpkolwZ/LNUSDpOY2a/w71m6Fye6DjpYtlj
	 BeBD2b7r4/bcXHDwS0suP2LJSecvzTcdf4Ft/A57qr+3qzeBNIBQ9Ar9TdNudOdHBY
	 0HlclM0lZAk2dfZvLmullRJut1qRK30S81ezmvIEWGqc4BxIsA+3ZsKL/CKOnMDqHN
	 znn6LdKpFpVdA==
Date: Tue, 2 Sep 2025 15:49:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linux-input@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: mfd: fsl,mc13xxx: add buttons node
Message-ID: <175684614636.1159256.793148520977277557.robh@kernel.org>
References: <20250829201517.15374-1-akurz@blala.de>
 <20250829201517.15374-7-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829201517.15374-7-akurz@blala.de>


On Fri, 29 Aug 2025 20:15:16 +0000, Alexander Kurz wrote:
> Add a buttons node and properties describing the "ONOFD" (MC13783) and
> "PWRON" (MC13892/MC34708) buttons available in the fsl,mc13xxx PMIC ICs.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


