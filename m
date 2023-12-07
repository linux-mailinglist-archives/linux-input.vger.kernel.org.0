Return-Path: <linux-input+bounces-598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E122F808B5B
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 16:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CB5E1C20B80
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 15:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545B144387;
	Thu,  7 Dec 2023 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DbZpTd+R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CCED5B
	for <linux-input@vger.kernel.org>; Thu,  7 Dec 2023 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701961476; x=1702220676;
	bh=NYodcFpX/b1E1VWmahb0cxH1HMeWexFPLm+/MO5VZa0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DbZpTd+RCw007BN+kHHXkzxf1r7t3UmejqtgjZsqAFR6syJ5YlSWm1y+o5lM0FC7M
	 /MpM8ne4aOhcZksrQjz3k801fEe7NjGlbkcIv225Qwxs+PD5PTPH4sLgtP9LhJQqgZ
	 dz3pYMZoL5wIVfA175KG/ebiBkow+WA9w8dkaB5ZCJ9mnfpcrvEYY+v6woHeuWlCl3
	 FuMOjhd4ynAn9CMIA2YbQG9Qx3BnmEwnjUzn95MFtTi6VOywOOkQR8T2DB0uMxLE+m
	 a9fAl/xGO8IJnRPm2mZN1BcCSlaXt5KHYyKMtv5jMHh/JD2ku4z7Z35NZ45CEBUsW5
	 zf7FNVnTbTYWQ==
Date: Thu, 07 Dec 2023 15:04:19 +0000
To: Jiri Kosina <jikos@kernel.org>, Linux regressions mailing list <regressions@lists.linux.dev>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Input Devices <linux-input@vger.kernel.org>, =?utf-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, LinuxCat <masch77.linuxcat@gmail.com>, Marcelo <mmbossoni@gmail.com>, Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Message-ID: <1358c8e3-8495-461c-a8d8-a551cc4a0d11@protonmail.com>
In-Reply-To: <nycvar.YFH.7.76.2311211458030.29220@cbobk.fhfr.pm>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com> <ZVyr-of1X4RudpWG@archie.me> <0e10112a-7560-4dd8-8a03-5fdfc838168f@leemhuis.info> <nycvar.YFH.7.76.2311211458030.29220@cbobk.fhfr.pm>
Feedback-ID: 20039310:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-21 16:00, Jiri Kosina wrote:> A comment from Mavroudis just=20
appeared in
>=20
> =09https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
>=20
> pointing out that indeed the report descriptor of the device he is workin=
g
> on is different than the ones from the reporter.
>=20
> Until this mess gets figured out, I am now pretty sure revert is the way
> to go for 6.7.
>=20
> --
> Jiri Kosina
> SUSE Labs
>=20

Greetings everyone,

I have recently made a new patch [0] aimed at addressing the issues that=20
have been identified.

I would appreciate it if you could test it and provide any feedback on it.


[0] https://bugzilla.kernel.org/show_bug.cgi?id=3D218172#c14


