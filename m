Return-Path: <linux-input+bounces-6779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79885987A1B
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 22:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3046A1F22D54
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 20:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FED1741C9;
	Thu, 26 Sep 2024 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGs8WYcB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16A913B2A5;
	Thu, 26 Sep 2024 20:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727383044; cv=none; b=r6kUYD2O28heByc8nH1zCtOnNIxwhe7BdqaIY8zU70iNYnJz8iWvtGfas6GJQFtuzQKckcsQi+wrGMYjpv9D+miLU+1SHCI7Urcjnzvrzjppn8+9gldtb8qjHy71EftEFYv26SFVpxLoODNHmh0aaiLNfuu/b9RNo3ew0ONcgxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727383044; c=relaxed/simple;
	bh=775UvlkSoXpTO0ArAyGUdf/HYXxZJcefCUu1uzpll20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZjw3os/aq5+Zn9waH6ieNc0595F9GtxtGNWA3RrmTcFKA0lKHVv1xbQ6a1GlA+K9BNXv8PZpwzD3zRbjU0uFmnj215DQRotkFzZw/UpgCgO29rTawhFU/Ng2m12+mKpsDPdEsffW72bL3VannBvYFj9nQHmuZic4tldKNcotw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGs8WYcB; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c71f1396e4so1627828a12.0;
        Thu, 26 Sep 2024 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727383041; x=1727987841; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=775UvlkSoXpTO0ArAyGUdf/HYXxZJcefCUu1uzpll20=;
        b=eGs8WYcBQNELGqb+33U+/9SKulLq6oM8ydqzOyUfgSecV0/csG7mG8d/SEkfrfzOA7
         wNoTh9mP1s7gto4LaH1t8GSPtlWu7081hFODZ1H0LTewhlvmVAa4nPCkSKZiyjsrxNVK
         holtMPvn0tFFxW84TGs30tqz5y7Z/C1vhC30iLSny+hoZhlawRLTbPDiqRnorZX/uGDt
         oPiL6zKQcMY4l/RaGP+bgdksLxIebTgvRT0H0WaAf0HcPZFzoz5hbTRRhQvTg4t3fw/O
         pNj/lxlT4h13rKJhBUOD2bPsLQ0A/2M3BoyX8umProYhlyTM3k+XvUifwE6tu6cW0dau
         Q3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727383041; x=1727987841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=775UvlkSoXpTO0ArAyGUdf/HYXxZJcefCUu1uzpll20=;
        b=pyKqekmBcpXU5hQFlhTRiEZVW/myjAffoWmGInm7XV/TQbxuLYcQ0kIOdTExLYwvCe
         n7Reckebmz4CrMLM6NpBwN+eXfSB6AnjMq2lUzDLJqxq/mIZ/wv3ErkZ562XFHq03HUj
         THtas/mrYNo2Q9h2kxFZ6h4FxV9IplKwBzu5xdbrefDlnomtNJzw9N1dBqEpBLheMNHq
         PiuRy+S+bHmywyejCA9uGp72qc0Ob16hc3AvJ1vhhQTO0fDG5X//Sn2FUEhyUCd2xCWz
         K7Gdp/ddo/NlcSABAcU+AIm7WcpoMf4azl08/jmP0yDOzAMm2FowiJJLX41HFvslPtz/
         hEHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUiBYmBtNbP0goXe6rxfj+8kuXYOkOfpFZNaOSTqrRC0c5c0J2mPK4cQzS3FuJbKWqf6X1eYEQi/kK7H+8@vger.kernel.org, AJvYcCXbcKE6eMn5J+laLFLnABJNlK/c142SsHIQc6jAF10/u6N0qO/P9Zc2sAII847Q25jxYfKobftiH7K59g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6B13xz0tAFr1B6NYJaIJQNBtWwYMrunStLmhURXD3HmfZ6U9
	2+Du/V7BWJLNOCIySQrs4zmXNfKabZsI+YiCW1AWhSEqL9v2UDSL11/pn2comB3LJqrJKjYslCo
	QropbDdsNKQpyTtpTqSwVqIrVIiA=
X-Google-Smtp-Source: AGHT+IHc1Ezux9pM0aThP/TOYS2knno6+tOUMZrrGeAxftJLhrEpwS38H4GtC6O7ecA8U44MVby/mKDHkInNDMwyPXE=
X-Received: by 2002:a17:907:a08:b0:a8d:55ce:fb97 with SMTP id
 a640c23a62f3a-a93c48f33c3mr77813366b.11.1727383040932; Thu, 26 Sep 2024
 13:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm> <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Sep 2024 06:37:07 +1000
Message-ID: <CAPM=9tw9Dns-fjeQmqLDyf5P99+Dq77R5xktvsFbO0crC5b5oQ@mail.gmail.com>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
To: Jiri Kosina <jikos@kernel.org>
Cc: Aditya Garg <gargaditya08@live.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"bentiss@kernel.org" <bentiss@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Sept 2024 at 04:03, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 26 Sep 2024, Aditya Garg wrote:
>
> > It has been more than a month since I've sent this patch set and I
> > haven't got a clear yes or not for the same. I understand maintainers
> > are busy people, but I'd really appreciate if I get some response for
> > this series of patches from the HID and DRM maintainers.
>
> Just to reiterate -- I am waiting for Ack from the DRM people and will
> then take it through hid.git.
>
> Dave, who'd be the best person to do this from the DRM side please?
>

I think Thomas or Maxime could take a look, though it might be easier
to submit this in pieces, does it really need to all go in at once?

Dave.

