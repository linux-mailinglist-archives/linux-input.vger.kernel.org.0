Return-Path: <linux-input+bounces-12252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9BAB105B
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 12:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7A8178882
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 10:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D05028ECD2;
	Fri,  9 May 2025 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="DR32vWOp"
X-Original-To: linux-input@vger.kernel.org
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AED22759C
	for <linux-input@vger.kernel.org>; Fri,  9 May 2025 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.15.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785920; cv=none; b=K/TViH9WDBxwqEqstnDzBzluZlO7vEIzpIn04amlnnrVFlS+4/ztYBXAlFnRb570ksbxJTD5nbH+XHzROD5AvSMYS0oSjw6fSxZ/eNMoDFi+Ra8eD/noEXc72R7VdURvBXegS9t8b2/j5k3xifNLuXWLLr7vM6BcPWkZMPBjo28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785920; c=relaxed/simple;
	bh=/w6p/5hIo7yO2HitAndwlrVxQw/UJsrMyK+9SgxmP2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prEVVcENZMQ3NOaVIn5gJ8flvKaIvd47aExExsWHS+cf34T7mIRQGunIXXOFSLuIVu6GyjcWbbNzn9bV/x9+7UKAlGxQxc1UIxKBSO4PSh0vdJNS+mFN2lHA7OO0NnjQ4B5Iwd3ylULC+cOvhZ/NgawOouwNRX6hFJiASApsLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=DR32vWOp; arc=none smtp.client-ip=37.205.15.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id DF29D21E89B;
	Fri,  9 May 2025 12:18:35 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1746785915; bh=6tR+JO7Zd+QoK0PbDXjRmp00HSjQ7e7nwW84om8+Mdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DR32vWOp2PdBUJFQ5cpPDYaPP8PVlk44CefL4QDZ/ayFBhKCBrJmWS9A2caZLqbLs
	 3xDVLXpEIeg2N8cDVfEnP5PpIs9UytSdhCedzsJBhAiIl7HjZVOLmsY7WJln+cCNzb
	 k0OSj4FUx5xi7GJzDdFfmNBZAid0DeFw5UW60J+4oK0URfIOLASeIYkgLAmETqswLe
	 mXIDU2ETdPUZ+dYELwo5w61mdz6b0v63LVRnHhOJaAUlK51yzvQD2dwBakG6qbXMw1
	 JlpVTKKXczMnXPmf+G7ss2hFoH1OrKf3aE4DAMMPhwqz2FN1TUTX+mYMwm7vA55BWl
	 FRw4b1KUn7qog==
Date: Fri, 9 May 2025 12:18:34 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Subject: Re: Use after free in dispatch_hid_bpf_output_report()
Message-ID: <20250509121834.4a715ef3@meshulam.tesarici.cz>
In-Reply-To: <20250509113905.34947e78@meshulam.tesarici.cz>
References: <20250509113905.34947e78@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 May 2025 11:39:05 +0200
Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:

> Hi all,
>=20
> after installing v6.15-rc5 on my laptop, I'm running into an invalid
> pointer dereference in dispatch_hid_bpf_output_report() on suspend. I
> added some debugging messages (see patch below), and I can see this
> sequence of events:
>=20
> [ 1568.571776] [   T7420] PM: suspend entry (deep)
> [ 1568.602245] [   T7420] Filesystems sync: 0.030 seconds
> [ 1568.613183] [   T1704] hid-generic 0005:04F2:182A.0004: CLEANED UP src=
u 00000000b7570e01
> [ 1568.613348] [    T724] hid-generic 0005:04F2:182A.0004: UAF srcu 00000=
000b7570e01
> [ 1568.616215] [   T7420] Freezing user space processes

Forgot to include the UAF stack trace (before the debug patch was
applied):

