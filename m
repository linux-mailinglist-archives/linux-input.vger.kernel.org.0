Return-Path: <linux-input+bounces-3279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7268B39B3
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 16:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3D6BB22CBA
	for <lists+linux-input@lfdr.de>; Fri, 26 Apr 2024 14:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEDE1474AC;
	Fri, 26 Apr 2024 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfoGYlID"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A585142A99;
	Fri, 26 Apr 2024 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714141264; cv=none; b=tCk6TqikGXHo5JJMOJ0O8hnbNYGMKt7t3FWOrGG9SV/f9bWYDoJ60VRLznUo6YeU+5lP9vl8u6kvLIgtClmBXUIhjmNXbDKg9ySY8pY6uplmB465muXg2Wnvb+YWYdKOTUofdLnKXP/wbcltaUUgu1tPfiZzeDj+l2psDIDmxQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714141264; c=relaxed/simple;
	bh=HtaE9K5koiwN6wG3R9aBkT6Go6kjdIeW/lsuxiuyX9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kx+WpIJ1wj5mJDGG32YDJQ8f0NbTVu8W16UtwDcMluxfgWOuRB5JrpLNgoPd+z39oN4KkPV9+cjkVyq9S8400hnCdffAgt9MayXyoqOFPIyZDYjw1vTmEDMTThTXbt79Nn2O3qfqiKFW+csETRw3IJLUSadU3OAV/UtXSirUiwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfoGYlID; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41b5e74fa2fso10579365e9.1;
        Fri, 26 Apr 2024 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714141261; x=1714746061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcSYxBKA+TZoPvet+d86+0v1ZeIYTYUADrPblLGoYOs=;
        b=IfoGYlIDcc3yboKQC+JhfLliuBOi1D4IJzg1iWyo6nfqWaPTXH958kT4B7A/IDTgO3
         tMr3m3RkoU3K8BVWDLEG1PtdkJ1ymAqB32/KPbE2kty/xnGrr/mKfIUWRLoCXz/NLxfe
         ZzpOA3CIDSldAC/0v0LJ01bG94qLiua0rv/RK/Gz3fvSZF+TmLANjplthnpxbcrch5oQ
         dXIKctuFXqSALoJL/ZtE6mNpq5NwN4W+6LQ+jk2CzWpeOBAc6TWoTLbMFm5ko1A4plz8
         p2OqtRplzlqiQcYZs9bYLumoQ5R/O3BxxbzYf2hOkAsRgmKKZUvScss2ly8ftd47taiK
         1nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714141261; x=1714746061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcSYxBKA+TZoPvet+d86+0v1ZeIYTYUADrPblLGoYOs=;
        b=RxNg55cwCVsqiEfC8dG1kPHBj8DcAhe58M7KJEEl4/Obpyh9/MWhvveHJKHrpLH0ef
         zdvIGcoAytKOedPvFNuZcnfOX7d9O/1WAKNcwQBszAqIib7hKVK+6qXr/npiJQdWQ2nZ
         1Y1SnqMhSWtjUuFm7wyRbLbNiNUILaMyO7Tcct7YCupAjPwykKoM3rniqqqpyy8E/aOP
         Q5lFAoEL/n5D6W81wWyPbEoKSlVYsfkbWLtkHY4f8iTuajPU8grXO66YjcX3Wd+QEDMP
         jCe6okTTfA7ViQzt2/4ElWFfFhFyDpNY1XKN5vTeGeH6+DNYgOpwAvpRp+Fhj9t1yciL
         yS/A==
X-Forwarded-Encrypted: i=1; AJvYcCWCEPUXF+UGwyPxmMSOqS/h3vlJbLI7zg/hMG+cTLUTXzXb0tikgK0So/PwSNVAp1nnQAuVgzvtR5TTfXxFQU5kfJ3r3+JEoq7Znw==
X-Gm-Message-State: AOJu0YzOZDbWsNKSJJcp9EnDE4F3Uju9rGNgAYBVH1aCTV0yHQwNIT/A
	97chkylavB6YcF/DFhOVIwfb/MeA6E1Mm4RYYTMgILcPlh7rZp7W
X-Google-Smtp-Source: AGHT+IHK9nY7Tv7ih36ZXaVgFvH1aWTsjGgKFE5p3b1QCazf/uW3rKdX92rte5HJY7Ee1W4pAMhazg==
X-Received: by 2002:a05:600c:4e93:b0:418:e88b:92c3 with SMTP id f19-20020a05600c4e9300b00418e88b92c3mr2139031wmq.2.1714141260741;
        Fri, 26 Apr 2024 07:21:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b0041ac4aafd3dsm12701566wmo.12.2024.04.26.07.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 07:21:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 James McGregor <jamcgregor@protonmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/2] ARM: dts: sun50i: Add LRADC node
Date: Fri, 26 Apr 2024 16:20:51 +0200
Message-ID: <2931402.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240426092924.15489-3-jamcgregor@protonmail.com>
References:
 <20240426092924.15489-1-jamcgregor@protonmail.com>
 <20240426092924.15489-3-jamcgregor@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 26. april 2024 ob 11:29:48 GMT +2 je James McGregor napisal(a):
> Add a DT node for the Allwinner H616 LRADC describing the base address,
> interrupt, reset and clock gates.
>=20
> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> V1 -> V2: Moved DT node to correct place in tree order
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index a061b69c07c2..1e8538ca7db0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -594,6 +594,16 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells =3D <1>;
>  		};
> =20
> +		lradc: lradc@5070800 {
> +			compatible =3D "allwinner,sun50i-h616-lradc",
> +				     "allwinner,sun50i-r329-lradc";
> +			reg =3D <0x05070800 0x400>;
> +			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_KEYADC>;
> +			resets =3D <&ccu RST_BUS_KEYADC>;
> +			status =3D "disabled";
> +		};
> +
>  		usbotg: usb@5100000 {
>  			compatible =3D "allwinner,sun50i-h616-musb",
>  				     "allwinner,sun8i-h3-musb";
>=20





