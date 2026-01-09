Return-Path: <linux-input+bounces-16910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52FD0C1F7
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 20:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCFC03004B82
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 19:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BD8363C7A;
	Fri,  9 Jan 2026 19:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbL+P9+V"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDE42E229F
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767988507; cv=none; b=qcBggmK9VrdwuIc1ZnuKEdLTNbE0c7e8Sqk38ky+i/+1LEXyRSYkwWoCxHmtxWj924S+OScM/V4HIYBP+/TDRaH6FxF7LIawo+vvSTjut89ZWEWyXRu/Oqy/fA9mwPtuUEW7qNYCxnMLbcg4G+YJuRegpxy8ashXOxa4dOoIJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767988507; c=relaxed/simple;
	bh=MhElfQne+j9lBSOteOTAImcd5y7CE11SkL50jXSh4kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy5o7t7VCndrqH0yPEgosktmNEleX4mclBq9Y5Fj1FoMyP9ewDDPUUa8HGLJN3cSyCHpI5/PthgkayN+/SUD7gXc5bDIumFF9E70SiUI9gy4RlnTMov/FzUXdUtY15ACMH3kM/S5dKoYNn/nkXBa9cmZgoFrvMHA/8RpTNY+uLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbL+P9+V; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775895d69cso23281245e9.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 11:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767988504; x=1768593304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBkPDONatTuGPl5aY/TAYsLDoFrF+bCOUtSOi52c1ug=;
        b=HbL+P9+Vu+AP48NnxDibxx1pXF0lVyU/Yxl3kHBFVXvXt7lGuTeRhuvz6Dq3pUJfIU
         vPBJZ6tRKNSBxsHUWkueuWRelxppmLfn1QYLWj/H7dOvNkQTJgCUyjvPaeNHBnCv136V
         k48RIdjk9bzj7nLQaCkr23M8CAsiKMuDF/uvJtsiwlv7gs4BIigx/XiYHg176viPJJFp
         XKS1vJsiRwl+enjWRxXglhF64zkuryr8GdlxAS+E7JyPJcuoK5F2TwpkA2z+rRkofSrF
         pazZ5MA+yAMq5s35vhBQ5vOWZt9x5SLp1M3uxcHs4YDbAHeJ241jBsmQvkldavv1jrq2
         xkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767988504; x=1768593304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jBkPDONatTuGPl5aY/TAYsLDoFrF+bCOUtSOi52c1ug=;
        b=b196OTi5bNUITKbvrEsWbR38wLaM2eiv14ox7h6rQL1zOgqzGKlNr+qiW52r2B3jCQ
         Y5CU24blSj4L670YjT+mfkhDbDMYgebdY4RZqdJp8/0Er6unMXIJ5rWZoYyuLJglHWTj
         P642uWHVhqS27jtgVh8RWBlGFhE6oobj4zNcOYfLmkzZ9JkrAcVybvuZ8fXSG4hzuiVP
         nmmVo85gepum7zna83oejmFcSjbhi0kZX8B1ju8xiGYW7NPijqRbw/olJa7tU5ueAVkx
         besSodTXOq7fU331ghnduqgZem9uflJHgVdgQkmkCAto+Z1YNHSyVXgYckLjErTCLlj6
         Cm3w==
X-Forwarded-Encrypted: i=1; AJvYcCWLpSV4zlwto+AkVXpV6eK9EH70uidNuP5OMz4ghKw08x7R25UYxY3ciZM5KQpRr/+Ts3kVn3xbwb479Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UxWYQb95y8L1ZkWUrauGCqINoNChV4mnuSnjp9T6iz+bgTRw
	SjrS9y4pe8Eqp/QvFYO5adn35c2NFXirhEjrqOgu1CxsC+pxVwgnKeNTEyikP580ah8yCwqb29m
	N7BoCPsFnd3Rmq/t9O8cnbB62tnfFu2E=
X-Gm-Gg: AY/fxX5h6Nn7llQY17kY6I1QoVFw9qh5jqH+smss2uYYCwAq3QDfCOVhhkTq3ortDi8
	rxTU4K27jrz3vp+q/76AcCKvuRcayg0DyMAeg3rEUpic7582XNGmYwC2Ut9qx7VOLEw/FiSTBjY
	QpRnbu9kBCcN+JwP1Wh8Llq71+rOxL3wUcYVfTnFvEj4l4Y7EMCOTlQ4SaaL7O0bHl7RL8VYx2B
	klOskG0BqvyImkZzJYg1JztRKc/6WLUZ3zwhwdkEf13e6p84giQsE57eZ4BaZHu1LesQDXcBzb0
	Mk6d0B7LJ5tFCZVgGRsMyPIQda4G
X-Google-Smtp-Source: AGHT+IG/EZRLQONxvapFw3RQndcGZicYBoimPYye5AFD2yn9qZIvRV/9nvD07Us9CjbpRX96Rtf3b1sKeTS6kQdLu+M=
X-Received: by 2002:a05:6000:2f81:b0:401:5ad1:682 with SMTP id
 ffacd0b85a97d-432c377c19emr13483755f8f.14.1767988503788; Fri, 09 Jan 2026
 11:55:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev> <20260109184852.1089786-4-ihor.solodrai@linux.dev>
In-Reply-To: <20260109184852.1089786-4-ihor.solodrai@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 9 Jan 2026 11:54:52 -0800
X-Gm-Features: AZwV_QgQhMZNtddtaPEGfXd-u2d00hNwXFesS-EHcJxSG5vDE12dKLQL2hWx4Io
Message-ID: <CAADnVQKAfFe3=1-D9heEsya-v+bX-GnUbaqe_nYf0tkZNde_pA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 03/10] bpf: Verifier support for KF_IMPLICIT_ARGS
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, 
	Alan Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 10:49=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> +       if (unlikely(kfunc_flags && KF_IMPLICIT_ARGS & *kfunc_flags))

Please add extra () around &

that's the style we use elsewhere. Like:
if (!first && (env->log.level & BPF_LOG_LEVEL2))

> +               if (unlikely(KF_IMPLICIT_ARGS & meta.kfunc_flags
> +                               && is_kfunc_arg_implicit(desc_btf, &args[=
i])))

same

pw-bot: cr

