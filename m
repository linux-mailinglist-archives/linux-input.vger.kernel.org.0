Return-Path: <linux-input+bounces-3182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B46418AE1E2
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 12:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2171BB210E1
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 10:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE34604B3;
	Tue, 23 Apr 2024 10:15:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2825FB9B;
	Tue, 23 Apr 2024 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713867310; cv=none; b=sMQudguwiEGyiva0/+hE+KRIIieZmB6klaLdLTj3BKMddTayDrqK/tu/0o0gYlJ+HsIL6PH4VHSM3LzUoeuX07Xdtm1FlWbgCLIrj+9UgPry5IXUcxCNwkW8Ii8xEkspuoDKjsRYYqMEVyQoqmuUtTFmuK2qMzKsNgdnJXQnqA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713867310; c=relaxed/simple;
	bh=Osr6rU3wttnnnQU9hjmDIEE+AedreEYJr8U4hs8XXDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XAORL+sGaHNJzTS0fIAPDkpK8QY0E/TygEj8VBiOIRapOLw1yhWZW9g1+IDsOhPC8THHT8TgzsjCrTQVY0z+WmtQ3aiR7yOuq+lKLwa4m7hPAgBJiKIxnMyp8S5lTyKmun+KdDSjYKgcvCVdWa0oVlktBmgexbLDRZE62RYWfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4150C339;
	Tue, 23 Apr 2024 03:15:35 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98CD73F7BD;
	Tue, 23 Apr 2024 03:15:05 -0700 (PDT)
Date: Tue, 23 Apr 2024 11:15:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, James
 McGregor <jamcgregor@protonmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616
 compatible
Message-ID: <20240423111502.6e068887@donnerap.manchester.arm.com>
In-Reply-To: <20240422164511.2488261-2-andre.przywara@arm.com>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
	<20240422164511.2488261-2-andre.przywara@arm.com>
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

On Mon, 22 Apr 2024 17:45:10 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> From: James McGregor <jamcgregor@protonmail.com>
> 
> The Allwinner H616 SoC has an LRADC which is compatible with the
> versions in existing SoCs.
> Add a compatible string for H616, with the R329 fallback. This is the
> same as the D1, so put them into an enum.
> 
> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Compared the descriptions in the manual between the R392 and the H616, they
look the same:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
> index c384bf0bb25d..8cb5820774e0 100644
> --- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
> @@ -22,7 +22,9 @@ properties:
>            - const: allwinner,sun8i-a83t-r-lradc
>        - const: allwinner,sun50i-r329-lradc
>        - items:
> -          - const: allwinner,sun20i-d1-lradc
> +          - enum:
> +              - allwinner,sun50i-h616-lradc
> +              - allwinner,sun20i-d1-lradc
>            - const: allwinner,sun50i-r329-lradc
>  
>    reg:


