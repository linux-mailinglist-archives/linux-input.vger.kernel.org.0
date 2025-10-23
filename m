Return-Path: <linux-input+bounces-15667-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA957BFF6E8
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 08:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C363AA146
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 06:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B97278754;
	Thu, 23 Oct 2025 06:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="kx/A3zdd"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0601B7F4
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202623; cv=none; b=G+D1f549xaYhzEbd4YoZPwAGPLd2WBs1XnFiKTUQCGFdD6dxzAwugF+1m+Y7ooHeGcVzWgr9WWqedPpslIeVP9ltI95tjKqX3C3cZUqEcPAa/q4Jzcc1rtmxdKCtPDtADbDGAC3hiMdM6iyYBvtLD4Z+hjmCSoYJhRFi0G4DtmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202623; c=relaxed/simple;
	bh=gSjnScR02V4S8DYfAOXlQG7AHQ0VZOuy0vgD6CF7/Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIgLb0xKEaVCvGnmRVNlgY/A1M/arxE7U0/vAt4GNJc1V7es0trwzUxZwGhdsRSlgbZYZra0KgYOg8+nO/v0qYpcX3HLszcHoFewSb/5lL8ldlFZt1Y55xXgkxIUf78DzWnFORhWaxDlYP5CzUHLy6L6wFSVwm3Pqko8Cwa53zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=kx/A3zdd; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id E83B93F941
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 09:56:52 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id C5CAE3F91D
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 09:56:51 +0300 (EEST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D103A201B89
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 09:56:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761202611;
	bh=778AAfPAeLmP3Ine3jLlCZ7+L5aBSPJLRaC3Bdozzpg=;
	h=Received:From:Subject:To;
	b=kx/A3zddMMEVmUkM3usO/71vvjTIfDJUWOEK9lz/uDlsSQUDW7ShO0Yz6TCNfkpp4
	 tW4H6kyR5wj0wbwbvPi3zmnOV1kd37+1t+vWlPHHtVIQwqOJkuN8xU6DQn4VarF+BP
	 i8bA6vjOO9etT5nyGywoeimvirZjMP2nXCI4OkK0lxIz1qJ5C4auCdHEILv7K4MRym
	 6/Srd1G5+mOJtrY8gRv5wQXLCvcsLC3ZW3rBj0jYlrcGAUUBUhjGSMrFJRY7509NRm
	 SGn6/TN9QK461GV7Dw9be+6s/wl9brClZJVlznT/8f5sXI/rgL9yDp+pFnDIc/7Lyh
	 MhsoyGRSL6NRg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-378d6fa5aebso3980641fa.2
        for <linux-input@vger.kernel.org>;
 Wed, 22 Oct 2025 23:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPpTfKbEm/JUmty89aCscJa1fB3OKAZ/OtgmFTVUWMQC/JN+G8UyKdWecElAFkJD98yMeXajKvTyzJag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAhd6V/JH8yFAu0t5r2mzLNiySMw3BwA9QeRfhmUC/TX7jihET
	Pl5FmLjP2qYVv9LW4I4b7+qB839UmsHohrU/Ysb6o24YEZZwIX12Kubz6dfCnJh5yZeLtPGeeaR
	fcv4gI9XeaPpwUWNpM8mL1HRZ5K0HYzw=
X-Google-Smtp-Source: 
 AGHT+IFO/7PZLoDhDWs+FcqHXfC/yTXf9/+SGznP7sA2dRey8Da8zaXRQEhBHak9pTbVneTzKO0CtYnoUah1FtRNe3U=
X-Received: by 2002:a05:651c:507:b0:372:9d94:8697 with SMTP id
 38308e7fff4ca-378d6f8729bmr3510971fa.44.1761202610101; Wed, 22 Oct 2025
 23:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018101759.4089-6-lkml@antheas.dev>
 <202510222013.EBLC609m-lkp@intel.com>
In-Reply-To: <202510222013.EBLC609m-lkp@intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 23 Oct 2025 08:56:37 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGDBj2e83JBW71G_z6hMD5PsOXTQLqFVdPKZ6sU54tsGw@mail.gmail.com>
X-Gm-Features: AS18NWDd23NLIOTVOY058aR91_4SrQH2cNUKcz3swTq1pi3O6MGGrLrEkyO9gzg
Message-ID: 
 <CAGwozwGDBj2e83JBW71G_z6hMD5PsOXTQLqFVdPKZ6sU54tsGw@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
To: kernel test robot <lkp@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176120261122.2781023.1860615135932509666@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 22 Oct 2025 at 15:38, kernel test robot <lkp@intel.com> wrote:
>
> Hi Antheas,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-simplify-RGB-init-sequence/20251018-182410
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251018101759.4089-6-lkml%40antheas.dev
> patch subject: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd led handlers
> config: i386-randconfig-141-20251020 (https://download.01.org/0day-ci/archive/20251022/202510222013.EBLC609m-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510222013.EBLC609m-lkp@intel.com/
>
> New smatch warnings:
> drivers/platform/x86/asus-wmi.c:1623 kbd_led_update_all() warn: always true condition '(value >= 0) => (0-u32max >= 0)'
>
> Old smatch warnings:
> drivers/platform/x86/asus-wmi.c:2288 asus_new_rfkill() warn: '*rfkill' is an error pointer or valid
>
> vim +1623 drivers/platform/x86/asus-wmi.c
>
>   1589
>   1590  static void kbd_led_update_all(struct work_struct *work)
>   1591  {
>   1592          enum led_brightness value;
>   1593          struct asus_wmi *asus;
>   1594          bool registered, notify;
>   1595          int ret;
                              /\ value should have been an int and
placed here. It can take the value -1 hence the check

Are there any other comments on the series?

The only issue I am aware of is that Denis identified a bug in asusd
(asusctl userspace program daemon) in certain Asus G14/G16 laptops
that cause laptop keys to become sticky, I have had users also report
that bug in previous versions of the series. WIthout asusd running,
keyboards work fine incl. with brightness control (did not work
before). Given it will take two months for this to reach mainline, I
think it is a fair amount of time to address the bug.

Antheas

>   1596
>   1597          asus = container_of(work, struct asus_wmi, kbd_led_work);
>   1598
>   1599          scoped_guard(spinlock_irqsave, &asus_ref.lock) {
>   1600                  registered = asus->kbd_led_registered;
>   1601                  value = asus->kbd_led_wk;
>   1602                  notify = asus->kbd_led_notify;
>   1603          }
>   1604
>   1605          if (!registered) {
>   1606                  /*
>   1607                   * This workqueue runs under asus-wmi, which means probe has
>   1608                   * completed and asus-wmi will keep running until it finishes.
>   1609                   * Therefore, we can safely register the LED without holding
>   1610                   * a spinlock.
>   1611                   */
>   1612                  ret = devm_led_classdev_register(&asus->platform_device->dev,
>   1613                                              &asus->kbd_led);
>   1614                  if (!ret) {
>   1615                          scoped_guard(spinlock_irqsave, &asus_ref.lock)
>   1616                                  asus->kbd_led_registered = true;
>   1617                  } else {
>   1618                          pr_warn("Failed to register keyboard backlight LED: %d\n", ret);
>   1619                          return;
>   1620                  }
>   1621          }
>   1622
> > 1623          if (value >= 0)
>   1624                  do_kbd_led_set(&asus->kbd_led, value);
>   1625          if (notify) {
>   1626                  scoped_guard(spinlock_irqsave, &asus_ref.lock)
>   1627                          asus->kbd_led_notify = false;
>   1628                  led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
>   1629          }
>   1630  }
>   1631
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>


