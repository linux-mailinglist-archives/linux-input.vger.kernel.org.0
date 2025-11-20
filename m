Return-Path: <linux-input+bounces-16268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BC184C766F5
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 22:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EEB0134E2C0
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 21:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6C022D7B9;
	Thu, 20 Nov 2025 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="C7YEqt4q"
X-Original-To: linux-input@vger.kernel.org
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D475F275844
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675686; cv=none; b=hrP6IVzKt8P+93LOLuHqN3WAzjd0+Jxi2kxpwpp8oDr801me6M9vvyi6hCewXcZjW7CHRpgSs22s3tNWfDqOYaR7i2nVKJIMZnuqzAPxOItB2ZY+s/GOVV5M/8RZ3OYmR2q9zCV9U7gRIEXo3b41aPKRGqb1D8VckJq1QvD70XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675686; c=relaxed/simple;
	bh=nfMO8pUP9Ey5B+YHBoF+agg+SQTz6j9xdJ3R4PUCmXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv5QxGhazwq+sn8lb841eCNQUigaUhHZC286hTjzAhJX73GAbmi1otu1HQUrluZ5e7wyfa9rVprIL1wQ2tLv4Zhtgf6GiJKk/nyq5R5RjtcMJvKg0LePvrc3idQ+CCOLd1GDfRAuO69+KvchFEWrqtbZGj77xD1Cv/94zWQh/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=C7YEqt4q; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 9EEB044054
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 21:54:41 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id A408D44080
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 21:54:40 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 9F043200E5A
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 23:54:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763675680;
	bh=/yw/fa3PteFsFrN1xLwNloCfH0V5obbkxZaxM5gP44A=;
	h=Received:From:Subject:To;
	b=C7YEqt4qgLKqscdyy5JqjzD8HWbheTq+gIqK+FWCtFxzh0dluEFZaApZYm6JcJaAP
	 CJRRH9uVM4KnmWSpM7Xfz4CRyuQ945lzz8t6cSNSA7d4FXkqB2oKsekNwa5Kb3gZwY
	 jrgrnPSlcRbrnyHcB6/DIsfAlyzMFSHY7e00C5tKyQ+B2X+GRvfCifxhbBmko/n0nH
	 FJCaXnRlQfziaSC7b83j5Q4iiynkOCE2YAZAmweL4IwxcWGQkF8c769GMrNbWN2o/S
	 mwLwOM+ZQ+7fyU8KaGDFQnXqt9R4pTY1WaBETbtbZZTChF6zvZQWIYsEyJ83/lmXlK
	 vV3wRxiAxTvYw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-37ba781a6c3so11352161fa.0
        for <linux-input@vger.kernel.org>;
 Thu, 20 Nov 2025 13:54:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUVLxaCXFAxEyZt8Xf0VYyUE90WDzoQVPrC693OuAZY6gTW/bpksEdLcVADRkyOkzgAi7I1D7S/xqyfcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQVl9DbLD74S4invjJteFJtaiRAqFZpW/GM8cd2jDH7KZ1XGZ
	+7VSAW305LfbyzT3Gnwut0T0qH17h9YgOFOtl2LVCETDKuV0SKG6hlYj/Wtj337uZcdYmzPn1n5
	LF0mRcfCTD6a46+cI0MZgcAxMCcYxG3I=
X-Google-Smtp-Source: 
 AGHT+IF9hvpa1HsFfWLrTQ6u/i9/ip89gLjUNUcnWnLCv0cUEBAfa/UMeR9EMkoLb1HsYzbf+8AMmIYi301n9PS6QaU=
X-Received: by 2002:a05:651c:239:b0:37a:5bc6:ab9f with SMTP id
 38308e7fff4ca-37cc6797c70mr10108011fa.26.1763675678991; Thu, 20 Nov 2025
 13:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-5-lkml@antheas.dev>
 <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
 <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
 <04075ef3-3fba-c308-871f-619972ffe5ff@linux.intel.com>
In-Reply-To: <04075ef3-3fba-c308-871f-619972ffe5ff@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Nov 2025 22:54:27 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHSFy6UhbEGBSvYewoFXozd8=MrbpKv5qexeo0yA+4NkQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmrBP8fJB7SIc26H6mb3erCLu569uoPPUKzqGbxjSsVryGq5oQAuETh0_8
Message-ID: 
 <CAGwozwHSFy6UhbEGBSvYewoFXozd8=MrbpKv5qexeo0yA+4NkQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <benato.denis96@gmail.com>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176367567997.94444.9737093772865741269@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Nov 2025 at 17:41, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 20 Nov 2025, Antheas Kapenekakis wrote:
