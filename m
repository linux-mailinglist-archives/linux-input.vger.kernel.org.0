Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EC95FAE3
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2019 17:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbfGDPbq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Jul 2019 11:31:46 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53420 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727510AbfGDPbq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Jul 2019 11:31:46 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so6139222wmj.3;
        Thu, 04 Jul 2019 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=0Xzci8CUbNvBihcDS7Q9xsEhF5+lWnqF471ghR2ZAAM=;
        b=WANhg2KffhIxcHzBZjyQzNGYdvFl+2SSagDh2j/02zvsNp2peZbUbfqc4qS21kj9C8
         VMFE0EQDX2kkO0+qI5ed7PvzZLN+3jzrSnomrGXtq5CRkR/cXdw8gv+4PR22jiUFAf9o
         vDCuzgrqLNLxKWdxO5fP0iT75jJ/8Vuj2yXIhA3rn1lXmZTt1AspV3Txo+SUqMFwLAwt
         olPDG+0YofaP3WwVgBAh/lDjG3t1C8uA9fEe5vkEgeK9/S7OStVSsYkp0q2dE7u3N3se
         IysNLa+zTKtdwCThIs6Cg8bY1OihYtov0umvPzIcslA6JdmsX2zGX1/KQewtbVBFEM6K
         0KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0Xzci8CUbNvBihcDS7Q9xsEhF5+lWnqF471ghR2ZAAM=;
        b=RNWrl67FylJ7u1Md6IpBjEwQKRylYP3YRAVZ/KKZx5B/9SHBOyJgBef7Dnyfp9nMgP
         LIDAx6jJ+FGfem3RV7xlZIbSujFV6fzZmP7xdo73EW7g134PUNc2J58wuKZnlBYZfF9x
         lLF7V/p77yAH5HZUjv93etXWnv+5Hln43CUGGefwXvCqh8yN4EvQ+jfs3k27h46D5NkC
         3nEa8+HWp6xwSwdC1+RHA/DE41x5Ub0jP3cL/IRgd+QN447sPxmj05VUJrIBIlwchdqO
         abAhXil6KlOo9yp4nPba0F8SJTUTSZM0bRcwDbdH61O5f6rsSjXwZPZjicH+Sp94gNkC
         PtmA==
X-Gm-Message-State: APjAAAWh6Puvl4KAZ0xJuZdGRTkxYv7WH4ks0C1ZG4/67PCQKfmyUr8j
        UacDKK3+RB7Z0649i7bB2Sc=
X-Google-Smtp-Source: APXvYqwKPOB3FIvd6N6wGs1Vemf1h6LmBM+18pTf7PrTeGPbG5S2dAolDTJCU+JsvJT2k3EIvYAizg==
X-Received: by 2002:a7b:c04f:: with SMTP id u15mr119524wmc.106.1562254303618;
        Thu, 04 Jul 2019 08:31:43 -0700 (PDT)
Received: from [192.168.2.202] (pD9E5A1AA.dip0.t-ipconnect.de. [217.229.161.170])
        by smtp.gmail.com with ESMTPSA id o6sm10324355wra.27.2019.07.04.08.31.42
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 08:31:42 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] input: soc_button_array for newer surface devices
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-3-luzmaximilian@gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <1d384979-38e8-ccb3-6462-0a8a5380f50d@gmail.com>
Date:   Thu, 4 Jul 2019 17:31:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702003740.75970-3-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/2/19 2:37 AM, Maximilian Luz wrote:
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
> +
> +	return 0;
> +}

Just had another look at this: Shouldn't the EAGAIN here be
EPROBE_DEFER?

The reasoning is that we would want to defer probing of the driver if we
can't get any GPIO pins, since we know that MSHW0040 should have some.
It has in the past been reported that the driver didn't load properly
(without this check), since it could happen that the GPIO subsystem
wasn't quite ready yet when probing.

Best,
Maximilian
