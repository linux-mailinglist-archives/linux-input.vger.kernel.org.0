Return-Path: <linux-input+bounces-17219-lists+linux-input=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-input@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PYKJ9HGb2mgMQAAu9opvQ
	(envelope-from <linux-input+bounces-17219-lists+linux-input=lfdr.de@vger.kernel.org>)
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 19:17:53 +0100
X-Original-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 16346494A4
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 19:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B230C8013D6
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 17:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553483D3331;
	Tue, 20 Jan 2026 17:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="nlQlm7O2"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2746D428839
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930889; cv=none; b=H2ohI9xbL7Ms6Fz8+fh+W6yhC92Fi4COR/GU93Tb2SB9X0HcH4HjXli+wxp+zmD+PamMzH0/VjFRonkOWricpZu+8oije4rCYozutIL3BFlvkf8nnPx5Ieke0ip5qO3PjLWboIliFeyvpUSIcAeeZhY+stcf3Btzl9b5EiHS8xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930889; c=relaxed/simple;
	bh=JizZcOH1B59z/BEuSGyxQHQy75nqetjkDll7IQnabYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoMx8zJ8OKW4l9VfdZFPZRRpMiDcjj5m2afqbJJHxEZhN0B7zd4j1YtZcWy3tdy+6n59WqhtY1XVUzTG4p91hsQK5qQDJq99z7m4MhxA0b3OHYVRpW74A1fGG0SEOU0SIuB2Jyybtox82G5KzFhSF8W9laXT1KTgeTDwldN7vnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=nlQlm7O2; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 622BB5E67D
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 19:41:18 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 39F0F5E523
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 19:41:17 +0200 (EET)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 23DDB200E8D
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 19:41:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768930876;
	bh=4geqtX4gL4tOtZvzUVjlcfn+Z393ztWYdisAf+X0wVc=;
	h=Received:From:Subject:To;
	b=nlQlm7O2yhRwcIJCmIU+owWEejlcf9z/Yjegv1+LU6BTb/5tstPc4iRve/4YaFd9J
	 yUN5JwQb3a64MR9aB6o1Uwv01iwg5TfymvNYNRJFAa8H15zmNJffc8jonR8p3Ekmba
	 3Io3jhtT+ZBopUwIKDffy4msNL2UBGrhtU6hp3iktp4pNiFbBNA8GJl6e3WwdRz+o3
	 WltlrQPkxSFow/ZfqwTjpXk0g3J4RqiCodK2ORi6huImMJhlJ5R33r/l4boUA9r65r
	 TMUelHGjWQCkUYWlKsMISaK030CTMoq58SmlcreCCbTKJQxuwYLeBLVoNh1+M7StPQ
	 Pp8Vruo+gcKLQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3831c18b23bso44411631fa.2
        for <linux-input@vger.kernel.org>;
 Tue, 20 Jan 2026 09:41:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUY48Hs/Oh5h9kg3qShzxoiESkUTsvS5/t/3KWqJ1xRQ8XNTVihnVs+SX4uBLWf6inrhw21JPHklAlvXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw/Dv+dzsGfaLZNQwFXbBFtfH51hF0bSM2DvCW5PMoCnu0aEy7
	kZvmjlldkZDJvnX/JVSFq8J1qNCh6qJYICy2LaEQcmB6A1g/Mc5buOp00OZ6LuzEI5Sj4K/CN39
	LeqKOamESmH/4uS35njISTkpd+/Xsf84=
X-Received: by 2002:a05:651c:4213:b0:37e:884f:b6b4 with SMTP id
 38308e7fff4ca-385a5496c2bmr9508911fa.26.1768930875597; Tue, 20 Jan 2026
 09:41:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-3-lkml@antheas.dev>
 <14407ba9-34f1-4114-bfb3-043b53ea7769@linux.dev>
 <CAGwozwGyUpBq4GGvyDHj089a9-vxNOnqgSBys3-CC_+tKDywaA@mail.gmail.com>
 <fe66c416-161c-489e-a38f-9dc7729c6ed7@linux.dev>
 <CAGwozwESNrQZ240_qDMf1pdpCRXooxstGcqP10cGp=q-F_SrAQ@mail.gmail.com>
 <8102eb26-5206-49e6-a994-a9d3ea480255@linux.dev>
 <CAGwozwH71LDiBFM-Ro9UpZNy29C6HHwCNZjwCS3F1hMfuUXZ4g@mail.gmail.com>
 <be8ba636-ae07-4d42-88ca-57ecf10b7dae@linux.dev>
 <CAGwozwGdhu_chetK6uQ=FXctC1D8LABj5QxVff1B486EKYSLug@mail.gmail.com>
 <e4349b27-86e1-41d6-864f-5ad6d353dc46@linux.dev>
 <CAGwozwF--y3vsqhdqYFV_x1ff7jfSkYaQHeV1OV70yue7Huk=A@mail.gmail.com>
 <89a67ace-6fef-72e0-4ef3-be828dd85e3d@linux.intel.com>
