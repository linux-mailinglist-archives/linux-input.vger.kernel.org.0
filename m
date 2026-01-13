Return-Path: <linux-input+bounces-17068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8FD1B77C
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 22:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8572D3005F11
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 21:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F0932A3C3;
	Tue, 13 Jan 2026 21:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evvsGCwc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A86318EFF
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340806; cv=none; b=HX1zaMPILhgLX6WuHdvuifgXxWalYSVNQWaEON1RdiH0B3Ony4JH8phYMrKJcFaIxt2eXx16d97ANDwRexl6zegLjYWKkrsO8kyNQwgnFCk3W/GnJ3GzDMiU8gQ0SCjXX2JtvGonE+Bq/Pk2ZVVek8zpef3UMdnw7Gp17sEMnbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340806; c=relaxed/simple;
	bh=1jZx4RujrQv0oh++qf8KOC2l8wTKl/TyrVIsGTQ2WCs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u2sxwoz0ddAxVRFKQ5De7vkrjPGMbaPwvHavn+7QhSoxBgqPsvFwbuMYRPBhZaYhpJlKmIMXMonlqmuobzXf7gxY0MydAGVuPT/37OI25sxJ4q01pHoF5KjWDEdmynzzFvjlX0leJQ1LO5j68D3eScCLv+w1/Ph+oulHPDG4oNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evvsGCwc; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c363eb612so4718511a91.0
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 13:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768340804; x=1768945604; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1jZx4RujrQv0oh++qf8KOC2l8wTKl/TyrVIsGTQ2WCs=;
        b=evvsGCwcFpYZbHsEE4mPGqT1cju1ZwXEN8uHjzCvX1hO06J7hPR/QLrZza5pqlp8oj
         BRHbSVzNojbr1qYSUcXsJNm7DTmcssbmYLfYmEb+r5XQKNeQdP5w/kxj4RQapkyd4Z3n
         1GhQk6iAhkylpzNvjET/fjyVRk3aOZeXCHtMpxQOP21TGEAUnPHhUilimRop750vYXC4
         TPZtqxCXa1EeL7U9K7JkExkuJmGWisM7+StZlSfn016RrC4MXmRhXDXdhQTOrFBHmlbD
         Eubyk+U/F+udjUYW7jlvx6Ik1nrKG90D3efYtzcQqd4X7L130TUlwisgCPAd70sqwJQp
         eYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768340804; x=1768945604;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jZx4RujrQv0oh++qf8KOC2l8wTKl/TyrVIsGTQ2WCs=;
        b=qG8nDdEdTJu8ugdnYSovf+a00HaQs5amtgAm26wxGVfqjbZ+VeKIEzx3zPnjiGQ9Uz
         HGW27xMkreCYisQEhqs28Zc83nC/aTCMZa6k2pdN0FAvYWTIOY4tfM+liS598Izktl6H
         UIbQ5zmulneMO/QNbd4xvkT7adMR8zBO6ZWY0/6EEdMSIupkNC2m20alCFTbMlcoM55E
         0Ervv9DgeZfEyfcBth8GoHpW6YKy7AnBJOhCN6Ani/bXGV8WftdSkaVpzeJLtxqXjQFY
         Q0zD7A9pmYYMoZ0iBOSsKHgqJTNzDTIk9lurkD1xAP7W40YYMj0JiKCZZKYYupJ3koN5
         OqHA==
X-Forwarded-Encrypted: i=1; AJvYcCXCGcMWbPCmZnDYiC4BMCiR6K9P8q73eW7GasyLQ+wdfyUyAb06XGgdIg0twOr9cRyIKr5Ee00XBKYGzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9d8yp16NLXXY6Sfqze8dAmPWz81wiqo0GT/S4Q6eSZI1V+BXD
	Cn+Cs198OhlsoKvjVv/IZWIgn1S131JtOQgqqauT1hQyQc2to/F9F+9Z
X-Gm-Gg: AY/fxX7kfCaoCoh8QJ75Ah/QIsc2V2EGqGhXnrLe12ObsbfgixMBceK8yRR0qZXp2BY
	6RiBxxzPwm9xIMuZ7X7mh3cQmCVi/q+UbkC/a1LBUNtUk5UhBFHFgDQ45r2uCvaD+Q/WqiZFBiE
	jUOtVqUFD+Mo7YgKMNInhY4gu/4HlUDogE2NObV4lvaWU3tLUVb+6zo+23dZAKQGiGqk+rgoo1+
	4GAsBW32O+hcwrO2HWm9Cg29lnnBmiejgrYe1MfgqdkpiBLfuuT0uuUdJAi4YpZSjB9aydMWWN0
	L97V+J9pMh72v5Wehm7VFAD6OQBYEFaQTat3bsD5/0HZFVIz9UL37h/PBC/4YC4TDkXZog4KvhE
	ORmAErVLSZ+pWgPkz+U5EaFwFpx5Xs3QW9nBS36JQBfrDLDFdb8Uv6rIVGmqEynB4Sk8vQfzpI6
	vbrefIOcFiHN7FrrA19xBKYBykYZiOV2apXwxXJW0z
X-Received: by 2002:a17:90b:274a:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3510916bbfemr407849a91.36.1768340804404;
        Tue, 13 Jan 2026 13:46:44 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c5660esm73834a91.10.2026.01.13.13.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:46:43 -0800 (PST)
Message-ID: <eda8a78a2c102751c9726960cf5d7cb24985f23e.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 02/10] bpf: Introduce struct bpf_kfunc_meta
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-input@vger.kernel.org,
 sched-ext@lists.linux.dev
Date: Tue, 13 Jan 2026 13:46:41 -0800
In-Reply-To: <20260109184852.1089786-3-ihor.solodrai@linux.dev>
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
	 <20260109184852.1089786-3-ihor.solodrai@linux.dev>
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
> There is code duplication between add_kfunc_call() and
> fetch_kfunc_meta() collecting information about a kfunc from BTF.
>=20
> Introduce struct bpf_kfunc_meta to hold common kfunc BTF data and
> implement fetch_kfunc_meta() to fill it in, instead of struct
> bpf_kfunc_call_arg_meta directly.
>=20
> Then use these in add_kfunc_call() and (new) fetch_kfunc_arg_meta()
> functions, and fixup previous usages of fetch_kfunc_meta() to
> fetch_kfunc_arg_meta().
>=20
> Besides the code dedup, this change enables add_kfunc_call() to access
> kfunc->flags.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

