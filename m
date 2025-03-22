Return-Path: <linux-input+bounces-11072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C696A6C83C
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E33CE46003D
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 08:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5E11C84D5;
	Sat, 22 Mar 2025 08:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="c8RFP964"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4911B6CE0;
	Sat, 22 Mar 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742631194; cv=none; b=pzUIBBnrt5IlOl8xBvxGxa325xqafckwIKzUnpogmCDi0jsHI/ZBQ5KMzzNl9dBi8RERk5Cdw4IqN1jLHRaNdq12PUjP258CKYHSL9d7hs2+6Ah5M58Lq9L0PKf4NrtWWV0eAwcbchZEqKKMkjlYJQgpUBm0eo+9MUN2KV9b4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742631194; c=relaxed/simple;
	bh=JAnbRP6XM4tAuChv2P7cUtiCbiPzbTkZx5tSDakSrII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5V+oaONMhpZRVZjpjiXsIYmBfwkjCehsbSNwIwh1a1XySgWqQOquYl+9itwR/bvxjxjCrg0EmloHLXiQtUdvMdD7QF3q0TVcEMuOJqjz8F4iQrL6RQuwm2fleMPxi0UVddrmUJsrTJn2UeThuSyQMlcFBL23tvjyhDA6gTh5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=c8RFP964; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id ABB562E07B1B;
	Sat, 22 Mar 2025 10:13:03 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742631189;
	bh=7cBjueBxbh26ugimwmSV3S4SbS8FAmhY3jIT1+5zfsc=;
	h=Received:From:Subject:To;
	b=c8RFP964uObEUqW2VWF6E6lyDEJbGz6GWi4k2kQh3AQnsZgxlacvVQsXKax1ZbMpc
	 4x4H3knYDTzoR7HpUpHg7Th9SpRcXFO3BIsERqi9TXYZ8i1PO+GNpzfe8O1f5SjEuF
	 23iInjodgZ+TEdrK4ehlaZOeGhL7Ccdcvg5aNBLM=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.167.51) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f51.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso2938432e87.3;
        Sat, 22 Mar 2025 01:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPfSAZqcYBuW8XBc5VqClzXRKmHXqIT5MuItIVsw8R3mAm3r8ztBxNlamtLvtK42j5OXDgXhe21q+KUQ==@vger.kernel.org, AJvYcCXA+GRoED+8LAHaR3byyNmr8jMDMMbP9pIXvwhepCdyzOBA7t4e0r39OBv7+VZHUrYq1ND3sR7QM/BBbmh3@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwJVH3eOfz4SFQSq/ZXIMoNR/C28/eX6JD0G8fD+ITypi3bfJ
	ps64/LS6ExNyrijLPp4G0BHWPuNcZ/GG9uLhxGz/nmqOQY+fMAKE/5RwI26zyGux4An7jir8eQD
	/ZyZBZB2E2rS5jYG38+Q8R3ae2as=
X-Google-Smtp-Source: AGHT+IFBtyDdGPt9tnhNRhqaNtHZRkE0IbsqbTbCSl1v5+opxDKgSJNmQcjzDQPFedI6l/FRpH5fkG9EE3GEWwMdGZM=
X-Received: by 2002:a05:6512:3d94:b0:549:c1e6:cbb9 with SMTP id
 2adb3069b0e04-54ad6470679mr2244701e87.9.1742631182459; Sat, 22 Mar 2025
 01:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320220924.5023-1-lkml@antheas.dev> <20250320220924.5023-9-lkml@antheas.dev>
 <9be2c01e-190b-4d55-8ff8-3d89be52fc84@ljones.dev>
