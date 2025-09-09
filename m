Return-Path: <linux-input+bounces-14562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D2B4FB9E
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 14:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0F1344BF2
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 12:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79C533CE9F;
	Tue,  9 Sep 2025 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz/EqQ0/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4433CE90;
	Tue,  9 Sep 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422074; cv=none; b=UHL64YyWPGGLVvzYDObwFp2WnCjPWUGh+CgndccK6kKjXhjOQ3edc/aBTIm3TRpO0hYu0qoMhlXLjNyEK/aBDs0YYcbLHBRdpgadt9JMEtlDIVv1vgk2PappVgAOhAzNgJAFHmzIjQwW6UwKn8Jv2+qi6hs3Hym3k86wICn3KSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422074; c=relaxed/simple;
	bh=f2BgTpGloOs01f31QuMdTaoHukZS6F91NCX5xYrWwf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hs6Y8aoESlacejGDuO9mJqYw8cyhHyjlkYF5s6ehGAQyTEkL9B8r96Z2OltsoflB4MzNZlhHaHAyFxyteX0gErkNqjQXZ37C7HwwGdmuL+aePNv5HDWjL71eZbnjlN9QlcK0LX/cQOmE0eJ0qwYWTPuOfTxCZRVzk7fOi27H8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz/EqQ0/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45cb659e858so38612115e9.2;
        Tue, 09 Sep 2025 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757422071; x=1758026871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sknQ4v04zMJRg7aMri76BP+yjjkuvx43VxPX8joYE3g=;
        b=Pz/EqQ0/5yX9zy/hG5MPQm11knHScJELJJVttlmHfJ3l7qDX/vs1MDTsTzlZiyis2x
         KOCzrestacT+L1JEFt93/r3NCU3Wz3vqmc3BRIr9OumDAlyQt4mN5sCuXKDGtac4zLLk
         u6r9VTfEKgw75UZiOlAeVgJEnNWmBQjGfpwVZXjlbLS30gCa4iqgTM7182H0p22cpTs4
         6qsRUZ/wrK/ULhfvvYPTMuizkBfovXcqcLxFtJ0pQznHP/+zMyl4mziQFuf+t5CEs8/2
         bEmzxPKg6ynB4sH4Y6OyLyI7VObSbJntQ+sZgaANKm+B6IZwc1AIg9qrJRNn9009gg7l
         x6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422071; x=1758026871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sknQ4v04zMJRg7aMri76BP+yjjkuvx43VxPX8joYE3g=;
        b=evpTG3AXFLEjBvY8t+W/49cWLbn3aOUI3bMqwBivOOnpy7boGx5pw7PVZcJmF6Myb2
         YwCECilw0X/cD3QxIlSEMqvmwAQNIgkbXQ4BOjUkQyPpKwEeVfsK9l8Qt4v64vYZGBpx
         k/2nNMSvUfWdsvMvA9X/yBe1i9TLn/bkJanukVvsrngXrO5jdKYpTl386sPcVYGgxD4t
         nrt3jR3DVr2FxIDi0c9b9iVD6MlAKd67oBIZrVIrRU9GwnjmvQI7qiy0Q7YUOSluMaWD
         61DSRV+WV6YzYoS4XpC02vHhE207AvtFvsXpZWx/QMNVnKwne94jypWhpow9KNEs4nCf
         BryA==
X-Forwarded-Encrypted: i=1; AJvYcCUKq+TYgRFnGt1u9194AOD5uCu58aQD8aV7BmdV0Dw6neGK8YLW/Gxd/FmWpDYIeZgp4uVO086QTqS8@vger.kernel.org, AJvYcCUyhyC7vIV+Qrk3eapPGMjZuGz/JLpH3qwYHnTJhXI68A7u6kVuc/EHgz2IrNDy+EJh0CuBEsAHJsl/OmO8@vger.kernel.org
X-Gm-Message-State: AOJu0YylVFLqXKM1BqOnC04IB086VEivaQpKkz0XODTdB4jwpxb890eo
	DWoGTZeZTNdLetBskXMyQP2bwLKZJ2aQi3rYZVitHq0PLx/b4otIOLL3CinS/A==
