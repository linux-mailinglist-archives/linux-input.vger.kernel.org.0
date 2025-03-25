Return-Path: <linux-input+bounces-11167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 995ABA6EBF5
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 09:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1858016A0AF
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 08:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85331AAA1B;
	Tue, 25 Mar 2025 08:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="IrKPm8r3"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEA419EEBF;
	Tue, 25 Mar 2025 08:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742892779; cv=none; b=myNuI1MuUijmpj0P2boomtDn1bjL3GOzF8bJ9dBNi1nIAI//0GpQeopsoZZxztV0+ftsQRcAKy8vFdhgVNHLtv3oy0jON8N0V0uzDZg/4WZpCPx6GHSf7ji1zwX7a/nVBsnb2dbhqviI8zBk9oibvcaDsNVp13W9GuJKtvTT9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742892779; c=relaxed/simple;
	bh=k2keouQN8/qCGOrcjK3pzj7qXnScNycXHz527cVZTm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppomZTsvh6zcgiAg6jXbSbSXtGVF4RltONoIE9jYjS893nJe7JixJiq6SqZ/2Is6zR9UqHfsBNhnBxOReK6BywZm6YW3Wyu1efmqbGkZsyFvHiynMxXzjNcx/4AhY2zi2Ln2E37g9WL5WNdVpNptlzxJeWsoz+KeOpdHxPQM1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=IrKPm8r3; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 9DA5C2E0873A;
	Tue, 25 Mar 2025 10:52:46 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742892768;
	bh=0bCygpRrm3Yx2CpXOpIVeKdCxu9w0sgpWFU8/m26N64=;
	h=Received:From:Subject:To;
	b=IrKPm8r3iYxs6eTKcun0UWit2MwK68V3VxRtnsba82RyT8n1ILQjFvE9LvGyD3EJK
	 upZtb33yD6wUnRmfdOPmDi/42J3zwa9hX0SYG04Prmj5Chiry3CUKePqwco2sowQAh
	 O9uUX2b7TGAiHsb+3buMJ3EyvOsWT7qpkb7EIF+U=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30c0517142bso55791311fa.1;
        Tue, 25 Mar 2025 01:52:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNI051P5M5XnGNWImW8WDOCbHSDow/Vfu87kzqNaXYgoK88xDr2CdJE4p3Fkh5HiEzIvHwpj8Z2QGIGnYK@vger.kernel.org,
 AJvYcCXeU2vo8HQProEgDO1m9wBLrql/jgx5MMaW5yyTyPPnVoNJk07IHgZZyUHtqoKIOW6wYqVi5MJ2ghRyew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBNqnLRnA9629JjWE2p+aXBsSuzWOW1X1wuLUFsG/AAbss3CH
	vkq08/akLF+Sc6kufc0Gb9wTqx9TUC7tqQSvNzvTBc8L2CExhmKOjF6xY/MkrdsZK44eAFefdpf
	li37rhteGM7Mtdpb7s/1KNYtNgAk=
X-Google-Smtp-Source: 
 AGHT+IHRbr3Zgt3JTjcuCrzPWSyhQ7NbTyJY8uA2enw0MS8S7/YmeFAcMflWPRoZmdcCtqxkS3KQISgV+Jkx3u5FBKQ=
X-Received: by 2002:a05:651c:2209:b0:30b:f775:baf5 with SMTP id
 38308e7fff4ca-30d7e0dd9bbmr59083871fa.0.1742892765627; Tue, 25 Mar 2025
 01:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324210151.6042-10-lkml@antheas.dev>
 <202503251316.lPXAIXIV-lkp@intel.com>
In-Reply-To: <202503251316.lPXAIXIV-lkp@intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 25 Mar 2025 09:52:32 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFnu+eQv+qe3XyfcNEjwjFoH23K0ixssEp7m=5Xnh4nhQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqBK-YkWbgSprjvPh-VyZ0pO6dOIRXsCrbsZaOFk6X7TVe8A4ojrJp9DLE
Message-ID: 
 <CAGwozwFnu+eQv+qe3XyfcNEjwjFoH23K0ixssEp7m=5Xnh4nhQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] HID: asus: add basic RGB support
To: kernel test robot <lkp@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174289276713.8467.18012719937652387542@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

My email is not doing too well it seems. It is not just yours Luke.
Hopefully my shared host does not bite me for abusing the IP

On Tue, 25 Mar 2025 at 07:34, kernel test robot <lkp@intel.com> wrote:
>
> Hi Antheas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-refactor-init-sequence-per-spec/20250325-051852
> base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> patch link:    https://lore.kernel.org/r/20250324210151.6042-10-lkml%40antheas.dev
> patch subject: [PATCH v4 09/11] HID: asus: add basic RGB support
> config: riscv-randconfig-002-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251316.lPXAIXIV-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251316.lPXAIXIV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503251316.lPXAIXIV-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    riscv64-linux-ld: drivers/hid/hid-asus.o: in function `asus_kbd_register_leds':
> >> drivers/hid/hid-asus.c:676:(.text+0x23f8): undefined reference to `devm_led_classdev_multicolor_register_ext'
>

Since I have been getting this error by test robot often, what is the
canonical way to check that KConfig is correct before sending patches?

