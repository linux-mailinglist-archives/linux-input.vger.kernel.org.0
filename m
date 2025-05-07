Return-Path: <linux-input+bounces-12192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9DAADCDD
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427CC17B8AF
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 11:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E462147FC;
	Wed,  7 May 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="H9DWvQwa"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334018DB24;
	Wed,  7 May 2025 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615878; cv=pass; b=KPWw+89ufjy5eB8xPWxLmsNMa9KGzqBLOV7WAA+gGFG3bfaiuH+t8a+gVXNOfK5Gphm3W1KLqxswyvXwt5XVWUn0I1HwpoZ/Sffxc83tZAmyvzgBUa2pvN2tjFhUZMJvqv9oWH8GXSUDv4N8anLe7FF4TVCW4w4vB7s02uJ7Zjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615878; c=relaxed/simple;
	bh=TRgCUkWVMgy/BOp6Wr3ymZKQsDwwIp3dv/k5/z1WYQw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sL4Ge/d5AtJOtmaxm92mh9Nm/t+0GwQTLkXugnLVka42/1mn/DjMk/6emWdMXfqrsomK6gH4nws1CPq4WoBulq72mswzYNlYHiRZIYd6vtWUFDqNx7PJyzQgfDSnCcrXazP3VXTkUEtShbuSN2KmERsWsEI736vSgvG7O6VEqRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=H9DWvQwa; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1746615860; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WwZM+8oZdRPu1lCa99DYwPJQmc5jGpb7YIsqn3rS6dwvS/BURVJGirGmy9ftS9ltx17W67LfEDYiOV/XVTlXSEPQpqOn8Zavg5Hhp99oOle3WEFduqG40v1NWmRjovf/4Im3R+FxDR290liBj1xXYFGcDiGFL0as5K94GOr8c5k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746615860; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hj9d+K4d73QU19gthveek/lC+GfIXOdltgTDOPCGgnQ=; 
	b=m5XI7pJ0+e89sRdifQ1HjXUNyGrT7qoc4pb8Heg+44Iv2/Dp/tjLsBoXrhrhDJ1g0cVfxlFF19eeyIeP0i+Tp+A2WoaEvyWB7Ix3XvPDTfeapdkZ+HAOYHZwEdvmRvPDbZnzmBqFL3qntmqDf9JcPIo7euCTKYsFHZ0Jeq58dpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746615860;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Hj9d+K4d73QU19gthveek/lC+GfIXOdltgTDOPCGgnQ=;
	b=H9DWvQwa7pf4/9YTj0JbVROVRZEVcrHNZd8VGU5i4pM2yotYzeS9V8kyJiiPyoZD
	Xutn0LDUoOXPKqdbqKu8FDKujF+n8iiXhILWJuu6TYNM/WDXivQ74+lFcjQiMDhIWV1
	PaDNPllFN2Y0wM7B70a+8FKl07hkdLbRhmmqsY0k=
Received: by mx.zohomail.com with SMTPS id 1746615856133983.5926675412026;
	Wed, 7 May 2025 04:04:16 -0700 (PDT)
Message-ID: <6b4fe1ae87c717c70708e7a3f5bd6d9c8c7bfcd5.camel@rong.moe>
Subject: Re: [Bug 220083] New: [REGRESSION, BISECTED] x86 ASM changes make
 dispatch_hid_bpf_output_report access not-present page
From: Rong Zhang <i@rong.moe>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: bugzilla-daemon@kernel.org, Jiri Kosina <jikos@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov
	 <bp@alien8.de>
In-Reply-To: <umqaxyqrrvle34haa3n3iohs5akos652ytbs5sef32xmc7gaz7@edyihsd4yokq>
References: <bug-220083-6385@https.bugzilla.kernel.org/>
					 <20250506145548.GGaBoi9Jzp3aeJizTR@fat_crate.local>
					 <umqaxyqrrvle34haa3n3iohs5akos652ytbs5sef32xmc7gaz7@edyihsd4yokq>
Content-Type: multipart/mixed; boundary="=-vYWgKKVpA1BcZkQ9EbdN"
Date: Wed, 07 May 2025 19:03:11 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.1-1 
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/246.595.77
X-ZohoMailClient: External

--=-vYWgKKVpA1BcZkQ9EbdN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Tue, 2025-05-06 at 17:35 +0200, Benjamin Tissoires wrote:
> Hi Boris,
>=20
> On May 06 2025, Borislav Petkov wrote:
> > Switching to mail.
> >=20
> > Hi Benjamin,
> >=20
> > take a look at the below pls.
> >=20
> > The RIP points to:
> >=20
> >   22:   48 c1 e6 04             shl    $0x4,%rsi
> >   26:   48 03 77 08             add    0x8(%rdi),%rsi
> >   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <-- tra=
pping instruction
> >   2f:   c3                      ret
> >=20
> > which really is a %gs-based access and the reporter has bisected this t=
o
> >=20
> >   9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")
> >=20
> > which looks related.
> >=20
> > My silly guess would be some bpf program does per-cpu accesses but it d=
oesn't
> > know about this change so it tramples over registers. I mean, my fix wo=
uld be
> > to disable BPF but you young kids love to play with that...
>=20
> Heh. Well, I would like to know if any HID-BPF program is loaded first.
> These can be seen by running `sudo tree /sys/fs/bpf/hid/`.

Nothing is there.

$ sudo tree /sys/fs/bpf/hid/
/sys/fs/bpf/hid/  [error opening dir]

0 directories, 0 files
$ sudo tree /sys/fs/bpf/
/sys/fs/bpf/

0 directories, 0 files

> `sudo bpftool prog` is another option in case udev-hid-bpf is not used.

$ sudo bpftool prog
21: lsm  name restrict_filesystems  tag aae89fa01fe7ee91  gpl
        loaded_at 2025-05-07T10:23:09+0800  uid 0
        xlated 560B  jited 305B  memlock 4096B  map_ids 11
        btf_id 104
22: cgroup_device  name sd_devices  tag 40ddf486530245f5  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 504B  jited 318B  memlock 4096B
23: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
24: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
25: cgroup_device  name sd_devices  tag be31ae23198a0378  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 464B  jited 297B  memlock 4096B
26: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
27: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
28: cgroup_device  name sd_devices  tag ee0e253c78993a24  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 416B  jited 267B  memlock 4096B
29: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
30: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:10+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
31: cgroup_device  name sd_devices  tag ee0e253c78993a24  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 416B  jited 267B  memlock 4096B
32: cgroup_device  name sd_devices  tag ee0e253c78993a24  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 416B  jited 267B  memlock 4096B
33: cgroup_device  name sd_devices  tag b37200ab714f0e17  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 184B  jited 110B  memlock 4096B
34: cgroup_device  name sd_devices  tag 738e6ebf4499a83a  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 792B  jited 489B  memlock 4096B
35: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
36: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
37: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
38: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
39: cgroup_device  name sd_devices  tag ee0e253c78993a24  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 416B  jited 267B  memlock 4096B
41: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
42: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:12+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
43: cgroup_device  name sd_devices  tag be31ae23198a0378  gpl
        loaded_at 2025-05-07T10:23:13+0800  uid 0
        xlated 464B  jited 297B  memlock 4096B
44: cgroup_device  name sd_devices  tag be31ae23198a0378  gpl
        loaded_at 2025-05-07T10:23:13+0800  uid 0
        xlated 464B  jited 297B  memlock 4096B
45: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:13+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
46: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:13+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
50: cgroup_skb  name sd_fw_egress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:14+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B
51: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
        loaded_at 2025-05-07T10:23:14+0800  uid 0
        xlated 64B  jited 63B  memlock 4096B

Though I am not familiar with systemd's BPF programs, given that they
are lsm/cgroup-related, I guess they don't aim to handle raw HID
requests.

> If there is no hid-bpf program loaded, then it seems the code path in
> drivers/hid/bpf/hid_bpf_dispatch.c:133 is:
>=20
> ```
> 	idx =3D srcu_read_lock(&hdev->bpf.srcu);
> 	list_for_each_entry_srcu(e, &hdev->bpf.prog_list, list,
> 				 srcu_read_lock_held(&hdev->bpf.srcu)) {
> 		// nothing happens here because the list is empty
> 	}
> 	ret =3D 0;
>=20
> out:
> 	srcu_read_unlock(&hdev->bpf.srcu, idx);
> ```
>=20
> So we are just in srcu_read_lock()/srcu_read_unlock() which is unlikely
> to fail...

In case you need it, I decoded a stacktrace (I've upgraded to 6.15-rc5
BTW):