>
> > On Thu, 20 Nov 2025 at 15:15, Denis Benato <benato.denis96@gmail.com> w=
rote:
> > >
> > >
> > > On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > > > Handshaking with an Asus device involves sending it a feature repor=
t
> > > > with the string "ASUS Tech.Inc." and then reading it back to verify=
 the
> > > > handshake was successful, under the feature ID the interaction will
> > > > take place.
> > > >
> > > > Currently, the driver only does the first part. Add the readback to
> > > > verify the handshake was successful. As this could cause breakages,
> > > > allow the verification to fail with a dmesg error until we verify
> > > > all devices work with it (they seem to).
> > > >
> > > > Since the response is more than 16 bytes, increase the buffer size
> > > > to 64 as well to avoid overflow errors.
> > > >
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
> > > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > > index 6de402d215d0..5149dc7edfc5 100644
> > > > --- a/drivers/hid/hid-asus.c
> > > > +++ b/drivers/hid/hid-asus.c
> > > > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPa=
d");
> > > >  #define FEATURE_REPORT_ID 0x0d
> > > >  #define INPUT_REPORT_ID 0x5d
> > > >  #define FEATURE_KBD_REPORT_ID 0x5a
> > > > -#define FEATURE_KBD_REPORT_SIZE 16
> > > > +#define FEATURE_KBD_REPORT_SIZE 64
> > > >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > > >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > > >
> > > > @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_dev=
ice *hdev, const u8 *buf, size_t bu
> > > >
> > > >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> > > >  {
> > > > +     /*
> > > > +      * The handshake is first sent as a set_report, then retrieve=
d
> > > > +      * from a get_report. They should be equal.
> > > > +      */
> > > >       const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,=
 0x54,
> > > >                    0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, =
0x00 };
> > > > +     u8 *readbuf;
> > > >       int ret;
> > > >
> > > >       ret =3D asus_kbd_set_report(hdev, buf, sizeof(buf));
> > > > -     if (ret < 0)
> > > > -             hid_err(hdev, "Asus failed to send init command: %d\n=
", ret);
> > > > +     if (ret < 0) {
> > > > +             hid_err(hdev, "Asus failed to send handshake: %d\n", =
ret);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     readbuf =3D kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > > I see my suggestion to use __free here didn't materialize in code usi=
ng
> > > it even after Ilpo kindly wrote how to correctly use it.
> > >
> > > I think you can move the readbuf assignment right below buf and
> > > take into account what Ilpo said.
> > >
> > > I don't expect new variables will be added here ever again,
>
> It's also about always doing the right thing so others will pick up the
> pattern (for the cases when it's needed).
>
> > > but I agree with Ilpo that it's a good idea here to write code
> > > accounting for that possibility.
> > >
> > > It is my understanding that who proposes patches is expected to
> > > resolve discussions when changes are proposed or to take into
> > > account requested changes and submit a modified version.
> >
> > It was ambiguous. I interpreted Ilpo's email as a dismissal
>
> I tried to explain how to use it, not to suggest cleanup.h shouldn't be
> used.

Ok, I'll wait a few days and do another revision, doing some rewording
as well. Hopefully that will cover everything. To that extent, try to
finish reviewing the latter part of the series before that revision.

I'm a bit concerned with introducing kfree here because I do not know
how to use it and it might regress, but it should be ok.

I'd rather push the init down instead of pulling it up. Referencing
other code samples for kfree it is acceptable to push the variable
definition down, right?

Antheas

> > I will try to incorporate it if I do another revision. Although I do
> > not think it improves things in this case as the function does not
> > have multiple return statements.
> >
> > > > +     if (!readbuf)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D hid_hw_raw_request(hdev, report_id, readbuf,
> > > > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE=
_REPORT,
> > > > +                              HID_REQ_GET_REPORT);
> > > > +     if (ret < 0) {
> > > > +             hid_err(hdev, "Asus failed to receive handshake ack: =
%d\n", ret);
> > > > +     } else if (memcmp(readbuf, buf, sizeof(buf)) !=3D 0) {
> > > > +             hid_warn(hdev, "Asus handshake returned invalid respo=
nse: %*ph\n",
> > > > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > > > +             /*
> > > > +              * Do not return error if handshake is wrong until th=
is is
> > > > +              * verified to work for all devices.
> > > > +              */
> > > > +     }
> > > >
> > > > +     kfree(readbuf);
> > > >       return ret;
> > > >  }
> > > >
> > >
> >
>
> --
>  i.
>
>


