Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB6B1845AF
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 12:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgCMLLF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 07:11:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51452 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726464AbgCMLLF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 07:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584097864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Znx5Y+0VkHiSRvFzXHOAJasCNuVTe2XeWN+nKzZLlBM=;
        b=R330xUdZfIXWV2knEbD2S/TqujOoEKq7HcN59TyNRvIyX/EDhvXGqWLbsEJBWuBYBqwEk0
        iZYiqkADEr725hdQ8fSUE5Ek9x6m6dQ74GbDHjUoGeKNB0x2pcrc8VVuXeK1P0WY7KadrA
        VPRWPJ4VO8kVdFIyymwHrW3qbGvVFig=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-ubBod4j1MYaEtVILI0Q2yw-1; Fri, 13 Mar 2020 07:11:02 -0400
X-MC-Unique: ubBod4j1MYaEtVILI0Q2yw-1
Received: by mail-wm1-f70.google.com with SMTP id z26so3272076wmk.1
        for <linux-input@vger.kernel.org>; Fri, 13 Mar 2020 04:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Znx5Y+0VkHiSRvFzXHOAJasCNuVTe2XeWN+nKzZLlBM=;
        b=nZZNYRxkOdkGC2kEmgsHQC+kE1CFhAq4vpZxqd0xhMMM8dixuphLCNNvNfvd2UHbtv
         RHuLkV2O6xdwIRb1cykSpCDkoT9xK8B0nm8obJ2RvBbfXE1ovRKSlRVNLtOWRT7HN/JE
         ta4wIwrBTdoP+a8oGXlKu5lCH+acIsNY+S5hih37TV8smNZNsWiJTQy5m9PtxGHlpUmM
         IO0hRaI8Nl2ABNbMw0L383t40jpw1vQYdq3NycKpDQOD9TtGvXG5EenZb/tYn0rdSUsa
         9K/Ut9u2DDWiHYmLQFuGoRrZ+uFhAsSn+/tFmIzh/33wB7Pm5xr8y4vIdLJWRpFkU+sm
         LndQ==
X-Gm-Message-State: ANhLgQ2cGfdws5JxD66nB9xCKTwXz8X9eYK9DDwwbqnosXYC+Cd42Zbw
        LYIUu92+6L1mIZS5UhV2tT9J46HLGXYOD7KL60Fp/Z2dn5nt94eZ6vquedOvmUVgikfSVKb8K2u
        SCBngqqUirdxusLN0oZyFZZE=
X-Received: by 2002:adf:eb51:: with SMTP id u17mr18117053wrn.29.1584097861358;
        Fri, 13 Mar 2020 04:11:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu6sLxbETDVHrveEParCbnrVNuR+eHSL1wlfEd77hYvY3QXU4IPibJ75ctkVhVXbut3Qz3mfw==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr18117027wrn.29.1584097861146;
        Fri, 13 Mar 2020 04:11:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id i1sm62330085wrs.18.2020.03.13.04.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 04:11:00 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] Input: goodix - Ignore spurious interrupts
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <20200312145009.27449-1-dmastykin@astralinux.ru>
 <20200312145009.27449-2-dmastykin@astralinux.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <91d43752-4ae4-5825-4904-c5af488434fd@redhat.com>
Date:   Fri, 13 Mar 2020 12:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312145009.27449-2-dmastykin@astralinux.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/12/20 3:50 PM, Dmitry Mastykin wrote:
> The goodix panel sends spurious interrupts after a 'finger up' event,
> which always cause a timeout.
> The timeout was reported as touch_num == 0 and caused reading of
> not ready buffer and false key release event.
> In this patch the timeout is reported as ENOMSG and not processed.
> 
> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
> Changes in v2:
> - Improve commit message
> ---
>   drivers/input/touchscreen/goodix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index daf1781..0e14719 100644
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

