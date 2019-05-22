Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDF82617B
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 12:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbfEVKMu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 06:12:50 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35874 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfEVKMu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 06:12:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id a8so3054718edx.3
        for <linux-input@vger.kernel.org>; Wed, 22 May 2019 03:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UOism6/WliJKlizbO03ANyTQDbU6zepiLVCCA7yr4no=;
        b=U7PCgHI5l0cmg/lSheHxV1T8pIhMbFcf4ij4T3hLIwr6+PyI8or6JmErL6HExBsUe6
         gM+9GhYju7Gt+UCCOdEENm/ZmHZwBzlvZ/eKLrxljFMUrcWBx5FF6k5DFlF4ZDgh8NOz
         pi5K40aOHLiAypc6rjsOCZv24QhEhN+FxoeKunx1zBSFUf5Zj4nl/biGdOsPVY9VxOUJ
         i7NFQ9L2/qe0NQBuXQt2rR1Jzk3sM8OPDSxs2pxc71sUcS+kO7XvzvyjtmznLqyhxObl
         lyzceRZtEErAIVYYWDPQjJg6MMNzyu8NjUGuAYHgN/IPyH6P0iGoY6bfGTp86PswZ8EY
         IwXw==
X-Gm-Message-State: APjAAAX35ye8K+PyoRDV+HISdBKf6c7C+uQTdOztIJtKq9YSQEXLXAP9
        8SR9xySG2qXTbek/0dwIoeFjhQ==
X-Google-Smtp-Source: APXvYqzNhVaVxR8CohHDUn6M+ULJOxCah+OGJx2vJUGm8rsFFDe+YEXiuua+IT83U0iTKfsg0KunhA==
X-Received: by 2002:a17:906:6c1:: with SMTP id v1mr13388705ejb.266.1558519969205;
        Wed, 22 May 2019 03:12:49 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id u1sm2617873ejz.92.2019.05.22.03.12.48
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 03:12:48 -0700 (PDT)
Subject: Re: [PATCH] input: silead: Add MSSL0017 to acpi_device_id.
To:     Danct12 <danct12@disroot.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190522045455.15769-1-danct12@disroot.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c18472f-bedd-6e6d-121c-8a311495c3c3@redhat.com>
Date:   Wed, 22 May 2019 12:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522045455.15769-1-danct12@disroot.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 22-05-19 06:54, Danct12 wrote:
> On Chuwi Hi10 Plus, the Silead device id is MSSL0017.
> 
> Signed-off-by: Danct12 <danct12@disroot.org>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/input/touchscreen/silead.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 09241d4cdebc..06f0eb04a8fd 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -617,6 +617,7 @@ static const struct acpi_device_id silead_ts_acpi_match[] = {
>   	{ "MSSL1680", 0 },
>   	{ "MSSL0001", 0 },
>   	{ "MSSL0002", 0 },
> +	{ "MSSL0017", 0 },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, silead_ts_acpi_match);
> 
