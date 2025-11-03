Return-Path: <linux-input+bounces-15865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EDC2AA1D
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 09:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DB5A4E67DF
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 08:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59E82E1C4E;
	Mon,  3 Nov 2025 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="DyTHx82I"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C828EA72
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762159755; cv=none; b=Y1MnnCEsBSsx9huK4rwA61gyEP2Qplzfl7wYryFaURQZ0rwZwu/zC6vJE+sU5chNqXRlCnhOU9uvCsd3HvObJX2oTqyt0wN71T4tDr4HJ2JmOAcIMGKLHPcE2I6n5iJfrvylep7z63lu2BAli/bPtMBJ969LwqKSVLfn9B2j91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762159755; c=relaxed/simple;
	bh=rguDW9TkUi5DcopGxnOu792lBAmWXXAs3SETW7/cu4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0rYVglLO8kJ2goWi6BJFlQO943hlD96oQUHC06UPIOwhZRBcwTj0uBj+oJf23B3xnS8rnk809v1G0xLrGJfy2S5KaDjk65Mf2VBzKLizRApSwoJzoPYV/HNL8S5LubpvFr51o+zdT1/7aEG/rAwHQvztqYtlJhkuiziV9W8bkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=DyTHx82I; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 2E901C204F
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 10:49:11 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 6B91BC0E90
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 10:49:10 +0200 (EET)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7483F2007A1
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 10:49:09 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762159750;
	bh=EaG8JnjphNX4luEtPtA1VoSwXZKgoMoCI7OjaGygx9Y=;
	h=Received:From:Subject:To;
	b=DyTHx82Ilqobf8VtgT/1qZeEhyrLQerZSPjjaMsjR3f8Lk8StIskTcA3K+Op2qEOK
	 jiY0qbWsn3p9jioRpkB4j17x/LPMlFeJnuJ2Sp4p4jx+2nEP4J/Js6eMQr5RHuHXiB
	 uO49wODCQ+ech1rNhVasYSKE/p4PRQ5Z+sSpqRxT5hk1y4as1yMoST2pJvPFyHAp+0
	 KJJcfQqEdbanX6LB6oxIFBszbiw2wBTYS+HP5+Qj+8s8Fk64Jy5kvyEoq7Cm685Yzo
	 oC/Yw5kQE5sdMI6OpgUZylximOW8/gmWV3zedSOGdLfdeCQ843dH1yH/joDwzqSpst
	 raJ1iJlONYb9A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3737d0920e6so22658811fa.1
        for <linux-input@vger.kernel.org>;
 Mon, 03 Nov 2025 00:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU7jmov3iejgObKFqGhkfZUueAhjAOhhSV5gVauAPewGtcjKa/HNqDVdh8Pontg7xl7AfvpQNTH6NFpRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPAci8x1OEcow9sq0Z3mh3IHqnSkgu7Lf3iY3zDCE4Ddw1mWi
	fOJqXvxDqHdZN65c/YJAEyH436YnyIsGQjoZAPREVJ4VRtwSrSC1LBMRMcqGI5R0m/LSDdUzLwV
	KXNZLKdUo/W+9BKGCPPNvrapLjAsRkHk=
X-Google-Smtp-Source: 
 AGHT+IFQDA7YXOOW06Z+inVHv0m32shHF9zieKF3PIQIXT5PWW5RImYaygtu0lxnA3N0mtFSZEgJTZFzLIRzhylFB+Y=
X-Received: by 2002:a05:651c:54d:b0:378:ee95:cb0f with SMTP id
 38308e7fff4ca-37a1c2bdbc5mr28317101fa.47.1762159748751; Mon, 03 Nov 2025
 00:49:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
 <20251103042848.9302-1-derekjohn.clark@gmail.com>
 <CAGwozwHCnHwOVw08ZJ4LOFD8kDv+kevvF1-PkjBq2+VMBBx9TQ@mail.gmail.com>
 <52B61B78-4177-474B-9D40-471ED918C951@ljones.dev>
In-Reply-To: <52B61B78-4177-474B-9D40-471ED918C951@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 3 Nov 2025 09:48:57 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGJUPQLB2UrZubUj9Sd-MijM0ADepVwEaNo6MNRafD=Gg@mail.gmail.com>
X-Gm-Features: AWmQ_bmogYBFFZCWXKajL_rlNjaZ5PXJrPGI7hUS0R-zzWR-NCJhCMT3wLm0jic
Message-ID: 
 <CAGwozwGJUPQLB2UrZubUj9Sd-MijM0ADepVwEaNo6MNRafD=Gg@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
To: luke@ljones.dev
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>, kernel test robot <lkp@intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176215974998.981178.17573301901186058815@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 3 Nov 2025 at 09:38, <luke@ljones.dev> wrote:
>
>
> > On 3 Nov 2025, at 20:36, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > On Mon, 3 Nov 2025 at 05:29, Derek J. Clark <derekjohn.clark@gmail.com>=
 wrote:
