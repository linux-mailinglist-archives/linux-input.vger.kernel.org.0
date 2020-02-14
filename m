Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6B0415D3DC
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 09:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgBNIcx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 03:32:53 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31606 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728979AbgBNIcv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 03:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581669170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=puQf+KTVL6jAIvEG/uc6Qjsv+wcwMQCDCgK0h7H3Qns=;
        b=bskLufz6l5/tGs3lbOrf9OQJMYDsijLCF1bJzR7O1iazvfGmkvNibtLfJVT3Wr9PI08CXZ
        ZCnTOoeuVDxbuipcUsYUTDq4jT0iHJwc+Ul3cRwSxJDqH2jf+xdH/nbTXqekJbv/HnV6vr
        W+h337PMJ/WmXQj0a+uEdhz/pmIS/qA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-o5RdhpSjMmqcy7mBSwJ2MQ-1; Fri, 14 Feb 2020 03:32:43 -0500
X-MC-Unique: o5RdhpSjMmqcy7mBSwJ2MQ-1
Received: by mail-wm1-f69.google.com with SMTP id b133so3502168wmb.2
        for <linux-input@vger.kernel.org>; Fri, 14 Feb 2020 00:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=puQf+KTVL6jAIvEG/uc6Qjsv+wcwMQCDCgK0h7H3Qns=;
        b=cxlmC0fNDGzVJt2FigOIU1XMEvuIp/S7cmatUb0FEm/ekAS7NWK5mLKU2nQT+TDfV0
         ByT6jmZOfkosVw4rQhhEN8mUAxqjk7xQ8E5YwpndsH7x2LhIlrypnORZ2OpykzF5gILS
         LzlDUliXr7hoMl+hg5gGzqze8nJtHDuiLg551CVbaZNPsr2XHghA+KXQBu7BkMSPi8Ye
         In2ALeYwhZh4PTsPhnfDy8h4jRybQiUljN//rX8gAwkjnlkJp9Nn05sTwrh5emH0GuBU
         YYQs/RoahJXqh1H+D1fiU6EGKhkwkYEBxpeB7jicYDNkydDu8E9qtJesKK81w+AdzjYn
         Svmg==
X-Gm-Message-State: APjAAAUu2E79+SZ/YMAqhSag94Nl/N2vIKlYgFC8yo6SQ+Cg5+Z6bIRz
        pqUxnxQr2HlgOOLJO6xuFP5YSLRIah7Dd6L0riFWVMMlgsnf4NZxgPulWXKlyozzhEXtxQka9aQ
        cPrCqLkn454FyYm/b47RJ2zg=
X-Received: by 2002:adf:c3d0:: with SMTP id d16mr2595588wrg.376.1581669162542;
        Fri, 14 Feb 2020 00:32:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqz61KgA2geHCRzp+UTS+Gx0cIojDpn90PUtPD75jQf8W19FKR7d4Kn4nJr8MVNgmi4pM3vUkQ==
X-Received: by 2002:adf:c3d0:: with SMTP id d16mr2595563wrg.376.1581669162340;
        Fri, 14 Feb 2020 00:32:42 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id a62sm6548573wmh.33.2020.02.14.00.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 00:32:41 -0800 (PST)
Subject: Re: [PATCH] HID: i2c-hid: add Trekstor Surfbook E11B to descriptor
 override
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200214065309.27564-1-kai.heng.feng@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <189a7784-3754-99b8-3f3d-560b7657c134@redhat.com>
Date:   Fri, 14 Feb 2020 09:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214065309.27564-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/14/20 7:53 AM, Kai-Heng Feng wrote:
> The Surfbook E11B uses the SIPODEV SP1064 touchpad, which does not supply
> descriptors, so it has to be added to the override list.
> 
> BugLink: https://bugs.launchpad.net/bugs/1858299
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> index d31ea82b84c1..a66f08041a1a 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> @@ -341,6 +341,14 @@ static const struct dmi_system_id i2c_hid_dmi_desc_override_table[] = {
>   		},
>   		.driver_data = (void *)&sipodev_desc
>   	},
> +	{
> +		.ident = "Trekstor SURFBOOK E11B",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SURFBOOK E11B"),
> +		},
> +		.driver_data = (void *)&sipodev_desc
> +	},
>   	{
>   		.ident = "Direkt-Tek DTLAPY116-2",
>   		.matches = {
> 

