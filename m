Return-Path: <linux-input+bounces-14870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF8B86D87
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 22:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AE55B60332
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 20:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0364931AF36;
	Thu, 18 Sep 2025 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjAC46Ty"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964231A7E8;
	Thu, 18 Sep 2025 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758226228; cv=none; b=qimd74GJTUoFgrL/I3KpDK2KrZZIJBeHIrVN+US5q/ucuv8ij/2Xw1VG6qCZbFg79/K1tVnJoVOH+atyjWGCqnyJPZYQCDxhCZWQqfxQfeyR7HPy/BU5W0CupxaBc73zlcrHrknojWpsvqPe1RjrWw7NULaPruefDCDcISHljt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758226228; c=relaxed/simple;
	bh=5pcBDDtxTATLmNQEKcdAreF3a0z7FlcBT6ZHksKiokU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbc14KdhE7GgQGsOv3ZcRS51YzJgYIVZsy9nEXTnF/0i4NTukJWtsvxYmmIb9UV8iN0cYcG4mirYSjovOibUJjrXB0qH6YLuh8CcTYTK+cTR9ddytmyAqqeAHXAw7NqfkFGW6/4Q1qTHIIm2ldWXShtdee6kTx2ByTtqc7ZuHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjAC46Ty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466C1C4CEF0;
	Thu, 18 Sep 2025 20:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226228;
	bh=5pcBDDtxTATLmNQEKcdAreF3a0z7FlcBT6ZHksKiokU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjAC46Ty9qbzcurfbOA3uIZu1qywMfSw0++diAkbCwBUyrbdLPzFqYRoQLGZKV7yJ
	 eoGbDzSzOrJlMZqJHgYZfdKE/FaqsHgKWkJxlDd8wqbO08MOCSy1iSSuZH85ZHceMs
	 mKUMisVyOWL+D2hcqqVU0XAM2Q8imy0pNbWzCbDrgI4Gada2NjG1gJ7sv6hkG4QwU3
	 zB9hJCKCgSIFwd588AgGXlSCZzagKISu+veUj0Z7S+dlOXHrly4tF5S2Hj30quCQ3E
	 FcJckMvyWh4BZDcCnPqmJLcY7Il/1hztoNdQsSYrTBtObSMI3dLo+iPv+881vYj8zM
	 kQ/j++g7axkNg==
Date: Thu, 18 Sep 2025 15:10:27 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] dt-bindings: touchscreen: convert
 raspberrypi,firmware-ts bindings to json schema
Message-ID: <20250918201027.GA2547040-robh@kernel.org>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
 <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com>

On Thu, Sep 18, 2025 at 05:36:08PM +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Drop firmware-rpi node and use only touchscreen node to fix warnings
>   you can see in
>   https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/
> 
> Changes in v2:
> - Added in v2
> 
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------
>  .../touchscreen/raspberrypi,firmware-ts.yaml  | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
> deleted file mode 100644
> index 2a1af240ccc3..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Raspberry Pi firmware based 7" touchscreen
> -=====================================
> -
> -Required properties:
> - - compatible: "raspberrypi,firmware-ts"
> -
> -Optional properties:
> - - firmware: Reference to RPi's firmware device node
> - - touchscreen-size-x: See touchscreen.txt
> - - touchscreen-size-y: See touchscreen.txt
> - - touchscreen-inverted-x: See touchscreen.txt
> - - touchscreen-inverted-y: See touchscreen.txt
> - - touchscreen-swapped-x-y: See touchscreen.txt
> -
> -Example:
> -
> -firmware: firmware-rpi {
> -	compatible = "raspberrypi,bcm2835-firmware";
> -	mboxes = <&mailbox>;
> -
> -	ts: touchscreen {
> -		compatible = "raspberrypi,firmware-ts";
> -		touchscreen-size-x = <800>;
> -		touchscreen-size-y = <480>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> new file mode 100644
> index 000000000000..697c508326b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmware-ts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi firmware based 7" touchscreen
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - raspberrypi,firmware-ts
> +
> +  firmware:
> +    description: Phandle to RPi's firmware device node.

       deprecated: true

It should be a child node.

> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    touchscreen {
> +        compatible = "raspberrypi,firmware-ts";
> +        touchscreen-size-x = <800>;
> +        touchscreen-size-y = <480>;
> +    };
> -- 
> 2.43.0
> 
> base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
> branch: drop-touchscreen.txt

