Return-Path: <linux-input+bounces-12212-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77958AAE7E3
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 19:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5634F984BB3
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 17:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEDE25D558;
	Wed,  7 May 2025 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="kz78liqv"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073EB1CB31D;
	Wed,  7 May 2025 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639267; cv=pass; b=uJlOdvkME95KYbka8ZKDd11huKtQzZqm1er1BRxAkJowVydH2SOOupFxbXeEXapmtN77RrINLKddGoXgGr95MzNNGTVBD1dtpfPwEZDX1nY85c4A1q+WoBu3ucIEJHkp43f3T39Ge/h1qOkXwSNqx+ITQCuTvylwKMbhPgblSA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639267; c=relaxed/simple;
	bh=S8q4UiwPqcvKxQLg90uq250hhpXySBZdd3JUmw5Zp+Q=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=e5uDtrDTvPHArEhmodDvSUwkRX/BA3JXMYxeV5wn6dBPF2R+LDSFsEOBED2IOA+axdUGqdxhssC4D3uZr2qrXRQnITSnxIPZLfxYmS4WhchEOco6wgHv9RTbnXlFz6KXHb13Xj7eRTadzt4E05KGoOfyUdu9GgxjkNs6X0YDRg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=kz78liqv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1746639254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h8L6DW8OjyP/I23YelMtauHcguuxgiAofiMSebynEvAVRhqe2WnmPxY1IIVObUEncUDdK7vu/BGczG1ElfW+vERveNAdmyZPltQTT/AKjPcd/rHKPB/Cumyfwkl71Us9nqSwQ4dnDBUCexHuja2Yb3uRNGtLMubYZ7lfAX/A7nw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746639254; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vBB7k01+w0e/J/ltKUX3Zy1yr/hnRL85oqJmKvCcIjQ=; 
	b=eBu3KzwspCcDsL+sO+2Oxf2ptCUbzxIXbRtmHyhBYllXq7xFd5b3Rv7nX9Ep3FQ+ETs2aY8Em13jXCc0dAwYkki7yEbFdJxTfC3obG6QmOFsVpPYclTwZFKj4NQovY91Hil9fVSp0O9amtz+i4QX3xUeGJPYQqlsYW6xkh9dfNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746639254;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=vBB7k01+w0e/J/ltKUX3Zy1yr/hnRL85oqJmKvCcIjQ=;
	b=kz78liqvhKTU2+tvJODNu8ENBDIOCMqd/GTuCH+pt/YhyP5QWU5F+EnR2i7ELrTV
	e3TdmZbVgxtklfWe7nYoV5bCrIhdESUBm4CVsApnatz+VV3eRGBIDeMLv+r8mqZrxqN
	fVFzzIp5QFmgs2P7sOil/eUJoJPqPVlKPHAyPRJk=
Received: by mx.zohomail.com with SMTPS id 1746639251879306.155127117759;
	Wed, 7 May 2025 10:34:11 -0700 (PDT)
Message-ID: <8932507d2a35d26a1eca2eab2b35fd385d3570d9.camel@rong.moe>
Subject: Re: [Bug 220083] New: [REGRESSION, BISECTED] x86 ASM changes make
 dispatch_hid_bpf_output_report access not-present page
From: Rong Zhang <i@rong.moe>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: bugzilla-daemon@kernel.org, Jiri Kosina <jikos@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov
	 <bp@alien8.de>
In-Reply-To: <6b4fe1ae87c717c70708e7a3f5bd6d9c8c7bfcd5.camel@rong.moe>
References: <bug-220083-6385@https.bugzilla.kernel.org/>
						 <20250506145548.GGaBoi9Jzp3aeJizTR@fat_crate.local>
						 <umqaxyqrrvle34haa3n3iohs5akos652ytbs5sef32xmc7gaz7@edyihsd4yokq>
	 <6b4fe1ae87c717c70708e7a3f5bd6d9c8c7bfcd5.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 May 2025 01:33:06 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.1-1 
X-ZohoMailClient: External

Hi Benjamin,

On Wed, 2025-05-07 at 19:03 +0800, Rong Zhang wrote:
> Hi Benjamin,
>=20
> On Tue, 2025-05-06 at 17:35 +0200, Benjamin Tissoires wrote:
> > Hi Boris,
> >=20
> > On May 06 2025, Borislav Petkov wrote:
> > > Switching to mail.
> > >=20
> > > Hi Benjamin,
> > >=20
> > > take a look at the below pls.
> > >=20
> > > The RIP points to:
> > >=20
> > >   22:   48 c1 e6 04             shl    $0x4,%rsi
> > >   26:   48 03 77 08             add    0x8(%rdi),%rsi
> > >   2a:*  65 48 ff 46 08          incq   %gs:0x8(%rsi)            <-- t=
rapping instruction
> > >   2f:   c3                      ret
> > >=20
> > > which really is a %gs-based access and the reporter has bisected this=
 to
