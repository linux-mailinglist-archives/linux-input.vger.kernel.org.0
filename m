Return-Path: <linux-input+bounces-11137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49480A6DA0B
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 13:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D5AE7A6388
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 12:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BDD25E81F;
	Mon, 24 Mar 2025 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="TN1DZnKM"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAF62F2E;
	Mon, 24 Mar 2025 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742819134; cv=none; b=kwtLy3fP65LJeRZ40PJ6Ys2WeU4STUtppaV1wNMU0K2cw42Tk0bKc9/J5PC030ik4V9qhep8g/3LWTLoujAADFpJ6tlReVAcxHALx4W2jBpQS7ZH3xelZ7d3NcTMRlBuaKQotnLxgCtP+hKItw64rpbvvq8hDD0efouRJgn2cQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742819134; c=relaxed/simple;
	bh=ghwWl9UC0dtimsqvv0x69/VNngLv7f4b15pFm1XCb7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qp3wv38ikQem2um3rHWdCZjpIEn6Td5hEoKQRJrqRaWpskqTNqY8P839fmQigqszkHNBdKMteGgZ6S9K6x/HP2hHeSzOMZB+sjjzqw9xJjVeg9AoFmCmUoaEi0vva1+VxED7ki6qMyLhGK6yT51noHlQxzXV7SPNE4cibVsJJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=TN1DZnKM; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 017E42E093D3;
	Mon, 24 Mar 2025 14:25:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742819127;
	bh=ghwWl9UC0dtimsqvv0x69/VNngLv7f4b15pFm1XCb7g=;
	h=Received:From:Subject:To;
	b=TN1DZnKM3bKQCDU3166AKEUDrl8bVRnS8TbbrWkJTQAPJWQGeBYNZzwM0YhOnpbtp
	 W150JFT+LM/W3EMVOQlKmUkn2h+LU1hLVM4uY4G2lOsUSAdFr2KOT2+Fo1J1tJpMzc
	 GF+S9D/021cISkZdulNcjHUa/FrNsQrUTB6FrW/k=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30c091b54aaso43882581fa.3;
        Mon, 24 Mar 2025 05:25:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJqaL8GngTXW2g1bcm6y+h03yJBBFPxRKevKLzmmSWiBzuYcgvBgvkyDRVt4OGmbJTxl8M5aKPlePFxA==@vger.kernel.org,
 AJvYcCWIyVDSnmfy7gW9lgi3xvGMLy2yuAAXM9yMTbxhSCyAGRvucok1NxrVvN3vW/NPiTev8cR+Iz2VE28woPCs@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/VVJZ5flNoooPKRGLyk2slTeZOS+kzBxPLZt6BwNWKfH2EKU
	ac4NGSS1HeMCBl8BDu2u3/YPVFWUvWz/9brNHGWSKNSmpmvREDzznIzEQ6x9e8g3//u/+HLP6/g
	GRzvx+5NHGWFy2by89gl9d4atBls=
X-Google-Smtp-Source: 
 AGHT+IFuh2UJDgIPN/kxydBvvKvYCAKXDByVcdnfHuxLh8o0wXpz12Yl3Kqnqb4Zff18Ab2edC1l299dikahggp/9r8=
X-Received: by 2002:a2e:b98f:0:b0:30c:2da3:1493 with SMTP id
 38308e7fff4ca-30d7e234c7amr38687181fa.19.1742819126150; Mon, 24 Mar 2025
 05:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319191320.10092-1-lkml@antheas.dev>
 <dac78c3d-9ba2-4721-9fb2-06dd2589bc72@redhat.com>
In-Reply-To: <dac78c3d-9ba2-4721-9fb2-06dd2589bc72@redhat.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 24 Mar 2025 13:25:14 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGcJW0KarrbotFoYfLCikkaatzMTT_GzZPA7zoeTzofNg@mail.gmail.com>
X-Gm-Features: AQ5f1JpOQBVi7LYT094UKaFTy2VYsQ-qJt18CC7O8MEaw-EKM8gf4dx8vzN_zL4
Message-ID: 
 <CAGwozwGcJW0KarrbotFoYfLCikkaatzMTT_GzZPA7zoeTzofNg@mail.gmail.com>
