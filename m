Return-Path: <linux-input+bounces-15623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B3BF2A7E
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 19:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BF114264AA
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 17:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8E5332905;
	Mon, 20 Oct 2025 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9zR1c8T"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665B3321C0;
	Mon, 20 Oct 2025 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980430; cv=none; b=Gqpcw4Qse4yjEfwnQBNlvQxqT+cMelgHxqyFEPPUK/ftjtZy8G19Ecrtf9R9d3S3Zwd8/wKMytx474DgCxwPU6CHTgG14AvMYuV3uzVk4mjo4Iho4X+7frFh3V4teGPsiprbEDdJxZTP1u/nvjL5ZheMXla9w28WqEaaFNLu6ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980430; c=relaxed/simple;
	bh=MWv04xSJYsa76DaBRhw3qx15wxPMPwpfCH6q31svkR8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iQaz10DjaAZHj/0L2tzf6WuYYt1oYXhLXXg9L8qH3Xp5QpvRjMK9oqC1m9GtMGMIyC+uIbdnt4HuXy85f7i6jrtR0U/dUu4tZy+DNY9H5LzwOzzdhLDbnVMbl289IFaEZd1TD/LjEZIM1TZeXzJcD0WgkSNXM4v3LcjpL4KlhxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9zR1c8T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760980428; x=1792516428;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MWv04xSJYsa76DaBRhw3qx15wxPMPwpfCH6q31svkR8=;
  b=K9zR1c8TTOpWp/3rx1yd5y/odVhe1aSrxo8/Yk3N41cZ7fJuc1KTEEUs
   QMdLsAmuliTAx3mIgki8LTgqY/88CXw9x9JjdnYwLMtEsNaa4odPCEUL7
   IcFqNdvULigkfwKoFvYvq16gIlosafEDrQsoR4zM3EyT6k28zjo+C8PQN
   QBVTN25jgm2Dx7TqE6ByRl3PeUNQDpMhY1uFtzgU+j5GZiCfo303R3yqx
   a697VEYTqFTLZfknppyuNRTu/OcIzToIRD001/kk6W20xUqpCBF+3RTf4
   +Dwy5Ch7T8ioYQZfnmnsgv/NsClUzoRj7pB+vCEHyUSMz1Eq6ELoD/TOU
   w==;
X-CSE-ConnectionGUID: 6STwdro6St+89pzX848rrQ==
X-CSE-MsgGUID: KST0aSWUSbeZI4IzNnrf9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63140093"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63140093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 10:13:48 -0700
X-CSE-ConnectionGUID: JClSjXbkTECJq2/+PRnRHg==
X-CSE-MsgGUID: WNJ1EUrsTO2tE5aozU+K1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="182565302"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.76])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 10:13:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 20 Oct 2025 20:13:40 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Denis Benato <benato.denis96@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight
 handling
In-Reply-To: <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
Message-ID: <9da9e311-ae0c-5f05-5041-c1de383b3f59@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com> <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com> <c075a9f4-8103-dbcc-a1e7-4eaec5e90597@linux.intel.com>
 <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com> <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1986902853-1760980420=:976"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1986902853-1760980420=:976
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Oct 2025, Antheas Kapenekakis wrote:
> On Thu, 16 Oct 2025 at 18:16, Antheas Kapenekakis <lkml@antheas.dev> wrot=
e:
> >
> > On Thu, 16 Oct 2025 at 17:09, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
> > > > On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.co=
m> wrote:
> > > > > On 10/13/25 22:15, Antheas Kapenekakis wrote:
> > > > > > This is a two part series which does the following:
> > > > > >   - Clean-up init sequence
> > > > > >   - Unify backlight handling to happen under asus-wmi so that a=
ll Aura
> > > > > >     devices have synced brightness controls and the backlight b=
utton works
> > > > > >     properly when it is on a USB laptop keyboard instead of one=
 w/ WMI.
> > > > > >
> > > > > > For more context, see cover letter of V1. Since V5, I removed s=
ome patches
> > > > > > to make this easier to merge.
> > > > > >
> > > > > > All comments with these patches had been addressed since V4.
> > > > > I have loaded this patchset for users of asus-linux project to tr=
y out.
> > > > >
> > > > > One of them opened a bug report about a kernel bug that happens
> > > > > consistently when closing the lid of his laptop [1].
> > > > >
> > > > > He also sent another piece of kernel log, but didn't specify anyt=
hing more
> > > > > about this [2].
> > > > >
> > > > > [1] https://pastebin.com/akZx1w10
> > > > > [2] https://pastebin.com/sKdczPgf
> > > >
> > > > Can you provide a link to the bug report? [2] seems unrelated.
> > > >
> > > > As for [1], it looks like a trace that stems from a sysfs write to
> > > > brightness stemming from userspace that follows the same chain it
> > > > would on a stock kernel and times out. Is it present on a stock
> > > > kernel?
> > > >
> > > > Ilpo should know more about this, could the spinlock be interfering=
?
> > >
> > > [1] certainly seems to do schedule() from do_kbd_led_set() so it's no=
t
> > > possible to use spinlock there.
> > >
> > > So we're back to what requires the spinlock? And what the spinlock
> > > protects?
> >
> > For that invocation, since it is coming from the cdev device owned by
> > asus_wmi, it protects asus_ref.listeners under do_kbd_led_set.
> > asus_wmi is protected by the fact it is owned by that device. Spinlock
> > is not required in this invocation due to not being an IRQ.
> >
> > Under asus_hid_event (second to last patch), which is called from an
> > IRQ, a spinlock is required for protecting both listeners and the
> > asus_ref.asus, and I suspect that scheduling from an IRQ is not
> > allowed either. Is that correct?
>=20
> So it is a bit tricky here. When the IRQ fires, it needs to know
> whether asus-wmi will handle the keyboard brightness event so that it
> falls back to emitting it.
>=20
> If we want it to know for sure, it needs to access asus_wmi, so it
> needs a spinlock or an IRQ friendly lock. This way, currently,
> asus_hid_event will return -EBUSY if there is no led device so the
> event propagates through hid.
>
> If we say that it is good enough to know that it was compiled with
> IS_REACHABLE(CONFIG_ASUS_WMI), ie the actual implementation of
> asus_hid_event in asus-wmi will never return an error, then,
> asus_hid_event can schedule a task to fire the event without a lock,
> and that task can use a normal locking primitive.
>=20
> If the task needs to be assigned to a device or have a handle,
> asus_hid_listener can be provided to asus_hid_event, so that it is
> owned by the calling device.
>=20
> What would the appropriate locking primitive be in this case?

If you can move the non-check content out of asus_hid_event(), then you=20
can nest mutex & spinlock for updating asus_ref. On reader side,=20
asus_hid_event() only takes the spinlock and the rest of the readers=20
(non-irq ones) can take just the mutex.


--=20
 i.

--8323328-1986902853-1760980420=:976--

