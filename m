Return-Path: <linux-input+bounces-11306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6602A7296B
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 05:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E01FF7A61CD
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 04:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C71B195808;
	Thu, 27 Mar 2025 04:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsbGaAFK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F5192D8A;
	Thu, 27 Mar 2025 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743048612; cv=none; b=DwwR1yOyoMovlwWwFf672N9XfeLFJE8643UP9AZFpq0BYdeOflOaNqb9H2XSVzxO7EY07zZO9cKJL7Sd59EAAhEKSvAKAcAY8h0bodx+8HZzNy6XNC/PyIcJTl7i7bxq08VNRRgHHtyLhWybrfOlVm6d+JYt70YMIOvvYOjr3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743048612; c=relaxed/simple;
	bh=VsP2LINTLSEPAAo1v2T23H2pdhv80iTCg3RDUSOAqrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+9LU/pPA+vfnQLcR3a3f+jp/aA2roxKamssJwjX0+//4rDJaNjp1apzOEbJrzlYzzTqfd5BfS4Si29i0mlD02BZ05EjHP205zuh3+s36zcuWBRTI3t+QmdfWgzGqLKvf61YoJi+xZc4diNyQKouHm/uPM0h0H5Sw8sNVHhrhCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsbGaAFK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945A7C4CEE4;
	Thu, 27 Mar 2025 04:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743048611;
	bh=VsP2LINTLSEPAAo1v2T23H2pdhv80iTCg3RDUSOAqrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HsbGaAFKxORDa7bRPXk0vdB8Ib5k9qCdpuMz/JqEzZTWnSKGmPVI8dXi9sJzSI/At
	 PhiAn5QeDrJLI61J8K+4TnP3nNDjAHx297MhSyvrb4ITG4xN0chLyXAodBfPVpW7Q5
	 1/elazzW57C1ptZagCLxznediSv6PgXNsRTsGr6Mt0mofwPj8tuJHQ/E+WYl61o06W
	 yiwC1mL4hkkdD6jAEcPoG2MUvLcA98gLbO5Dbgi1xdFp4Kp6A0XjVq9K7tsaU9r218
	 NIbS8wjzAgANpVyFJ/6yc1t3+l4iWHt0bWpCGwNFSxD5cAKfGadiKRWKQb/71iEKoq
	 3adLpRaE8FO6A==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso982344a12.2;
        Wed, 26 Mar 2025 21:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJQBXa2QeRxdEI/NxjqQ2W3YwxHoDCyipQ4DIaUa3w2l97RqbUuWxxtONO77BUNJUyaQ8zu0hwvf+Gtw0u@vger.kernel.org, AJvYcCV/uRUtWX7m9JyCTsyAnr1ajrKr4wPPV/X+dPBrms1VhY7DMpZ0zN4epKltmUiyvr0ALMrdJooT8qVgxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOTNQgpcAqWx8vl5VsSTMbsFRnuJr1QxXgjx32C1qqSjn5ltN
	QkyartFqMfviq1x13Q/o+JCeNQxctEsY2fcKBySCIMCFvaW5uaC6U743Ku+v7rKyOdopwlN/DGH
	SIKPaYzBjI8z9nvdN5d167KB7Rtk=
X-Google-Smtp-Source: AGHT+IHekdfhqfTEbi0R3sIOc9m67myxT68+2FIpnCXytzWt2xwF5CltI1KXllCxe1mJHHPGE9McAnt83fx+7ntJc+U=
X-Received: by 2002:a17:907:6e90:b0:ac2:b1e2:4b85 with SMTP id
 a640c23a62f3a-ac6fae493e7mr149312566b.3.1743048610166; Wed, 26 Mar 2025
 21:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327025942.137057-1-zhaoqunqin@loongson.cn>
In-Reply-To: <20250327025942.137057-1-zhaoqunqin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Mar 2025 12:10:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H785p1cc+_22HYMBqinv4B-tfYCO7i4VwyR2ki9fx4Oiw@mail.gmail.com>
X-Gm-Features: AQ5f1JqNexFkWKHQV2imtO3dH-KNjTKxq__1nNSmJljcLFsB1OVwUXRAbpk2hvs
Message-ID: <CAAhV-H785p1cc+_22HYMBqinv4B-tfYCO7i4VwyR2ki9fx4Oiw@mail.gmail.com>
Subject: Re: [PATCH] input: atkbd: do not init atkbd_reset variable to true on Loongson
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qunqin,

On Thu, Mar 27, 2025 at 10:58=E2=80=AFAM Qunqin Zhao <zhaoqunqin@loongson.c=
n> wrote:
>
> The keyboard will not be confused on Loongson platform, so do not need a
> full reset of the keyboard.
>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/input/keyboard/atkbd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkb=
d.c
> index adf0f31199..f8ef3e929a 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -37,7 +37,8 @@ static int atkbd_set =3D 2;
>  module_param_named(set, atkbd_set, int, 0);
>  MODULE_PARM_DESC(set, "Select keyboard code set (2 =3D default, 3 =3D PS=
/2 native)");
>
> -#if defined(__i386__) || defined(__x86_64__) || defined(__hppa__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__hppa__) ||   \
> +       defined(__loongarch__)
No new line is needed, now there is no 80 columns limit.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


Huacai

>  static bool atkbd_reset;
>  #else
>  static bool atkbd_reset =3D true;
> --
> 2.45.2
>

