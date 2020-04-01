Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCB419AEF6
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 17:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733008AbgDAPmh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 11:42:37 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34752 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732849AbgDAPmh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 11:42:37 -0400
Received: by mail-lf1-f66.google.com with SMTP id e7so83571lfq.1;
        Wed, 01 Apr 2020 08:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rwYmNt1B+2fK1+Xh2NPinOO5KUe4mhrRIznaib/EfMg=;
        b=Y3Js6eXF9aPtBwKRx4CF6yoG7XPUvxIs1onRHVSg2ANldL7UJE5IgbRr/vWaAtSr1l
         2NL5pOcIti8aOu3RtivgNlx30kppI6qB0/lTgRzKGAVZKXdsi/td9AKeImyzJhHOi220
         BoaE7DsemJF71eYQs5K4jVv0B21GZIlvgItUCjAEzIqQxmUzEA56sEG6mF9FKZCGFIaP
         8FTjqVQxLSJmAeTvu43DS2RrxenRI+tYjMTm6jRlqYzhnMNGIyR86CxDz+5Xzle868Hz
         QO3DkERjnL4MuusotxoL4ZN3qCw+bxN0otaIkHe4eoqxxPWuN8VkNjvEYUrKoy/udSTX
         DX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rwYmNt1B+2fK1+Xh2NPinOO5KUe4mhrRIznaib/EfMg=;
        b=VfESvvWcngloYOeXtDk9gKGp3Y7+ICqUqtMxQhOxjcj7edz7oMDjDRESsn+CmqDmT5
         tpeiHPp8+Kz37ZV+zf88Qi7f8uRZDS0nqUZCrOGb+/yTDaaDux2CIlk8pk7hw9UtJzj3
         ijKEaneZtP/N1hDp5Za2XAuZaIoFWF8xsYsiwat6+yVlU2SdMvbwLA5fiRVBkS8iAPWH
         v9UgDeTtYV5CNRszMM9iD27nZusc/xIaVw9I/TOFIRRcIAdDKJV8McRms5M/0Fy/w151
         3ofB/4rmeQTw32XJc0QzmqwcBae2KCZoRloqCLBW2Crgc1/BeBKRaG4FriMG1lyRmK+u
         yDhQ==
X-Gm-Message-State: AGi0PuYvGkD48U0QC4qAbsN4XdSU6xPHcowHHQkguIHfU3Z4sP5sRqJa
        C2G8fdcewXe6v1Tj0xVCz7wIiM+h
X-Google-Smtp-Source: APiQypLe+ML5z/4pDUursC0w5UC6wEdRQL6lOHiqGJx2G3SbCb4Wu7EjiUrvWFtEl3G2xu7jSdfdJA==
X-Received: by 2002:ac2:4987:: with SMTP id f7mr15374978lfl.207.1585755755150;
        Wed, 01 Apr 2020 08:42:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id y20sm1508225ljy.100.2020.04.01.08.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 08:42:34 -0700 (PDT)
Subject: Re: [PATCH v10 13/55] dt-bindings: input: atmel: add suspend mode
 support
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-14-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd09ab5d-4e33-7ca0-9dfe-80be1cee307f@gmail.com>
Date:   Wed, 1 Apr 2020 18:42:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331105051.58896-14-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.03.2020 13:50, Jiada Wang пишет:
> Add suspend mode support for atmel touchscreen driver
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  .../bindings/input/atmel,maxtouch.txt         |  9 ++++++++
>  MAINTAINERS                                   |  1 +
>  include/dt-bindings/input/atmel_mxt_ts.h      | 23 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h
> 
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> index c88919480d37..0307e7f7bb43 100644
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> @@ -31,6 +31,15 @@ Optional properties for main touchpad device:
>  
>  - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
>  
> +- atmel,suspend-mode: Select method used to suspend:
> +    MXT_SUSPEND_DEEP_SLEEP - use T7 to suspend the device into deep sleep
> +    MXT_SUSPEND_T9_CTRL - use T9.CTRL to turn off touch processing
> +    MXT_SUSPEND_REGULATOR - use regulators to power down device during suspend
> +    Definitions are in <dt-bindings/input/atmel_mxt_ts.h>.
> +
> +- vdd: Required supply regulator when MXT_SUSPEND_REGULATOR is used to suspend
> +- avdd: Required supply regulator when MXT_SUSPEND_REGULATOR is used to suspend

Some of NVIDIA Tegra devices have a VDD regulator in a form of GPIO,
which is turned off by default at a boot time, and thus, the
power-regulator needs to be enabled by the driver at a probe time in
order to power-up the touchscreen.

I think the VDD/AVDD description isn't correct because these are the
essential power regulators, they aren't used only for the suspending.

What about something more generic, like this:

- vdd: phandle to Power supply regulator
- avdd: phandle to Analog Power supply regulator
