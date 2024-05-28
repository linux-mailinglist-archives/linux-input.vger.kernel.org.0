Return-Path: <linux-input+bounces-3912-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1228F8D217A
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 18:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A09DF1F246E0
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6411A17279E;
	Tue, 28 May 2024 16:18:53 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E99172799;
	Tue, 28 May 2024 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913133; cv=none; b=dYiuZWRtm0W02jxAROTJpdiG0QECR62YTPy66fUGFj4uNTcCRUzxvSqcEW/nSe1WW5u1wQ+4oB2dm0ifCfZz2PNwaB+90YqwBqGy/WLJ/Glh8AGFYf8PnDq3LDY492MIcpgz8jsYOOswYDl1fposDgDtlt7aPfuJnKX/vM5vm2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913133; c=relaxed/simple;
	bh=enOrTZpM2tWnXRPoFrirpkMmSsCchYgFfxbqdlmuU+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNBysKiiV6u8/lZpCOu9si+mBF/k0HZsofNKrkRiREQ9no8GU9w9uMbWSJ+pxNzqAx/Eqrwq/vRklMN0p31/DWHn0VfMngibUBRgQplzQg4Dqq7xlFcWYNQqBWn2QvU6Bw/0v4DhA93yJUiUlSvZJkmQSB6zg7IKMxm1vEnkemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5238fe0cfc9so946010e87.0;
        Tue, 28 May 2024 09:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716913129; x=1717517929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMrFie2mcYvWZ6BzC21LwkJeB7ab8c2qzeDd+G7m6R0=;
        b=sC3mVv19BGLCrCg/irTAKBJ98NUC8eBh0yMUfFN2buNMe61MvJl9BDEwwZpOf9klt2
         JE5Kb/gNG9Di/x3ZLIMao9WLarrYAY1x9LEMbx5P7fLXLwDkSXD1EkhJ+ZZVCrUqcT2d
         toZBnls5KGww88bSYnRYgnF/+RC++TpRuIwRGCxwEY2m88jzJEKQNlJaeMqib6Cgdli4
         mW/mJrNQ313oe29cmE+7Puj3qXmGnmxnan5uOgoq1/RckR9uMKq2wCt9N++uICvBA5L0
         jAh7dJTWJNWkXCK2pSdqsmSpdqTsGsLFxJkZjIarAM3EnUjc1bQrSeMmZQ8eN+4xZFnv
         IZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzi2OpvIEWkgteHyk4vcEkqwoo+gL+sBwtJ9cgjR8cJfZ8ydIxFxTxUa+y48bnMdfdHEHwzJOd6e0O+4dmA+37neoWr2UBiWhrRw==
X-Gm-Message-State: AOJu0Yzv9WndsnE4isOSxYSefW8MoFeHBuaVwigr//uKqD2XIOYmnUwO
	6KNvtHVhMboMMsQIdRHKA2In0c86rI4BQw106dVlVIzxMnZl9HRbDJG135OX
X-Google-Smtp-Source: AGHT+IGZv+uI2TPsIUU57qzMPpHB0/FCrfSw2oJgTfotXeG2bgCU1jh+Cp0PRD9giOrG8L7pMM3fqA==
X-Received: by 2002:a05:6512:281c:b0:51d:534d:cb6c with SMTP id 2adb3069b0e04-527ebfb867fmr6514093e87.0.1716913128713;
        Tue, 28 May 2024 09:18:48 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4a9b9sm980924e87.85.2024.05.28.09.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 09:18:48 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e95afec7e6so36390071fa.0;
        Tue, 28 May 2024 09:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0aIDwJE9tKnwdAj0o6ec5hJN0kMqCKwD9f5ZBUEyYr4WeIeSQ4bfdGug92JcoxufaDeTxQufN8wJ3UtZAewKFY9KWtkrMCoKhnQ==
X-Received: by 2002:a2e:9611:0:b0:2dd:44b:d63d with SMTP id
 38308e7fff4ca-2e951b82c05mr52618121fa.12.1716913128368; Tue, 28 May 2024
 09:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426092924.15489-1-jamcgregor@protonmail.com> <171691092979.680152.13758975851829859883.b4-ty@csie.org>
In-Reply-To: <171691092979.680152.13758975851829859883.b4-ty@csie.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2024 00:18:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v64L1XsXt2nW_jFXGaV-NVeOHdE4+LXCFdOyAYuhwpdzOQ@mail.gmail.com>
Message-ID: <CAGb2v64L1XsXt2nW_jFXGaV-NVeOHdE4+LXCFdOyAYuhwpdzOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: allwinner: H616: Add LRADC
To: Samuel Holland <samuel@sholland.org>, James McGregor <jamcgregor@protonmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 11:42=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Fri, 26 Apr 2024 09:29:37 +0000, James McGregor wrote:
> > Version 2 moves the LRADC DT node to the right place. It was out of
> > order before.
> >
> > The Allwinner H616 series of SoCs have a low-rate ADC (LRADC) with
> > 6-bit resolution and one input channel. They're compatible with the
> > existing drivers, so it only needs to be enabled in the DT.
> >
> > [...]
>
> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
>
> [1/2] dt-bindings: input: sun4i-lradc-keys: Add H616 compatible
>       https://git.kernel.org/sunxi/linux/c/3086803a1f43
> [2/2] ARM: dts: sun50i: Add LRADC node
>       https://git.kernel.org/sunxi/linux/c/7adc2d68f4a6

I had to do a quick rebase as the branch start point was incorrect. The
commit hashes will have changed. Rest assured that the patch is indeed
merged.


ChenYu

