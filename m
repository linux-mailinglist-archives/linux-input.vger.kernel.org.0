Return-Path: <linux-input+bounces-16264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF08C756C1
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 17:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id F0F902A8FF
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 16:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D337533CEA5;
	Thu, 20 Nov 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDtUlSoI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D933D6E8;
	Thu, 20 Nov 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763656884; cv=none; b=PMeXmCdbhDktbvY1UdwW1KhZOCnVdIQeB1hUwsTIHd0NEDgmIZ1cv3W5Bf+bzENrlHIN4nDdhPx4tBE9KsvUo/kbIKYyZW/gzfaqbJDA53429USvU9UKNSuXn518X4eAqTDzEJXi/N5AOClItOZXFDrh0XfCCQia2XvDFvxf9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763656884; c=relaxed/simple;
	bh=QdTN/sry0XEs+XUYxMEXo1t3BCrOPbZtrXT5JZbbz8Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MgDNMBcdvtnnv0r/FkVGAze1qpRHgwz38UKuJaZnLE0HyUn9TWtJb/mbwiEEmi+YgoUx9SinNYThK4gDhQsaWXrro183DM+73NgvHqD4BsymQ+tTXfK6cyHGBseCCh+6OrJF6b6PXG86QhOTREwO1jVDNE4UuNpHr6/x2I9nTxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDtUlSoI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763656883; x=1795192883;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QdTN/sry0XEs+XUYxMEXo1t3BCrOPbZtrXT5JZbbz8Y=;
  b=PDtUlSoIs86Hm2VAvmW0NENbEiZrDYPbTSlJ2oVcCWEvPZLWIYpbMSGB
   aU6jdCbF1EN2X2vYfZ966SjZMFk8R5nEItrftzDBZg4S2iIhB9VDz5u0y
   ikyFT6O3HXFku1wKr7Ylixe0funSxiJ8q40SRISZ+LZmDWd1aFz7Dov6q
   knISZbF1jqEOawf/teyWn/tWnGFsVDqgO8koqvh8f6AElSp7OX9RjRlFJ
   BPiU+0pOI7kldkeZmJ+kJPyoAEXoEmX88xnnfK04wotAeypZbQI+OSEpw
   JCasnK37o8qyrV96WSGS3b2h5IsdHpiM/imeT4jAX0K1p4z6oVmxb7UuU
   Q==;
X-CSE-ConnectionGUID: 3OxGtj2IQ/SiwvhKCfKYtQ==
X-CSE-MsgGUID: aLtVty60RLS/vi0Pt+bCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76413789"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="76413789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:41:22 -0800
X-CSE-ConnectionGUID: m/TXxdt+TW6B76e9kpB+/Q==
X-CSE-MsgGUID: 08yf9o4mTcyWdPyIw0hGlg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.161])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:41:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 20 Nov 2025 18:41:14 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Denis Benato <benato.denis96@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
In-Reply-To: <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
Message-ID: <04075ef3-3fba-c308-871f-619972ffe5ff@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev> <20251120094617.11672-5-lkml@antheas.dev> <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com> <CAGwozwF6wegwHy=W1zaTEVksQYaw4L7V27w2aaZBMMoDjUjRYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Nov 2025, Antheas Kapenekakis wrote:

> On Thu, 20 Nov 2025 at 15:15, Denis Benato <benato.denis96@gmail.com> wrote:
> >
> >
> > On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > > Handshaking with an Asus device involves sending it a feature report
> > > with the string "ASUS Tech.Inc." and then reading it back to verify the
> > > handshake was successful, under the feature ID the interaction will
> > > take place.
> > >
> > > Currently, the driver only does the first part. Add the readback to
> > > verify the handshake was successful. As this could cause breakages,
> > > allow the verification to fail with a dmesg error until we verify
> > > all devices work with it (they seem to).
> > >
> > > Since the response is more than 16 bytes, increase the buffer size
> > > to 64 as well to avoid overflow errors.
> > >
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
> > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > index 6de402d215d0..5149dc7edfc5 100644
> > > --- a/drivers/hid/hid-asus.c
> > > +++ b/drivers/hid/hid-asus.c
> > > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> > >  #define FEATURE_REPORT_ID 0x0d
> > >  #define INPUT_REPORT_ID 0x5d
> > >  #define FEATURE_KBD_REPORT_ID 0x5a
> > > -#define FEATURE_KBD_REPORT_SIZE 16
> > > +#define FEATURE_KBD_REPORT_SIZE 64
> > >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > >
> > > @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
> > >
> > >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> > >  {
> > > +     /*
> > > +      * The handshake is first sent as a set_report, then retrieved
> > > +      * from a get_report. They should be equal.
> > > +      */
> > >       const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> > >                    0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > > +     u8 *readbuf;
> > >       int ret;
> > >
> > >       ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> > > -     if (ret < 0)
> > > -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> > > +     if (ret < 0) {
> > > +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > I see my suggestion to use __free here didn't materialize in code using
> > it even after Ilpo kindly wrote how to correctly use it.
> >
> > I think you can move the readbuf assignment right below buf and
> > take into account what Ilpo said.
> >
> > I don't expect new variables will be added here ever again,

It's also about always doing the right thing so others will pick up the 
pattern (for the cases when it's needed).

> > but I agree with Ilpo that it's a good idea here to write code
> > accounting for that possibility.
> >
> > It is my understanding that who proposes patches is expected to
> > resolve discussions when changes are proposed or to take into
> > account requested changes and submit a modified version.
> 
> It was ambiguous. I interpreted Ilpo's email as a dismissal

I tried to explain how to use it, not to suggest cleanup.h shouldn't be 
used.

> I will try to incorporate it if I do another revision. Although I do
> not think it improves things in this case as the function does not
> have multiple return statements.
> 
> > > +     if (!readbuf)
> > > +             return -ENOMEM;
> > > +
> > > +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > > +                              HID_REQ_GET_REPORT);
> > > +     if (ret < 0) {
> > > +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > > +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > > +             hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> > > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > > +             /*
> > > +              * Do not return error if handshake is wrong until this is
> > > +              * verified to work for all devices.
> > > +              */
> > > +     }
> > >
> > > +     kfree(readbuf);
> > >       return ret;
> > >  }
> > >
> >
> 

-- 
 i.


