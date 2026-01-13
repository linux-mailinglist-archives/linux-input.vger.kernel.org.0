Return-Path: <linux-input+bounces-17067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB9D1B75E
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 22:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 356D43035A87
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 21:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFB030EF87;
	Tue, 13 Jan 2026 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX5fxWYo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B734AAFB
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340637; cv=none; b=GjfR4zN5tNlzzYiSDDWJlS8MoQoG6FSlB425mHNhjieoWJ4aZapiuVS8g1BeYXHxRqbmDNGc7JD/uQ/XXAKHRxI27y4o85199rGrNZdN1y5jMDbFgni7WxM4vAsyg7rG5BX/X568UQTxMcoOGUb3iTnygzfOadaKBIgXJ3T6Qso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340637; c=relaxed/simple;
	bh=7bsUtiUgKGUde2s0C0zgl5rK6a734yalkgEEbvzprU8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dM7LKexbZnFo+kRvlPi4DRQxcqlathMbhXpIYm8ZHyF32VxjbuvtufcWsNVN5EqTRxu/M7C3JYM4NHw45OrT9ZMQ6GtTRqjWKX2+//Xxc3DQSXXKrpFSHFa0XJhfFJTSj85AMQud+e4jPdQPigDNfWQAr5g/nLOzlsFyt8AuB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX5fxWYo; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so4378679a91.3
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 13:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768340635; x=1768945435; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PYn6o6R3QSwAggtOWvfLgCyBT+NI/AbWRIt35aBXUGU=;
        b=XX5fxWYoh2zuqsT9qzsPCHUujkkeQZyAzxHK+I2nP09zSGwNtSLXyx712YM1O+R0GS
         nq53ErMS8IL9xqWq4SQWyECVwrJvBcJHP4tDYi86PsuSbLwalkjuEcmFZIbD6F93iI+M
         RPPvZlFNl5lQZjmV1j7EugBLknfHTh3mi1MRzesiXdO6sRKkT/cV4Yypr6wRfenOqIw/
         SD0oWFN0rN1L77mHgc+ZUvRSecUN9GD/szZ8ZlKfwBvZuIvbXVHbk77VnllE5k2EiCSa
         /TrLMO08tV1mdktmTlI0Ak4ZN4MlhVQCMtdVUH2O+QtWhGYc8A2rl/N3ZZzMzxdMgD9P
         bX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768340635; x=1768945435;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYn6o6R3QSwAggtOWvfLgCyBT+NI/AbWRIt35aBXUGU=;
        b=m7qVhqlZOUMUQ7tzMr6zneLZvuCocIlUzu+WbCBIxyGC2W3gY6HxhR4jvronnP78OY
         QerAaRm2OFiGE0TtcDYkLgpVZjSjrDBTRcXuYEadN1igd22p5POTAj4ZqBfb6tmnUP25
         3qff5bua77zaQ44iO7J0cuYsPYMoN1ERjW21krEDbG/eBonmbq2fZct1UpU8Xuwj+dQF
         2dhegBiDr/f/iyJrW7tMN3zYKgltcefxQpYMQUhxwCsGh3SVv1pxSJeultBAKXKRJetg
         lxfRvix5g7Jf4P0Ci2m8uY4m0QmXRPiM9kfSkCRonaDWAJ6kCXdck5siFrkm4I21gwtM
         JZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxqfbQVfH/Rk4EFA5FV4ZQtj1pmh7FwKPlwkSkUdpPTGfQs+0hFVisE4L6KSRbzSbEPQ+uvohsoM+eGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmS196F2PCXZwXmYzM1mT9Cv0BRHSb86RWxNf8plKtl6ey7l52
	KjByLo5za8Yhhap9oGlmtcReYLKNJjtdNTINAZLvpUoGZDiZotS1cR0L
X-Gm-Gg: AY/fxX7NqeQqJ4hJnPRo5q9DB2+Cxe/BtdJzWvbPFmfjBDlh+LwEp/Dkny1RBBR1aQE
	Vj7TNBjqXXHAlEirIyPp1LY3ufg+QOyeMo4t3Ao7+UovcODaHzdRp7+nCSUf4z5561YwUIbtGjb
	1FzsGKD1f6tRbB8XEG4d01SlXQUvVflWDRAptM9sDEdtiPiCbpZaYIIR6tDkusRLqhc9mI1Ym0V
	xlUOsPsNT4IqWv7bEj2ndvwUeUYDdNTTzBH/qELze/MtmChRlXL4swgAIbGB1qEvSEVuUzIc0yj
	sD96jlT/dl4GxWv6Qnf2WJsr9oLy+/V3tLivy8QIfrtAWPvFlca/dTiKWirkBBKuMS/yt9Zu91/
	44Xz4Bzo4YIg/gI+oR8eZEH0CjIaeiM3o1NP63RRFAmOpylBmSWHZgKSDJnlLnDVMhUFHiN/MKR
	VncbUWaLqAZ71+IfA9sGSyekDS5vn0t84KJDzAoN3H