> >>
> >>> On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
> >>>>
> >>>> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
> >>>>
> >>>>>>  1589
> >>>>>>  1590  static void kbd_led_update_all(struct work_struct *work)
> >>>>>>  1591  {
> >>>>>>  1592          enum led_brightness value;
> >>>>>>  1593          struct asus_wmi *asus;
> >>>>>>  1594          bool registered, notify;
> >>>>>>  1595          int ret;
> >>>>>                              /\ value should have been an int and
> >>>>> placed here. It can take the value -1 hence the check
> >>>>
> >>>> Thanks, that needs to be fixed before the final merge.
> >>>>
> >>>>> Are there any other comments on the series?
> >>>>>
> >>>>> The only issue I am aware of is that Denis identified a bug in asus=
d
> >>>>> (asusctl userspace program daemon) in certain Asus G14/G16 laptops
> >>>>> that cause laptop keys to become sticky, I have had users also repo=
rt
> >>>>> that bug in previous versions of the series. WIthout asusd running,
> >>>>> keyboards work fine incl. with brightness control (did not work
> >>>>> before). Given it will take two months for this to reach mainline, =
I
> >>>>> think it is a fair amount of time to address the bug.
> >>>>
> >>>> One thing that is not clear to me about this -- is this causing a vi=
sible
> >>>> user-space behavior regression before vs. after the patchset with as=
usctl?
> >>>>
> >>>> If so, I am afraid this needs to be root-caused and fixed before the=
 set
> >>>> can be considered for inclusion.
> >>
> >>> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices o=
n
> >>> ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
> >>> confuse asusd. Since the devices are the same as with hid-asus not
> >>> loaded, it is specific to that program.
> >>>
> >>>
> >> Hi Antheas.
> >>
> >> While you have previously expressed to me directly that you wish Input=
Plumber
> >> didn't exist, it still very much does, in fact, exist. I also know tha=
t you are
> >> explicitly aware that InputPlumber is a consumer of this interface, so=
 your
> >> comment that asusctl is the only affected program is something you kno=
w to be
> >> false. This is not even the first time you have renamed an input devic=
e that
> >> you knew InputPlumber was a consumer of without notifying me[1].
> >>
> >> I can't abide you outright lying to the maintainers here and I'm sick =
and tired
> >> of having to watch your every move on the LKML. Either become a good c=
itizen of
> >> kernel maintenance, or get out of it.
> >
> > Hi Derek,
> > I am not aware if your software is affected or not by this series as I
> > have not received reports about it.
> >
> > If it is, please add:
> > "ASUSTeK Computer Inc. N-KEY Device"
> >
> > As a name match to your software (should only take 5 minutes).
> >
> > I worked with Luke and Dennis on it for the better part of a year so
> > hopefully they forwarded to you if it affects you or not.
> >
> > Your software relies on OOT drivers for most devices incl. the Ally so
> > I am unsure if it is affected in reality. E.g., it would not be
> > affected in SteamOS and CachyOS. In the future, it would be good to
> > avoid name matches for your software as it makes it very fragile,
> > which is a discussion we have had before. I do not think device evdev
> > names constitute an ABI technically.
>
> Taking no sides here.
>
> An unfortunate reality is that there is stuff out there that does use nam=
e matches (and yes I agree they shouldn=E2=80=99t because it is *not* an AB=
I and many many devices have had name changes over the decades).
>
> While name strings aren't a formal ABI, when a change affects known downs=
tream users, a heads-up helps the ecosystem adapt smoothly=E2=80=94even if =
the technical stance is that they shouldn't rely on names.
>
> In general it also needs to be justified such as:
> - "Matches updated product branding"
> - "Current string is misleading (says 'mouse' but it's a keyboard)"
> - "Fixing spelling error"
> - "Aligning with USB-IF device class names"
>
> I always advocated use of evdev libraries to discover devices rather than=
 the shortcut of name matching as it is much more powerful and reliable (wh=
ich is how asusctl does dynamic add/remove of LED dev dbus interfaces). It=
=E2=80=99s much better to use evdev with vid/pid, device sub/classes, into =
descriptors and so on - you can be as open or restrictive as required by us=
e case. This particular issue illustrates why this approach is preferable.
>
> If the name change is a result of something I said or missed then I apolo=
gise to both Derek and yourself. Likely I missed it as I=E2=80=99ve never r=
elied on name strings for userspace.
>
> Regarding the OOT ally drivers I started, these will of course get upstre=
amed in the future (by Denis in this case when he can). They are getting ve=
ry heavily battled tested in the mean time. Please do contribute to them if=
 there is anything required to be addressed or chat to Denis, after all the=
y are made only to benefit all users (there is no *race to be first* here.
>
> As I no longer work on Asus laptops/handhelds and don't have hardware lef=
t to test with, I can't contribute further to this discussion. Best of luck=
 resolving this.
>
> I'm out.
> Luke.

Hi Luke,
good luck to your future endeavors.

The OOT reference was not to disparage the drivers, just to note that
in kernels that use those, hid-asus is stubbed for the Ally so there
is no change there.

As for reasons, see below.

> - "Matches updated product branding"

Reason for [1]

> - "Aligning with USB-IF device class names"

Reason for the change in this patch

If you would like me to stop cc'ing you in future asus changes let me
know. I am preparing some additional patches for the Duo class of
laptops.

Best,
Antheas

> >
> > Best,
> > Antheas
> >
> >> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on=
 ROG")
> >> Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>
> >>
> >> - Derek
> >>
> >> [1] https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/
> >>
> >>> We can delay that patch until Denis who took over maintenance of the
> >>> program can have a deeper look. I will still keep the last part of
> >>> that patch that skips the input check, because that causes errors in
> >>> devices that do not create an input device (e.g., lightbar).
> >>>
> >>> Antheas
>
>
>


