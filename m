Return-Path: <linux-input+bounces-3507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE18BD63C
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 22:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B4E71C20FCC
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 20:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551A115B10A;
	Mon,  6 May 2024 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="WtNzAqqq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271D156C6E;
	Mon,  6 May 2024 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715027367; cv=none; b=lxHrBLqi4h2P5EbwQ8ai2raFT55jePDvweTGm0XngS2jCcczlnQaWhgwhlIR70fQutUmY9xjVMxlmCxtVJvow+wEOANOBHpgOZMv7fAjfRA8xyYFB8Eb/ycUTUXLGgLNIsjbSTF3RvsDdcPQTaW64Dh/fCb9Cr2UMXD7xm2bjZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715027367; c=relaxed/simple;
	bh=3rbdAlqqENUwmR+io8pbVt6gM09Tl1lcecSkcWkx2hw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uIbCAWrKi81tSJDEWu/moKZ7wn6FOsZF56fhw0wsmZj4WRgU0mDO5tvCY5k95obRUcA7NIgzCjWl1R3UaiK07VSBZu4qvI2sQM7Er5Ts29mh8PC+cQ+Lj7hSs5vRdIfzbLQNuS1HS/280TT0uz5O7s1vfn3UC5i66QJmSR+NP4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=WtNzAqqq; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s44xc-005rj3-0J;
	Mon, 06 May 2024 22:29:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EaZQSwVaLQHyh6ZFOpYXBHwPWumE2yzYKX72jIZHUEs=; b=WtNzAqqqMqocI2uasC4mZFzXuE
	cMkzbOei+SwbulkgG7IWfBh0XH6ByUW7gsPI50qnjRCMn5Nn3R6/ULIWlMXR01qoS2Lpr1zeb5IZ8
	/7N/ZZcrgJtFM+86s8+pFuL5+L3Vp6cdU565qY3u/jpGOZV/aHkBjN857u6nIR4wc/P8N/96nly9d
	hTCdQ4CffeybHfMxKPns7l7F34r3CUdlUBS8o3Q+DEJS6tVMlEGU+bXSQmPyNr+r3eRqdNWBfnv0m
	BXiZH3LqlPi4vs9j/x3/LoayTwPHktho0aCRzg3/zRPqvhkC/v9XobXUhUvuJS9ONw+xUAWT1KqWM
	lUnkQs7w==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s44xZ-000ffm-0c;
	Mon, 06 May 2024 22:29:18 +0200
Date: Mon, 6 May 2024 22:29:16 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, u.kleine-koenig@pengutronix.de, hdegoede@redhat.com,
 siebren.vroegindeweij@hotmail.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Input: ektf2127 - add ektf2232 support
Message-ID: <20240506222916.055443d8@aktux>
In-Reply-To: <CAHp75VchLWQgmdxKPSbwH-m43zFHT9ADk4aH7-jvD5-MaVOtEw@mail.gmail.com>
References: <20240505214754.891700-1-andreas@kemnade.info>
	<20240505214754.891700-4-andreas@kemnade.info>
	<CAHp75Vdnwrxw96prr9hyLdZ2u6t1uNcj6pyxCp52UoVOpatTpg@mail.gmail.com>
	<20240506182111.3c6673a0@aktux>
	<CAHp75VchLWQgmdxKPSbwH-m43zFHT9ADk4aH7-jvD5-MaVOtEw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 6 May 2024 21:43:14 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, May 6, 2024 at 7:21=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
> > On Mon, 6 May 2024 15:05:52 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote: =20
> > > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > To: Andreas Kemnade <andreas@kemnade.info>
> > > Date: Mon, 6 May 2024 15:05:52 +0300
> > > On Mon, May 6, 2024 at 12:48=E2=80=AFAM Andreas Kemnade <andreas@kemn=
ade.info> wrote: =20
>=20
> ...
>=20
> > > I'm wondering if you are using --histogram diff algo when preparing t=
he patches. =20
> >
> > No, I am not using that, it seems to not make that chunk nicer.
> > Yes, we want
> >
> > +       int status_shift;
> >  };
> > +
> > +struct ektf2127_i2c_chip_data {
> > +       int status_shift;
> > +};
> >
> > But that is not shorter or simpler, just more readable. =20
>=20
> And that's exactly what histogram is about. I suggest making it
> default for the Linux kernel project (or globally in your
> ~/.gitconfig).
>=20
>=20
again, it does not do anything helpful in this case, I tried to run
git format-patch --histogram with
no improvements. But it might help in other places.

Regards,
Andreas


