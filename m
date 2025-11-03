Return-Path: <linux-input+bounces-15863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846EC2A5A5
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 08:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 270C53A21BB
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 07:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970D02BDC25;
	Mon,  3 Nov 2025 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="HvVqxIdz"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46650232395
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155415; cv=none; b=fEGJcOEOpD35YhtYrd2WvdzRtTLSy1WA+xS2LTT5RGU90EMI+2/BsQOlsD/sUpz1P2fzPsJKTQqYatdnuielqbjKFVgrIxD8j3J9gVUdf7Uawx9CXeTwboqYgGgS3ZIV614cFk4vPXRblPPpEmJZ2K6AW8HzArIRxBHDXNsU+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155415; c=relaxed/simple;
	bh=OaRYJEMKiBNKo5VTIT7XMkJlfhT7ucKBBu2OtNNEmIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ss4A2rv/UhVtrtdUBAC7EeJF0WierjCgJUq+saDqpvcnqm68bE0nNM5FEOM6AJrobL9u2vJ0HQFJNXnGZV7aRdexVh7vOe2H61W/T5r3Kgu/O1JkV9K8ritHbaTF3evwBDCYI6eEwJjiPGxQsZUr7ajUppw1+yv05MXa0ruWOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=HvVqxIdz; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 73BCCBDCB0
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 09:36:50 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 9FC3BBDCC6
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 09:36:49 +0200 (EET)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C1F85201D10
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 09:36:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762155409;
	bh=lId5btvnlLv7AjRTb+KNTFWfyIMssZyD9eSSG/b09bE=;
	h=Received:From:Subject:To;
	b=HvVqxIdza/7qdq9+4pvPwmoPzQ2tQwmtKR/t4S4n1PxYwFKTTh6mSep0cGKj5+DPH
	 J+6jmgNaaxLkLxj5sjmHbcuUahOfTYwSlWJb4CC2KtWShjFMGacHpmHCwP9/ncL45o
	 m9Y72uzKNeE3LXo97j4NhCejnY7li8QyPnUMzafXsVCfH5On5RzaLvcXkgTVMCsepN
	 n+2jCt1nve5EE3+eQW7phoX163pjKVzjEEwIJhfiSrx7FbeiDGeP+XHv9JyIJ+0bun
	 pyXo5u8f7rj1N9cVJIn2LtaOhDX859Mc4E+PUdcbte9pzstjHnRuyHbvN+9K3zVh8Q
	 cmQ8+uBqoWd9g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-378ccb8f84aso43863761fa.3
        for <linux-input@vger.kernel.org>;
 Sun, 02 Nov 2025 23:36:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoqhHv34kZQKzAt+HAyUvWLFpl2nMv2suvY0t5F2N6f84ccCBUEfJHrpXYG4YSyJB8fw+/FbA8BoQsFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyknlnS2R/cTPpub3+xyO2oyZ5kpdkF6DF8HwxaSpmKnnqI2X8H
	9+gxrkhXacxoi6n2YSxtU706KMTSX7XuDRPHkawaIm+Ad0Zt6il72uCyhG0itOhlYSEdNoZG7Dx
	EZ+eEvXf85POf/dn+nHxzkNOl1vPhxo0=
X-Google-Smtp-Source: 
 AGHT+IEuVil72PPfbgUsFCufv9vPMhS5r0pukoVpH0LeLpj1BHDFWuuNRXSa/8h81m8xTd84Rd5gzgjQC+Zc51aMTy8=
X-Received: by 2002:a05:651c:118:b0:378:ebd7:ad0 with SMTP id
 38308e7fff4ca-37a18d9ba7amr29405611fa.17.1762155408150; Sun, 02 Nov 2025
 23:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
 <20251103042848.9302-1-derekjohn.clark@gmail.com>
In-Reply-To: <20251103042848.9302-1-derekjohn.clark@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 3 Nov 2025 08:36:36 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHCnHwOVw08ZJ4LOFD8kDv+kevvF1-PkjBq2+VMBBx9TQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkj4Xq9k2xN-diBUgPzwPA2ELNl1IQAb0hQMZ1JD3a1vz1JCGPu-UpaF2w
Message-ID: 
 <CAGwozwHCnHwOVw08ZJ4LOFD8kDv+kevvF1-PkjBq2+VMBBx9TQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>, kernel test robot <lkp@intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176215540918.644475.17178136805671118871@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 3 Nov 2025 at 05:29, Derek J. Clark <derekjohn.clark@gmail.com> wrote:
>
> >On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
> >>
> >> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
> >>
> >> > >   1589
> >> > >   1590  static void kbd_led_update_all(struct work_struct *work)
> >> > >   1591  {
> >> > >   1592          enum led_brightness value;
> >> > >   1593          struct asus_wmi *asus;
> >> > >   1594          bool registered, notify;
> >> > >   1595          int ret;
> >> >                               /\ value should have been an int and
> >> > placed here. It can take the value -1 hence the check
> >>
> >> Thanks, that needs to be fixed before the final merge.
> >>
> >> > Are there any other comments on the series?
> >> >
> >> > The only issue I am aware of is that Denis identified a bug in asusd
> >> > (asusctl userspace program daemon) in certain Asus G14/G16 laptops
> >> > that cause laptop keys to become sticky, I have had users also report
> >> > that bug in previous versions of the series. WIthout asusd running,
> >> > keyboards work fine incl. with brightness control (did not work
> >> > before). Given it will take two months for this to reach mainline, I
> >> > think it is a fair amount of time to address the bug.
> >>
> >> One thing that is not clear to me about this -- is this causing a visible
> >> user-space behavior regression before vs. after the patchset with asusctl?
> >>
> >> If so, I am afraid this needs to be root-caused and fixed before the set
> >> can be considered for inclusion.
>
> >Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on
> >ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
> >confuse asusd. Since the devices are the same as with hid-asus not
> >loaded, it is specific to that program.
> >
> >
> Hi Antheas.
>
> While you have previously expressed to me directly that you wish InputPlumber
> didn't exist, it still very much does, in fact, exist. I also know that you are
> explicitly aware that InputPlumber is a consumer of this interface, so your
> comment that asusctl is the only affected program is something you know to be
> false. This is not even the first time you have renamed an input device that
> you knew InputPlumber was a consumer of without notifying me[1].
>
> I can't abide you outright lying to the maintainers here and I'm sick and tired
> of having to watch your every move on the LKML. Either become a good citizen of
> kernel maintenance, or get out of it.

Hi Derek,
I am not aware if your software is affected or not by this series as I
have not received reports about it.

If it is, please add:
"ASUSTeK Computer Inc. N-KEY Device"

As a name match to your software (should only take 5 minutes).

I worked with Luke and Dennis on it for the better part of a year so
hopefully they forwarded to you if it affects you or not.

Your software relies on OOT drivers for most devices incl. the Ally so
I am unsure if it is affected in reality. E.g., it would not be
affected in SteamOS and CachyOS. In the future, it would be good to
avoid name matches for your software as it makes it very fragile,
which is a discussion we have had before. I do not think device evdev
names constitute an ABI technically.

Best,
Antheas

> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on ROG")
> Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>
>
> - Derek
>
> [1] https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/
>
> >We can delay that patch until Denis who took over maintenance of the
> >program can have a deeper look. I will still keep the last part of
> >that patch that skips the input check, because that causes errors in
> >devices that do not create an input device (e.g., lightbar).
> >
> >Antheas
>
>


