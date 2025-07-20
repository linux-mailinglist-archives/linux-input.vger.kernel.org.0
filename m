Return-Path: <linux-input+bounces-13603-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8827CB0B6D6
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 18:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAB853B48A3
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 16:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD49DF49;
	Sun, 20 Jul 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brz+DJNZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8306BA27;
	Sun, 20 Jul 2025 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753027635; cv=none; b=qIInSZBacIz5hmu5hPcxbxutg5tfqHej9E+T/KwPzFi8AH32FdFgb6K89EvSUOOTGqVP66Kwgx3SMkOoltYJ8QyedE7U23ZZuSnUb2LfVk7/9iBFILRhBwZJfsx+GbpdjUu87dTmQg4kf+AtOZhSNZEQrOtydY/UYEfgC4XtCbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753027635; c=relaxed/simple;
	bh=tCvL420Oc7SpeVAWjKhlGW1iOXa1DL0XNL0BW0VHZpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UW0hSR5T2H6jXSQzbu1jpZk8lA5q7LqqwMgVzCDpptzRVqq9pxgEBp6PYmuFQ1BH5Jn39oK24RJQWdyjK9y1vFvIij9DRIV7RHbkQlYf2P1BkhYKiJ8BPxBp/4ZCo25G676jVr2OcjUJRVnFNI3wI9MUkyTytf6QQhRixE+iQrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brz+DJNZ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6faf66905baso45428256d6.2;
        Sun, 20 Jul 2025 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753027632; x=1753632432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+UG8tyW4gM8MQZNq6XVXkaLDvxXXGUZB353FjeaMzc=;
        b=brz+DJNZxV+mEXbViw8eOi/TUco4OnHBYe+koeOqt+HQ/M0aBA7u7N7nG2b730wUcR
         GKycaZodR4OJjgj32vDRPBxhDJwOOAuHH9rgdWhJw4DxSWk1Vk8mt59lA7Ekynd2TU37
         PoI/hXYxmvfpZXAl3a580H48GWK45pefsypBpDhucp9ALs+y8tdvYnoHLvie5GCgdaGD
         sxtOPOO8+yn+1zLBsXzBxI03EumNfTuvRaJ18WMW1tvoPQyhf4NwLXtaOYEGWumTg2d6
         Z50lvLJa9tIxopIylU7uyqGrWfy+AjdLrCY6kJbmaOKGhpzVZbP9QJ5MFKCz0++TUJxq
         4wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753027632; x=1753632432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+UG8tyW4gM8MQZNq6XVXkaLDvxXXGUZB353FjeaMzc=;
        b=JymYKKXXUonyVlCPmYgh8sZlL2iBw1IRSuh4v/x6DMS6hft+4B7oQZVrn66r6TSkUk
         BZLfpLJIm++TCF5xDgCZfbNmvkTzKY1YLHB9Xlxu6BQuddyVfr7ktBxVH3eiHDODwJmV
         rfOyVZbPGbTyHv7uzFshK+zWbZIruWxmzPx8pU//yHiElBHOUzZNt4P/3haYwS61fX9K
         Eymsi4oNK6vT3r7q3UHevrdTQHuyI8t3ic8JvCxa6860uEtizOv75iQErk6mNyTn6bkX
         BPwKK6aw4XrWH5tNqPA3v98fQ8rpvNSdI7LwwR3RAbFrihJrovFbQ02jKFDCvUG83Sav
         /Tjw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/eCK+ZHqCihGRZWPaL5YVJlj1MZs1isfXa12a6Sqr+NK2PizGLty9g9hBgNezDXl3LCWwXVx4dDe3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8MGreEPYqwY9T0dNGJEkqTYHjSOK4JhAn3v5aPndFZWwJGg/U
	eBzBfs8/a5N3OOXkAWovJihF0zSoQZH5HX0Z0ATbDx1CX1I2byCkAQmk
X-Gm-Gg: ASbGncsagjiy3SAzcj3zB+bucfW9W/2v+bCXBq4Mje1Rk5SYTMm8LSQJ7kEe626Azbz
	AKACg1zlLZlYhyxLjzOWAsIciOBbrIqrWuopyIlsKZHAOG3yp+KgwEmfrs34UNjQYmYvWvwsgdY
	lW20webwRPWs8Q2VcML9/vw2BhyefG888Uip7cwYJHUzgmJqt5bnc5i6SUtfTnY4wDH5rDeejeM
	Y6O/uR+m2VT6GRgGCLEMbvH4A7b6hGBGV3OG5RnyGVxcDO+JwXEUoJ09WvqSlWU4SwDWubS/+f5
	/CKB7NhNE60XooRA2QthBp1iBNs5vlOLiqZx0ujemSMsWIB+IGiblAc2l5MYyzc7Z1NWO9+oMjX
	f28hSGU5e4/FrjojjXaXPjCix8ymNz4FXf29lFWyFiUDKMw79TqDpHbLU1JklInebaM0Uh4eGyD
	pXaCBkOafpKptADQDMB7BAYcc=