X-Gm-Gg: ASbGncvG11wWzIOAu2Md1mB9yZHwLc1uRni8DvRjrPnvMWquW80BqdfwLZ1PTNTIokH
	YHPl3+4xO8BkukuGteclN4i+EHS7g7uQQxDsO0r1iYJXEPEwuGgfZyWHthP3JujEG9xvbCkzEtg
	WMV0LCw32JwS4vtOZR8MlhcqHzKmRUAALcCXcKWrNyFBS3QvlThBI3sbWqsjT41qdO9mWNBN1QD
	q1oiRcaAkeSYvioN3P9hUEfMPHKX03IwxkQ3BDHCa5nYOF1koMkrFshbDlmR1ZZdPD2oGmfDjXq
	8rLfPNetaSsGgSohBQO8mQpfHDdeZiUtb3/lxvtEFtLP5nSRQg8stlT5zhlgEbxL0+8B69GEhpP
	ioJB1ReZV3ITvXiiArarbKcQdKTbB8GM2X96Aqgr5pg==
X-Google-Smtp-Source: AGHT+IF7VDa3q9SU8Hb8VKgsof+wzfraByxvrUN6D+R4v5hiuxuAYZeQmJI3MV7ScaIIyzTNCd0n7w==
X-Received: by 2002:a05:600c:4f83:b0:45c:b56c:4183 with SMTP id 5b1f17b1804b1-45dddee9c59mr112287245e9.18.1757422071006;
        Tue, 09 Sep 2025 05:47:51 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de18f4824sm136453475e9.10.2025.09.09.05.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:47:49 -0700 (PDT)
Message-ID: <c09e6239-dc70-469d-b9bb-02398f2b621b@gmail.com>
Date: Tue, 9 Sep 2025 14:47:47 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: mediatek: mt8395-nio-12l: add PMIC and
 GPIO keys support
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
 <20250905-radxa-nio-12-l-gpio-v3-2-40f11377fb55@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-2-40f11377fb55@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/09/2025 13:51, Julien Massot wrote:
> Add support for PMIC and GPIO keys on the Radxa NIO 12L board:
> Declare a gpio-keys node for the Volume Up button using GPIO106.
> Add the corresponding pin configuration in the pinctrl node.
> Add a mediatek,mt6359-keys subnode under the PMIC to handle the
> power and home buttons exposed by the MT6359.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Queued, thanks.
Matthias

> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 36 ++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index 329c60cc6a6be0b4be8c0b8bb033b32d35302804..fd596e2298285361ad7c2fb828feec598d75a73e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -8,6 +8,7 @@
>   #include "mt8195.dtsi"
>   #include "mt6359.dtsi"
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> @@ -60,6 +61,18 @@ backlight: backlight {
>   		status = "disabled";
>   	};
>   
> +	keys: gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-volume-up {
> +			wakeup-source;
> +			debounce-interval = <100>;
> +			gpios = <&pio 106 GPIO_ACTIVE_LOW>;
> +			label = "volume_up";
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
>   	wifi_vreg: regulator-wifi-3v3-en {
>   		compatible = "regulator-fixed";
>   		regulator-name = "wifi_3v3_en";
> @@ -626,6 +639,14 @@ pins-txd {
>   		};
>   	};
>   
> +	gpio_key_pins: gpio-keys-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
> +			bias-pull-up;
> +			input-enable;
> +		};
> +	};
> +
>   	i2c2_pins: i2c2-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
> @@ -880,6 +901,21 @@ &pciephy {
>   
>   &pmic {
>   	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> +
> +	mt6359keys: keys {
> +		compatible = "mediatek,mt6359-keys";
> +		mediatek,long-press-mode = <1>;
> +		power-off-time-sec = <0>;
> +
> +		power-key {
> +			linux,keycodes = <KEY_POWER>;
> +			wakeup-source;
> +		};
> +
> +		home {
> +			linux,keycodes = <KEY_HOME>;
> +		};
> +	};
>   };
>   
>   &scp {
> 


