Return-Path: <linux-input+bounces-5414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E994B5E7
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 06:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A5461F22D59
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 04:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250AA811E2;
	Thu,  8 Aug 2024 04:29:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D89479;
	Thu,  8 Aug 2024 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723091354; cv=none; b=Tyeegthvwliy6ah48qWlYF/k+Ny8cBsMth2/L1fcTOpNaEyITqREmnDjAchfL+esxzq18ya6W/OLa3J4pU8Dbkfe48BnoHtkYEbDufBP261Oz+F/qYJIHKNpDqc0xFaVm+B95uGhvlHW3csy45uzwYRNCHVPm7GLi7n37YbY9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723091354; c=relaxed/simple;
	bh=VZnbU1tr7vApzjtodZLzpnObpxoYTlBfeyJBNiFxUOs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NVyQWHWEvwl7mo90UAL7+rjYBxP4O08PSitS/M7HmN4L5W9kBu5arYz/k2D+gH05CeoPvUMQTVA0PXAOI/DSINPuPtDr+Ksy+gkfIY321iMiibKBpj/XLa4RpKG3DIuVO4O3+xk5+qLOWVD+IlQUmt2F4Nq5gstzgkAy8P6/ORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 1521E1206A4;
	Thu,  8 Aug 2024 04:04:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id B6AA920027;
	Thu,  8 Aug 2024 04:04:23 +0000 (UTC)
Message-ID: <f537155e5a296fea11920cdf2de67a105dcc8e7b.camel@perches.com>
Subject: Re: [PATCH 0/2] HID: samsung: Object code size reduction and
 neatening
From: Joe Perches <joe@perches.com>
To: linux-input@vger.kernel.org
Cc: Sandeep C S <sandeep.cs@samsung.com>, Junwan Cho
 <junwan.cho@samsung.com>,  Jitender Sajwan <jitender.s21@samsung.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org
Date: Wed, 07 Aug 2024 21:04:22 -0700
In-Reply-To: <0cfbea8be50a1f3da6ab748d463fe29d1e515cb8.camel@perches.com>
References: <cover.1706732238.git.joe@perches.com>
	 <deebac6b6d06a6cd49ac09606a07576b84e35894.camel@perches.com>
	 <0cfbea8be50a1f3da6ab748d463fe29d1e515cb8.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: B6AA920027
X-Rspamd-Server: rspamout07
X-Stat-Signature: 8984qa468ogmmx8z7o67c164xma73u9b
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+zoEoKGBV00oAYPKiXO8xc1zBHws4Xc0Q=
X-HE-Tag: 1723089863-728521
X-HE-Meta: U2FsdGVkX19LZ6xPNhzyJNhPbW2rQ3hnngp8E+XC1jwk5IFXuZs7d5DolJngpLCR8rQaTwpczN+Y1E7aqqLiiu8wenVij0cuqU1KjSntF/5Fy3U8XJLFm1QqONd7/RzTGE9HOkPJGTNtEPLnQAcaUjm6o2Y8XMksyduEBVnJNevx/gIWD0ofnsBmgt5e1OwtdbO9O66X+1EUEEGFKYIPoif7x1kxvjMsPqjPVfCbFe1JfxxHjrSQ1fB0VV5SXI45fWI5RA6flANBMzH0yd6COg1RW/X5u1SD1RlkjB6Y0s3zMzYsfNcULyMt0ZhL0053

On Fri, 2024-03-08 at 23:02 -0800, Joe Perches wrote:
> On Mon, 2024-02-12 at 10:09 -0800, Joe Perches wrote:
> > On Wed, 2024-01-31 at 12:21 -0800, Joe Perches wrote:
> > > Reduce object size and neatening
> > >=20
> > > Joe Perches (2):
> > >   HID: samsung: Reduce code size
> > >   HID: samsung: Object size reduction and neatening
> > >=20
> > >  drivers/hid/hid-samsung.c | 652 +++++++++++++++++-------------------=
--
> > >  1 file changed, 283 insertions(+), 369 deletions(-)
> >=20
> > Any comment from the samsung folk on these?
>=20
> Ping?

Are samsung folk actually looking at patches?


