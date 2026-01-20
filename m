Return-Path: <linux-input+bounces-17205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42233D3BD47
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA401303C2A5
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F99258EFF;
	Tue, 20 Jan 2026 01:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLQYljRs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B322157B
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768874022; cv=none; b=Alp9tXjPOnh/HWJ6+VnKxIJKKL3W/GnnAVs5u2VKMImPOWZV/Xals56qQiZT8aFREmoZJeHkdr7rcR3m2Z3Uz5eiWd4ChiG+KMREIfODYBUZ40syYDHpjUwNYLtaYw+moMHC72eZFa5IWmx6U0dHFmiy1kQ1YYHjcQb8c9bxXrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768874022; c=relaxed/simple;
	bh=i1WO9N6rU0xpki4AMmuxeFJwY3NuYqDajYqJEs2eZ5E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r0PEbTElbdbBRs1zlrllC6Q7MHWFilGL5jBHBkzRjT+1ietMbg9Hv5c105Oz9j8/jbXAN7k3F0Q9N09WbCXQbVeCTaVytWRIF1GYymTvIIRFTRdn5m90cq0cBSa96jzgrzJebVl0boLosgfUD9KP7bJbaS0GFCnf7EzTKaYMij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLQYljRs; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233702afd3so6255058c88.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768874020; x=1769478820; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1WO9N6rU0xpki4AMmuxeFJwY3NuYqDajYqJEs2eZ5E=;
        b=CLQYljRsK41jCN1C9CCcUlt1VL/xy5VKsRxOO4m6cpcErGdn4kN1NypQRYdukQuayf
         elq5VT6DCNI12PZEylQgcKa1CPIoiR1ze/jc0R1zM0duI7XQoPp/9Lk6UU+wswim2Esn
         y/XeXYE6EqQYv94OPQp+5wC9aHPbzkYtcPEb1UDGEOR/e4BcLpNWxSkkl+MXQSyPd42Y
         Qhg4Je7jau7bVTf7BtWEiyyLBrMLwk9bPxsgwMsooFsNf4KE46BtTF8MgXiozzM9mkGh
         ZbTnTRvA0IG3kOyw1ykMd35JC+uo8wNPfpa/m6axzG9nG1THI9mzYgWQ6VJaguNdOtPp
         ECMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768874020; x=1769478820;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1WO9N6rU0xpki4AMmuxeFJwY3NuYqDajYqJEs2eZ5E=;
        b=UmD7povKKzbTVyYU3o70OkPC1DNaS/muA226T8JNghbVHSxRGS+6IyaUCdPzt7Lonm
         8R2FBG8rJ8Wpkeasb6hxunf2fxGZPLsXuUUPKycbwijcE6rDbu/qB7Em+9FBuUO3Hg+o
         UY1KU9RTFHgPUfSF6C4GjkFgG9ZRY3UZCkkIGpH2aNzbs8tEfhKCCgHMItwsWVn3wivP
         fPW93GTRY3v/906a1kZbn5sN0ocxXl9ztu4iiGfPxcbJD6g40fKmfEgzB3aE32motYIv
         A+RwsJcGAR2x1ZBEuDnezshCrrDl8/Cji1XjdOEEnuK1HKX0y/7Wrj5tsjiCK9znRsyf
         w5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMLY9xYRdc5sCfJRrTY4WWQdtaX4WT/Y9bFps1lM0+zSed0Kc3t/SWQvyw9q2NmVP0SxTAQCARhijAgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWvjhgtXMZXMIcazEOqBGnXLl4K0+VXXOP0lkZFoeJdg6A0ao
	s80kk2lVohtQ5PQ1FGtz7UXKMz9z50dlznp2YhlqTwH3ffO08IxdlY35
X-Gm-Gg: AZuq6aKr2rx4AtcWH6eTGKesA5Cq6DaBkv0BXiUA6Dvx+oXpa3/1mMxj0poS0loYKyh
	d4g06qALTJThTAauBTJ+CAS9IASqcR43WL8cD8E8p6ZK753A4dJAVH+7YvPUX2GtiahlDpgNbuO
	/tixZ/VE2wCbh6/B+vL61owx7kSXn+LI1DXJr/dofhpz8xvVX3E0lbrGrMjbgjKcM8isFAxGzbk
	kzeiZ/cSxdrWE7jKEsqO7oX/MBFNwYBDngRFCM2GKEg5Q8fOonqpwuJllpEKvts8aMr2GXycZm0
	pGiHMPsDA3nzQ6JF8fRbK6icXvBfswI37ryBsjmlZZ+LIcVeEA34HMKDHNtE1QAoXllbsE7JZNZ
	DnhgrjM7qqAQWhqQNo6GDxyPZotzwqbN9/nErzYeh+J+DUYRuTXnfXFdIo8nqxOyAwBdGbMGmJy
	GWb2CT0+iSguk6gF9ACa2t7qDmW0XxAC71Jk1FdX/yZTV6oZp2KGQCZC87JxqgJVDp9A==
X-Received: by 2002:a05:7300:7fa0:b0:2b0:52cc:fe69 with SMTP id 5a478bee46e88-2b6fd5d8080mr245088eec.5.1768874019541;
        Mon, 19 Jan 2026 17:53:39 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502d22sm15337923eec.10.2026.01.19.17.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:53:39 -0800 (PST)
Message-ID: <20f8eb981471544d6cd62d8ce35713f615f6f395.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 10/13] bpf: Migrate bpf_stream_vprintk() to
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
Date: Mon, 19 Jan 2026 17:53:36 -0800
In-Reply-To: <20260116201700.864797-11-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-11-ihor.solodrai@linux.dev>
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
> Implement bpf_stream_vprintk with an implicit bpf_prog_aux argument,
> and remote bpf_stream_vprintk_impl from the kernel.
>=20
> Update the selftests to use the new API with implicit argument.
>=20
> bpf_stream_vprintk macro is changed to use the new bpf_stream_vprintk
> kfunc, and the extern definition of bpf_stream_vprintk_impl is
> replaced accordingly.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