Subject: Re: [PATCH 00/11] HID: asus: hid-asus and asus-wmi backlight
 unification, Z13 QOL improvements
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174281912743.8530.15307629672798636061@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 24 Mar 2025 at 13:10, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Antheas,
>
> On 19-Mar-25 20:13, Antheas Kapenekakis wrote:
> > This is a three part series that does the following: first, it cleans up
> > the hid-asus driver initialization, preventing excess renames and dmesg
> > errors on ROG devices. Then, it adds support for the Z13 2025 keyboard,
> > by fixing its keyboard to not be stuck in BIOS mode and enabling its fan
> > key. Finally, the bigger piece of this series is the unification of the
> > backlight controls between hid-asus and asus-wmi.
>
> Thank you for your work on this.
>
> > This requires some context. First, some ROG devices expose both WMI and
> > HID controls for RGB. In addition, some ROG devices (such as the Z13)
> > have two AURA devices where both have backlight controls (lightbar and
> > keyboard). Under Windows, Armoury Crate exposes a single brightness control
> > for all Aura devices.
> >
> > However, currently in the linux kernel this is not the case, with asus-wmi
> > and hid-asus relying on a quirk system to figure out which should control
> > the backlight. But what about the other one? There might be silent
> > regressions such as part of the RGB of the device not responding properly.
> >
> > In the Z13, this is the case, with a race condition causing the lightbar
> > to control the asus::kbd_backlight device most of the time, with the
> > keyboard being renamed to asus::kbd_backlight_1 and not doing anything
> > under KDE controls.
> >
> > Here, we should note that most backlight handlers are hardcoded to check
> > for backlight once, and for one backlight, during boot, so any other
> > solution would require a large rewrite of userspace.
>
> Note that work is actually ongoing to add support for multiple kbd
> backlights to upower:
>
> https://gitlab.freedesktop.org/upower/upower/-/merge_requests/258
>
> But that is intended for when there are 2 kbds with a controllable backlight,
> e.g. a docked laptop with a gaming kbd with RGB backlight connected to the dock.
>
> Where as here we seem to have 2 controls which ideally should be set to
> the same value if I understand things correctly ?

Yes, there can be a HID device and a WMI device or multiple HID
devices, and currently the driver is quirked to either select HID or
WMI based on laptop model. There is also a deviation between how WMI
is handled and how HID is handled. This way we unify all of it.

In addition, on the Z13, we have a lightbar and a keyboard backlight
(both HID/separate USB devices). And the keyboard is removable. On the
Ally, we have a backlight but the controller disappears before sleep
because WIndows does not support selective suspend for xinput. By
placing the handler on WMI we ensure it is always active and the state
does not get lost.

> > Even when brightness controls are fixed, we still have the problem of the
> > backlight key being on/off when controlled by KDE and 0/33/66/100 when
> > the device has a WMI keyboard. Ideally, we would like the 0/33/66/100 to
> > be done under hid as well, regardless of whether the backlight of the
> > device is controlled by WMI or HID.
>
> Hmm, ideally we want this sort of policy to be in userspace, this sounds
> more like it is a keycode problem and we maybe need KEY_KBDILLUMCYCLE next
> to the existing KEY_KBDILLUMTOGGLE. For the existing toggle doing on/off
> obviously is the correct userspace behavior.
>
> Anyways I can see how Asus is special here and on laptops the cycling is
> typically handled by the EC and we have chosen to emulate EC behavior in
> the kernel before to keep things consistent amongst models.
>
> Still generally speaking we do prefer to just send keypresses when possible
> and let userspace set the policy, but I guess we can make an exception here.

Yeah I agree with this, but now the WMI driver sets a bit of a precedent.

> > Therefore, this is what the third part of this series does. It sets up
> > asus-wmi to expose accepting listeners for the asus::kbd_backlight device
> > and being the one that sets it up. Then, it makes hid-asus devices
> > register a listener there, so that all of them are controlled by
> > asus::kbd_backlight. Finally, it adds an event handler for keyboard keys,
> > so that HID led controls are handled by the kernel instead of userspace.
> > This way, even when userspace is not active the key works, and we get the
> > desired behavior of 0/33/66/100 across all Aura devices (currently, that
> > is keyboards, and embedded devices such as lightbars). This results
> > removing the quirk system as well, eliminating a point of failure.
>
> I've taken a quick look at the new API between asus-wmi and asus-hid and
> this looks good to me, thank you for your work on this.
>
> Regards,
>
> Hans
>
>

