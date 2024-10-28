Return-Path: <linux-input+bounces-7726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865159B2A7D
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 09:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9CD51C21752
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 08:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CF7190471;
	Mon, 28 Oct 2024 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="hNqVQeI2"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6952817CA1B;
	Mon, 28 Oct 2024 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104741; cv=none; b=rntg7xBGpIZw5E48Wf1tPjzdDfS+M2pAwhYddMKmbcSdiPh2BU1IyfCSx7rpBjc3TTU8Uengo1GPk+aSxk6cZSA3y4+qIERYzdCpqIIedApNVFHB6pj4/k81r9CCumTwEyuUk8WafcZmtHcPDdzI9miCTSkrxfof2AvBbDSsOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104741; c=relaxed/simple;
	bh=9AjvpxVUqoKPGzdpD5w5K3VORlSd1bXXaRzQsp+TyMg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqbXpOez9flDo3PErkl5rVlrmG+Qgz1AeCSdPhTgsoIDFr5n1Gb4QtlYDj8zIL+2hbXknEG+OqW5S5J4A97Pi36jIU0/JJaXFbUyd3Kp1pSVEe44U7SHGHMBuK/rih6sYWJaVucUU1GURn5osc+wP8WDsb3joqlmmfEgj5fRUS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b=hNqVQeI2; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730104728; x=1730709528; i=ps.report@gmx.net;
	bh=ELBR/F2lmmwhwdf6SuGkJ02dHQcy/EFN/VfQu/VEGhs=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hNqVQeI2q4F8H1hjrkbxYEDZ3AEkB9obtt4lbDIwQAln21zZ7SQ5q8N2eh0qm9zB
	 nIdKMU0RQhuXCKK17cj+vtw3VhwLapDYM01WQLUsHsxL+d6qyg6UKoNP9cG3zfqdp
	 ziQWftZpMOK7/NbRbAJLxFCGSHjdX31xQsKaoSGbYnvRoVCjrxgx9O90pxfMk1R+q
	 vZ7nzHJa+jxayACwag9znrD6LVzSOCSuOb96NHFLv7K0qUpCtJso02zEFLRMFKi7H
	 YcabnXBujLaBEG2U9D6jwfgjeyOIofQ04fg/9ntUa4yfehH64hFbu8URsWe1VbjI4
	 zDagzS9dpfjBEGb0Yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.127]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1tArae3KSi-0049e5; Mon, 28
 Oct 2024 09:38:48 +0100
Date: Mon, 28 Oct 2024 09:38:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Ned T. Crigler" <crigler@gmail.com>, Christian Heusel
 <christian@heusel.eu>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Jeff LaBundy
 <jeff@labundy.com>, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <20241028093847.29b36b8a@gmx.net>
In-Reply-To: <Zx8hfE2_3zXSTi05@google.com>
References: <Zx2iQp6csn42PJA7@xavtug>
	<69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
	<20241027163744.2d396c61@gmx.net>
	<Zx5yIEZwT5SxzCTx@xavtug>
	<Zx8hfE2_3zXSTi05@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9ULFM/WDUWY49nKPMH5ZAmZ7uf+5mVmgXhWwVLK4toYytLzgQJI
 c83ELE11mGJgRFyIs5ddFhqv9IwZFq1GRx3lvaeuBFy+kxWpxtJqEyCI1NZ5ku9vdqigweh
 5yYjzVFOcczmhSkq+yHT+OfBHRBjSu70cRuMvpRHINLViU1YA7mISyZ9w35kUkZWxU4Vl8g
 +YwoLwr3c0pAKiIJ9+l1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aHpps45i21U=;PTtJBNXj5K0N3xLy4z/LfPhGfhh
 gnEYw8UXjGxXrIRoQYBKGtr5hH8EMEslLG0Lk4bVhinb/JLVUq9pFGdRd3R9KTIvpCZjbJYih
 Hy65l7r0gjW15Uc9RF6wDUsnvASX2u6Wih2VdEheApsEYxoigbzEk0M/hO4YlwvLNJeDO1pP5
 C+oOb4Fbf9fmTNVOpDuInTiizBrYJJfm/42oDGNVVgTqajB3TTBXVsctfMGLS2NCuzdV3UdNN
 YIeErVMfUt/BQiNG1e2yAbR8Z5d0yKvZ0/f7pUXc831yYyCZFDu18G9wIl+GPD3KFLMBiO/bi
 zKtXlRmD82IHRe7rfhCFuzlkxmaB7ByY0ODP9isx1BS8XnqxzgAA6lH44nYmXlXInNGcOg4PR
 7Ny8tlxwTJEVY9z+n6MJCnzhPoWB0ZO931LNyJfr2p6EKxaKGkz7r3Q2QIytFgnP0aMqdnokU
 44DhGaNxC5jDgyZY7mUAVw5t156jYDyafvNZkamejeyw1FpOEw0kLZIoki8wyhlzTuJs/nyrT
 TSxzZimITz4rUv6eJdhzX9qv8CWBW6OURzSmBP0bj2T1/gAQPeASB3XA/ur9rOKm1LUV7IbPS
 YAvIJGLj83jzspr4FIJYTuftX3TBr3pR2YuplCXwzUUuf9KxKjK2cnnzbBRPMUcxS3m0ikz3O
 3T8ksZn1oz8hV/lc16f0XsAvr5DKkCQE5x8NGiSbAsLcUl/DOEAQO1Bi/FigRFV8zzWBjS4AS
 zSgoaMOjWz4fKvdRnedWpZ3hN7JnKe/SNcU2rBr+IofuD37sHjDKNy9epklr/BVrYSMRndccu
 pjwg5QsMu8moOLwqqhpgGF+u8tUDmlmXzpa4LeomelwJQ=