> > >=20
> > >   9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")
> > >=20
> > > which looks related.
> > >=20
> > > My silly guess would be some bpf program does per-cpu accesses but it=
 doesn't
> > > know about this change so it tramples over registers. I mean, my fix =
would be
> > > to disable BPF but you young kids love to play with that...

[...]

> > However, the fact that this happens in an unplug event makes me think
> > that there may be a race here at play.
> >=20
> > Another option is that I completely missed the use of srcu, but it was
> > working fine previously, so I have no ideas :)
>=20
> Yes, this is weird.
>=20
> I also tried uinput and some other HID devices (randomly borrowed from
> my friends). They all worked fine.
>=20
> I have a Logitech Bolt receiver, too. Will find and try it out.

The good news is it always works fine.

> > Anyway, we need to wait for the reporter to tell us if there were any
> > HID-BPF program first because this will likely give us a hint on where
> > the issue is.
>=20
> In another clean boot, I triggered the bug and dumped the hdev struct
> at fentry (fexit will never hit because of the PF) via bpftrace.

[...]

> See attachments for its output (warning: contains an extremely long
> line) and the decoded dmesg while tracing.
>=20
> In another clean boot (again), I played around retsnoop to capture the
> Last Branch Records (type: any_return, ind_call) from
> dispatch_hid_bpf_output_report. This time I didn't trigger the issue,
> or else nothing would be captured due to the PF as mentioned above.
> Instead, I pressed Caps Lock on a keyboard under the same receiver
> several times to trigger hidinput_led_worker. I always got:
>=20
> [#15] kprobe_multi_link_handler+0x5d      (kernel/trace/bpf_trace.c:2843)=
           ->  fprobe_entry+0xe6                   (kernel/trace/fprobe.c:3=
21)
>                                                                          =
               . __fprobe_handler                  (kernel/trace/fprobe.c:2=
24)
> [#14] fprobe_entry+0x21c                  (kernel/trace/fprobe.c:336)    =
           ->  function_graph_enter_regs+0x15d     (kernel/trace/fgraph.c:6=
76)
> [#13] function_graph_enter_regs+0x1cd     (kernel/trace/fgraph.c:718)    =
           ->  ftrace_graph_func+0x3c              (arch/x86/kernel/ftrace.=
c:659)
> [#12] ftrace_graph_func+0x4c              (arch/x86/kernel/ftrace.c:661) =
           ->  ftrace_trampoline+0x83
> [#11] ftrace_trampoline+0xc2                                             =
           ->  dispatch_hid_bpf_output_report+0x9  (drivers/hid/bpf/hid_bpf=
_dispatch.c:120)
> [#10] __srcu_read_lock+0x20               (kernel/rcu/srcutree.c:757)    =
           ->  dispatch_hid_bpf_output_report+0x73 (drivers/hid/bpf/hid_bpf=
_dispatch.c:133)
>                                                                          =
               . srcu_read_lock                    (include/linux/srcu.h:25=
2)
> [#09] __srcu_read_unlock+0x1f             (kernel/rcu/srcutree.c:769)    =
           ->  dispatch_hid_bpf_output_report+0xc5 (drivers/hid/bpf/hid_bpf=
_dispatch.c:148)
> [#08] dispatch_hid_bpf_output_report+0xe6 (drivers/hid/bpf/hid_bpf_dispat=
ch.c:148)  ->  return_to_handler+0x0               (arch/x86/kernel/ftrace_=
64.S:358)
>=20
> !    6us [0]  dispatch_hid_bpf_output_report
>=20
> Thus, there is indeed no BPF program being called.

Since the Bolt receiver is mine, I also played around bpftrace and
retsnoop. Surprisingly, dispatch_hid_bpf_output_report was never called
when I unplugged the Bolt receiver or pressed Caps Lock on a keyboard
under it, but hidinput_led_worker was indeed called in both cases.

I am completely unfamiliar with HID stuff, so I traced
hidinput_get_led_field and revealed that hid->ll_driver->request was
pointed to usbhid_request, resulting in hidinput_led_worker returning
via a happy path. So the divergence is merely due to different driver
implementation.

This information may explain why the impact of the bug was limited to
certain types of devices. Besides, most Logitech Unifying receivers
reside on users' PCs and never been unplugged, so the bug can hardly be
triggered in their setup. In my case, I have a Unifying receiver
residing on a dock, so the first time I encountered the bug was when I
used the dock for a while and unplugged it (ouch!).

My rough guess is: the bug previously existed somewhere but had no
destructive effect. The per-cpu change isn't the bug itself, but turned
the bug to be destructive.

> Feel free to ask for more experiments :)
>=20
> > Cheers,
> > Benjamin
>=20
> Thanks,
> Rong
>=20
> > >=20
> > > :-)
> > >=20
> > > Thx.
> > >=20
> > > On Sat, May 03, 2025 at 06:40:41PM +0000, bugzilla-daemon@kernel.org =
wrote:
> > >=20
> > >=20

[...]

Thanks,
Rong

