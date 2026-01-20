Return-Path: <linux-input+bounces-17204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7192D3BD44
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 171983006F79
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B7A248886;
	Tue, 20 Jan 2026 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHWKem72"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A3450F2
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768873941; cv=none; b=kJHRECxXb0IEFh4VDsywRaXM/9twBnNsnfmp2YgurDfWyiPDOuq6xHq1p9LhUX4k03Sd/l7rN9auI+k5SIg5NzhWwnyMCgI6Fi7/ybG8UGA7v5mZzhDFMEB270YwuUCI4YkvQsB3lyOdSy3EOh3nusBuSYgCOhypgAoFVmE5BeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768873941; c=relaxed/simple;
	bh=J/x/DUKp0CfBkYwahFzNB3tYZHi6PFizSyMc+JqQ2YA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q+uIKrAaCAa6EPQRe9JpkzKxHVdxPKCdfxp134xGSxqDLRrxJDxbF5LIpg9XmjEHbqweCA4gPqixnqIwiHym9A87kO08uQ79ONcns/EajYdQRAa2FvY3ZvHw9MqAIBECF4QjxWMfO16o/cH2IrWWyiTvyko4sSGNwe84k2CGSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHWKem72; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ae61424095so4911087eec.1
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873939; x=1769478739; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/x/DUKp0CfBkYwahFzNB3tYZHi6PFizSyMc+JqQ2YA=;
        b=VHWKem72oMI15XbBpPsTOaT+39dAZqSUNl73CKedGG8l8KZ0bf8SDwPO0l93gkx7A8
         pszb2+9NvK9PK2UjowyoV2Mh7stHyHG1SDb6UfL1/wug5yATRAGqojq8U+iY+iwBCF1n
         xtrZ+Qwnaya3vPoI3vfa43NYR6vj+vB5pSQjpndyLR1hEZlBWoLlM+KfFdFpogcbLDZG
         SSiUmnYJ18BKSDbVkp5z3+vxs68QEa7ZYyhZWdV/iRDXFaHGvOBc4aPZTtvn42LlSQxt
         O/kpl6i63kIGBj8mhXmKrUfoEnCdKbSDznxfKfPaEg69hSBgj0175CV+Xozq73bxPRty
         oszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873939; x=1769478739;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/x/DUKp0CfBkYwahFzNB3tYZHi6PFizSyMc+JqQ2YA=;
        b=r6Gg5Is0cWoxDWfRZ00vmkAEVpMqHWLAXvHmn9HdLxkFs4GCWjIdgjbQcdn6yLFMAd
         CmGRwoLCHOy52O2ceVLtOdqR5o1ZSGMk+8r0SZ7kTtnoPlRCleiQU3HpCH3+2M33wRXo
         km+uOWIFhFRXM0bz+9oEsouH46DihHXpMmmCc+iG1J6LDiAr3oDFYoMrJIS+vgEa2P+j
         xcOZRmYy5J7sfZAqX2KKPhyXew659OazSsZhFtVbgvlzQFkitvaS1O1uebbshUg18iLX
         OkwPbBjw68TZWs/IfgF2oK9dS3+vcHtpoL2gjCxcp6xZNsfodTrPhk1pwd8+waYb227K
         3fxw==
X-Forwarded-Encrypted: i=1; AJvYcCUJmbegBzxMtCzFnjyAv1pmgWtXh83s08V+iSM4PuHzp6xP8GldObv3r8ixWw8PNrqmAULeF+PUTirHtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9fvN+GsLSelnu/PmPLEADR8tTterOudPGr4Mp8XexPFqHHOz
	Q8bv+/R+yEEB9eRT74vd5XvZCZbxKh4XasxmhULMaoO5Gj8q291qtj3Y
X-Gm-Gg: AZuq6aL6ieSJvDlNfUb6aXl2W4cmpx+MJ7dhZ/2Kz8cctkWqSumIyf6J8w0U7JWgOiO
	LnBu+LNSRMNx9RnItpMhJ87QOYENb+G0xKCMeS97hV7p2zWWk7YzfZ0JP+ccxnqxf98BGB1MWBB
	mik0xascikTpIWQtamebOud7pHK7zeWM+5adHMVQKtiBx5U3xPMjBG1XLbker5z+YtC7ZH/qrpi
	iWKgq8DwhKo4phvvkuXikBTBwCyWve/BcIhWuFYnFpveqpyQJvssODNBV8cMOMJpEftQpWLt4dr
	CYQ1QSSOz3PqSByfv3Bxg0yjRUUs1qDsoyGg+3dLZzh0i3clmqyLan1T4dlkb6Cb8CbPzQRaB/C
	fZstU9gYk3xq5gHqVRU6VvDkukKZJjcsqJmZr8oi+L/ZfbScOPav5N3bmQMAcIxOWWBlTT5DniP
	rM2mmRlG2XLgZCNIUJo2enoD2s86SnTAI/Kxw695XcxjYEOWqkikY73mLJM9a4E7wBZA==
X-Received: by 2002:a05:7301:290a:b0:2ae:60fd:6f18 with SMTP id 5a478bee46e88-2b6b4e8a496mr11469646eec.22.1768873939061;
        Mon, 19 Jan 2026 17:52:19 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c11c4sm15186383eec.1.2026.01.19.17.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:52:18 -0800 (PST)
Message-ID: <d433f40bc631b456cf2ab44fd2ffcfc2c1193e20.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 09/13] bpf: Migrate bpf_task_work_schedule_*
 kfuncs to KF_IMPLICIT_ARGS
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, Amery Hung <ameryhung@gmail.com>,
 bpf@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 	sched-ext@lists.linux.dev
Date: Mon, 19 Jan 2026 17:52:16 -0800
In-Reply-To: <20260116201700.864797-10-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-10-ihor.solodrai@linux.dev>
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
> Implement bpf_task_work_schedule_* with an implicit bpf_prog_aux
> argument, and remove corresponding _impl funcs from the kernel.
>=20
> Update special kfunc checks in the verifier accordingly.
>=20
> Update the selftests to use the new API with implicit argument.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

