Return-Path: <linux-input+bounces-11177-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 373B3A6FAD5
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 13:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2014189BDE7
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F02A256C94;
	Tue, 25 Mar 2025 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZd3WC2h"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3A2256C71;
	Tue, 25 Mar 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742904698; cv=none; b=S+YkQ1vkw4G12KFbR91+XFLURUuv/GikRGWPrhiqDAoEFqgymn8GiKWwrcj6Oi+T2Uhx2PooJ8n0pUgi1Jb5Z7uF35LkfMX2ojjoTHJ9fDTqlhHYndwu5GY/AmM697OsAxt/Wc39hrmwZW/1ZWYMLiUcU8sO+VwYh8Nuf08b5UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742904698; c=relaxed/simple;
	bh=wstB9AYDKQp+WL9io6XrHHPxJMW99imT4RaGNLRLzAw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LVxCoTbcf8AQQj1GwKO059isVU4cjnHtqlGS+UKk0kYSyufKR7MibtbPNTuh5P1p8mpEzz2chGfM6kYLc8nWD9+VMPeFYOc6whkhtl9iFMg7H6RxGKb0quPitj0VMzsZici494XWbyH8K6mR7gGvjgAFmB1AJUBeOKDDkuHz/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZd3WC2h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F22C4CEE4;
	Tue, 25 Mar 2025 12:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742904697;
	bh=wstB9AYDKQp+WL9io6XrHHPxJMW99imT4RaGNLRLzAw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZZd3WC2hM36Sa5eiVCCAac6uxEfggZwWvCxBl/y5L12DHUSG8mjwm8K/2vc0HngpM
	 djJsfHWqZc+YBqK/g7u4lSduKC80M/Vus7xObeB57HceX7H7p3HhVBaoe7LnXKl/Gh
	 /IsGfWan8RRotnMErichDAKCWJeOAoQSLzH63OsMIb/eQ6J0oeNDxHRuEyGoYov4sU
	 kk80yK8rFqCbn0kIws9ZFdY+PEUTmCbHYqd5dGbbsDqsDcngaBuscck4xiSYccSk87
	 EA921+7RPd4aC3qo31uZGqNUM7cxVMQnpj/Znt1mc/1AJQH6LVn/XDKzgLkDfsDKk3
	 9oEuOt1Kt+j9Q==
Date: Tue, 25 Mar 2025 13:11:34 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: kernel test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v4 09/11] HID: asus: add basic RGB support
In-Reply-To: <CAGwozwFnu+eQv+qe3XyfcNEjwjFoH23K0ixssEp7m=5Xnh4nhQ@mail.gmail.com>
Message-ID: <p1q83s69-8850-8008-o9qq-son994s5q5oo@xreary.bet>
References: <20250324210151.6042-10-lkml@antheas.dev> <202503251316.lPXAIXIV-lkp@intel.com> <CAGwozwFnu+eQv+qe3XyfcNEjwjFoH23K0ixssEp7m=5Xnh4nhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Mar 2025, Antheas Kapenekakis wrote:

> > [auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-refactor-init-sequence-per-spec/20250325-051852
> > base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> > patch link:    https://lore.kernel.org/r/20250324210151.6042-10-lkml%40antheas.dev
> > patch subject: [PATCH v4 09/11] HID: asus: add basic RGB support
> > config: riscv-randconfig-002-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251316.lPXAIXIV-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251316.lPXAIXIV-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202503251316.lPXAIXIV-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    riscv64-linux-ld: drivers/hid/hid-asus.o: in function `asus_kbd_register_leds':
> > >> drivers/hid/hid-asus.c:676:(.text+0x23f8): undefined reference to `devm_led_classdev_multicolor_register_ext'
> >
> 
> Since I have been getting this error by test robot often, what is the
> canonical way to check that KConfig is correct before sending patches?
> 
> I will try to fix the KConfig and send it later today

You either need to add driver's dependency on LEDS_CLASS_MULTICOLOR, or 
ifdef those parts out in case it's not set.

Thanks,

-- 
Jiri Kosina
SUSE Labs


