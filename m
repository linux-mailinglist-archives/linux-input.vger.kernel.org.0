Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9F227A095
	for <lists+linux-input@lfdr.de>; Sun, 27 Sep 2020 13:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgI0LMy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Sep 2020 07:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37847 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726265AbgI0LMy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Sep 2020 07:12:54 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601205172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=grNRHn8J14/DqTRAmM7aKq7BCmqssKY/pLOK1/sHVHE=;
        b=Ih/e+5ZWPLEbiPD71rtoKQ9WnwTv9lUYYdZf0KPjlqjPC10XFMArxmWhuZy6ThWrO8MaFD
        ClF0UaoKrvmCUDmbn34HDKqVb2NJyuKZrQz+qE7SaV5+cUv4VYHavmbVt3FR/vLTOpecXa
        WlUV118gbeE17QpQSO3IyM0FU6VZPwU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-OgQfDBPCOECoVI9fwpj32Q-1; Sun, 27 Sep 2020 07:12:50 -0400
X-MC-Unique: OgQfDBPCOECoVI9fwpj32Q-1
Received: by mail-ed1-f69.google.com with SMTP id c3so3138136eds.6
        for <linux-input@vger.kernel.org>; Sun, 27 Sep 2020 04:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=grNRHn8J14/DqTRAmM7aKq7BCmqssKY/pLOK1/sHVHE=;
        b=gDb6M7hbc4eFEd8mzA/kQ+/KUPg72lJ97VOkCEkw4VevXloYtfP5oZ1ed90s8dXKpZ
         OeIyTp4iOMrgzfHNDQFnuU2nrrBkoG4nP9iiM8ub8kMR1ulThfeXBIn5eor3nSAS3jVA
         sLZ8kzx3z8XeizOJgeD54qGPvEt4/BGiLARL6dsVggFj2CAsDrIwO733dUzw9hb8wK+4
         Hh9aiXD/VLVDCGfLflvsWaDKqSbzFhlN6xu+0kDPRMtlMKE90v9NHO+/QlkcHcTBCIQT
         ufu7bJsbLKaoB5L/NB//MeK9uxpECv57BUdqVL/efq+V25iQmGB3EFuazPwlMajHq1CA
         SFmA==
X-Gm-Message-State: AOAM532mS1nrTEiGPmx25/qXvWB+YEnThSfep/O4Lnm6H45NG8kM0MKH
        RLDVKraovq15RSftjDviWIdLs4a4rOEau+EEsnFX8nO8Qq4UDbG0nFurwqPzWvESQG1qqgRylsf
        Ek3rMtOj1NFnK2u4sAKEwFpg=
X-Received: by 2002:a05:6402:16c9:: with SMTP id r9mr10449394edx.27.1601205168821;
        Sun, 27 Sep 2020 04:12:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySeeuO8FyXe7xU8cNB6VWElLHoV4AEfMELKyWrzNGbfZTKaQiaMrJTknuPLGC/Z7v59DDJxA==
X-Received: by 2002:a05:6402:16c9:: with SMTP id r9mr10449380edx.27.1601205168602;
        Sun, 27 Sep 2020 04:12:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q13sm6920852edr.27.2020.09.27.04.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2020 04:12:47 -0700 (PDT)
Subject: Re: [PATCH 0/3] Add support for F3A
To:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
References: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <05140fb1-19a5-d740-2c57-e39e450142ec@redhat.com>
Date:   Sun, 27 Sep 2020 13:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 9/24/20 11:46 AM, Vincent Huang wrote:
> RMI4 F3A supports the touchpad GPIO function, it's designed to support
> more GPIOs and used on newer touchpads. The patches add support of
> touchpad buttons and rename f30_data to avoid confusion.

Thank you for the patch. So as already mentioned patches 1 and 2
need to be combined into a single patch.

Otherwise the patches look good to me and I can confirm that
they fix clickpad clicks not registering when using rmi4 for the touchpad
on the Lenovo T14 gen 1.

So for version 2 (with patches 1 and 2 combined into a single patch)
you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> 
> Vincent Huang (3):
>    Input: synaptics-rmi4 - rename f30_data to gpio_data
>    HID: rmi - rename f30_data to gpio_data
>    Input: synaptics-rmi4 - add support for F3A
> 
>   drivers/hid/hid-rmi.c           |   2 +-
>   drivers/input/mouse/synaptics.c |   2 +-
>   drivers/input/rmi4/Kconfig      |   8 ++
>   drivers/input/rmi4/Makefile     |   1 +
>   drivers/input/rmi4/rmi_bus.c    |   3 +
>   drivers/input/rmi4/rmi_driver.h |   1 +
>   drivers/input/rmi4/rmi_f30.c    |  14 +-
>   drivers/input/rmi4/rmi_f3a.c    | 241 ++++++++++++++++++++++++++++++++
>   include/linux/rmi.h             |  11 +-
>   9 files changed, 269 insertions(+), 14 deletions(-)
>   create mode 100644 drivers/input/rmi4/rmi_f3a.c
> 

