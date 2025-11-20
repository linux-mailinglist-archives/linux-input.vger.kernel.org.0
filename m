Return-Path: <linux-input+bounces-16257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B89C748E5
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 15:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id E011929ABC
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 14:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFCD34A3CE;
	Thu, 20 Nov 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="KqT+2oBT"
X-Original-To: linux-input@vger.kernel.org
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A333491F2
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648951; cv=none; b=sTEwAsHtnVIIMP6AeDU2AsanKFcYTPCQ+/s2v/u/NfD9jtMKL9GLvvtUG8+PJol+nk/KdqSRnO7a0IPfqe082GTD3zOntk0Sxs4V0ShQkPetlzj0Gv/MZLWJx7sutVQb5hTeUN8R6an/+ytHHyXcKhQ5zPSo096rt8RxhRcQBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648951; c=relaxed/simple;
	bh=y9T5W3mZuIgccMZKYEybLuo1DVoNqauScMiQFkdcj+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWU/s41Q8+6cU0YS7k+uxqAqjUToBm6qc6USkicHpXyCAf/tqldYixT22ggkuOIBoG72/lTbJnwtm3L2xMbgDGhzdk7ZR61GVA5k58sCXgigHFr7d/ZgYAf2SHuSwgLhcYgBVBNGZJGnzPJhjCHiaFFI1domrFzwv4h7bRFH78Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=KqT+2oBT; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 302BF4407C
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:29:07 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 7F6F044054
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:29:06 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C1AA5200C6E
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:29:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763648946;
	bh=t4VoVkGuW8Juro1IA3AkGhUa+8HOMn2XjW10FQnJfA8=;
	h=Received:From:Subject:To;
	b=KqT+2oBTuMh7ZfmtG6cpOT4hxEdmYbKhLU4ge2eobkot7aMf320190MVRn19fFpMY
	 mIdAxpoaZiFgXq8mFboKLsrg6CkJGEqVFhC9vnzZAEfv6yUQBaeZ2CWw1yhViHYZFm
	 YgHJ1AuKS1YlOWsR9X2N0e9NXjZ86Ye7t5voCaSwHlgM77nyJkgb/VLdwz5YTIwfuK
	 lFk8oPke0pKjFK0dqPmumScVyu+qJx13KXHsKOkV2q4kv3iyDdsgDX80f6RAMlWQAf
	 nmDpZAVIiwj1nJcc9ltlD34fQVSr0qe/cZdA3axceD2xfxuaDMYD95W0W/TbxFS0Ks
	 yZXD/Q5h92gjQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37a33f49018so6890851fa.2
        for <linux-input@vger.kernel.org>;
 Thu, 20 Nov 2025 06:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXl0XLNmotJC3oLknRmyJNMZaDK9IPiyr/Dyr2ketMJL6/3o/cIOzUd/XZ9bugNJbsHYpFRnQBNMTde0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8uYIhhpccNCMTVwXHdaHGUR82bvuKz7AS/86jfdsPA5/Ncxtu
	DnWfxN3dt7ovN7YDiXlc8pDr4UQjQdS1Mkyms154QV9qqnrgpbSxTecoAsUyS+xsh+tAXfo5vDM
	W6QELgEOeT/QUUiwjpI0bixl7b7IL17I=
X-Google-Smtp-Source: 
 AGHT+IHR70YXT5oFejeYarVO0au0IptD4dKyY1rABeYNj/2QqX6OtLq38kNROZHdJY6m9BlO3Ku9SrCRUEpT+iTYE3I=
X-Received: by 2002:a2e:8649:0:b0:37a:39fb:b2f1 with SMTP id
 38308e7fff4ca-37cc67964b8mr9146131fa.27.1763648945272; Thu, 20 Nov 2025
 06:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-5-lkml@antheas.dev>
 <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
In-Reply-To: <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Nov 2025 15:28:52 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
X-Gm-Features: AWmQ_bnO2IaCIhmepM-mEPflsc5g6fnmKZJEcEL8sb9r806gpilgaZLUTk5rHuY
Message-ID: 
 <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176364894600.2686110.16052668250288063046@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Nov 2025 at 15:15, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > Handshaking with an Asus device involves sending it a feature report
> > with the string "ASUS Tech.Inc." and then reading it back to verify the
> > handshake was successful, under the feature ID the interaction will
> > take place.
> >
> > Currently, the driver only does the first part. Add the readback to
> > verify the handshake was successful. As this could cause breakages,
> > allow the verification to fail with a dmesg error until we verify
> > all devices work with it (they seem to).
> >
> > Since the response is more than 16 bytes, increase the buffer size
> > to 64 as well to avoid overflow errors.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 6de402d215d0..5149dc7edfc5 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define FEATURE_REPORT_ID 0x0d
> >  #define INPUT_REPORT_ID 0x5d
> >  #define FEATURE_KBD_REPORT_ID 0x5a
> > -#define FEATURE_KBD_REPORT_SIZE 16
> > +#define FEATURE_KBD_REPORT_SIZE 64
> >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> >
> > @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
> >
> >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> >  {
> > +     /*
> > +      * The handshake is first sent as a set_report, then retrieved
> > +      * from a get_report. They should be equal.
> > +      */
> >       const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> >                    0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > +     u8 *readbuf;
> >       int ret;
> >
> >       ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> > -     if (ret < 0)
> > -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> I see my suggestion to use __free here didn't materialize in code using
> it even after Ilpo kindly wrote how to correctly use it.
>
> I think you can move the readbuf assignment right below buf and
> take into account what Ilpo said.
>
> I don't expect new variables will be added here ever again,
> but I agree with Ilpo that it's a good idea here to write code
> accounting for that possibility.
>
> It is my understanding that who proposes patches is expected to
> resolve discussions when changes are proposed or to take into
> account requested changes and submit a modified version.

It was ambiguous. I interpreted Ilpo's email as a dismissal

I will try to incorporate it if I do another revision. Although I do
not think it improves things in this case as the function does not
have multiple return statements.

> > +     if (!readbuf)
> > +             return -ENOMEM;
> > +
> > +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > +                              HID_REQ_GET_REPORT);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > +             hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > +             /*
> > +              * Do not return error if handshake is wrong until this is
> > +              * verified to work for all devices.
> > +              */
> > +     }
> >
> > +     kfree(readbuf);
> >       return ret;
> >  }
> >
>


