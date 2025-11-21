Return-Path: <linux-input+bounces-16274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F484C7861B
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 11:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 202312D33F
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 10:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206AF2D7DC5;
	Fri, 21 Nov 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKJCYp+0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FFD2E6100;
	Fri, 21 Nov 2025 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719895; cv=none; b=sHqcnCRRXmXF2TkKf4NBNKiZpUSeqLKB5Qa2ICHBjHH/Y5azSOgDnCff+I8Gbmjfx3ifP+21yIUOg3dKXYIH0KbWaUsqa3bdndUhS+idWlivpvQmo43mzYEI2Lxl154zhVy2eHhiRRQBltabdZUi9QjEtdflXUxFQBjALJ0hzp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719895; c=relaxed/simple;
	bh=GCbpLVYsOA++8fboysqkze61LMR6cXlTj5aQ5i9vpYA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KSRCRICBD0Y8zrm2YuYGNtqg0h+oY/DVvwyyjy7Kg/8D4ZJCCxxfe6GFtwzyMreBQEvVd8+Rbto42PItrN+taEBEzHIX8vnrSMpgwZLA5Torb4yHMDclkecOFefwaom5uzsdLApDmb7HvZ2HrqmHlrXcjgg5rWrwL3CEDlxQohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKJCYp+0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763719893; x=1795255893;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GCbpLVYsOA++8fboysqkze61LMR6cXlTj5aQ5i9vpYA=;
  b=VKJCYp+0HOKvSCkZEyzP1UiJdpGC/H6uzUMfMPqyDYhoy1ymAtgL73un
   EhNE3MeGYt5fRuFhgY9oKIvrynKbR6EypqdsDofqi8c1BFH2WzaSlx3dQ
   uJT9Xo1acpRJvJuCT3Cc7PSxrSZNqXDSl1KXg2G3tCIPCI13K1/gY9I5z
   SrZeB3tmjPTKPD8A47Z9AJAxFEt5gbzEYd7WVCvZKj2oQFxt3dadf0euJ
   sbuZ4eFB+FR8xQaH+k79fnoazS+S9hWkOpGAXYuACOJDqSOc+r/KmWDhG
   MKBc/lPnbWeWbB9/aQkZUNmgR2kx/m9+pj+cCLmMq/lni0Ay1RkfYdi2Y
   w==;
X-CSE-ConnectionGUID: zhAFr7DtRVupWyUwSeyupA==
X-CSE-MsgGUID: x96qp8OpQ2Gm3/MNZBC1QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65756484"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65756484"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:11:32 -0800
X-CSE-ConnectionGUID: ay0yYH9ESdenDKBPhDZ+7Q==
X-CSE-MsgGUID: lDyhhG3sSImaijiXssn+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="195818633"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:11:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Nov 2025 12:11:24 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Denis Benato <benato.denis96@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
In-Reply-To: <CAGwozwHSFy6UhbEGBSvYewoFXozd8=MrbpKv5qexeo0yA+4NkQ@mail.gmail.com>
Message-ID: <f399a2f3-b594-7633-250e-1077b4983801@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev> <20251120094617.11672-5-lkml@antheas.dev> <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com> <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com> <04075ef3-3fba-c308-871f-619972ffe5ff@linux.intel.com>
 <CAGwozwHSFy6UhbEGBSvYewoFXozd8=MrbpKv5qexeo0yA+4NkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-86961989-1763719884=:965"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-86961989-1763719884=:965
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 20 Nov 2025, Antheas Kapenekakis wrote:

> On Thu, 20 Nov 2025 at 17:41, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Thu, 20 Nov 2025, Antheas Kapenekakis wrote:
> >
> > > On Thu, 20 Nov 2025 at 15:15, Denis Benato <benato.denis96@gmail.com>=
 wrote:
