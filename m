Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C2C13A391
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 10:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgANJQW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 04:16:22 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:51092 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725820AbgANJQW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 04:16:22 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5A532F973300C3E58AB3;
        Tue, 14 Jan 2020 17:16:19 +0800 (CST)
Received: from [127.0.0.1] (10.133.215.186) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 14 Jan 2020
 17:16:18 +0800
Subject: Re: [PATCH 1/1] HID: hiddev: remove a duplicated check
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>
CC:     Hillf Danton <hdanton@sina.com>
References: <20191224035117.98816-1-thunder.leizhen@huawei.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <50fd522f-e276-420c-3c6a-0f193bc16ca2@huawei.com>
Date:   Tue, 14 Jan 2020 17:16:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191224035117.98816-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Does no one pay attention to this problem? Although there is no
functional problem, but it seems confusing.

        if (!list->hiddev->exist) {                 <---------
                res = -ENODEV;                                |
                goto bail_unlock;                             |
        }                                                     |
        if (!list->hiddev->open++)                            |
                if (list->hiddev->exist) {          <--------- //It's always true.

On 2019/12/24 11:51, Zhen Lei wrote:
> After commit 9c09b214f30e ("HID: hiddev: avoid opening a disconnected
> device"), the original check "list->hiddev->exist" become unnecessary.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/hid/usbhid/hiddev.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
> index e421cdf2d1a4ec5..e04cf95fca094a8 100644
> --- a/drivers/hid/usbhid/hiddev.c
> +++ b/drivers/hid/usbhid/hiddev.c
> @@ -292,16 +292,16 @@ static int hiddev_open(struct inode *inode, struct file *file)
>  		res = -ENODEV;
>  		goto bail_unlock;
>  	}
> -	if (!list->hiddev->open++)
> -		if (list->hiddev->exist) {
> -			struct hid_device *hid = hiddev->hid;
> -			res = hid_hw_power(hid, PM_HINT_FULLON);
> -			if (res < 0)
> -				goto bail_unlock;
> -			res = hid_hw_open(hid);
> -			if (res < 0)
> -				goto bail_normal_power;
> -		}
> +	if (!list->hiddev->open++) {
> +		struct hid_device *hid = hiddev->hid;
> +
> +		res = hid_hw_power(hid, PM_HINT_FULLON);
> +		if (res < 0)
> +			goto bail_unlock;
> +		res = hid_hw_open(hid);
> +		if (res < 0)
> +			goto bail_normal_power;
> +	}
>  	mutex_unlock(&hiddev->existancelock);
>  	return 0;
>  bail_normal_power:
> 

