Return-Path: <linux-input+bounces-15517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64CBE35C5
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 14:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 308C319C1090
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 12:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA76632BF4E;
	Thu, 16 Oct 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="dFYdVomu"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47512D46D6
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617709; cv=none; b=b+ltgZPe8F0UQcAxRkvWVNpjjvXxMtyjcMtVyxv/B3Woen/0V81MwxLMVOUFUMXJROlgX93wbZHjioRiBxVKRaoU/Xxx0xs/M3o/FR+ENwoKkkqNpCDFafogDM2H1H1fMYGx2/ZyYTPo21+3fdUMS2BRMvuVaI2fMJHHKD1qANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617709; c=relaxed/simple;
	bh=81lWZ6mYy0MgOCyItC6FqTjObhD3vIvXdIO5NNnMNEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VD3m341DjDeyzIWajwpmJ93dVrf/rzJ+JB1OyEep66uz9F0dVF655/SyM9OdSVxI7kKGc5LV4E/8RTcJTKnFCe8azPo55oYaZeA2lLrc+tPN+8prPoqn6w6sLgYZqvOfnBJ4hHNdjanASKjjuchAr7ELY9g47GUTnOsb7VAVOFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=dFYdVomu; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id DA6BDC7EFB
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 15:28:25 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id D495DC7EE4
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 15:28:24 +0300 (EEST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4720D1FEE35
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 15:28:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760617704;
	bh=izcuUsiglIFkfY1fDcw4kBwfuEBiw3xCPP4RTqn4tek=;
	h=Received:From:Subject:To;
	b=dFYdVomu1HsVfiU/gFEJSWwge4QL247urDvWGtqfNE/Xo8BZ+ioBcGSzcbwKQ62JU
	 6AZ9M8w5ZynvrosO5i2/D7/uqvf6VO1+r3yLcMimHNlslEYGkH9IC1tw04bw0nR357
	 fkp9OyDwFYyWFQpPKaf17yJJdjkNSurdXv3xbIx1NO3DuWeWezetRP+ax2wyHFCOEe
	 I1pXF/46ceqduMJoEiW+6q459mEWRBiyPXJoBaHbGZpuxZ8wbdjpbNIy8t0M1uGr+e
	 aKA6c278FqkvlLVap2h+cAbIRJn6Bs6T4oiSIWSi6nC77y3B98TyrhLo75qIaOOJbn
	 2EYpeKf/+y5yA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.51) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f51.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-57dfd0b6cd7so863913e87.0
        for <linux-input@vger.kernel.org>;
 Thu, 16 Oct 2025 05:28:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQAgZwXzz9G9GRDXUyWlDKCQk5dIb5DAsSG0B5+LEGGAAcNyint9GwkMymTo4Gx7dfJDEUAYoIf8UyvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ATB0EfZU4w497YzpQ09lbRIpEXQYlfo75LxiJSr2VigH/R4X
	ZkGI5phDAndcUQpJ1McLOetMKKSYziWYs2YwzZfZ+p7WBE5nLeOx2N8GCsVYj0YwX4SNQbJw7QW
	fIBq74n0F40vkP+DIBfBro/qUbEqXLGw=
X-Google-Smtp-Source: 
 AGHT+IEvoa3TOyjqGeN5FQJBL4etgFpgPZIu8g83zKyg/JgIqkHkvaNu9oVrnL2eNM7j9yh418qGlgNQz8PX9uspRBQ=
X-Received: by 2002:a05:651c:501:b0:337:e5fc:d2d with SMTP id
 38308e7fff4ca-37797a0fb97mr26381fa.24.1760617703703; Thu, 16 Oct 2025
 05:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com>
 <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
 <ce8cc332-54ec-4e12-aa7c-a6d5e2b4fa9d@gmail.com>
In-Reply-To: <ce8cc332-54ec-4e12-aa7c-a6d5e2b4fa9d@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 16 Oct 2025 14:28:12 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHrWxxE_vyswe39W=ui8N6ej4ZPFvuKVueyw4xLL8C4ZQ@mail.gmail.com>
X-Gm-Features: AS18NWBK5AFob6ufMe1ZI-OUA7mVrHdqUDcgo4w8SuAfJPBT17iJGVSpqQfTPKc
Message-ID: 
 <CAGwozwHrWxxE_vyswe39W=ui8N6ej4ZPFvuKVueyw4xLL8C4ZQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176061770450.3220597.10727196076357712242@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 16 Oct 2025 at 14:19, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 10/16/25 14:14, Antheas Kapenekakis wrote:
> > On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.com> wrote:
> >>
> >> On 10/13/25 22:15, Antheas Kapenekakis wrote:
> >>> This is a two part series which does the following:
> >>>   - Clean-up init sequence
> >>>   - Unify backlight handling to happen under asus-wmi so that all Aura
> >>>     devices have synced brightness controls and the backlight button works
> >>>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
> >>>
> >>> For more context, see cover letter of V1. Since V5, I removed some patches
> >>> to make this easier to merge.
> >>>
> >>> All comments with these patches had been addressed since V4.
> >> I have loaded this patchset for users of asus-linux project to try out.
> >>
> >> One of them opened a bug report about a kernel bug that happens
> >> consistently when closing the lid of his laptop [1].
> >>
> >> He also sent another piece of kernel log, but didn't specify anything more
> >> about this [2].
> >>
> >> [1] https://pastebin.com/akZx1w10
> >> [2] https://pastebin.com/sKdczPgf
> > Can you provide a link to the bug report? [2] seems unrelated.
> The log in [2] was posted without additional context in the same
> discord message as [1].

