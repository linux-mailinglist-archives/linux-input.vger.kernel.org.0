Return-Path: <linux-input+bounces-12304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5DAB4387
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 20:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A0F17178A
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 18:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B32296FD8;
	Mon, 12 May 2025 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="lhbdj03o"
X-Original-To: linux-input@vger.kernel.org
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDC297103
	for <linux-input@vger.kernel.org>; Mon, 12 May 2025 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.15.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074531; cv=none; b=l9N83X2HeVxBqpoDaeuoBhhO/xSgpT5sNJX+U1R1WzkAmnG71EemO25BmlR8HNxEl0hRB4NlldEIOJZECY74WRmoeZ4p81lHDAv9Xr3C+kWgNIiHt9U8NZmHHw6mwdFdtlis1Qu7gJSXiCDuq9HZ+uYvOTQfMClMyGk56W18jQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074531; c=relaxed/simple;
	bh=9a1at459X5jcdOQLwpRUWYHuDf5HLqFuA5wnNdePLic=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R0RU+KsmhVE5ggQD9cfU6JMiPaCBz6AmNTxoMeFt9xjZ0OCfkiYO6AwN8IM/OSjfB3Jfvtr+v/ElOia/3E0R6TVQhaGU+byC2XNGN6Scta6mfrruv6rTQiaNIHzbG0L/gcCEA6jnwY2XEU+fuLKiSZUx64D83cVbcr+qXwJyBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=lhbdj03o; arc=none smtp.client-ip=37.205.15.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 7588722299F;
	Mon, 12 May 2025 20:28:40 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1747074520; bh=QvEgR6FD2mVvexmKPe4QrYlGFYaTnNvF26cZlqPimj0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lhbdj03o47HNrdUj8MmIKTJqSiJ11AAqImyyZpubfwn8QmaUIC8JBREoJ44rqTnUz
	 tISltKqhtbg7M7zxPWlNd2koakzwwpAB5nGSptvaqjLMpsXwyGa0JB+x4UJHkU4AWB
	 /XF9l882F3Q3OpvOgRnmfoe6MCoZbf7Qcg121N8YjdqIOvUru2SH2vJoZ3Xd1lrOPh
	 nCLE9hWQ8n6glKqVNcu2KdF5FVz0VMsh4eJC5BA6G3ClVrVsqd10MV4G9Cqf66GZ5s
	 qkfSjR+J0y0X95D0aPtFRvh6OhFU7ZLH4UXUh4IF3DWFdeQmGE0J65/fbzx/rDom64
	 T2MCu3hE3VPDQ==
Date: Mon, 12 May 2025 20:28:39 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Subject: Re: Use after free in dispatch_hid_bpf_output_report()
Message-ID: <20250512202839.2624b0ec@meshulam.tesarici.cz>
In-Reply-To: <ce3urcvcm6b5yv42tbopq65ojbv6upprkvqimn5cooo2nhcbdl@mzh4elx2rexx>
References: <20250509113905.34947e78@meshulam.tesarici.cz>
	<ce3urcvcm6b5yv42tbopq65ojbv6upprkvqimn5cooo2nhcbdl@mzh4elx2rexx>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 May 2025 16:47:12 +0200
Benjamin Tissoires <bentiss@kernel.org> wrote:

> Hi Petr,
>=20
>=20
> On May 09 2025, Petr Tesa=C5=99=C3=ADk wrote:
> > Hi all,
> >=20
> > after installing v6.15-rc5 on my laptop, I'm running into an invalid
> > pointer dereference in dispatch_hid_bpf_output_report() on suspend. I
> > added some debugging messages (see patch below), and I can see this
> > sequence of events:
> >=20
> > [ 1568.571776] [   T7420] PM: suspend entry (deep)
> > [ 1568.602245] [   T7420] Filesystems sync: 0.030 seconds
> > [ 1568.613183] [   T1704] hid-generic 0005:04F2:182A.0004: CLEANED UP s=
rcu 00000000b7570e01
> > [ 1568.613348] [    T724] hid-generic 0005:04F2:182A.0004: UAF srcu 000=
00000b7570e01
> > [ 1568.616215] [   T7420] Freezing user space processes
> >=20
> > The HID device is a Bluetooth keyboard (using bluez 5.79), which
> > (presumably) gets disconnected on suspend.
> >=20
> > FTR I didn't encounter any such issues with v6.14. =20
>=20
> Thanks for the patch. I already cc-ed you to the other debugging
> thread[0], because I am slightly in favor of the other approach, based
> on ->destroyed. Also that other patch prevents the race in other hooks.

Oh, sure thing. My patch was not intended as a fix, rather as a way to
debug the issue, and I included it only for reference.

Thank you for your quick fix!

Petr T

