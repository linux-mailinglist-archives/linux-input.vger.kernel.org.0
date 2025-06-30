Return-Path: <linux-input+bounces-13201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F16AEDB3D
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 13:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708E63AA907
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103FB25C833;
	Mon, 30 Jun 2025 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzkwFL8w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78E25EF89;
	Mon, 30 Jun 2025 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283402; cv=none; b=jSLXpZqKtmi+CAdVtztAGMpOS2IWiNaiLI1L1jciYMjWXhqfNH0lFSQRXX4Opmr1+/tCiKhCDUWvAvNpu2uJq4NfyEviPresDTpB3FaY9hiUA55bTeWx/FBkN2MPX/kxf9z2pX7SFp+QgD0g9zNy/kbKtPPpoc81S6AN1q+tFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283402; c=relaxed/simple;
	bh=KGsAVlR6AlgnaseWmvAzZf7z3728oii+uockZUpwZiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2zT9eKv2IP2lyjhR1XjQUBYKH2TBzBoh9bBKwYxiSIjhQcIUqqvWMVr6amsHahzR49J7GNgLmhESidrQLYPCPITRsUxSuP6VVBZkG6vtbSqzYxK2pAzFsk1BlzgDJEW9DrCzb60iyz5MqoUQQTNXo/hT7xss56WRgeMbQDhY9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzkwFL8w; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b31befde0a0so1478093a12.0;
        Mon, 30 Jun 2025 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751283399; x=1751888199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBqfzpg1C2pMp/LbszmIa2cVhvekm5ujBojGU8otmG8=;
        b=OzkwFL8wNFXYXl7FxT9s4Ace6370i4N8iDBf0nHcnACaxf1mI0dx12XhVoguuttA82
         W0+tBNE16vhSjAD2EF9LZMxVO/eUG47vTJyPlbnIb4RRfH+9rAIU2N0e7pWyGxEql5q9
         uTKIZEVh+vBIl4WSuZHmP7cYiA9tSmwVRMKmyjEan19WavNHgzQnyFBZazjacaOYFiPW
         dRWqfmgFHSA276Z+GDueeVo5FRuzAgZlo8X+TgP4Ta1gJIJHzPfW0yBAx02iQdWdoa/u
         yd4VpxDormiwpPiVBy9JCUeTTH+YnVFVIbQsFXoysRHFDs63VuibwDJqhDDj/rQW9wOz
         ghBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751283399; x=1751888199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBqfzpg1C2pMp/LbszmIa2cVhvekm5ujBojGU8otmG8=;
        b=fbvaohZFrsVaer4Prr1+e8Qb8z8nQ04uPmxEiLobVCFDsiKZOoo7k2/+LbNqgCKprr
         DDrwweJyRz6g+Vj4fEhmnplQaYY5bBBEGuXfih0P1hf+Vlm0lp07nkNEi9bQGrqAatfs
         ToPhdcoQVdEX0xBq/b+MQlIBCKrwiYbtNw+yVKGECRpnksvKDPqF8U2KBfGz00dfVOan
         mPM4NiTVrtQECW8IABpuO0pysmOtkEMQJPT/bSbcZ2HJBsUXcj9+dQPki3cJN9LYyxds
         6vrbT9o9nNWl3CSy8N55E65zWH7GalWePqZ2gCcKhcxXPVta7EX5DC0vCm3geguZ9H/9
         9ckg==
X-Forwarded-Encrypted: i=1; AJvYcCUk/K12HT71L56yjILQquwxS28+p8cfaE8fJ/3plu5gCPCJDzE+tG0No8Wldjpqy7bzt7rnHuJZB8oNgI5xH0/+5OrWSw==@vger.kernel.org, AJvYcCWyFlQG7HjZSp1t/15EfAmsf07XIYsa5dEwfpPDtIDLofphZ+/1xR91u3OGFC7eH+kvS/oNBF6EfLTZT00w@vger.kernel.org, AJvYcCXQ/q/B6QyHqL4n8v65KwBHOFpIwwgZc+BHCkXL9Sv4jJUq0XGYwIW/z/hUlPqHzCzcgIeXIEnvSIjUvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyueYV6kQGmndln47tUztX+D6041UsTQsL5n2hwkDSPEkucFTKA
	a9eUgXgECS5h4lnCh4YQ84VkOHWnPgunw5zAR8hHn5+GbgztohXx1NhZfeqFwoTUvscxaZ1NX/n
	8cK6DOKu9xHQ37XYyVX/0xbPQsZRC/PU=
X-Gm-Gg: ASbGnctC5mjIK73n+L4xRWYdFjTOtUkIV6ZV5hkO056EcRws0ke9N4jcksyLgoCbI/p
	OF40slIOScFZx2x/AYalL/3RbtgTYNANfH+L4RnFN9sFxSmp8+oOcCLBjRXGVWFRS+3x3wlLm9i
	t02OLOjY68TXxWBdx/VDyHzZcIxoNqg3aWURnqcQh1jVKnD8ADHU4XbaS5Yx4pDkKbX5oSFGxtW
	/BHVw==
