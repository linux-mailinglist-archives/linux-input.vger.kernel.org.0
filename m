Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 161AF6AC3B
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 17:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbfGPPwq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 11:52:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43241 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfGPPwp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 11:52:45 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so21499754wru.10;
        Tue, 16 Jul 2019 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CTuBz10dpzRMw27jIFDD0GAWYqxmo2+HWztpyEtT7Cs=;
        b=IE3R3vaJgsC2kQ7mm/cWs5nW1v35kWOV4hUVTPQuXIE+d4R5Sf5WrORLqxvflpIBFn
         mNwrHBBDTbNEwN6JHlCWfnoYR/6XIGeiFaQ5Tnradm0ED1R2+uzVYf9lrz28VXsx4QOl
         56EL6P0C0h4bvC/AZ/J7lfqkcvct94pYaa4qChhAEIMkOdLEMp9KgndoHVCpg/MQrfh5
         P0vm1ZSkOmLR+P/RCbDTkshtwkxp+/SiZKx+V9Gp5+hM+LQdngEiScjqVLog/RnLm2Va
         vgoeR05abVUglf4g4GfQB/IgrpD8bumaaH15aJYroTe3dihe/9QZLcm26qLUav54DmxY
         WA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CTuBz10dpzRMw27jIFDD0GAWYqxmo2+HWztpyEtT7Cs=;
        b=ItoP2UiEwydoYVzcT5nwHzDoLSbBJzkfyp7t690e+HIOLAFmrvFRP5O0UpAYPKp7dT
         G1/pm+m7lcexJS9ivhvWgjG3Grq0Uq9pJfuccwq6gGvKjAW6wESyOL0EYiOrIEXYt/c5
         r7gx6vNdzf3+oVzo4220iaNa6UUMX/09lAfkfb37c7pO1AicwU0GiJGqYYFBqPh7S4Z8
         iQMcBl5o6p7YQSBzyvUwBZE3KSrY9cVBwGh5uHUCL2QkOIWXemcj7tV3uzl8+eauhKKK
         9/gs03oKgex2Mm++o4VJ7mGnvKSoY5ncvRXOvC8lqEcAHQIJZbQhLmwucbqnmxm8mlpC
         GX2g==
X-Gm-Message-State: APjAAAVZYoPmctMRNeGQH9txFVsqfcjuV+Rro7YX2OL1SxyS4fWAB9Gq
        uqoY9GaVpL+Z/+ocOCJc0RA=
X-Google-Smtp-Source: APXvYqwOW/1KCVV68x0nxArTP1dMeAYuDwBqKnARPWDMyfmR+OUSyJXxI0kWG6Ige26KulgfzygtZA==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr38408437wrn.75.1563292363565;
        Tue, 16 Jul 2019 08:52:43 -0700 (PDT)
Received: from localhost (smbhubinfra01.hotspot.hub-one.net. [213.174.99.146])
        by smtp.gmail.com with ESMTPSA id e7sm19973280wmd.0.2019.07.16.08.52.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:52:42 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:21:35 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2 2/2] input: soc_button_array for newer surface devices
Message-ID: <20190716072135.GA806@penguin>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-3-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702003740.75970-3-luzmaximilian@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Maximilian,

On Tue, Jul 02, 2019 at 02:37:40AM +0200, Maximilian Luz wrote:
> Power and volume button support for 5th and 6th genration Microsoft
> Surface devices via soc_button_array.
> 
> Note that these devices use the same MSHW0040 device as on the Surface
> Pro 4, however the implementation is different (GPIOs vs. ACPI
> notifications). Thus some checking is required to ensure we only load
> this driver on the correct devices.

When you are saying that Pro 4 and later models use different
notifications, does this mean that Pro 4 does not define any GPIOs? If
so can we use their presence as indicator whether we should be using
this driver or not. I would like to avoid repeating the ACPI parsing
code that you have in the platform driver.

> +static int soc_device_check_MSHW0040(struct device *dev)
> +{
> +	acpi_handle handle = ACPI_HANDLE(dev);
> +	union acpi_object *result;
> +	u64 oem_platform_rev = 0;
> +	int gpios;
> +
> +	// get OEM platform revision
> +	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
> +					 MSHW0040_DSM_REVISION,
> +					 MSHW0040_DSM_GET_OMPR, NULL,
> +					 ACPI_TYPE_INTEGER);
> +
> +	if (result) {
> +		oem_platform_rev = result->integer.value;
> +		ACPI_FREE(result);
> +	}
> +
> +	if (oem_platform_rev == 0)
> +		return -ENODEV;
> +
> +	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
> +
> +	/*
> +	 * We are _really_ expecting GPIOs here. If we do not get any, this
> +	 * means the GPIO driver has not been loaded yet (which can happen).
> +	 * Try again later.
> +	 */
> +	gpios = gpiod_count(dev, NULL);
> +	if (gpios < 0)
> +		return -EAGAIN;

I do not believe -EAGAIN has any special meaning in the driver core;
also when the GPIO controller is not ready gpiod_get() will return
-EPROBE_DEFER, which is the prober way if signalling that some resource
is not yet available and probe should be retries at a later time.

Moreover, I do not believe that gpiod_count() needs GPIO controller to
be ready, the count is taken from board firmware or static board file
definition, so if gpiod_count() returns 0 it should be clear indication
that the driver should not be used with the device.

Thanks.

-- 
Dmitry
