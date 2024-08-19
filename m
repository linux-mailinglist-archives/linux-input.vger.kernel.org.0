Return-Path: <linux-input+bounces-5677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 005D59571F6
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 19:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EE801F20FAF
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 17:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815D917BB13;
	Mon, 19 Aug 2024 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm0vSoUf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407414AD02;
	Mon, 19 Aug 2024 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087820; cv=none; b=ehXMRcSqjEj9Fv0cel1r6pDofESnbvSDFwHVM7vdlQLhHiSxNEfsIpWJ7YjDUTuffXDl5iLseIQlmA0YVcFlpp4QA21PDYKziS46hRyRBtOnrsLxzjv++AJtxHW45dPHX9el6BNDRTWrZgQ+vOM5trQPd4mOdQ7VwqRaSbOR7Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087820; c=relaxed/simple;
	bh=3j0MwIaF5flvoEFlc+jOXgQ5I4ibWXlbNTvWQlJ/gk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWiw1KvpXl4nyNFRXPDytO9jL6ffOcFLX8BfOJcTbSURThCfpVn6mGGrEvrmwDc2y5Hv3qC7S1DGWGMEx5xLTaX1oFT0VELnRhegs9WvUDHQRT+Y74cHb1xG2E1sezxqx3bDp06RuoCi8wxpZsIJsWwXbPzoHP0sSG6XVQSwsDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm0vSoUf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso37443185e9.1;
        Mon, 19 Aug 2024 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724087817; x=1724692617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j0MwIaF5flvoEFlc+jOXgQ5I4ibWXlbNTvWQlJ/gk4=;
        b=Lm0vSoUflgyfScZG5UjV1b4Z+tVcM2snthoDougHPvJRRo6kqJOiDjf4JPLiImGoqU
         rm4u6ZvMn1e5EK2KYpzx2DiSu4x7fckQPHtqTdoprSSc1l98Cg5VjeOEFQsozjHc15/k
         vYp7Jf0+5b9HIgs2B/kUZDiidpctnIugAXocWEZaYEkrHCO9oxw7VDG5Ju1d3v357UUx
         fYjEJrInbfKhOPF4/4NHmlthJ4+eyufpSsLDHe/sy7QQHvatfQXnNoXzKroUcDevlXNP
         pnN4SefFvYnRXhdvhKfCcVgr22JvRcsGccFReAYsDMu0zANMC7l2PLXjjD/QIjJzmWD8
         okVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724087817; x=1724692617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j0MwIaF5flvoEFlc+jOXgQ5I4ibWXlbNTvWQlJ/gk4=;
        b=F1TA6Kl7WeBAjHgIurM4tbsu6Gmzgv0X+lZv/49iFBJvgK11Mf27rFadDLBQk/XcHz
         I8jzM4RLweeUDZN4AkpedVVcMhYUWBTB7c7oWPFlyyrSX/dUvmGiuNKU9icfA1wsMrR5
         JlzwPHi2FCJz+/g49UEXH/nR+SKvA0vDt8ZsWEMTeSBbsQFe6/P42pe9fAlLaYCgAWEj
         HP+QiW2q+92FDtzldGhWPmHyM3AaoPb7NePvE3h3i0kjeyY1S0yqcF96SfvzHlfT/708
         tzkD7U5CYoixHWSF34XysAFctq3X16WaWoiE4C56T9/aAL08D0j1vZyEeoZKWnR59Vs3
         eWsg==
X-Forwarded-Encrypted: i=1; AJvYcCXKBJQxF5vDDQg3gvX3PMOt+PQ5XdYCKz8AVr3/tNZmPrMoKzluRo9PPpXGIp1fDWklltQjD6BfL9P9Kd90J3jLMZr8m++s0yjH/Ivd
X-Gm-Message-State: AOJu0YxQ9Jy2yRNginuaJ5g5MWwGxER4QByTXIZEmfvuSJZdxfja1/mO
	DBrK816viqk0yavnBdCVovDck5rw4KI107R71WUhjz3mtCvo/AMy+q3nbQu4no8Tyrx4F3tx3AE
	UhHlaunxFFeEc20WthxWV9TU09ms=
X-Google-Smtp-Source: AGHT+IFujZ+Qj7RACHbHumGciMl58LZ73pQK3L/ob2jWLQkIBaDCHriED8vX6Z+fXVPttH1i8+X9QQTmGUvXjMkIwc8=
X-Received: by 2002:a05:6000:bc9:b0:368:4da3:a3ac with SMTP id
 ffacd0b85a97d-3719468ed4cmr6064898f8f.40.1724087816412; Mon, 19 Aug 2024
 10:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>
 <aa331200-205e-4b00-ae02-343c96c52ae8@web.de> <CALTg27kAMd-0tQdJ+k4Ur9i=kZ0qY_vffhm3ZT+_CX6tD_874Q@mail.gmail.com>
 <e0ccc03a-7479-4243-bd12-4d77b47308f4@web.de>
In-Reply-To: <e0ccc03a-7479-4243-bd12-4d77b47308f4@web.de>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Mon, 19 Aug 2024 18:16:44 +0100
Message-ID: <CALTg27n965pGk4UVLOWKRe1MDr0=Y870k1zVC3LP9b9Q7q9djg@mail.gmail.com>
Subject: Re: HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> How will applications of macro variants evolve further?

Sorry to get you to clarify again, but I'm not sure what you're asking.

Stuart

On Mon, Aug 19, 2024 at 6:53=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> How do you think about to distinguish properties any further for avail=
able
> >> device attributes?
> >> https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/driver=
-api/driver-model/device.rst#L38
> >
> > Sorry I'm not sure I follow you're saying
>
> I became curious about system fine-tuning possibilities.
>
>
> =E2=80=A6
> >> * Can the macro =E2=80=9CDEVICE_ATTR_RO=E2=80=9D be applied?
> >
> > Done, also applied DEVICE_ATTR_WO
> =E2=80=A6
>
>
> How will applications of macro variants evolve further?
>
> Regards,
> Markus

