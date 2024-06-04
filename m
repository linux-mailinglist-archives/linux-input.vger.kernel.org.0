Return-Path: <linux-input+bounces-4059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 968268FACF7
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8AB31C211CE
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 07:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFF71411FD;
	Tue,  4 Jun 2024 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfoLU4/R"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C1C1411CA;
	Tue,  4 Jun 2024 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487932; cv=none; b=W8CQCf4UfAgvqjazmH9a6QJDs9pRVaFxaSYGZAVjWzXArM/Jk2xETux6Q8cuGc1txXcfL9Y6OKIPfczvgsOfQJlH5iX35aPPE13epxcbmyFSWZkXM3nv4ayZdyXK1+zcVUQsfNSaokJ3SAVkDrDGYDsEpWUlq6fjeVNSGoEECjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487932; c=relaxed/simple;
	bh=/2h304tkOJFnFlQMxg3EG6MI/HuME1XtmAEkjVrYmYY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KirDxwB7PqVAHrXXDd4njxY8p2ws3bKXUVvohxGSdD9W4w4jNCPIuLbmqhJO4uVKXnCq8dLAsO9VT7nQSxqUFoyzNFlLZ0YJ8Hgz3zUdYCo9+1YHbX4/wLAomUdS80ueUjJPMjNUG0R5U2ST0oxCGakCRw4ffD9AXlht3g+egTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfoLU4/R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD1BC2BBFC;
	Tue,  4 Jun 2024 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487931;
	bh=/2h304tkOJFnFlQMxg3EG6MI/HuME1XtmAEkjVrYmYY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FfoLU4/Rw1RAUN1Ww+rsMTdeA1C0zktNuV7DVFFartqRjRUWC72cr6+Iy8lTssqya
	 +F9a+yR0qD35AhleNxWSrCKwRqj112IL6hJtu7SN0pvYuoausgWlbDsjBM4GGFoQO9
	 mkPiHgXe/i353/szgViaRzUHEynzpTy5bqFzRNrFAECPI5X1f9Amqjmig4ejTuEZjm
	 KxMtnaQOGdCBMLovnIR5LmiJcnKtxEjs0tZKwwNSDITcekKklMDG0Q75SzDmMp+kBX
	 q7axmSh2tcDoBilsNvWT8y3vYTZQgfBU7u81KJ2G6E2noenkiwErbF/Be22Cj1W6uH
	 9EqqHakY8rM2A==
Date: Tue, 4 Jun 2024 09:58:48 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Hailong.Liu" <hailong.liu@oppo.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 21cnbao@gmail.com
Subject: Re: [PATCH] HID: Use kvzalloc instead of kzalloc in
 hid_register_field()
In-Reply-To: <20240522080328.12317-1-hailong.liu@oppo.com>
Message-ID: <nycvar.YFH.7.76.2406040958380.16865@cbobk.fhfr.pm>
References: <20240522080328.12317-1-hailong.liu@oppo.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 22 May 2024, hailong.liu@oppo.com wrote:

> From: "Hailong.Liu" <hailong.liu@oppo.com>
>=20
> The function hid_register_field() might allocate more than 32k, which
> would use order-4 contiguous memory if the parameter usage exceeds
> 1024. However, after the system runs for a while, the memory can
> become heavily fragmented. This increases the likelihood of order-4 page
> allocation failure. Here=E2=80=99s the relevant log.
>=20
> [71553.093623]kworker/1: 0: page allocation failure: order:4, mode:0x40dc=
0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=3D(null),cpuset=3D/,mems_allo=
wed=3D0
> [71553.093669]Workqueue: events uhid_device_add_worker
> [71553.093683]Call trace:
> [71553.093687]: dump_backtrace+0xf4/0x118
> [71553.093696]: show_stack+0x18/0x24
> [71553.093702]: dump_stack_lvl+0x60/0x7c
> [71553.093710]: dump_stack+0x18/0x3c
> [71553.093717]: warn_alloc+0xf4/0x174
> [71553.093725]: __alloc_pages_slowpath+0x1ba0/0x1cac
> [71553.093732]: __alloc_pages+0x460/0x560
> [71553.093738]: __kmalloc_large_node+0xbc/0x1f8
> [71553.093746]: __kmalloc+0x144/0x254
> [71553.093752]: hid_add_field+0x13c/0x308
> [71553.093758]: hid_parser_main+0x250/0x298
> [71553.093765]: hid_open_report+0x214/0x30c
> [71553.093771]: mt_probe+0x130/0x258
> [71553.093778]: hid_device_probe+0x11c/0x1e4
> [71553.093784]: really_probe+0xe4/0x388
> [71553.093791]: __driver_probe_device+0xa0/0x12c
> [71553.093798]: driver_probe_device+0x44/0x214
> [71553.093804]: __device_attach_driver+0xdc/0x124
> [71553.093812]: bus_for_each_drv+0x88/0xec
> [71553.093818]: __device_attach+0x84/0x170
> [71553.093824]: device_initial_probe+0x14/0x20
> [71553.093831]: bus_probe_device+0x48/0xd0
> [71553.093836]: device_add+0x248/0x928
> [71553.093844]: hid_add_device+0xf8/0x1a4
> [71553.093850]: uhid_device_add_worker+0x24/0x144
> [71553.093857]: process_one_work+0x158/0x804
> [71553.093865]: worker_thread+0x15c/0x494
> [71553.093872]: kthread+0xf4/0x1e4
> [71553.093880]: ret_from_fork+0x10/0x20
>=20
> To fix the allocation failure, use kvzalloc() instead of kzalloc().
>=20
> Signed-off-by: Hailong.Liu <hailong.liu@oppo.com>

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs


