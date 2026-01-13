Return-Path: <linux-input+bounces-17069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14861D1B81B
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 23:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A3733035CE1
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 21:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5593350D61;
	Tue, 13 Jan 2026 21:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9RH8xyH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A166350D4A
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 21:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341588; cv=none; b=tEupy+2VdnIG3h2Xqk3WSXv0X1KnMRpt6s/pjxDLPDemNn2nyyiTFQxV4psNCQIOzj8mL9TBbUZuu8EwH5DwjMcZNpP2c2LjaI3nDLM0wq/Os4GmIIJH1+B+CG7rvjKW51VcTkFzCJapnB63NEXnrsmp0RklMDzFpkmE9qXL2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341588; c=relaxed/simple;
	bh=JMKPIWgq8b9DBCFSMppOOhRohcyexWNss6iyCclDIgo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sKPTFiA4BmBq9BvldLqqZdhQm+xl/ld5Tr4Nz3hgyqfIFzZlgq5hcQ3+p7ILaeK1H5ja1HQTJwDo8lMDQIhg8TdpKh75MImmidGAYWGPFYle2vVyDnRfC9KBrYZ55fxC/mmp7TU9QWBk+jU4eEtjdry+kEz5TBmfJHxi0P1adwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9RH8xyH; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so5384811a12.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 13:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768341587; x=1768946387; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JTlRjbsQTQjHMPHLzcQF6C84Ga9JaD/ogkGGtY0cAkU=;
        b=Z9RH8xyH2sm7aH7YqwaAaxnwhUbjgwMdMuT9dk/anRy8cfvnKPQQjd5UKB2CS+Lpc8
         NFG+NkUnaGn5QiMuU2Z6PqctYPtelOkqXXjQQuJBG2FqQuMv1atXsxQ76j5pkb8dClkH
         I4ZEpCwiLh1O3CCvBCz6yn+dFIcBgSPyQsJRL4lNGbJguq+aMhHvEV/lD9GbjR1uKj0C
         L3aVmfrxVcfEjTdHuGzQ3dm4PkbuLjCBmCQpNO7yqOI4Dn9qVuXcqTo2mVAwum/CI8PN
         d2kser1YMMIMbEWX+o0wO1lKk6pytpNTHdPcXaTKvgVrAFVcAuALhCqs0oKRZoQuKunt
         Vywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768341587; x=1768946387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTlRjbsQTQjHMPHLzcQF6C84Ga9JaD/ogkGGtY0cAkU=;
        b=R1VMZq+u7L+6m5HwfjijYo3eXqewWC0r4rVYpQmLXeTiPxeenIKqy0fkZiBZZIyv0Y
         9C2a5jlgM/rBTHd0o5W6gLWo05L9sO24JNu8QRFTJ1GpKp9o9HkWezTRpn/+t6PoXBfB
         sp5o4J4dvhp/2WQo/EgTIX/g+OepvEpq3Z1Pt0el0JkM8kcamfnO7UfACWZVSxaPRTUh
         eEjcwWbKBVowX1zBAAwGcxHoq1MmrjVx0HxwO5sV/8ZymYHLrNglhO73/NG8dt8W6DeF
         dNumnzD+znP2hlqCTsE13SaDG3cAV5XrtlF9bOp0ViJxGakO2Rp+ScJpU3ILTQjw/sPK
         vQJw==
X-Forwarded-Encrypted: i=1; AJvYcCVBDwO+JTPWE091ISDJcNonpIzmjDq1bxfaUMdFIDy0zuJotdzs937wxEYkq4NFoLU+dh9TXiEdYG1CSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ/pYxCicYaP9FroyA4wTFbi0fsDngGw15+ll8XD1EKfbtHr3q
	ADr9+z/I1C7waF14HpGXdVa+QXlO5ERCJiPMmbkTzkPWRknTt7yI1Q/q
X-Gm-Gg: AY/fxX5zPK2y6rBB3aIJuAsawY3pFOSQ38DvAElE2lSQfbvAhBL3JkkcxzOPoagY/7P
	BSkl0RgmhTbNK1Zb5dYEA+3uYQvCbXOLT2E7AOPCDvTJqh6uzyNv8V05UuHn6ibtZedqNpNZkaz
	YZM033gwuk08nMUErLTfKBuaXhIJV+7z9Y55WRHs+DkCAhgiNaBWyx9vEKC5uFM8LQvAVRYsslQ
	0ntRk2kdwPxCYU4xEoytIXBJvmoUU4Zp07iWZSGTtGUVI/2kudn5neze8ZKiEb0eY8ObcV0SdfC
	oHeg+i5VRYtL2jY1txhy80UqAYZV7aLvFszVVkuUL13wXV/5A/4l2T42PMPYlcqm3Tb3SPJ2ekg
	lPxFEmaobKwdWyaZt0uMW5dmcW+A9zYw4Rl52PnUhm0jaxvOXYNYxqqWf33ppRgX8t48tFciP/7
	ooZvtQUCIdEbfDBer69Fmw9XyC0KC24N5WnnGJg+CZKpiFLe5QO9k=
X-Received: by 2002:a05:6a20:2445:b0:384:f573:42bf with SMTP id adf61e73a8af0-38bed1c96b9mr512725637.53.1768341586883;
        Tue, 13 Jan 2026 13:59:46 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc05cd87asm20802106a12.15.2026.01.13.13.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:59:46 -0800 (PST)
Message-ID: <18d9b15319bf8d71a3cd5b08239529505714dc96.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 03/10] bpf: Verifier support for
 KF_IMPLICIT_ARGS
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-input@vger.kernel.org,
 sched-ext@lists.linux.dev
Date: Tue, 13 Jan 2026 13:59:43 -0800
In-Reply-To: <20260109184852.1089786-4-ihor.solodrai@linux.dev>
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
	 <20260109184852.1089786-4-ihor.solodrai@linux.dev>
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

[...]

> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -3271,6 +3271,38 @@ static struct btf *find_kfunc_desc_btf(struct bpf_=
verifier_env *env, s16 offset)
>  	return btf_vmlinux ?: ERR_PTR(-ENOENT);
>  }
> =20
> +#define KF_IMPL_SUFFIX "_impl"
> +
> +static const struct btf_type *find_kfunc_impl_proto(struct bpf_verifier_=
env *env,
> +						    struct btf *btf,
> +						    const char *func_name)
> +{
> +	char impl_name[KSYM_SYMBOL_LEN];

Oh, as we discussed already, this should use env->tmp_str_buf.

> +	const struct btf_type *func;
> +	s32 impl_id;
> +	int len;
> +
> +	len =3D snprintf(impl_name, sizeof(impl_name), "%s%s", func_name, KF_IM=
PL_SUFFIX);
> +	if (len < 0 || len >=3D sizeof(impl_name)) {
> +		verbose(env, "function name %s%s is too long\n", func_name, KF_IMPL_SU=
FFIX);
> +		return NULL;
> +	}

[...]

