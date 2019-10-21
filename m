Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9AFDE21D
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 04:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfJUC1k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 22:27:40 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41136 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbfJUC1k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 22:27:40 -0400
Received: by mail-pg1-f195.google.com with SMTP id t3so6783703pga.8
        for <linux-input@vger.kernel.org>; Sun, 20 Oct 2019 19:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
        b=HBXUvt040GMIEwLCNj0cv5hSZlRkL/uSj5D7wLWdq/dK4otL0nVEbSqZR/yA3O2Og9
         AGWR8nz33JcyPwt0cVzYqNq50Faf18+z3imXfVGexdoVV7YqaTAx1/VUr9tWFd1T5Cbb
         Tf3GaNcBURk5SkpU/x/jomYDDMhIfJxW71YTg5rvruJX3ueO8ezhfGPDpZ8h4aBGcFO7
         kumSOPEltTLr+L4+0n9vUg4CWg75RR45G4UAxyVxqOpn3JU7cI+2DI4kkwOVZWPX+nFt
         EIZgqQsA7otGwkMKpKWeRDE8Vka9aexA24uKnw1PmWmT0weSSgJHTEGbfcCA0RE8KN8b
         2ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
        b=FzP+/4DXnWpU+tCuK1iEnI6vL42jV33+7ZqBdAPujPjoGgpEC6sn+QPEhMD1FUwRrj
         a5o52JMY//FIHdsBtdYWrPOn9TnsASolHio2ZXWS8Btt68NwJMjRkJb8TCAktE3rEwla
         dgx1lo2e4QHkvkJyLOm3Uob+n5E277vdyVxCCio/3ZG02GUuo6EiCGJ4zmjNrpf9aiB6
         1IY6yPmhchvuYfQF21pZO/qpFprkTkYTsto4RRDOL3NIknmDdVe5mtzGcB6MAZE/md8T
         vNUMGsYcJAaO2XodVIquRcKIsYG9bbVrL4MIPjsaYRlA69R3vq4C0FjLTIYRjVbd9H6D
         jt7w==
X-Gm-Message-State: APjAAAWv/6yROsesf5ym1M0KJe1be4idRNZZ4RL25lNzk3tSh75GJeX2
        gXgEnmvRAmY/2gtjZ+JtWh71+Q==
X-Google-Smtp-Source: APXvYqwgXGc8U+6JV2azREgJVpwvucEYJlBr8fKvxMlwaeCP9tIcS23wt/WioWPY0VSEsf3wqmlSTg==
X-Received: by 2002:a63:4e52:: with SMTP id o18mr11185515pgl.153.1571624859157;
        Sun, 20 Oct 2019 19:27:39 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id f17sm20835265pgd.8.2019.10.20.19.27.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 19:27:38 -0700 (PDT)
Date:   Mon, 21 Oct 2019 07:57:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 05/46] ARM: pxa: split up mach/hardware.h
Message-ID: <20191021022736.yu6unspozqf5634p@vireshk-i7>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 18-10-19, 17:41, Arnd Bergmann wrote:
> The mach/hardware.h is included in lots of places, and it provides
> three different things on pxa:
> 
> - the cpu_is_pxa* macros
> - an indirect inclusion of mach/addr-map.h
> - the __REG() and io_pv2() helper macros
> 
> Split it up into separate <linux/soc/pxa/cpu.h> and mach/pxa-regs.h
> headers, then change all the files that use mach/hardware.h to
> include the exact set of those three headers that they actually
> need, allowing for further more targeted cleanup.
> 
> linux/soc/pxa/cpu.h can remain permanently exported and is now in
> a global location along with similar headers. pxa-regs.h and
> addr-map.h are only used in a very small number of drivers now
> and can be moved to arch/arm/mach-pxa/ directly when those drivers
> are to pass the necessary data as resources.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/cpufreq/pxa2xx-cpufreq.c              |  1 +
>  drivers/cpufreq/pxa3xx-cpufreq.c              |  1 +

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
