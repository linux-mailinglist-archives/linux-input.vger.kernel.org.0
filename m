Return-Path: <linux-input+bounces-17071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B08FED1B936
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 23:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5A48302F2F4
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 22:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7034E3559E1;
	Tue, 13 Jan 2026 22:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=szczurek.yt header.i=szczurek@szczurek.yt header.b="brXBe4/i"
X-Original-To: linux-input@vger.kernel.org
Received: from sender-of-o53.zoho.eu (sender-of-o53.zoho.eu [136.143.169.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8BF350D49
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 22:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342890; cv=pass; b=RncSOK8ZEYNGv9cD7yN2jdEggANSLMIIbjSj1gj9Pg3t+aWQv6hTqYdMpQ4BVNcJUUHWyhM9HGWzV7zlOxAePostIAvwkI+KzZLaZrEuHVKv9bssXxX4AoN3unfk7/f0/cn8CENJt2un/Sz4wMX8j9bo5lSIE/Ak08D9JtHhVv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342890; c=relaxed/simple;
	bh=nI27uuCm0XzivezOpxbJIHywUyoGwWkR45ngMp9q1Bg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FffhC02aYdXACFDEu4leEwoXc+UICgK3mifiZ667usxPTdlBRSCe9JZK+P4Q0ZQaJes8yfA0r1M/7PgKm3kxs1D3kebpj+/6v2+i7dP3Kq8fjmMC+On1c/3e6bQtF0+8HZ66xK+Y5d8YpyuEBrZBNjN7FCp2hIh+iNuSrq+7ia4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=szczurek.yt; spf=pass smtp.mailfrom=szczurek.yt; dkim=pass (2048-bit key) header.d=szczurek.yt header.i=szczurek@szczurek.yt header.b=brXBe4/i; arc=pass smtp.client-ip=136.143.169.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=szczurek.yt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szczurek.yt
ARC-Seal: i=1; a=rsa-sha256; t=1768342863; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=JcJpcQpuBm5TZ+WW9ULjuWb0buKfzHTXWxSgIN3gdTaMtJKFD55DI4YVBSxEk52xVKyGxixJ3tFOqwpAbbaFcsIIsrkw17+MbN3+Y8tnqbEy1N5Rbinhco1jVeRh7EXuPp9cMMQmUXNkKJNO+yoreLrwATaJ4OQNufunywLGKQk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1768342863; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6t0XRyLt6y4Y7XbjooZD3bqn9xJkWxhySXVzC3fK/0E=; 
	b=aHZsqlrgU1vx3kl6DbL6lM0trKwthPmrxQCzSE6qicfBzpGYHBZEiaMXenH2KQuPfrqPEj6aHyX3i+n+JeYkDNQXcZmmjzevoDbMr9QqhG7U/ok8CprhnDXQFCQTyXUnIUeZTGbcsK14V7LL1XK6zxLIWykrVBr8QXGf9BY6m0U=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=szczurek.yt;
	spf=pass  smtp.mailfrom=szczurek@szczurek.yt;
	dmarc=pass header.from=<szczurek@szczurek.yt>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768342863;
	s=zoho; d=szczurek.yt; i=szczurek@szczurek.yt;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6t0XRyLt6y4Y7XbjooZD3bqn9xJkWxhySXVzC3fK/0E=;
	b=brXBe4/iRB2SrWoAX7REoZZob5gc4foBfGwluVQ8fyk0XijzZdoDBe0QVqrMzINU
	cTeOkw1/vu1m1tGw8FYWjPhJS/oAed991/Pj5INQ43EJhBAibmrRHcSGaQRI8iTLP3K
	0U+9ylqk9rLTfancw7awdEDjTThQFgCY6xICUbATO62N3UwOM6JdqngFkH0DTV6m2GK
	CyhhQ+9AZdy4q2t2iFMZeGrloqxJn9OiwT1ZdE5R8QN1pql9SuAyjSYrFWC3w8UtTCL
	vsTCmuUAf75fiwEQXSx2vtSFK3F9tRtd3/j0M227lgMp87YNqMe0lTQw6fhLcqqd5xN
	N3h1H4FzQg==
Received: from mail.zoho.eu by mx.zoho.eu
	with SMTP id 1768342862318952.1865680945543; Tue, 13 Jan 2026 23:21:02 +0100 (CET)
Date: Tue, 13 Jan 2026 23:21:02 +0100
From: Szczurek <szczurek@szczurek.yt>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "yedaya.ka" <yedaya.ka@gmail.com>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konradybcio@kernel.org>,
	"linux-input" <linux-input@vger.kernel.org>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm" <linux-arm-msm@vger.kernel.org>
Message-ID: <19bb972b9d3.12a7d3da3105717.8521466650832407846@szczurek.yt>
In-Reply-To: <o4eu2db3y3wrxaxtxcbxupdc2tzemqvb4fupwfkjfjqmy5qudd@v4umeav2oib2>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
 <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com> <o4eu2db3y3wrxaxtxcbxupdc2tzemqvb4fupwfkjfjqmy5qudd@v4umeav2oib2>
Subject: Re: [PATCH 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

On Tue, Jan 13, 2026 at 20:28:27 +0100 Dmitry Baryshkov <dmitry.baryshkov@o=
ss.qualcomm.com> wrote:

>On Tue, Jan 13, 2026 at 09:12:36PM +0200, Yedaya Katsman via B4 Relay wrot=
e:=20
> From: Yedaya Katsman <yedaya.ka@gmail.com>=20
>=20
> The driver also works with FT3518, which supports up to 10 touch points.=
=20
>  Add compatible data for it.=20
>=20
> Co-developed-by: SzczurekYT <szczurek@szczurek.yt>=20
> Signed-off-by: SzczurekYT <szczurek@szczurek.yt>=20
=20
>This doesn't look like a name.

Hello
Yes, it isn't a real name.
Yedaya Katsman is upstreaming those patches by me, under my permission,
and I forgot to tell him my name, so he took it from gitlab, which is just =
a nickname.
All of "SzczurekYT <szczurek@szczurek.yt>" should be replaced with "Kamil G=
o=C5=82da <kamil.golda@protonmail.com>",
this is my name and the e-mail I would like this to be under.
Excuse me for the chaos.
=20
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>=20
> ---=20
>  drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++=20
>  1 file changed, 6 insertions(+)=20
>=20
=20
>--=20
>With best wishes=20
>Dmitry

Regards
Kamil Go=C5=82da



