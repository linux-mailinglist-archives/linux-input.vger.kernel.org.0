Return-Path: <linux-input+bounces-14871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D3B86D8E
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 22:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3FF417B8E7
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 20:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697D031B801;
	Thu, 18 Sep 2025 20:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozpoUZZo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01431B122;
	Thu, 18 Sep 2025 20:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758226283; cv=none; b=RgOYGuK5tK6+3dN0Vys210YMdeMt/5raM4wHKyLt+OaInj1OeLVPkZE9ct3h0UfKnKJn/UwzzCCZ3S0fwIlpcjRZ4XAuNozt8wdYPyZp14cOhfYAs4D1AEPgGsqc+P8cZuUlVa0TS6VuOtXbh4FORhrOpn3h+Phsp4DOUaMxwMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758226283; c=relaxed/simple;
	bh=93EuAxMz0Vu3PNyyL4kvgni8rVuIKTtXjr9h1rH8oQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyaH2OJtF2Ax6jW0RAOOPwp0IauHH4UaCWBSyY2UZWIheAcflsgmkQ3OzGu8GkvQMd+dHg8wuZ/U+KsPfvD9691PcYLw87O+Zkvo1rBvv8gamCrNgAAA4nGLVB6lrnEJytNELev5G/IjjvEd6q3Ly99PQHjdMjLTL03o5qPrFTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozpoUZZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA231C4CEF0;
	Thu, 18 Sep 2025 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226282;
	bh=93EuAxMz0Vu3PNyyL4kvgni8rVuIKTtXjr9h1rH8oQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozpoUZZo9eQeM74VNEICyUTTmodKcPq0CDRZo5u436kIneK/Q/CXyJ6p/LF9AVozp
	 4Xm/1Dg2glnimvB3o7JjShXyX3qTKD+B2YYo4BELTPFKYYGvuAVvjPDuRwM+h5IeiM
	 rW8kFLPUdNdE2ALEriXo8U5HF34cVPVeDY8s28azYwBlBP3Oq4rb8Ov+PiGAqqTpVE
	 ufbSO73DuAU1vs/CSUT5GIyVovyF6Ezyi4LjIASOs37C7MfZmWFTreQMIwwhmj3KUN
	 rozHZhPjLfF53YVnzlLhcbkcYEmVJUhcMm0simdyudGcGzP0gDsw6fwBsmHseSFdPe
	 KZ3kUSoFtt+qQ==
Date: Thu, 18 Sep 2025 15:11:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-amarula@amarulasolutions.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: touchscreen: convert zet6223
 bindings to json schema
Message-ID: <175822626395.2557235.16064177739618972229.robh@kernel.org>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
 <20250918153630.2535208-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918153630.2535208-4-dario.binacchi@amarulasolutions.com>


On Thu, 18 Sep 2025 17:36:09 +0200, Dario Binacchi wrote:
> Convert Zeitec ZET6223 touchscreen controller device tree binding to
> json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v4:
> - Drop "Phandle to the" from vio-supply and vcc-supply
> - Rename to zeitec,zet6223.yaml
> 
> Changes in v2:
> - Added in v2
> 
>  .../input/touchscreen/zeitec,zet6223.yaml     | 62 +++++++++++++++++++
>  .../bindings/input/touchscreen/zet6223.txt    | 30 ---------
>  2 files changed, 62 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zeitec,zet6223.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