In-Reply-To: <9be2c01e-190b-4d55-8ff8-3d89be52fc84@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 22 Mar 2025 09:12:50 +0100
X-Gmail-Original-Message-ID: <CAGwozwFDeneALZ_-kOXQ70kg3OQ5BK8ANJrj+32hLHK_PMqVNQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jod4D_nxhCFB4XvUxl03loi48p2sBnV6C4z3A4nwkBt_rEfaN8_FF8T9LA
Message-ID: <CAGwozwFDeneALZ_-kOXQ70kg3OQ5BK8ANJrj+32hLHK_PMqVNQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 22 Mar 2025 at 05:31, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 21/03/25 11:09, Antheas Kapenekakis wrote:
> > Currenlty, the keyboard brightness control of Asus WMI keyboards is
> > handled in the kernel, which leads to the shortcut going from
> > brightness 0, to 1, to 2, and 3.
> >
> > However, for HID keyboards it is exposed as a key and handled by the
> > user's desktop environment. For the toggle button, this means that
> > brightness control becomes on/off. In addition, in the absence of a
> > DE, the keyboard brightness does not work.
> >
> > Therefore, expose an event handler for the keyboard brightness control
> > which can then be used by hid-asus.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/asus-wmi.c            | 38 ++++++++++++++++++++++
> >   include/linux/platform_data/x86/asus-wmi.h | 11 +++++++
> >   2 files changed, 49 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index 21e034be71b2f..45999dda9e7ed 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -1529,6 +1529,44 @@ void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
> >   }
> >   EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
> >
> > +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> > +
> > +int asus_brt_event(enum asus_brt_event event)
> > +{
> > +     int brightness;
> > +
> > +     mutex_lock(&asus_brt_lock);
> > +     if (!asus_brt_ref || !asus_brt_ref->kbd_led_registered) {
> > +             mutex_unlock(&asus_brt_lock);
> > +             return -EBUSY;
> > +     }
> > +     brightness = asus_brt_ref->kbd_led_wk;
> > +
> > +     switch (event) {
> > +     case ASUS_BRT_UP:
> > +             brightness += 1;
> > +             break;
> > +     case ASUS_BRT_DOWN:
> > +             brightness -= 1;
> > +             break;
> > +     case ASUS_BRT_TOGGLE:
> > +             if (brightness >= 3)
> > +                     brightness = 0;
> > +             else
> > +                     brightness += 1;
> > +             break;
> > +     }
> > +
> > +     do_kbd_led_set(&asus_brt_ref->kbd_led, brightness);
> > +     led_classdev_notify_brightness_hw_changed(&asus_brt_ref->kbd_led,
> > +                                               asus_brt_ref->kbd_led_wk);
> > +
> > +     mutex_unlock(&asus_brt_lock);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(asus_brt_event);
> > +
>
> I quick test on 6.14-rc7 gives me this:
>
> [  288.039255] BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:258
> [  288.039262] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0,
> name: swapper/17
> [  288.039263] preempt_count: 101, expected: 0
> [  288.039264] RCU nest depth: 0, expected: 0
> [  288.039266] CPU: 17 UID: 0 PID: 0 Comm: swapper/17 Tainted: G
> W          6.14.0-rc7+ #164
> [  288.039268] Tainted: [W]=WARN
> [  288.039269] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus M16
> GU604VY_GU604VY_00130747B/GU604VY, BIOS GU604VY.313 08/13/2024
> [  288.039270] Call Trace:
> [  288.039272]  <IRQ>
> [  288.039273]  dump_stack_lvl+0x5d/0x80
> [  288.039277]  __might_resched.cold+0xba/0xc9
> [  288.039282]  mutex_lock+0x19/0x40
> [  288.039285]  asus_brt_event+0x13/0xb0 [asus_wmi]
> [  288.039292]  asus_event+0x91/0xa0 [hid_asus]
> [  288.039295]  hid_process_event+0xae/0x120
> [  288.039298]  hid_input_array_field+0x132/0x180
> [  288.039300]  hid_report_raw_event+0x360/0x4e0
> [  288.039302]  __hid_input_report.constprop.0+0xf1/0x180
> [  288.039304]  hid_irq_in+0x17f/0x1b0
> [  288.039306]  __usb_hcd_giveback_urb+0x98/0x110
> [  288.039308]  usb_giveback_urb_bh+0xbd/0x150
> [  288.039310]  process_one_work+0x171/0x290
> [  288.039312]  bh_worker+0x1ac/0x210
> [  288.039314]  tasklet_hi_action+0xe/0x30
> [  288.039315]  handle_softirqs+0xdb/0x1f0
> [  288.039317]  __irq_exit_rcu+0xc2/0xe0
> [  288.039318]  common_interrupt+0x85/0xa0
> [  288.039320]  </IRQ>
> [  288.039320]  <TASK>
> [  288.039321]  asm_common_interrupt+0x26/0x40
> [  288.039323] RIP: 0010:cpuidle_enter_state+0xb9/0x2c0
> [  288.039325] Code: 40 0f 84 1b 01 00 00 e8 35 e8 13 ff e8 40 f2 ff ff
> 31 ff 49 89 c5 e8 c6 f0 12 ff 45 84 f6 0f 85 f2 00 00 00 fb 0f 1f 44 00
> 00 <45> 85 ff 0f 88 cf 00 00 00 49 63 f7 48 8d 04 76 48 8d 04 86 49 8d
> [  288.039326] RSP: 0018:ffffc90000253e90 EFLAGS: 00000246
> [  288.039328] RAX: ffff888890680000 RBX: 0000000000000003 RCX:
> 0000000000000000
> [  288.039329] RDX: 00000043107862af RSI: fffffffd616e8210 RDI:
> 0000000000000000
> [  288.039329] RBP: ffff8888906ba370 R08: 0000000000000000 R09:
> 0000000000000007
> [  288.039330] R10: ffff88888ffa6098 R11: 0000000000000008 R12:
> ffffffff82fd4140
> [  288.039331] R13: 00000043107862af R14: 0000000000000000 R15:
> 0000000000000003
> [  288.039332]  cpuidle_enter+0x28/0x40
> [  288.039334]  do_idle+0x1a8/0x200
> [  288.039336]  cpu_startup_entry+0x24/0x30
> [  288.039337]  start_secondary+0x11e/0x140
> [  288.039340]  common_startup_64+0x13e/0x141
> [  288.039342]  </TASK>
>
> I think you need to swap the mutex to a spin_lock_irqsave and associated
> spin_unlock_irqrestore plus DEFINE_SPINLOCK(asus_brt_lock).
>
> I'm out of time tonight but I'll apply the above to your patches and
> report back tomorrow if you don't get to it before I do.
>
> It might be worth checking any other mutex uses in the LED path too.

Thank you for catching that, I will replace the mutex with a spinlock.
Might have to do with the WMI method being active as I got no such
issue in my device.

 I guess I will try to do a v3 today as that will hold back our kernel too.

> Cheers,
> Luke.
>
> >   /*
> >    * These functions actually update the LED's, and are called from a
> >    * workqueue. By doing this as separate work rather than when the LED
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index add04524031d8..2ac7912d8acd3 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -162,11 +162,18 @@ struct asus_brt_listener {
> >       void (*notify)(struct asus_brt_listener *listener, int brightness);
> >   };
> >
> > +enum asus_brt_event {
> > +     ASUS_BRT_UP,
> > +     ASUS_BRT_DOWN,
> > +     ASUS_BRT_TOGGLE,
> > +};
> > +
> >   #if IS_REACHABLE(CONFIG_ASUS_WMI)
> >   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> >
> >   int asus_brt_register_listener(struct asus_brt_listener *cdev);
> >   void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
> > +int asus_brt_event(enum asus_brt_event event);
> >   #else
> >   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
> >                                          u32 *retval)
> > @@ -181,6 +188,10 @@ static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
> >   static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
> >   {
> >   }
> > +static inline int asus_brt_event(enum asus_brt_event event)
> > +{
> > +     return -ENODEV;
> > +}
> >   #endif
> >
> >   #endif      /* __PLATFORM_DATA_X86_ASUS_WMI_H */
>

