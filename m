Return-Path: <linux-input+bounces-14322-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D3B366CD
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 16:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D3CA1C23BF7
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 13:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52FE350D52;
	Tue, 26 Aug 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p6zckXJe"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33EA34166C;
	Tue, 26 Aug 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216290; cv=none; b=LXhzanXhRLOi1RRSVr+GhS9r8HP8ANbFqjOz7xCIcy0al8RShnl3vaKVjsc/dKoizXqt1l9VeKnP6kqe/IT7MKEjwK5kSbNlbBUJFBp8NlflyOVbYWgyzcfHHYN/O9hb7v6iIJZ9AsGor28P/cx2kisRGrCNdw9pU9QKsSiX8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216290; c=relaxed/simple;
	bh=Bn1Ty2oKRyCYeEeV05qgM4L3O4H99orO+wAZwsaw9aQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lVGbvlf3TG5LDXRzIsZKGknt581vySJJaGr63RAYFhgGzD3i/i7ygHpq9bF0By+grAE8aG/KnpG99fv+3vKXxt5fY0Ya5CZmzRY0W/csFbjOcCv/4Yilmm+0resw7QJ3LCucUj38+eK1QqAooEmNwD/Ui9VwZJ9oiC2vlb6iiRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p6zckXJe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216286;
	bh=Bn1Ty2oKRyCYeEeV05qgM4L3O4H99orO+wAZwsaw9aQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=p6zckXJeDzd31hPqH/Wt8scivMFgELrZ+U2bWHCqgoyw4+klQqcu7t9dlQV1AXcNk
	 MezT5TwlaqDVIU2FsoIL6aYZ4EiA4C6FGvxTE40So+A6P+5WJimoR3doV5S4CMAjGr
	 hms5mRT4RbeBhewbCDFodJiLITGiVb25xIJKesUfM7FRmekg8HS9Dw6hNFmmtmQQm0
	 Nsvo7tQ7QVQDRZPdOGkn/cmFPnTnRp0pEyUn9cDZkGSWrJ+M5ivAuXxbBndTTwtQMm
	 IrxvRudntCdpISOfHLxr+bPf9tAscCVBH730+JTa2yLxvHZA8oX5kyNT95w/qFpw8+
	 26+7t41exZI4w==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600c8F85cF092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 138DD17E046C;
	Tue, 26 Aug 2025 15:51:26 +0200 (CEST)
Message-ID: <e40f60820ad1a13b2981c65a55babd845349a751.camel@collabora.com>
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
From: Julien Massot <julien.massot@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Date: Tue, 26 Aug 2025 15:51:25 +0200
In-Reply-To: <akavphbw2wh5vga3eoe6abqdawdssko4cy2sz7oedef4jvzunn@37whg62gmfoh>
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
	 <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
	 <a9cd33f5-cc37-4a1d-b1fd-094761a146ed@collabora.com>
	 <akavphbw2wh5vga3eoe6abqdawdssko4cy2sz7oedef4jvzunn@37whg62gmfoh>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dmitry

On Wed, 2025-08-06 at 09:49 -0700, Dmitry Torokhov wrote:
> On Mon, Aug 04, 2025 at 10:05:21AM +0200, AngeloGioacchino Del Regno
> wrote:
> > Il 01/08/25 15:16, Julien Massot ha scritto:
> > > A recent commit in linux-next added support for key events.
> > > However, the key release event is not properly handled: only key
> > > press events
> > > are generated, leaving key states stuck in "pressed".
> > >=20
> > > This patch ensures that both key press and key release events are
> > > properly
> > > emitted by handling the release logic correctly.
> > >=20
> > > Note: the code was introduced in linux-next by commit
> > > bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC
> > > keys")
> > > and is not yet present in mainline.
> > >=20
> > > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> >=20
> > Well, you are effectively fixing the commit that you pointed out, so
> > this needs
> >=20
> > Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359
> > PMIC keys")
> >=20
> > and
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
>=20
> I am really interested in how exactly this was developed, tested, and
> reviewed...
>=20
> Thanks.

You are right, the issue comes from my side.
I prepared the patch against a slightly different tree, which led to the
discrepancy. I=E2=80=99ll respin it on top of the current linux-next and re=
-test
it properly to ensure the fix behaves as expected.

Thanks for catching this, and thanks for your time.
Julien

