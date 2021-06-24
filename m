Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA2A3B2EBA
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 14:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhFXMTN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 08:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38389 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229448AbhFXMTN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 08:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624537013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4h+BAFa0OuDxh7u4cxtncNn58n/8Wt0f7xIn6SEXux4=;
        b=SPbGpYzXMMYZ2FHnPGsX1YEO7D41BJFVD2MRdu3uICdddMT76MZiHv7tFRQwAo+EGPcWAI
        wGBYZrifC1YoPRyolPk826doGdaMI/CK/eVHMKPDmonHepIUwPQgzMTnRtq8IvqTtSxJfK
        Vas7kdfxZ9XPXW4mBEy+DziZ3Tx1o00=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-DhdU_u0UNaC_tC6vEqP4LQ-1; Thu, 24 Jun 2021 08:16:52 -0400
X-MC-Unique: DhdU_u0UNaC_tC6vEqP4LQ-1
Received: by mail-wm1-f72.google.com with SMTP id s80-20020a1ca9530000b02901cff732fde5so1578099wme.6
        for <linux-input@vger.kernel.org>; Thu, 24 Jun 2021 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4h+BAFa0OuDxh7u4cxtncNn58n/8Wt0f7xIn6SEXux4=;
        b=lxvlBd93wEmVAkX839PW+IQIFRL62+6qxAlijgLigBNyAkksmwwqIWINDE1kJRSo8c
         lnqktY742Od0NHdUGsfRYogRj35ghixQsP3Wr7xZk3iyPxgbtTY+kPgrTRSdIXhPgm5L
         05nk+cuxNNI+L2OPKDUdYLLAbUXEmK6MmmkwA6E2MTSx/hYreoS46m8aXls3lpK+VUou
         uA2/ysrs4l6V2o0J9IN/pait4Y7CPWgFpBgnzIQ5g+0Lm6om/fjSNhwXmyFJtsyvxxjf
         cAexcJXBPJk9swo5cqlE5zTktq7Odo4V29rSM2NRDR4nQJN8ooyxMU+raQtvMgNYQJLG
         TpTA==
X-Gm-Message-State: AOAM531l+QNdYw/wKOCSHCXqMuNlP6KqMxZQdhpWpMSN5Y8qDQ7u8pLu
        yGi6Y7+GEObzw05HgG11HdEpnmYZkskxq29xMRibf37mYU7QumZ4wrh9q0N8T+yjRZiEnEsQXFU
        v1nqt1DnlQwCkkP1bSPbAe5Es1fQWltJ04ADDEa7/swzvp1+3R9MDbPTj4LDNdi6rl5TuB9c19b
        8utPT+bnmwrrHj
X-Received: by 2002:a1c:5413:: with SMTP id i19mr4124656wmb.12.1624537010721;
        Thu, 24 Jun 2021 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO6T7RH5kJOhqft1nYuP5MRaUNhBcyLLnS/2fW7dSh8GeklUJxbYd9jfkOO2yHwJcQU++0PA==
X-Received: by 2002:a1c:5413:: with SMTP id i19mr4124637wmb.12.1624537010558;
        Thu, 24 Jun 2021 05:16:50 -0700 (PDT)
Received: from ?IPv6:2a01:e34:eea6:7961:1234::432? ([2a01:e34:eea6:7961:1234::432])
        by smtp.gmail.com with ESMTPSA id y15sm2830356wmq.17.2021.06.24.05.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 05:16:49 -0700 (PDT)
Subject: Re: [PATCH 1/4] HID: core: Add hid_hw_may_wakeup() function
To:     Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org
References: <20210529151424.12212-1-hdegoede@redhat.com>
 <20210529151424.12212-2-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-ID: <1837eed3-8f99-d9be-0d35-d4b21c0e6f4e@redhat.com>
Date:   Thu, 24 Jun 2021 14:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210529151424.12212-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On 5/29/21 5:14 PM, Hans de Goede wrote:
> Add a hid_hw_may_wakeup() function, which is the equivalent of
> hid_hw_may_wakeup() for hid devices.

nitpick here, but I think the second `hid_hw_may_wakeup()` is probably 
wrong.

> 
> In most cases this just returns device_may_wakeup(hdev->dev.parent),
> but for some ll-drivers this is not correct. E.g. usb_hid_driver
> instantiated hid devices have their parent set to the usb-interface
> to which the usb_hid_driver is bound, but the power/wakeup* sysfs
> attributes are part of the usb-device, which is the usb-interface's
> parent.

I never spent enough time in suspend/resume. But isn't the big consumer 
of wakeup sources be USB? Is there a point having a generic return path 
when returning false earlier will keep the same code path for all other 
transport layers (I2C and bluetooth)?

Other than those two questions, I like the series and the approach to 
not break the existing:

For the series:
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

> 
> For these special cases a new may_wakeup callback is added to
> hid_ll_driver, so that ll-drivers can override the default behavior.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   include/linux/hid.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 271021e20a3f..4d2b2212f079 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -800,6 +800,7 @@ struct hid_driver {
>    * @raw_request: send raw report request to device (e.g. feature report)
>    * @output_report: send output report to device
>    * @idle: send idle request to device
> + * @may_wakeup: return if device may act as a wakeup source during system-suspend
>    */
>   struct hid_ll_driver {
>   	int (*start)(struct hid_device *hdev);
> @@ -824,6 +825,7 @@ struct hid_ll_driver {
>   	int (*output_report) (struct hid_device *hdev, __u8 *buf, size_t len);
>   
>   	int (*idle)(struct hid_device *hdev, int report, int idle, int reqtype);
> +	bool (*may_wakeup)(struct hid_device *hdev);
>   };
>   
>   extern struct hid_ll_driver i2c_hid_ll_driver;
> @@ -1149,6 +1151,22 @@ static inline int hid_hw_idle(struct hid_device *hdev, int report, int idle,
>   	return 0;
>   }
>   
> +/**
> + * hid_may_wakeup - return if the hid device may act as a wakeup source during system-suspend
> + *
> + * @hdev: hid device
> + */
> +static inline bool hid_hw_may_wakeup(struct hid_device *hdev)
> +{
> +	if (hdev->ll_driver->may_wakeup)
> +		return hdev->ll_driver->may_wakeup(hdev);
> +
> +	if (hdev->dev.parent)
> +		return device_may_wakeup(hdev->dev.parent);
> +
> +	return false;
> +}
> +
>   /**
>    * hid_hw_wait - wait for buffered io to complete
>    *
> 

