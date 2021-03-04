Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2626C32D592
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 15:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhCDOlY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 09:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55188 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232146AbhCDOk4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 09:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614868771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YeI6QVqkyPzlDneIoONGdEk8YS3pU6UwxyPDkx6WF8w=;
        b=VO7dnC9EiiKJRjZAtZV6waR+3Qm/mLwg3XEQmkOwPuEeXe5zApEgZkAiX/HcLLLzlT09iQ
        3P2PbP2Y355BBv6eLp/XjfjEpLXLar3VhUmG1dpZWQ9FB0f6IIqTrPpYjp2IsVxYKhistg
        Wf/PMLGxL1kKBmxcIgY8ag0W17dCJ4E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-T-tXRlYBPkurcUH15oP7vQ-1; Thu, 04 Mar 2021 09:39:29 -0500
X-MC-Unique: T-tXRlYBPkurcUH15oP7vQ-1
Received: by mail-ej1-f72.google.com with SMTP id fy8so7303666ejb.19
        for <linux-input@vger.kernel.org>; Thu, 04 Mar 2021 06:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YeI6QVqkyPzlDneIoONGdEk8YS3pU6UwxyPDkx6WF8w=;
        b=shbAjL7bFuNjfhlYaYCf4glFtH7SXz5F1LpDJAoQ+tsOUbRJ6erMGX7HMolLGkRTHC
         dnTVkKP526sbN6bKYQwf2L+bVUdEfqmNUC35BeBMaUkFHUJlJydVXXPjH0zo29ku7suM
         POLgVccX+BbipN3ZQdxpHOHJBpKIck2a9Hj7USE7FfPPPkc8nKQIS7l6Ed2VZGbADULO
         QPlXuBx/9o22nxEPIAgwcCGxyU8cUbutw3u/xnAKa+vihe/3Vax1ZIHkoXQtKZGJ1Wjg
         OuQDamD8cJJE/Djkf+Y4MUJQw+VfJOpts+hWZv2rEAziG/jDrFRlJT/Gwta10bKD4WYZ
         6BfQ==
X-Gm-Message-State: AOAM533PIlnPkxuLA/mNiGdlhcFQI6k2kE0UmsA5Uv/SwQ8m4lRDUjsR
        Mnd6bPJeImacpowou1xxS46m6vqJZx9zFJ6EofFEN9CcC8q6y5pc4LphMkiETWQap29XK5Vuiw7
        gnmT91DXfX+WtUltm47omTA4=
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr4591240ejb.359.1614868768016;
        Thu, 04 Mar 2021 06:39:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy11/QudyVeoNft6ZYg7MKckI/1nBzMHtbfeqLfhy/toGFI5OlBPYK91MTO7BEHOCQe6YfuqQ==
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr4591126ejb.359.1614868766778;
        Thu, 04 Mar 2021 06:39:26 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m7sm24180154ejk.52.2021.03.04.06.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 06:39:26 -0800 (PST)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Handle device properties
 with software node API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210304082023.17689-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <059af9be-46c3-11ee-a9ff-3384e307ed58@redhat.com>
Date:   Thu, 4 Mar 2021 15:39:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304082023.17689-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/4/21 9:20 AM, Heikki Krogerus wrote:
> The old device property API (device_add_properties()) is
> going to be removed. Replacing the it with the software node
> API equivalent, device_create_managed_software_node().
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/touchscreen_dmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index c44a6e8dceb8c..45203e333f578 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1355,7 +1355,7 @@ static void ts_dmi_add_props(struct i2c_client *client)
>  
>  	if (has_acpi_companion(dev) &&
>  	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> -		error = device_add_properties(dev, ts_data->properties);
> +		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
>  		if (error)
>  			dev_err(dev, "failed to add properties: %d\n", error);
>  	}
> 

