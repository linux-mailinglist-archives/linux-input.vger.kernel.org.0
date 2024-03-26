Return-Path: <linux-input+bounces-2558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599288CF66
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 21:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C513C1C676AC
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 20:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FDD7442F;
	Tue, 26 Mar 2024 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="f4f8+L4P"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E51EF1D
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 20:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711486217; cv=none; b=VMqm3vQuILQAs6AMSAMeozcs9TITeoHpC9hmXNX7LlKJPCDvif6M5QvOPC6ZR1CsuSoj2wCIitm5de/2Z7xMbNxE/zteJtXbR53N/QGDQOZZACcCHP7kF2HJqztM7ZktLKQwD7St6THg5/OyJi50MctR+vuEXajJlUgk3yfut6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711486217; c=relaxed/simple;
	bh=T5YfNqX55Z8qEwAcg1hxsiPyLDpXowrkX/WS7TXSjbw=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=R6RX9tCWYPUYhvwUWroC0ksfTH8zu4+3Z8v2Mc5wSTCOWL8clrkfviiHOdNen5vb5DpKa/jj/ylr61e9jismiRBc59SQLyrsDgFempv8MsKpKpyyfQizn8j46MqMwMBJG74U/CsaD5v/tUeUtY6GP4Ib94wLRrM4NTaYcCJYzQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=f4f8+L4P; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1711486213; x=1711745413;
	bh=Hvu11Cz+twFSv/MGlP+aQfj4LXiDo09MBOsTz24Hku0=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f4f8+L4PsSZsdw1KUDGypmT/BkHmSeqHGkNN6MZHCaqmDv0Fcf+J4AT3qteGHWvWu
	 0UboBwEAQy3F4kTQG0OwWz6soWhGZwP9ITBUiKdTde3Mq0VOKNXh0CY3Bbb0DrDMHr
	 uIGUSZ8koUlEFiISwGOfy1a5UX9JPM68j5hDGF9df1xa4vf1OYIfB+giX8Mvzrb2B6
	 7pHTIDvcAogd6KempHi8z4xrh7AS27CWlKV9nZ2f8sflatRHYe0Reih5e+jk9XPIhe
	 nW9Tk8b4VV8TqA0UPA486aPzrMt4snRLB8V2F+Ck1YKcLOw1J1CESBZKSM/wDoomgM
	 gmwX0t79bTGDQ==
Date: Tue, 26 Mar 2024 20:50:03 +0000
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From: =?utf-8?Q?Micha=C5=82_Majewski?= <michal.majewski.mm@proton.me>
Subject: psmouse.synaptics_interconnect=1 - it works!
Message-ID: <8um9-BD5cdxelV02QxqE1vhTOIuB8xsb0xfVYD359HBq1LgGSZXPZRzRnPZ5jKyjjbkAV_USB_XcLKBC2jcxrACL02B04w_5SWz-XQEqqiQ=@proton.me>
Feedback-ID: 104184498:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,
I noticed in dmesg a message about kernel option from the e-mail topic and =
i tried it out on Lenovo ThinkPad L470 W10DG. Now my touchpad works much be=
tter and is actually smoother. I see in logs that it also affected TrackPoi=
nt but i don't see much difference.

part of my dmesg after adding kernel option:

[    0.844727] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input0
[    0.844947] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input1
[    0.845046] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input2
[    0.903292] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input3
[    1.939367] psmouse serio1: synaptics: serio: Synaptics pass-through por=
t at isa0060/serio1/input0
[    1.992308] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042=
/serio1/input/input5
[    3.128345] input: TPPS/2 IBM TrackPoint as /devices/platform/i8042/seri=
o1/serio2/input/input6
[   14.240237] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_=
acpi/input/input8
[   15.629375] input: Synaptics TM3053-010 as /devices/pci0000:00/0000:00:1=
f.4/i2c-6/6-002c/rmi4-00/input/input19
[   16.059828] input: TPPS/2 IBM TrackPoint as /devices/pci0000:00/0000:00:=
1f.4/i2c-6/6-002c/rmi4-00/rmi4-00.fn03/serio3/input/input20

Best regards,
Micha=C5=82 Majewski.

