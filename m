Return-Path: <linux-input+bounces-522-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A938069AF
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 09:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8237A1C20B5C
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 08:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39981A717;
	Wed,  6 Dec 2023 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="epv0FNew"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E9CC3
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701851668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/gzPUFOSQrsQXE5IJFDNljkKEeHorAkYNDfzoMnCf8=;
	b=epv0FNewEy5T888O+e8KpY4sUR99buZjT8YUH/ugYkoc+OsF/eqeAc1f1A3JnFjM2FzABL
	cMTsIIYt/kAR6WqpwC6Br/pbI2mWD4P+gpX3+uDCJiltZ//jCHMVGH6EOI9S00lBk/rJT5
	3t9IK1GGGELgXyQBiTpEHbkGa19o/QQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-8AfjmOsROYWw_wvjTIs7Tg-1; Wed, 06 Dec 2023 03:34:25 -0500
X-MC-Unique: 8AfjmOsROYWw_wvjTIs7Tg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9fffa4c4f28so22549966b.3
        for <linux-input@vger.kernel.org>; Wed, 06 Dec 2023 00:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701851664; x=1702456464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/gzPUFOSQrsQXE5IJFDNljkKEeHorAkYNDfzoMnCf8=;
        b=EIjMhqk5vUqgxjwW4lMotg59qDBeW5q2qcQDIBLSjG+GOky/aW7tU57l+1lmJF72k4
         o6m5EXdvh+Bg/9pkI1tVLFaVn2+yBF0wSbIzELImXcPpwo5+/1Hv3iqvEMsjD/hcMn70
         OwaKNSDefcRfN1PByJF3nUuMdNbUlcF5vEyVcLcvfKnEXLXwYYUWLzzzDvpr7++lr4UE
         2Ngl4V5317yiJnTOZmNFqueQS7ZtdYvGonOsmdNgB+P0OrpgujFxZSv6IjxnRE+D0Fu3
         CK353exz6q3uUAXCZpD4Cw69SkWKCgH9WFiP4XhEDvGiTwJwifNV2x4rSB0+5LqqQRFL
         9RuQ==
X-Gm-Message-State: AOJu0YymTQaN33KajYq2WQdjt2dBcuIlnfYBHRA8dfftgsoRnyT/S9wi
	q9xf/Bjh9pGx97QoyYoglleq+2xVZ1qDevP+ZJWWQ3R3SEdtK//HFTvhVMvh1jRTZqmRkKO8twQ
	b5PAod4Jt3/3qBjes8S6J6Lx3q9DuVFURy6uNUeQ=
X-Received: by 2002:a17:906:5302:b0:a10:c6ab:9cbe with SMTP id h2-20020a170906530200b00a10c6ab9cbemr347406ejo.46.1701851664066;
        Wed, 06 Dec 2023 00:34:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBH2RLq9mqbBBbLae+PCKLLUGM5m6yKcnASNF4hfexpadRMccP6nXBR3ieF4uQQrXpehT7eTy39ZRteepQbSI=
X-Received: by 2002:a17:906:5302:b0:a10:c6ab:9cbe with SMTP id
 h2-20020a170906530200b00a10c6ab9cbemr347402ejo.46.1701851663820; Wed, 06 Dec
 2023 00:34:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114235729.6867-1-tatsunosuke.wacom@gmail.com> <170185151858.57786.7346117978758271248.b4-ty@kernel.org>
In-Reply-To: <170185151858.57786.7346117978758271248.b4-ty@kernel.org>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 6 Dec 2023 09:34:11 +0100
Message-ID: <CAO-hwJKRQ18BvTCkkqZ+N8i1_CySx9zRAw2VOdY+PTgU+Hc5wA@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Remove AES power_supply after extended inactivity
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, Ping Cheng <pinglinux@gmail.com>, 
	Jason Gerecke <killertofu@gmail.com>, Aaron Armstrong Skomra <skomra@gmail.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>, 
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, Jason Gerecke <Jason.Gerecke@wacom.com>, 
	Aaron Skomra <aaron.skomra@wacom.com>, Josh Dickens <joshua.dickens@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 9:32=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.o=
rg> wrote:
>
> On Wed, 15 Nov 2023 08:57:29 +0900, Tatsunosuke Tobita wrote:
> > Even if a user does not use their AES pen for an extended period,
> > the battery power supply attributes continue to exist.
> > This results in the desktop showing battery status for a pen
> > that is no longer in use and which may in fact be in a different
> > state (e.g. the user may be charging the pen).
> > To avoid confusion and ensure userspace has an accurate view
> > of the battery state, this patch automatically removes
> > the power_supply after 30 minutes of inactivity.
> >
> > [...]
>
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (f=
or-6.8/wacom), thanks!
>
> [1/1] HID: wacom: Remove AES power_supply after extended inactivity
>       https://git.kernel.org/hid/hid/c/fd2a9b29dc9c

FWIW, I have applied the changes, but please fix your workflow.
checkpatch complains about:
```
WARNING: From:/Signed-off-by: email address mismatch:
'From: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>' !=3D
'Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>'
```

It should be a matter of configuring your git client or remember to
add the correct "from" line on top of your patch.

Cheers,
Benjamin

>
> Cheers,
> --
> Benjamin Tissoires <bentiss@kernel.org>
>


