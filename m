Return-Path: <linux-input+bounces-17211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07CD3BDB7
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 03:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7C1E342D9A
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D9E2C9D;
	Tue, 20 Jan 2026 02:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqtadPKJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077552D8370
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 02:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768877675; cv=none; b=g4I4klTJdPN+tTVamO3KD9cShKoc/+aftI9TM0oEKQUUsF3LKxKqEHIlOwrdLd2bQYO9OtKi3IJPz4kp15FmSQix1WmLdpnYksTS9L5tOT8TrT/CNca02Z7YCuNSfLt2orxobAsRx4P6jgZlJJ7GRFFFkyE6gunVxfiZe04u3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768877675; c=relaxed/simple;
	bh=If41zOkOP0scm5TZMIBjYL64Hb+I+qeK3M1HiwITHfA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DqUj+esh3ax2unzumcTzZ/e7pBbh83FfQvf7IhBezskrJDVlTdT/FsL5z4i8H9cbpDtbI/1pAsjRasMYHgwMeAFPhZpajxyjvzsDc5iDBl+k3LjAqMqFaevaVYa/UbYjsJ9cVzwlUcmhmlqLTThvqelrcXerYs4WOPCWc9Fzmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqtadPKJ; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-11f1fb91996so11245681c88.1
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 18:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768877673; x=1769482473; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3odNBdrf6aEyMBCFvJIVDjybvUoKRUaMAkhxu2qWeKU=;
        b=YqtadPKJwjqMfgMxevDf7dXUbHGWn6W7uAoox0cE/jT0UsDpFmnQnnOH0uXCYPyVHz
         nPlodgvjkVSLwZeU/3CQjy9ulonkhEYvDvLOzeffG2i6h3L+JkY+KNBaXHGXv0cUolYE
         iAnUiL96usXSNkQK28ogZQeS3+PnQIPUrl+1yaivSEw14nza2+n8w+TNdxwBovq/JTau
         gmeClhzbB+A6dM6XyvbDx9KZ+S9D7IadRbOopkz3zgR9I3BdjXS8BA4m/oKcFwpOIGMy
         jwes11S2m7l7WAkGxeLbeZxF4Ci+d/h6FZN0WRGKNx7kvxhN9Hx5uhO5W2HmxFQw84gX
         XDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768877673; x=1769482473;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3odNBdrf6aEyMBCFvJIVDjybvUoKRUaMAkhxu2qWeKU=;
        b=d1DLkcgAa2uSKK7sLt0ICYpqomg98sSE4qnorHAa2MGZnPc3NNzFIJdM+2kR9HLAk0
         OBCydutQVFcSO1ZSHf0sJ+aWWkjZVkdASW6TwL5350Z5Q/0jqfoFt9YjxIN4x6/iGdce
         rRsyHwTyZbJq3QiJiwS5XBwayAE8ucIuHMSPYMQB4VE+/CCvXc/RWp7MKOCfNAkxLWNl
         qsB9CGRMCI17Mjxk+2RTBt48HuA+q9Rf8DOCQCc9PjNvY56F92nqJr5n5IIrIrF0jNsS
         ypzcpViRyh1cOufLlt3UiSilXMH8vplzMKx4KibIBSVSmujyCxneH2hvwh0qkqVLFqg4
         acPg==
X-Forwarded-Encrypted: i=1; AJvYcCWlKZUBIRtZQgsvhzkFnQhHbYqFMv7e6TDo0FH+d53LSd2Ct/22boUDHDn9N9ZhpXYlz/q0S/4SpT8KEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9TWBeEtSf1P6JPHdWU33GsoJu+QS2Ekp8QElYARW1SMLT+e83
	KbOj4p19SP/Fp1t7YZH7EqEFd45UzYNe1HX6Apum9fZRf2DGv+NtWUT2
