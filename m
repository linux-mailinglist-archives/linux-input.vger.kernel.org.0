Return-Path: <linux-input+bounces-1796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1884FA84
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 18:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233C91F23D67
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 17:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D92276414;
	Fri,  9 Feb 2024 17:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QU0l9GCh"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE984D112
	for <linux-input@vger.kernel.org>; Fri,  9 Feb 2024 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707498308; cv=none; b=pPIuH4DM9BYtMuzbStNyArzfilJ5oX5cEC5YgiI6LJ5x+dNDxPGNHM+RU6qkMh7lyOC35AA3EnQbu1/tJ0Hz+c1AMbItjKFTddH8wqdjKPQYXe50v7Nc/Tq7SZT1H/YVpdEizJO+81DxAWKIdSzKyl/7r7x2a4PwIMauRUZeFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707498308; c=relaxed/simple;
	bh=xwZzEC5N9Tk3OxSnesPK34/6ccpOLSW0y1TDD6td8Xw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iKlwHmauk4TaQ58E3k9if7GllELnHdL8ckpAcmyKghs6WpkwlWV8LrdnSLUKAdKO/ZvFzV14hhouvQ/K5cGhpRZiuMZA+h4BWV6kM40IH6nQom1mSicgsA//dFITF2hEiEreFyy8nOTxJBRHNAag9vRSX7xkn58Nap4vLlWCo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QU0l9GCh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707498304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwZzEC5N9Tk3OxSnesPK34/6ccpOLSW0y1TDD6td8Xw=;
	b=QU0l9GChlZwDBilOwRky1NA4Vmur1quO67xdVh/CMAXpyLjEjgdqX+8rt4AxWyK8qERE0/
	ntxtL2j9clDmS17ilUuc3rR+/6ud0PfjVyNjGNJ/dJIVISaUtaVDl/faO8N1xPA05wC0CG
	u23Sh5daYy+X9epKU3MSPUTQ107x4Zs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-8Fs4b8RNPgGpyq3EarJv3A-1; Fri, 09 Feb 2024 12:05:03 -0500
X-MC-Unique: 8Fs4b8RNPgGpyq3EarJv3A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a35a649c608so72523666b.2
        for <linux-input@vger.kernel.org>; Fri, 09 Feb 2024 09:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707498302; x=1708103102;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwZzEC5N9Tk3OxSnesPK34/6ccpOLSW0y1TDD6td8Xw=;
        b=GYz7HF/JxI3/cUWr05yrNuO0h7f42EGQ8LOf9XHmHk5V7xCNAORyK5VlXNDw5br6KC
         fvtyOy89EnzvCmgGDM51aQOaHv6LNrbqZHtaT2+jTS24AZiv3OVW+2cfbMCu7Nrhbykm
         Vu+rdjv0+k752kJEqpUmptg5N365R5qSG9GN9XsHbR2KrJftI0doyNc/9TBVTEVPgMyq
         2gLSbRCc8/cUtVhfVaeYEVcuB62maiKvBI9/ePen/Td+Y/5d3zOYjFdwZTwnSdjpYwMu
         A4KkOjZIvlP4gD1E9Ufh/8wwubBAsudWAI9wEyl9Q3niNI3OvqJCCqoXTIm7aqP4sxDV
         H7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBBUBaSUhLdzmj9npmQ/a9b/u8WQVwZsbZpK1oY/KGwci/Jl/qqvYnEzxwwTEncA0/sG7Rz1Lc41vXKD5Sj+Fezsd/qoBZouA8eQc=
X-Gm-Message-State: AOJu0YzsCEdCv6atFyvKywjyNd9KGj51S0XcGTsqkpXAruZTII9TqmpO
	mXih5il31piAjDpkf+jW3Zw4bUg2+goQTD25BYbdon1wXkSKCB/stptApGjonpyhtjgbIm8mfcy
	bTM1CSToY3dCIeHxyx3F3BpD9WN73DPRgjsqEH0a1si998IL12z0TELXz53Wd
X-Received: by 2002:a17:906:3b44:b0:a38:7d12:60dc with SMTP id h4-20020a1709063b4400b00a387d1260dcmr1702920ejf.57.1707498302245;
        Fri, 09 Feb 2024 09:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ6rIYmVrGR5l4WhAPhCgw3RoLKnYaDvF16VXRcjzzYpHk7cis3fYExxbimqXtPAUIZR9Fsg==
