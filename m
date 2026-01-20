Return-Path: <linux-input+bounces-17206-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCDD3BD51
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FEC83004E1C
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F83D23EA8E;
	Tue, 20 Jan 2026 01:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIDy9+54"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BCC246774
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768874242; cv=none; b=f5xiYbps9+7GBik0YXdtMdOJzCrXZkkDVp8UnNWzdnMJOjfYKvyQSjhjW5YasUc/ovM9yviR071dtdNMKZfUOkwLyFxOrYjTd2y7TPp+hOZaZ19SzLoOPqORJmj/3lrImEx8FC4QfZNjM0D3/ymotjYZTneCFGJAz827eJVC4KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768874242; c=relaxed/simple;
	bh=DFMDqIBxWMeUoPAyaqN8hr45MYvMg+GV75NoJCt74uw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UTtYv2vZ63EhljVcfQRjIIi4C+c53MVukJIvwf4uWQRWrJfhXmPGj4oPjmcmNkfTbQM0LWyT4hJrF/AMPAqzFgjmIPBep95ALqed2LnE4c0dmd1IU+xzjaVQzb+SdwmA1xt/XTshM74y3fTY9jga/lkusOaRfYv3dkUVPZA2DJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIDy9+54; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ae255ac8bdso8856331eec.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768874240; x=1769479040; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bs/xgeR13/qdRJT1LBeIlLMVbrV4KZcmi7z58cgPbxU=;
        b=iIDy9+54vZ9ewD7Fm0h0j5tmWFa3iq6PJLF7JHaogTfB454RoRtVLziN8eK5P+DFLa
         By3QmH/qhvCrmE+AeeXZ2n1ACEMpwGnB4Om7yuwvUPmmlWCQRKstHWl7K8OD2jbzCGbG
         PLoSggN4BQkYw+COFI2EKumwVoE890wqfQLj8v+HSs8jvtJJ7tn5ZmjUrtYeoutmo00G
         lerMqk78NZsl5XEXBcbNrehKnquE28dZ7v545UCdZabjn2h4DmQLjZ9OHo/pOVwAq71O
         nlKT0hETRbWnzJy3QrPVyWYWqF+L+/sqVaengoCFctyBEtceBsYyPKDacqa/ea2BAVDg
         /fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768874240; x=1769479040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs/xgeR13/qdRJT1LBeIlLMVbrV4KZcmi7z58cgPbxU=;
        b=T/rWXFrel3aY4XO2w33mI+x5wk3AtLUH6oHN/Nrs4jMkTnk2UvayIkYcu/veOW1rUo
         hs0iwBYNxsGOuwId4lRwcShLwdyv2q0NGlywdCtnLjVrwuR1brsjAphte/DNdWgG/UjA
         VnIX6n26wfYEMilKUx6q9sAwPYr+br2cO6FF+/Tvg5VeZWshW/Q7NLETsZKlms9kNu9s
         UB5pLsuRFHEALs+BcfkneVVcy8hRGY4xHapzDMvhc1ZdV11nxxd+Uwvcd8lB6iMXgphB
         0JhEbadzRX3JJMNomYbzD7ONKWfp6c+YQ9HUUsz+2v5oP+gbuFIyvGb8jPlHg0Dm6HEE
         NmPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7KUuOFGDVczcwzf5NcP2VNcCEKPMEgbmybsNWtW6fy3ycjDtYkY+YxLA7Oi3LOXRQBIrxdQvH7aOafw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dtk+pIbjnAu4iMxtaTJUTA5g0bKwelgp+HpOiD+7y53ElIiE
	DFGpqfh5lFfy8rulKwDljaAH6jQuRr0ruscRdY7Lei6WlHSmyIqH3Ta5UvrNwNIU
X-Gm-Gg: AZuq6aJpwwhIsOYXIYsNTBivghPl3qMbwVnk8OMyansNFo7SkFaB4SylmX/R6zJIbEo
	sGxYUETSDCP2HleaxRliw/SXtsuC+I6mrBPh01wsSs8BUlerUe5mliQq5FFObjvlwP0jfikOAkq
	Ma+PMG0HlinHHu9ADH+DuadfcfXGHa4WonuhSapR8tk891h/zem0VwAyoelj3aWfMd2c523yinx
	5nsfDRTAXn60glnRLRJFCFFkoMxVhadvbhOqkQ29zZm7RF8gcw+MuSCM7Fy8jk8GAl/QUPKcxg5
	rOcNi6mlwMkINW7cmWfbZ2WTcw9sLM2IDIo9NhdIFZrLjts+8p7IY+4j/+AaLKqo56C5QSKc/fG
	pEPBBrBHnK0jSezdJk5Hl4k1rV6CodtC3IeQDdBAB31vo3VyJumO25kafJQhd5oGp7kxlLWzAwf
	ZmulTNQ+A4M1xMqSP/99cBHud8/t38oWc/iVUsGx3zLYk+fr3mHP4SPVqJK4BCRMIBEA==