X-Gm-Gg: AY/fxX56N+bj9CC1hlYHg+A+RvfrUssuqPz6txK4+UuiRUNH0O0QcyPNXVCA63LIwBR
	QVJKPPhF7unIFyjQEJsUSBCCWA+45KPAM2sy1Nb5FNZdsg+iFLYcs+vDcFpPhwVvA6j4bqFDKXz
	8YTQLapd+foqDPAQvF/ypfvBFApA+h6SKkNJApHutS9nBNMzWdaxyyFEg38S8JZ7r76O4g1yeDT
	W4oMf3QvUHcLBdosM6ffntJr2UAK/7E3JhZwP3doqm8ToP6RJFYVmrQsP+8cpQ/lhX/cRkG9cwm
	kIsLwN70rcoIivwcGcTyvHBL3l1VovnJZCNMio7Rhc3CUUH+34hvxuawDZFuuhvZSTBTOxfiusX
	pFtbkAt7TFoWb9IX+IOS0j6A/kyVBW8wC2pzdMCYfE6tMcRc030hIDkkkP10w6GQ9NY1qV5a6CW
	2bKVuUd++SFXt2we6fP03OBvrI3oS/awyP1Qbpw1hkuRnd3k/4veDFSeZ6baAxeXtm+Oi2j0iOn
	b41
X-Received: by 2002:a05:7022:6084:b0:11b:9386:a3bf with SMTP id a92af1059eb24-1244b394b96mr9022978c88.42.1768870562325;
        Mon, 19 Jan 2026 16:56:02 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad740c5sm19462181c88.8.2026.01.19.16.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 16:56:01 -0800 (PST)
Message-ID: <c370026bdcb3c2684a5c5c5a9e173f8c3e2189e5.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 05/13] resolve_btfids: Support for
 KF_IMPLICIT_ARGS
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, Amery Hung <ameryhung@gmail.com>,
 bpf@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 	sched-ext@lists.linux.dev
Date: Mon, 19 Jan 2026 16:55:59 -0800
In-Reply-To: <20260116201700.864797-6-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-6-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-01-16 at 12:16 -0800, Ihor Solodrai wrote:
> Implement BTF modifications in resolve_btfids to support BPF kernel
> functions with implicit arguments.
>=20
> For a kfunc marked with KF_IMPLICIT_ARGS flag, a new function
> prototype is added to BTF that does not have implicit arguments. The
> kfunc's prototype is then updated to a new one in BTF. This prototype
> is the intended interface for the BPF programs.
>=20
> A <func_name>_impl function is added to BTF to make the original kfunc
> prototype searchable for the BPF verifier. If a <func_name>_impl
> function already exists in BTF, its interpreted as a legacy case, and
> this step is skipped.
>=20
> Whether an argument is implicit is determined by its type:
> currently only `struct bpf_prog_aux *` is supported.
>=20
> As a result, the BTF associated with kfunc is changed from
>=20
>     __bpf_kfunc bpf_foo(int arg1, struct bpf_prog_aux *aux);
>=20
> into
>=20
>     bpf_foo_impl(int arg1, struct bpf_prog_aux *aux);
>     __bpf_kfunc bpf_foo(int arg1);
>=20
> For more context see previous discussions and patches [1][2].
>=20
> [1] https://lore.kernel.org/dwarves/ba1650aa-fafd-49a8-bea4-bdddee7c38c9@=
linux.dev/
> [2] https://lore.kernel.org/bpf/20251029190113.3323406-1-ihor.solodrai@li=
nux.dev/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Patch logic looks good to me, modulo LLM's memory management concern
and nit from Andrii.

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

> @@ -837,6 +854,369 @@ static int dump_raw_btf(struct btf *btf, const char=
 *out_path)
>  	return 0;
>  }
> =20
> +static const struct btf_type *btf_type_skip_qualifiers(const struct btf =
*btf, s32 type_id)
> +{
> +	const struct btf_type *t =3D btf__type_by_id(btf, type_id);
> +
> +	while (btf_is_mod(t))
> +		t =3D btf__type_by_id(btf, t->type);
> +
> +	return t;
> +}
> +
> +static const struct btf_decl_tag *btf_type_decl_tag(const struct btf_typ=
e *t)
> +{
> +	return (const struct btf_decl_tag *)(t + 1);
> +}

Nit: there is a utility function btf_decl_tag() in bpf/btf.h
     which does exactly the same.

[...]

