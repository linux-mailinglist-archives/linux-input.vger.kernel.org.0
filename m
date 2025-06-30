Return-Path: <linux-input+bounces-13203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53DAEDB97
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 13:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE0883AA509
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8FD283159;
	Mon, 30 Jun 2025 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wYg2ujN0"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5F217737;
	Mon, 30 Jun 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284167; cv=none; b=lI0w7E+KK+Mzt+92DawFTpmuc0exzTmMdDKAuR7PlrJB2wKVo5WJRBJIYwRwWZ7dXKOIOOSw/7lHRJRHFozTAiTDofugJpMS7gJF7m3Ki3ASOsJMrXlCSqJL6WH38KnqItq7LRWkmaU8jHm9IcrF1wYMm4aTjOet8cqsc3Q8NyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284167; c=relaxed/simple;
	bh=SUdtaLzTkXHo0e1aJWVEHdmO3hMtHuWb595FqlIlbwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sB3f7OcrCq6ndRAyMs06LmqPPXx5llQ3WhZ3Dl1NtF6pv6JTZWhakxO/3LhqJQammjwjczaUnQxWNUoKjBnckI6Yl/OxdAl4wLnwt2et34eyZw7oOKttCvLUV60pX2TZryTOL52ccAhG8frc/4sZtKB1xrlJnZsfSmesbgHwdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wYg2ujN0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=PMhrsG/YsbxMt+IC5JLuz7E1CuFXsvedzQusYHZo2XA=; b=wYg2ujN0VisunfydIG9JuMA9QI
	jdxztCi+DTaQU7FBDGPgS0kip8gNcT6a/gOwmcq5E1PAzjNFcIIn6d+qGiEZ0hAI9VD//7WW69AP2
	P4+bxHVVS745eHOcDNiFgRv6mxEeOulfZ/U28poZdbApyEwvEtFTx93/iVnS0Hov49LycPdIYLcEM
	ndYLhkVqmsHVUz+XXBN2dk26TCOndtadsuCRQdSklXLGKfomBf/BQIrUwCRB3uFeKb3WfcEjyFzPn
	1CEtWLMgqyf5QcnwSp/pMlbeA/Ldz+SS+DclVI2tikLDQW8c8pYDrGq6+u5IY1pMuefaBhoR0gVeH
	OvRQGCvA==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWD0k-00006g-14; Mon, 30 Jun 2025 13:49:22 +0200
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
 Re: [PATCH 2/4] Input: adc-keys - support types that aren't just keyboard
 keys
Date: Mon, 30 Jun 2025 13:49:21 +0200
Message-ID: <10163666.lvqk35OSZv@diego>
In-Reply-To: <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
References:
 <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
 <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 30. Juni 2025, 12:19:25 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Nicolas Frattaroli:
> Instead of doing something like what gpio-keys is doing, adc-keys
> hardcodes that all keycodes must be of type EV_KEY.
>=20
> This limits the usefulness of adc-keys, and overcomplicates the code
> with manual bit-setting logic.
>=20
> Instead, refactor the code to read the linux,input-type fwnode property,
> and get rid of the custom bit setting logic, replacing it with
> input_set_capability instead. input_report_key is replaced with
> input_event, which allows us to explicitly pass the type.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/input/keyboard/adc-keys.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/a=
dc-keys.c
> index f1753207429db02ce6510e5ec0da9b24d9edb61d..339dd4d4a0842108da2c6136b=
1e0098cd1f6a3cd 100644
> --- a/drivers/input/keyboard/adc-keys.c
> +++ b/drivers/input/keyboard/adc-keys.c
> @@ -19,12 +19,14 @@
>  struct adc_keys_button {
>  	u32 voltage;
>  	u32 keycode;

nit: consistency ... the above is still "keycode"
Naming things "code" like in gpio-keys might make sense maybe?
Though I guess, it could also just be needless churn

> +	u32 type;
>  };
> =20
>  struct adc_keys_state {
>  	struct iio_channel *channel;
>  	u32 num_keys;
>  	u32 last_key;

^^ same

I'v checked that the function transistions=20
=2D __set_bit -> input_set_capability
=2D input_report_key -> input_event

do the right thing,

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




