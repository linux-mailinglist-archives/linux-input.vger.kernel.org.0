Return-Path: <linux-input+bounces-15437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C3BD6593
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 23:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D6684E40DB
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 21:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F40E2E2840;
	Mon, 13 Oct 2025 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uhb/PVRu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8896C2DAFBF
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760390630; cv=none; b=q1RlfugUGBt4M+LISgjoNnrh+f3nHl6oZxVtl2DC/vsBeJsWOIQpjTkAIbv4F3Bia6HT938D1iThCIXWZGGivyic03xY6+S6SiBIGwCWSgy7ejit+oD6utUmNp5IRsHdd0NnZvnnbl15aBxtZfpon0b9eLDme+vCi8r+gsv3dcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760390630; c=relaxed/simple;
	bh=duNs9ah0QIfYZnMoE4c3g4PqeEiDUi8Gil3hMc2JMpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2T+m7VFzMiTNiOrKYJvFOj1J4fN+DWuehHwDkKUS/vzX5HrPZIyWAszHoOvJqAY0sC7GmBTVPccQ+44AGOh8MpCpFQvbjdnY9Y0YInqFcFgLPMuIhMP0ZfmiKmQre/53Me2zUh1A1KxDA9gHWgYA/4X7ASGI5HdbjuL0gE4Oqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uhb/PVRu; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-856701dc22aso647894885a.3
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760390627; x=1760995427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUBN/NV8eUBSFlADc9GGH6T01rxriupsCOKRoU5449s=;
        b=Uhb/PVRu7II7d3egKjmOP3KNFemKWKWrA7p6f9tjyfQjRWQTEKT+aiz87pcrwr2ruX
         sAocVQsjyCZ4ooVzNE7kbDARQiIrnbJw2aebktgtpkCXuTD3mIYe1yZ5mQNREjP1zcgn
         3eU5D9PFQhGC3zCRylt03m0ln2u9XOxYBKmIHVTSJDCuUOcwAFbgiGkLyVykDhENBIQo
         /gwXhlIvPgXY5ixmZVlCHzEW5g3drqE7MxGlX78ORzy57bqDLvATBmvEWspSKnL50gcd
         3hGYHHLh8+b2j6WpVx98BcrW7aUOMA2HHUHaKVTM+JPNOVIuzsDkYo/+BDo1u+wGLIzc
         xTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760390627; x=1760995427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUBN/NV8eUBSFlADc9GGH6T01rxriupsCOKRoU5449s=;
        b=jiQli/1/nHpiFwDG9RI6wDzJktnAM2TRmS9aHhcsDvsvJM/ItljAEbZ3iz1g166qsE
         6CsSXYWqlJrBgtfyudDRoOGOO9KeWy/lDpZnv0rVMMz90pc48/Nu9eMe513kDRUz6glK
         E7mmniL/bQGjfQethXqbj+NcHhO3ZM0xY32DyGAxckKJEW8QrrR6vwXFneIqmsNtZ0tH
         hXKHyuWycuh6GVZbTT17tCW5WJFCNWuJiDcvC4CJo/sk2Q9abT+bIS7M3mYOnD+O7IWm
         zRQ1FRC6BEj09r+2k7uW4pxJjvNP2gbva6cG9et7WU0U/1dJ+N790/onRISyjwabsvSN
         sxSA==
X-Forwarded-Encrypted: i=1; AJvYcCUNsaj6fxesgwDzP5uc0IaC/TDvFipbbuFTl8TBczfMRAKFSowwlJc4YGBF203nrMlT3zKTEaxOrwcNPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDb1RoUs0bXkOzLwnumkIj5mwyQfUWzTmIDZFK2gomcj+2rao
	6t6MG/447a7f6bPXEogj+x6ynocg7PZgBouaPc3WmuDiZT9Zm7DyAz7Dq6OD11/F1qgnWGtinZ7
	OC95bqo3XfrYUlHJInSXEwNKPFGIt7mRai+pxEmOf
X-Gm-Gg: ASbGncvQsmZjwygqJbHR+m2dCpUH1rPGG0ICB96QTvZVTMG25U5Z9Tbhh5xUtfW8I0y
	WgA+RaigKua3y1oidK2ak7wngM4Wr6PMKxjeyev+NKAo70Gh8g9nJHmKQMlAfkGA19stcvkdL2v
	HhZrCuDlWN/yeegmAzWT9+1gHnrDWRyfL+5bUEewRpoNCogWbBGYPluOSLzXK3r5kxrlXxkAzdB
	i3bNEwBx0hu6SlpAXaAYTeqif6f3TrIUoRW+bUnztjz08G48VOdD2kfsvQ6JY7MB8eDVnalWSsz
