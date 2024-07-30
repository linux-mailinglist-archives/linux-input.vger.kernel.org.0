Return-Path: <linux-input+bounces-5204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9A940555
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 04:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02ABB1C20E1C
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 02:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EEADF60;
	Tue, 30 Jul 2024 02:37:37 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22497A23;
	Tue, 30 Jul 2024 02:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722307057; cv=none; b=AiS13l8/zxIH1yNzxqG4iZzsFimUYDwfMW3XgGJQM354MOUD/qWHbXKY0Nln0aC74ZHhSLxt41p6qcjZ/aCEaCjjOBsXJElvUxs6SnEKW+NQjsSCkAPKyHv95aOehj5lajz2NZO/mYrepBmNI3DnfgHEMLLSYJ8a2yUIrMHt8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722307057; c=relaxed/simple;
	bh=c4wZsnyyf0hWoZXsBZdn2ZwhuFNQh2XnMIS2Sz8ZqJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oc0cSO9jPlN2ZRBCykHAs2BDtvxLQhftUzSd762rAvJAWjTYdZEFwX0kz8pElI0EXJS/vRy7DcYwiJqn4GVXBVK+X+4U63tvGIC6aAO96iQeYL1WqnYNS/Y74e0zZKgRsegQ3ceHycU505rQ9C03T0J0IKgJyhgWjqRLl1qDrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtp86t1722307017to42vdpi
X-QQ-Originating-IP: oI59ucmuHNcIl3NFOp6HAEusvqoms6QAQHGeNAGg86o=
Received: from john-PC ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Jul 2024 10:36:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4226501191237650424
Date: Tue, 30 Jul 2024 10:36:54 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dmitry.torokhov@gmail.com, hdegoede@redhat.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - fix LED state at suspend/resume
Message-ID: <AEE5460C5CD4A14F+20240730103654.53ddcc6a@john-PC>
In-Reply-To: <c6eb2082-1100-42a4-99dd-8b29cf2042b1@wanadoo.fr>
References: <20240726102730.24836-1-maqianga@uniontech.com>
	<c6eb2082-1100-42a4-99dd-8b29cf2042b1@wanadoo.fr>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0

On Fri, 26 Jul 2024 16:43:54 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Le 26/07/2024 =C3=A0 12:27, Qiang Ma a =C3=A9crit=C2=A0:
> > After we turn on the keyboard CAPSL LED and let the system suspend,
> > the keyboard LED is not off, and the kernel log is as follows:
> >=20
> > [  185.987574] i8042: [44060] ed -> i8042 (kbd-data)
> > [  185.988057] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> > [  185.988067] i8042: [44061] 04 -> i8042 (kbd-data)
> > [  185.988248] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> >=20
> > The log shows that after the command 0xed is sent, the data
> > sent is 0x04 instead of 0x00.
> >=20
> > Solution:
> > Add a bitmap variable ledon in the atkbd structure, and then set
> > ledon according to code-value in the event, in the atkbd_set_leds
> > function, =20
>=20
> Hi,
>=20
> s/atkbd_set_leds function/atkbd_set_leds()/
>=20
> > first look at the value of lenon, if it is 0, there is no need to =20
>=20
> s/lenon/ledon/
>=20
> > look at the value of dev->led, otherwise, Need to look at dev->led =20
>=20
> s/Need/need/
>=20

Thank you very much for pointing it out, I will fix it in the V2 patch
version.

