Return-Path: <linux-input+bounces-2038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAF85F771
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 12:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA68281B43
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 11:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F9146435;
	Thu, 22 Feb 2024 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrt90nRk"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A147A40
	for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708602619; cv=none; b=GcgviE0fTjd/YxhihEEH8DYSwGdayZ2Oaarp7f55Zrc28Nus4qQfPoqRBAJBfXFZIx16GVhI6UNYoZWbuXmx9UAG7Rz5Mgshw9JyPychtEVeFzDAZP0JB75rn2cSiZE2dY4aiFyYaWfcNoiOCc7CvpvSp6+FuVegwBRTxAM/hUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708602619; c=relaxed/simple;
	bh=ma9DfQIGiAa5vr3ks75PfINXo2TPrC0w7A/88yi8pA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ck/g/qVjdeVgBhxNO4FX2M3MtqlUqB0/AquT6dUxlJxMOX2UlWlEakMuIiZC04cDcsn9fO6fRFFxel1Ye2qshn3+/zg/CFVBAfgjufmiWQ2OLQwEdHt4mewv6RKP6I/j1yW2jEahVVENZBv/V2sCaJm6tiUcVJ51iUAROurehaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrt90nRk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708602616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ldC5iLR/TjfHxpr5I8kE+2L9PTCMZ2jj1k9txMQpdfM=;
	b=hrt90nRkXMJU2uhYGsRzxnbsCelUZhBL4PN8IwevKm0NbP7Dib1ZvrtIOQrGSkMPXybDe+
	mDT3K+vh28yJQXmdVX4W8actnjQxW+HWNXk3R0xchuFs7Fmts3hm6C8++fye9+EycOC306
	OfbHZw3xLHYlgiQbxoTZAElFOTtEQT4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-xaFeP8qNO7et0oH9V3iZiw-1; Thu, 22 Feb 2024 06:50:15 -0500
X-MC-Unique: xaFeP8qNO7et0oH9V3iZiw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a3bdd99a243so79434766b.0
        for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 03:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708602614; x=1709207414;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldC5iLR/TjfHxpr5I8kE+2L9PTCMZ2jj1k9txMQpdfM=;
        b=KlNLedWHxSthco4gcERs2y7MbdB83WMUK0HRLOcy1Wcr+KXhDEQrj1UjAGTfX7900L
         9cTTSxxhaMlPXNt8GdI8N2VigD8GuoNEexxavpufCuTJFzY2ry0aSSxU+mAVsR6oLP/T
         Epk5JXUH0MEIqAP8nUiDWvt5NO5/F3l/zoQqWpriVUx5RrqX+cZ6g3PKjl30qKH9rCOq
         C17g+XsuUevmEvwlUGcgM/SH7GyKQA3KzwkNDTXOoxyhCsYARZxxFJgniXeyTQL+HmFW
         T3gjx9qetyPGeRG5pH6vfZoaiV+WyqnewTb6HA6Xcrtj/ZvaDg20B8pel91yUOMP4AAy
         lUpw==
X-Forwarded-Encrypted: i=1; AJvYcCU4egpzPtDIY/giea+Ys6Avu/QTISREpoW9AumDe9kzmKZhkzm9XNCH6nydu6msUJRPNBrZh8RiA2D3nfSXzhph72DzdUwXt1CKlBw=
X-Gm-Message-State: AOJu0YzoY0CEfkccQ9FwW7t0ylxViQfF3OTfJyCPEFMl6YCvpe6LA8II
	Au/HjXqDgbT3Dl4vlc1YyddRb+ArOB8rckAwYGPdz9ztDmZHpeymzGcQiWJn7uOBgCzUD2K9aeO
	Voz4nCJIx+W4UjGWuj7prfAzgnwSmZ2szS6p5rOobJvu8/BEVIGHjnxExCVRs
X-Received: by 2002:a17:906:393:b0:a3f:4ca8:f93e with SMTP id b19-20020a170906039300b00a3f4ca8f93emr2003788eja.24.1708602614216;
        Thu, 22 Feb 2024 03:50:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFqkM/gRLrevRcPSWpe7we5hg0Pbu6lFDxiRpmiSyGCXmYKdK+uwM9zZOtenBwAxZkzrXVHw==
X-Received: by 2002:a17:906:393:b0:a3f:4ca8:f93e with SMTP id b19-20020a170906039300b00a3f4ca8f93emr2003757eja.24.1708602613833;
        Thu, 22 Feb 2024 03:50:13 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906398a00b00a3f99497456sm259912eje.90.2024.02.22.03.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 03:50:13 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 63345112DEFE; Thu, 22 Feb 2024 12:50:12 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
 <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH RFC bpf-next v3 04/16] bpf/helpers: introduce sleepable
 bpf_timers
In-Reply-To: <20240221-hid-bpf-sleepable-v3-4-1fb378ca6301@kernel.org>
References: <20240221-hid-bpf-sleepable-v3-0-1fb378ca6301@kernel.org>
 <20240221-hid-bpf-sleepable-v3-4-1fb378ca6301@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 22 Feb 2024 12:50:12 +0100
Message-ID: <87le7chg5n.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benjamin Tissoires <bentiss@kernel.org> writes:

> @@ -1245,6 +1294,7 @@ BPF_CALL_3(bpf_timer_set_callback, struct bpf_timer_kern *, timer, void *, callb
>  		ret = -EPERM;
>  		goto out;
>  	}
> +	down(&t->sleepable_lock);
>  	prev = t->prog;
>  	if (prev != prog) {
>  		/* Bump prog refcnt once. Every bpf_timer_set_callback()
> @@ -1261,6 +1311,7 @@ BPF_CALL_3(bpf_timer_set_callback, struct bpf_timer_kern *, timer, void *, callb
>  		t->prog = prog;
>  	}
>  	rcu_assign_pointer(t->callback_fn, callback_fn);
> +	up(&t->sleepable_lock);
>  out:
>  	__bpf_spin_unlock_irqrestore(&timer->lock);
>  	return ret;
> @@ -1282,7 +1333,7 @@ BPF_CALL_3(bpf_timer_start, struct bpf_timer_kern *, timer, u64, nsecs, u64, fla
>  
>  	if (in_nmi())
>  		return -EOPNOTSUPP;
> -	if (flags & ~(BPF_F_TIMER_ABS | BPF_F_TIMER_CPU_PIN))
> +	if (flags & ~(BPF_F_TIMER_ABS | BPF_F_TIMER_CPU_PIN | BPF_F_TIMER_SLEEPABLE))
>  		return -EINVAL;
>  	__bpf_spin_lock_irqsave(&timer->lock);
>  	t = timer->timer;
> @@ -1299,7 +1350,10 @@ BPF_CALL_3(bpf_timer_start, struct bpf_timer_kern *, timer, u64, nsecs, u64, fla
>  	if (flags & BPF_F_TIMER_CPU_PIN)
>  		mode |= HRTIMER_MODE_PINNED;
>  
> -	hrtimer_start(&t->timer, ns_to_ktime(nsecs), mode);
> +	if (flags & BPF_F_TIMER_SLEEPABLE)
> +		schedule_work(&t->work);
> +	else
> +		hrtimer_start(&t->timer, ns_to_ktime(nsecs), mode);
>  out:
>  	__bpf_spin_unlock_irqrestore(&timer->lock);
>  	return ret;

I think it's a little weird to just ignore the timeout parameter when
called with the sleepable flag. But I guess it can work at least as a
first pass; however, in that case we should enforce that the caller
passes in a timeout of 0, so that if we do add support for a timeout for
sleepable timers in the future, callers will be able to detect this.

-Toke


