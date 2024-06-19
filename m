Return-Path: <linux-input+bounces-4471-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDB90F085
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 16:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50F2828148C
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 14:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94EF18633;
	Wed, 19 Jun 2024 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWg//M8m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4211C92;
	Wed, 19 Jun 2024 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718807419; cv=none; b=he5GdUkcdRBE/oyGsGRWOgTOYVyaJAyiCxAE5SziggKMFY4XHkNwxDOGO1ugYN3ATUs3RhRbAYcW9DlMn7UpE6LWEuLn8p5Y2u0gJOBN8OUDAqLTAOaXEncg6zuk2U1GjFQh5ZhoKyCvBmhj26HDxUwLf2K1aTrcnT3eOX1gWgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718807419; c=relaxed/simple;
	bh=a+0NUSOGSVlxhEfU3lz45PcWwVXQlzZmLfRtSbbmWZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SXr1QN5nC+yJFbM0pbcGJmlWo2o/qh5ADFEUWzrAj8Dac33GA3oCyoc2lU0zWGQ33oYvRXWjWYW5rrbXrqEur9BgT2JQlDZW0r7JPq6jvoImLqWnZz36ARnjZq7DdIolEkJdFCorXilSON+9kerg0PlwDrPX0wwpMWPmLdsu6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWg//M8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E70C32786;
	Wed, 19 Jun 2024 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807419;
	bh=a+0NUSOGSVlxhEfU3lz45PcWwVXQlzZmLfRtSbbmWZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rWg//M8mvyOGSlChHhoMWSUzTOuqfyZqNE8vAkOa1hgBg5hoCt8B8z8snThzhm8Xf
	 S7ci4GMHUQLS2CNwURTFtrHz9D985FxVPt7SGZp83OOkXdi9Y8EZ/P1ogUoMBUrTpt
	 0lpVvVryv7lkYWiym6TF+2SbafCrYlOIyVTtKXNpOQA4ey3H4ui6UJzvQYciNqDF/7
	 Xf8XABYfJg6/T3G+AY+O+3AqeIcUzhCXLW2QTFAcLphn25FlWKOr8aCKKfdDaVPUSB
	 J8ezQfbDoYlKCrs5yWHNX5jFSpKVEGsRm936wkLEeDfbT/EBLWZyyc50qUgsn1ma9o
	 S6PAbz2e41Yig==
Date: Wed, 19 Jun 2024 16:30:15 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Rahul Rameshbabu <rrameshbabu@nvidia.com>, 
    Fabio Baltieri <fabiobaltieri@chromium.org>, 
    Ivan Gorinov <linux-kernel@altimeter.info>, 
    Johannes Roith <johannes@gnu-linux.rocks>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: avoid linking common code into multiple
 modules
In-Reply-To: <ZmxuWKX9lFv3pHqG@fedora>
Message-ID: <nycvar.YFH.7.76.2406191629010.24940@cbobk.fhfr.pm>
References: <20240529094816.1859073-1-arnd@kernel.org> <ZmSi5_-4mD4AaIJW@fedora> <54c19328-35e2-4506-aa3a-a0b08813d873@app.fastmail.com> <Zmcwlt6Kfpt09tKi@fedora> <8d93cdd6-379b-48e7-8a10-9df190b12623@app.fastmail.com> <ZmxuWKX9lFv3pHqG@fedora>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 14 Jun 2024, Jos=E9 Exp=F3sito wrote:

> > > Turns out that, since the last time I checked the KUnit docs,
> > > we have "EXPORT_SYMBOL_IF_KUNIT" available now.
> > >
> > > I think we can use it and your final patch, without the MODULE_*
> > > changes, could look like:
> >=20
> > Looks good to me, can you send that with
> >=20
> > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
>=20
> I couldn't add the "Reported-by" tag because check-patch throws a
> warning if it is used without a "Closes" tag.

What?

Let's ignore (or even better fix) checkpatch, this is bad behavior.

> Other than that, I sent v2:
> https://lore.kernel.org/linux-input/20240614161935.230529-1-jose.exposito=
89@gmail.com/T/

I'll add Arnd's Reported-by: while applying that, credit must be given.

Thanks,

--=20
Jiri Kosina
SUSE Labs


