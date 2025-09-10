Return-Path: <linux-input+bounces-14579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B199B51325
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 11:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 420A3164ECD
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 09:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397A9257826;
	Wed, 10 Sep 2025 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fae4N4Il"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548114A21;
	Wed, 10 Sep 2025 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497699; cv=none; b=pRHl+GtINToGbN3aluiBrYf8O+FpTMuwJCfB44G2wO0KeR4iOAUUh90uKGrbfHXIOf4OGB+VSMQu/f/iynheTIVjIH2vigkJYbJER/VrKxhEkk9tn0iSL/so7tAK38p3Tno2LKUG2AMP0oC21QAzZKH2tMfZP/Z9njgsYBHlLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497699; c=relaxed/simple;
	bh=LsUf9oLEru8z9ELOzat9zfzTzQ1HhUm6EoCQnc810x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPhZaumFVfCgWDqNTMmkim6UELNgcTJjCwSqzfglr/QNI8/FzB+2PPRVhDK2Xs2rOGT9Gm6ycisKeyBtdZ/Ui/rFHBOoE+vZYh4bu8DlxaE8fk6LVp5OYlEKTxiTFk0LBpJ9IK/48sy9IRcdMEkEgn5X7cVbazU69Y15eBw2Tlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fae4N4Il; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so3639677f8f.1;
        Wed, 10 Sep 2025 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757497695; x=1758102495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fvWzS942sl9K7TdJhE3IIiPtyTBcuDx5QSL2bbxUBbU=;
        b=fae4N4IllvwdCmN+QeBYjux4sVfLcgO9QZQ5zK5vgxyBA5r0ldJ6Ed52B8ztJWwTBA
         spb0Y/XrBk98k/5iJmB/iIJurEdQAHh3uP2ZPYywv4YzzAhjUibWvLOUbr8C5ifWSbrU
         KjmWpS09qVYMtY7/d3maEA/vwAixW0Ek4WzoK3MfzVVu9Soy6nLROC2gSA7GVNCp19lk
         2zZkyBEXLudzVhejdqYZLfJLyidna2Xn8OpU0s2ONkY4jvkQNLSZ8e8+EfFBqLOujwG0
         HzsAF9P4w/e41+BrT/ECOoio+Cr4VjWfyxoOS3lx4P+iKxPTEYNGxmU8lj2ciHWRUC8z
         fGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497695; x=1758102495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvWzS942sl9K7TdJhE3IIiPtyTBcuDx5QSL2bbxUBbU=;
        b=Dbub+TjcLBlH/kgeifzlTiW5++KxnP/zGGtrsUcUoGU+1FrqmBazAnupn4cp+46M54
         NARZcC4nwiYBNOWm37IGjF/xXo5JsTo1RYlpFRHIY8pQAX0bzBtag7my+HZaeUZRlPeB
         rmd026mmDTFll0QFF2Y37RXxHt/e0wCd2RpUt+jEPUZ6li64dsWdrYt0Jmp+fNN+lUvt
         D6aQU6hTYf/PJr/5pTqikhFzY5L9/7lSmPohSetYC51+GQU6cbkNDlsNvXLw+Rsn1On6
         Zzhup3zdJRWkg+rGnWi7QO2gOcP6csz4xFAohJUhipZusRgSme/XAIRatII/jNBM6bkG
         ppiw==
X-Forwarded-Encrypted: i=1; AJvYcCVOdMfcy0jEObm6t3ic8doe2RLex0n0qU2d/FIr79VlL8p2bFzx8c817DidvvRBzFWMxDGKKv7Pp4YO@vger.kernel.org, AJvYcCWx3U845100SRB9QSnnunuQMDgDDjBgBreJD7VVzrGHmBJQckWmtmYIEl3g2AXuAAzZ1iksymeba/bR1K2i@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJ/lsejO3kXyjPRdbKz0/HeyAAsDpYl7mITZWhpXsZS9HXFtR
	ticBkR+eunlsoB0V2BnKqMlMOfW2e6Ir6JngTA0PzifulkpDVYeNHO1S
X-Gm-Gg: ASbGncuobvbDKMBYHL+iki2XNJENLr7QKNPBqs6sUnu2yTLGjB3AjO/X6upkr8zL1ju
	gUg1U/HQ3QylT8+DRw6ezmQZEcVoxBCPK3fvFckRqzpvP8dr8vDzJRr4xjiWpuiED0sMEMfHqRT
	py1VSsqu3Yd0H3714f8/Iq5SKIU44i13wDtCaTd0Oto6bsIWq0UO8lUYhQ3XRtERBpA53jpxTE1
	v+Ida50fNfoMb0DUOQXY0sZz51T7p6zeE8G+tfWXOM2d09feHDdxb/elOHe3QzGnGq4LY6HxDMj
	ZK9cmiA+sARZGQf7L1Cr43pHiU/76PZQo0XwrqlhfetL1ZhdrcSjYBkvJl4IBU8u1mJdf8dsSsl
	OQ49lMCNcrAxo5ku5rQFsDMA4xDE14ZNqZROPlPTdSQod5HSyQ/JZ92dFiZ2BJcfH+g+dulji
X-Google-Smtp-Source: AGHT+IGE36lJKKNg+ppA7YOvf2X4FE/fbTStcAqoVMnOyK3dvNvS9vqCBo0pUphTN7bH8X2XtqXmcQ==
X-Received: by 2002:a05:6000:3103:b0:3d7:618b:2939 with SMTP id ffacd0b85a97d-3e643ff59a9mr14353030f8f.38.1757497694801;
        Wed, 10 Sep 2025 02:48:14 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df82247basm21584115e9.18.2025.09.10.02.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:48:13 -0700 (PDT)
Message-ID: <6b781d80-a991-44de-b066-390914af1e0d@gmail.com>
Date: Wed, 10 Sep 2025 11:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support
 for blue and red LEDs
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
 <20250905-radxa-nio-12-l-gpio-v3-3-40f11377fb55@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-3-40f11377fb55@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/09/2025 13:52, Julien Massot wrote:
> The Radxa NIO 12L board has an RGB LED, of which only red and blue
> are controllable.
> 
> Red and blue LEDs: no need to choose, both are enabled.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index fd596e2298285361ad7c2fb828feec598d75a73e..0ea36e7c960fc0b2607833d743c5e2e806864600 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>   #include <dt-bindings/spmi/spmi.h>
> @@ -73,6 +74,26 @@ button-volume-up {
>   		};
>   	};
>   
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-0 = <&gpio_leds_pins>;
> +		pinctrl-names = "default";
> +
> +		/*
> +		 * This board has a RGB LED, of which only R and B
> +		 * are controllable.
> +		 */
> +		rgb-blue {

Please fix the DT warnings and submit again.

Matthias

> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
>   	wifi_vreg: regulator-wifi-3v3-en {
>   		compatible = "regulator-fixed";
>   		regulator-name = "wifi_3v3_en";
> @@ -647,6 +668,14 @@ pins {
>   		};
>   	};
>   
> +	gpio_leds_pins: gpio-leds-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>,
> +				 <PINMUX_GPIO7__FUNC_GPIO7>;
> +			output-low;
> +		};
> +	};
> +
>   	i2c2_pins: i2c2-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
> 


