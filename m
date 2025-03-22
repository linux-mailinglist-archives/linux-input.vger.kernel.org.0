Return-Path: <linux-input+bounces-11105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E00A6CD48
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 908821707A3
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 23:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A5B1EDA03;
	Sat, 22 Mar 2025 23:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="UFhzpOit"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482861EA7FD;
	Sat, 22 Mar 2025 23:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742686337; cv=none; b=cw/87OKPCfkk5PKrmD/1Sf3VpWAFAXLA/VIqp/QKKErCEUC8ZynloCPPpWWSgdMqOLqdmpOty187yNCYevwyU9N5pJBkEbm8cOsL/PHboKzBrQb+F1Js6bQtDGgbfKbXKku6V6Lb8Guk2PBj3fxc8hnOLecsck9OQ07sIiBsmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742686337; c=relaxed/simple;
	bh=B7kvouWcMS8vWC8JAFe2meSkaukQwomnR8y/Em5MP9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKULRKo8soKhnGFe8KFJ97WPL88LqtZCbE8OwE76siA8ynnumPBWKXgzi9trr739WTtbIb+YOIc1GHv9joIhkb/fJ75t8sRuB+2w4EKcwZuMe8exPDUjxDfVrW48o507yq1746GVt0UR8aSlAeZgK0vCxz1MGh3LI79GvxQ8FPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=UFhzpOit; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 84C792E09BDE;
	Sun, 23 Mar 2025 01:32:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742686333;
	bh=MkMtCFnV0WUgPplCdeNTEtxTYc7sriDFgML1UlgqpQg=;
	h=Received:From:Subject:To;
	b=UFhzpOitCGbOP7OixUFLm9FNJh5mChjIt9S1jSOMYYQcJn6vJ+od4VmJs8EkI7EYs
	 g8cn+lR7k6P5z53aTDXlDpf2LumpfH+gXpiKMAkLR/69a83WXXabg+U2k6aLeA6Po9
	 2u2Djsff1K+FedVfdUh5hnKRhAbcznHJvIR7gNHw=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bd11bfec6so34879131fa.0;
        Sat, 22 Mar 2025 16:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVE/LyJYOsy1toa+X3Kg62xKwxZdiW7cjWcWnJmZMvz+Rfa/O5hCyP+f214u3Jbv289InzewP8O6DXq4Q==@vger.kernel.org,
 AJvYcCVdt2ko+GEeFFJs2ryyl9nlHd208nVi8gksvvBKd9PAwO+0O0jgHRvkrnJMcMDL8LxcnQpTXYpqUm/gBJAP@vger.kernel.org
X-Gm-Message-State: AOJu0YywBOhRcaFn+xgTcbBIbjRz7Q/fCxau7Ybt1o4VtRiBdwx66b0w
	32HmSPV49w0Njl5yPRlcjzgWWhTiTmEqgKgoarwyifNEFCBwaCktNhaUw0kfe4U0woRa/Aucj5c
	KObOn1ZdLvvtgZCM6rCipCha0HOk=
X-Google-Smtp-Source: 
 AGHT+IFXB9ikOPlMbNlWEBqExSGgXa6raWiOIVTgCfq7Ru1fl80HMilKLPvamqlvR9lKHmpfH1opBwY+D0hhYl3it08=
X-Received: by 2002:a2e:a542:0:b0:30c:518e:452 with SMTP id
 38308e7fff4ca-30d7e22175cmr28813951fa.13.1742686331797; Sat, 22 Mar 2025
 16:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-4-lkml@antheas.dev>
 <7d366439-72be-401f-af5b-01547cbfecd8@ljones.dev>
In-Reply-To: <7d366439-72be-401f-af5b-01547cbfecd8@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 23 Mar 2025 00:32:00 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF0txWtwg3RC3a92c5+cWiwfa_OSoHd6EMp7=1dGswAmA@mail.gmail.com>
X-Gm-Features: AQ5f1JrjC8eRGfSGeqBPVbfgUFmZ3C7qU1BhVre8Kyq_7lD7WwGwU1hJShOPkZM
Message-ID: 
 <CAGwozwF0txWtwg3RC3a92c5+cWiwfa_OSoHd6EMp7=1dGswAmA@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] HID: Asus: add Z13 folio to generic group for
 multitouch to work
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174268633286.3359.7158646274630571542@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sun, 23 Mar 2025 at 00:31, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 22/03/25 23:27, Antheas Kapenekakis wrote:
> > The Asus Z13 folio has a multitouch touchpad that needs to bind
> > to the hid-multitouch driver in order to work properly. So bind
> > it to the HID_GROUP_GENERIC group to release the touchpad and
> > move it to the bottom so that the comment applies to it.
> >
> > While at it, change the generic KEYBOARD3 name to Z13_FOLIO.
> >
> > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
>
> Never been clear on tag order but I've always put authors at top. Just
> something I noticed as it's different to what i do.

Tag was added by b4

Antheas

> >   drivers/hid/hid-asus.c | 6 +++---
> >   drivers/hid/hid-ids.h  | 2 +-
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 96461321c191c..e97fb76eda619 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -1319,9 +1319,6 @@ static const struct hid_device_id asus_devices[] = {
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > -     { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > -         USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > @@ -1351,6 +1348,9 @@ static const struct hid_device_id asus_devices[] = {
> >        * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
> >        * part, while letting hid-multitouch.c handle the touchpad.
> >        */
> > +     { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> > +             USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> >               USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
> >       { }
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 7e400624908e3..b1fe7582324ff 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -209,7 +209,7 @@
> >   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
> >   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD     0x1866
> >   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2    0x19b6
> > -#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3     0x1a30
> > +#define USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO          0x1a30
> >   #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR              0x18c6
> >   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY         0x1abe
> >   #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X               0x1b4c
>

