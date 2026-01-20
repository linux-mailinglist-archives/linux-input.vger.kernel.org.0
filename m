Return-Path: <linux-input+bounces-17203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67FD3BD2E
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EB72301066C
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AD9258EDB;
	Tue, 20 Jan 2026 01:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnCqPcg3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F992571D7
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 01:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768873846; cv=none; b=SESXMhBSoI6wt4rHuDNAtKdHKmzM/mqrmlzetC+EHPkKJR9xcEJDLpaJ9Uudw2/VHvuZY5zeI08N1C8MUahAWkPt0HRiwnwEJe1FTtW3/T4bfKKWEBRrhTyGrtogBCgpJs3EWLRQ8YSYmNi4BBKFkYl1Aj/gcSwd4GtxZLESVJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768873846; c=relaxed/simple;
	bh=DAGvg3PHyxIqwyF//wG5u+HRfFiT9MhEqYWNnoz3UMg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Np7ChuY8zVqnWeKPtmYk5IAGYD3j+UwmS5tB8WK+X22doJaqQihBv7XPykTIyCJSfqHJarQDqHgqWPKjuNu9i7QPipSYC5IQ1sbAO9Ry0vy9tEmTPF9aS9kc5XdFL8aPiXws8oWK56v+WbP4nxWMLqcjrIPLuvIwOvNBvXAGsmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnCqPcg3; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6f85470b6so723765eec.1
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 17:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873843; x=1769478643; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DAGvg3PHyxIqwyF//wG5u+HRfFiT9MhEqYWNnoz3UMg=;
        b=mnCqPcg3KC91NKLeFG5vkR5iHIU/5aRTKjqf/cKF2gxsFfVPGKkYQUr4qCcT8W31Xr
         OlndUT9pb7mnoxAYeoCRWq020W24uVjFQ/igIWhRL3owED0VxKLq2/MhnoPo1keR8yzh
         VP6fE7ViIfkO3Kyvs7g1eM9cmVlzI1WRhgnVED1OFr8Cktu6ik9WT4wHMz3DS47BMHJ3
         p6rEhMvwIxWaMMsRb+xYyno709QmER438CQeU7Dv7OXUzJoxl4F0+hm4R316mXppDUEa
         Kumwnwy66lSb88DvuK7xjWlOOCaBua9pEiL0kd/hEVnOd9rzo1dsL/yeF0OWnNusyaqB
         MrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873843; x=1769478643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAGvg3PHyxIqwyF//wG5u+HRfFiT9MhEqYWNnoz3UMg=;
        b=ZOX58hDUxelY+pD7Gf9AUXRFqo7A0yMCsewxoGLUgWA4I14Ofpr3Me6i14xS4Q60+N
         2wJu34WFTyXtdtxOxZmvjkXJZkJBgTWH49yoor528yRhj7UXvyOzn7ogqMgr6mXn6znE
         Ep6Tb4BW2fsFxR6V03cL697BcaGWq2aydpSTBGCUjZS3pHKlgSU39+U/4k/DBp8sK1qd
         aLAA3lkIyv2M0RB4x6sCJkSXnCyP2ED9y9swPvhSoCA9g6bN2a5j06Ye5fuqNH8tk6cU
         E9JdKXkfe3iY67I/viw+BDg72tguh1qvtusg260rOx6fftX24gYkuP70X9tIfRdCNAE0
         9QzA==
X-Forwarded-Encrypted: i=1; AJvYcCVBUc/QdjtoFwQ7SxGtj6j/Enm5uggD846N9x0XJkIfmZjYGErTrpGxROyILqmT+ImcTCaX3YvBlDL6Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOA4mjA0l/zPgCHz9u3e2NL9IXqn1bw8Vf5Ayds7pwYs91pju
	vfXnAByf4M8irl0WxC8AlTX/9Zt4uELUUmEY4qLLp2qnxvs1QiNXIcI3
X-Gm-Gg: AZuq6aLW0+BveNxODXnRbpIgGBLC/jHRZQLN3DdOdk4a+F6lZ0MbE4sH3rmLTijDW8s
	lbAAjVOUgPN4dFD5Ou5zyhKeuszwb63M4Qy+w6+FRcNVm3sCvE3D7Py9Irdz6HnGmm/H+zK2vTf
	lTOnjHaPnzk9I7Wu80ej5YcoEaEAB+oANoJ3lKQ9thpzW/B+/f/+++Udy8ipIbti+FGSk9U0rQa
	wVCnULEQVRQ/kO4v4/tvo38MxTjBmfBmby/F9EBnAcfwFK81IRKxEL0iTVP52/XvJkyG5FI2dep
	eaaZzBtab0fbJb3c2KCvLgPHil7OSgXL7xqdZX4xFSqpw2c5iSbmeivE7iHd3EKPycU0zib+Urh
	nWN3HJBxPQDe4spAwrxtRERssu/6U4Pb9NAjGEwpBLwGjvJ7sMBy+lC6M3c/K2mpZUlksfPiMBA
	iEQzfpKZybztZkg2/gXWBBEqs1/W/hP2qSsbTJvQN9BlqvZI1hKystcaWo6Xjrs8kYqw==
X-Received: by 2002:a05:7300:b593:b0:2af:cd0a:ef75 with SMTP id 5a478bee46e88-2b6fdc9d3f9mr188077eec.34.1768873843209;
        Mon, 19 Jan 2026 17:50:43 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4cd6:17bf:3333:255f? ([2620:10d:c090:500::aa81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c65sm14944257eec.8.2026.01.19.17.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:50:42 -0800 (PST)
Message-ID: <fef0169e1c694b8b7945fe6cfca984750ac9d2e2.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 07/13] bpf: Migrate
 bpf_wq_set_callback_impl() to KF_IMPLICIT_ARGS
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, Amery Hung <ameryhung@gmail.com>,
 bpf@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 	sched-ext@lists.linux.dev
Date: Mon, 19 Jan 2026 17:50:40 -0800
In-Reply-To: <20260116201700.864797-8-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
	 <20260116201700.864797-8-ihor.solodrai@linux.dev>
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
> Implement bpf_wq_set_callback() with an implicit bpf_prog_aux
> argument, and remove bpf_wq_set_callback_impl().
>=20
> Update special kfunc checks in the verifier accordingly.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

