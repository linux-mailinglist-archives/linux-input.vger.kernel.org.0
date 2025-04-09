Return-Path: <linux-input+bounces-11579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54408A827EB
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 16:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBC94E2EFB
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C7118952C;
	Wed,  9 Apr 2025 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="XHpfG1+6"
X-Original-To: linux-input@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B22940F
	for <linux-input@vger.kernel.org>; Wed,  9 Apr 2025 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209061; cv=none; b=ivZJCfl6U/OY2gINQf8tHjq9xY8yvZ28BE6agcpNthk27JpsPe4NxMifOepF+d0yeNT+L1W3+CfEFtwztiq3fNG/xAqQ9vjhMRAcvFVJS9ClmzCxvcmQeYmE/GpUKfZ66o98Qc3erb8yd2IJ/C9ehcBKz55orY1/jM/0nJroReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209061; c=relaxed/simple;
	bh=mHey3h+TEg6dq4o4dgbZ8oTDFx2sBKyBM5ZujWXlMsk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VTEYr+gnd+v80hbIgD54LIf7k7ZZ9GRqYne006YZsJSGs79V7lWXGxD4AvKAofCuSq5qYVOP50V9J7FURjQWyDq7Ny49uHeIJi7mbyL6u5Y3BB9Hm2QhoQKvb8v/qTBvSPVsdZtbuin9G2DG1AaeoYaDsDzozu8UrJ45wuBZ0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=XHpfG1+6; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 36231240103
	for <linux-input@vger.kernel.org>; Wed,  9 Apr 2025 16:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1744209051; bh=mHey3h+TEg6dq4o4dgbZ8oTDFx2sBKyBM5ZujWXlMsk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=XHpfG1+6KSDNgYut5HQ8/iua90DxNiaYSQzVELbJXh6QFv64ZPpab7z7JHEhWe+g7
	 kQBX6W1b/abA8xx/n0yyeD22AuNJ9RlprPTno/l4a2MQU5l69ShWDV/78hGA200MeY
	 jn3CIsz7wltempVMev3fKekX4KgV6LqnlR9E7M20t0ZIa50OqkqyYDWVQopIlR+x4c
	 A0QNBk7MTmW9QvrA5CxXKxa7vegkz8Omgxi1pM+nD82T7FY2QsdBaYagy/1bYQX8h7
	 M78/B85vgeCLvCRrKLRY9Nzt27kOuPOQIR9E8irg3LEJ/JDQKF2/xUIqCf+1NKH0YL
	 zTIERQ6Fa1Y3g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZXljk0f4Wz6tm8;
	Wed,  9 Apr 2025 16:30:50 +0200 (CEST)
Message-ID: <6114c4ed1f0145ca6deb96bccd0ebde145fcf68f.camel@posteo.de>
Subject: Re: [PATCH] Input: pegasus-notetaker - fix slab-out-of-bounds in
 pegasus_irq
