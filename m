Return-Path: <linux-input+bounces-17209-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B3D3BD62
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 03:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1B8B3028459
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18301E2614;
	Tue, 20 Jan 2026 02:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5yPp8oo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F112B9A4
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768874478; cv=none; b=eBil5RvVvqG2yln9fC9rD8FEYKue7cbr94w05jCr6gPZpCEYdlQzqr0a9K7cJdk3fSFBnVzLc+MWy2UIiMrcP0OPwo7rnA4MUdNDuzeuivDxnpS5tijPX/WGfwQqnwGuzsDktm/+GAs7POe2N/4PFjXZzGTDVI09bAhZm36F/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768874478; c=relaxed/simple;
	bh=yzo2857juL/G5W4Nvl5biIIxiHg/pGUeqWEkOrOEnRk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lx6VpsgH2mLsHYCReVCDse0D0DheA30EjAT3doTIa22jzsednLp7I/BOFLyB5LkZI5+uPb+ZSI9uAdYIzrmQLmafDExUpqLsNjqvaMMYXRc4p7KngVa+re3SMmelYZBdzeD4fjYnaW8xnDAlk8OOzasa0isMN3iX+InXG+yuCAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5yPp8oo; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b6a93d15ddso4695357eec.1
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 18:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768874477; x=1769479277; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yzo2857juL/G5W4Nvl5biIIxiHg/pGUeqWEkOrOEnRk=;
        b=b5yPp8oo299dYsD1g/tLbQ3GWaNEV4XGtQgJJf+XyND63hmJY2m6KoDDSug64qvdRh
         fgm/1mrGw06sR8CATjG9npAOb5txtBbRR2P8qNuxLnMOzrSrwMQnBrqZtCUIJYv4cp78
         sOJHblFg4TtMZpJHYsaPFH6/i1Jd1FmIwOnlLG4VBnw3+Q60v2T/3tjNndiFiqkm7Rsd
         c7N4/cQ5LstGeTOXQyos4wVVvxGoB1QFEPtNNF5MlIIQBr/fF18FHk2UQwrvcUVPGBFA
         tn+Ke64Xj2gUj9rmODNUahK63YtbcwRS41aUH8edDFP6OZQQu4gOTmKdLbKUSZxlQ4A7
         wUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768874477; x=1769479277;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzo2857juL/G5W4Nvl5biIIxiHg/pGUeqWEkOrOEnRk=;
        b=a7YWS1F0LfoAo9h3flLUa99syklEazftbph68UNdy13MJvTiOJ9WvTVBOtoHrDJ6Hs
         +Lan52XYHU1WTaPwzaOwUF9MdXtW8N4rvNxO4ANxNEs0qpJ7DR8u4Tn4Oozyw0bSZcXA
         AEC89gQdPqE2YDc9GGxox45SlmO5ASRfn+AARV4QpMl8HK/HoefwIkrVYX36kdgBqN0/
         y/fcn4HucjjQbplX8N4CLnZyd+UrzJPQ16XTcoHvNSk7vgWhGaO71D3EpO3HHpFxZAxU
         CIvzfsmdLPji5l6W2PazZNVI/Y1kUR89Pqr4C8rFnb7oeZ25Qz1BFuyl3+xdjrrZ4YBc
         9JPA==
X-Forwarded-Encrypted: i=1; AJvYcCV2GLXUlnHgFveygyCXDLFo8hGH1cGdYRInbp6Dr15obgfsJMJX1LEaBQ2VGaaywcRq3wsvHRUy9JY6IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwINiCupha13w1Pv8+jh1grOWwuoaS1jasluYs+Gj84cSS6gYGu
	z1957o786ZJ/P9v0Ts8ORE6ZmT8ejejS7xtResef0hr/mq9AvCt0C7aU
X-Gm-Gg: AZuq6aKyxI4ug8+ivdbUlQ8ZYlzuvE1INQwr+AmMUVSBqVwr7L/CkIv+8A4ffTPxjAr
	bq6zmemmTSeKSCBa4e6wxamxscoo/Nyb/VrEDmuGxxmpOgXh3z72QUPe+9vrQCnWCopllNJGd4F
	oE6VZj5S2NicSL99cPeufqKUZ9h79oYZHV/PY69rbM4TLisrFGTRUXNeYQYaHYlv4cHyALDqp9S
	a8p1uDgC+wfTjxLUxTkui8zF5lmqeHntLBDKlZ18uDhVqOjq/swDR+a9ytAG8z1eBlujQi73ZhV
	6QA6cLAIFfgDh+PSZybjSyIy5E6erVjshONZgWrPJLbcKyGBsDLLFzp+sNaYDp+sMF2/S1km2b0
	z2e95/cxyaMQ/U2SeWDWg7WlkjazNms/CJu+KpqJe4pZYCiAjgylM6iYK156XB+sUVdqnTx7mO4
	oWMNzjWF4Fbugb2RP2JFmO2IxqA/de7vQH57WboPl4KQaaeZFXcN4XR1iFjPsIf5uF9w==
X-Received: by 2002:a05:7300:3b08:b0:2b0:4c33:8e41 with SMTP id 5a478bee46e88-2b6fd79a46fmr221707eec.20.1768874476451;
        Mon, 19 Jan 2026 18:01:16 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3679980sm15529952eec.31.2026.01.19.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:01:16 -0800 (PST)
Message-ID: <90135b24dcdbfcf0a5e45d49a6c6f0e18ed73986.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 12/13] bpf: Remove __prog kfunc arg
 annotation
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, Amery Hung <ameryhung@gmail.com>,
 bpf@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 	sched-ext@lists.linux.dev
Date: Mon, 19 Jan 2026 18:01:13 -0800
In-Reply-To: <20260116201700.864797-13-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-13-ihor.solodrai@linux.dev>
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
> Now that all the __prog suffix users in the kernel tree migrated to
> KF_IMPLICIT_ARGS, remove it from the verifier.
>=20
> See prior discussion for context [1].
>=20
> [1] https://lore.kernel.org/bpf/CAEf4BzbgPfRm9BX=3DTsZm-TsHFAHcwhPY4vTt=
=3D9OT-uhWqf8tqw@mail.gmail.com/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