I will try to fix the KConfig and send it later today


Antheas

>
> vim +676 drivers/hid/hid-asus.c
>
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  645
> af22a610bc3850 Carlo Caione        2017-04-06  646  static int asus_kbd_register_leds(struct hid_device *hdev)
> af22a610bc3850 Carlo Caione        2017-04-06  647  {
> af22a610bc3850 Carlo Caione        2017-04-06  648      struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> af22a610bc3850 Carlo Caione        2017-04-06  649      unsigned char kbd_func;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  650      struct asus_kbd_leds *leds;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  651      bool no_led;
> af22a610bc3850 Carlo Caione        2017-04-06  652      int ret;
> af22a610bc3850 Carlo Caione        2017-04-06  653
> 2c82a7b20f7b7a Luke D. Jones       2024-04-16  654      ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> 2c82a7b20f7b7a Luke D. Jones       2024-04-16  655      if (ret < 0)
> 2c82a7b20f7b7a Luke D. Jones       2024-04-16  656              return ret;
> 2c82a7b20f7b7a Luke D. Jones       2024-04-16  657
> 3ebfeb18b44e01 Antheas Kapenekakis 2025-03-24  658      /* Get keyboard functions */
> 3ebfeb18b44e01 Antheas Kapenekakis 2025-03-24  659      ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> b92b80246e0626 Luke D Jones        2020-10-27  660      if (ret < 0)
> b92b80246e0626 Luke D Jones        2020-10-27  661              return ret;
> 53078a736fbc60 Luke D. Jones       2025-01-11  662
> 53078a736fbc60 Luke D. Jones       2025-01-11  663      if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> 53078a736fbc60 Luke D. Jones       2025-01-11  664              ret = asus_kbd_disable_oobe(hdev);
> 53078a736fbc60 Luke D. Jones       2025-01-11  665              if (ret < 0)
> 53078a736fbc60 Luke D. Jones       2025-01-11  666                      return ret;
> 53078a736fbc60 Luke D. Jones       2025-01-11  667      }
> af22a610bc3850 Carlo Caione        2017-04-06  668
> af22a610bc3850 Carlo Caione        2017-04-06  669      /* Check for backlight support */
> af22a610bc3850 Carlo Caione        2017-04-06  670      if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> af22a610bc3850 Carlo Caione        2017-04-06  671              return -ENODEV;
> af22a610bc3850 Carlo Caione        2017-04-06  672
> af22a610bc3850 Carlo Caione        2017-04-06  673      drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
> af22a610bc3850 Carlo Caione        2017-04-06  674                                            sizeof(struct asus_kbd_leds),
> af22a610bc3850 Carlo Caione        2017-04-06  675                                            GFP_KERNEL);
> af22a610bc3850 Carlo Caione        2017-04-06 @676      if (!drvdata->kbd_backlight)
> af22a610bc3850 Carlo Caione        2017-04-06  677              return -ENOMEM;
> af22a610bc3850 Carlo Caione        2017-04-06  678
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  679      leds = drvdata->kbd_backlight;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  680      leds->removed = false;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  681      leds->brightness = 3;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  682      leds->hdev = hdev;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  683      leds->listener.brightness_set = asus_kbd_listener_set;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  684
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  685      leds->rgb_colors[0] = 0;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  686      leds->rgb_colors[1] = 0;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  687      leds->rgb_colors[2] = 0;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  688      leds->rgb_init = true;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  689      leds->rgb_set = false;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  690      leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  691                                      "asus-%s:rgb:peripheral",
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  692                                      strlen(hdev->uniq) ?
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  693                                      hdev->uniq : dev_name(&hdev->dev));
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  694      leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  695      leds->mc_led.led_cdev.max_brightness = 3,
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  696      leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  697      leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  698      leds->mc_led.subled_info = leds->subled_info,
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  699      leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  700      leds->subled_info[0].color_index = LED_COLOR_ID_RED;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  701      leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  702      leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  703
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  704      INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
> 315c537068a13f Pietro Borrello     2023-02-12  705      spin_lock_init(&drvdata->kbd_backlight->lock);
> af22a610bc3850 Carlo Caione        2017-04-06  706
> d37db2009c913c Antheas Kapenekakis 2025-03-24  707      ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  708      no_led = !!ret;
> d37db2009c913c Antheas Kapenekakis 2025-03-24  709
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  710      if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  711              ret = devm_led_classdev_multicolor_register(
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  712                      &hdev->dev, &leds->mc_led);
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  713              if (!ret)
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  714                      leds->rgb_registered = true;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  715              no_led &= !!ret;
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  716      }
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  717
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  718      if (no_led) {
> af22a610bc3850 Carlo Caione        2017-04-06  719              /* No need to have this still around */
> af22a610bc3850 Carlo Caione        2017-04-06  720              devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> af22a610bc3850 Carlo Caione        2017-04-06  721      }
> af22a610bc3850 Carlo Caione        2017-04-06  722
> 312a522531f6e5 Antheas Kapenekakis 2025-03-24  723      return no_led ? -ENODEV : 0;
> af22a610bc3850 Carlo Caione        2017-04-06  724  }
> af22a610bc3850 Carlo Caione        2017-04-06  725
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