[14591.438053] usb 7-1.4.4: USB disconnect, device number 7
[14591.541666] BUG: unable to handle page fault for address: ffff8efd88e650=
18
[14591.541674] #PF: supervisor write access in kernel mode
[14591.541676] #PF: error_code(0x0002) - not-present page
[14591.541677] PGD 220801067 P4D 220801067 PUD 0
[14591.541681] Oops: Oops: 0002 [#1] SMP NOPTI
[14591.541684] CPU: 0 UID: 0 PID: 56816 Comm: kworker/0:2 Not tainted 6.15.=
0-rc5 #1 PREEMPT(lazy)  0538d36f9cfa2dbc3c98efb2730490d8b2399dc4
[14591.541687] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW 03/11/=
2025
[14591.541689] Workqueue: events hidinput_led_worker
[14591.541693] RIP: 0010:__srcu_read_unlock (kernel/rcu/srcutree.c:768 (dis=
criminator 1))=20
[14591.541697] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 f3 0f =
1e fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08 <65=
> 48 ff 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	c3                   	ret
   1:	cc                   	int3
   2:	cc                   	int3
   3:	cc                   	int3
   4:	cc                   	int3
   5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   c:	00 00 00 00=20
  10:	f3 0f 1e fa          	endbr64
  14:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  19:	f0 83 44 24 fc 00    	lock addl $0x0,-0x4(%rsp)
  1f:	48 63 f6             	movslq %esi,%rsi
  22:	48 c1 e6 04          	shl    $0x4,%rsi
  26:	48 03 77 08          	add    0x8(%rdi),%rsi
  2a:*	65 48 ff 46 08       	incq   %gs:0x8(%rsi)		<-- trapping instruction
  2f:	c3                   	ret
  30:	cc                   	int3
  31:	cc                   	int3
  32:	cc                   	int3
  33:	cc                   	int3
  34:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  3b:	00 00 00 00=20
  3f:	90                   	nop

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	65 48 ff 46 08       	incq   %gs:0x8(%rsi)
   5:	c3                   	ret
   6:	cc                   	int3
   7:	cc                   	int3
   8:	cc                   	int3
   9:	cc                   	int3
   a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  11:	00 00 00 00=20
  15:	90                   	nop
[14591.541698] RSP: 0018:ffffd0c6094f7d88 EFLAGS: 00010202
[14591.541700] RAX: 0000000000000000 RBX: ffff8ef67492be08 RCX: 00000000000=
00000
[14591.541701] RDX: 0000000000000002 RSI: 0000000000000010 RDI: ffff8ef6749=
2be38
[14591.541702] RBP: ffffd0c6094f7df8 R08: 0000000000000000 R09: 00000000fff=
ffffd
[14591.541703] R10: 0000000000000001 R11: 00000000ffffffff R12: 00000000000=
00000
[14591.541703] R13: ffff8ef70d8143d0 R14: 0000000000000001 R15: 00000000000=
00000
[14591.541704] FS:  0000000000000000(0000) GS:ffff8efd88e65000(0000) knlGS:=
0000000000000000
[14591.541705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[14591.541706] CR2: ffff8efd88e65018 CR3: 00000001d0184000 CR4: 0000000000f=
50ef0
[14591.541707] PKRU: 55555554
[14591.541708] Call Trace:
[14591.541710]  <TASK>
[14591.541711] dispatch_hid_bpf_output_report (drivers/hid/bpf/hid_bpf_disp=
atch.c:148)=20
[14591.541716] hid_hw_output_report (drivers/hid/hid-core.c:2500 drivers/hi=
d/hid-core.c:2520)=20
[14591.541717] hidinput_led_worker (drivers/hid/hid-input.c:1838)=20
[14591.541719] process_one_work (kernel/workqueue.c:3238)=20
[14591.541721] worker_thread (kernel/workqueue.c:3313 (discriminator 2) ker=
nel/workqueue.c:3400 (discriminator 2))=20
[14591.541723] ? rescuer_thread (kernel/workqueue.c:3346)=20
[14591.541724] kthread (kernel/kthread.c:464)=20
[14591.541727] ? kthreads_online_cpu (kernel/kthread.c:413)=20
[14591.541729] ret_from_fork (arch/x86/kernel/process.c:153)=20
[14591.541731] ? kthreads_online_cpu (kernel/kthread.c:413)=20
[14591.541733] ret_from_fork_asm (arch/x86/entry/entry_64.S:255)=20
[14591.541737]  </TASK>
[14591.541738] Modules linked in: mmc_block rpmb_core udp_diag tcp_diag ine=
t_diag xt_mark ccm snd_hrtimer snd_seq_dummy snd_seq_midi snd_seq_oss snd_s=
eq_midi_event snd_rawmidi snd_seq snd_seq_device xt_CHECKSUM xt_MASQUERADE =
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat n=
f_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun bridge stp llc nf_tabl=
es qrtr uhid rfcomm cmac algif_hash algif_skcipher af_alg overlay bnep sunr=
pc vfat fat btusb uvcvideo btrtl videobuf2_vmalloc btintel uvc videobuf2_me=
mops btbcm videobuf2_v4l2 btmtk videobuf2_common bluetooth videodev mc inte=
l_rapl_msr amd_atl intel_rapl_common snd_acp_legacy_mach snd_acp_mach snd_s=
oc_nau8821 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm snd_soc_dmic snd_=
acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd=
_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_ds=
p snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match snd_hda_codec_rea=
ltek snd_amd_sdw_acpi soundwire_amd snd_hda_codec_generic
[14591.541775]  soundwire_generic_allocation snd_hda_scodec_component sound=
wire_bus snd_soc_sdca snd_hda_codec_hdmi snd_soc_core mt7925e snd_hda_intel=
 snd_compress mt7925_common ac97_bus snd_intel_dspcfg kvm_amd mt792x_lib sn=
d_pcm_dmaengine snd_intel_sdw_acpi snd_rpl_pci_acp6x mt76_connac_lib snd_hd=
a_codec snd_acp_pci kvm mt76 snd_amd_acpi_mach snd_hda_core snd_acp_legacy_=
common irqbypass think_lmi snd_pci_acp6x snd_hwdep rapl snd_ctl_led pcspkr =
mac80211 snd_pcm_oss firmware_attributes_class lenovo_wmi_hotkey_utilities =
snd_mixer_oss snd_pci_acp5x libarc4 snd_pcm wmi_bmof snd_rn_pci_acp3x spd51=
18 snd_timer snd_acp_config cfg80211 snd snd_soc_acpi hid_sensor_als soundc=
ore amdxdna amd_pmf hid_sensor_trigger snd_pci_acp3x k10temp rfkill industr=
ialio_triggered_buffer amdtee kfifo_buf joydev hid_sensor_iio_common ccp in=
dustrialio mousedev platform_profile amd_pmc mac_hid sch_fq_codel uinput i2=
c_dev parport_pc ppdev lp parport nvme_fabrics nfnetlink ip_tables x_tables=
 hid_logitech_hidpp hid_logitech_dj usbhid dm_crypt
[14591.541811]  encrypted_keys trusted asn1_encoder tee dm_mod raid10 raid4=
56 async_raid6_recov async_memcpy async_pq async_xor async_tx raid1 raid0 l=
inear md_mod igc ptp pps_core r8153_ecm r8152 cdc_ether usbnet mii amdgpu i=
2c_algo_bit drm_ttm_helper ttm drm_panel_backlight_quirks polyval_clmulni p=
olyval_generic drm_exec drm_suballoc_helper ghash_clmulni_intel amdxcp sha5=
12_ssse3 drm_buddy sdhci_pci sha256_ssse3 sp5100_tco r8169 nvme sdhci_uhs2 =
gpu_sched sha1_ssse3 serio_raw hid_sensor_custom sdhci nvme_core realtek ae=
sni_intel ucsi_acpi atkbd drm_display_helper cqhci libps2 crypto_simd typec=
_ucsi hid_multitouch i2c_piix4 nvme_keyring mdio_devres hid_sensor_hub hid_=
generic thunderbolt vivaldi_fmap cryptd typec cec libphy mmc_core amd_sfh v=
ideo i8042 nvme_auth i2c_smbus roles i2c_hid_acpi serio wmi i2c_hid
[14591.541846] CR2: ffff8efd88e65018
[14591.541848] ---[ end trace 0000000000000000 ]---
[14591.733025] pstore: backend (efi_pstore) writing error (-28)
[14591.733031] RIP: 0010:__srcu_read_unlock (kernel/rcu/srcutree.c:768 (dis=
criminator 1))=20
[14591.733037] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 f3 0f =
1e fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08 <65=
> 48 ff 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	c3                   	ret
   1:	cc                   	int3
   2:	cc                   	int3
   3:	cc                   	int3
   4:	cc                   	int3
   5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   c:	00 00 00 00=20
  10:	f3 0f 1e fa          	endbr64
  14:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  19:	f0 83 44 24 fc 00    	lock addl $0x0,-0x4(%rsp)
  1f:	48 63 f6             	movslq %esi,%rsi
  22:	48 c1 e6 04          	shl    $0x4,%rsi
  26:	48 03 77 08          	add    0x8(%rdi),%rsi
  2a:*	65 48 ff 46 08       	incq   %gs:0x8(%rsi)		<-- trapping instruction
  2f:	c3                   	ret
  30:	cc                   	int3
  31:	cc                   	int3
  32:	cc                   	int3
  33:	cc                   	int3
  34:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  3b:	00 00 00 00=20
  3f:	90                   	nop

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	65 48 ff 46 08       	incq   %gs:0x8(%rsi)
   5:	c3                   	ret
   6:	cc                   	int3
   7:	cc                   	int3
   8:	cc                   	int3
   9:	cc                   	int3
   a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  11:	00 00 00 00=20
  15:	90                   	nop
[14591.733039] RSP: 0018:ffffd0c6094f7d88 EFLAGS: 00010202
[14591.733041] RAX: 0000000000000000 RBX: ffff8ef67492be08 RCX: 00000000000=
00000
[14591.733043] RDX: 0000000000000002 RSI: 0000000000000010 RDI: ffff8ef6749=
2be38
[14591.733043] RBP: ffffd0c6094f7df8 R08: 0000000000000000 R09: 00000000fff=
ffffd
[14591.733044] R10: 0000000000000001 R11: 00000000ffffffff R12: 00000000000=
00000
[14591.733045] R13: ffff8ef70d8143d0 R14: 0000000000000001 R15: 00000000000=
00000
[14591.733046] FS:  0000000000000000(0000) GS:ffff8efd88e65000(0000) knlGS:=
0000000000000000
[14591.733047] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[14591.733047] CR2: ffff8efd88e65018 CR3: 00000001d0184000 CR4: 0000000000f=
50ef0
[14591.733048] PKRU: 55555554
[14591.733049] note: kworker/0:2[56816] exited with irqs disabled

> However, the fact that this happens in an unplug event makes me think
> that there may be a race here at play.
>=20
> Another option is that I completely missed the use of srcu, but it was
> working fine previously, so I have no ideas :)

Yes, this is weird.

I also tried uinput and some other HID devices (randomly borrowed from
my friends). They all worked fine.

I have a Logitech Bolt receiver, too. Will find and try it out.

> Anyway, we need to wait for the reporter to tell us if there were any
> HID-BPF program first because this will likely give us a hint on where
> the issue is.

In another clean boot, I triggered the bug and dumped the hdev struct
at fentry (fexit will never hit because of the PF) via bpftrace.

#!/usr/bin/env bpftrace

f:dispatch_hid_bpf_output_report
{
	$US =3D (uint64) 1000000; $ts =3D nsecs / 1000;
	printf(
		"[%lld.%06lld - %s(%d)@CPU#%u]: %s:\n",
		$ts / $US, $ts % $US, comm, pid, cpu, probe
	);
	print(*args);
	print(kstack);
	printf("*hdev:\n"); print(*args.hdev);
}

See attachments for its output (warning: contains an extremely long
line) and the decoded dmesg while tracing.

In another clean boot (again), I played around retsnoop to capture the
Last Branch Records (type: any_return, ind_call) from
dispatch_hid_bpf_output_report. This time I didn't trigger the issue,
or else nothing would be captured due to the PF as mentioned above.
Instead, I pressed Caps Lock on a keyboard under the same receiver
several times to trigger hidinput_led_worker. I always got:

[#15] kprobe_multi_link_handler+0x5d      (kernel/trace/bpf_trace.c:2843)  =
         ->  fprobe_entry+0xe6                   (kernel/trace/fprobe.c:321=
)
                                                                           =
             . __fprobe_handler                  (kernel/trace/fprobe.c:224=
)
[#14] fprobe_entry+0x21c                  (kernel/trace/fprobe.c:336)      =
         ->  function_graph_enter_regs+0x15d     (kernel/trace/fgraph.c:676=
)
[#13] function_graph_enter_regs+0x1cd     (kernel/trace/fgraph.c:718)      =
         ->  ftrace_graph_func+0x3c              (arch/x86/kernel/ftrace.c:=
659)
[#12] ftrace_graph_func+0x4c              (arch/x86/kernel/ftrace.c:661)   =
         ->  ftrace_trampoline+0x83
[#11] ftrace_trampoline+0xc2                                               =
         ->  dispatch_hid_bpf_output_report+0x9  (drivers/hid/bpf/hid_bpf_d=
ispatch.c:120)
[#10] __srcu_read_lock+0x20               (kernel/rcu/srcutree.c:757)      =
         ->  dispatch_hid_bpf_output_report+0x73 (drivers/hid/bpf/hid_bpf_d=
ispatch.c:133)
                                                                           =
             . srcu_read_lock                    (include/linux/srcu.h:252)
[#09] __srcu_read_unlock+0x1f             (kernel/rcu/srcutree.c:769)      =
         ->  dispatch_hid_bpf_output_report+0xc5 (drivers/hid/bpf/hid_bpf_d=
ispatch.c:148)
[#08] dispatch_hid_bpf_output_report+0xe6 (drivers/hid/bpf/hid_bpf_dispatch=
.c:148)  ->  return_to_handler+0x0               (arch/x86/kernel/ftrace_64=
.S:358)

!    6us [0]  dispatch_hid_bpf_output_report

Thus, there is indeed no BPF program being called.

Feel free to ask for more experiments :)

> Cheers,
> Benjamin

Thanks,
Rong

> >=20
> > :-)
> >=20
> > Thx.
> >=20
> > On Sat, May 03, 2025 at 06:40:41PM +0000, bugzilla-daemon@kernel.org wr=
ote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D220083
> > >=20
> > >             Bug ID: 220083
> > >            Summary: [REGRESSION, BISECTED] x86 ASM changes make
> > >                     dispatch_hid_bpf_output_report access not-present=
 page
> > >            Product: Platform Specific/Hardware
> > >            Version: 2.5
> > >           Hardware: All
> > >                 OS: Linux
> > >             Status: NEW
> > >           Severity: high
> > >           Priority: P3
> > >          Component: x86-64
> > >           Assignee: platform_x86_64@kernel-bugs.osdl.org
> > >           Reporter: i@rong.moe
> > >         Regression: No
> > >=20
> > > After upgrading from 6.14.x to 6.15-rc3, not-present page PF occurs e=
ach time I
> > > unplug any of my Logitech Unifying receivers.
> > >=20
> > > Upgrading to 6.15-rc4 did not fix the issue.
> > >=20
> > > dmesg:
> > > ```
> > > [   48.726588] usb 7-1.4: USB disconnect, device number 7
> > > [   48.856531] BUG: unable to handle page fault for address: ffff8a51=
0ee72018
> > > [   48.856543] #PF: supervisor write access in kernel mode
> > > [   48.856547] #PF: error_code(0x0002) - not-present page
> > > [   48.856550] PGD 365c01067 P4D 365c01067 PUD 0
> > > [   48.856558] Oops: Oops: 0002 [#1] SMP NOPTI
> > > [   48.856566] CPU: 0 UID: 0 PID: 7237 Comm: kworker/0:3 Tainted: G  =
   U     =20
> > >        6.15.0-rc4 #1 PREEMPT(lazy)  b3a8ad1950c71c15317e5ea614db6e274=
ecb0913
> > > [   48.856574] Tainted: [U]=3DUSER
> > > [   48.856577] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW =
03/11/2025
> > > [   48.856579] Workqueue: events hidinput_led_worker
> > > [   48.856589] RIP: 0010:__srcu_read_unlock+0x1a/0x30
> > > [   48.856595] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 =
f3 0f 1e
> > > fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08 =
<65> 48 ff
> > > 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
> > > [   48.856598] RSP: 0018:ffffd037cc29fd88 EFLAGS: 00010202
> > > [   48.856602] RAX: 0000000000000000 RBX: ffff8a4c6b16fe08 RCX:
> > > 0000000000000000
> > > [   48.856604] RDX: 0000000000000002 RSI: 0000000000000010 RDI:
> > > ffff8a4c6b16fe38
> > > [   48.856606] RBP: ffffd037cc29fdf8 R08: 0000000000000000 R09:
> > > 00000000fffffffd
> > > [   48.856607] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > > 0000000000000000
> > > [   48.856609] R13: ffff8a4ac182dbc0 R14: 0000000000000001 R15:
> > > 0000000000000000
> > > [   48.856611] FS:  0000000000000000(0000) GS:ffff8a510ee72000(0000)
> > > knlGS:0000000000000000
> > > [   48.856613] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   48.856614] CR2: ffff8a510ee72018 CR3: 0000000364c24000 CR4:
> > > 0000000000f50ef0
> > > [   48.856617] PKRU: 55555554
> > > [   48.856618] Call Trace:
> > > [   48.856621]  <TASK>
> > > [   48.856623]  dispatch_hid_bpf_output_report+0xc5/0x100
> > > [   48.856631]  hid_hw_output_report+0x46/0x90
> > > [   48.856635]  hidinput_led_worker+0xa9/0xe0
> > > [   48.856640]  process_one_work+0x18f/0x350
> > > [   48.856646]  worker_thread+0x2d3/0x400
> > > [   48.856650]  ? rescuer_thread+0x550/0x550
> > > [   48.856654]  kthread+0xf9/0x240
> > > [   48.856657]  ? kthreads_online_cpu+0x120/0x120
> > > [   48.856661]  ret_from_fork+0x31/0x50
> > > [   48.856665]  ? kthreads_online_cpu+0x120/0x120
> > > [   48.856668]  ret_from_fork_asm+0x11/0x20
> > > [   48.856674]  </TASK>
> > > [   48.856675] Modules linked in: xt_mark tcp_diag inet_diag snd_hrti=
mer
> > > snd_seq_dummy snd_seq_midi snd_seq_oss snd_seq_midi_event snd_seq uhi=
d rfcomm
> > > cmac algif_hash algif_skcipher af_alg xt_CHECKSUM xt_MASQUERADE xt_co=
nntrack
> > > ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat
> > > nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun snd_usb_audio snd_usbm=
idi_lib
> > > snd_ump snd_rawmidi snd_seq_device bridge stp llc nf_tables qrtr bnep=
 overlay
> > > sunrpc vfat fat uvcvideo videobuf2_vmalloc uvc videobuf2_memops video=
buf2_v4l2
> > > videobuf2_common btusb videodev btrtl btintel mc btbcm btmtk bluetoot=
h amd_atl
> > > intel_rapl_msr intel_rapl_common snd_acp_legacy_mach snd_acp_mach
> > > snd_soc_nau8821 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm snd_so=
c_dmic
> > > snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh
> > > snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci
> > > snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_=
match
> > > snd_amd_sdw_acpi soundwire_amd snd_hda_codec_realtek
> > > [   48.856732]  soundwire_generic_allocation soundwire_bus
> > > snd_hda_codec_generic snd_soc_sdca snd_hda_scodec_component snd_hda_c=
odec_hdmi
> > > snd_soc_core mt7925e snd_compress mt7925_common snd_hda_intel ac97_bu=
s
> > > mt792x_lib snd_intel_dspcfg snd_pcm_dmaengine mt76_connac_lib
> > > snd_intel_sdw_acpi snd_rpl_pci_acp6x kvm_amd mt76 snd_hda_codec snd_a=
cp_pci
> > > think_lmi snd_amd_acpi_mach kvm snd_hda_core snd_acp_legacy_common
> > > snd_pci_acp6x snd_hwdep mac80211 snd_pcm_oss snd_mixer_oss irqbypass
> > > snd_pci_acp5x snd_ctl_led snd_pcm libarc4 rapl pcspkr firmware_attrib=
utes_class
> > > snd_timer lenovo_wmi_hotkey_utilities snd_rn_pci_acp3x wmi_bmof cfg80=
211
> > > snd_acp_config snd snd_soc_acpi k10temp hid_sensor_als spd5118 amdxdn=
a amd_pmf
> > > snd_pci_acp3x rfkill soundcore hid_sensor_trigger industrialio_trigge=
red_buffer
> > > amdtee kfifo_buf joydev hid_sensor_iio_common ccp industrialio amd_pm=
c
> > > platform_profile mousedev mac_hid sch_fq_codel uinput i2c_dev parport=
_pc ppdev
> > > lp parport nvme_fabrics nfnetlink ip_tables x_tables dm_crypt encrypt=
ed_keys
> > > trusted
> > > [   48.856786]  asn1_encoder tee dm_mod raid10 raid456 async_raid6_re=
cov
> > > async_memcpy async_pq async_xor async_tx raid1 raid0 linear md_mod ig=
c ptp
> > > pps_core uas usb_storage hid_logitech_hidpp r8153_ecm cdc_ether usbne=
t
> > > hid_logitech_dj r8152 mii usbhid amdgpu i2c_algo_bit drm_ttm_helper t=
tm
> > > drm_panel_backlight_quirks polyval_clmulni polyval_generic drm_exec
> > > ghash_clmulni_intel drm_suballoc_helper amdxcp sha512_ssse3 sdhci_pci=
 drm_buddy
> > > sha256_ssse3 thunderbolt hid_sensor_custom r8169 sha1_ssse3 serio_raw
> > > sp5100_tco sdhci_uhs2 gpu_sched nvme sdhci hid_multitouch realtek
> > > hid_sensor_hub aesni_intel atkbd ucsi_acpi drm_display_helper hid_gen=
eric
> > > nvme_core cqhci crypto_simd mdio_devres libps2 video typec_ucsi i2c_p=
iix4
> > > vivaldi_fmap cryptd nvme_keyring typec libphy mmc_core i2c_smbus i804=
2 cec
> > > i2c_hid_acpi amd_sfh nvme_auth roles wmi serio i2c_hid
> > > [   48.856843] CR2: ffff8a510ee72018
> > > [   48.856846] ---[ end trace 0000000000000000 ]---
> > > [   50.304586] RIP: 0010:__srcu_read_unlock+0x1a/0x30
> > > [   50.304601] Code: c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 =
f3 0f 1e
> > > fa 0f 1f 44 00 00 f0 83 44 24 fc 00 48 63 f6 48 c1 e6 04 48 03 77 08 =
<65> 48 ff
> > > 46 08 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90
> > > [   50.304603] RSP: 0018:ffffd037cc29fd88 EFLAGS: 00010202
> > > [   50.304606] RAX: 0000000000000000 RBX: ffff8a4c6b16fe08 RCX:
> > > 0000000000000000
> > > [   50.304607] RDX: 0000000000000002 RSI: 0000000000000010 RDI:
> > > ffff8a4c6b16fe38
> > > [   50.304608] RBP: ffffd037cc29fdf8 R08: 0000000000000000 R09:
> > > 00000000fffffffd
> > > [   50.304609] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > > 0000000000000000
> > > [   50.304610] R13: ffff8a4ac182dbc0 R14: 0000000000000001 R15:
> > > 0000000000000000
> > > [   50.304611] FS:  0000000000000000(0000) GS:ffff8a510ee72000(0000)
> > > knlGS:0000000000000000
> > > [   50.304612] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   50.304613] CR2: ffff8a510ee72018 CR3: 0000000121904000 CR4:
> > > 0000000000f50ef0
> > > [   50.304615] PKRU: 55555554
> > > [   50.304616] note: kworker/0:3[7237] exited with irqs disabled
> > > ```
> > >=20
> > > Bisect log:
> > >=20
> > > ```
> > > # good: [38fec10eb60d687e30c8c6b5420d86e8149f7557] Linux 6.14
> > > git bisect good 38fec10eb60d687e30c8c6b5420d86e8149f7557
> > > # bad: [9c32cda43eb78f78c73aee4aa344b777714e259b] Linux 6.15-rc3
> > > git bisect bad 9c32cda43eb78f78c73aee4aa344b777714e259b
> > > # bad: [4a4b30ea80d8cb5e8c4c62bb86201f4ea0d9b030] Merge tag
> > > 'bcachefs-2025-03-24' of git://evilpiepirate.org/bcachefs
> > > git bisect bad 4a4b30ea80d8cb5e8c4c62bb86201f4ea0d9b030
> > > # bad: [1e1ba8d23dae91e6a9cfeb1236b02749e8a49ab3] Merge tag
> > > 'timers-clocksource-2025-03-26' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > > git bisect bad 1e1ba8d23dae91e6a9cfeb1236b02749e8a49ab3
> > > # skip: [21e0ff5b10ec1b61fda435d42db4ba80d0cdfded] Merge tag 'acpi-6.=
15-rc1' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> > > git bisect skip 21e0ff5b10ec1b61fda435d42db4ba80d0cdfded
> > > # good: [47c4f9b1722fd883c9745d7877cb212e41dd2715] Tidy up ASoC contr=
ol get and
> > > put handlers
> > > git bisect good 47c4f9b1722fd883c9745d7877cb212e41dd2715
> > > # bad: [2899aa3973efa3b0a7005cb7fb60475ea0c3b8a0] Merge tag
> > > 'x86_cache_for_v6.15' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/tip/tip
> > > git bisect bad 2899aa3973efa3b0a7005cb7fb60475ea0c3b8a0
> > > # good: [5a658afd468b0fb55bf5f45c9788ee8dc87ba463] Merge tag
> > > 'objtool-core-2025-03-22' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > > git bisect good 5a658afd468b0fb55bf5f45c9788ee8dc87ba463
> > > # bad: [a49a879f0ac19ed0a562e220019741857b261551] Merge tag
> > > 'x86-cleanups-2025-03-22' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > > git bisect bad a49a879f0ac19ed0a562e220019741857b261551
> > > # bad: [9a93e29f16bbba90a63faad0abbc6dea3b2f0c63] x86/syscall: Move
> > > sys_ni_syscall()
> > > git bisect bad 9a93e29f16bbba90a63faad0abbc6dea3b2f0c63
> > > # bad: [cfdaa618defc5ebe1ee6aa5bd40a7ccedffca6de] Merge branch 'x86/c=
pu' into
> > > x86/asm, to pick up dependent commits
> > > git bisect bad cfdaa618defc5ebe1ee6aa5bd40a7ccedffca6de
> > > # good: [c4a8b7116b9927f7b00bd68140e285662a03068e] perf/x86/intel: Us=
e cache
> > > cpu-type for hybrid PMU selection
> > > git bisect good c4a8b7116b9927f7b00bd68140e285662a03068e
> > > # good: [4f2a0b765c9731d2fa94e209ee9ae0e96b280f17] <linux/sizes.h>: C=
over all
> > > possible x86 CPU cache sizes
> > > git bisect good 4f2a0b765c9731d2fa94e209ee9ae0e96b280f17
> > > # bad: [95b0916118106054e1f3d5d7f8628ef3dc0b3c02] percpu: Remove
> > > PER_CPU_FIRST_SECTION
> > > git bisect bad 95b0916118106054e1f3d5d7f8628ef3dc0b3c02
> > > # skip: [78c4374ef8b842c6abf195d6f963853c7ec464d2] x86/module: Deal w=
ith GOT
> > > based stack cookie load on Clang < 17
> > > git bisect skip 78c4374ef8b842c6abf195d6f963853c7ec464d2
> > > # bad: [b5c4f95351a097a635c1a7fc8d9efa18308491b5] x86/percpu/64: Remo=
ve
> > > fixed_percpu_data
> > > git bisect bad b5c4f95351a097a635c1a7fc8d9efa18308491b5
> > > # skip: [cb7927fda002ca49ae62e2782c1692acc7b80c67] x86/relocs: Handle
> > > R_X86_64_REX_GOTPCRELX relocations
> > > git bisect skip cb7927fda002ca49ae62e2782c1692acc7b80c67
> > > # skip: [80d47defddc000271502057ebd7efa4fd6481542] x86/stackprotector=
/64:
> > > Convert to normal per-CPU variable
> > > git bisect skip 80d47defddc000271502057ebd7efa4fd6481542
> > > # skip: [f58b63857ae38b4484185b799a2759274b930c92] x86/pvh: Use
> > > fixed_percpu_data for early boot GSBASE
> > > git bisect skip f58b63857ae38b4484185b799a2759274b930c92
> > > # good: [0ee2689b9374d6fd5f43b703713a532278654749] x86/stackprotector=
: Remove
> > > stack protector test scripts
> > > git bisect good 0ee2689b9374d6fd5f43b703713a532278654749
> > > # bad: [9d7de2aa8b41407bc96d89a80dc1fd637d389d42] x86/percpu/64: Use =
relative
> > > percpu offsets
> > > git bisect bad 9d7de2aa8b41407bc96d89a80dc1fd637d389d42
> > > # good: [a9a76b38aaf577887103e3ebb41d70e6aa5a4b19] x86/boot: Disable =
stack
> > > protector for early boot code
> > > git bisect good a9a76b38aaf577887103e3ebb41d70e6aa5a4b19
> > > # only skipped commits left to test
> > > # possible first bad commit: [9d7de2aa8b41407bc96d89a80dc1fd637d389d4=
2]
> > > x86/percpu/64: Use relative percpu offsets
> > > # possible first bad commit: [80d47defddc000271502057ebd7efa4fd648154=
2]
> > > x86/stackprotector/64: Convert to normal per-CPU variable
> > > # possible first bad commit: [78c4374ef8b842c6abf195d6f963853c7ec464d=
2]
> > > x86/module: Deal with GOT based stack cookie load on Clang < 17
> > > # possible first bad commit: [cb7927fda002ca49ae62e2782c1692acc7b80c6=
7]
> > > x86/relocs: Handle R_X86_64_REX_GOTPCRELX relocations
> > > # possible first bad commit: [f58b63857ae38b4484185b799a2759274b930c9=
2]
> > > x86/pvh: Use fixed_percpu_data for early boot GSBASE
> > > ```
> > >=20
> > > There is a typo in commit f58b63857ae3 ("x86/pvh: Use fixed_percpu_da=
ta for
> > > early boot GSBASE"), resulting in compilation failure.
> > > With the patch below, I bisected again:
> > >=20
> > > ```
> > > diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/hea=
d.S
> > > index 723f181b222a..f1a8392a4835 100644
> > > --- a/arch/x86/platform/pvh/head.S
> > > +++ b/arch/x86/platform/pvh/head.S
> > > @@ -180,7 +180,7 @@ SYM_CODE_START(pvh_start_xen)
> > >          */
> > >         movl $MSR_GS_BASE,%ecx
> > >         leaq INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
> > > -       movq %edx, %eax
> > > +       movl %edx, %eax
> > >         shrq $32, %rdx
> > >         wrmsr
> > > ```
> > >=20
> > > New bisect log:
> > >=20
> > > ```
> > > [...]
> > > # good: [a9a76b38aaf577887103e3ebb41d70e6aa5a4b19] x86/boot: Disable =
stack
> > > protector for early boot code
> > > git bisect good a9a76b38aaf577887103e3ebb41d70e6aa5a4b19
> > > # good: [78c4374ef8b842c6abf195d6f963853c7ec464d2] x86/module: Deal w=
ith GOT
> > > based stack cookie load on Clang < 17
> > > git bisect good 78c4374ef8b842c6abf195d6f963853c7ec464d2
> > > # good: [80d47defddc000271502057ebd7efa4fd6481542] x86/stackprotector=
/64:
> > > Convert to normal per-CPU variable
> > > git bisect good 80d47defddc000271502057ebd7efa4fd6481542
> > > # first bad commit: [9d7de2aa8b41407bc96d89a80dc1fd637d389d42] x86/pe=
rcpu/64:
> > > Use relative percpu offsets
> > > ```
> > >=20
> > > The bad commit 9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offs=
ets")
> > > first appeared in v6.15-rc1.
> > >=20
> > > Got dmesg below by building and booting the bad commit, then unpluggi=
ng the
> > > receiver:
> > >=20
> > > ```
> > > [  560.223095] BUG: unable to handle page fault for address: ffff9acf=
2b889008
> > > [  560.223174] #PF: supervisor write access in kernel mode
> > > [  560.223299] #PF: error_code(0x0002) - not-present page
> > > [  560.223332] PGD 43e401067 P4D 43e401067 PUD 0
> > > [  560.223353] Oops: Oops: 0002 [#1] PREEMPT SMP NOPTI
> > > [  560.223359] CPU: 0 UID: 0 PID: 8212 Comm: kworker/0:3 Tainted: G  =
   U     =20
> > >       6.14.0-rc3+ #1 ab962f3b7921227b62db2503d8ec7411fa694628
> > > [  560.223364] Tainted: [U]=3DUSER
> > > [  560.223369] Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN24WW =
03/11/2025
> > > [  560.223378] Workqueue: events hidinput_led_worker
> > > [  560.223382] RIP: 0010:__srcu_read_lock+0x14/0x30
> > > [  560.223387] Code: 0f 0b eb bc 66 2e 0f 1f 84 00 00 00 00 00 0f 1f =
84 00 00
> > > 00 00 00 f3 0f 1e fa 0f 1f 44 00 00 8b 07 48 8b 57 08 83 e0 01 89 c1 =
<65> 48 ff
> > > 04 ca f0 83 44 24 fc 00 c3 cc cc cc cc 66 66 2e 0f 1f 84
> > > [  560.223392] RSP: 0018:ffffb7df8d24fd88 EFLAGS: 00010202
> > > [  560.223396] RAX: 0000000000000001 RBX: ffff9ac82f80de08 RCX:
> > > 0000000000000001
> > > [  560.223401] RDX: 0000000000000000 RSI: ffff9ac8fd276f40 RDI:
> > > ffff9ac82f80de38
> > > [  560.223407] RBP: ffffb7df8d24fdf8 R08: 0000000000000000 R09:
> > > 00000000fffffffd
> > > [  560.223412] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > > 0000000000000000
> > > [  560.223417] R13: ffff9ac8fd276f40 R14: 000000000000000e R15:
> > > 0000000000000000
> > > [  560.223421] FS:  0000000000000000(0000) GS:ffff9acf2b889000(0000)
> > > knlGS:0000000000000000
> > > [  560.223426] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  560.223430] CR2: ffff9acf2b889008 CR3: 00000001e1c40000 CR4:
> > > 0000000000f50ef0
> > > [  560.223434] PKRU: 55555554
> > > [  560.223439] Call Trace:
> > > [  560.223444]  <TASK>
> > > [  560.223449]  ? __die_body.cold+0x19/0x29
> > > [  560.223453]  ? page_fault_oops+0x15a/0x2e0
> > > [  560.223458]  ? search_bpf_extables+0x5f/0x80
> > > [  560.223462]  ? exc_page_fault+0x1a3/0x1b0
> > > [  560.223466]  ? asm_exc_page_fault+0x26/0x30
> > > [  560.223471]  ? __srcu_read_lock+0x14/0x30
> > > [  560.223475]  ? psi_task_switch+0xb7/0x200
> > > [  560.223480]  dispatch_hid_bpf_output_report+0x73/0x100
> > > [  560.223485]  hid_hw_output_report+0x46/0x90
> > > [  560.223490]  hidinput_led_worker+0xa9/0xe0
> > > [  560.223494]  process_one_work+0x17b/0x330
> > > [  560.223498]  worker_thread+0x2ce/0x3f0
> > > [  560.223503]  ? rescuer_thread+0x530/0x530
> > > [  560.223507]  kthread+0xeb/0x230
> > > [  560.223512]  ? kthreads_online_cpu+0x120/0x120
> > > [  560.223516]  ret_from_fork+0x31/0x50
> > > [  560.223522]  ? kthreads_online_cpu+0x120/0x120
> > > [  560.223528]  ret_from_fork_asm+0x11/0x20
> > > [  560.223532]  </TASK>
> > > [  560.223538] Modules linked in: tcp_diag inet_diag xt_mark snd_hrti=
mer
> > > snd_seq_dummy snd_seq_midi snd_seq_oss snd_seq_midi_event snd_seq uhi=
d rfcomm
> > > cmac algif_hash algif_skcipher af_alg xt_CHECKSUM xt_MASQUERADE xt_co=
nntrack
> > > ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat
> > > nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 tun bridge stp llc nf_tabl=
es
> > > snd_usb_audio snd_usbmidi_lib snd_ump snd_rawmidi snd_seq_device qrtr=
 bnep
> > > overlay sunrpc vfat fat uvcvideo videobuf2_vmalloc uvc videobuf2_memo=
ps btusb
> > > videobuf2_v4l2 btrtl videobuf2_common btintel btbcm videodev btmtk mc=
 bluetooth
> > > snd_acp_legacy_mach snd_acp_mach snd_soc_nau8821 snd_acp3x_rn snd_acp=
70
> > > snd_acp_i2s snd_acp_pdm snd_soc_dmic snd_acp_pcm snd_sof_amd_acp70
> > > snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_a=
md_renoir
> > > snd_sof_amd_acp intel_rapl_msr amd_atl snd_sof_pci intel_rapl_common
> > > snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_soc_acpi_amd_=
match
> > > snd_amd_sdw_acpi soundwire_amd soundwire_generic_allocation snd_ctl_l=
ed
> > > [  560.223612]  soundwire_bus snd_soc_sdca snd_hda_codec_realtek
> > > snd_hda_codec_generic snd_soc_core mt7925e snd_hda_scodec_component
> > > mt7925_common snd_compress mt792x_lib snd_hda_codec_hdmi ac97_bus snd=
_hda_intel
> > > mt76_connac_lib snd_pcm_dmaengine snd_intel_dspcfg mt76 snd_rpl_pci_a=
cp6x
> > > snd_intel_sdw_acpi snd_hda_codec kvm_amd snd_acp_pci think_lmi snd_hd=
a_core
> > > snd_acp_legacy_common mac80211 kvm snd_pci_acp6x snd_hwdep snd_pcm_os=
s
> > > snd_mixer_oss snd_pci_acp5x libarc4 amd_pmf rapl pcspkr
> > > firmware_attributes_class wmi_bmof hid_sensor_als amdtee snd_pcm
> > > hid_sensor_trigger snd_rn_pci_acp3x cfg80211 industrialio_triggered_b=
uffer
> > > snd_timer joydev snd_acp_config kfifo_buf spd5118 snd snd_soc_acpi
> > > hid_sensor_iio_common ccp soundcore snd_pci_acp3x rfkill platform_pro=
file
> > > amdxdna k10temp industrialio amd_pmc mousedev mac_hid sch_fq_codel ui=
nput
> > > i2c_dev parport_pc ppdev lp parport nvme_fabrics nvme_keyring nfnetli=
nk
> > > ip_tables x_tables dm_crypt encrypted_keys trusted asn1_encoder tee d=
m_mod
> > > raid10 raid456 async_raid6_recov
> > > [  560.223631]  async_memcpy async_pq async_xor async_tx raid1 raid0 =
linear
> > > md_mod igc ptp pps_core uas usb_storage hid_logitech_hidpp r8153_ecm =
cdc_ether
> > > usbnet hid_logitech_dj r8152 mii usbhid amdgpu i2c_algo_bit drm_ttm_h=
elper ttm
> > > drm_panel_backlight_quirks polyval_clmulni drm_exec polyval_generic
> > > ghash_clmulni_intel drm_suballoc_helper sha512_ssse3 amdxcp hid_senso=
r_custom
> > > serio_raw sha256_ssse3 drm_buddy sdhci_pci ucsi_acpi atkbd nvme hid_m=
ultitouch
> > > r8169 sha1_ssse3 sp5100_tco hid_sensor_hub typec_ucsi libps2 gpu_sche=
d
> > > sdhci_uhs2 vivaldi_fmap aesni_intel nvme_core sdhci hid_generic realt=
ek typec
> > > drm_display_helper video i8042 crypto_simd i2c_piix4 mdio_devres cqhc=
i cryptd
> > > thunderbolt mmc_core libphy cec amd_sfh nvme_auth roles i2c_smbus ser=
io
> > > i2c_hid_acpi wmi i2c_hid
> > > [  560.223646] CR2: ffff9acf2b889008
> > > [  560.223650] ---[ end trace 0000000000000000 ]---
> > > [  560.223655] RIP: 0010:__srcu_read_lock+0x14/0x30
> > > [  560.223660] Code: 0f 0b eb bc 66 2e 0f 1f 84 00 00 00 00 00 0f 1f =
84 00 00
> > > 00 00 00 f3 0f 1e fa 0f 1f 44 00 00 8b 07 48 8b 57 08 83 e0 01 89 c1 =
<65> 48 ff
> > > 04 ca f0 83 44 24 fc 00 c3 cc cc cc cc 66 66 2e 0f 1f 84
> > > [  560.223664] RSP: 0018:ffffb7df8d24fd88 EFLAGS: 00010202
> > > [  560.223670] RAX: 0000000000000001 RBX: ffff9ac82f80de08 RCX:
> > > 0000000000000001
> > > [  560.223674] RDX: 0000000000000000 RSI: ffff9ac8fd276f40 RDI:
> > > ffff9ac82f80de38
> > > [  560.223679] RBP: ffffb7df8d24fdf8 R08: 0000000000000000 R09:
> > > 00000000fffffffd
> > > [  560.223683] R10: 0000000000000001 R11: 00000000ffffffff R12:
> > > 0000000000000000
> > > [  560.223687] R13: ffff9ac8fd276f40 R14: 000000000000000e R15:
> > > 0000000000000000
> > > [  560.223692] FS:  0000000000000000(0000) GS:ffff9acf2b889000(0000)
> > > knlGS:0000000000000000
> > > [  560.223696] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  560.223700] CR2: ffff9acf2b889008 CR3: 00000001e1c40000 CR4:
> > > 0000000000f50ef0
> > > [  560.223704] PKRU: 55555554
> > > [  560.223709] note: kworker/0:3[8212] exited with irqs disabled
> > > ```
> > >=20
> > > --=20
> > > You may reply to this email to add a comment.
> > >=20
> > > You are receiving this mail because:
> > > You are watching the assignee of the bug.
> >=20
> > --=20
> > Regards/Gruss,
> >     Boris.
> >=20
> > https://people.kernel.org/tglx/notes-about-netiquette

--=-vYWgKKVpA1BcZkQ9EbdN
Content-Disposition: attachment; filename="6.15-rc5_per-cpu-pf_bpftrace"
Content-Type: text/plain; name="6.15-rc5_per-cpu-pf_bpftrace"; charset="UTF-8"
Content-Transfer-Encoding: base64

WzQ1Ni45ODgxMzQgLSBrd29ya2VyLzA6MigxMTExMSlAQ1BVIzBdOiBmZW50cnk6dm1saW51eDpk
aXNwYXRjaF9oaWRfYnBmX291dHB1dF9yZXBvcnQ6CnsgLmhkZXYgPSAweGZmZmY4YmU1YjRlNTAw
MDAsIC5idWYgPSAweGZmZmY4YmU4YzJiNzk3MTAsIC5zaXplID0gMiwgLnNvdXJjZSA9IDAsIC5m
cm9tX2JwZiA9IDAgfQoKYnBmX3Byb2dfZmEwMTFhNjQ1YmRkMzUzMF9mZW50cnlfdm1saW51eF9k
aXNwYXRjaF9oaWRfYnBmX291dHB1dF9yZXBvcnRfMSsxMTE3CmJwZl9wcm9nX2ZhMDExYTY0NWJk
ZDM1MzBfZmVudHJ5X3ZtbGludXhfZGlzcGF0Y2hfaGlkX2JwZl9vdXRwdXRfcmVwb3J0XzErMTEx
NwpicGZfdHJhbXBvbGluZV82NDQyNTMzMTk1Kzk4CmRpc3BhdGNoX2hpZF9icGZfb3V0cHV0X3Jl
cG9ydCs5CmhpZF9od19vdXRwdXRfcmVwb3J0KzcwCmhpZGlucHV0X2xlZF93b3JrZXIrMTY5CnBy
b2Nlc3Nfb25lX3dvcmsrMzk5Cndvcmtlcl90aHJlYWQrNzIzCmt0aHJlYWQrMjQ5CnJldF9mcm9t
X2ZvcmsrNDkKcmV0X2Zyb21fZm9ya19hc20rMTcKCipoZGV2Ogp7IC5kZXZfcmRlc2MgPSAweGZm
ZmY4YmU1ODE5ODZlMDAsIC5icGZfcmRlc2MgPSAweGZmZmY4YmU1ODE5ODZlMDAsIC5yZGVzYyA9
IDB4ZmZmZjhiZTU4NmMwMzQwMCwgLmRldl9yc2l6ZSA9IDIzNCwgLmJwZl9yc2l6ZSA9IDIzNCwg
LnJzaXplID0gMjM0LCAuY29sbGVjdGlvbl9zaXplID0gMTYsIC5jb2xsZWN0aW9uID0gMHhmZmZm
OGJlNTg2YzAyNDAwLCAubWF4Y29sbGVjdGlvbiA9IDYsIC5tYXhhcHBsaWNhdGlvbiA9IDUsIC5i
dXMgPSAzLCAuZ3JvdXAgPSAyNTgsIC52ZW5kb3IgPSAxMTMzLCAucHJvZHVjdCA9IDE2NTE0LCAu
dmVyc2lvbiA9IDI3MywgLnR5cGUgPSAwLCAuY291bnRyeSA9IDAsIC5yZXBvcnRfZW51bSA9IFt7
IC5udW1iZXJlZCA9IDEsIC5yZXBvcnRfbGlzdCA9IHsgLm5leHQgPSAweGZmZmY4YmU1YWE4YTkw
MDAsIC5wcmV2ID0gMHhmZmZmOGJlNWI0ZTQ0MDAwIH0sIC5yZXBvcnRfaWRfaGFzaCA9IFsweDAs
MHhmZmZmOGJlNWFhOGE5MDAwLDB4ZmZmZjhiZTVhYThhZDAwMCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHhmZmZmOGJlNWFhOGFjMDAwLDB4ZmZm
ZjhiZTVhYThhYTAwMCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4ZmZmZjhiZTU4MDFkZTAwMCwweGZmZmY4YmU1YjRlNDQwMDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDBdIH0seyAubnVtYmVyZWQgPSAxLCAucmVwb3J0X2xp
c3QgPSB7IC5uZXh0ID0gMHhmZmZmOGJlNWFhOGFlMDAwLCAucHJldiA9IDB4ZmZmZjhiZTViNGU0
NTAwMCB9LCAucmVwb3J0X2lkX2hhc2ggPSBbMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweGZmZmY4YmU1YWE4YWUwMDAsMHgwLDB4ZmZmZjhi
ZTVhYThhODAwMCwweGZmZmY4YmU1YWE4YWYwMDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweGZmZmY4YmU1YjRlNDAwMDAsMHhmZmZmOGJl
NWI0ZTQ1MDAwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwXSB9LHsgLm51bWJlcmVk
ID0gMCwgLnJlcG9ydF9saXN0ID0geyAubmV4dCA9IDB4ZmZmZjhiZTViNGU1MTA4OCwgLnByZXYg
PSAweGZmZmY4YmU1YjRlNTEwODggfSwgLnJlcG9ydF9pZF9oYXNoID0gWzB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAs
MHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCww
eDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4
MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgw
LDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MCwweDAsMHgwLDB4MF0gfV0sIC5sZWRfd29yayA9
IHsgLmRhdGEgPSAsIC5lbnRyeSA9IHsgLm5leHQgPSAweGZmZmY4YmU1YjRlNTE4YTAsIC5wcmV2
ID0gMHhmZmZmOGJlNWI0ZTUxOGEwIH0sIC5mdW5jID0gMHhmZmZmZmZmZjg5YWQ1ZWQwIH0sIC5k
cml2ZXJfaW5wdXRfbG9jayA9IHsgLmxvY2sgPSB7IC5yYXdfbG9jayA9IHsgLnZhbCA9ICwgLmxv
Y2tlZCA9IDAsIC5wZW5kaW5nID0gMCwgLmxvY2tlZF9wZW5kaW5nID0gMCwgLnRhaWwgPSAwIH0g
fSwgLmNvdW50ID0gMCwgLndhaXRfbGlzdCA9IHsgLm5leHQgPSAweGZmZmY4YmU1YjRlNTE4YzAs
IC5wcmV2ID0gMHhmZmZmOGJlNWI0ZTUxOGMwIH0gfSwgLmRldiA9IHsgLmtvYmogPSB7IC5uYW1l
ID0gMHhmZmZmOGJlNWI0YzI1MDQwLCAuZW50cnkgPSB7IC5uZXh0ID0gMHhmZmZmOGJlNWE5YzQ3
OGQ4LCAucHJldiA9IDB4ZmZmZjhiZTU4OTUwNTQxOCB9LCAucGFyZW50ID0gMHhmZmZmOGJlNWI0
ZTJiOGQwLCAua3NldCA9IDB4ZmZmZjhiZTU4MDJjMTE4MCwgLmt0eXBlID0gMHhmZmZmZmZmZjg5
ZmI3OWMwLCAuc2QgPSAweGZmZmY4YmU1YTczMThjMzgsIC5rcmVmID0geyAucmVmY291bnQgPSB7
IC5yZWZzID0gIH0gfSwgLnN0YXRlX2luaXRpYWxpemVkID0gNywgLnN0YXRlX2luX3N5c2ZzID0g
NywgLnN0YXRlX2FkZF91ZXZlbnRfc2VudCA9IDcsIC5zdGF0ZV9yZW1vdmVfdWV2ZW50X3NlbnQg
PSA3LCAudWV2ZW50X3N1cHByZXNzID0gNyB9LCAucGFyZW50ID0gMHhmZmZmOGJlNWI0ZTJiOGQw
LCAucCA9IDB4ZmZmZjhiZTU4MTk4NzkwMCwgLmluaXRfbmFtZSA9IDB4MCwgLnR5cGUgPSAweDAs
IC5idXMgPSAweGZmZmZmZmZmOGEwMWQ4YzAsIC5kcml2ZXIgPSAweGZmZmZmZmZmYzA5NDQxMjgs
IC5wbGF0Zm9ybV9kYXRhID0gMHgwLCAuZHJpdmVyX2RhdGEgPSAweGZmZmY4YmU1OGFkZTEwMjgs
IC5tdXRleCA9IHsgLm93bmVyID0gLCAud2FpdF9sb2NrID0geyAucmF3X2xvY2sgPSB7IC52YWwg
PSAsIC5sb2NrZWQgPSAwLCAucGVuZGluZyA9IDAsIC5sb2NrZWRfcGVuZGluZyA9IDAsIC50YWls
ID0gMCB9IH0sIC5vc3EgPSB7IC50YWlsID0gIH0sIC53YWl0X2xpc3QgPSB7IC5uZXh0ID0gMHhm
ZmZmOGJlNWI0ZTUxOTYwLCAucHJldiA9IDB4ZmZmZjhiZTViNGU1MTk2MCB9IH0sIC5saW5rcyA9
IHsgLnN1cHBsaWVycyA9IHsgLm5leHQgPSAweGZmZmY4YmU1YjRlNTE5NzAsIC5wcmV2ID0gMHhm
ZmZmOGJlNWI0ZTUxOTcwIH0sIC5jb25zdW1lcnMgPSB7IC5uZXh0ID0gMHhmZmZmOGJlNWI0ZTUx
OTgwLCAucHJldiA9IDB4ZmZmZjhiZTViNGU1MTk4MCB9LCAuZGVmZXJfc3luYyA9IHsgLm5leHQg
PSAweGZmZmY4YmU1YjRlNTE5OTAsIC5wcmV2ID0gMHhmZmZmOGJlNWI0ZTUxOTkwIH0sIC5zdGF0
dXMgPSAzIH0sIC5wb3dlciA9IHsgLnBvd2VyX3N0YXRlID0geyAuZXZlbnQgPSAwIH0sIC5jYW5f
d2FrZXVwID0gNiwgLmFzeW5jX3N1c3BlbmQgPSA2LCAuaW5fZHBtX2xpc3QgPSA2LCAuaXNfcHJl
cGFyZWQgPSA2LCAuaXNfc3VzcGVuZGVkID0gNiwgLmlzX25vaXJxX3N1c3BlbmRlZCA9IDYsIC5p
c19sYXRlX3N1c3BlbmRlZCA9IDYsIC5ub19wbSA9IDYsIC5lYXJseV9pbml0ID0gMSwgLmRpcmVj
dF9jb21wbGV0ZSA9IDEsIC5kcml2ZXJfZmxhZ3MgPSAwLCAubG9jayA9IHsgLnJsb2NrID0geyAu
cmF3X2xvY2sgPSB7IC52YWwgPSAsIC5sb2NrZWQgPSAwLCAucGVuZGluZyA9IDAsIC5sb2NrZWRf
cGVuZGluZyA9IDAsIC50YWlsID0gMCB9IH0gfSwgLmVudHJ5ID0geyAubmV4dCA9IDB4ZmZmZjhi
ZTVhOWM0NzliOCwgLnByZXYgPSAweGZmZmY4YmU1ODk1MDU0ZjggfSwgLmNvbXBsZXRpb24gPSB7
IC5kb25lID0gNDI5NDk2NzI5NSwgLndhaXQgPSB7IC5sb2NrID0geyAucmF3X2xvY2sgPSB7IC52
YWwgPSAsIC5sb2NrZWQgPSAwLCAucGVuZGluZyA9IDAsIC5sb2NrZWRfcGVuZGluZyA9IDAsIC50
YWlsID0gMCB9IH0sIC50YXNrX2xpc3QgPSB7IC5uZXh0ID0gMHhmZmZmOGJlNWI0ZTUxOWQ4LCAu
cHJldiA9IDB4ZmZmZjhiZTViNGU1MTlkOCB9IH0gfSwgLndha2V1cCA9IDB4MCwgLndha2V1cF9w
YXRoID0gNCwgLnN5c2NvcmUgPSA0LCAubm9fcG1fY2FsbGJhY2tzID0gNCwgLndvcmtfaW5fcHJv
Z3Jlc3MgPSA0LCAuc21hcnRfc3VzcGVuZCA9IDQsIC5tdXN0X3Jlc3VtZSA9IDQsIC5tYXlfc2tp
cF9yZXN1bWUgPSA0LCAuc3VzcGVuZF90aW1lciA9IHsgLm5vZGUgPSB7IC5ub2RlID0geyAuX19y
Yl9wYXJlbnRfY29sb3IgPSAxODQ0NjYxNjQxNzQzMTUyNTg4MCwgLnJiX3JpZ2h0ID0gMHgwLCAu
cmJfbGVmdCA9IDB4MCB9LCAuZXhwaXJlcyA9IDAgfSwgLl9zb2Z0ZXhwaXJlcyA9IDAsIC5mdW5j
dGlvbiA9IDB4ZmZmZmZmZmY4OTk4MGQxMCwgLmJhc2UgPSAweGZmZmY4YmVjNWY2MjBkNDAsIC5z
dGF0ZSA9IDAsIC5pc19yZWwgPSAwLCAuaXNfc29mdCA9IDAsIC5pc19oYXJkID0gMCB9LCAudGlt
ZXJfZXhwaXJlcyA9IDAsIC53b3JrID0geyAuZGF0YSA9ICwgLmVudHJ5ID0geyAubmV4dCA9IDB4
ZmZmZjhiZTViNGU1MWE0OCwgLnByZXYgPSAweGZmZmY4YmU1YjRlNTFhNDggfSwgLmZ1bmMgPSAw
eGZmZmZmZmZmODk5ODEyNjAgfSwgLndhaXRfcXVldWUgPSB7IC5sb2NrID0geyAucmxvY2sgPSB7
IC5yYXdfbG9jayA9IHsgLnZhbCA9ICwgLmxvY2tlZCA9IDAsIC5wZW5kaW5nID0gMCwgLmxvY2tl
ZF9wZW5kaW5nID0gMCwgLnRhaWwgPSAwIH0gfSB9LCAuaGVhZCA9IHsgLm5leHQgPSAweGZmZmY4
YmU1YjRlNTFhNjgsIC5wcmV2ID0gMHhmZmZmOGJlNWI0ZTUxYTY4IH0gfSwgLndha2VpcnEgPSAw
eDAsIC51c2FnZV9jb3VudCA9ICwgLmNoaWxkX2NvdW50ID0gLCAuZGlzYWJsZV9kZXB0aCA9IDEy
OSwgLmlkbGVfbm90aWZpY2F0aW9uID0gMTI5LCAucmVxdWVzdF9wZW5kaW5nID0gMTI5LCAuZGVm
ZXJyZWRfcmVzdW1lID0gMTI5LCAubmVlZHNfZm9yY2VfcmVzdW1lID0gMTI5LCAucnVudGltZV9h
dXRvID0gMTI5LCAuaWdub3JlX2NoaWxkcmVuID0gMCwgLm5vX2NhbGxiYWNrcyA9IDAsIC5pcnFf
c2FmZSA9IDAsIC51c2VfYXV0b3N1c3BlbmQgPSAwLCAudGltZXJfYXV0b3N1c3BlbmRzID0gMCwg
Lm1lbWFsbG9jX25vaW8gPSAwLCAubGlua3NfY291bnQgPSAwLCAucmVxdWVzdCA9IDAsIC5ydW50
aW1lX3N0YXR1cyA9IDIsIC5sYXN0X3N0YXR1cyA9IDQyOTQ5NjcyOTUsIC5ydW50aW1lX2Vycm9y
ID0gMCwgLmF1dG9zdXNwZW5kX2RlbGF5ID0gMCwgLmxhc3RfYnVzeSA9IDAsIC5hY3RpdmVfdGlt
ZSA9IDAsIC5zdXNwZW5kZWRfdGltZSA9IDAsIC5hY2NvdW50aW5nX3RpbWVzdGFtcCA9IDAsIC5z
dWJzeXNfZGF0YSA9IDB4MCwgLnNldF9sYXRlbmN5X3RvbGVyYW5jZSA9IDB4MCwgLnFvcyA9IDB4
MCB9LCAucG1fZG9tYWluID0gMHgwLCAuZW1fcGQgPSAweDAsIC5waW5zID0gMHgwLCAubXNpID0g
eyAuZG9tYWluID0gMHgwLCAuZGF0YSA9IDB4MCB9LCAuZG1hX29wcyA9IDB4MCwgLmRtYV9tYXNr
ID0gMHgwLCAuY29oZXJlbnRfZG1hX21hc2sgPSAwLCAuYnVzX2RtYV9saW1pdCA9IDAsIC5kbWFf
cmFuZ2VfbWFwID0gMHgwLCAuZG1hX3Bhcm1zID0gMHgwLCAuZG1hX3Bvb2xzID0geyAubmV4dCA9
IDB4ZmZmZjhiZTViNGU1MWIzOCwgLnByZXYgPSAweGZmZmY4YmU1YjRlNTFiMzggfSwgLmNtYV9h
cmVhID0gMHgwLCAuZG1hX2lvX3RsYl9tZW0gPSAweGZmZmZmZmZmOGJhNWZmMjAsIC5hcmNoZGF0
YSA9IHsgIH0sIC5vZl9ub2RlID0gMHgwLCAuZndub2RlID0gMHgwLCAubnVtYV9ub2RlID0gLTEs
IC5kZXZ0ID0gMCwgLmlkID0gMCwgLmRldnJlc19sb2NrID0geyAucmxvY2sgPSB7IC5yYXdfbG9j
ayA9IHsgLnZhbCA9ICwgLmxvY2tlZCA9IDAsIC5wZW5kaW5nID0gMCwgLmxvY2tlZF9wZW5kaW5n
ID0gMCwgLnRhaWwgPSAwIH0gfSB9LCAuZGV2cmVzX2hlYWQgPSB7IC5uZXh0ID0gMHhmZmZmOGJl
NWE3MjA2YzAwLCAucHJldiA9IDB4ZmZmZjhiZTY3NzU3ZDU4MCB9LCAuY2xhc3MgPSAweDAsIC5n
cm91cHMgPSAweDAsIC5yZWxlYXNlID0gMHhmZmZmZmZmZjg5YWQ0OWQwLCAuaW9tbXVfZ3JvdXAg
PSAweDAsIC5pb21tdSA9IDB4MCwgLnBoeXNpY2FsX2xvY2F0aW9uID0gMHgwLCAucmVtb3ZhYmxl
ID0gMCwgLm9mZmxpbmVfZGlzYWJsZWQgPSAxNiwgLm9mZmxpbmUgPSAxNiwgLm9mX25vZGVfcmV1
c2VkID0gMTYsIC5zdGF0ZV9zeW5jZWQgPSAxNiwgLmNhbl9tYXRjaCA9IDE2LCAuZG1hX3NraXBf
c3luYyA9IDE2LCAuZG1hX2lvbW11ID0gMTYgfSwgLmRyaXZlciA9IDB4ZmZmZmZmZmZjMDk0NDA4
MCwgLmRldnJlc19ncm91cF9pZCA9IDB4ZmZmZjhiZTVhNzIwNmMwMCwgLmxsX2RyaXZlciA9IDB4
ZmZmZmZmZmZjMDkwZDcyMCwgLmxsX29wZW5fbG9jayA9IHsgLm93bmVyID0gLCAud2FpdF9sb2Nr
ID0geyAucmF3X2xvY2sgPSB7IC52YWwgPSAsIC5sb2NrZWQgPSAwLCAucGVuZGluZyA9IDAsIC5s
b2NrZWRfcGVuZGluZyA9IDAsIC50YWlsID0gMCB9IH0sIC5vc3EgPSB7IC50YWlsID0gIH0sIC53
YWl0X2xpc3QgPSB7IC5uZXh0ID0gMHhmZmZmOGJlNWI0ZTUxYmU4LCAucHJldiA9IDB4ZmZmZjhi
ZTViNGU1MWJlOCB9IH0sIC5sbF9vcGVuX2NvdW50ID0gMSwgLmJhdHRlcnkgPSAweDAsIC5iYXR0
ZXJ5X2NhcGFjaXR5ID0gMCwgLmJhdHRlcnlfbWluID0gMCwgLmJhdHRlcnlfbWF4ID0gMCwgLmJh
dHRlcnlfcmVwb3J0X3R5cGUgPSAwLCAuYmF0dGVyeV9yZXBvcnRfaWQgPSAwLCAuYmF0dGVyeV9j
aGFyZ2Vfc3RhdHVzID0gMCwgLmJhdHRlcnlfc3RhdHVzID0gMCwgLmJhdHRlcnlfYXZvaWRfcXVl
cnkgPSAwLCAuYmF0dGVyeV9yYXRlbGltaXRfdGltZSA9IDAsIC5zdGF0dXMgPSAzLCAuY2xhaW1l
ZCA9IDUsIC5xdWlya3MgPSAwLCAuaW5pdGlhbF9xdWlya3MgPSAwLCAuaW9fc3RhcnRlZCA9IDAs
IC5pbnB1dHMgPSB7IC5uZXh0ID0gMHhmZmZmOGJlNWI0ZTUxYzQ4LCAucHJldiA9IDB4ZmZmZjhi
ZTViNGU1MWM0OCB9LCAuaGlkZGV2ID0gMHgwLCAuaGlkcmF3ID0gMHhmZmZmOGJlNWE3MjA2MzAw
LCAubmFtZSA9IExvZ2l0ZWNoIE1YIE1hc3RlciAzLCAucGh5cyA9IHVzYi0wMDAwOjY3OjAwLjQt
MS40LjUvaW5wdXQyOjEsIC51bmlxID0gMGQtYjctZGUtY2YsIC5kcml2ZXJfZGF0YSA9IDB4ZmZm
ZjhiZTViNGMyNTc4MCwgLmZmX2luaXQgPSAweDAsIC5oaWRkZXZfY29ubmVjdCA9IDB4MCwgLmhp
ZGRldl9kaXNjb25uZWN0ID0gMHgwLCAuaGlkZGV2X2hpZF9ldmVudCA9IDB4MCwgLmhpZGRldl9y
ZXBvcnRfZXZlbnQgPSAweDAsIC5kZWJ1ZyA9IDEsIC5kZWJ1Z19kaXIgPSAweGZmZmY4YmU1OTNh
OTM4MDAsIC5kZWJ1Z19yZGVzYyA9IDB4ZmZmZjhiZTU5M2E5MjBjMCwgLmRlYnVnX2V2ZW50cyA9
IDB4ZmZmZjhiZTU5M2E5MjQ4MCwgLmRlYnVnX2xpc3QgPSB7IC5uZXh0ID0gMHhmZmZmOGJlNWI0
ZTUxZGI4LCAucHJldiA9IDB4ZmZmZjhiZTViNGU1MWRiOCB9LCAuZGVidWdfbGlzdF9sb2NrID0g
eyAucmxvY2sgPSB7IC5yYXdfbG9jayA9IHsgLnZhbCA9ICwgLmxvY2tlZCA9IDAsIC5wZW5kaW5n
ID0gMCwgLmxvY2tlZF9wZW5kaW5nID0gMCwgLnRhaWwgPSAwIH0gfSB9LCAuZGVidWdfd2FpdCA9
IHsgLmxvY2sgPSB7IC5ybG9jayA9IHsgLnJhd19sb2NrID0geyAudmFsID0gLCAubG9ja2VkID0g
MCwgLnBlbmRpbmcgPSAwLCAubG9ja2VkX3BlbmRpbmcgPSAwLCAudGFpbCA9IDAgfSB9IH0sIC5o
ZWFkID0geyAubmV4dCA9IDB4ZmZmZjhiZTViNGU1MWRkOCwgLnByZXYgPSAweGZmZmY4YmU1YjRl
NTFkZDggfSB9LCAucmVmID0geyAucmVmY291bnQgPSB7IC5yZWZzID0gIH0gfSwgLmlkID0gOCwg
LmJwZiA9IHsgLmRldmljZV9kYXRhID0gMHgwLCAuYWxsb2NhdGVkX2RhdGEgPSAwLCAuZGVzdHJv
eWVkID0gMSwgLnJkZXNjX29wcyA9IDB4MCwgLnByb2dfbGlzdCA9IHsgLm5leHQgPSAweGZmZmY4
YmU1YjRlNTFlMDgsIC5wcmV2ID0gMHhmZmZmOGJlNWI0ZTUxZTA4IH0sIC5wcm9nX2xpc3RfbG9j
ayA9IHsgLm93bmVyID0gLCAud2FpdF9sb2NrID0geyAucmF3X2xvY2sgPSB7IC52YWwgPSAsIC5s
b2NrZWQgPSAwLCAucGVuZGluZyA9IDAsIC5sb2NrZWRfcGVuZGluZyA9IDAsIC50YWlsID0gMCB9
IH0sIC5vc3EgPSB7IC50YWlsID0gIH0sIC53YWl0X2xpc3QgPSB7IC5uZXh0ID0gMHhmZmZmOGJl
NWI0ZTUxZTI4LCAucHJldiA9IDB4ZmZmZjhiZTViNGU1MWUyOCB9IH0sIC5zcmN1ID0geyAuc3Jj
dV9jdHJwID0gMHg2MTg5NmI1YjAyOTAsIC5zZGEgPSAweDAsIC5kZXBfbWFwID0geyAgfSwgLnNy
Y3Vfc3VwID0gMHgwIH0gfSB9Cg==


--=-vYWgKKVpA1BcZkQ9EbdN
Content-Disposition: attachment; filename="6.15-rc5_per-cpu-pf_bptrace_dmesg_decoded"
Content-Type: text/plain; name="6.15-rc5_per-cpu-pf_bptrace_dmesg_decoded";
	charset="UTF-8"
Content-Transfer-Encoding: base64

WyAgNDU2Ljc2MjkxMV0gdXNiIDctMS40LjU6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVy
IDcKWyAgNDU2Ljg5MzM0NV0gQlVHOiB1bmFibGUgdG8gaGFuZGxlIHBhZ2UgZmF1bHQgZm9yIGFk
ZHJlc3M6IGZmZmY4YmVjZDNjNjUwMTgKWyAgNDU2Ljg5MzM1NV0gI1BGOiBzdXBlcnZpc29yIHdy
aXRlIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQpbICA0NTYuODkzMzU4XSAjUEY6IGVycm9yX2NvZGUo
MHgwMDAyKSAtIG5vdC1wcmVzZW50IHBhZ2UKWyAgNDU2Ljg5MzM2MF0gUEdEIDQ1Y2UwMTA2NyBQ
NEQgNDVjZTAxMDY3IFBVRCAwClsgIDQ1Ni44OTMzNjZdIE9vcHM6IE9vcHM6IDAwMDIgWyMxXSBT
TVAgTk9QVEkKWyAgNDU2Ljg5MzM3MF0gQ1BVOiAwIFVJRDogMCBQSUQ6IDExMTExIENvbW06IGt3
b3JrZXIvMDoyIE5vdCB0YWludGVkIDYuMTUuMC1yYzUgIzEgUFJFRU1QVChsYXp5KSAgMDUzOGQz
NmY5Y2ZhMmRiYzNjOThlZmIyNzMwNDkwZDhiMjM5OWRjNApbICA0NTYuODkzMzc2XSBIYXJkd2Fy
ZSBuYW1lOiBMRU5PVk8gMjFRNC9MTlZOQjE2MTIxNiwgQklPUyBQWENOMjRXVyAwMy8xMS8yMDI1
ClsgIDQ1Ni44OTMzNzhdIFdvcmtxdWV1ZTogZXZlbnRzIGhpZGlucHV0X2xlZF93b3JrZXIKWyAg
NDU2Ljg5MzM4NV0gUklQOiAwMDEwOl9fc3JjdV9yZWFkX3VubG9jayAoa2VybmVsL3JjdS9zcmN1
dHJlZS5jOjc2OCAoZGlzY3JpbWluYXRvciAxKSkgClsgIDQ1Ni44OTMzOTFdIENvZGU6IGMzIGNj
IGNjIGNjIGNjIDY2IDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGYzIDBmIDFlIGZhIDBm
IDFmIDQ0IDAwIDAwIGYwIDgzIDQ0IDI0IGZjIDAwIDQ4IDYzIGY2IDQ4IGMxIGU2IDA0IDQ4IDAz
IDc3IDA4IDw2NT4gNDggZmYgNDYgMDggYzMgY2MgY2MgY2MgY2MgNjYgNjYgMmUgMGYgMWYgODQg
MDAgMDAgMDAgMDAgMDAgOTAKQWxsIGNvZGUKPT09PT09PT0KICAgMDoJYzMgICAgICAgICAgICAg
ICAgICAgCXJldAogICAxOgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICAyOgljYyAgICAg
ICAgICAgICAgICAgICAJaW50MwogICAzOgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICA0
OgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICA1Ogk2NiA2NiAyZSAwZiAxZiA4NCAwMCAJ
ZGF0YTE2IGNzIG5vcHcgMHgwKCVyYXgsJXJheCwxKQogICBjOgkwMCAwMCAwMCAwMCAKICAxMDoJ
ZjMgMGYgMWUgZmEgICAgICAgICAgCWVuZGJyNjQKICAxNDoJMGYgMWYgNDQgMDAgMDAgICAgICAg
CW5vcGwgICAweDAoJXJheCwlcmF4LDEpCiAgMTk6CWYwIDgzIDQ0IDI0IGZjIDAwICAgIAlsb2Nr
IGFkZGwgJDB4MCwtMHg0KCVyc3ApCiAgMWY6CTQ4IDYzIGY2ICAgICAgICAgICAgIAltb3ZzbHEg
JWVzaSwlcnNpCiAgMjI6CTQ4IGMxIGU2IDA0ICAgICAgICAgIAlzaGwgICAgJDB4NCwlcnNpCiAg
MjY6CTQ4IDAzIDc3IDA4ICAgICAgICAgIAlhZGQgICAgMHg4KCVyZGkpLCVyc2kKICAyYToqCTY1
IDQ4IGZmIDQ2IDA4ICAgICAgIAlpbmNxICAgJWdzOjB4OCglcnNpKQkJPC0tIHRyYXBwaW5nIGlu
c3RydWN0aW9uCiAgMmY6CWMzICAgICAgICAgICAgICAgICAgIAlyZXQKICAzMDoJY2MgICAgICAg
ICAgICAgICAgICAgCWludDMKICAzMToJY2MgICAgICAgICAgICAgICAgICAgCWludDMKICAzMjoJ
Y2MgICAgICAgICAgICAgICAgICAgCWludDMKICAzMzoJY2MgICAgICAgICAgICAgICAgICAgCWlu
dDMKICAzNDoJNjYgNjYgMmUgMGYgMWYgODQgMDAgCWRhdGExNiBjcyBub3B3IDB4MCglcmF4LCVy
YXgsMSkKICAzYjoJMDAgMDAgMDAgMDAgCiAgM2Y6CTkwICAgICAgICAgICAgICAgICAgIAlub3AK
CkNvZGUgc3RhcnRpbmcgd2l0aCB0aGUgZmF1bHRpbmcgaW5zdHJ1Y3Rpb24KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQogICAwOgk2NSA0OCBmZiA0NiAwOCAgICAg
ICAJaW5jcSAgICVnczoweDgoJXJzaSkKICAgNToJYzMgICAgICAgICAgICAgICAgICAgCXJldAog
ICA2OgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICA3OgljYyAgICAgICAgICAgICAgICAg
ICAJaW50MwogICA4OgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICA5OgljYyAgICAgICAg
ICAgICAgICAgICAJaW50MwogICBhOgk2NiA2NiAyZSAwZiAxZiA4NCAwMCAJZGF0YTE2IGNzIG5v
cHcgMHgwKCVyYXgsJXJheCwxKQogIDExOgkwMCAwMCAwMCAwMCAKICAxNToJOTAgICAgICAgICAg
ICAgICAgICAgCW5vcApbICA0NTYuODkzMzkzXSBSU1A6IDAwMTg6ZmZmZmNkNzY0OGE0N2QxOCBF
RkxBR1M6IDAwMDEwMjAyClsgIDQ1Ni44OTMzOTZdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6
IGZmZmY4YmU1YjRlNTFlMDggUkNYOiAwMDAwMDAwMDAwMDAwMDAwClsgIDQ1Ni44OTMzOTddIFJE
WDogMDAwMDAwMDAwMDAwMDAwMiBSU0k6IDAwMDAwMDAwMDAwMDAwMTAgUkRJOiBmZmZmOGJlNWI0
ZTUxZTM4ClsgIDQ1Ni44OTMzOTldIFJCUDogZmZmZmNkNzY0OGE0N2Q5MCBSMDg6IDAwMDAwMDAw
MDAwMDAwMDAgUjA5OiBmZmZmZWQ3NjNlYzMxYzM4ClsgIDQ1Ni44OTM0MDBdIFIxMDogMDAwMDAw
MDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDI4ZTYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwClsg
IDQ1Ni44OTM0MDFdIFIxMzogZmZmZjhiZThjMmI3OTcxMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDEg
UjE1OiAwMDAwMDAwMDAwMDAwMDAwClsgIDQ1Ni44OTM0MDJdIEZTOiAgMDAwMDAwMDAwMDAwMDAw
MCgwMDAwKSBHUzpmZmZmOGJlY2QzYzY1MDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAK
WyAgNDU2Ljg5MzQwNV0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4
MDA1MDAzMwpbICA0NTYuODkzNDA2XSBDUjI6IGZmZmY4YmVjZDNjNjUwMTggQ1IzOiAwMDAwMDAw
NTdjMDhlMDAwIENSNDogMDAwMDAwMDAwMGY1MGVmMApbICA0NTYuODkzNDA4XSBQS1JVOiA1NTU1
NTU1NApbICA0NTYuODkzNDEwXSBDYWxsIFRyYWNlOgpbICA0NTYuODkzNDExXSAgPFRBU0s+Clsg
IDQ1Ni44OTM0MTNdIGRpc3BhdGNoX2hpZF9icGZfb3V0cHV0X3JlcG9ydCAoZHJpdmVycy9oaWQv
YnBmL2hpZF9icGZfZGlzcGF0Y2guYzoxNDgpIApbICA0NTYuODkzNDE5XSBicGZfdHJhbXBvbGlu
ZV82NDQyNTMzMTk1KzB4OTEvMHgxMzcgClsgIDQ1Ni44OTM0MjJdIGRpc3BhdGNoX2hpZF9icGZf
b3V0cHV0X3JlcG9ydCAoZHJpdmVycy9oaWQvYnBmL2hpZF9icGZfZGlzcGF0Y2guYzoxMjApIApb
ICA0NTYuODkzNDI2XSBoaWRfaHdfb3V0cHV0X3JlcG9ydCAoZHJpdmVycy9oaWQvaGlkLWNvcmUu
YzoyNTAwIGRyaXZlcnMvaGlkL2hpZC1jb3JlLmM6MjUyMCkgClsgIDQ1Ni44OTM0MjhdIGhpZGlu
cHV0X2xlZF93b3JrZXIgKGRyaXZlcnMvaGlkL2hpZC1pbnB1dC5jOjE4MzgpIApbICA0NTYuODkz
NDMwXSBwcm9jZXNzX29uZV93b3JrIChrZXJuZWwvd29ya3F1ZXVlLmM6MzIzOCkgClsgIDQ1Ni44
OTM0MzNdIHdvcmtlcl90aHJlYWQgKGtlcm5lbC93b3JrcXVldWUuYzozMzEzIChkaXNjcmltaW5h
dG9yIDIpIGtlcm5lbC93b3JrcXVldWUuYzozNDAwIChkaXNjcmltaW5hdG9yIDIpKSAKWyAgNDU2
Ljg5MzQzNV0gPyByZXNjdWVyX3RocmVhZCAoa2VybmVsL3dvcmtxdWV1ZS5jOjMzNDYpIApbICA0
NTYuODkzNDM3XSBrdGhyZWFkIChrZXJuZWwva3RocmVhZC5jOjQ2NCkgClsgIDQ1Ni44OTM0NDFd
ID8ga3RocmVhZHNfb25saW5lX2NwdSAoa2VybmVsL2t0aHJlYWQuYzo0MTMpIApbICA0NTYuODkz
NDQ1XSByZXRfZnJvbV9mb3JrIChhcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzcy5jOjE1MykgClsgIDQ1
Ni44OTM0NDldID8ga3RocmVhZHNfb25saW5lX2NwdSAoa2VybmVsL2t0aHJlYWQuYzo0MTMpIApb
ICA0NTYuODkzNDUyXSByZXRfZnJvbV9mb3JrX2FzbSAoYXJjaC94ODYvZW50cnkvZW50cnlfNjQu
UzoyNTUpIApbICA0NTYuODkzNDU4XSAgPC9UQVNLPgpbICA0NTYuODkzNDU5XSBNb2R1bGVzIGxp
bmtlZCBpbjogeHRfbWFyayB0Y3BfZGlhZyBpbmV0X2RpYWcgdWhpZCByZmNvbW0gY21hYyBhbGdp
Zl9oYXNoIGFsZ2lmX3NrY2lwaGVyIGFmX2FsZyBzbmRfaHJ0aW1lciBzbmRfc2VxX2R1bW15IHNu
ZF9zZXFfbWlkaSBzbmRfc2VxX29zcyBzbmRfc2VxX21pZGlfZXZlbnQgc25kX3Jhd21pZGkgc25k
X3NlcSBzbmRfc2VxX2RldmljZSB4dF9DSEVDS1NVTSB4dF9NQVNRVUVSQURFIHh0X2Nvbm50cmFj
ayBpcHRfUkVKRUNUIG5mX3JlamVjdF9pcHY0IHh0X3RjcHVkcCBuZnRfY29tcGF0IG5mdF9jaGFp
bl9uYXQgbmZfbmF0IG5mX2Nvbm50cmFjayBuZl9kZWZyYWdfaXB2NiBuZl9kZWZyYWdfaXB2NCB0
dW4gYnJpZGdlIHN0cCBsbGMgbmZfdGFibGVzIHFydHIgb3ZlcmxheSBibmVwIHN1bnJwYyB2ZmF0
IGZhdCB1dmN2aWRlbyB2aWRlb2J1ZjJfdm1hbGxvYyB1dmMgdmlkZW9idWYyX21lbW9wcyBidHVz
YiB2aWRlb2J1ZjJfdjRsMiBidHJ0bCB2aWRlb2J1ZjJfY29tbW9uIGJ0aW50ZWwgYnRiY20gdmlk
ZW9kZXYgYnRtdGsgbWMgYmx1ZXRvb3RoIHNuZF9hY3BfbGVnYWN5X21hY2ggc25kX2FjcF9tYWNo
IHNuZF9zb2NfbmF1ODgyMSBzbmRfYWNwM3hfcm4gc25kX2FjcDcwIHNuZF9hY3BfaTJzIHNuZF9h
Y3BfcGRtIHNuZF9zb2NfZG1pYyBzbmRfYWNwX3BjbSBhbWRfYXRsIGludGVsX3JhcGxfbXNyIHNu
ZF9zb2ZfYW1kX2FjcDcwIHNuZF9zb2ZfYW1kX2FjcDYzIGludGVsX3JhcGxfY29tbW9uIHNuZF9z
b2ZfYW1kX3ZhbmdvZ2ggc25kX3NvZl9hbWRfcmVtYnJhbmR0IHNuZF9zb2ZfYW1kX3Jlbm9pciBz
bmRfc29mX2FtZF9hY3Agc25kX3NvZl9wY2kgc25kX3NvZl94dGVuc2FfZHNwIHNuZF9zb2Ygc25k
X3NvZl91dGlscyBzbmRfcGNpX3BzIHNuZF9zb2NfYWNwaV9hbWRfbWF0Y2ggc25kX2FtZF9zZHdf
YWNwaSBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgc291bmR3aXJlX2FtZCBzbmRfaGRhX2NvZGVjX2dl
bmVyaWMgc291bmR3aXJlX2dlbmVyaWNfYWxsb2NhdGlvbgpbICA0NTYuODkzNTEyXSAgc291bmR3
aXJlX2J1cyBzbmRfaGRhX3Njb2RlY19jb21wb25lbnQgc25kX3NvY19zZGNhIHNuZF9oZGFfY29k
ZWNfaGRtaSBzbmRfc29jX2NvcmUgc25kX2hkYV9pbnRlbCBzbmRfY29tcHJlc3Mga3ZtX2FtZCBt
dDc5MjVlIGFjOTdfYnVzIHNuZF9pbnRlbF9kc3BjZmcgbXQ3OTI1X2NvbW1vbiBzbmRfcGNtX2Rt
YWVuZ2luZSBzbmRfaW50ZWxfc2R3X2FjcGkgbXQ3OTJ4X2xpYiBzbmRfcnBsX3BjaV9hY3A2eCBz
bmRfaGRhX2NvZGVjIHNuZF9hY3BfcGNpIGt2bSBtdDc2X2Nvbm5hY19saWIgc25kX2FtZF9hY3Bp
X21hY2ggc25kX2hkYV9jb3JlIG10NzYgdGhpbmtfbG1pIHNuZF9hY3BfbGVnYWN5X2NvbW1vbiBz
bmRfaHdkZXAgaXJxYnlwYXNzIHNuZF9wY2lfYWNwNnggc25kX2N0bF9sZWQgcmFwbCBtYWM4MDIx
MSBzbmRfcGNtX29zcyBmaXJtd2FyZV9hdHRyaWJ1dGVzX2NsYXNzIGxlbm92b193bWlfaG90a2V5
X3V0aWxpdGllcyBzbmRfbWl4ZXJfb3NzIHNuZF9wY2lfYWNwNXggbGliYXJjNCBzbmRfcGNtIHdt
aV9ibW9mIHBjc3BrciBzbmRfcm5fcGNpX2FjcDN4IHNuZF90aW1lciBzbmRfYWNwX2NvbmZpZyBh
bWRfcG1mIGNmZzgwMjExIHNuZF9zb2NfYWNwaSBzcGQ1MTE4IHNuZCBhbWR0ZWUgc291bmRjb3Jl
IHNuZF9wY2lfYWNwM3ggYW1keGRuYSBrMTB0ZW1wIGhpZF9zZW5zb3JfYWxzIHJma2lsbCBoaWRf
c2Vuc29yX3RyaWdnZXIgY2NwIGluZHVzdHJpYWxpb190cmlnZ2VyZWRfYnVmZmVyIGtmaWZvX2J1
ZiBqb3lkZXYgaGlkX3NlbnNvcl9paW9fY29tbW9uIHBsYXRmb3JtX3Byb2ZpbGUgaW5kdXN0cmlh
bGlvIG1vdXNlZGV2IGFtZF9wbWMgbWFjX2hpZCBzY2hfZnFfY29kZWwgdWlucHV0IGkyY19kZXYg
cGFycG9ydF9wYyBwcGRldiBscCBwYXJwb3J0IG52bWVfZmFicmljcyBuZm5ldGxpbmsgaXBfdGFi
bGVzIHhfdGFibGVzIGhpZF9sb2dpdGVjaF9oaWRwcCBoaWRfbG9naXRlY2hfZGogdXNiaGlkIGRt
X2NyeXB0IGVuY3J5cHRlZF9rZXlzIHRydXN0ZWQgYXNuMV9lbmNvZGVyClsgIDQ1Ni44OTM1NjNd
ICB0ZWUgZG1fbW9kIHJhaWQxMCByYWlkNDU2IGFzeW5jX3JhaWQ2X3JlY292IGFzeW5jX21lbWNw
eSBhc3luY19wcSBhc3luY194b3IgYXN5bmNfdHggcmFpZDEgcmFpZDAgbGluZWFyIG1kX21vZCBp
Z2MgcHRwIHBwc19jb3JlIHI4MTUzX2VjbSByODE1MiBjZGNfZXRoZXIgdXNibmV0IG1paSBhbWRn
cHUgaTJjX2FsZ29fYml0IGRybV90dG1faGVscGVyIHR0bSBkcm1fcGFuZWxfYmFja2xpZ2h0X3F1
aXJrcyBwb2x5dmFsX2NsbXVsbmkgZHJtX2V4ZWMgcG9seXZhbF9nZW5lcmljIGRybV9zdWJhbGxv
Y19oZWxwZXIgc2VyaW9fcmF3IGFtZHhjcCBnaGFzaF9jbG11bG5pX2ludGVsIGRybV9idWRkeSBo
aWRfc2Vuc29yX2N1c3RvbSBudm1lIHNoYTUxMl9zc3NlMyB1Y3NpX2FjcGkgYXRrYmQgc2RoY2lf
cGNpIGdwdV9zY2hlZCBzcDUxMDBfdGNvIHNoYTI1Nl9zc3NlMyBsaWJwczIgdHlwZWNfdWNzaSBz
ZGhjaV91aHMyIGhpZF9tdWx0aXRvdWNoIGhpZF9zZW5zb3JfaHViIHI4MTY5IG52bWVfY29yZSBz
aGExX3Nzc2UzIHZpdmFsZGlfZm1hcCBzZGhjaSBoaWRfZ2VuZXJpYyBkcm1fZGlzcGxheV9oZWxw
ZXIgcmVhbHRlayBhZXNuaV9pbnRlbCB0eXBlYyB2aWRlbyBudm1lX2tleXJpbmcgaTgwNDIgY3Fo
Y2kgaTJjX3BpaXg0IGNyeXB0b19zaW1kIG1kaW9fZGV2cmVzIGNyeXB0ZCB0aHVuZGVyYm9sdCBh
bWRfc2ZoIGNlYyBsaWJwaHkgbW1jX2NvcmUgcm9sZXMgaTJjX3NtYnVzIG52bWVfYXV0aCBpMmNf
aGlkX2FjcGkgc2VyaW8gd21pIGkyY19oaWQKWyAgNDU2Ljg5MzYxMl0gQ1IyOiBmZmZmOGJlY2Qz
YzY1MDE4ClsgIDQ1Ni44OTM2MTVdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0t
LQpbICA0NTcuMDQ4MTM1XSBwc3RvcmU6IGJhY2tlbmQgKGVmaV9wc3RvcmUpIHdyaXRpbmcgZXJy
b3IgKC0yOCkKWyAgNDU3LjA0ODE0Ml0gUklQOiAwMDEwOl9fc3JjdV9yZWFkX3VubG9jayAoa2Vy
bmVsL3JjdS9zcmN1dHJlZS5jOjc2OCAoZGlzY3JpbWluYXRvciAxKSkgClsgIDQ1Ny4wNDgxNDdd
IENvZGU6IGMzIGNjIGNjIGNjIGNjIDY2IDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGYz
IDBmIDFlIGZhIDBmIDFmIDQ0IDAwIDAwIGYwIDgzIDQ0IDI0IGZjIDAwIDQ4IDYzIGY2IDQ4IGMx
IGU2IDA0IDQ4IDAzIDc3IDA4IDw2NT4gNDggZmYgNDYgMDggYzMgY2MgY2MgY2MgY2MgNjYgNjYg
MmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgOTAKQWxsIGNvZGUKPT09PT09PT0KICAgMDoJYzMg
ICAgICAgICAgICAgICAgICAgCXJldAogICAxOgljYyAgICAgICAgICAgICAgICAgICAJaW50Mwog
ICAyOgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICAzOgljYyAgICAgICAgICAgICAgICAg
ICAJaW50MwogICA0OgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICA1Ogk2NiA2NiAyZSAw
ZiAxZiA4NCAwMCAJZGF0YTE2IGNzIG5vcHcgMHgwKCVyYXgsJXJheCwxKQogICBjOgkwMCAwMCAw
MCAwMCAKICAxMDoJZjMgMGYgMWUgZmEgICAgICAgICAgCWVuZGJyNjQKICAxNDoJMGYgMWYgNDQg
MDAgMDAgICAgICAgCW5vcGwgICAweDAoJXJheCwlcmF4LDEpCiAgMTk6CWYwIDgzIDQ0IDI0IGZj
IDAwICAgIAlsb2NrIGFkZGwgJDB4MCwtMHg0KCVyc3ApCiAgMWY6CTQ4IDYzIGY2ICAgICAgICAg
ICAgIAltb3ZzbHEgJWVzaSwlcnNpCiAgMjI6CTQ4IGMxIGU2IDA0ICAgICAgICAgIAlzaGwgICAg
JDB4NCwlcnNpCiAgMjY6CTQ4IDAzIDc3IDA4ICAgICAgICAgIAlhZGQgICAgMHg4KCVyZGkpLCVy
c2kKICAyYToqCTY1IDQ4IGZmIDQ2IDA4ICAgICAgIAlpbmNxICAgJWdzOjB4OCglcnNpKQkJPC0t
IHRyYXBwaW5nIGluc3RydWN0aW9uCiAgMmY6CWMzICAgICAgICAgICAgICAgICAgIAlyZXQKICAz
MDoJY2MgICAgICAgICAgICAgICAgICAgCWludDMKICAzMToJY2MgICAgICAgICAgICAgICAgICAg
CWludDMKICAzMjoJY2MgICAgICAgICAgICAgICAgICAgCWludDMKICAzMzoJY2MgICAgICAgICAg
ICAgICAgICAgCWludDMKICAzNDoJNjYgNjYgMmUgMGYgMWYgODQgMDAgCWRhdGExNiBjcyBub3B3
IDB4MCglcmF4LCVyYXgsMSkKICAzYjoJMDAgMDAgMDAgMDAgCiAgM2Y6CTkwICAgICAgICAgICAg
ICAgICAgIAlub3AKCkNvZGUgc3RhcnRpbmcgd2l0aCB0aGUgZmF1bHRpbmcgaW5zdHJ1Y3Rpb24K
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQogICAwOgk2NSA0OCBm
ZiA0NiAwOCAgICAgICAJaW5jcSAgICVnczoweDgoJXJzaSkKICAgNToJYzMgICAgICAgICAgICAg
ICAgICAgCXJldAogICA2OgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICA3OgljYyAgICAg
ICAgICAgICAgICAgICAJaW50MwogICA4OgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICA5
OgljYyAgICAgICAgICAgICAgICAgICAJaW50MwogICBhOgk2NiA2NiAyZSAwZiAxZiA4NCAwMCAJ
ZGF0YTE2IGNzIG5vcHcgMHgwKCVyYXgsJXJheCwxKQogIDExOgkwMCAwMCAwMCAwMCAKICAxNToJ
OTAgICAgICAgICAgICAgICAgICAgCW5vcApbICA0NTcuMDQ4MTQ5XSBSU1A6IDAwMTg6ZmZmZmNk
NzY0OGE0N2QxOCBFRkxBR1M6IDAwMDEwMjAyClsgIDQ1Ny4wNDgxNTJdIFJBWDogMDAwMDAwMDAw
MDAwMDAwMCBSQlg6IGZmZmY4YmU1YjRlNTFlMDggUkNYOiAwMDAwMDAwMDAwMDAwMDAwClsgIDQ1
Ny4wNDgxNTNdIFJEWDogMDAwMDAwMDAwMDAwMDAwMiBSU0k6IDAwMDAwMDAwMDAwMDAwMTAgUkRJ
OiBmZmZmOGJlNWI0ZTUxZTM4ClsgIDQ1Ny4wNDgxNTRdIFJCUDogZmZmZmNkNzY0OGE0N2Q5MCBS
MDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiBmZmZmZWQ3NjNlYzMxYzM4ClsgIDQ1Ny4wNDgxNTVd
IFIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDI4ZTYgUjEyOiAwMDAwMDAw
MDAwMDAwMDAwClsgIDQ1Ny4wNDgxNTVdIFIxMzogZmZmZjhiZThjMmI3OTcxMCBSMTQ6IDAwMDAw
MDAwMDAwMDAwMDEgUjE1OiAwMDAwMDAwMDAwMDAwMDAwClsgIDQ1Ny4wNDgxNTZdIEZTOiAgMDAw
MDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOGJlY2QzYzY1MDAwKDAwMDApIGtubEdTOjAwMDAw
MDAwMDAwMDAwMDAKWyAgNDU3LjA0ODE1N10gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENS
MDogMDAwMDAwMDA4MDA1MDAzMwpbICA0NTcuMDQ4MTU4XSBDUjI6IGZmZmY4YmVjZDNjNjUwMTgg
Q1IzOiAwMDAwMDAwNTdjMDhlMDAwIENSNDogMDAwMDAwMDAwMGY1MGVmMApbICA0NTcuMDQ4MTU5
XSBQS1JVOiA1NTU1NTU1NApbICA0NTcuMDQ4MTYwXSBub3RlOiBrd29ya2VyLzA6MlsxMTExMV0g
ZXhpdGVkIHdpdGggaXJxcyBkaXNhYmxlZAo=


--=-vYWgKKVpA1BcZkQ9EbdN--