Hello Dmitry, Ned, *,

On Sun, 27 Oct 2024 22:30:36 -0700, Dmitry Torokhov <dmitry.torokhov@gmail=
.com> wrote:

> Hi everyone,
>
> On Sun, Oct 27, 2024 at 10:02:24AM -0700, Ned T. Crigler wrote:
> > Hi Peter, Christian,
> >
> > On Sun, Oct 27, 2024 at 04:37:44PM +0100, Peter Seiderer wrote:
> > > Hello Ned, Christian, *,
> > >
> > > On Sun, 27 Oct 2024 15:06:09 +0100, Christian Heusel <christian@heus=
el.eu> wrote:
> > >
> > > > On 24/10/26 07:15PM, Ned T. Crigler wrote:
> > > > > Hi,
> > > >
> > > > Hey Ned,
> > > >
> > > > > It looks like starting with kernel 6.11, disabling and re-enabli=
ng
> > > > > magic
> > > > > sysrq fails with these errors in dmesg:
> > > > >
> > > > > kernel: input: input_handler_check_methods: only one event proce=
ssing
> > > > > method can be defined (sysrq)
> > > > > kernel: sysrq: Failed to register input handler, error -22
> > > > >
> > > > > after doing:
> > > > >
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > >
> > > > I have found that this issue is also present in the latest mainlin=
e
> > > > release and bisected it to the following commit:
> > > >
> > > >     d469647bafd9 ("Input: simplify event handling logic")
> > > >
> > >
> > > After the mentioned commit a call sysrq_register_handler() -->
> > > input_register_handler(&sysrq_handler) with sysrq_handler.filter set
> > > will result in sysrq_handler.events set to input_handler_events_filt=
er,
> > > see drivers/input/input.c (line 2607 to 2608):
> > >
> > > 2596 int input_register_handler(struct input_handler *handler)
> > > 2597 {
> > > 2598         struct input_dev *dev;
> > > 2599         int error;
> > > 2600
> > > 2601         error =3D input_handler_check_methods(handler);
> > > 2602         if (error)
> > > 2603                 return error;
> > > 2604
> > > 2605         INIT_LIST_HEAD(&handler->h_list);
> > > 2606
> > > 2607         if (handler->filter)
> > > 2608                 handler->events =3D input_handler_events_filter=
;
> > > 2609         else if (handler->event)
> > > 2610                 handler->events =3D input_handler_events_defaul=
t;
> > > 2611         else if (!handler->events)
> > > 2612                 handler->events =3D input_handler_events_null;
> > >
> > > So the second call will fail at the check 'input_handler_check_metho=
ds(handler)'
> > > which only allows one method to be set, see drivers/input/input.c:
> > >
> > > 2517 static int input_handler_check_methods(const struct input_handl=
er *handler)
> > > 2518 {
> > > 2519         int count =3D 0;
> > > 2520
> > > 2521         if (handler->filter)
> > > 2522                 count++;
> > > 2523         if (handler->events)
> > > 2524                 count++;
> > > 2525         if (handler->event)
> > > 2526                 count++;
> > > 2527
> > > 2528         if (count > 1) {
> > > 2529                 pr_err("%s: only one event processing method ca=
n be defined      (%s)\n",
> > > 2530                        __func__, handler->name);
> > > 2531                 return -EINVAL;
> > > 2532         }
> > > 2533
> > > 2534         return 0;
> > > 2535 }
>
> Yes, I did not consider that we might want to re-register the same input
> handler, thank you for alerting me about the regression.
>
> > >
> > >
> > > A quick fix/hack for the sysrq case:
> > >
> > > --- a/drivers/tty/sysrq.c
> > > +++ b/drivers/tty/sysrq.c
> > > @@ -1045,7 +1045,7 @@ static inline void sysrq_register_handler(void=
)
> > >         int error;
> > >
> > >         sysrq_of_get_keyreset_config();
> > > -
> > > +       sysrq_handler.events =3D NULL;
> > >         error =3D input_register_handler(&sysrq_handler);
> > >         if (error)
> > >                 pr_err("Failed to register input handler, error %d",=
 error);
> > > lines 1-13/13 (END)
> > >
> > > Regards,
> > > Peter
> > >
> >
> > Thanks for tracking this down. It seems messy that the mentioned commi=
t
> > changes input_register_handler to overwrite ->events for an internal p=
urpose,
> > and callers may expect it to be unchanged, as sysrq does here by reusi=
ng
> > sysrq_handler.
>
> Yes, indeed. I wonder if we can solve this by moving the derived event
> handler method into input_handle structure, like the patch below.

Yes, seems reasonable (and works for the sysrq case), you can add my

	Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter


>
> Thanks.
>


