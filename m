Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738CC78FBE
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 17:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388213AbfG2PrK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 11:47:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35589 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387955AbfG2PrJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 11:47:09 -0400
Received: by mail-wr1-f68.google.com with SMTP id y4so62402900wrm.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2019 08:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yS8ibKa0wH35wShpFjQuRMdxr8FhaslciAiXwT1RvYk=;
        b=j7QRj8Mc05gGh50PWEMtWmVxMsA5SaVA8GbsWlPRkbtlm2lzMDKR8q8beqj/EayZSO
         X1I1o1EtJTyYcohFC3H6LYcqoFcguogR1qzPrEwGmgb7hJkVsPrl1fO42H5AYDQiAOON
         nUIZT98WtqGe9X6VszBvMq262JWYDn+mdSKO7rZKhmHg2zZj0gQfLZ+z4keWwicygpQf
         SxfTDzNye3bhmFQ2M/iCxZZdszmWaK1+MqELTIlgtmrcB7T93VeE2tnZ84pzAiFibYqC
         m8dTQEBKFaE1xWNLuvg5DNMyWO3Usg5cwQQtVFYwht1URAy9ZP+nFPk1OCrW46MTuJLe
         Yzww==
X-Gm-Message-State: APjAAAWcDYlhaw82oZqnVrXfJTjdVVosRIk1TAus/IWsv5E9BaJkxk/i
        b7ou5ha+mc8PQ8Uh7GgX/mSutg==
X-Google-Smtp-Source: APXvYqwO55885JNiTktAulfzSGaaZ9n40IW1xBbTjIcJb32aEjyGgPg/R1Pq6BA7T+cO+MyDPxXVDQ==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr46150435wrn.11.1564415227611;
        Mon, 29 Jul 2019 08:47:07 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id j189sm70271670wmb.48.2019.07.29.08.47.06
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 08:47:06 -0700 (PDT)
Subject: Re: [PATCH v3] HID: logitech-dj: Fix mouse detection
To:     Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc:     linux-input@vger.kernel.org, yuehaibing@huawei.com,
        benjamin.tissoires@redhat.com,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <20190725141949.9737-1-lionel.g.landwerlin@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ac913c98-6434-5f53-be46-732a8c0781ba@redhat.com>
Date:   Mon, 29 Jul 2019 17:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725141949.9737-1-lionel.g.landwerlin@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Thank you for tracking down the cause of this and for
providing an initial patch fixing this.

On 25-07-19 16:19, Lionel Landwerlin wrote:
> Now logi_dj_recv_query_paired_devices() will return a positive value
> while success, but logi_dj_probe expect zero in case of success, so
> set it to 0 before return.
> 
> Fixes this error :
> 
>     logitech-djreceiver: probe of 0003:046D:C534.0006 failed with error 7
> 
> Also prevents the pluging of the mouse dongle in/out to hang the
> system.
> 
> v2: Drop useless retval = 0 (YueHaibing)
> 
> v3: Add explanation (YueHaibing)
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: linux-input@vger.kernel.org
> Cc: yuehaibing@huawei.com
> Cc: hdegoede@redhat.com
> Cc: benjamin.tissoires@redhat.com
> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
> Reviewed-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/hid/hid-logitech-dj.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 6196217a7d93..8cdf37309ada 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1736,6 +1736,7 @@ static int logi_dj_probe(struct hid_device *hdev,
>   				__func__, retval);
>   			goto logi_dj_recv_query_paired_devices_failed;
>   		}
> +		retval = 0;
>   	}
>   
>   	return retval;

You are now overriding the return value with 0, even if it is an error,
effectively undoing the result of commit dbcbabf7da92, except that an
error will no be logged (but other then the logging nothing will change).

I've just hit the issue caused by this myself after upgrading to 5.3-rc2
myself. I've prepared a fix which properly fixes this by making
logi_dj_recv_query_hidpp_device either return the negative error returned
by hid_hw_raw_request or 0 when hid_hw_raw_request succeeded.

I will put you in the Cc of the patch fixing for this.

Regards,

Hans
