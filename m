Return-Path: <linux-input+bounces-17208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78713D3BD5C
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 752FE30275BD
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED02950276;
	Tue, 20 Jan 2026 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ctv6lz9Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0CC239E97
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768874356; cv=none; b=nD8itOHitLCg1jgu5iSbQQnrHaq9o4yU7HodMRj9/IJC/rLR3WOXQjtvnfiJaEsS22sBA8Win7/KihiF/5Muk/KXH6G/6nzV9XVNVprn2V3OjmW55RbUCzYemQe8cVCZ5UEFmk+FUtfKGp6Ct4O8OQi6CWLCXzPOa2NBRPEvl5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768874356; c=relaxed/simple;
	bh=/ypGC+WkDvaV86uL7voGQH80EohW3oPSiZBDDyKUGiU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDSivcMCpecfFriZrqxWp/7pKvwLHdyKazXosia1GdAhueAkbm9Z7McCOcvM4mzCRgv6pCUqNoA1zzZnuNTlOrby7nPg8VVDHDYIOJONf9768DjM83wg+fTeobjDB1uPwnSSCq/GTn55B8yMbMwzbvbvwCN8PhVpq5+qfiK4pTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ctv6lz9Y; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b6bfb0004aso6728243eec.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768874355; x=1769479155; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ro4K9Yk3fPlcxbI6QmI+2ZscW+L6ew8kitsc7QheUG0=;
        b=Ctv6lz9Y1uk+0ohDzpzI17Gs+nj+PQKeYlxQ4JFlLaM8fCFWqRCs4bh75AirWefyOy
         V3Ou3uUQhEVA4a77lT9ybB4dAwAiLKFvjbkhNp8S0PiScT0OqlDafziyKUUdZAcOy73Y
         zt4ZrqEjbq/Xa4F2QlxrzPrkL0SxQJdkjRsYDw78x2Y7dXMlPHgowd3/Ca01b7gGQ3sg
         VxMMocrHNm7sT+X+1oL2Y6G8qBtSDUF1rjI4GKDcm2mNqwj8CRFCxnNKx4kK81j+UO9g
         A15itMFlS0dmT3MUJuT/T3Y0dWsZwrH0k4ORh6L6rZlz1Yz551kUvZfae1mSiKNaml4R
         0TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768874355; x=1769479155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ro4K9Yk3fPlcxbI6QmI+2ZscW+L6ew8kitsc7QheUG0=;
        b=R3t0wBgTXvJKaiX1IhKCwoXw/JJypruHP8RVpMh3ppOHxhoOgQst8fUCI8MgmyszXA
         FV3DZZeA9pKLJT+wDSt6J+MyTQuUbjtX1G3w7nYwBEP4Z0OQF64tKet4i9ZHnCLQ0egb
         kDDSfBaYDrPjfoGzlnn411bdV8EcH3WdLa/+3qJEqDFdgKIAKYEAekxRXYKVv4dLic1d
         MAlOopdV/jfKdufP2uRYIZJr6PNSYTpEX8078SdJkWDThcttU1L+XlFSkbBXuK99VluV
         GKZL2Ql/A9MgLpgtIrCSx5GG1OoxWJIfoBJirxUDcsWmDJxYoWRfcF+R3N3blaaU731/
         eR5g==
X-Forwarded-Encrypted: i=1; AJvYcCXs8ZxdgqpgmpOsXxWniA7gZgKMqbGwOwRI8kTvSXKZypJTkygzAQ1XDVzkKDrsZQTLtK8DVaAzrX30eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+unWibhk1Ofu2KuajeP0Dp74+QL7lMgHGfo2088ii7QKqWaKT
	ZINjnGjljoEfm5EbfIbJkjn6F845h5H0PgrVLfKpDyRQZf3PlSU15RHr
X-Gm-Gg: AZuq6aIRwl1xiw7yqPva80gOhe5cEcc0Qx52cY/kDj7jSzEsqlpzxwa7jpyXg01rIAQ
	02bgyoYtoIBzBfF7yNQ+6D4pSSMCmrsTmahtHdGb/Z3+llN6hvdYNC4YGtkgxCvKxg9a5qztzDx
	A5rAGFMkQOmI1qQN6KhpjyT0eDwCqFbK2NkmJWNqWDZ/R7cZ+AIhuXoFSJy6duuB2ADOIAtzo+R
	Vqfs+PpnW2YC8ZWftlTGnDcP/TcSE2WIZDQAtjm7DF4jaub+3TYtawWF0S/OILUaoLdex34xIvl
	tXlbRKeXpluPBRVgGgEaA9p6RMmwTsizKPJjZWTanEHvZvGslJ1XyDsF/uHn8aPYSZpQfRvj9S2
	i+n0jd01aiYdUIG4oM6AgHTbR9z5wlVe0YksNPYuHYhbjIt03XtQrmngTrdORX1lRpOm+hLXdIo
	ZJsMSupxnhxWR7q7xHNGxBVaH6uYirPc89HBBEx3dNqPfhw5Zu5WaA7rr7e4vALT/YIg==
X-Received: by 2002:a05:7300:7c13:b0:2af:7ee:5300 with SMTP id 5a478bee46e88-2b6b3f30eb7mr9885041eec.14.1768874354858;
        Mon, 19 Jan 2026 17:59:14 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503a30sm16898801eec.13.2026.01.19.17.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:59:14 -0800 (PST)
Message-ID: <b5fef9672be4395b76619b8bd39697bf28b93350.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 11/13] selftests/bpf: Migrate
 struct_ops_assoc test to KF_IMPLICIT_ARGS
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, Amery Hung <ameryhung@gmail.com>,
 bpf@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 	sched-ext@lists.linux.dev
Date: Mon, 19 Jan 2026 17:59:12 -0800
In-Reply-To: <20260116201700.864797-12-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-12-ihor.solodrai@linux.dev>
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

[...]

> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h b=
/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
> index 2357a0340ffe..225ea30c4e3d 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
> @@ -161,7 +161,9 @@ void bpf_kfunc_rcu_task_test(struct task_struct *ptr)=
 __ksym;
>  struct task_struct *bpf_kfunc_ret_rcu_test(void) __ksym;
>  int *bpf_kfunc_ret_rcu_test_nostruct(int rdonly_buf_size) __ksym;
> =20
> -int bpf_kfunc_multi_st_ops_test_1(struct st_ops_args *args, u32 id) __ks=
ym;
> -int bpf_kfunc_multi_st_ops_test_1_impl(struct st_ops_args *args, void *a=
ux__prog) __ksym;
> +#ifndef __KERNEL__
> +extern int bpf_kfunc_multi_st_ops_test_1(struct st_ops_args *args, u32 i=
d) __weak __ksym;
> +extern int bpf_kfunc_multi_st_ops_test_1_assoc(struct st_ops_args *args)=
 __weak __ksym;
> +#endif

Nit: wbpf_kfunc_multi_st_ops_test_1 change is not necessary, right?

