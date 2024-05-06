Return-Path: <linux-input+bounces-3494-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCFA8BD284
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 18:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5B23286DEE
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 16:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C67315665A;
	Mon,  6 May 2024 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="kM6o8b6A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8609B156643;
	Mon,  6 May 2024 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012485; cv=none; b=YZIYJ+WriINgASWr6Ho90dviPcx1bHey4vrKv6DqC0LwZQtneaPK5ml+5MgeIeDLD3VL6HT/L8o/hOveT36C/FzRssTyZwFlyfsSibBnZLrbwClyUNPoDax8qqV+1OXohOcBEXXaMoKp3j3nfMBzEBRw7V3t894bFu/aHQT3PpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012485; c=relaxed/simple;
	bh=S+05yN7aSpGFcjCkM4+0Eh53OJcAEkTC9skzEhS11Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCeq9VDzJc80+wjfNKOq49XnIp5QnlK1SMlLl4KUnrc5sA+wV8+xVCh5bwdZxJztcUOKT33HdwZQ+7JVMomTjWyMk/6jhztdvMDK82GzEukEoejVgD2khWqyyBlxSofl6FJ0JdtneNW2XYCkYBOofeWxKhE2H+ceF4pse/xTn2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=kM6o8b6A; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s415U-005r1u-1A;
	Mon, 06 May 2024 18:21:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=12Vs5N0og4kk0yUGrgVqQQHG2X9PlApHfJ7FKvy0nt0=; b=kM6o8b6AMTsnRlimzGo1bBfSSz
	oECtjQsNi/Fg+URwWCIMCLCYAxbbkiTq1YJ4CKOco/tqRwfnNfHMmWsnSOchPu6U5+QFMModu05Ap
	fiq6iNtsyotEQbqwU3PVy+PQztFHFL/6fGYmMsCLgeevBqq+9Zr4HhevilCkgq3MPNrKJZMjYwwMy
	sNW2fxt1bnbTjaPBJgOSJq3ZWXUC3/89HiJs5uzJjv7P9PQ0S28NH0NxrstY9VZBE49PKxYSHdw1x
	gB7WsLLbkSDnB5ZMliulxxqQKx8qVUlVHtMLYXjejGBc6Vt3DbfmyBQhm+U4olfx6iIZy9EX9KAPT
	Or+qzsrA==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s415T-000fIM-2B;
	Mon, 06 May 2024 18:21:12 +0200
Date: Mon, 6 May 2024 18:21:11 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, u.kleine-koenig@pengutronix.de, hdegoede@redhat.com,
 siebren.vroegindeweij@hotmail.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Input: ektf2127 - add ektf2232 support
Message-ID: <20240506182111.3c6673a0@aktux>
In-Reply-To: <CAHp75Vdnwrxw96prr9hyLdZ2u6t1uNcj6pyxCp52UoVOpatTpg@mail.gmail.com>
References: <20240505214754.891700-1-andreas@kemnade.info>
	<20240505214754.891700-4-andreas@kemnade.info>
	<CAHp75Vdnwrxw96prr9hyLdZ2u6t1uNcj6pyxCp52UoVOpatTpg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 6 May 2024 15:05:52 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> To: Andreas Kemnade <andreas@kemnade.info>
> Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,   con=
or+dt@kernel.org, u.kleine-koenig@pengutronix.de, hdegoede@redhat.com,   si=
ebren.vroegindeweij@hotmail.com, linux-input@vger.kernel.org,   devicetree@=
vger.kernel.org, linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2 3/3] Input: ektf2127 - add ektf2232 support
> Date: Mon, 6 May 2024 15:05:52 +0300
>=20
> On Mon, May 6, 2024 at 12:48=E2=80=AFAM Andreas Kemnade <andreas@kemnade.=
info> wrote:
> >
> > The chip is similar, but has status bits at different positions,
> > so use the correct bits. =20
>=20
> ...
>=20
> > @@ -46,6 +47,11 @@ struct ektf2127_ts {
> >         struct input_dev *input;
> >         struct gpio_desc *power_gpios;
> >         struct touchscreen_properties prop;
> > +       int status_shift;
> > +};
> > +
> > +struct ektf2127_i2c_chip_data {
> > +       int status_shift;
> >  };
> >
> >  static void ektf2127_parse_coordinates(const u8 *buf, unsigned int tou=
ch_count, =20
>=20
> I'm wondering if you are using --histogram diff algo when preparing the p=
atches.

No, I am not using that, it seems to not make that chunk nicer.=20
Yes, we want

+       int status_shift;
 };
+
+struct ektf2127_i2c_chip_data {
+       int status_shift;
+};

But that is not shorter or simpler, just more readable.

Regards,
Andreas

