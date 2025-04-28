Return-Path: <linux-input+bounces-12026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C46A9EA2A
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 09:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C7D17281B
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 07:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4491FF60A;
	Mon, 28 Apr 2025 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="byZsJvGo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B9217705;
	Mon, 28 Apr 2025 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827151; cv=none; b=DpfYXkZ5MhllZaAh2OXPKKzBb+Nbw/nCfeSIyD+4RF6EXcJ7cqEPt++WM9CzE8KEQWSx1TJPxloC1cmKppJ7/GwEIxDo/gwAcuRXyWX0tRrVPZCoO27NzmmTFWC7b2w3Rxbs+RWya8lPx7zw/TJaZRBd9jOdR/AoAPz0z9/JvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827151; c=relaxed/simple;
	bh=wA6ahPk4szqKzyC+sa01TjwXULKmxRg4WeknGa7qdoc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/V550k2QLoWv3odRCZu0pnVP1ge4EFk5JsZ+RPt1VNOk//fL9+NCJCsZ6hKOP8H0lhlL+KjjOLHdOvv346zFjvjriemIZGyEpjZ3aRbs7kNxGmgokg5VsRAkyk+VzqlKlM5pAohpntvHCaCk9aSBAWC87Wm87tCJfTQ0M5AmYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=byZsJvGo; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745827139; x=1746086339;
	bh=wA6ahPk4szqKzyC+sa01TjwXULKmxRg4WeknGa7qdoc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=byZsJvGooee6n7sh549WjjFkjB0dR1YoTRFo3AMKg9fBxv6c4FuQiemzSPLwPfXeC
	 Tz7WLgbAantBi9SikXFyutRMZ8rf7mR7HEXGH04bRXJrxO6n0zZBJfNCTPPWkikx+f
	 UvXZ4f45yUa+0ZHsa90/CHKFUjzNcmms3tUr0Wv35TFue7+zdudSqMzNhiStMi2nOQ
	 wrzKibk/9fJTiIxqRS5hnyErrLnWGq5Ar3+oJsCKSll6zvwEDpPInpql7J3mYJSAzV
	 AEIN1Igd3TxuqrsCxySGt5prg6whKeuY5KYDnbnuwcHMZldO0gBNzk1MizSRDdIQI7
	 BxYKnFoGZ7MeA==
Date: Mon, 28 Apr 2025 07:58:55 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esben Haabendal <esben@geanix.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: goodix: Add no-reset-pull-up property
Message-ID: <zkDFUv9azjyXaS--ufxgROyruM2mpckWkDNeHtAO160rM2DuaJthpjgN0c_L8QgTk8bNA7Km0UewYmp1rWENwg2x4ngP-8C1rYhHMgAz0OA=@geanix.com>
In-Reply-To: <20250428-logical-successful-spoonbill-cd1c6b@kuoka>
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com> <20250422-goodix-no-reset-pull-up-v1-1-3983bb65a1bf@geanix.com> <20250428-logical-successful-spoonbill-cd1c6b@kuoka>
Feedback-ID: 133791852:user:proton
X-Pm-Message-ID: fee9c2fe55124a7c5e2924d54c65cb54462b24fe
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 28th, 2025 at 09:48, Krzysztof Kozlowski <krzk@kernel.org>=
 wrote:
> On Tue, Apr 22, 2025 at 05:15:02PM GMT, Esben Haabendal wrote:
>=20
> > This should be added for boards where there is no pull-up on the reset =
pin,
> > as the driver will otherwise switch the reset signal to high-impedance =
to
> > save power, which obviously not safe without pull-up.
> >=20
> > Signed-off-by: Esben Haabendal esben@geanix.com
> > ---
> > Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 +++=
+
> > 1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix=
.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..7e5c4b98f2cb1ef61798252=
ea5c573068a46d4aa 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > @@ -45,6 +45,10 @@ properties:
> > reset-gpios:
> > maxItems: 1
> >=20
> > + no-reset-pull-up:
>=20
> Is this common property? Where is it defined? Otherwise missing vendor
> prefix.

Good question. When is something a common property?

The idea of marking something as not having a pull-up on the reset pin coul=
d be considered a common thing I guess.
But for now, I am defining it for the goodix driver only, as I am only awar=
e of these devices needing to handle it in a special way.

Should I rename it to goodix,no-reset-pull-up?

/Esben

