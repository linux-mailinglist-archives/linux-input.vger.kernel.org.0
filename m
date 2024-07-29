Return-Path: <linux-input+bounces-5199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5EF93FEAB
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 22:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26BFA1F2270E
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 20:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2D383CC1;
	Mon, 29 Jul 2024 20:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG+EurpQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D973466;
	Mon, 29 Jul 2024 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722283228; cv=none; b=DfcVHfhQbi/g7xUkItMqxYP+oKLe7zrErLXR+e9Kv8BajxXneIrRqn9OZ8P9VCWJ5UB+H53Qy8beoY3NnOiVpmmcFXO3n31irTeMIxIf1FQ02V5IXgM8a7+avckOseb0RJ86fMJtEe8kCH+9C+ECATI2MMo5mBiBWrN9GOGd5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722283228; c=relaxed/simple;
	bh=C2Lpz4N0X8waVL7qIFIfw3p1BGaPYs+PheP+sqFqMUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUcq7wb3EtwOIXVteUiTCmBPX0f5eCffxYcsJiXF1XOHM+kPSZo8eFAXoQsBwNkWENiM9VqbXulx6C2ySx/l15FV65uAoSkZ+ti/Kg7SMsNh4EcOpCD+xvdxCvDjS1H1+Ge9Uol/MGCEspFVtMY2umtTTQmPSUbA4T2LzVUDkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG+EurpQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc6a017abdso21044835ad.0;
        Mon, 29 Jul 2024 13:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722283224; x=1722888024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N7diD9YNWJdflXMg0pyESRcp/QtgJub9rwz7KcBMStI=;
        b=FG+EurpQbmI3SSIymqGxYI83MgD60Dj4ghQCic7CAY4tLVxAAOcDMOB42rwPLpC8w1
         UQXyD3HCkc+yQQZ/7+BShr2Z8Tav7zddj0RTowNvOPa/f15bsGwfSdWAMbydD5xL+BNZ
         LMAra9u3mpP6U/yW9gycaHPRh723TXc1bh8e0mgOfdP7haEEwQQDi+RLOQZWlRB3IXKC
         dFYPJ9QutUVx6xw6z/7sW51tcvAjrmLWGwd6APXAsovWSzgnkBWckdeJVIX+rmJmAOJP
         bqdFoHTj4WC4XNGQHClDTPMGDhzMhomIvoVqioEe1V0xABFiHyOlxtr1Lculck7qTAMU
         Ypng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722283224; x=1722888024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7diD9YNWJdflXMg0pyESRcp/QtgJub9rwz7KcBMStI=;
        b=sRdNW2MJ08N6mXPbPQIXT8UNYqUsEY3El1mvHVkW3WHquk/DRpSHzyMxuBV6GrewrF
         yp0g4fOdHbjxECDDDAaTdXO05k12i0Xhgu8JxbJwVT4tXzDkkpQVU5KK8B460MyTrMrZ
         Gtl7Z04mYmmiSQhriZ84W1fjfUwiXZeZBadMcu3eIc1njF0gw77HtXIth9U022ObyKKz
         nicXBSJq+Db9buoQGf46t5IOfLbJDLvfu3/8cf4awHC/zUZnQxg4meDGIrZXMKIkT+OE
         Oeo22E+b3aMpGlnyzf8Hqc0AlOTPwTQb4Orrv6ctKlHKSOZPOJAu+ZMPcI1yCv43nTcQ
         8Jqw==
X-Forwarded-Encrypted: i=1; AJvYcCWpTKqREoTsEKDL8PpOcJJY3ogLVe/kqEtr8RYGODOfkmIf4JfR2yow0gyPfGQ2iu0EEEbsEcqNx9g9Mg==@vger.kernel.org, AJvYcCX5fnhD7oIhplAP5NPuh/13jWrFg9IZppB4TQ7idzXeQClHZ8WRoXO0KMKaWKIGASlOL6/EvMOoYKV6NFem@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6wxJmW5TvMIHSy5ORzSbUKtlmcV0k/8xJzsxtQIn9P3evlHn1
	CmR6gO0yaeRwWe+h6ZRxrx1FrkOBkF6l3J12+ffRq4bAR9DFrgItZm5Tgg==
X-Google-Smtp-Source: AGHT+IEqRUbcfibcxrQeu5Whs1HlVLHdvJXwsmuZi7g9QuR6WO5EXEU0Gv5opZOvpI5/Gdjpf+wGrQ==
X-Received: by 2002:a17:902:e5ca:b0:1fb:3d7:1d01 with SMTP id d9443c01a7336-1ff048e4fd6mr71587505ad.59.1722283223962;
        Mon, 29 Jul 2024 13:00:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f53a:d352:6282:526b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c7f66esm87435085ad.15.2024.07.29.13.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:00:23 -0700 (PDT)
Date: Mon, 29 Jul 2024 13:00:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Henrik Rydberg <rydberg@bitmath.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <Zqf00C_eOBwcEiWG@google.com>
References: <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh>
 <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com>
 <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
 <Zqfg8FW-SFFedebo@google.com>
 <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>
 <ZqfpgmmLgKti0Xrf@google.com>
 <CAHk-=wgo9iEZ20wB4rOpt6h36Dymudqf6HXww1N094bVoqyMmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgo9iEZ20wB4rOpt6h36Dymudqf6HXww1N094bVoqyMmg@mail.gmail.com>

On Mon, Jul 29, 2024 at 12:27:05PM -0700, Linus Torvalds wrote:
> On Mon, 29 Jul 2024 at 12:12, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > OK, if you want to have limits be it. You probably want to lower from
> > 1024 to 128 or something, because with 1024 slots the structure will be
> > larger than one page and like I said mt->red table will be 4Mb.
> 
> So this is why subsystem maintainers should be involved and helpful.
> It's hard to know what practical limits are.
> 
> That said, a 4MB allocation for some test code is nothing.
> 
> And yes, if syzbot hits other cases where the input layer just takes
> user input without any limit sanity checking, those should be fixed
> *too*.

Hmm, maybe the checks should go into drivers/input/misc/uinput.c which
is the only place that allows userspace to create input device instances
and drive them rather than into input core logic because all other
devices are backed by real hardware.

Thanks.

-- 
Dmitry

