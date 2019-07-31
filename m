Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C37007C0BC
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 14:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfGaMHl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 08:07:41 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3269 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726185AbfGaMHl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 08:07:41 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 22A375B61237C26C2A86;
        Wed, 31 Jul 2019 20:07:39 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 20:07:36 +0800
Subject: Re: [PATCH 5.3 regression fix] HID: logitech-dj: Really fix return
 value of logi_dj_recv_query_hidpp_devices
To:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190729155036.4094-1-hdegoede@redhat.com>
CC:     <linux-input@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <34b22c18-1ba5-dad8-f796-80cd9fdeeaf3@huawei.com>
Date:   Wed, 31 Jul 2019 20:07:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190729155036.4094-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019/7/29 23:50, Hans de Goede wrote:
> Commit dbcbabf7da92 ("HID: logitech-dj: fix return value of> logi_dj_recv_query_hidpp_devices") made logi_dj_recv_query_hidpp_devices
> return the return value of hid_hw_raw_request instead of unconditionally
> returning 0.
> 
> But hid_hw_raw_request returns the report-size on a successful request
> (and a negative error-code on failure) where as the callers of
> logi_dj_recv_query_hidpp_devices expect a 0 return on success.
> 
> This commit fixes things so that either the negative error gets returned
> or 0 on success, fixing HID++ receivers such as the Logitech nano receivers
> no longer working.
> 
> Cc: YueHaibing <yuehaibing@huawei.com>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
> Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Reported-by: Rafael J. Wysocki <rjw@rjwysocki.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 6196217a7d93..b7c3edf21235 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1125,7 +1125,7 @@ static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
>  				    HID_REQ_SET_REPORT);
>  
>  	kfree(hidpp_report);
> -	return retval;
> +	return (retval < 0) ? retval : 0;
>  }
>  
>  static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
> 

Reviewed-by: YueHaibing <yuehaibing@huawei.com>

