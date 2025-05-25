Return-Path: <linux-input+bounces-12560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F411AC33F0
	for <lists+linux-input@lfdr.de>; Sun, 25 May 2025 12:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 684537A6E3C
	for <lists+linux-input@lfdr.de>; Sun, 25 May 2025 10:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998BA1F03D9;
	Sun, 25 May 2025 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkxoQ028"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0819AD8C;
	Sun, 25 May 2025 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748169713; cv=none; b=rNUgYOwi+TZh/IKAOnqvmAaj9IcHP/NAwNblooncc5djn6fu1nDQO47NkH2E7vCLReVwILnE8gv1Q6hDvc/V/4oKboIPF+idp5Cx0naCnEu1Dqz6Zheq+IieJLshnsCl4E2xrDQ5tEsAIsJqTeOV8AMj9SoyaH33XN2IEZu/rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748169713; c=relaxed/simple;
	bh=gr7NrYitp+gJggtz8h1MDMKTKToxbqJFU0KG+Uw5W+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERwibZ/vvgKGjA9GPFZ/xAj8pGBipJjBDghmplRRCWJpT6RYDVVYQy4TrgWute9qnYW3XBHCpCcHy24fMKW5QP9Gz/1dvacvEBLXDmzlafJO81YBNNXV5HWjwk9s3/FIfBHbqqELLwoLhIiby1X3EJ6AO/MboXU6Izzc9uEouxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkxoQ028; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4769aef457bso17056071cf.2;
        Sun, 25 May 2025 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748169711; x=1748774511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzSE2fBc5Z1KlI13GTN90PrRF7yIho/5+YV8J0ADXxE=;
        b=UkxoQ028zi4fnB+EmI7GT64zORW8lsBBN6mgp5tlSEt3bg6BkXsk784VnxAje5G0Js
         /Yj9TYjIbcHd6svR6v89x4xIBGxVRs8EMfF+e+hKVuu5UxE/U/1yv3F2FdlZkXRpMjvw
         A5L/ZMX0Pl5TqFD/WcRHlYa9NDe1S4P1EoaCES7V1H6Q1AT/ydPjYisoQEcVafVRoxRA
         okEzKwrAHecKwhr7z6z3gbwkNDQ2XpmKzyJA+YszznvSmwFItpwxnx3bBtKUh9MV8u/D
         3ajuqkFiNjzmwFYhQnUKSsTBn5AHLOJkUaE9EGH4c31Lr4HASiNQNVun1zhhVw8NlAlR
         zOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748169711; x=1748774511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzSE2fBc5Z1KlI13GTN90PrRF7yIho/5+YV8J0ADXxE=;
        b=dPKd3rvnxvQSCKGfs8s6Sv44pVb7FMtwoBguMEF+xNVlejUVzj9avh3ik89gdJkSpE
         hYTDMSVHdkTz7zCQ3z1piyUPf+04E3HWzIWwCXrVgj/i/ioxHHuBOhzO1A3UvKCHMUqo
         O7cTxVmsd1EHK+EXKJFCL/7VHkfJYod1DLI44xR/Akllg5TMPPuR4zYQb87Gbuzx7aDa
         1cD4KaWC8bSxjI3/NhRACriZ1+wQNC2U6/Oo1xVSNJ/oc5ypqqMgHmxiaBW6p7ecPOJS
         yO879vsT0HNNNUSZqidCib13AgR4GUs32fJawDDWtZMPqp8Z70L9MuiY8Mwq4NWRQbM7
         Ndwg==
X-Forwarded-Encrypted: i=1; AJvYcCV0WdbE32ACp+Sx3rurrU41Tz7csdGSbZh/G2Cqhl3tc2NHjOLi/Y5WPuqTnibnJ0UVy/SczN6MmSQgiw==@vger.kernel.org, AJvYcCVLqS9rvZe32Yvt4hYYx3cJsG4/DRCEXoIqzdtkj1GFoYT+GM5ifseUahvmnOqGVwLQIkMVf8wYM8AVUM4H@vger.kernel.org
X-Gm-Message-State: AOJu0YwK3Oq7qDR2YcqG+Jld9VJlenGpM5PV0trdjpVo0ieXV86Z6XGK
	XcMTgG5/w8IzGt0Lc4cLQhq9RUwj9VQTAR7n2GW+tOkFxcFJgwDLnlcGWG4YFcoQIxjH6mh6d+w
	LHe/8SCzsSbeBsPePTSdU/I3RYViG4vk=
