Return-Path: <linux-input+bounces-17200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E391D3BCD0
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECBDF3018F63
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17ECC23A99E;
	Tue, 20 Jan 2026 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu0pqrrR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633A1F099C
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768872256; cv=none; b=Ksq64kb1VQ8FW8UISZ1F1W5RwOb6W1QSRlkM7I8yXsMFfG1b6HBUE3YSTzuM/USLQln8HY5VBqoF1J5bjIP9QHWIztueH0kyzuybilnSEbuqvZLGJSDd2hbiVHyz+li9qmPcyRx5vY5wA9Lzf++PJJPqDLoxtDGaeQccjTvLu1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768872256; c=relaxed/simple;
	bh=K2u+8I8vFl8w6PFempls3Trwb1N9W/IlCRI2yJ03b+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ftV3eRpeGsjFOaIxm86deIzspF5WCKwxdep12mlDGNlo/bI3D7qSTdTaA4n7kYY40rasVUkshg7wNaqchFNrv7Fv3gsjGywgM4MdasOORCtN9rFCg0CLFJTrtEyuEM9DaJyKmmpvkcndk1TlWjlJASjOoQNoYXp36Ut8aFXleA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu0pqrrR; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1233702afd3so6233002c88.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768872254; x=1769477054; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K2u+8I8vFl8w6PFempls3Trwb1N9W/IlCRI2yJ03b+E=;
        b=Cu0pqrrRn4g9gvCGG6mdGckAmOr67Rys5omGogFXdfmZ22wMz3WUBHiGuYzgUY30un
         Zq+q3SonQlukG8Gds4q6sombav07r82irNYlqa2UFhQPob88kvqZEQj1Su9HOzLwmtbJ
         cLU4zfaIpzkMvywarOTHTwfsCXMJi+hwD6ssWw8/L/EdrxbxujeXrwFrQUQuGLbIbqYH
         3e/4dNiS5/gMHLn1hz2EwIvV57gahdZ2zqK9SB30Wu58kUVcHKd57mo+A9VanvMpbyyz
         0EDIduv2p7mEyr8qZMoICLSSyXv4/Ceu4IC9oUYObmNaVA8A5hEXlmFIP52ZSOivb2/c
         vogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872254; x=1769477054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2u+8I8vFl8w6PFempls3Trwb1N9W/IlCRI2yJ03b+E=;
        b=FAcdCkAK7AtrOdJ0InWxpC7vvZWpIQCCMglw3kvOIfWMjb3i6bWWg3uIy8QXjtErgQ
         mlCG7a8J23mmvjx3Mq1EpKCuvp0ehVKruIaTDwYuVF58ozybaZVhEmZ0Wqj4kgTO+C1+
         mlYIeYK/v4BMz1alsjQVLYt/jN3g2CV+F17BFCMTV7w9zSS1M2ttcQaRLCno8jJu1ljz
         JEt3QGBOX4C3+qVx3NRYERwlfj2YUn2+wr1XOfCNP2zwLlz5biITM3Wmi6luHXLwPlDL
         rx/sh9YOy3wBR+8Qnp51zDLovh1Vuky6ScBdEwbeotuZuHrOlhU8yGgK9T6kEqZt3rmg
         sQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhl8QitkAkssUS5cRli2CA49mPp4cwvcW7uhNemslI6SpcOyYY2Xj3Fp0VxXXnSSBg+VS8C3CA0dwCJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ux8JOh8dhbbj2v7n1eERsBhL4l4ZZ4ZGWVmjKECbywv3DvA5
	FZoYz7HlafgHp7biQDrtChWyELmGw6ffMzDkOMAIquPzAdukLNW1+/vQ
X-Gm-Gg: AZuq6aKCHJf73qvF/mfApDYf70ISVvOEIglBpt51v2ToBlnE+Ap3cHj2/zWS0OYNVT5
	LSeHwA27xJ5XipmdgPEIcwGzUBSf3QB5U+Op7xMn/JttGQVVZ0PjWtbs0xKGPutVhFOviFnhNUK
	SxuPKVJpF/U/Ymsqd7ydMEj/E8X8vdWdLMk9HQftVzeS755RSfMeONX/UVMB5AeuNA++PJHukBU
	SrjZl4vodYgEUBiXDT6+6n6Avd2VLt6YCuFSiPk5MGufVO+cv4K4uODjvGmElWipaqys2S089Qm
	jun36AYAQhvRC4dHhBXfuXhxfV5KDJQCzknRYCmSIZ2FBqiX07ZUcr65HSeNJXFzZe9jcOOYWSN
	N5cH+7dh7SJxD6j/vEu+3m9CqmRg2vcNZ3OwDMp05BjjsZkov8jpbt55vfr2hfEWfpxcvqzK+t8
	t/5oSQ0ViCkWifwocgRczmcyZU1Zo0neBW38FYm/qNo4CM9CXf91fheeVishCCMAlK+N6++VrqX
	oVe
X-Received: by 2002:a05:7300:d517:b0:2a4:4884:e03d with SMTP id 5a478bee46e88-2b6fd607c0cmr162693eec.11.1768872253889;
        Mon, 19 Jan 2026 17:24:13 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c11dasm16997017eec.2.2026.01.19.17.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:24:13 -0800 (PST)
Message-ID: <375028a228138e2657efe0603d7818d36dc83f63.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 06/13] selftests/bpf: Add tests for
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
Date: Mon, 19 Jan 2026 17:24:11 -0800
In-Reply-To: <20260116201700.864797-7-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-7-ihor.solodrai@linux.dev>
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
> Add trivial end-to-end tests to validate that KF_IMPLICIT_ARGS flag is
> properly handled by both resolve_btfids and the verifier.
>=20
> Declare kfuncs in bpf_testmod. Check that bpf_prog_aux pointer is set
> in the kfunc implementation. Verify that calls with implicit args and
> a legacy case all work.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

