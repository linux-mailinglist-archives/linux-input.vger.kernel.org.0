Return-Path: <linux-input+bounces-24-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD77E9442
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 02:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B26280A9E
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 01:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE7746A6;
	Mon, 13 Nov 2023 01:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="vvbg4PED"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6CD4695
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 01:50:15 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C1B124
	for <linux-input@vger.kernel.org>; Sun, 12 Nov 2023 17:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1699840211; x=1700099411;
	bh=EKeNBNfQ18nlWhow8Osjc/8Jy7JaHleQB4SE6EGjJyY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vvbg4PEDvYi44RXIuUP/hubjHSl4k1KUq67CuW0FmTs1fHZsyTnx2al8iAUyGpQrl
	 6wxRQSaptv7UcmDIe55aegJy02dwXBECZZkL1xhN0dBhlsjX7xcfI/gL7j41Ix3Deq
	 nkNh12GvBTazNQa/onQRnngTGJeIzVaeWHQl8IFdW1jv9WIuvejgTQpswrV6PHZ+Ht
	 uYVyfe9/Spn6KSOotqASuia19AwxR4LbvxLuYR3M8+D0IHmpgxjsZvv46N0NhBh7UR
	 oJKvDtlJnx2S0qWLsYHAVAZQPYusdzyuoOgSPQqwBxx5SidNju2E86sLVa1rTEFHHC
	 lCVnXOSg+C3Fg==
Date: Mon, 13 Nov 2023 01:49:51 +0000
To: Charles Yi <be286@163.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: jikos@kernel.org, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: fix HID device resource race between HID core and debugging support
Message-ID: <87jzqm777o.fsf@protonmail.com>
In-Reply-To: <20231107081630.34233-1-be286@163.com>
References: <20231107081630.34233-1-be286@163.com>
Feedback-ID: 26003777:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 07 Nov, 2023 16:16:30 +0800 "Charles Yi" <be286@163.com> wrote:
> hid_debug_events_release releases resources bound to the HID device
> instance. hid_device_release releases the underlying HID device
> instance potentially before hid_debug_events_release has completed
> releasing debug resources bound to the same HID device instance.
>
> Reference count to prevent the HID device instance from being torn
> down preemptively when HID debugging support is used. When count
> reaches zero, release core resources of HID device instance using
> hid_hiddev_free.
>
> The crash:
> [  120.728477][ T4396] kernel BUG at lib/list_debug.c:53!
> [  120.728505][ T4396] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> [  120.739806][ T4396] Modules linked in: bcmdhd dhd_static_buf 8822cu pc=
ie_mhi r8168
> [  120.747386][ T4396] CPU: 1 PID: 4396 Comm: hidt_bridge Not tainted 5.1=
0.110 #257
> [  120.754771][ T4396] Hardware name: Rockchip RK3588 EVB4 LP4 V10 Board =
(DT)
> [  120.761643][ T4396] pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=
=3D--)
> [  120.768338][ T4396] pc : __list_del_entry_valid+0x98/0xac
> [  120.773730][ T4396] lr : __list_del_entry_valid+0x98/0xac
> [  120.779120][ T4396] sp : ffffffc01e62bb60
> [  120.783126][ T4396] x29: ffffffc01e62bb60 x28: ffffff818ce3a200
> [  120.789126][ T4396] x27: 0000000000000009 x26: 0000000000980000
> [  120.795126][ T4396] x25: ffffffc012431000 x24: ffffff802c6d4e00
> [  120.801125][ T4396] x23: ffffff8005c66f00 x22: ffffffc01183b5b8
> [  120.807125][ T4396] x21: ffffff819df2f100 x20: 0000000000000000
> [  120.813124][ T4396] x19: ffffff802c3f0700 x18: ffffffc01d2cd058
> [  120.819124][ T4396] x17: 0000000000000000 x16: 0000000000000000
> [  120.825124][ T4396] x15: 0000000000000004 x14: 0000000000003fff
> [  120.831123][ T4396] x13: ffffffc012085588 x12: 0000000000000003
> [  120.837123][ T4396] x11: 00000000ffffbfff x10: 0000000000000003
> [  120.843123][ T4396] x9 : 455103d46b329300 x8 : 455103d46b329300
> [  120.849124][ T4396] x7 : 74707572726f6320 x6 : ffffffc0124b8cb5
> [  120.855124][ T4396] x5 : ffffffffffffffff x4 : 0000000000000000
> [  120.861123][ T4396] x3 : ffffffc011cf4f90 x2 : ffffff81fee7b948
> [  120.867122][ T4396] x1 : ffffffc011cf4f90 x0 : 0000000000000054
> [  120.873122][ T4396] Call trace:
> [  120.876259][ T4396]  __list_del_entry_valid+0x98/0xac
> [  120.881304][ T4396]  hid_debug_events_release+0x48/0x12c
> [  120.886617][ T4396]  full_proxy_release+0x50/0xbc
> [  120.891323][ T4396]  __fput+0xdc/0x238
> [  120.895075][ T4396]  ____fput+0x14/0x24
> [  120.898911][ T4396]  task_work_run+0x90/0x148
> [  120.903268][ T4396]  do_exit+0x1bc/0x8a4
> [  120.907193][ T4396]  do_group_exit+0x8c/0xa4
> [  120.911458][ T4396]  get_signal+0x468/0x744
> [  120.915643][ T4396]  do_signal+0x84/0x280
> [  120.919650][ T4396]  do_notify_resume+0xd0/0x218
> [  120.924262][ T4396]  work_pending+0xc/0x3f0
>
> Fixes: cd667ce24796 ("HID: use debugfs for events/reports dumping")
> Signed-off-by: Charles Yi <be286@163.com>
> ---

This should be v3, but this patch is fine for me content-wise. Thanks
for going over your patch and explaining what you are trying to fix in
further detail.

Reviewed-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>


