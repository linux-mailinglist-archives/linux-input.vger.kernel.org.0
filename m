Return-Path: <linux-input+bounces-17202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87323D3BD3D
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB1AB304277A
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9A024DCEB;
	Tue, 20 Jan 2026 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZc0aiur"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25652D0292
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768873755; cv=none; b=C7LqCGxUK57zWqKw41PxKicAMOradhndp7dii1KXjDfsA+rw901bV549dbBgCXn12OJHq7uBAB2B78TUDCS6wxw9BKb4nrSnLL1E9ypAPfVBQ1C9A8rompQsqZHh2HlzokSIx7bACe6s8CdDBe2TsDk3X4tPhHcP2h5OSKQq1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768873755; c=relaxed/simple;
	bh=P4vH0k+7XsEwT791gaUby6dSyltbIn6BS1tA5QY+bp0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h88daupQdYhx4wg+zrGXacB5I0heswHj3cfeuiWUennwkDUc8JqlSKcRCRGIOf4CjbFs3hd5dsBxPtEbKms8CehUJGxGHwTYNsrri9IUhVJJVn7PpgFRVmBXSyRt5L06D4gqgrXu/6zQIddVvfMf0kfmwfHIpqQox2dmmad/mp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZc0aiur; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso824505eec.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873748; x=1769478548; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xjg5AkPxw0MOdaWLN3zWHsbO0Z52mOb9jRmich2qKiA=;
        b=VZc0aiurXJglCX5Bvo4EyS6XjGi4RyyKqHFXtaSUI8XkqZfQB2ZqB9OZBcd4lE9lS3
         g28yi5HCMbs60z6dv/kaCrfUgF/FBP7wnAHdLMxte+OAQw0NofmHrdo6Tg0vmVW+PMcz
         z/Gz0XjHPAjIYSuXvDvGdZCCqv9+NHMzlD8pVn+BDQ/HZGblTGOY/MdzSWWDmsLlplBS
         bYrDfFOVRB1SDol0/BtVEUFzDxwvXDaFTT+72yYGxHbL77ncYL196Mv5sXhE7v1IR/ki
         OQrhrBQGIKRZssh9TqKRvLDRS52ufFjXHqInH9RC+bFV+8h1S3MVuj5KWtShvYXD53xb
         xWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873748; x=1769478548;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjg5AkPxw0MOdaWLN3zWHsbO0Z52mOb9jRmich2qKiA=;
        b=RDKmYjfgQ7mkZBhnrLk+bH/QaawfsWJqe8i9SiFb4LAEvMS28bOYBdE2Tt+7eNLYpn
         CjBAqHuWAMl2ylMkuwtJjIvsO1i3J2h0vBPW7ZE9SEmzvLRHJKQa+6cAQxh5p2TEBEPc
         p6CDTo/w1jqD7Nkepa7iYUvKgcDkOCQSSFmuaeBeK7AXubiabetB9Cbcmn2mI3/KISOZ
         8j0ImW7/YEOdaBmuV+2NYi+/Pm1AMK2NYN0v4HdRNklIRcr5fYckWuz1E3o4EFbdqAzq
         96uCAUszx4BGHMAWBxrxlR32nwnWH1Wx5QrBBy1YaH5Ec6/NQy2Dz366msoufzX3sTpc
         IemQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4j56r3NqY5rKoUrhmzUTyMIT/Tg/QhihjVORihALXjFwSibWiV8SXU4Z7kAM47sOtVW+571xv2l26qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykvwpd8bSWwVHXZuu7JxVBPS0j/N3zzisKP+Z+PQ4rRwT1xSo6
	0tqt739Jhd0STMrpkqZOoyAHjBxSKeQkKweyak0S46UKSdHGAq9mOpjS
X-Gm-Gg: AZuq6aLRQIifviNv8Ksw2gCJeZoAV5CYq19E5jUxgdhWyYW97breKjg2WnrFbmu2Xo3
	ZWhemUMEImupGK0xSGgdBX8ozklxV+sbV73yfwioBj9Q9Tb8b39PDjg7J31JHp+Ig5+UYforsLS
	2bdC9HlnvxFJH3/wLQ0ZwaqSZNoyN0DwOJZF7B8K5jbLodwYPg0DExGjbuZTO26kpfQ7UJZrO28
	h09cpHtwpNi8c2t9vLtNVqa9zOJxGdHrstjYCn8tDK6Vot8BAmHtrMWN7r9mYTjpG601VzNC42x
	MgAjxz+KFGVVNw1gSggvDpHsdqiSY4OqZHGUQBGU+oiRJFCC8mUnWU31oBFgfLewPUzmhQmHTQH
	EO5WeJ5mfTX3QKEBqbaNCuP0oTQDhxjQt2y4bMnNbMekXJ3nnyF+55FMd5dLqJqs0iV0xOeEoWs
	4VQ2/3A90yv1Y1VWmA3NBdAuECk8GdIzonqBc9lhccgb2BnqtHC6K/ZwwEajioN6eX6Q==
X-Received: by 2002:a05:7300:c608:b0:2ab:c279:9dce with SMTP id 5a478bee46e88-2b6fd623ef7mr293270eec.7.1768873747978;
        Mon, 19 Jan 2026 17:49:07 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502d22sm15327177eec.10.2026.01.19.17.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:49:07 -0800 (PST)
Message-ID: <088b071d1a43b403123d772f56ce033e91cb4252.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 00/13] bpf: Kernel functions with
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
Date: Mon, 19 Jan 2026 17:49:05 -0800
In-Reply-To: <20260116201700.864797-1-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
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

> v1->v2:
>   - Replace the following kernel functions with KF_IMPLICIT_ARGS version:
>     - bpf_stream_vprintk_impl -> bpf_stream_vprintk
>     - bpf_task_work_schedule_resume_impl -> bpf_task_work_schedule_resume
>     - bpf_task_work_schedule_signal_impl -> bpf_task_work_schedule_signal
>     - bpf_wq_set_callback_impl -> bpf_wq_set_callback_impl

Just to clarify my understanding, this is a breaking change, right?
E.g. bpf_stream_vprintk_impl is no longer in vmlinux.h and on a load
attempt an error is reported:

  kfunc 'bpf_stream_vprintk_impl' is referenced but wasn't resolved

Maybe call it out explicitly in the cover letter?