X-Received: by 2002:a05:7300:dc85:b0:2ac:2480:f0ac with SMTP id 5a478bee46e88-2b6b40d991cmr8107963eec.23.1768867408672;
        Mon, 19 Jan 2026 16:03:28 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3679980sm15230498eec.31.2026.01.19.16.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 16:03:28 -0800 (PST)
Message-ID: <e2d174e79c4550fb7251f29351f1fe5afb812328.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: Verifier support for
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
Date: Mon, 19 Jan 2026 16:03:25 -0800
In-Reply-To: <20260116201700.864797-4-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-4-ihor.solodrai@linux.dev>
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
> A kernel function bpf_foo marked with KF_IMPLICIT_ARGS flag is
> expected to have two associated types in BTF:
>   * `bpf_foo` with a function prototype that omits implicit arguments
>   * `bpf_foo_impl` with a function prototype that matches the kernel
>      declaration of `bpf_foo`, but doesn't have a ksym associated with
>      its name
>=20
> In order to support kfuncs with implicit arguments, the verifier has
> to know how to resolve a call of `bpf_foo` to the correct BTF function
> prototype and address.
>=20
> To implement this, in add_kfunc_call() kfunc flags are checked for
> KF_IMPLICIT_ARGS. For such kfuncs a BTF func prototype is adjusted to
> the one found for `bpf_foo_impl` (func_name + "_impl" suffix, by
> convention) function in BTF.
>=20
> This effectively changes the signature of the `bpf_foo` kfunc in the
> context of verification: from one without implicit args to the one
> with full argument list.
>=20
> The values of implicit arguments by design are provided by the
> verifier, and so they can only be of particular types. In this patch
> the only allowed implicit arg type is a pointer to struct
> bpf_prog_aux.
>=20
> In order for the verifier to correctly set an implicit bpf_prog_aux
> arg value at runtime, is_kfunc_arg_prog() is extended to check for the
> arg type. At a point when prog arg is determined in check_kfunc_args()
> the kfunc with implicit args already has a prototype with full
> argument list, so the existing value patch mechanism just works.
>=20
> If a new kfunc with KF_IMPLICIT_ARG is declared for an existing kfunc
> that uses a __prog argument (a legacy case), the prototype
> substitution works in exactly the same way, assuming the kfunc follows
> the _impl naming convention. The difference is only in how _impl
> prototype is added to the BTF, which is not the verifier's
> concern. See a subsequent resolve_btfids patch for details.
>=20
> __prog suffix is still supported at this point, but will be removed in
> a subsequent patch, after current users are moved to KF_IMPLICIT_ARGS.
>=20
> Introduction of KF_IMPLICIT_ARGS revealed an issue with zero-extension
> tracking, because an explicit rX =3D 0 in place of the verifier-supplied
> argument is now absent if the arg is implicit (the BPF prog doesn't
> pass a dummy NULL anymore). To mitigate this, reset the subreg_def of
> all caller saved registers in check_kfunc_call() [1].
>=20
> [1] https://lore.kernel.org/bpf/b4a760ef828d40dac7ea6074d39452bb0dc82caa.=
camel@gmail.com/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> @@ -14177,8 +14223,12 @@ static int check_kfunc_call(struct bpf_verifier_=
env *env, struct bpf_insn *insn,
>  		}
>  	}
> =20
> -	for (i =3D 0; i < CALLER_SAVED_REGS; i++)
> -		mark_reg_not_init(env, regs, caller_saved[i]);
> +	for (i =3D 0; i < CALLER_SAVED_REGS; i++) {
> +		u32 regno =3D caller_saved[i];
> +
> +		mark_reg_not_init(env, regs, regno);
> +		regs[regno].subreg_def =3D DEF_NOT_SUBREG;
> +	}

But we still need to understand why .subreg_def assignment can't be
moved inside mark_reg_not_init().

[...]

