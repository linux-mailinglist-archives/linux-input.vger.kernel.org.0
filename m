Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E8B293047
	for <lists+linux-input@lfdr.de>; Mon, 19 Oct 2020 23:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732531AbgJSVKk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 17:10:40 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34545 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732494AbgJSVKj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 17:10:39 -0400
Received: by mail-oi1-f194.google.com with SMTP id n3so1627635oie.1;
        Mon, 19 Oct 2020 14:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FpDj5S1NbFYS183yHRNUUwzCqf0P6so5/78tjznMYSk=;
        b=IbGdQERm3bTvydJha4Pg54j4PMKTL73puTQbP1KXw8EGG5ytzSszvuxBGTX7aZIvUj
         ZRR7kByoos0doj2iV/arb8r4GJGfF/oyqR1xdPjGTt0JSXDgytmkl9knIo9wQD73E8rC
         VIckioByn5RR6d7nRjK/oV6pcQZbuAWStR4FLLf6cNsF/RnXgWmJCJhRniXLuWG903x7
         4xEdiLRnyOxqIgNJq8DZZ0ypEPFCZkliTefAwqfXaxMhgQ9VBiLeYt/uCdAZj4q8yStH
         apzVgskjX3oqanY6s0fW5QjrWruGFEvrluI3GO7HzEIS6PQ6pFDK7C1g6DZQUWK6MV3G
         tT8Q==
X-Gm-Message-State: AOAM530WRpHEK4kQPPgshu18f/D2PuCWMt5tarnHbFw8tWRxW5uIIrs1
        lOcM7di4M43M/awuBwR9Hw==
X-Google-Smtp-Source: ABdhPJxb5npcxziETbsPtNHP5eUrg/+0WitaVJtMzin8DRz/8eu7/t7IaelXqvH49BtatmMaiZNBiw==
X-Received: by 2002:aca:378a:: with SMTP id e132mr901687oia.112.1603141837524;
        Mon, 19 Oct 2020 14:10:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n12sm309124oor.7.2020.10.19.14.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 14:10:36 -0700 (PDT)
Received: (nullmailer pid 3607722 invoked by uid 1000);
        Mon, 19 Oct 2020 21:10:36 -0000
Date:   Mon, 19 Oct 2020 16:10:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, hdegoede@redhat.com,
        andrea@borgia.bo.it, swboyd@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: HID: i2c-hid: Add the ability to
 control a reset GPIO
Message-ID: <20201019211036.GA3595039@bogus>
References: <20201014164203.1.I1c2d6236990449717b861539a2234354153b1656@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014164203.1.I1c2d6236990449717b861539a2234354153b1656@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 14, 2020 at 04:42:20PM -0700, Douglas Anderson wrote:
> Apparently some devices connected via i2c-hid have timing requirements
> around when a reset GPIO should be asserted to them.  The diagram I
> have seen, which I believe is from a Goodix device, looked like this:
> 
>          +----------------------------------
>          |
> AVDD ----+
>                +------------------------------
>          | (a) |
> RESET ---------+
>                      +-------------
>                | (b) |
> I2C comm OK ---------+
> 
> Where (a) is 10 ms and (b) is 120 ms.
> 
> Let's add the ability to specify these timings to the devicetree
> bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I notice this bindings file is still a ".txt" file.  Some searching on
> The Internets(TM) shows that Rob has maybe started a conversion 5
> years ago [1], but that looks ancient.  I can try to put something
> together if need be, or we can just land this fix.  ;-)

That was attempt number 1 using YAML...

> Note that the .txt version of the bindings seems to indicate that
> anyone using one of the optional properties is supposed to declare
> their special compatible string.  I'm not sure if that's still
> considered important or not?  Once you manage to get these devices
> powered on and talking i2c they self-describe themselves...

This change is exactly why devices should have specific compatible 
strings.

> 
> [1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/robh/linux/+/refs/heads/dt-yaml/Documentation/devicetree/bindings/hid/hid-over-i2c.yaml
> 
>  Documentation/devicetree/bindings/input/hid-over-i2c.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> index c76bafaf98d2..6fca39aa8cc6 100644
> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> @@ -32,6 +32,11 @@ device-specific compatible properties, which should be used in addition to the
>  - vdd-supply: phandle of the regulator that provides the supply voltage.
>  - post-power-on-delay-ms: time required by the device after enabling its regulators
>    or powering it on, before it is ready for communication.
> +- reset-gpios: GPIOs to assert to reset the device. This GPIO is asserted when
> +  the device is powered off and released post-power-on-delay-ms after
> +  enabling the regulators.
> +- post-gpio-reset-delay-ms: After deasserting reset we'll delay for this many
> +  more milliseconds.

IMO, you should imply this from the compatible string.

Rob