X-Gm-Gg: ASbGncsn2GXjgZ86C3vuSC2E2PTjaN1dln6zCrkLyP3UiTziBwjfuKlvcTkodRiWq8q
	/N/Bn3X+ZYGoC58VIkNiiD1P0R/+yzdSL53p++UhE/kmNVzguZrIfVam3M3ceJ/if5PNKIEWgnD
	ECrfcXcQxJH6XuDlNVhsywVIYjc5hv+WojANPFDPAnDNSvcMYHV1qj5ahhileUf1KL8g==
X-Google-Smtp-Source: AGHT+IE1dp5Qp6JQht8rRbsOpGQTpVCi+6M04ZIOoqX8DToNESkfXyJe2ZEmd1wMh1Zadc+7mmviznDynHpNk0lmMLQ=
X-Received: by 2002:a05:622a:17c5:b0:481:3f7:f5cc with SMTP id
 d75a77b69052e-49f4781d500mr105217961cf.34.1748169710723; Sun, 25 May 2025
 03:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517105045.70998-1-apparle@gmail.com> <naxnt42hmvorqkif3pu4x36tpo44ugo2oiblrbtlrauucm5di2@tr2yobgoywmm>
 <CAB7A79ysZ2-kxKPyiM1+5keSrsbVwNZti4FzXGUbjx4OONzrDw@mail.gmail.com>
 <ogmv67n3rdia67ttj6whj4wnr2humhl2fjpo56phghqf67bpjx@bbdmdsmbp4kk>
 <CAB7A79x5zviCqjO_LY34v53YpDgpc3Lck5n725bn_sYTkL8EEg@mail.gmail.com>
 <65636077-FB55-4E20-80CA-419EF9A071B8@progandy.de> <CAB7A79yzSq0n9cdbQFZfzzZ+J=iub+vo6j3FkRRty-e0vTsvLw@mail.gmail.com>
In-Reply-To: <CAB7A79yzSq0n9cdbQFZfzzZ+J=iub+vo6j3FkRRty-e0vTsvLw@mail.gmail.com>
From: Apoorv Parle <apparle@gmail.com>
Date: Sun, 25 May 2025 03:41:14 -0700
X-Gm-Features: AX0GCFsUDl78pfdNtswUvipRH9sbOYV2MnRUszUhg1LXJb697cF_7pNlU8d8Dl8
Message-ID: <CAB7A79w8dBiOAbpgZzNxo3whk7UUx=bxUWcMvuT+sLpuPKJAOQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] Input: xpad - add disable_xboxone module parameter
To: "A. Bosch" <progandy@progandy.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any thoughts on considering this patch?

On Wed, May 21, 2025 at 2:45=E2=80=AFPM Apoorv Parle <apparle@gmail.com> wr=
ote:
>
> From what I've read on udev rules so far, I'm not sure if there's a
> clean deterministic way of unbinding one driver and binding it to
> another.
> As I understand, I'll have to write a script to run for either the
> "add" action or the "bind" action. The "add" script runs asynchronous
> to kernel's binding, so it could happen before or after xpad binding
> is done; and even if I unbind it, kernel can re-bind it again while
> scanning the USB bus, which again creates a race with the script. If I
> use the "bind" action instead of "add" action, the script can recurse
> depending on timing of kernel's attempt to rebind. I tried to look for
> similar examples but couldn't find any -- just a few very high cpu
> usage bugs due to similar recursion.
> Other similar scenarios (like graphics drivers) that I tried to find,
> just blacklist whole kernel modules or used some module param.
>
> Though I'll admit, my knowledge of udev rules is somewhat limited.
>
>
> On Mon, May 19, 2025 at 11:23=E2=80=AFPM A. Bosch <progandy@progandy.de> =
wrote:
> >
> > Hi,
> >
> > could you not create udev rules to perform these actions?
> >
> > - Andreas
> >
> >
> > Am 20. Mai 2025 06:04:36 MESZ schrieb Apoorv Parle <apparle@gmail.com>:
> >>
> >> Ah, yes, that's possible. But it's too hard to generally use -
> >> requires manual command line intervention each time the xbox dongle is
> >> plugged-in and/or computer reboots.There's no easy way to robustly
> >> automate this especially for layperson linux gamers.
> >> A stripped-down and hand-compiled version of xpad is at least fully
> >> automated, but only until the linux kernel is updated by the distro.
> >>
> >> On Mon, May 19, 2025 at 2:36=E2=80=AFPM Dmitry Torokhov
> >> <dmitry.torokhov@gmail.com> wrote:
> >>>
> >>>
> >>>  I understand. However you can unbind and bind individual devices to
> >>>  individual drivers via sysfs by writing into
> >>>  /sys/bus/usb/drivers/{xpad|xone}/{un}bind.
> >>>
> >>>  Thanks.
> >>>
> >>>  --
> >>>  Dmitry
> >>
> >>

