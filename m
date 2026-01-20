Return-Path: <linux-input+bounces-17201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B6D3BD11
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCD793023D5A
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BFD4CB5B;
	Tue, 20 Jan 2026 01:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWUlbWpJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840C1E487
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768873712; cv=none; b=O1QeBRTOZ78XJWvXFJnZIZnNdMQfiH8HkacOrfqUnDeBXYKBv9kDb6HVUCJywjwWg1PxT4S2ZmC1xerTlM5VR0H1EvG7Zb6sM0t+3gBTqh2RFbIBufdWiKaXuH8kp3PNoKGkUhmXGtg+EomxKYK0hVRlR7bDasYGowNj00p1wT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768873712; c=relaxed/simple;
	bh=h1bzrV3t+W8hh2TRR/gZqlbk4hfM8u7QilZdJ5qMIjs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ih/n7f7Il/Wz6StVRPXhUN+xabrnrcUydrfY/gz5DmMDHh3COq5lFKvgIK/kMtqvVXiTfoYnVYiP8ND+4ZQni76UnRVFc7I7uxKIe30zg6KODmLSsH8uPomHqrqHACs3SYM+7Y87iRDi0BvO+GO0V3HhxFvMtKEjquIpWB5yx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWUlbWpJ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5014e8b1615so50273161cf.3
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873710; x=1769478510; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C5BHzdBy9bZIqFc6VCkjIoouQALwj1cU2ODrGGe4Wds=;
        b=kWUlbWpJFBxDrayQadmbHfVkiSOa0oQtaQ3AjvSNuc0RtAkbsO5NvWF3mZ/xpsXHtn
         gLAuEqFwbhsfiiJiVtBQDXjF3JIlBJ6IBxgYBbBPx0o+Zy65/LjwO070pFYD+W1KnU0J
         PDrHLBKkQMez3TdgSWLpdzcAxZ7Hc6YrHuNnogOuODk5ImiH6jqJINYMi+vhk5T8p1rH
         f9Q41jmr2uCNFjOrA17Cj+q8LKTZxO0XfGf/1xCbRIB6ppWOO9YaZR8RuDzOFGemr4YD
         rnILFf9qdGTiJ6Pgw9AyAv3bZB/J9EeGMkankA1xXP0u6kVxnd9eY/QrCZgcUl51JVmI
         f+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873710; x=1769478510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5BHzdBy9bZIqFc6VCkjIoouQALwj1cU2ODrGGe4Wds=;
        b=u5kh+/JQ+uq9QGCLNp9TkXjyg5bMNxOp2sKYn2ektgtdUrTCiW5QbjMfmJgkKBcQoT
         QnrRUNO8Kz+1UxT55HtT1gCeWU2qqIKSquGGNUdicln261vAkXmHMsI0bP9LZCw9eb2j
         JOYCcO8W+aWgwiIo34bmpPGUjwW1VhekOuHM/X+THZ45UKvtnoYQCx5izYLyxIFvu0D8
         R90peoKEo11Ac6bNJxAOLDvnpmAe9WQ5Dh5B1jAnXUXyv0akMyQ//yBTyZ/K7cCEAv4k
         U8ANpMiRPofri1Owtk3LkQv26qV4HjKi2721sw2N8yGHDSsxv/JZ79N6kzM+NZZVs7gm
         lS2A==
X-Forwarded-Encrypted: i=1; AJvYcCWdB0vAfIp9WtXNvb+ptw9Be6ssQrS9zzhBCJu9iyjnJahGN+ozHkFuenTxpFayr2ICh1dQSXKxYQdjYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFyBJtB2Pf1MYmWl3yBWLHMm5KpGevdKcWjAw3Vt5CFrz4i3V7
	9YCSbFchmvB8Fgo9U0fNLA5aa9ZIo1k+aUlCaar5Z7vDsioEgLgod2w/5RKhVYDI
