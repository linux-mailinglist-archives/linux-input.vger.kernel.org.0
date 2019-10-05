Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6906DCC9EA
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 14:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbfJEMY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 08:24:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38314 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfJEMY5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 08:24:57 -0400
Received: by mail-wr1-f67.google.com with SMTP id w12so10140233wro.5;
        Sat, 05 Oct 2019 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AndZMSEDGnOk0Jn24aQIRsC/2ExlDZE2yMCCrzypQ00=;
        b=m6q34BHADtE4ePg8AWkpufWj8+PRLpcFc7IZhGNXAI0YUpVyi5cQQ3XxdAVDB8rguj
         GxaLlD1uB5ukEP81v3KcsDB7IUGw6V+O3Nltur5KznD5VKDgEwMYkyjcsxwJwdnC8bSf
         h3sYVumVryfYm5wcdJjwoXiUNffQnZY/QAh14gZ1uaB4+Bjw2mJ9m2qZ5clJxIJW00kA
         s4qxyFA9T7XA2ofykkz6aZTV9+2fxPfH9B9GtgoPW/V/rqGmZYTjdX+5nS6Ji5971McY
         8sReQeX27fGHaGh3xRH05ufwzskBSN/OcnnkgGqE3RjYBkGlvoQXndf313ZVQ6NP2CeF
         uKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AndZMSEDGnOk0Jn24aQIRsC/2ExlDZE2yMCCrzypQ00=;
        b=Wq78xsdmr2iKksrFANqJuTipOyBiQyMtssbOzqiwa21j1+sUsC3ZNFLuwOeYbiKVne
         p/RbkiFq4Ya+OAt7kUV8To6NMEiRCSEzcYb5PN43IGcR38rLJ8StnMIEJb1XHYhWHoTQ
         833iZgpbj4pfWA9PWzvZt4oabHH+qIyA5lVDhJw8OGmvcaUtnpId25f22hynMf2vVKhl
         0UQZibJKd3SRdJVOkYo6YCUTzdJH0JLpax/U3KSSf4unDxqeBVwSCjvQdbwxxxeVm9h/
         B9o9rpKJ2YwXPQ6zZ2rj6s0vqNqKW763OI3klkRevCNFUVguPKla8depGMvUxY2Ar844
         XfgQ==
X-Gm-Message-State: APjAAAWs29/Yr88L6yUm8ueJiNU3h1sPM7SDnUHdmaEMB8zCP6qlguC7
        0TnX2doWY/D87eRJqfnPdRY=
X-Google-Smtp-Source: APXvYqzXztDn6JBikilw5BsQ/wznLPYZFPp9T77lNEkZMsKOC9lDHog6P12smbv5L5k/8g4RtVShjA==
X-Received: by 2002:adf:aa98:: with SMTP id h24mr10852669wrc.60.1570278294265;
        Sat, 05 Oct 2019 05:24:54 -0700 (PDT)
Received: from localhost.localdomain ([46.56.192.152])
        by smtp.gmail.com with ESMTPSA id a2sm8570792wrt.45.2019.10.05.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 05:24:53 -0700 (PDT)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
        by localhost.localdomain with esmtp (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1iGj9T-0005DT-Js; Sat, 05 Oct 2019 15:27:11 +0300
Date:   Sat, 5 Oct 2019 15:27:11 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
Message-ID: <20191005122711.GC7077@jeknote.loshitsa1.net>
References: <20191005105551.353273-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005105551.353273-1-hdegoede@redhat.com>
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

I confirm this issue and I made similar hotfix while developing of other
things, so it's actual and patch should work. I will test it at my hardware
soon.

-- 
Yauhen Kharuzhy