May 06 21:18:24 meshulam kernel: BUG: unable to handle page fault for addre=
ss: ffff8c9071a1c018
May 06 21:18:24 meshulam kernel: #PF: supervisor write access in kernel mode
May 06 21:18:44 meshulam kernel: #PF: error_code(0x0002) - not-present page
May 06 21:18:44 meshulam kernel: PGD 33f401067 P4D 33f401067 PUD 0=20
May 06 21:18:44 meshulam kernel: Oops: Oops: 0002 [#1] SMP NOPTI
May 06 21:18:44 meshulam kernel: CPU: 0 UID: 0 PID: 26142 Comm: kworker/0:0=
 Not tainted 6.15.0-rc5-laptop #51 PREEMPT(voluntary)  1072ac82a8987caeba8a=
aea73a32d97435788b0c
May 06 21:18:44 meshulam kernel: Hardware name: LENOVO 20NF0004MC/20NF0004M=
C, BIOS R11ET45W (1.25 ) 07/04/2022
May 06 21:18:44 meshulam kernel: Workqueue: events hidinput_led_worker
May 06 21:18:44 meshulam kernel: RIP: 0010:__srcu_read_unlock+0x1a/0x30
May 06 21:18:44 meshulam kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90 =
90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 =
04 48 03 77 08 <65> 48 ff 46 08 e9 8c 98 b8 00 66 66 2>
May 06 21:18:44 meshulam kernel: RSP: 0018:ffffcd67ccf43d98 EFLAGS: 00010202
May 06 21:18:44 meshulam kernel: RAX: 0000000000000000 RBX: ffff8c8fc8fb3e2=
0 RCX: 0000000000000000
May 06 21:18:44 meshulam kernel: RDX: 0000000000000002 RSI: 000000000000001=
0 RDI: ffff8c8fc8fb3e50
May 06 21:18:44 meshulam kernel: RBP: ffffcd67ccf43e08 R08: 000000000000000=
0 R09: ffff8c8d2c761000
May 06 21:18:44 meshulam kernel: R10: 0000000000000001 R11: 00000000fffffff=
f R12: 0000000000000000
May 06 21:18:44 meshulam kernel: R13: ffff8c8c618475c0 R14: 000000000000000=
1 R15: 0000000000000000
May 06 21:18:44 meshulam kernel: FS:  0000000000000000(0000) GS:ffff8c9071a=
1c000(0000) knlGS:0000000000000000
May 06 21:18:44 meshulam kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
May 06 21:18:44 meshulam kernel: CR2: ffff8c9071a1c018 CR3: 000000012e46300=
0 CR4: 00000000003506f0
May 06 21:18:44 meshulam kernel: Call Trace:
May 06 21:18:44 meshulam kernel:  <TASK>
May 06 21:18:44 meshulam kernel:  dispatch_hid_bpf_output_report+0xb5/0xf0
May 06 21:18:44 meshulam kernel:  ? srso_return_thunk+0x5/0x5f
May 06 21:18:44 meshulam kernel:  hid_hw_output_report+0x46/0x90
May 06 21:18:44 meshulam kernel:  hidinput_led_worker+0xaa/0xf0
May 06 21:18:44 meshulam kernel:  process_one_work+0x17f/0x330
May 06 21:18:44 meshulam kernel:  worker_thread+0x33a/0x480
May 06 21:18:44 meshulam kernel:  ? __pfx_worker_thread+0x10/0x10
May 06 21:18:44 meshulam kernel:  kthread+0xfc/0x210
May 06 21:18:44 meshulam kernel:  ? __pfx_kthread+0x10/0x10
May 06 21:18:44 meshulam kernel:  ret_from_fork+0x34/0x50
May 06 21:18:44 meshulam kernel:  ? __pfx_kthread+0x10/0x10
May 06 21:18:44 meshulam kernel:  ret_from_fork_asm+0x1a/0x30
May 06 21:18:44 meshulam kernel:  </TASK>
May 06 21:18:44 meshulam kernel: Modules linked in: uhid snd_seq_dummy snd_=
hrtimer rfcomm snd_seq ccm nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbi=
os_ns nf_conntrack_broadcast af_packet bridge stp llc >
May 06 21:18:44 meshulam kernel:  dm_bio_prison cfg80211 snd_seq_device rea=
ltek think_lmi sparse_keymap videobuf2_common mdio_devres i2c_piix4 snd_acp=
_config mii snd_timer snd_soc_acpi irqbypass efi_pstor>
May 06 21:18:44 meshulam kernel:  dm_mirror dm_region_hash dm_log dm_mod ms=
r efivarfs dmi_sysfs
May 06 21:18:44 meshulam kernel: CR2: ffff8c9071a1c018
May 06 21:18:44 meshulam kernel: ---[ end trace 0000000000000000 ]---
May 06 21:18:44 meshulam kernel: RIP: 0010:__srcu_read_unlock+0x1a/0x30
May 06 21:18:44 meshulam kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90 =
90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 =
04 48 03 77 08 <65> 48 ff 46 08 e9 8c 98 b8 00 66 66 2>
May 06 21:18:44 meshulam kernel: RSP: 0018:ffffcd67ccf43d98 EFLAGS: 00010202
May 06 21:18:44 meshulam kernel: RAX: 0000000000000000 RBX: ffff8c8fc8fb3e2=
0 RCX: 0000000000000000
May 06 21:18:44 meshulam kernel: RDX: 0000000000000002 RSI: 000000000000001=
0 RDI: ffff8c8fc8fb3e50
May 06 21:18:44 meshulam kernel: RBP: ffffcd67ccf43e08 R08: 000000000000000=
0 R09: ffff8c8d2c761000
May 06 21:18:44 meshulam kernel: R10: 0000000000000001 R11: 00000000fffffff=
f R12: 0000000000000000
May 06 21:18:44 meshulam kernel: R13: ffff8c8c618475c0 R14: 000000000000000=
1 R15: 0000000000000000
May 06 21:18:44 meshulam kernel: FS:  0000000000000000(0000) GS:ffff8c9071a=
1c000(0000) knlGS:0000000000000000
May 06 21:18:44 meshulam kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
May 06 21:18:44 meshulam kernel: CR2: ffff8c9071a1c018 CR3: 000000012e46300=
0 CR4: 00000000003506f0
May 06 21:18:44 meshulam kernel: note: kworker/0:0[26142] exited with irqs =
disabled

Petr T

