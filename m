Return-Path: <linux-input+bounces-13202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A167AEDB43
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 13:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D009E7ABFE3
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A28525DCF2;
	Mon, 30 Jun 2025 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ui75+re1"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E43239085;
	Mon, 30 Jun 2025 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283459; cv=none; b=Qx2QIdt3Ne5KDR+KsAqN9YVqNJbmAYyyocR6qFXMdrBpkBoGOlY2qe/bvW4AFpcBZeiqR65rEX5AcuXrtDF5aEed9iJpSbtFCsaOCH7HcYCO03Z0t0X4Mz4A8bsn5jz7UPwPo412zdExqn2bMQKNYuP719oIV0RcN5MRCQ1gqw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283459; c=relaxed/simple;
	bh=I3PYQ5xaPG2TzAk7BQT7/VC8l9Jfg1PToLKzjAZga9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AE07Zomk+bJLGe8sCS8lvlxtnVuTONpqLXEHpFIJe0aEq60t1eQIaMcdhpR/vPLAhBAIheCojPDmHc06t5laR9SO47QVb3Yphw1IImO9r7wLA+EuxuuLjUpTCrGR5iO/3PFNR0vGk4SMunyfLD5xjQ37uRwcxSjPDfUsZmuQMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ui75+re1; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xPFwbPUWBXDT92ojYtJuOQPO2L8B2j+IEn0/GIzjJBo=; b=Ui75+re1+KHTh458MbR2Bd8mPl
	fOrvQv6wD2E4IGeav9+UmD++98eSS9csdwlsEA1HIomHH3gzWvvVfs41PHmk7llKYSQwgXNKtaOiL
	AOXC7abgKoZk9smIrQjMKrpBQzXk8XxXwt1QTHgadnWPBVsOOLNlExIqBeGdqrsFfWcXcNMsQID88
	RZ8ydWZg0j6zM/5m4DhUwJ+QOgcUx9rKl5qEqME542DtN4XORD/Efywkrz/iKmOMLuOAwc3ehtmM5
	i3haBZVQrj/fCb3bx3+hhOOvLmWU57e00f7fFkB8kKL3kTCkLBh4p1STkCL24tcOgHeYoo7WksAvU
	ONCuxQHQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWCpJ-0008LL-Qw; Mon, 30 Jun 2025 13:37:33 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject:
 Re: [PATCH 1/4] dt-bindings: input: adc-keys: allow linux,input-type property
Date: Mon, 30 Jun 2025 13:37:32 +0200
Message-ID: <5913630.hdfAi7Kttb@diego>
In-Reply-To: <20250630-rock4d-audio-v1-1-0b3c8e8fda9c@collabora.com>
References:
 <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
 <20250630-rock4d-audio-v1-1-0b3c8e8fda9c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 30. Juni 2025, 12:19:24 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Nicolas Frattaroli:
> adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> property. This makes it impossible to model devices that have ADC inputs
> that should generate switch events.
>=20
> Add the property to the binding with the same default as gpio-keys.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Docu=
mentation/devicetree/bindings/input/adc-keys.yaml
> index 7aa078dead37816294732501e1983ab869f38311..e372ebc23d1651d73ef3749a5=
6d54872067037b5 100644
> --- a/Documentation/devicetree/bindings/input/adc-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
> @@ -42,6 +42,9 @@ patternProperties:
> =20
>        linux,code: true
> =20
> +      linux,input-type:
> +        default: 1  # EV_KEY
> +

having both adc- and gpio-keys behave the same in that regard makes a lot
of sense, and the addition matches gpio-keys.yaml, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>        press-threshold-microvolt:
>          description:
>            Voltage above or equal to which this key is considered pressed=
=2E No
>=20
>=20





