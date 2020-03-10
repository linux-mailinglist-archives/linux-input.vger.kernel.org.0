Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6FE1800D0
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 15:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgCJOzl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 10:55:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20001 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727532AbgCJOzl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 10:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583852140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=soBoNS9AgNuyflbnBaX8oCXz33wXzf2uaJncpAh4czs=;
        b=Sdkd5X1SdRkACwe0aStezy9g1pHH4uCH1aGkeMq4LG84xlJ4o3AuHtVeS9fO200tnZm5ys
        kIGBXlhFgNnz7r8oXVHyTAbT+DRb1rQE059p6NXzRskZLxAuUEPHunDQ7omDVs2lSVLQQs
        1ojPNN8DjL6YPffgxYg9n+hC5ucCO9s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-MhZXJ6JPM6Cb2xExZWloiA-1; Tue, 10 Mar 2020 10:55:39 -0400
X-MC-Unique: MhZXJ6JPM6Cb2xExZWloiA-1
Received: by mail-wm1-f70.google.com with SMTP id t2so503439wmj.2
        for <linux-input@vger.kernel.org>; Tue, 10 Mar 2020 07:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=soBoNS9AgNuyflbnBaX8oCXz33wXzf2uaJncpAh4czs=;
        b=thRW1x8H5pV8oHW2R7xJCX99dPdcINSna07GdfPd2mqwo/jdDDkPIxRU3lPMsunwu/
         vL6VJXdFvPyuBwSOoUJX33h8E9QkWWOtgDj8kteg++9r3r9m1jeqzr3tZ9J1pGXOmV/I
         cMW2Rn6PQaqIn304sLvYVgm+hfYeGRmJ3s7uiTFPbHQhPKqpx2MREFpEKX+Sp2ri91/Z
         6175PWr0s+6rZcHPMzuBO5x65pim4KDo3le+bjSinxOZjAhjiwQK8KqSiERCSig0eYqd
         yhPtFnCnm+QuNGjjgm9d8iTEIJZI23ODUrB6A7nt1D+4yn5r5l04eP2BR8uo4WwBMttQ
         Apkw==
X-Gm-Message-State: ANhLgQ3lG+P8JqnoO1cWVaFLev1QWbA4f9I5x2NYWyb+1OeruX+5ThaO
        EKTn79oNcDrD89XiP5ZhP7hfeCSQ4phxctHCveEpXlbeU52N6KYeaPw4PQ9mV2eDse9bF5DjKrQ
        3QsZQ3Ceuy9rCh12mt6bOBbI=
X-Received: by 2002:a05:600c:2115:: with SMTP id u21mr2670869wml.6.1583852137557;
        Tue, 10 Mar 2020 07:55:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvrFx3r9jBlHIjKCbnQRCjfxt68st1I0sNNRkRpEkx2SJmCVxFYh1ZGEmgsITuA4mGOG37z6A==
X-Received: by 2002:a05:600c:2115:: with SMTP id u21mr2670859wml.6.1583852137397;
        Tue, 10 Mar 2020 07:55:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id m11sm19762113wrn.92.2020.03.10.07.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 07:55:36 -0700 (PDT)
Subject: Re: [PATCH 2/2] Input: goodix - Ignore spurious interrupts
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <20200310131705.13516-1-dmastykin@astralinux.ru>
 <20200310131705.13516-2-dmastykin@astralinux.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <25d0a14b-359f-c032-79bd-8fcaad8c650d@redhat.com>
Date:   Tue, 10 Mar 2020 15:55:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310131705.13516-2-dmastykin@astralinux.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/10/20 2:17 PM, Dmitry Mastykin wrote:

This patch completely lacks a "body" for the commit message,
please write a paragraph about why you are making this change
here.

Regards,

Hans


> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
> ---
>   drivers/input/touchscreen/goodix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 6a7ecc6..7f8ad6d 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -329,7 +329,7 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>   	 * The Goodix panel will send spurious interrupts after a
>   	 * 'finger up' event, which will always cause a timeout.
>   	 */
> -	return 0;
> +	return -ENOMSG;
>   }
>   
>   static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8 *coor_data)
> 