Link me the kernel sources. Is it linux-g14 in the AUR?

> I think I will tell the user to open a proper bug report because
> I do agree on the fact that it's looking unrelated.
> > As for [1], it looks like a trace that stems from a sysfs write to
> > brightness stemming from userspace that follows the same chain it
> > would on a stock kernel and times out. Is it present on a stock
> > kernel?
> I have asked more details to the user. The user is not online ATM
> so I will get to you with more details when I can.
> > Ilpo should know more about this, could the spinlock be interfering?
> > My testing on devices that have WMI led controls is a bit limited
> > unfortunately. However, most of our asus users have been happy with
> > this series for around half a year now.
> Unless they have looked to kernel logs they won't be able to tell
> since apparently there are no visible consequences.
> > Antheas
> >
> >>> ---
> >>> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> >>> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> >>> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> >>> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> >>> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
> >>>
> >>> Changes since V5:
> >>>   - It's been a long time
> >>>   - Remove addition of RGB as that had some comments I need to work on
> >>>   - Remove folio patch (already merged)
> >>>   - Remove legacy fix patch 11 from V4. There is a small chance that
> >>>     without this patch, some old NKEY keyboards might not respond to
> >>>     RGB commands according to Luke, but the kernel driver does not do
> >>>     RGB currently. The 0x5d init is done by Armoury crate software in
> >>>     Windows. If an issue is found, we can re-add it or just remove patches
> >>>     1/2 before merging. However, init could use the cleanup.
> >>>
> >>> Changes since V4:
> >>>   - Fix KConfig (reported by kernel robot)
> >>>   - Fix Ilpo's nits, if I missed anything lmk
> >>>
> >>> Changes since V3:
> >>>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
> >>>     that it is not needed for their media keys to function.
> >>>   - Cover init in asus-wmi with spinlock as per Hans
> >>>   - If asus-wmi registers WMI handler with brightness, init the brightness
> >>>     in USB Asus keyboards, per Hans.
> >>>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
> >>>   - Fix oops when unregistering asus-wmi by moving unregister outside of
> >>>     the spin lock (but after the asus reference is set to null)
> >>>
> >>> Changes since V2:
> >>>   - Check lazy init succeds in asus-wmi before setting register variable
> >>>   - make explicit check in asus_hid_register_listener for listener existing
> >>>     to avoid re-init
> >>>   - rename asus_brt to asus_hid in most places and harmonize everything
> >>>   - switch to a spinlock instead of a mutex to avoid kernel ooops
> >>>   - fixup hid device quirks to avoid multiple RGB devices while still exposing
> >>>     all input vendor devices. This includes moving rgb init to probe
> >>>     instead of the input_configured callbacks.
> >>>   - Remove fan key (during retest it appears to be 0xae that is already
> >>>     supported by hid-asus)
> >>>   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
> >>>   - removes fds from userspace and breaks backlight functionality. All
> >>>   - current mainline drivers do not support backlight hotplugging, so most
> >>>     userspace software (e.g., KDE, UPower) is built with that assumption.
> >>>     For the Ally, since it disconnects its controller during sleep, this
> >>>     caused the backlight slider to not work in KDE.
> >>>
> >>> Changes since V1:
> >>>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> >>>   - Fix ifdef else having an invalid signature (reported by kernel robot)
> >>>   - Restore input arguments to init and keyboard function so they can
> >>>     be re-used for RGB controls.
> >>>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
> >>>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
> >>>     keyboard rename into it.
> >>>   - Unregister brightness listener before removing work queue to avoid
> >>>     a race condition causing corruption
> >>>   - Remove spurious mutex unlock in asus_brt_event
> >>>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
> >>>     relocking the mutex and causing a deadlock when unregistering leds
> >>>   - Add extra check during unregistering to avoid calling unregister when
> >>>     no led device is registered.
> >>>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
> >>>     the driver to create 4 RGB handlers per device. I also suspect some
> >>>     extra events sneak through (KDE had the @@@@@@).
> >>>
> >>> Antheas Kapenekakis (7):
> >>>   HID: asus: refactor init sequence per spec
> >>>   HID: asus: prevent binding to all HID devices on ROG
> >>>   platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
> >>>   HID: asus: listen to the asus-wmi brightness device instead of
> >>>     creating one
> >>>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> >>>   platform/x86: asus-wmi: add keyboard brightness event handler
> >>>   HID: asus: add support for the asus-wmi brightness handler
> >>>
> >>>  drivers/hid/hid-asus.c                     | 235 +++++++++++----------
> >>>  drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
> >>>  include/linux/platform_data/x86/asus-wmi.h |  69 +++---
> >>>  3 files changed, 291 insertions(+), 170 deletions(-)
> >>>
> >>>
> >>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>


