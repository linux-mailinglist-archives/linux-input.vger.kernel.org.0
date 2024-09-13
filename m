Return-Path: <linux-input+bounces-6536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED744978869
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 21:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71CCC1F284E5
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 19:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7932B14658C;
	Fri, 13 Sep 2024 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="O+H3CUKB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE312D758
	for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726254175; cv=none; b=iXOn4N94iTNiG8b79iMMceWJ6kOibxG2kwZ3jc1cBgjGGW82nqH7jpY9U4+vGfPsJ5xwa019faBbQ2/HBlCZcOXarhkB14BIir5t6L/tfAhIXQgoX1vZQv6yLZyOt+9Ywt1Q/YFi9Np0P+u9H5H/rflnuMhoGcdEmS2dSUFPN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726254175; c=relaxed/simple;
	bh=hzf9eTYQm5HBPInuHGmxUJ8hYh5awgKWO6NeIjhpAxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PpQRuZ0r//XPK1LD5N/HVJU6xn01FfI625MZ/+E3/EkeyB7625IJiWfWs9cmN1hmEwQW6P0MfpHX/kM+CDvTmEanzwCN+FTZEwY+6DLc8BRq/K6lUOScV0wSzdBzNXPAWAvbBA/HARy25QAiDudg2QYWc6D7oRe6hLdzMLEGHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=O+H3CUKB; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f78b28ddb6so21866091fa.0
        for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1726254170; x=1726858970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFMQpW/5xpKH62jSxPCKZoeksH9vz3ccBemfSscBQOM=;
        b=O+H3CUKB4D0skb6Ux77/1PKCMfVMve3XDdkTgZWUrsKh09DlTgJSEZp+N/NmMlpPh7
         FFLvGnqiC3ZMG8vdTtbkSgtvRVjv7+yjUb8G0XNy3SqRLcz8TukjHS8a6SlpsQNI9d0M
         JztnKohoG6QrTsZDLLzlABKTzakVi+arIcswbdDPTpYdBEc1r3UfltKofyduucEfFcbF
         J/VrAmI/r2wikboLlbDjl7eZtvZ8oDwOq00ilFOMuXGl/SwlL4qlHiaW6lcDbLyeRH6/
         ZDQTnNC73mfdEbmBsRvYNRgYM1X02yxJvKpDl0xlRkHBYaT1hRarmNzCDXrYNfxXg4aF
         ElOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726254170; x=1726858970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFMQpW/5xpKH62jSxPCKZoeksH9vz3ccBemfSscBQOM=;
        b=ZKgUFQKYlW+KU7drQjlO+iH3PJPFX5/r/aA8QObxM0Ix0J8fQXzqp5mk4rk29fcnHl
         HZVQu9U0fjb/CQNhkES1OPfRHr0neyB+FLOABuUYWMWZhDJzsX9JV2zmc4gjYqDcbQUK
         TOE8lD6W17SYOD9shPXoxzOJxddxyiuf9Ma2mAGFCgjRaHaZ72XNvDdB+rPfDviAiZaN
         OswIZu9cFAsjPnmWzbXLDZwgC39Qd9rH3lua8OE6EO/W38aywX0oT7rT4jGuRAn36s6u
         1Ra4Z6Z1jFJZuG0bJyK51tNE0MzUoDwOcMVRKSVEjkY7WfizxOOCaZWcmzJO6VP20Nj5
         QxEg==
X-Forwarded-Encrypted: i=1; AJvYcCX+VNvjnqmKdfgMtt3xtoyKV7MG0mku7bmdTiLqweDDg5gsfFGCL5Lh6pVd6/sgRQy8Jp11vdZQ3vx11g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRdAvAdXFKlwyUHfu1U9z0MBd7SaatlaSq23iZsCk3OfluuOnd
	7zMGOUkKaSuZo0GNmrFsAdpFNoZMMyHHS8f5JlpB5Q0l2074WZEWAcf1agV0Ra+vKY4HRm73uXv
	Gv1PSJaqO75HYkbEiyvi0bLr76nGJXgxhDmMlDw==
X-Google-Smtp-Source: AGHT+IG04MtFkoqeSZ+ZwHbb/afYODEkr16FWXAk4qdDs5nfmXBBJ7oS+aKXnVw26IQAdUNCPeHcTtPlTkeDl/uvGDw=
X-Received: by 2002:a05:651c:b2b:b0:2f1:563d:ec8a with SMTP id
 38308e7fff4ca-2f787f4a407mr40618911fa.41.1726254169824; Fri, 13 Sep 2024
 12:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-16-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-16-2d2efd5c5877@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 13 Sep 2024 14:02:37 -0500
Message-ID: <CAKXuJqgrkt3qqCZsYP=jB2CVDSoacxH645Qxqein+JMkApx0Aw@mail.gmail.com>
Subject: Re: [PATCH v4 16/27] arm64: dts: qcom: sdm845: enable gmu
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dzmitry,

On Fri, Sep 13, 2024 at 10:15=E2=80=AFAM Dzmitry Sankouski <dsankouski@gmai=
l.com> wrote:
>
> Leave gmu enabled, because it's only probed when
> GPU is.
>
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 2 --
>  9 files changed, 34 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot=
/dts/qcom/sdm845-cheza.dtsi
> index e8276db9eabb..a5149a384167 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -741,10 +741,6 @@ touchscreen@10 {
>         };
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot=
/dts/qcom/sdm845-db845c.dts
> index 9a6d3d0c0ee4..59cb6e6e434c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -444,10 +444,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpi_dma0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sdm845-mtp.dts
> index 2391f842c903..d31efad8a321 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -414,10 +414,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 46e25c53829a..8a0f154bffc3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -345,10 +345,6 @@ &gcc {
>                                 <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm=
64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 486ce175e6bc..87fc4021e024 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -419,10 +419,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch=
/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index b02a1dc5fecd..a3a304e1ac87 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -415,10 +415,6 @@ &gcc {
>                         <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpi_dma0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi=
 b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 617b17b2d7d9..f790eb73abdd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -239,10 +239,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/ar=
m64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> index e386b504e978..501575c9beda 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> @@ -381,10 +381,6 @@ &gcc {
>                                 <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpi_dma0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 54077549b9da..fe154216f138 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4948,8 +4948,6 @@ gmu: gmu@506a000 {
>
>                         operating-points-v2 =3D <&gmu_opp_table>;
>
> -                       status =3D "disabled";
> -
>                         gmu_opp_table: opp-table {
>                                 compatible =3D "operating-points-v2";
>
>
> --
> 2.39.2
>
>

This seems like it would also affect the sdm850-lenovo-yoga-c630 which
inherits from sdm850.dtsi which inherits from sdm845.dtsi (they are
sdm845s with 2 higher clock speeds)

-- steev