> > to determine the keyboard LED on/off.
> >=20
> > Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> > ---
> >   drivers/input/keyboard/atkbd.c | 35
> > +++++++++++++++++++++++++--------- 1 file changed, 26
> > insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/input/keyboard/atkbd.c
> > b/drivers/input/keyboard/atkbd.c index 7f67f9f2946b..27d8f375929e
> > 100644 --- a/drivers/input/keyboard/atkbd.c
> > +++ b/drivers/input/keyboard/atkbd.c
> > @@ -237,6 +237,8 @@ struct atkbd {
> >   	struct mutex mutex;
> >  =20
> >   	struct vivaldi_data vdata;
> > +
> > +	unsigned long ledon[BITS_TO_LONGS(LED_CNT)]; =20
>=20
> DECLARE_BITMAP()?
>=20
Refer to dev->led, instead of calling DECLARE_BITMAP(), consider using
it.
> >   };
> >  =20
> >   /*
> > @@ -604,24 +606,34 @@ static int atkbd_set_repeat_rate(struct atkbd
> > *atkbd) return ps2_command(&atkbd->ps2dev, &param,
> > ATKBD_CMD_SETREP); }
> >  =20
> > +#define ATKBD_DO_LED_TOGGLE(dev, atkbd, type, v, bits,
> > on)		\
> > +({
> > \
> > +	unsigned char __tmp =3D
> > 0;					\
> > +	if (test_bit(LED_##type,
> > atkbd->on))				\
> > +		__tmp =3D test_bit(LED_##type, dev->bits) ? v :
> > 0;	\
> > +
> > else
> > \
> > +		__tmp =3D
> > 0;						\ =20
>=20
> Is it needed? __tmp is already initialized as 0.

It's really not necessary.

>=20
> > +
> > __tmp;
> > \ +}) +
> >   static int atkbd_set_leds(struct atkbd *atkbd)
> >   {
> >   	struct input_dev *dev =3D atkbd->dev;
> > -	unsigned char param[2];
> > +	unsigned char param[2] =3D {0}; =20
>=20
> This extra initialization does not seem necessary. IIUC, the length
> to sent is already encoded in ATKBD_CMD_SETLEDS and
> ATKBD_CMD_EX_SETLEDS.
>=20

Looking again at the ps2_command function, yes, the length to sent is
already encoded in ATKBD_CMD_SETLEDS and ATKBD_CMD_EX_SETLEDS.

> >  =20
> > -	param[0] =3D (test_bit(LED_SCROLLL, dev->led) ? 1 : 0)
> > -		 | (test_bit(LED_NUML,    dev->led) ? 2 : 0)
> > -		 | (test_bit(LED_CAPSL,   dev->led) ? 4 : 0);
> > +	param[0] =3D ATKBD_DO_LED_TOGGLE(dev, atkbd, SCROLLL, 1,
> > led, ledon)
> > +		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, NUML,    2,
> > led, ledon)
> > +		 | ATKBD_DO_LED_TOGGLE(dev, atkbd, CAPSL,   4,
> > led, ledon); if (ps2_command(&atkbd->ps2dev, param,
> > ATKBD_CMD_SETLEDS)) return -1;
> >  =20
> >   	if (atkbd->extra) {
> >   		param[0] =3D 0;
> > -		param[1] =3D (test_bit(LED_COMPOSE, dev->led) ?
> > 0x01 : 0)
> > -			 | (test_bit(LED_SLEEP,   dev->led) ?
> > 0x02 : 0)
> > -			 | (test_bit(LED_SUSPEND, dev->led) ?
> > 0x04 : 0)
> > -			 | (test_bit(LED_MISC,    dev->led) ?
> > 0x10 : 0)
> > -			 | (test_bit(LED_MUTE,    dev->led) ?
> > 0x20 : 0);
> > +		param[1] =3D ATKBD_DO_LED_TOGGLE(dev, atkbd,
> > COMPOSE, 0x01, led, ledon)
> > +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd,
> > SLEEP,   0x02, led, ledon)
> > +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd,
> > SUSPEND, 0x04, led, ledon)
> > +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd,
> > MISC,    0x10, led, ledon)
> > +			 | ATKBD_DO_LED_TOGGLE(dev, atkbd,
> > MUTE,    0x20, led, ledon); if (ps2_command(&atkbd->ps2dev, param,
> > ATKBD_CMD_EX_SETLEDS)) return -1;
> >   	}
> > @@ -695,6 +707,11 @@ static int atkbd_event(struct input_dev *dev,
> >   	switch (type) {
> >  =20
> >   	case EV_LED:
> > +		if (value)
> > +			__set_bit(code, atkbd->ledon);
> > +		else
> > +			__clear_bit(code, atkbd->ledon);
> > +
> >   		atkbd_schedule_event_work(atkbd,
> > ATKBD_LED_EVENT_BIT); return 0;
> >    =20
>=20
>=20

Thank review, I will fix them in the v2 patch version.


