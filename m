Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636B7D044C
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 01:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbfJHXoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 19:44:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41217 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfJHXoF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 19:44:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id q7so353022pfh.8;
        Tue, 08 Oct 2019 16:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=giOz/dRSNjcjaoPCpsFIM1SwpAO5uvYzKokl/9Bvn60=;
        b=BKQ1xzf8hhuxcflOm7bvqSjeqcU3Oqibixhqnm42Va7LWUpPnr+GdX8aP8G2VO/89p
         pYkhYPNmFH5gVC59PBt3DSld5qKt7DE0odsOK+BiUnjbO8YbhumJSkuoGS6Q30c9wuoA
         LXRlFqiUsneDzDCIKpxXRVpzPqioFR2g77XHdAqCPXX8LcYV5ieJ4b4BflWtMciUg9nz
         N7FwdWhkT32oWPn63OeCnBtuvaUIbEq2XPsOjGFy/v5uGPn58k3sOvloAkFY30PLPZRd
         ZDoFCd2diAX+9xhT3LdThYbTmNMZjk6VEJDKlEWKlgwdQsq71/v3um030qSAhUpOHuwJ
         69Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=giOz/dRSNjcjaoPCpsFIM1SwpAO5uvYzKokl/9Bvn60=;
        b=lDemhlECazjHK6I+FJnC18PboZTqtFvFYVLTGZhHwXRkitGt076c69v50Rxd82Y7CQ
         cAuzadk/UuWwYGwG7U2ed3cgenMHhbAo7UEgXf+ioD3Pdg7H+a5N5kqkNBqzFYLIQbGt
         hlr7aEKo6yFk9pKekjK9LQyoyCEKLVCLzIuAjyU3T9gPL5PvfETKs0aB8qreKhRbY+Tw
         qH/xqdt0kCwSAAqh78ektkdOARUxseI7Nih2NlmcifQGXhM14YVLLrleOPIX2gj38E9S
         whXi7VuJ/CvUBmFXHKrIFoxIAq9hB9Lzx2U9odztcIk2IMHt5hA5yB/tK81p3bZV/cxO
         Hq1Q==
X-Gm-Message-State: APjAAAVL3Aqbtngrd3+DIWfRQwhKDPOVnskxNWr4iqatXC09cDNFSN1m
        QlFgUdFFBpoth9GRyb/ZrME=
X-Google-Smtp-Source: APXvYqyZm6Xavx10KziFI2ZriRe5b6hI9rLlLzyI1VzXZOmZ5IeJZNNGJ6qatjgVlbEfyXZRtyr3SQ==
X-Received: by 2002:a63:5b07:: with SMTP id p7mr1132507pgb.416.1570578243596;
        Tue, 08 Oct 2019 16:44:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 127sm203127pfy.56.2019.10.08.16.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 16:44:02 -0700 (PDT)
Date:   Tue, 8 Oct 2019 16:44:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@infradead.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
Message-ID: <20191008234400.GJ22365@dtor-ws>
References: <20191005105551.353273-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005105551.353273-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 05, 2019 at 12:55:51PM +0200, Hans de Goede wrote:
> Commit c394159310d0 ("Input: soc_button_array - add support for newer
> surface devices") not only added support for the MSHW0040 ACPI HID,
> but for some reason it also makes changes to the error handling of the
> soc_button_lookup_gpio() call in soc_button_device_create(). Note ideally
> this seamingly unrelated change would have been made in a separate commit,
> with a message explaining the what and why of this change.
> 
> I guess this change may have been added to deal with -EPROBE_DEFER errors,
> but in case of the existing support for PNP0C40 devices, treating
> -EPROBE_DEFER as any other error is deliberate, see the comment this
> commit adds for why.
> 
> The actual returning of -EPROBE_DEFER to the caller of soc_button_probe()
> introduced by the new error checking causes a serious regression:
> 
> On devices with so called virtual GPIOs soc_button_lookup_gpio() will
> always return -EPROBE_DEFER for these fake GPIOs, when this happens
> during the second call of soc_button_device_create() we already have
> successfully registered our first child. This causes the kernel to think
> we are making progress with probing things even though we unregister the
> child before again before we return the -EPROBE_DEFER. Since we are making
> progress the kernel will retry deferred-probes again immediately ending
> up stuck in a loop with the following showing in dmesg:
> 
> [  124.022697] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6537
> [  124.040764] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6538
> [  124.056967] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6539
> [  124.072143] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6540
> [  124.092373] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6541
> [  124.108065] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6542
> [  124.128483] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6543
> [  124.147141] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6544
> [  124.165070] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6545
> [  124.179775] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6546
> [  124.202726] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6547
> <continues on and on and on>
> 
> And 1 CPU core being stuck at 100% and udev hanging since it is waiting
> for the modprobe of soc_button_array to return.
> 
> This patch reverts the soc_button_lookup_gpio() error handling changes,
> fixing this regression.
> 
> Fixes: c394159310d0 ("Input: soc_button_array - add support for newer surface devices")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205031
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

> ---
>  drivers/input/misc/soc_button_array.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
> index 97e3639e99d0..97761421d6dd 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -92,11 +92,18 @@ soc_button_device_create(struct platform_device *pdev,
>  			continue;
>  
>  		gpio = soc_button_lookup_gpio(&pdev->dev, info->acpi_index);
> -		if (gpio < 0 && gpio != -ENOENT) {
> -			error = gpio;
> -			goto err_free_mem;
> -		} else if (!gpio_is_valid(gpio)) {
> -			/* Skip GPIO if not present */
> +		if (!gpio_is_valid(gpio)) {
> +			/*
> +			 * Skip GPIO if not present. Note we deliberately
> +			 * ignore -EPROBE_DEFER errors here. On some devices
> +			 * Intel is using so called virtual GPIOs which are not
> +			 * GPIOs at all but some way for AML code to check some
> +			 * random status bits without need a custom opregion.
> +			 * In some cases the resources table we parse points to
> +			 * such a virtual GPIO, since these are not real GPIOs
> +			 * we do not have a driver for these so they will never
> +			 * show up, therefor we ignore -EPROBE_DEFER.
> +			 */
>  			continue;
>  		}
>  
> -- 
> 2.23.0
> 

-- 
Dmitry
