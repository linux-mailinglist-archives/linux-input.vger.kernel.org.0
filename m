Return-Path: <linux-input+bounces-14991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD12B93470
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 22:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7547B442DDA
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 20:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B37227A10C;
	Mon, 22 Sep 2025 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tB/fzyHU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E95F279782;
	Mon, 22 Sep 2025 20:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574407; cv=none; b=mbsRG7a5Zb2wIanbu01SbUokAnBsvXLkVSorKZVweodXOaY3JS0zFr0o/ctbBLWNDHzEPX0FON6iLb01PoZjHSCli3G0+6I7mxvBcq9PRXNst4hRqw+oolOjAtkyNKTnvHy4whNEMg7SRG+z7i+4ypG+KOSuavgywWGgta/wgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574407; c=relaxed/simple;
	bh=DiuQfD9Kf/1+kF5x4UO9UHkDanaUR9E+z4BreblPOCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjFcjyZBRH3JeC8KHwOFjUBjS88WgeN9cBHK3yD2pJEF+S/h1nuSGhjOPunD8DBNf8ob5QB4+EMc1v6F7KN1I721F7FFLKRkjmlLBMsYcetO74YV6NuYwXsJA9k6a0wyOhZp9fanBcMYcb37q7yPN9EzHbrjYlAOZHZY7weey0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tB/fzyHU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAF5C4CEF0;
	Mon, 22 Sep 2025 20:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574406;
	bh=DiuQfD9Kf/1+kF5x4UO9UHkDanaUR9E+z4BreblPOCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tB/fzyHUWZbuqImOMTSE6YgmnNXw2HWCrZmo7b5cuNhEfebwfcpoOP7CUvyK8cp8C
	 IwhDys3lfXo8dcf+TmwAzsuXndIBvwup156n6ru1mDtzkNWyeQyDxLQVgJdJaIOwTj
	 /H2sliKqDMLrmd6pMjJJ0buiOYjkdMo1LHIgFPwZ2oU0DPr/lK2vf2SBjGLmPA2Mtf
	 b64+8ahSI/mu5cbnbYtryr0C9vpwm+c0aU7rnzNhdOueCppDjl5te39XPUFeH1yl4G
	 u7N1g66f8WIWJ2pQJQXSsBL1bekoA+NoVJu8idM/xpGM/mGSTzFlUyINc2Xnc/A1/u
	 I8h6opdNrT66Q==
Date: Mon, 22 Sep 2025 15:53:25 -0500
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
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: bcm:
 raspberrypi,bcm2835-firmware: Add touchscreen child node
Message-ID: <20250922205325.GA1304482-robh@kernel.org>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
 <20250921173353.2641438-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921173353.2641438-2-dario.binacchi@amarulasolutions.com>

On Sun, Sep 21, 2025 at 07:33:43PM +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v5)
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
>  .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 27 +++++++++++++++++++
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------------
>  2 files changed, 27 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> index 1f84407a73e4..044544c17e8e 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> @@ -103,6 +103,27 @@ properties:
>        - compatible
>        - "#pwm-cells"
>  
> +  touchscreen:
> +    type: object
> +    additionalProperties: false

Needs a $ref to touchscreen.yaml

> +
> +    properties:
> +      compatible:
> +        const: raspberrypi,firmware-ts
> +
> +      firmware:
> +        deprecated: true
> +        description: Phandle to RPi's firmware device node.
> +
> +      touchscreen-size-x: true
> +      touchscreen-size-y: true
> +      touchscreen-inverted-x: true
> +      touchscreen-inverted-y: true
> +      touchscreen-swapped-x-y: true
> +
> +    required:
> +      - compatible
> +
>  required:
>    - compatible
>    - mboxes
> @@ -135,5 +156,11 @@ examples:
>              compatible = "raspberrypi,firmware-poe-pwm";
>              #pwm-cells = <2>;
>          };
> +
> +        ts: touchscreen {
> +            compatible = "raspberrypi,firmware-ts";
> +            touchscreen-size-x = <800>;
> +            touchscreen-size-y = <480>;
> +        };
>      };
>  ...
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
> -- 
> 2.43.0
> 
> base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
> branch: drop-touchscreen.txt