> > > >
> > > >
> > > > On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > > > > Handshaking with an Asus device involves sending it a feature rep=
ort
> > > > > with the string "ASUS Tech.Inc." and then reading it back to veri=
fy the
> > > > > handshake was successful, under the feature ID the interaction wi=
ll
> > > > > take place.
> > > > >
> > > > > Currently, the driver only does the first part. Add the readback =
to
> > > > > verify the handshake was successful. As this could cause breakage=
s,
> > > > > allow the verification to fail with a dmesg error until we verify
> > > > > all devices work with it (they seem to).
> > > > >
> > > > > Since the response is more than 16 bytes, increase the buffer siz=
e
> > > > > to 64 as well to avoid overflow errors.
> > > > >
> > > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > > ---
> > > > >  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
> > > > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > > > index 6de402d215d0..5149dc7edfc5 100644
> > > > > --- a/drivers/hid/hid-asus.c
> > > > > +++ b/drivers/hid/hid-asus.c
> > > > > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and Touch=
Pad");
> > > > >  #define FEATURE_REPORT_ID 0x0d
> > > > >  #define INPUT_REPORT_ID 0x5d
> > > > >  #define FEATURE_KBD_REPORT_ID 0x5a
> > > > > -#define FEATURE_KBD_REPORT_SIZE 16
> > > > > +#define FEATURE_KBD_REPORT_SIZE 64
> > > > >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > > > >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > > > >
> > > > > @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_d=
evice *hdev, const u8 *buf, size_t bu
> > > > >
> > > > >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> > > > >  {
> > > > > +     /*
> > > > > +      * The handshake is first sent as a set_report, then retrie=
ved
> > > > > +      * from a get_report. They should be equal.
> > > > > +      */
> > > > >       const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x2=
0, 0x54,
> > > > >                    0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e=
, 0x00 };
> > > > > +     u8 *readbuf;
> > > > >       int ret;
> > > > >
> > > > >       ret =3D asus_kbd_set_report(hdev, buf, sizeof(buf));
> > > > > -     if (ret < 0)
> > > > > -             hid_err(hdev, "Asus failed to send init command: %d=
\n", ret);
> > > > > +     if (ret < 0) {
> > > > > +             hid_err(hdev, "Asus failed to send handshake: %d\n"=
, ret);
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > > +     readbuf =3D kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > > > I see my suggestion to use __free here didn't materialize in code u=
sing
> > > > it even after Ilpo kindly wrote how to correctly use it.
> > > >
> > > > I think you can move the readbuf assignment right below buf and
> > > > take into account what Ilpo said.
> > > >
> > > > I don't expect new variables will be added here ever again,
> >
> > It's also about always doing the right thing so others will pick up the
> > pattern (for the cases when it's needed).
> >
> > > > but I agree with Ilpo that it's a good idea here to write code
> > > > accounting for that possibility.
> > > >
> > > > It is my understanding that who proposes patches is expected to
> > > > resolve discussions when changes are proposed or to take into
> > > > account requested changes and submit a modified version.
> > >
> > > It was ambiguous. I interpreted Ilpo's email as a dismissal
> >
> > I tried to explain how to use it, not to suggest cleanup.h shouldn't be
> > used.
>=20
> Ok, I'll wait a few days and do another revision, doing some rewording
> as well. Hopefully that will cover everything. To that extent, try to
> finish reviewing the latter part of the series before that revision.
>=20
> I'm a bit concerned with introducing kfree here because I do not know
> how to use it and it might regress, but it should be ok.

You probably meant to say __free(), there are other things that could be=20
put inside __free() beyond kfree (no need to ack if that was the case).

It's not rocket science, basically the compiler performs the freeing=20
function when the scope the variable is in goes away. For error handling=20
rollback, this avoids need to do the cleanup call manually and no path is=
=20
left accidently without cleanup.

For cases, where you want to preserve a pointer to the allocated thing,
there are additional wrappers that one uses when returning the pointer
out of function (only gotcha here is that it will NULL the local=20
variable in question, so the variable cannot be dereferenced after that=20
point; been there, done that and had to debug a boot issue :-)).

> I'd rather push the init down instead of pulling it up. Referencing
> other code samples for kfree it is acceptable to push the variable
> definition down, right?

Yes.

Mid-function definitions used to be forbidding on the compiler level=20
but it was changed exactly because adding this auto cleanup framework. So=
=20
while top definition is still the general requirement, using __free() is an=
=20
exception to that rule and should be defined at the spot where we make=20
the "alloc" to ensure the teardown order is exactly reverse of the alloc=20
order (the order you introduce variables is the reverse of the order in=20
which the compiler will perform each tear down).

--=20
 i.

--8323328-86961989-1763719884=:965--

