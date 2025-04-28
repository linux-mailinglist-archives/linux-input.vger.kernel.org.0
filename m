Return-Path: <linux-input+bounces-12053-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38304A9F9C6
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 21:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848DE1A8017D
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 19:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EDA42AA6;
	Mon, 28 Apr 2025 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wxuP+dtB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D1C18DB24
	for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869139; cv=none; b=B0tURllHqXSLun96r8hEzLGXGAKJwP8+RWi18kOOdsBCQBrrk33zlowKoR7lFndVZdPohVHyMi8K3mDzosYkQTZhBYfRKyfgCSrPY1RemFmuOc++8zyjyTbp0M3Tt+hWC+ZcTVKsT5xRR0f8K8NOosTVytjRDK6a6LaZOLiyqec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869139; c=relaxed/simple;
	bh=13xUiVobxzRSH7gXywjwaNcP6SoEC7CZkLAaSA9kBcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtBSpwhlyHZZ7x8Nv37S0GUcwju5FtjeLBq1EV653D6lafjTfvz0C1QC5BIqqqZzIVIxUYNaNpB6lFPbK13K6taAP7guCXhhjml+/eih6QqCYKRZP8AqnSn6oif7hwyCUdpfvxFe5aj19F8mmjGme2BJUCbZ4bga5NY+ebqASZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wxuP+dtB; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73972a54919so4409043b3a.3
        for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869137; x=1746473937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=wxuP+dtBkcJUysgq1FhpfXRRRQToT/in7/hqNm7AxK0QAZuLo/EuhT9VVX4op6MtZc
         bU5SKS1YD4M1NZ+clOUzUZA/u47f1YyZ1JQxdkUL+JR7gUWlsG6OI5GIwFS4CIVMw6TI
         2Xc+Y4Fo2E7XPhlnEXKkG/gc2rc48dMtQDTlzhmVBN7NCx34e/PSsVC3SnHZPurZk5ao
         il0pR82z14ABHlW/DQwBiBSK5QCQHCcddki8wFEGC3AZVGXtV4Q4GA7BSyScRC5HZbAN
         /zoPw4pxVT3SYtQ08H2091rQOGCV/fxgWz3/N2lC1lurDdDrBz4+Pl1fYv/RFaEYkQ2v
         ckfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869137; x=1746473937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=AtBWyFPmRMgEQmzSY5XjVuZ135WNBkcmeGVowLAenU0DKxfbruIEYAl9SBb4gBxhuE
         fczpQmeIr6uiDNZfpbNtb6aKAbVIrhorn8YVuIwBSiiDs8I59TQpD6cwrYjj9mmf1kwJ
         KNjM51ocKMzb/HuUGXNzbWmb4CQh77m43PnXKGSmwm/F2yn7X08bZE5OkeLr0+2xB0Bc
         0MGcLUYfjI3FSn0FQn9jpTXGimJl8oJc90deMb3XHng1F6crXiOpTaZ6FhacR17w0/Vx
         FzktHFPPTvkGF7JmEENaBuhb1GTM4/cFYDuFQEl+Kl/6wNEAsmagDnESMqtXuiMowp5X
         cjDw==
X-Forwarded-Encrypted: i=1; AJvYcCUcTxtgUsQ+l2fFZhLHL6SK3i6Fro8HmnFQEewoDDmXl9Wr0CglksETi7D1nW+p37IjjEpOaYdhu0j2xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxi97bpOK2ccA4AcpRdIU9WsaTAM9h/kN6udRxTSOtvD4+tVB
	8dgGyhViVbuM4koaCkwK3aExEVGn3S5tbFSseq9dZRKZ8327Stc6yz5ay4WlVA==
X-Gm-Gg: ASbGncuTa0nBd9dkWI65T8VRqwb7SUe/4O1t3fA3DK481vGASsj4mz3T+dLKmv6s79B
	ovSIbnRzlFGnjpdOyuGE2SZ7DQ+Fsb0rJiUpymLrh5E0S2B7bgWhEqU22pfBpAXjYpNXJGuI3Iy
	kjRnaw4KO8wnL4ChbTb7U2d9XoHdBPjPFmHmZ0tuyBgeCjvjgAgKt8rDKfCuEbUCbY2Ay9YVbaI
	kciYEdNwL9SXtH4ScTS+96xqO6Awg0J7JsKdand3fFabB8h9FHGOfx6dl/MTNSlCRw/Pfhwvcvw
	jltz/6tcEPuVPzkV6WC4AsXL5OfMoqq5b2dCnUUfEOzihx82IHNYSTPvNGKYstbajFa+H3pyOg=
	=
X-Google-Smtp-Source: AGHT+IHmlLzT3YLWMcB9dRwkEoEHVu8JunNQRTVgpY+NajhMftB1PbhiEiMvQy73a8wiTuoNqCPhhg==
X-Received: by 2002:aa7:88cb:0:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74027139a2cmr1699641b3a.8.1745869137003;
        Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941e7bsm8721326b3a.52.2025.04.28.12.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:55 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:51 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle
 Chromebooks
Message-ID: <aA_ZS8cNneR_fyDK@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XymM9xtRtIWUo1hO"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-4-wenst@chromium.org>


--XymM9xtRtIWUo1hO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:41PM +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
> Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 49ddc504c160..f0b4ccd81c4d 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -291,6 +291,10 @@ properties:
>            - const: google,steelix-sku196608
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
> +        items:
> +          - const: google,squirtle
> +          - const: mediatek,mt8186
>        - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM=
3001))
>          items:
>            - const: google,starmie-sku0
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--XymM9xtRtIWUo1hO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZSwAKCRBzbaomhzOw
wmjGAP0Rjz88KZq9wxTkLmE2fLTGJpXJLEOGhasJsrHYmQgrDQEA+/raQJKGPQgA
EgvDbveTPRWunILosNFF76r3ozB4zwo=
=vSwx
-----END PGP SIGNATURE-----

--XymM9xtRtIWUo1hO--

