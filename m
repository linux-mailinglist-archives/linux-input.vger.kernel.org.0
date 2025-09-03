Return-Path: <linux-input+bounces-14451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B67B41E1C
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99E44854F5
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 12:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474E32FCC04;
	Wed,  3 Sep 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDnB6jqQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A122F83C1;
	Wed,  3 Sep 2025 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900771; cv=none; b=N8ydhRNEztAWWMBac+NOxx6U0Y3bmk3qAkZGDA1fVkQvsTZrai1k6C7oRUGxUncGeZUrIsJxqZRePuecUbVmQW8MdgPAwLG/ObnS03hA/xPAwOaB0JWGRD/f+kJD3bD6dy4/buS/6etW2aKpkz5DZauIcv0xAHuD2rpfRca2iBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900771; c=relaxed/simple;
	bh=wPHLMdV5oA5M8MmpYNrhTmi8f8b71/Fuso90AaoTd+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/yn86c5zhK0ysgHzhdwx7o96FB5thD/qbWYDvHTOTn7F11KC2dsSFJK+yt8sz32pjMsKjYcw0fFXSyj7cUfpN55s4VsWGVptO2jbeaP3JoJzgOyPNvITLRCHPaqm8u2ur5cm2uH/k7WEm3vENFZJ/HA2IZYGpy9RkNjXDUcxXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDnB6jqQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42191C4CEF0;
	Wed,  3 Sep 2025 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756900770;
	bh=wPHLMdV5oA5M8MmpYNrhTmi8f8b71/Fuso90AaoTd+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDnB6jqQQSTSHqmj+E0Q7PrtFxoSdRJWfQsYR1eVkxtP81za7Y1/YpzmERhlud/0H
	 McgyRha/daqC4SyS1U5MRbneNj102JKPvQkLapZGVS222QUSKIc5bXXHNsraGwSwYs
	 jqsls5IfIcCAmL7I+GWudp/fDAAyoyM+pD3/hYRSFh+S/qhl9dNsBWS98CvSqoPzbo
	 7V3tsafkUPP4ZdhAxbxJhYRhRdgFtdNqYxLEJUOQX/M0Wt7PlZCeuMv1jBsThnjLIN
	 Gp2EQpYaTUcWm7besy1uaRigc/Jyi8bEGRgMSCkLz6Qowz0dPJSOsVwP0h2Sn9mvoK
	 70vbsVgl4MEfw==
Date: Wed, 3 Sep 2025 12:59:25 +0100
From: Lee Jones <lee@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] leds: mc13783: use fsl,led-control as node name
Message-ID: <20250903115925.GM2163762@google.com>
References: <20250823144441.12654-1-akurz@blala.de>
 <20250823144441.12654-9-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250823144441.12654-9-akurz@blala.de>

Did you actually test this?

> According to fsl,mc13xxx.yaml, the node name for led-control is
> vendor prefixed. Change it accordingly.

According to what, now?  I see:

% find . -name fsl,mc13xxx.yaml
<no results>

% git grep fsl,led-control
<no results>

% git grep led-control | grep -v led-controller
Documentation/devicetree/bindings/mfd/mc13xxx.txt:  "led-control". Number of register depends of used IC, for MC13783 is 6,
Documentation/devicetree/bindings/mfd/mc13xxx.txt:			led-control = <0x000 0x000 0x0e0 0x000>;
Documentation/netlink/specs/rt-link.yaml:        name: coupled-control
arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi:			led-control = <0x001 0x000 0x000 0x000 0x000 0x000>;
arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts:			led-control = <0x0 0x0 0x3f83f8 0x0>;
arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts:			led-control = <0x0 0x0 0x3f83f8 0x0>;
arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts:			led-control = <0x0 0x0 0x3f83f8 0x0>;
drivers/leds/leds-mc13783.c:	ret = of_property_read_u32_array(parent, "led-control",

> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/leds/leds-mc13783.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> index e22f09d13798..11add1fd24ce 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c
> @@ -127,7 +127,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
>  	if (!parent)
>  		return ERR_PTR(-ENODATA);
>  
> -	ret = of_property_read_u32_array(parent, "led-control",
> +	ret = of_property_read_u32_array(parent, "fsl,led-control",
>  					 pdata->led_control,
>  					 leds->devtype->num_regs);

-- 
Lee Jones [李琼斯]