X-Google-Smtp-Source: AGHT+IHT1QanRw0SG2T4GyW6c2j8HJpX9VMAOEb92ivAi9s1+4lDE8SiqMYwhejw16+krR4CNzHVDv9J7eln53v0wLo=
X-Received: by 2002:a17:90b:2c83:b0:315:cc22:68d9 with SMTP id
 98e67ed59e1d1-318c927f2e4mr17945627a91.31.1751283399365; Mon, 30 Jun 2025
 04:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620004209.28250-1-vishnuocv@gmail.com> <c7eb2d82-a487-1baa-dd89-4276551974ec@linux.intel.com>
 <CABxCQKvt+vreQN1+BWr-XBu+pF81n5fh9Fa59UBsV_hLgpvh3A@mail.gmail.com>
 <4e846cf1-e7c7-3bb9-d8b3-d266b9dfbc4e@linux.intel.com> <CABxCQKt7SjMhX33WGOTk8hdZf1Hvkp8YYFWJK5v1xcbQQm14nQ@mail.gmail.com>
 <7ed97f5f-edb2-7f15-1d53-42b7b16a5ae6@linux.intel.com>
In-Reply-To: <7ed97f5f-edb2-7f15-1d53-42b7b16a5ae6@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 30 Jun 2025 20:36:01 +0900
X-Gm-Features: Ac12FXwTJ95mw7IU-AIogK8VMM4mq0SPmRExNfsuMUoY2Xn_PjPeYHZ7J1JgkH8
Message-ID: <CABxCQKvsv3K_gviYMNS2gUQMdd+Q1w_hzJ5irTk5m9pphdSm9g@mail.gmail.com>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: pali@kernel.org, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	hansg@kernel.org, tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
	jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com, 
	Mark Pearson <mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Sorry for the late reply.