X-Gm-Gg: AY/fxX7qjRz4xKivDwhNicz6fP+MpB0kXIOWh90ztNX9in+Yx695JMo/+Qtts0T4ujR
	XWNxoQNU930ruqkus49Ws4XzxtOUpuk38AssCG2FKrdNBwON51ruXhsS9sHkonTuFCABG5MJ0f4
	xrUpjsCM43YDD1buwmoOmyktXAreDw4qgZlC/m8xYHle8Qxl24oK7R5yIrxcTt/G9+l3zK9lHqU
	6UfJA7VI9hPO9d68xro1VkOtpKSBYpsrDHbbDdFVxLXNy2ipLebHEUA+kq6jkvNJwuDNAcd2Z2a
	UtWOQ/hr3jxVxkbKuAOv9KkEFTK1D8mkJa+Qhi2oOBeq56rrtQL0oA3B9rm50THVGghKfPe6EsQ
	MaEZTdozo1kc+0gjWKuImwzv88pmlY9p183ONO1eyvZXBx+jMc8f11SD2Es6vlyqs62IK7mCtGz
	HhliuIPDqyaocWvPRt0iEkANlfCZs5EAzS/IBvm9CEdScwtCgF+Zxfo8Sxj/ov/fmrSg==
X-Received: by 2002:a05:7300:6c89:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b6b4eaddf6mr9036820eec.36.1768868006151;
        Mon, 19 Jan 2026 16:13:26 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm14832564eec.9.2026.01.19.16.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 16:13:25 -0800 (PST)
Message-ID: <c404446ab6d344338592dfa44f5a7e1b95492564.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 04/13] resolve_btfids: Introduce
 finalize_btf() step
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, Amery Hung <ameryhung@gmail.com>,
 bpf@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 	sched-ext@lists.linux.dev
Date: Mon, 19 Jan 2026 16:13:23 -0800
In-Reply-To: <20260116201700.864797-5-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-5-ihor.solodrai@linux.dev>
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
> Since recently [1][2] resolve_btfids executes final adjustments to the
> kernel/module BTF before it's embedded into the target binary.
>=20
> To keep the implementation simple, a clear and stable "pipeline" of
> how BTF data flows through resolve_btfids would be helpful. Some BTF
> modifications may change the ids of the types, so it is important to
> maintain correct order of operations with respect to .BTF_ids
> resolution too.
>=20
> This patch refactors the BTF handling to establish the following
> sequence:
>   - load target ELF sections
>   - load .BTF_ids symbols
>     - this will be a dependency of btf2btf transformations in
>       subsequent patches
>   - load BTF and its base as is
>   - (*) btf2btf transformations will happen here
>   - finalize_btf(), introduced in this patch
>     - does distill base and sort BTF
>   - resolve and patch .BTF_ids
>=20
> This approach helps to avoid fixups in .BTF_ids data in case the ids
> change at any point of BTF processing, because symbol resolution
> happens on the finalized, ready to dump, BTF data.
>=20
> This also gives flexibility in BTF transformations, because they will
> happen on BTF that is not distilled and/or sorted yet, allowing to
> freely add, remove and modify BTF types.
>=20
> [1] https://lore.kernel.org/bpf/20251219181321.1283664-1-ihor.solodrai@li=
nux.dev/
> [2] https://lore.kernel.org/bpf/20260109130003.3313716-1-dolinux.peng@gma=
il.com/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

> @@ -1099,12 +1116,22 @@ int main(int argc, const char **argv)
>  	if (obj.efile.idlist_shndx =3D=3D -1 ||
>  	    obj.efile.symbols_shndx =3D=3D -1) {
>  		pr_debug("Cannot find .BTF_ids or symbols sections, skip symbols resol=
ution\n");
> -		goto dump_btf;
> +		resolve_btfids =3D false;
>  	}
> =20
> -	if (symbols_collect(&obj))
> +	if (resolve_btfids)
> +		if (symbols_collect(&obj))
> +			goto out;

Nit: check obj.efile.idlist_shndx and obj.efile.symbols_shndx inside symbol=
s_collect()?
     To avoid resolve_btfids flag and the `goto dump_btf;` below.

> +
> +	if (load_btf(&obj))
>  		goto out;
> =20
> +	if (finalize_btf(&obj))
> +		goto out;
> +
> +	if (!resolve_btfids)
> +		goto dump_btf;
> +
>  	if (symbols_resolve(&obj))
>  		goto out;
> =20

