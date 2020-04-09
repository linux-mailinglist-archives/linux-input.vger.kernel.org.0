Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24DD01A3B86
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 22:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgDIUsX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 16:48:23 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36024 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgDIUsW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 16:48:22 -0400
Received: by mail-pj1-f66.google.com with SMTP id nu11so1763611pjb.1;
        Thu, 09 Apr 2020 13:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Yq49Nu++9i3zAXXAfzhjx/M1svNPVbcVpmDhc428p6Y=;
        b=UvB8ZTZ63yO4h619p7pJUHFX2LYYElGo+ZrAVp1iZAoYKRKm38FfNX3baVWKtj+UGE
         lf6Wl7iPAGDDwcb03GD4OVvW6vivoOx8sqTDEOSCaq8xSxzrm5ogqUmJKVp4sW6PBT5F
         eFxHERpC1wLw5ugHBupA1DGIr/HBK13edgGepM6jS87ZfGvlqO+nGsOlSmak0s+XjXBJ
         d7SOmSIK97jye6VkO1CvmByeIiwoK7IBSr5QnNgnUc3Ak1E7Ok3g5oVjlQRQLNtbl++O
         odG8bGBbKHioOmjbgwpQAy55AM1xWQB1GXqmlqov9tOZLlWboW5/6/pKJomRsV8kUCvZ
         dtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Yq49Nu++9i3zAXXAfzhjx/M1svNPVbcVpmDhc428p6Y=;
        b=MzKTi1dCuRYIaDqJNzdXBMkwFLXZUH1TCwTtui+v1CEpJOq+2jGUWk2VroGbOduetV
         ftIX3hzwYxPqoEBhDjGIFH2IwqXsFmoTK3z+dNC1lXbW7/Lmlq2uCHuLWou2hytVtAWr
         2tJKNom8CYFgN4OJDHYmTH0g8N/Y6/d1C7R74mLWJXtPRDObSLpmRJcbvX5loVnRDK9D
         bTUQ0QPpsFJEYigKnn7Jw8cU2nHjD4TD9E2nIux9eEP7CtJc5Q9x1CH77A5OpGeQO6Iz
         /NgIS+K8YWo+e0p4+NcjSKC+YQzhb0zRcFzGKZF4HZ1Ke7FDz6rU/LippA2A409ldsNq
         7aZg==
X-Gm-Message-State: AGi0PuYXvhBwBgYZ4go+mh6FJi1KilrE4vOmt0v3ikNvzljKxQ+orL76
        1krf103RHNkBNbcdtRbz6+8=
X-Google-Smtp-Source: APiQypIFh/iHLVwKUI5JspshlUj/HlEIvFYdhLH0oeNMqqYs0gq049IClzpw4xbqJQ4ciMOEfTv39Q==
X-Received: by 2002:a17:902:107:: with SMTP id 7mr1391190plb.302.1586465301762;
        Thu, 09 Apr 2020 13:48:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id u13sm10854pgp.49.2020.04.09.13.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:48:21 -0700 (PDT)
Date:   Thu, 9 Apr 2020 13:48:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-input@vger.kernel.org, Allison Randal <allison@lohutok.net>,
        Arnd Bergmann <arnd@arndb.de>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Olof Johansson <olof@lixom.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: Input: ep93xx_keypad: Checking for a failed platform_get_irq()
 call in ep93xx_keypad_probe()
Message-ID: <20200409204819.GR75430@dtor-ws>
References: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Markus,

On Wed, Apr 08, 2020 at 06:52:31PM +0200, Markus Elfring wrote:
> Hello,
> 
> I have taken another look at the implementation of the function “ep93xx_keypad_probe”.
> A software analysis approach points the following source code out for
> further development considerations.
> https://elixir.bootlin.com/linux/v5.6.3/source/drivers/input/keyboard/ep93xx_keypad.c#L252
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/keyboard/ep93xx_keypad.c?id=f5e94d10e4c468357019e5c28d48499f677b284f#n252
> 
>  	keypad->irq = platform_get_irq(pdev, 0);
>  	if (!keypad->irq) {
>  		err = -ENXIO;
>  		goto failed_free;
>  	}
> 
> 
> The software documentation is providing the following information
> for the used programming interface.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c?id=f5e94d10e4c468357019e5c28d48499f677b284f#n221
> https://elixir.bootlin.com/linux/v5.6.3/source/drivers/base/platform.c#L202
> 
> “…
>  * Return: IRQ number on success, negative error number on failure.
> …”
> 
> Would you like to reconsider the shown condition check?

Platform code historically allowed creating IRQ resources with IRQ
number 0 to indicate "no interrupt assigned", so this driver tries to
filter out such conditions. The negative IRQs (errors) will be rejected
by request_irq() but I guess we can lose -EPROBE_DEFER. We could do

	if (keypad->irq <= 0) {
		err = keypad->irq ?: -ENXIO : keypad->irq;
		goto failed_free;
	}


or, maybe we should take a look at platform_get_irq() and see if we can
stop it returning 0 interrupt numbers and clean up the drivers.

Thanks.

-- 
Dmitry
