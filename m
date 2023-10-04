Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D84057B823D
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 16:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbjJDO1Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 10:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbjJDO1Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 10:27:25 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C022AB
        for <linux-input@vger.kernel.org>; Wed,  4 Oct 2023 07:27:22 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-65b0c9fb673so12340456d6.1
        for <linux-input@vger.kernel.org>; Wed, 04 Oct 2023 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696429641; x=1697034441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw5LudE6hp4/PRxUfr3HQoT112bFsoTa2Q5BrRFJt/I=;
        b=SJgUGrYfyagRyUih7cO62VcEm3w9zDGOySep4tMhfPAWKyg1ALR1tDyEKgZFkc8hom
         sFyeoMJtGNBrANohkU0Bnevk7Gs2GxcDvwq+krRZUFBZJ68EcPnE7heRn/Av1izl4dht
         IgTDvEyv8EbIYChDEC71SOHHD4EabFaWXHe532HwVRW7j6j597F7NwPXt364dn2szEwW
         edvoCFzBY/V3Rj7CItaszkIIUn6jnvQuzjrN+BpxSNIRes1U+9Q4IDb/pzUX8SG8bHvg
         43tEDtOUfI7HspE5e4TZ9EXxnXfj1AYl+zWcEMjO3cUIsijdgZedqFAS8P/nhW8aBMp0
         KEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696429641; x=1697034441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw5LudE6hp4/PRxUfr3HQoT112bFsoTa2Q5BrRFJt/I=;
        b=pC1rAyPJ3S/wnJpWz1T34iMnrQQgqzoJQ7QC0q+73ngG5EiJzIPLuimFnAZYvZRmJU
         ucwhS4J+m2DjxR1qajBsMG1RS6zmv8TzCXa4yEzzDNYW0mYfsITqs1tViHob+xo5Jt/6
         6a843EBpSvrBWJw6CLve4+BhdauRr2rDJBZnhkZfcZe1wLZeR2A0BJTam01/aeHHB2dU
         Zz24qVFT7/GQZeSWIptJJNQcQU27aT9vIyW+J8qui9tSCbRv8EU+qGHKvhkuxMGWpS+7
         9afRfwt9G/E2hAUaq2JybRZpNSb48W5je06HpG6d4SL5PrYPa2UcAk4q9dYfmfG/pHE6
         /sAg==
X-Gm-Message-State: AOJu0YzFQNxOO9O3Rnos8igXGeEPJp/E0prJUTekIkYB3mWnZTs8onYS
        tuMyyl9ms+bABi/BmTsuk1o=
X-Google-Smtp-Source: AGHT+IGycFnMPxoGdp0FOR38PmVWJWeTI14KTPH5Cdf2S0cnw+UKjNQo7t2VFPCV9vspQQKqJJZ7mA==
X-Received: by 2002:ad4:5763:0:b0:64a:7da3:a700 with SMTP id r3-20020ad45763000000b0064a7da3a700mr3422036qvx.20.1696429641035;
        Wed, 04 Oct 2023 07:27:21 -0700 (PDT)
Received: from penguin ([205.220.129.20])
        by smtp.gmail.com with ESMTPSA id x16-20020a0cda10000000b0065afbb39b2dsm1363747qvj.47.2023.10.04.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:27:20 -0700 (PDT)
Date:   Wed, 4 Oct 2023 07:26:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Michael Smith <1973.mjsmith@gmail.com>
Subject: Re: [PATCH] Input: goodix - Ensure int GPIO is in input for
 gpio_count == 1 && gpio_int_idx == 0 case
Message-ID: <ZR12KRzgr/L6M2RK@penguin>
References: <20231003215144.69527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003215144.69527-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 03, 2023 at 11:51:44PM +0200, Hans de Goede wrote:
> Add a special case for gpio_count == 1 && gpio_int_idx == 0 to
> goodix_add_acpi_gpio_mappings().
> 
> It seems that on newer x86/ACPI devices the reset and irq GPIOs are no
> longer listed as GPIO resources instead there is only 1 GpioInt resource
> and _PS0 does the whole reset sequence for us.
> 
> This means that we must call acpi_device_fix_up_power() on these devices
> to ensure that the chip is reset before we try to use it.
> 
> This part was already fixed in commit 3de93e6ed2df ("Input: goodix - call
> acpi_device_fix_up_power() in some cases") by adding a call to
> acpi_device_fix_up_power() to the generic "Unexpected ACPI resources"
> catch all.
> 
> But it turns out that this case on some hw needs some more special
> handling. Specifically the firmware may bootup with the IRQ pin in
> output mode. The reset sequence from ACPI _PS0 (executed by
> acpi_device_fix_up_power()) should put the pin in input mode,
> but the GPIO subsystem has cached the direction at bootup, causing
> request_irq() to fail due to gpiochip_lock_as_irq() failure:
> 
> [    9.119864] Goodix-TS i2c-GDIX1002:00: Unexpected ACPI resources: gpio_count 1, gpio_int_idx 0
> [    9.317443] Goodix-TS i2c-GDIX1002:00: ID 911, version: 1060
> [    9.321902] input: Goodix Capacitive TouchScreen as /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-5/i2c-GDIX1002:00/input/input8
> [    9.327840] gpio gpiochip0: (INT3453:00): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
> [    9.327856] gpio gpiochip0: (INT3453:00): unable to lock HW IRQ 26 for IRQ
> [    9.327861] genirq: Failed to request resources for GDIX1002:00 (irq 131) on irqchip intel-gpio
> [    9.327912] Goodix-TS i2c-GDIX1002:00: request IRQ failed: -5
> 
> Fix this by adding a special case for gpio_count == 1 && gpio_int_idx == 0
> which adds an ACPI GPIO lookup table for the int GPIO even though we cannot
> use it for reset purposes (as there is no reset GPIO).
> 
> Adding the lookup will make the gpiod_int = gpiod_get(..., GPIOD_IN) call
> succeed, which will explicitly set the direction to input fixing the issue.
> 
> Note this re-uses the acpi_goodix_int_first_gpios[] lookup table, since
> there is only 1 GPIO in the ACPI resources the reset entry in that
> lookup table will amount to a no-op.
> 
> Reported-and-tested-by: Michael Smith <1973.mjsmith@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