X-Received: by 2002:a17:90b:2e8b:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-35109086381mr473677a91.3.1768340635072;
        Tue, 13 Jan 2026 13:43:55 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-351068fe22esm364539a91.2.2026.01.13.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:43:54 -0800 (PST)
Message-ID: <6a9a60f292e3ce862accd782bd43f8dc2491bca4.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 01/10] bpf: Refactor
 btf_kfunc_id_set_contains
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-input@vger.kernel.org,
 sched-ext@lists.linux.dev
Date: Tue, 13 Jan 2026 13:43:51 -0800
In-Reply-To: <20260109184852.1089786-2-ihor.solodrai@linux.dev>
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
	 <20260109184852.1089786-2-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-01-09 at 10:48 -0800, Ihor Solodrai wrote:
> btf_kfunc_id_set_contains() is called by fetch_kfunc_meta() in the BPF
> verifier to get the kfunc flags stored in the .BTF_ids ELF section.
> If it returns NULL instead of a valid pointer, it's interpreted as an
> illegal kfunc usage failing the verification.
>=20
> There are two potential reasons for btf_kfunc_id_set_contains() to
> return NULL:
>=20
>   1. Provided kfunc BTF id is not present in relevant kfunc id sets.
>   2. The kfunc is not allowed, as determined by the program type
>      specific filter [1].
>=20
> The filter functions accept a pointer to `struct bpf_prog`, so they
> might implicitly depend on earlier stages of verification, when
> bpf_prog members are set.
>=20
> For example, bpf_qdisc_kfunc_filter() in linux/net/sched/bpf_qdisc.c
> inspects prog->aux->st_ops [2], which is initialized in:
>=20
>     check_attach_btf_id() -> check_struct_ops_btf_id()
>=20
> So far this hasn't been an issue, because fetch_kfunc_meta() is the
> only caller of btf_kfunc_id_set_contains().
>=20
> However in subsequent patches of this series it is necessary to
> inspect kfunc flags earlier in BPF verifier, in the add_kfunc_call().
>=20
> To resolve this, refactor btf_kfunc_id_set_contains() into two
> interface functions:
>   * btf_kfunc_flags() that simply returns pointer to kfunc_flags
>     without applying the filters
>   * btf_kfunc_is_allowed() that both checks for kfunc_flags existence
>     (which is a requirement for a kfunc to be allowed) and applies the
>     prog filters
>=20
> See [3] for the previous version of this patch.
>=20
> [1] https://lore.kernel.org/all/20230519225157.760788-7-aditi.ghag@isoval=
ent.com/
> [2] https://lore.kernel.org/all/20250409214606.2000194-4-ameryhung@gmail.=
com/
> [3] https://lore.kernel.org/bpf/20251029190113.3323406-3-ihor.solodrai@li=
nux.dev/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

> @@ -8715,6 +8730,26 @@ static int bpf_prog_type_to_kfunc_hook(enum bpf_pr=
og_type prog_type)
>  	}
>  }
> =20
> +bool btf_kfunc_is_allowed(const struct btf *btf,
> +			  u32 kfunc_btf_id,
> +			  const struct bpf_prog *prog)
> +{

Nit: I'd just add hook parameter to btf_kfunc_flags():

     u32 *btf_kfunc_flags(const struct btf *btf, u32 kfunc_btf_id, const st=
ruct bpf_prog *prog,
                          enum btf_kfunc_hook *hook)

     and allow passing NULL there, thus avoiding duplicating logic for comm=
on hook.

> +	enum bpf_prog_type prog_type =3D resolve_prog_type(prog);
> +	enum btf_kfunc_hook hook;
> +	u32 *kfunc_flags;
> +
> +	kfunc_flags =3D btf_kfunc_id_set_contains(btf, BTF_KFUNC_HOOK_COMMON, k=
func_btf_id);
> +	if (kfunc_flags && __btf_kfunc_is_allowed(btf, BTF_KFUNC_HOOK_COMMON, k=
func_btf_id, prog))
> +		return true;
> +
> +	hook =3D bpf_prog_type_to_kfunc_hook(prog_type);
> +	kfunc_flags =3D btf_kfunc_id_set_contains(btf, hook, kfunc_btf_id);
> +	if (kfunc_flags && __btf_kfunc_is_allowed(btf, hook, kfunc_btf_id, prog=
))
> +		return true;
> +
> +	return false;
> +}
> +
>  /* Caution:
>   * Reference to the module (obtained using btf_try_get_module) correspon=
ding to
>   * the struct btf *MUST* be held when calling this function from verifie=
r

[...]