X-Google-Smtp-Source: AGHT+IFolxHwYRoYh3VsyBtnodAQxfFX+fi+E8GwadH+OPvuJtYKirCV6REwEdyoqvutR8ea4/bvvVwdvW+R3UZepXw=
X-Received: by 2002:ac8:5914:0:b0:4e2:cb29:22c6 with SMTP id
 d75a77b69052e-4e6ead46a0bmr320723961cf.53.1760390627163; Mon, 13 Oct 2025
 14:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com> <aO1q4coXPqU/K6KI@visitorckw-System-Product-Name>
In-Reply-To: <aO1q4coXPqU/K6KI@visitorckw-System-Product-Name>
From: Jonathan Denose <jdenose@google.com>
Date: Mon, 13 Oct 2025 16:23:36 -0500
X-Gm-Features: AS18NWDCaUxMD8Lww_TRge0cIBg8WMrqW9vE0UwpfuTFg05OhVQ4csFebEAMkw8
Message-ID: <CAMCVhVNLr+2ivRo9T4rVt4mkncwbOfXEL9bE=pDGRp=Qjy1c9A@mail.gmail.com>
Subject: Re: [PATCH] HID: Kconfig: Fix build error from CONFIG_HID_HAPTIC
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Randy Dunlap <rdunlap@infradead.org>, 
	Lucas GISSOT <lucas.gissot.pro@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 4:11=E2=80=AFPM Kuan-Wei Chiu <visitorckw@gmail.com=
> wrote:
>
> On Mon, Oct 13, 2025 at 08:54:57PM +0000, Jonathan Denose wrote:
> > Temporarily change CONFIG_HID_HAPTIC to be bool instead of tristate, un=
til
> > we implement a permanent solution.
> >
> > ---
>
> The "---" line here will cause many tools used for applying patches,
> like git am, to discard the content below it [1].
>
> Please don't add this line unless you don't want the following content
> to appear in the commit message.
>
> [1]: https://www.kernel.org/doc/html/v6.17/process/submitting-patches.htm=
l#commentary
>
> Regards,
> Kuan-Wei

Yes, that was intentional, the information below the '---' was
included as additional information and not for the commit message. The
error messages were too long, as was the link to the longer
discussion, and this caused errors in checkpatch.pl.

> > Recently the CONFIG_HID_HAPTIC Kconfig option was reported as causing
> > the following build errors:
> >
> >   MODPOST Module.symvers
> > ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undef=
ined!
> > ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multito=
uch.ko] undefined!
> > ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multi=
touch.ko] undefined!
> > ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitou=
ch.ko] undefined!
> > ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.=
ko] undefined!
> > ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouc=
h.ko] undefined!
> > ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch=
.ko] undefined!
> > make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Mod=
ule.symvers] Error 1
> >
> > when the kernel is compiled with the following configuration:
> >
> > CONFIG_HID=3Dy
> > CONFIG_HID_MULTITOUCH=3Dm
> > CONFIG_HID_HAPTIC=3Dm
> >
> > To resolve this, temporarily change the CONFIG_HID_HAPTIC option to be
> > bool, until we arrive at a permanent solution to enable CONFIG_HID_HAPT=
IC
> > to be tristate.
> >
> > For a more detailed discussion, see [1].
> >
> > [1]: https://lore.kernel.org/linux-input/auypydfkhx2eg7vp764way4batdilz=
c35inqda3exwzs3tk3ff@oagat6g46zto/
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > ---
> >  drivers/hid/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index 5341aa79f387bd0e5a76266b5928d2c978dd81cf..04420a713be085c8871b4d3=
5255fde4cafd8de0f 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -93,7 +93,7 @@ config HID_GENERIC
> >       If unsure, say Y.
> >
> >  config HID_HAPTIC
> > -     tristate "Haptic touchpad support"
> > +     bool "Haptic touchpad support"
> >       default n
> >       help
> >       Support for touchpads with force sensors and haptic actuators ins=
tead of a
> >
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251013-hid-haptic-kconfig-fix-634df2bdac1d
> >
> > Best regards,
> > --
> > Jonathan Denose <jdenose@google.com>
> >
--=20
Jonathan