From: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Vasiliy Kovalev <kovalev@altlinux.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>,  linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: lvc-project@linuxtesting.org
Date: Wed, 09 Apr 2025 14:30:49 +0000
In-Reply-To: <20250402154745.399226-1-kovalev@altlinux.org>
References: <20250402154745.399226-1-kovalev@altlinux.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Mittwoch, dem 02.04.2025 um 18:47 +0300 schrieb Vasiliy Kovalev:
> Fix a slab-out-of-bounds error in pegasus_irq reported by KASAN,
> caused by insufficient packet size validation. The driver relied
> on usb_maxpacket() to set the data length, which could be smaller
> than the 6 bytes expected by pegasus_parse_packet(), leading to
> oob reads at le16_to_cpup() calls when accessing coordinates.
>=20
> Introduce NOTETAKER_PKGLEN_SIZE define with a value of 6 bytes,
> reflecting the typical interrupt IN endpoint packet format for this
> device family. Add a check in pegasus_probe() to ensure the data
> length is at least this size, logging an info message if
> usb_maxpacket()
> returns a smaller value and adjusting it accordingly. This prevents
> buffer under-allocation while accommodating devices that might send
> shorter packets, as various brandings (e.g., Pegasus Mobile
> Notetaker,
> IRISnotes Express) may differ in implementation.
>=20
> KASAN report:
> BUG: KASAN: slab-out-of-bounds in pegasus_irq (little_endian.h:67
> pegasus_notetaker.c:153 pegasus_notetaker.c:183)
> Read of size 2 at addr ffff888009a01da2 by task (udev-worker)/985
> CPU: 0 PID: 985 Comm: (udev-worker) Tainted: G OE 6.14.0-un-def-
> alt0.rc6.kasan #1
> Hardware: QEMU Standard PC (Q35 + ICH9, 2009)
> Call Trace:
> =C2=A0<IRQ>
> =C2=A0 dump_stack_lvl (lib/dump_stack.c:122)
> =C2=A0 print_report (mm/kasan/report.c:521)
> =C2=A0 kasan_report (mm/kasan/report.c:636)
> =C2=A0 pegasus_irq (little_endian.h:67 pegasus_notetaker.c:153
> pegasus_notetaker.c:183)
> =C2=A0 __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1650)
> =C2=A0 usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1735)
> =C2=A0 dummy_timer (drivers/usb/gadget/udc/dummy_hcd.c:1995)
> =C2=A0 __hrtimer_run_queues (kernel/time/hrtimer.c:1865)
> =C2=A0 hrtimer_run_softirq (kernel/time/hrtimer.c:1884)
> =C2=A0 handle_softirqs (kernel/softirq.c:561)
> =C2=A0 __irq_exit_rcu (kernel/softirq.c:662)
> =C2=A0 irq_exit_rcu (kernel/softirq.c:680)
> =C2=A0 sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049)
> =C2=A0</IRQ>
>=20
> Found by Linux Verification Center (linuxtesting.org) with
> "USB Gadget Tests"[1]:
>=20
> $ make input-tab-pegasus
> $ sudo ./src/input-tab-pegasus/input-tab-pegasus --invalid_ep_int_len
>=20
> [1] Link: https://github.com/kovalev0/usb-gadget-tests
> Fixes: 1afca2b66aac ("Input: add Pegasus Notetaker tablet driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> ---
> =C2=A0drivers/input/tablet/pegasus_notetaker.c | 19 +++++++++++++++++++
> =C2=A01 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/input/tablet/pegasus_notetaker.c
> b/drivers/input/tablet/pegasus_notetaker.c
> index 8d6b71d5979316..e578720585c2c8 100644
> --- a/drivers/input/tablet/pegasus_notetaker.c
> +++ b/drivers/input/tablet/pegasus_notetaker.c
> @@ -70,6 +70,15 @@
> =C2=A0#define PEN_BUTTON_PRESSED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(1)
> =C2=A0#define PEN_TIP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(0)
> =C2=A0
> +/* Minimum packet size for interrupt IN endpoint.
> + * Packet format=C2=A0 (expected 6 bytes, though some devices may send
> less):
> + *=C2=A0 - Byte 0: Packet type (command or status)
> + *=C2=A0 - Byte 1: Button/tip state
> + *=C2=A0 - Bytes 2-3: X coordinate (16-bit, little-endian)
> + *=C2=A0 - Bytes 4-5: Y coordinate (16-bit, little-endian)
> + */
> +#define NOTETAKER_PKGLEN_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A06
> +
> =C2=A0struct pegasus {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned char *data;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 data_len;
> @@ -311,6 +320,16 @@ static int pegasus_probe(struct usb_interface
> *intf,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pegasus->data_len =3D usb=
_maxpacket(dev, pipe);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Ensure buffer is at least N=
OTETAKER_PKGLEN_SIZE to avoid
> oob
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * access in pegasus_parse_pac=
ket(). Adjust if endpoint
> reports a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * smaller size, as some devic=
es might send shorter packets.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pegasus->data_len < NOTETA=
KER_PKGLEN_SIZE) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dev_info(&intf->dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Int in =
endpoint data_len adjusted from %d
> to minimum %d\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pegasus-=
>data_len, NOTETAKER_PKGLEN_SIZE);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pegasus->data_len =3D NOTETAKER_PKGLEN_SIZE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pegasus->data =3D usb_all=
oc_coherent(dev, pegasus->data_len,
> GFP_KERNEL,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &pegasus->data_dma);


Tested-by: Martin Kepplinger-Novakovic <martink@posteo.de>

thank you