X-Google-Smtp-Source: AGHT+IH9qqI3ooP+5yhe/7lpoxbf2uUcjSbFXONIpdHn0RIqMX0HR58oX6EE4YqALnKj0f7gQrj5KQ==
X-Received: by 2002:a05:6214:2628:b0:705:1fc3:ec20 with SMTP id 6a1803df08f44-7051fc3f1d0mr114469406d6.48.1753027632484;
        Sun, 20 Jul 2025 09:07:12 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051bab471esm28974166d6.105.2025.07.20.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 09:07:12 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 64AD6F40066;
	Sun, 20 Jul 2025 12:07:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 20 Jul 2025 12:07:11 -0400
X-ME-Sender: <xms:LxR9aA8fm8Lmukxz-niAUfRbHbJ0SyqD0_5-i_KdFbvJyuXaTwldEw>
    <xme:LxR9aD7xxq1ERfkDkmlT6t1zF90rF1C-dr4KIdeTZNU90HEknQ9LW2As1LFwsbF1X
    Dio-ta0eWychzIXqw>
X-ME-Received: <xmr:LxR9aJ3p0h9ZbMWMFzhLuYMjep4yvLIP25r1G-KrwZbXEvG9OULeCBUkBD0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeileeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsvghrghgvrghnthhsrghgrg
    hrrgesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhl
    ihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqih
    hnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsvg
    hnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegsvghnjhgrmhhi
    nhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:LxR9aKyLGWxgpj7cMzYnxNcthjLBeIclvGcastHXeqnlYfOKeLvANQ>
    <xmx:LxR9aCnKbpLDl7JFN3YXaKRTiO9W6aDKax8ZfR09qIgcXMBuRPeKDw>
    <xmx:LxR9aN-Ljoiai8dCKSBqKtm6UTsEcgAcFJ4jpA3ZIBZBPHNL7SLufA>
    <xmx:LxR9aNqmNNM0egYkb3YkqHvThbf80KwNcBp_96Ma1guFjKLyFzq5RA>
    <xmx:LxR9aBKDLNtXODShoKQ8MPXwsZ3KnDU5k6Yg9jUAfhlGjIaX4sUwz2aj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 12:07:10 -0400 (EDT)
Date: Sun, 20 Jul 2025 09:07:09 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org,
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	bjorn3_gh@protonmail.com, dakr@kernel.org, db48x@db48x.net,
	gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu,
	peter.hutterer@who-t.net
Subject: Re: [PATCH v2 2/4] rust: add kref bindings
Message-ID: <aH0ULSbGvYhpTKFP@tardis-2.local>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com>
 <20250713211012.101476-8-sergeantsagara@protonmail.com>
 <87tt36sveu.fsf@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt36sveu.fsf@protonmail.com>

On Sun, Jul 20, 2025 at 04:02:09PM +0000, Rahul Rameshbabu wrote:
[...]
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index b15b3cddad4e..7f5403d6c51c 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -25,6 +25,7 @@
> >  #include "fs.c"
> >  #include "io.c"
> >  #include "jump_label.c"
> > +#include "kref.c"
> >  #include "kunit.c"
> >  #include "mm.c"
> >  #include "mutex.c"
> > diff --git a/rust/helpers/kref.c b/rust/helpers/kref.c
> > new file mode 100644
> > index 000000000000..25eeb0a724ac
> > --- /dev/null
> > +++ b/rust/helpers/kref.c
> > @@ -0,0 +1,13 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/kref.h>
> > +
> > +void rust_helper_kref_get(struct kref *kref)
> > +{
> > +	kref_get(kref);
> > +}
> > +
> > +void rust_helper_kref_put(struct kref *kref, void (*release)(struct kref *kref))
> > +{
> > +	kref_put(kref, release);
> > +}
> 
> I am about to send out my v3, and this patch will no longer be needed.
> Would it make sense to send this out separately? I can also just keep it
> stashed away till someone needs it.
> 

I think you just drop this, we will have the Refcount abstraction:

	https://lore.kernel.org/rust-for-linux/20250622125802.3224264-1-gary@kernel.org/

, and we can build an kref API on top of that.

Thanks!

Regards,
Boqun

> Thanks,
> Rahul Rameshbabu
> 

