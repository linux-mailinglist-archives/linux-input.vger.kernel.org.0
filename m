Return-Path: <linux-input+bounces-15931-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7140C40F9B
	for <lists+linux-input@lfdr.de>; Fri, 07 Nov 2025 18:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A586F4E1CB1
	for <lists+linux-input@lfdr.de>; Fri,  7 Nov 2025 17:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED692765E3;
	Fri,  7 Nov 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3eWvVIs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5458F19C556;
	Fri,  7 Nov 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762534991; cv=none; b=AZcYrPNgSAY5+Xhy3kVqj0jEa0xIe5SCM0N67sGfuSzrGgpb8JsqcpPCyY/nKTT9cnxdoG5IQ1reqFzUJ31H3n/YzAmzXIcixFraiqtAj00x0rqXLiK7VM9Um9xWFrqxIvU613vrOA0zZkpOnLz/gETmYk1Wf/4objPI55r2Y/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762534991; c=relaxed/simple;
	bh=lULDnj+N73bfnuv+dqOPfQ5f4QFHttv6nBSeFv4MoHE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rNS9+9IDc/usz1k1v/GcL9Tqof+mlnLQHWXQzDyiw2tjFt4TWTEAz1zUbCpUwgL3JdxNRd/63RBrO0ASby2XuA7epEjcucTQ2BGV+misCClED7/aBH94HZG/HyLZh9BUi53QPdNdbrLYYzf4GDKhyw1g5ztcLhxYNPifRs99BT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3eWvVIs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BCBC4CEF8;
	Fri,  7 Nov 2025 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762534990;
	bh=lULDnj+N73bfnuv+dqOPfQ5f4QFHttv6nBSeFv4MoHE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g3eWvVIsv7lPjVlkjSjVcQhetR7dAAn8a59StRYiXrByDgsckyNHsNXJZlfMZknku
	 KgW62hngSpYA03Up0nTtlObK7VrOYVP46gjl7YALEFBESN/+2iMqPM3w+ChFZzeP6m
	 5ARnYeRPFxJMxO/WshboZtVK3V3yIeb9D64Ou8GG6g3MzirJKfhxNjoiS3eJ7dsWFO
	 EN3VDlfXR8WqAvmfLQYyJIaVCg3+x3cvD2aJM2bCH7tLk/yPSiR6U8yUyiPg7C8BsB
	 EKz9LYVyz/3M/77cVNLGF2MVU+mPQkXBkTqexe3YvmU/DI37woLpWhCLFuJf6aPCtJ
	 RygNSY7rTY/iw==
Date: Fri, 7 Nov 2025 18:03:08 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Michal Hocko <mhocko@suse.com>, 
    "Daniel J . Ogorchock" <djogorchock@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH] HID: nintendo: add WQ_PERCPU to alloc_workqueue users
In-Reply-To: <20251107132443.180151-1-marco.crivellari@suse.com>
Message-ID: <50rq8s8q-q098-rrs5-r1rp-p5p5r7929psq@xreary.bet>
References: <20251107132443.180151-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 7 Nov 2025, Marco Crivellari wrote:

> Currently if a user enqueues a work item using schedule_delayed_work() th=
e
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
>=20
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
>=20
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they=E2=80=99re need=
ed and
> reducing noise when CPUs are isolated.
>=20
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
>=20
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_U=
NBOUND
> must now use WQ_PERCPU.
>=20
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.
>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Applied to hid.git#for-6.19/nintendo, thanks Marco.

--=20
Jiri Kosina
SUSE Labs