In-Reply-To: <89a67ace-6fef-72e0-4ef3-be828dd85e3d@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 20 Jan 2026 18:41:03 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGdDe+M36RE_CMjXePBX-CVRORjHZbOroS+e_Dc_Am2vg@mail.gmail.com>
X-Gm-Features: AZwV_Qi25ZW_QcCR7nSysemxGk1bdY8nNbkSrCIeox5V_wnw7O-3LM6S0ASZ9xs
Message-ID: 
 <CAGwozwGdDe+M36RE_CMjXePBX-CVRORjHZbOroS+e_Dc_Am2vg@mail.gmail.com>
Subject: Re: [PATCH v11 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176893087633.3974468.3666299995806761010@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[antheas.dev:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,kernel.org,gmail.com,ljones.dev];
	TAGGED_FROM(0.00)[bounces-17219-lists,linux-input=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:email,mail.gmail.com:mid,antheas.dev:email,antheas.dev:dkim];
	DMARC_NA(0.00)[antheas.dev];
	DKIM_TRACE(0.00)[antheas.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkml@antheas.dev,linux-input@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-input];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16346494A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 at 14:56, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 17 Jan 2026, Antheas Kapenekakis wrote:
> > On Sat, 17 Jan 2026 at 18:05, Denis Benato <denis.benato@linux.dev> wro=
te:
> > > On 1/17/26 17:16, Antheas Kapenekakis wrote:
> > > > On Sat, 17 Jan 2026 at 17:12, Denis Benato <denis.benato@linux.dev>=
 wrote:
> > > >> On 1/17/26 17:10, Antheas Kapenekakis wrote:
> > > >>> On Sat, 17 Jan 2026 at 16:13, Denis Benato <denis.benato@linux.de=
v> wrote:
> > > >>>> On 1/17/26 16:07, Antheas Kapenekakis wrote:
> > > >>>>> On Sat, 17 Jan 2026 at 14:51, Denis Benato <denis.benato@linux.=
dev> wrote:
> > > >>>>>> On 1/17/26 00:10, Antheas Kapenekakis wrote:
> > > >>>>>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linu=
x.dev> wrote:
> > > >>>>>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> > > >>>>>>>>
> > > >>>>>>>>> Currently, ID1/ID2 initializations are performed for all NK=
EY devices.
> > > >>>>>>>>> However, ID1 initializations are only required for RGB cont=
rol and are
> > > >>>>>>>>> only supported for RGB capable devices. ID2 initializations=
 are only
> > > >>>>>>>>> required for initializing the Anime display endpoint which =
is only
> > > >>>>>>>>> supported on devices with an Anime display. Both of these
> > > >>>>>>>>> initializations are out of scope for this driver (this is a=
 brightness
> > > >>>>>>>>> control and keyboard shortcut driver) and they should not b=
e performed
> > > >>>>>>>>> for devices that do not support them in any case.
> > > >>>>>>>>>
> > > >>>>>>>>> At the same time, there are older NKEY devices that have on=
ly been
> > > >>>>>>>>> tested with these initializations in the kernel and it is n=
ot possible
> > > >>>>>>>>> to recheck them. There is a possibility that especially wit=
h the ID1
> > > >>>>>>>>> initialization, certain laptop models might have their shor=
tcuts stop
> > > >>>>>>>>> working (currently unproven).
> > > >>>>>>>>>
> > > >>>>>>>>> For an abundance of caution, only initialize ID1/ID2 for th=
ose older
> > > >>>>>>>>> NKEY devices by introducing a quirk for them and replacing =
the NKEY
> > > >>>>>>>>> quirk in the block that performs the inits with that.
> > > >>>>>>>>>
> > > >>>>>>>>> In addition, as these initializations might not be supporte=
d by the
> > > >>>>>>>>> affected devices, change the function to not bail if they f=
ail.
> > > >>>>>>>>>
> > > >>>>>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> > > >>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > >>>>>>>>> ---
> > > >>>>>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> > > >>>>>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> > > >>>>>>>>>
> > > >>>>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.=
c
> > > >>>>>>>>> index 323e6302bac5..dc7af12cf31a 100644
> > > >>>>>>>>> --- a/drivers/hid/hid-asus.c
> > > >>>>>>>>> +++ b/drivers/hid/hid-asus.c
> > > >>>>>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and=
 TouchPad");
> > > >>>>>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> > > >>>>>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> > > >>>>>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> > > >>>>>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> > > >>>>>>>> These past days I have taken a look at new 2025 models and t=
hey do make use of ID2,
> > > >>>>>>>> and won't do harm sending ID1 either. I think you can safely=
 remove the if and send regardless.
> > > >>>>>>> Hi Denis,
> > > >>>>>>> it is not the responsibility of this driver. ID2 is used by A=
nime
> > > >>>>>>> models. It is a concession to make sure that we do not cause =
a
> > > >>>>>>> regression that will cause warnings for a lot of users.
> > > >>>>>> Who decided it is a concession?
> > > >>>>> I would rather remove the extra calls unless they are shown to =
be
> > > >>>>> needed, which they might be for these PIDs.
> > > >>>> They are needed on older laptop and to not regress userspace.
> > > >>>>
> > > >>>> You just named _LEGACY an usb pid that is not legacy.
> > > >>>>> The quirk is named legacy because we can't retest these devices=
. If we
> > > >>>>> can, then we could remove the quirk and the inits if not needed=
.
> > > >>>> We can't retest every device, and that pid is used in pre-2021 m=
odels,
> > > >>>> and these are the unknown, I am criticizing the name of the quir=
k here,
> > > >>>> not what it does.
> > > >>> If you can test whether your device needs them that would be grea=
t.
> > > >> That is pointless.
> > > >>>> I am also questioning if the quirk is even needed since sending
> > > >>>> those commands to (at least) recent hardware that doesn't use
> > > >>>> those endpoints carries no downsides, while removing them
> > > >>>> surely does.
> > > >>> We have not found a device yet that needs them. I do not want to =
keep
> > > >>> sending unneeded commands. It could cause obscure bugs or interfe=
re
> > > >>> with userspace software such as the one you maintain. So at least=
 for
> > > >>> new hardware that is possible to test we should remove them.
> > > >> There is new hardware that needs them, as I said, including 2025 m=
odels.
> > > > I was not aware of that. As far as I know they are not needed. Do y=
ou
> > > > have a bug report with a specific laptop model I can look at?
> > > There is current effort to integrate commands that requires those
> > > initializations on 2025 laptop, why would I strip out a command
> > > that I already know is required anyway?
> >
> > Hi,
> > yes ID1 is required for RGB, I have a draft patch for it that would
> > lazily do it if RGB is supported.
> >
> > I recall now a previous discussion about it being required for some
> > laptop shortcuts but we never found a laptop that needs it so I forgot
> >
> > > No, this is not the way to go to knowingly and willingly cause
> > > troubles (both known and unknown) to others just because
> > > you think it's better this way.
> > >
> > > Change the name of _LEGACY to something else, have this accepted
> > > and then if I see it's appropriate  to remove the if and send those
> > > regardless I will.
> >
> > Sure, up to you if you want to change the name. What would you like it
> > be? I would like this series to merge
>
> Can you name it e.g. something that should be neutral such as:
>
> QUIRK_ROG_NKEY_ID1_ID2_INIT
>
> I'm not sure if ROG NKEY should still be included into the name based on
> what Denis mentioned about recent models but at least it gets rid of the
> "legacy" connotation. If wider scope is necessary you could use just
> QUIRK_ID1_ID2_INIT.

It's NKEY only so QUIRK_ROG_NKEY_ID1ID2_INIT would be more appropriate
(all recent models are NKEY)

Sounds like a plan, I will resend tomorrow. If anyone wants to leave
any more comments now is the time.

Antheas

> --
>  i.
>


