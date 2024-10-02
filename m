Return-Path: <linux-input+bounces-7013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E498D22C
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 13:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44CE1F20F0B
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821321E7646;
	Wed,  2 Oct 2024 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxmtGRhR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47C1E6DD4
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868202; cv=none; b=lfX/DSnN0nVKmwfOCwoZhXMv1Um88R2wTh6JR+ROOiZQ+LvbeHD2JxXVDb//9LTP4RwAb7sYnLSpyVGiEH5QyRVhs19e4rwdXQmX5IWuMjIquDQ2iqwLa9EPDVizQm8vrjW2nXktb8fl+Z1VR3uj3ty3ueC1VtnmkQsPkA5mYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868202; c=relaxed/simple;
	bh=7+BCouCb4FcqZ6JS63XRH+ToOXPyxfmDJNWVyusEN0U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uTtrXfnmulmPsfN6US7wZWibct009aTa/uxTG0ZPT0mwCffgtgQdD7o1d0vgr/y5JKvMYyAZ0jzQEPw+mEPh7nP7gIPpv7tGcoTb3+czE2bnkd1V0EnfsDePpQ3GpXs2Wp5CCFIk25gGGeh19p1Qzyb79VJe7oh+2DegkoZhxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxmtGRhR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so28471715e9.1
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2024 04:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868199; x=1728472999; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pJ0LI5otDtnzHwV8FxEn8qRWsAhpkdOjyFHhx3xtMxY=;
        b=cxmtGRhRKuKDrODVip3poJWYVwjTp73D8xeJE/eXJkO0XKhxdeS3zy0wlt1UifwXdU
         dSMD5S0+c+0C1MKOYCAUR1XI+rWbW5yzyt+eZP6ShFHDOQxbWEHLvGjoxgpnYt2a6pY1
         1d9CiUJTvV3DzOC261KSlzl6DzGkJYo+jZp6FJq0ufNv1/vkJgA7mQHhz3UmKFN0HKU2
         8mkOOuxR7ifjVz2Eueb6dSGV7kA8w3AEj7Tjh3a9diweG+1+QHZ2eKrHT540Y+IOYkOq
         +0KJhZ++gv5WJZjohs1DLeNPAj7PL9ugKk0CmWaTljOWkgYh88RJNozQ4J1AlyzqU2IN
         s14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868199; x=1728472999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJ0LI5otDtnzHwV8FxEn8qRWsAhpkdOjyFHhx3xtMxY=;
        b=Epffbcbih8Mn68Oh1mkjamaiumKeR4ru+Ji0WREx8H5V/acndw16k6lU/N0MBblkSU
         SyAF3XJngUyZI+FTX3ph49T3AbY92UYA/TXVSs4s4sAJLCcfVyE9dzlwxaZ3cs/fGWiG
         X9omScPX4/3a/gZteajsZ3iaMavMX13IOlI6I2H59uaohnD4aocNjAJidp1Oaxs4KwE4
         Eor//YfQOAGDzeFGIRtkJ8KF6rBhncpGLh+ezXlIsFuLUK4R0fA+J/6rMgNbjCbc5xMI
         sKRBZIDYnIDP+VYBsxGZFmsjHrrThVGeCt9gVK3WzJOAvqNu9WDeLS8V3kV5X8cL1onm
         kxSw==
X-Forwarded-Encrypted: i=1; AJvYcCUqRaHB2HD0FHIGvBf1Q6Ys7er34neZgEc8UjY5tqQBayjTWg2aG3xzEvoj9cScTfVsQqdRdJBzkm+RRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBUkhGrXTakMn9JpdOhY0R9ZkCGuni2DboZqZpRv4kc9ouwxc
	JNyU9KJkF3L+NaRckpatxjVj8oA6GmM/lUm5yz5ZILkR7IZCgor0
X-Google-Smtp-Source: AGHT+IHnz/dot9E6WGZ2JmExFXBCZY79OjM0kcS8WVupBAOiqIfNI4QdNAKshvl/nYu0mqKNg0E94A==
X-Received: by 2002:a05:600c:3b05:b0:42c:acb0:ddb6 with SMTP id 5b1f17b1804b1-42f777b7325mr19871505e9.9.1727868199071;
        Wed, 02 Oct 2024 04:23:19 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:341e:1201:c434:b5b1:98a6:efed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a02ef22sm15965585e9.45.2024.10.02.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:23:18 -0700 (PDT)
Message-ID: <58d1af4cddbbf5f96cc5f3d08eae4250b636b257.camel@gmail.com>
Subject: Re: [PATCH 1/4] Input: adp5588-keys: bail on returned error
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, nuno.sa@analog.com
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	linux-input@vger.kernel.org
Date: Wed, 02 Oct 2024 13:23:18 +0200
In-Reply-To: <Zv0pzelCZJpI0dxa@google.com>
References: 
	<20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
	 <20241002-fix-adp5588-read-refactor-v1-1-28800f1b9773@analog.com>
	 <Zv0pzelCZJpI0dxa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-02 at 04:09 -0700, Dmitry Torokhov wrote:
> Hi Nuno,
>=20
> On Wed, Oct 02, 2024 at 12:51:50PM +0200, Nuno Sa via B4 Relay wrote:
> > @@ -455,8 +457,16 @@ static int adp5588_gpio_add(struct adp5588_kpad *k=
pad)
> > =C2=A0	for (i =3D 0; i <=3D ADP5588_BANK(ADP5588_MAXGPIO); i++) {
> > =C2=A0		kpad->dat_out[i] =3D adp5588_read(kpad->client,
> > =C2=A0						GPIO_DAT_OUT1 + i);
> > +		if (kpad->dat_out[i] < 0)
> > +			return kpad->dat_out[i];
> > +
> > =C2=A0		kpad->dir[i] =3D adp5588_read(kpad->client, GPIO_DIR1 + i);
> > +		if (kpad->dir[i] < 0)
> > +			return kpad->dir[i];
> > +
> > =C2=A0		kpad->pull_dis[i] =3D adp5588_read(kpad->client, GPIO_PULL1 + i=
);
> > +		if (kpad->pull_dis[i] < 0)
> > +			return kpad->pull_dis[i];
>=20
>=20
> Unfortunately all these are u8 so they will never be negative. You need
> to do the adp5588_read() refactor first and then (or maybe together) add
> error checking.
>=20

Ahh crap... Completely missed that. Yeah, will see what looks better... Tha=
nks for
catching this.

BTW, this is also wrong in the adp5589 series.

- Nuno S=C3=A1

