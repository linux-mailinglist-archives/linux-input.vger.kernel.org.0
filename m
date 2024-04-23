Return-Path: <linux-input+bounces-3181-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F08AE1DA
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 12:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D9AB20C83
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 10:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269AC5FDA6;
	Tue, 23 Apr 2024 10:11:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29CC5FDD3;
	Tue, 23 Apr 2024 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713867099; cv=none; b=Rzp2Ero7hJ6SQEdi3H29xYQEGep/V/x+fMl20zZrBfPnxE5TBo4MSTGsNtm/+qBzCiDmCw4pfpYitav98+7JtYYl9ePc1zuZkzOBYPyMgXITGFrDV4pqg8roFGmJ31yEXWihU5qHOrZIUYIeeipDKXkhm2yFihUXK2pgdrZBPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713867099; c=relaxed/simple;
	bh=fHyaOKrELD39/yJjtFWlONPYGHW5TLnWmklKlRi7n7c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syaLvhdfGsOOeog9m7DoWld8p7EjgbkkOFrWCZePVuspgx+TFU3A0Y/2PVOPKqfp/f6qJD1GDBYfw1DaTHkE+7VV2TmEFMyj+m4ChLFR8zeMFlKFRbvQycP5DASvtjmDEBUzSh2Oy4VkNAKw7Ysw4zT1drtHmBFI7O/xK9/pJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C313339;
	Tue, 23 Apr 2024 03:12:04 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9006D3F7BD;
	Tue, 23 Apr 2024 03:11:34 -0700 (PDT)
Date: Tue, 23 Apr 2024 11:11:29 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, James
 McGregor <jamcgregor@protonmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h616: Add LRADC node
Message-ID: <20240423111129.08fb5f4f@donnerap.manchester.arm.com>
In-Reply-To: <20240422164511.2488261-3-andre.przywara@arm.com>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
	<20240422164511.2488261-3-andre.przywara@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Apr 2024 17:45:11 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> From: James McGregor <jamcgregor@protonmail.com>
> 
> Add a DT node for the Allwinner H616 LRADC describing the base address,
> interrupt, reset and clock gates.
> 
> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index a061b69c07c2..58fb28f83feb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -125,6 +125,16 @@ sram_c: sram@28000 {
>  			};
>  		};
>  
> +		lradc: lradc@5070800 {

The nodes under the /soc node are ordered by their MMIO address, so this
needs to be moved down, after the THS node.

> +			compatible = "allwinner,sun50i-h616-lradc",
> +				     "allwinner,sun50i-r329-lradc";
> +			reg = <0x05070800 0x400>;
> +			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_KEYADC>;
> +			resets = <&ccu RST_BUS_KEYADC>;

Compared against the manual, and can confirm the MMIO base address,
clock, reset and IRQ number.
Also the IP descriptions looks the same as in the R329 manual.

So with the node moved around:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +			status = "disabled";
> +		};
> +
>  		ccu: clock@3001000 {
>  			compatible = "allwinner,sun50i-h616-ccu";
>  			reg = <0x03001000 0x1000>;


