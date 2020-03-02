Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9398175F77
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 17:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCBQX1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 11:23:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39954 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727092AbgCBQX1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 11:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583166206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v/zHWC8EXmQLTYU9IBrVYAmcdQjWBoM8pvvL8td13lk=;
        b=AYkYP/aveEks4O04LHVmYNJes5Hro0GzCmZ9jjX4qvmeaHev64DGxB11JFu17N3wSXj8ll
        grEbSnt+gqmvBBJiIw27JS5lSVK1I2wEqw/F0PVvmdN+i05XcnKPMiSiFMWyncttdjZYC+
        gOSLtqrnXsLtbVCFYWvSp5PxiJ7SaTU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-GqlCTfgwNh-N5517KD522w-1; Mon, 02 Mar 2020 11:23:25 -0500
X-MC-Unique: GqlCTfgwNh-N5517KD522w-1
Received: by mail-wr1-f72.google.com with SMTP id n12so6006408wrp.19
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 08:23:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v/zHWC8EXmQLTYU9IBrVYAmcdQjWBoM8pvvL8td13lk=;
        b=M/z65o5RePLE+235/HlMr/9AbqgiF3lqIS3DEFuaddGrUUCht9Ag5QMTxatGfP/b5T
         HiNOkItwC2s9zb7SBa/8p/Vf2BTYMNQ63xS/VCRXNz2JXdBinZC/YmEfdxVh0/EgWwZy
         RuoXw6yqa7PXhaN64WA43XNtKC2y4gjNXw2HToyOdQQ4JVnXouzxcXMwuA2HGtfTdE+o
         3vDhZ4sSIXQtZUKJqZkYgxSgua4ar2Fqn17X3eC0WG0qjsHTDl86SAihWFNT6uovaL1F
         OOp0FvCfDA5tEkJxrhyoOYds5W7+edRWlY2fsYB5UdDMslHnm9egYszJyak6DdJL4T37
         8+Vw==
X-Gm-Message-State: ANhLgQ2KVVcxV0SdnSTZevEcljS035Y8KWIsZOtuHIC6v0NnfTWNbKmm
        tLhsuytURJrt23NPPa4NBY/03N/PlQI/uM3qYJZKF06XZYhZbKq/55rI7pkpuuAHrTwchzdXmNF
        +bBsqQyllVI6jKxiwkExfjNo=
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr333920wrw.319.1583166204003;
        Mon, 02 Mar 2020 08:23:24 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtE8ao+fyFWbLD2HXlu/wd+IsMxnPeLB5oC/IQp8TSTZB8jrLRGEYbSTlFT1UWRLNb2QD/VaA==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr333895wrw.319.1583166203774;
        Mon, 02 Mar 2020 08:23:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id z131sm8352286wmg.25.2020.03.02.08.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 08:23:22 -0800 (PST)
Subject: Re: [PATCH resend 04/10] Input: goodix - Add support for getting IRQ
 + reset GPIOs on Cherry Trail devices
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
 <20200221164735.508324-4-hdegoede@redhat.com>
 <d387bb62dee39cb16bb27371c1e5764cb856c6b5.camel@hadess.net>
 <1b90d2d4-5cf4-3017-9e06-6a9187a73ca5@redhat.com>
 <156a1f5fb89ccb8108d54376b45de6af93525368.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fc75931c-743b-460e-c292-da6bf4a598b9@redhat.com>
Date:   Mon, 2 Mar 2020 17:23:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <156a1f5fb89ccb8108d54376b45de6af93525368.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/2/20 4:44 PM, Bastien Nocera wrote:
> On Mon, 2020-03-02 at 16:40 +0100, Hans de Goede wrote:
>>> Does this mean we retry at most once?
>>
>>
>> Yes, we are not really "retrying", we are doing a 2 step
>>
>> probe:
>>
>>
>>
>> 1) First try to get the GPIOs without having done our heuristics and
>>
>> without having called devm_acpi_dev_add_driver_gpios(). This is for
>>
>> ACPI platforms extra GPIO info (including names) using the special
>>
>> ACPI "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID method.
>>
>>
>>
>> 2) If this fails then we add our own name to index mappings and
>>
>> get the GPIOs using those.
> 
> Is there a better way to communicate that? Using a separate function
> for that piece of code,

The code adding our own mappings already is in a separate function, that
is what the goodix_add_acpi_gpio_mappings function is for.

> and maybe some comments to clarify what it's
> doing.

I will add a comment above the goodix_add_acpi_gpio_mappings function
explaining that it is used to add our own mappings if the ACPI
tables do not contain GPIO-name to ACPI resource index mappings.

Regards,

Hans

