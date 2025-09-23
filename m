Return-Path: <linux-input+bounces-15018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A01EBB97715
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 22:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5603F161B87
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 20:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8881D9324;
	Tue, 23 Sep 2025 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVY2GD6R"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890423FC41;
	Tue, 23 Sep 2025 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657916; cv=none; b=IBQ0zfHaalGTaPIH1XwmTPISC0jOqW/lG0jwy+V4xKqyhz/CFEXdVYMHDMDPjCLWcvsrT+3hjAoqPsaZKLmWrzQ5PkVMKJCl3g1ruGt6c8jebnfq+U2Y5z24D3PaucUbqFiwF3G7lcCNd1fNO881/ZE2odVS87aJw4OSqZRzBYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657916; c=relaxed/simple;
	bh=rsrgBnwzsmx18dRe94tVk/ZS06/IOql7vtHmkQyNJaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFt4nDldpwG5NCk2PuLhOosOxUscEOJtzyncyaB41hmLp/5/03jYJFrNkefLCQKahjge61eCxcHcQA4ztO2nMaHnuy5SrTg/QJqobExuDdM6oP8BpHkmIGHXSwNEoJ+/qAByxDYQoTZHS0eZYA88F3chqWylzu4vBp//FYi/S2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVY2GD6R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A689C4CEF5;
	Tue, 23 Sep 2025 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758657913;
	bh=rsrgBnwzsmx18dRe94tVk/ZS06/IOql7vtHmkQyNJaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVY2GD6RaDoc8geaGUEE74kGg41XzODOyH4xFTPxgmnhFdNQQzet27xesRhdKZEcx
	 QiK29pOZNmWdWBOc9vsZgVn+O3GkXCz3ITcVsKk3Vg0TAZ3MacbUCEkuT8rsVmXNxd
	 sQvjNheRBw9sYh+8J5U24qHIQtp1oOSpCMaH0Xl99pX8vdIkBMrnUwn6DJWXTSbk0J
	 tdNLbt0C6Aad/0IJFowH0n/phTjMSv39Llf4LAeZxvlU2s7uLFfatUncdooz4+vnLI
	 a10AgF//iSH29ESZxwQMlkSb38IzNllj8zbfiZGQi/f6g1UswtMy9Lmg0cfKTw5u4u
	 UsyNjBKsV4XoQ==
Date: Tue, 23 Sep 2025 15:05:12 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	sebastian.reichel@collabora.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/3] dt-bindings: arm: bcm:
 raspberrypi,bcm2835-firmware: Add touchscreen child node
Message-ID: <20250923200512.GA4080270-robh@kernel.org>
References: <20250923125741.2705551-1-dario.binacchi@amarulasolutions.com>
 <20250923125741.2705551-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923125741.2705551-2-dario.binacchi@amarulasolutions.com>

On Tue, Sep 23, 2025 at 02:57:11PM +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v7:
> - Add $ref: /schemas/input/touchscreen/touchscreen.yaml#
> 
> Changes in v5:
> - Move bindings into raspberrypi,bcm2835-firmware.yaml
> - Remove raspberrypi,firmware-ts.yaml
> - Update the commit message
> 
> Changes in v3:
> - Drop firmware-rpi node and use only touchscreen node to fix warnings
>   you can see in
>   https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/
> 
> Changes in v2:
> - Added in v2
> 
>  .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 28 +++++++++++++++++++
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------------
>  2 files changed, 28 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

