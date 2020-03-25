Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C04F19257D
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 11:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgCYK0X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 06:26:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:56786 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726206AbgCYK0X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 06:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585131981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KY4ALNIxs/y0tMl0MEZj9wTKfWoamQjaacEtIAjV9fU=;
        b=TPD6kAUwOhycFqq5T8dxL5b/E/sKrHA4BvuhcUpLdhCv0D1uMeQnLNHC8771siBIO8rd8/
        jtMrA+nee9Em43WUxmYcMYu5EwbCvWtUs04ZgkMOjB5At4x4CyPc7d8qNazYiwJrRj6mcB
        QIjtoGXuJrnnjZLTn3RRqGqgfifQF0Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-K7VhMoSfOXyaMifttgETrw-1; Wed, 25 Mar 2020 06:26:13 -0400
X-MC-Unique: K7VhMoSfOXyaMifttgETrw-1
Received: by mail-wr1-f69.google.com with SMTP id v6so910806wrg.22
        for <linux-input@vger.kernel.org>; Wed, 25 Mar 2020 03:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KY4ALNIxs/y0tMl0MEZj9wTKfWoamQjaacEtIAjV9fU=;
        b=oUF76IaILjegkybCUMC9E2NvWATngaIW36GIhtgmjiCoVk/hykA/u6K4pUewcGjcmo
         d+UX0wmzD75xcqnGaLAXVveb4kCvPndn9N/ysKLLgze87QgWypNFkqSL5h7k/ywaS0Lg
         rXKNetQBaFPkM8EaAY0PoefjbuW7oPHDRLSYAB+RqesF3L/8BrE6AZQvkgT62ez/f6zu
         9JJf/FkfAodzM2xfOZaDECsUe5EQT6lJX4B1ithqjs2xhvOeUwrurQUBdNnkgfcrKk72
         GqFCr9pza161yUUs63ZJ4C04mBXHXqvF6hCeKcVQDBRCdMbV5AaR0rHcH8Gtq6eb2jjg
         4HPg==
X-Gm-Message-State: ANhLgQ0ltf7onIwgXY1WgHky+gBtv+ekZeC0SdFHMhRsJszqTWyE6BgM
        sjOUC4HbIIGkyPyhXOskgejxN21i5b2JYD1OFpOW5dIBTry5TVRJbUUTnlMyA94PGRox66N+oYA
        wzaq+W1aSuMFd6OAjXQQ5gtA=
X-Received: by 2002:a05:600c:34b:: with SMTP id u11mr2827927wmd.92.1585131972490;
        Wed, 25 Mar 2020 03:26:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vudUUfYKJoazFIcCSSvPtptzQkoLorEHDhdSYgT5vWNwDjaCYtMvPmYZQsjRnXaPuyFf7/LWw==
X-Received: by 2002:a05:600c:34b:: with SMTP id u11mr2827897wmd.92.1585131972106;
        Wed, 25 Mar 2020 03:26:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id e9sm32796522wrw.30.2020.03.25.03.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 03:26:11 -0700 (PDT)
Subject: Re: [input:next 2439/2454] drivers/input/touchscreen/goodix.c:554:12:
 error: implicit declaration of function 'acpi_execute_simple_method'
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
References: <202003250912.X8nyk6aI%lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <438757e8-d843-7a6d-78bc-3226817f4618@redhat.com>
Date:   Wed, 25 Mar 2020 11:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <202003250912.X8nyk6aI%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/25/20 2:40 AM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> head:   10ad4845cd3d760c191ab4ecef446b99a6b2c779
> commit: c5fca485320e83b1bb964ad5559ec20f14c943be [2439/2454] Input: goodix - add support for controlling the IRQ pin through ACPI methods
> config: nds32-randconfig-a001-20200324 (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.2.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout c5fca485320e83b1bb964ad5559ec20f14c943be
>          # save the attached .config to linux build tree
>          GCC_VERSION=9.2.0 make.cross ARCH=nds32
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/input/touchscreen/goodix.c: In function 'goodix_irq_direction_output':
>>> drivers/input/touchscreen/goodix.c:554:12: error: implicit declaration of function 'acpi_execute_simple_method' [-Werror=implicit-function-declaration]
>       554 |   status = acpi_execute_simple_method(ACPI_HANDLE(dev),

This is my bad, I was relying on acpi stub functions
declared in include/linux/acpi.h to deal with this.

This works for e.g. the has_acpi_companion() check we do in
goodix_get_gpio_config(), but acpi_execute_simple_method()
is not stubbed. So we will need to add some #ifdef-s.

I've prepared a patch fixing this, I will send it out
right away.

Regards,

Hans




>           |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/input/touchscreen/goodix.c:536:17: warning: unused variable 'dev' [-Wunused-variable]
>       536 |  struct device *dev = &ts->client->dev;
>           |                 ^~~
>     drivers/input/touchscreen/goodix.c: In function 'goodix_irq_direction_input':
>     drivers/input/touchscreen/goodix.c:564:17: warning: unused variable 'dev' [-Wunused-variable]
>       564 |  struct device *dev = &ts->client->dev;
>           |                 ^~~
>     cc1: some warnings being treated as errors
> 
> vim +/acpi_execute_simple_method +554 drivers/input/touchscreen/goodix.c
> 
>     532	
>     533	static int goodix_irq_direction_output(struct goodix_ts_data *ts,
>     534					       int value)
>     535	{
>     536		struct device *dev = &ts->client->dev;
>     537		acpi_status status;
>     538	
>     539		switch (ts->irq_pin_access_method) {
>     540		case IRQ_PIN_ACCESS_NONE:
>     541			dev_err(&ts->client->dev,
>     542				"%s called without an irq_pin_access_method set\n",
>     543				__func__);
>     544			return -EINVAL;
>     545		case IRQ_PIN_ACCESS_GPIO:
>     546			return gpiod_direction_output(ts->gpiod_int, value);
>     547		case IRQ_PIN_ACCESS_ACPI_GPIO:
>     548			/*
>     549			 * The IRQ pin triggers on a falling edge, so its gets marked
>     550			 * as active-low, use output_raw to avoid the value inversion.
>     551			 */
>     552			return gpiod_direction_output_raw(ts->gpiod_int, value);
>     553		case IRQ_PIN_ACCESS_ACPI_METHOD:
>   > 554			status = acpi_execute_simple_method(ACPI_HANDLE(dev),
>     555							    "INTO", value);
>     556			return ACPI_SUCCESS(status) ? 0 : -EIO;
>     557		}
>     558	
>     559		return -EINVAL; /* Never reached */
>     560	}
>     561	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

