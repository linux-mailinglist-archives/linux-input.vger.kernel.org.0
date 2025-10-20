Return-Path: <linux-input+bounces-15624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAEEBF30C6
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 20:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BA1A334A86D
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 18:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8492D5932;
	Mon, 20 Oct 2025 18:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="O5VyrDQN"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0274B25A65B
	for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986487; cv=none; b=cN4ZlC9dQfGlkrkHsvUY/x/7gttoBWYC9w9943xtBVlySGfsf1vM167XULhBVrDyZlU70MLoagIOwmnr3axry2fR3nA7JKVhKpNcXupkA2PBWCEhudl1VZVnmJ2WKBxk9UYKYj0lAA5bN3Ftwg/y+bG7JF4+LLNELMvd8GvT1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986487; c=relaxed/simple;
	bh=6/FA/Ts7bzROTzd21q/hHMfJ3cCpy/frzCZ7P0HCPJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VM0Rpb2AmF7DiACPvP2dc/mDQ8ffYxEXg0DNSYVevvtAgAerpN28O4W7TeucDYB8MIs+WGmZPpyyMUbhxCzm/5qJbYdfayLl2NkHqZOy8xTqe4ag8UiE/DCRiDF1YjwYG7Ppb+zHJpWZq5sfjreYHdZJryYSVHy1UdHMbPKtdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=O5VyrDQN; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 2891C46335
	for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 21:54:36 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 2613D4632C
	for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 21:54:35 +0300 (EEST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 34E9220075D
	for <linux-input@vger.kernel.org>; Mon, 20 Oct 2025 21:54:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760986474;
	bh=pWRrW3+XACXUHoLJSduGMYM7akuFZp0FMMqXm2M2xaU=;
	h=Received:From:Subject:To;
	b=O5VyrDQNxc0d6X4CaNn334Q9gP3n/W2kSkyVGLyGfJkLY1JUuEiaApMONX4pIbLbr
	 S2HFW0Kp7FpMEetuPDgWSfCLBxu49YqzjefzvI7OUVJtyCiQ1tAUbd7UUhpPv3XIsY
	 Cs/o1zoNtUE5/yxCw63zVvgmimv0XrIzUHAWU4LLz1J7aGf8ySWPy8WvjXVvd1hXqd
	 337Sm2RYVdTwMDtxgvBJyOQxslVPGepauGyCVu4TIU7wB1zZREcx0BZsUDYebRstJo
	 lAxGMl+uAw5wxXe+YQASXZgtQoBYD8/dbsid1DhDfrqRD5Q5ZLAsrpOKBGOw5EGRR5
	 L/dZz7eLNOrTA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-37775ed97daso57239361fa.0
        for <linux-input@vger.kernel.org>;
 Mon, 20 Oct 2025 11:54:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGftNlsPAUwT50X7YOi6Z1scRhGEIx/2pdZe6ow0bhtGUlh3Y4I1d2KMl7O6LytBYMsSB2GmJ8WGfV+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5WczW8ob1SRGxEpX5KwvQ0gMkJ8a2mcd3uAkfAUbqVxuAKs45
	HCl3DCv0PZP/dfjndIiVyuJwMf+Tcg8GJWXps5LfLUQONrCNdrZEI47DfSnkeeoHZXXyDzty6ZC
	FvSu2Udhxo7V0bF9X7QDspv5qAhDjIVI=
X-Google-Smtp-Source: 
 AGHT+IECZStzqXoxazIuauwJvtLAByMm+Y6SmrgGUy4+Q5LSugM+aY4Lw2cJZqb0CqMTNWzcLnJjlE/QJ0Na79V0Mig=
X-Received: by 2002:a05:651c:887:b0:376:45a3:27c9 with SMTP id
 38308e7fff4ca-377977b998bmr38933161fa.10.1760986473534; Mon, 20 Oct 2025
 11:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com>
 <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
 <c075a9f4-8103-dbcc-a1e7-4eaec5e90597@linux.intel.com>
 <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com>
 <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
 <9da9e311-ae0c-5f05-5041-c1de383b3f59@linux.intel.com>
In-Reply-To: <9da9e311-ae0c-5f05-5041-c1de383b3f59@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 20 Oct 2025 20:54:22 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEvQ69yCa3dXk7BOUaB_-XmpKcBdK-xjNYq_5hMGDmvrQ@mail.gmail.com>
X-Gm-Features: AS18NWCOURJv50ZYo1unk_NDsxVVeDBjvpsL3L564muSDZt5mRNskPN7msUgTcc
Message-ID: 
 <CAGwozwEvQ69yCa3dXk7BOUaB_-XmpKcBdK-xjNYq_5hMGDmvrQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <benato.denis96@gmail.com>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176098647456.1186071.4600306412425680374@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 20 Oct 2025 at 19:13, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 17 Oct 2025, Antheas Kapenekakis wrote:
> > On Thu, 16 Oct 2025 at 18:16, Antheas Kapenekakis <lkml@antheas.dev> wr=
ote:
> > >
> > > On Thu, 16 Oct 2025 at 17:09, Ilpo J=C3=A4rvinen
> > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > >
> > > > On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
> > > > > On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.=
com> wrote:
> > > > > > On 10/13/25 22:15, Antheas Kapenekakis wrote:
> > > > > > > This is a two part series which does the following:
> > > > > > >   - Clean-up init sequence
> > > > > > >   - Unify backlight handling to happen under asus-wmi so that=
 all Aura
> > > > > > >     devices have synced brightness controls and the backlight=
 button works
> > > > > > >     properly when it is on a USB laptop keyboard instead of o=
ne w/ WMI.
> > > > > > >
> > > > > > > For more context, see cover letter of V1. Since V5, I removed=
 some patches
> > > > > > > to make this easier to merge.
> > > > > > >
> > > > > > > All comments with these patches had been addressed since V4.
> > > > > > I have loaded this patchset for users of asus-linux project to =
try out.
> > > > > >
> > > > > > One of them opened a bug report about a kernel bug that happens
> > > > > > consistently when closing the lid of his laptop [1].
> > > > > >
> > > > > > He also sent another piece of kernel log, but didn't specify an=
ything more
> > > > > > about this [2].
> > > > > >
> > > > > > [1] https://pastebin.com/akZx1w10
> > > > > > [2] https://pastebin.com/sKdczPgf
> > > > >
> > > > > Can you provide a link to the bug report? [2] seems unrelated.
> > > > >
> > > > > As for [1], it looks like a trace that stems from a sysfs write t=
o
> > > > > brightness stemming from userspace that follows the same chain it
> > > > > would on a stock kernel and times out. Is it present on a stock
> > > > > kernel?
> > > > >
> > > > > Ilpo should know more about this, could the spinlock be interferi=
ng?
> > > >
> > > > [1] certainly seems to do schedule() from do_kbd_led_set() so it's =
not
> > > > possible to use spinlock there.
> > > >
> > > > So we're back to what requires the spinlock? And what the spinlock
> > > > protects?
> > >
> > > For that invocation, since it is coming from the cdev device owned by
> > > asus_wmi, it protects asus_ref.listeners under do_kbd_led_set.
> > > asus_wmi is protected by the fact it is owned by that device. Spinloc=
k
> > > is not required in this invocation due to not being an IRQ.
> > >
> > > Under asus_hid_event (second to last patch), which is called from an
> > > IRQ, a spinlock is required for protecting both listeners and the
> > > asus_ref.asus, and I suspect that scheduling from an IRQ is not
> > > allowed either. Is that correct?
> >
> > So it is a bit tricky here. When the IRQ fires, it needs to know
> > whether asus-wmi will handle the keyboard brightness event so that it
> > falls back to emitting it.
> >
> > If we want it to know for sure, it needs to access asus_wmi, so it
> > needs a spinlock or an IRQ friendly lock. This way, currently,
> > asus_hid_event will return -EBUSY if there is no led device so the
> > event propagates through hid.
> >
> > If we say that it is good enough to know that it was compiled with
> > IS_REACHABLE(CONFIG_ASUS_WMI), ie the actual implementation of
> > asus_hid_event in asus-wmi will never return an error, then,
> > asus_hid_event can schedule a task to fire the event without a lock,
> > and that task can use a normal locking primitive.
> >
> > If the task needs to be assigned to a device or have a handle,
> > asus_hid_listener can be provided to asus_hid_event, so that it is
> > owned by the calling device.
> >
> > What would the appropriate locking primitive be in this case?
>
> If you can move the non-check content out of asus_hid_event(), then you
> can nest mutex & spinlock for updating asus_ref. On reader side,
> asus_hid_event() only takes the spinlock and the rest of the readers
> (non-irq ones) can take just the mutex.

I think I found a good compromise on the V7. I also found that in
kbd_get I was missing a lock for the brightness value which
complicated things further, as get was called when creating the led
device.

On V7 I use a workqueue to do the bulk of initialization and setting
brightness so I manage to limit the lock to asus, the led wk value and
a new notify value that does hw_changed

>
> --
>  i.


