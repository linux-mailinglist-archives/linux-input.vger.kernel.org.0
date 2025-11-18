Return-Path: <linux-input+bounces-16200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FFC6C0AF
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8146350CB4
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 23:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E9D31329D;
	Tue, 18 Nov 2025 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="UFIMa4TX"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D3316192
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509606; cv=none; b=QUbvmy7TEqf3qL09WYuWF9OfrAXmCoHg1QjS4IHhaaHOWNADV1KjkwpnAHXoZHrHKZ/qhRFzQ8Pu7hZRa9ebF8/+LMC1qSghMFcjoisu/pu+76LFYFfH8F/NHM2ST3ikg+o+IWuWRpconwWMHcVtfQ8S814u879eWLEG1eL6auo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509606; c=relaxed/simple;
	bh=Y81iAgwGzd6F0tM2YJ9kwTo44xHD+hJ38WYbaWW96lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbGDb04UZQe6pX3J485nqBrRGWEVhWNAiA4c6VimrY6vNapPu1yDNz8muhd/ZnevErCiwOwuDnx3Vtg6sbA/zQxzcW/D0FvUJTlmM7HL4OMa9ccbHQ9ZsFzJ3R16PRUp2ldocXaL2xvfTy+h/jVAl74FrBSPe0HIGGW71/9VXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=UFIMa4TX; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 09C583EC65
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:46:34 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 38F623EA26
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:46:33 +0200 (EET)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 97E7A201E72
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:46:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763509592;
	bh=KoENTDO5p3S1g1mgVozMSsgTw57pzVWf7oZ7ZONvhVU=;
	h=Received:From:Subject:To;
	b=UFIMa4TXT90HX2/cQoco2ly4v7AeTtdKYlaj2Rj7oj1zUTr7noiPHKBKxQ/UM3VVj
	 3HK9+46nj4LlEl/B0dhoab0pWTMVyyrveJvbjvX6vegY/xIRKT9dTT5ate1/lgB5Fx
	 FS5PmqkfZbLRbE6CRz735x2yGeW/elFRMkj0xut7auEA8CWgLw2Zay0Xln2fOVpsQO
	 0N8BZ77exhyDfYV0bJcG87c/J5BNWceHmEk/athbptFJf9sed3+AOD2XJD7BikdQyy
	 CTW0jsLDBfd1xSd93oEqiQszZjtbTwrJPqpmP77YT+eM3yVtxEcB6Izo8pQUS82gjF
	 iPT7XEdXyoQ/g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-37bbb36c990so3075831fa.0
        for <linux-input@vger.kernel.org>;
 Tue, 18 Nov 2025 15:46:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZt7CB0SRc6FdAVaHetIo0wJrVHNLXRFrOvwGb9AVZbv1XvAi1cG44G32X2w93OiMabmYfdjy2JtsJUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwZN61a7QL2spUGCEE8B2UfQ6Zedf3wA9IJNSP/0hHMDo1M/8
	5ZfUA0peC/O71OVseEop8bXK/+8EY3jv4wVct3zTjKLK5zhxjL4Kak40Gq0QvdrhO5grKU8JJg+
	Ke9o05+230IAhqj/Z1Cg6kPC7RSH5zZU=
X-Google-Smtp-Source: 
 AGHT+IF2C3X5HVW+Q3X8xfphx3QF7R2OPCeQvc+LT7a82QRhAnICGo0kVMeXwEAjzM9nm6FP336yuNMUujqZCQIhO5U=
X-Received: by 2002:a2e:3a18:0:b0:37a:4277:86f8 with SMTP id
 38308e7fff4ca-37c6a126505mr814721fa.10.1763509592130; Tue, 18 Nov 2025
 15:46:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-4-lkml@antheas.dev>
 <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
In-Reply-To: <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 19 Nov 2025 00:46:20 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwG6_r=XzrDtcFO7SivHUzmDgbYH8mQVZGvZLDOTRFuoAw@mail.gmail.com>
X-Gm-Features: AWmQ_bk9hEynhjlFSuhv8f2T0wWvP2CJDTBPwfjDwmrUxRa_ikvKBlGx1W3l4MY
Message-ID: 
 <CAGwozwG6_r=XzrDtcFO7SivHUzmDgbYH8mQVZGvZLDOTRFuoAw@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] HID: asus: fortify keyboard handshake
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176350959279.1506124.12450873059371161257@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 19 Nov 2025 at 00:43, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/1/25 11:47, Antheas Kapenekakis wrote:
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
> > index 4676b7f20caf..03f0d86936fc 100644
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
> > @@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
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
>
> __free(kfree) = NULL here? Would simplify the code.
>
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
> > +     if (!readbuf)
> > +             return -ENOMEM;
> > +
> > +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > +                              HID_REQ_GET_REPORT);
> See comments on patch 1 (also reported below): not sure if others
> report_id are going to answer, my guess is that we will have to try
> if you choose to go that route.
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > +             hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > +             /*
> > +              * Do not return error if handshake is wrong until this is
> > +              * verified to work for all devices.
> > +              */
> In review of patch 1 I requested this function to be called with more report_id
> than just 0x5a so this will have to be checked against those values too.
>
> In alternative you can fork based on the report_id, but having confirmation that
> this is valid with those ids too would be of great help. Perhaps I can help you
> with this asking to asus-linux users.

Yes, it is valid to do a get_report for handshakes with 0x5d/0x5e, and
this patch is non-fatal. If it causes warnings to be printed that can
be dealt then.

Antheas

> > +     }
> >
> > +     kfree(readbuf);
> >       return ret;
> >  }
> >
>