X-Received: by 2002:a17:906:3b44:b0:a38:7d12:60dc with SMTP id h4-20020a1709063b4400b00a387d1260dcmr1702892ejf.57.1707498301861;
        Fri, 09 Feb 2024 09:05:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOtGsAvv6QdC70PwwyWekW7wdIJz0/cucB80WRTV4+ZgCv+AHZZmjEVwpXyjm9muc1IGcLJofTiSKgLMhO+71pOKkmCHsmgprSc6gN44WovL+T+IE3bc31WnJs6BAjOkBj4fQEAqfoT5ow/rXzVpCO/hSbbIE9Dt4jY1ZtqDzVyLDh0yytbtbpjtq/2OTIBFeqi5ROaH5lUSSx6/9LLUYqZe+E2PsXzaiMfcWn3yl7hphwOsEc/KeyIU99E32NsaDh9nBHJX1xYe5bl8KpmdXQKFfqP3z4NxkokPbuLxWfXkaKaFg4rWPmr7ishQsxF+qk+gUk9Rc3CidaDhDZ0HTXQk7el6HF07YCDWrNrjl6KLwJ08E84AeGFf4j2+0hb1Ft7f4NMXox3PxUIoCZmWlwurPz52zAfk138lNe/A7QbAo4EA3HBNgKtzd9N3YdxKpRH070aztcW8JVA7X0mxtWrbj18Oqdld4FSaPOYRdezUN/WtCnlNzEECMqavl/BdctSzTUWCNVpo6P24VEL6BwNlixXKvrR5Oy2KQk95EwhI/K4R8//D0GdaRHBjI4pPYQxMhfJ8x4GiQAocuisPJTkppbOi7bBkyy76dlXs96ysVgn+e8LeW2+/4Xjrw=
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id fj7-20020a1709069c8700b00a3875804883sm925259ejc.124.2024.02.09.09.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:05:01 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 23A0810F505E; Fri,  9 Feb 2024 18:05:01 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
 <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC bpf-next 0/9] allow HID-BPF to do device IOs
In-Reply-To: <CAO-hwJ+UeaBydN9deA8KBbgBiC_UCt6oXX-wGnNuSr8fhUrkXw@mail.gmail.com>
References: <20240209-hid-bpf-sleepable-v1-0-4cc895b5adbd@kernel.org>
 <87bk8pve2z.fsf@toke.dk>
 <CAO-hwJ+UeaBydN9deA8KBbgBiC_UCt6oXX-wGnNuSr8fhUrkXw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 09 Feb 2024 18:05:01 +0100
Message-ID: <875xyxva9u.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:

> On Fri, Feb 9, 2024 at 4:42=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <=
toke@redhat.com> wrote:
>>
>> Benjamin Tissoires <bentiss@kernel.org> writes:
>>
>> > [Putting this as a RFC because I'm pretty sure I'm not doing the things
>> > correctly at the BPF level.]
>> > [Also using bpf-next as the base tree as there will be conflicting
>> > changes otherwise]
>> >
>> > Ideally I'd like to have something similar to bpf_timers, but not
>> > in soft IRQ context. So I'm emulating this with a sleepable
>> > bpf_tail_call() (see "HID: bpf: allow to defer work in a delayed
>> > workqueue").
>>
>> Why implement a new mechanism? Sounds like what you need is essentially
>> the bpf_timer functionality, just running in a different context, right?
>
> Heh, that's exactly why I put in a RFC :)
>
> So yes, the bpf_timer approach is cleaner, but I need it in a
> workqueue, as a hrtimer in a softIRQ would prevent me to kzalloc and
> wait for the device.

Right, makes sense.

>> So why not just add a flag to the timer setup that controls the callback
>> context? I've been toying with something similar for restarting XDP TX
>> for my queueing patch series (though I'm not sure if this will actually
>> end up being needed in the end):
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/commit/?h=
=3Dxdp-queueing-08&id=3D54bc201a358d1ac6ebfe900099315bbd0a76e862
>>
>
> Oh, nice. Good idea. But would it be OK to have a "timer-like" where
> it actually defers the job in a workqueue instead of using an hrtimer?

That's conceptually still a timer, though, isn't it? I.e., it's a
mechanism whereby you specify a callback and a delay, and bpf_timer
ensures that your callback is called after that delay. IMO it's totally
congruent with that API to be able to specify a different execution
context as part of the timer setup.

As for how to implement it, I suspect the easiest may be something
similar to what the patch I linked above does: keep the hrtimer, and
just have a different (kernel) callback function when the timer fires
which does an immediate schedule_work() (without the _delayed) and then
runs the BPF callback in that workqueue. I.e., keep the delay handling
the way the existing bpf_timer implementation does it, and just add an
indirection to start the workqueue in the kernel dispatch code.

> I thought I would have to rewrite the entire bpf_timer approach
> without the softIRQ, but if I can just add a new flag, that will make
> things way simpler for me.

IMO that would be fine. You may want to wait for the maintainers to
chime in before going down this route, though :)

> This however raises another issue if I were to use the bpf_timers: now
> the HID-BPF kfuncs will not be available as they are only available to
> tracing prog types. And when I tried to call them from a bpf_timer (in
> softIRQ) they were not available.

IIUC, the bpf_timer callback is just a function (subprog) from the
verifier PoV, so it is verified as whatever program type is creating the
timer. So in other words, as long as you setup the timer from inside a
tracing prog type, you should have access to all the same kfuncs, I
think?

-Toke