On Fri, Jun 27, 2025 at 4:28=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 27 Jun 2025, Vishnu Sankar wrote:
>
> > Hi Ilpo,
> >
> > Thanks a lot for the review.
> >
> > On Fri, Jun 27, 2025 at 12:09=E2=80=AFAM Ilpo J=C3=A4rvinen <ilpo.jarvi=
nen@linux.intel.com> wrote:
> >       On Thu, 26 Jun 2025, Vishnu Sankar wrote:
> >
> >       > Hi Ilpo,
> >       >
> >       > Thanks a lot for the comments and guidance.
> >       > Please find my comments inline below.
> >       >
> >       > On Wed, Jun 25, 2025 at 9:07 PM Ilpo J=C3=A4rvinen <
> >       ilpo.jarvinen@linux.intel.com >
> >       > wrote:
> >       >       On Fri, 20 Jun 2025, Vishnu Sankar wrote:
> >       >
> >       >       I don't like the shortlog prefixes (in the subject), plea=
se don't
> >       make
> >       >       confusing prefixes up like that.
> >       >
> >       > Got it.
> >       > I will correct this in V2 (as a patch series).
> >       >
> >       >       > Newer ThinkPads have a doubletap feature that needs to =
be
> >       turned
> >       >       > ON/OFF via the trackpoint registers.
> >       >
> >       >       Don't leave lines short mid-paragraph. Either reflow the
> >       paragraph or add
> >       >       an empty line in between paragraphs.
> >       >
> >       > Acked.
> >       > Will correct this in V2.
> >       >
> >       >       > Systems released from 2023 have doubletap disabled by d=
efault
> >       and
> >       >       > need the feature enabling to be useful.
> >       >       >
> >       >       > This patch introduces support for exposing and controll=
ing the
> >       >       > trackpoint doubletap feature via a sysfs attribute.
> >       >       > /sys/devices/platform/thinkpad_acpi/tp_doubletap
> >       >       > This can be toggled by an "enable" or a "disable".
> >       >
> >       >       This too has too short lines.
> >       >
> >       > Sorry!
> >       > Will do the needful in v2.
> >       >
> >       >       >
> >       >       > With this implemented we can remove the masking of even=
ts, and
> >       rely on
> >       >
> >       >       "With this implemented" is way too vague wording.
> >       >
> >       > Sorry for this!
> >       > I will make this better.
> >       >
> >       >       > HW control instead, when the feature is disabled.
> >       >       >
> >       >       > Note - Early Thinkpads (pre 2015) used the same registe=
r for
> >       hysteris
> >       >
> >       >       hysteresis ?
> >       >
> >       > Sorry for not being clear.
> >       > It's the trackpoint drag hysteris functionality. Pre-2015 Think=
Pads
> >       used to have a
> >       > user-configurable drag hysterisis register (0x58).
> >       > Drag hysterisis is not user configurable now.
> >       >
> >       >       > control, Check the FW IDs to make sure these are not af=
fected.
> >       >
> >       >       This Note feels very much disconnected from the rest. Sho=
uld be
> >       properly
> >       >       described and perhaps in own patch (I don't know)?
> >       >
> >       > my bad, it's not FW ID, but PnP ID.
> >       > The older ThinkPad's trackpoint controllers use the same regist=
er
> >       (0x58) to control
> >       > the drag hysteresis, which is obsolete now.
> >       > Now (on newer systems from 2023) the same register (0x58) is re=
mapped
> >       as
> >       > doubletap register.
> >       > Just to exclude those older systems (with drag hysterisis contr=
ol), we
> >       check the PnP
> >       > ID's.
> >       >
> >       > I will give a better commit message in V2.
> >       >
> >       >       > trackpoint.h is moved to linux/input/.
> >       >
> >       >       This patch doesn't look minimal and seems to be combining=
 many
> >       changes
> >       >       into one. Please make a patch series out of changes that =
can be
> >       separated
> >       >       instead of putting all together.
> >       >
> >       > Understood.
> >       > Will make a patch series on V2
> >       > 0001: Move trackpoint.h to include/linux/input
> >       > 0002: Add new doubletap set/status/capable logics to trackpoint=
.c
> >       > 0003: Add new trackpoint api's and trackpoint sysfs in thinkpad=
_acpi.c
> >
> >       Okay, sounds better.
> >
> >       >       > +/* List of known incapable device PNP IDs */
> >       >       > +static const char * const dt_incompatible_devices[] =
=3D {
> >       >       > +     "LEN0304",
> >       >       > +     "LEN0306",
> >       >       > +     "LEN0317",
> >       >       > +     "LEN031A",
> >       >       > +     "LEN031B",
> >       >       > +     "LEN031C",
> >       >       > +     "LEN031D",
> >       >       > +};
> >       >       > +
> >       >       > +/*
> >       >       > + * checks if it=E2=80=99s a doubletap capable device
> >       >       > + * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
>
> There's case difference between this comment and the list.
Thank you for pointing this out.
Will correct this.
>
> >       >       > + */
> >       >       > +bool is_trackpoint_dt_capable(const char *pnp_id)
> >       >       > +{
> >       >       > +     char id[16];
> >       >       > +
> >       >       > +     /* Make sure string starts with "PNP: " */
> >       >       > +     if (strncmp(pnp_id, "PNP: LEN03", 10) !=3D 0)
> >       >
> >       >       We seem to have strstarts().
> >       >
> >       > Thanks a lot for the suggestion.
> >       > Will make use of this.
> >       >
> >       >       > +             return false;
> >       >       > +
> >       >       > +     /* Extract the first word after "PNP: " */
> >       >       > +     if (sscanf(pnp_id + 5, "%15s", id) !=3D 1)
> >       >       > +             return false;
> >       >       > +
> >       >       > +     /* Check if it's blacklisted */
> >       >       > +     for (size_t i =3D 0; i <
> >       ARRAY_SIZE(dt_incompatible_devices); ++i)
> >       >       {
> >       >       > +             if (strcmp(pnp_id, dt_incompatible_device=
s[i]) =3D=3D
> >       0)
> >       >
> >       >       Isn't this buggy wrt. the PNP: prefix??
> >       >
> >       >       Perhaps it would have been better to just do pnp_id +=3D =
5 before
> >       sscanf()
> >       >       as you don't care about the prefix after that.
> >       >
> >       >
> >       > Understood.
> >       > Shall we have something like the following:
> >       >         if (!strstarts(pnp_id, "PNP: LEN03"))
> >       >               return false;
> >       >
> >       >         id =3D pnp_id + 5;
> >       >
> >       >         for (size_t i =3D 0; i < ARRAY_SIZE(dt_incompatible_dev=
ices);
> >       ++i) {
> >       >                        if (strncmp(id, dt_incompatible_devices[=
i],
> >       > strlen(dt_incompatible_devices[i])) =3D=3D 0)
> >
> >       Why did you change to strncmp()?
> >
> > I switched to strncmp() to allow matching just the known prefix part in
> > dt_incompatible_devices, rather than requiring an exact full string mat=
ch.
> > Will keep the original "if (strcmp(id, dt_incompatible_devices[i]) =3D=
=3D 0) " logic as
> > it serves the purpose.
>
> I didn't mean to say the change is necessarily incorrect, I was just
> asking for reasonale as it was different from the original.
Understood.
>
> If you think you it needs to be broader to the match to a prefix only,
> I've no problem with that.
Understood. Will keep the original as it is, without changes.
>
> --
>  i.



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

