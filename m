Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17D93107AC
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 10:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhBEJVj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 04:21:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:33620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230326AbhBEJSb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Feb 2021 04:18:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89F7464F46;
        Fri,  5 Feb 2021 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612516670;
        bh=6EY/hJO5lsOUp1lV62vlliw5zVpXQuMcomOmxe0tenY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Iic+OCjomMgcXz+Hem4eVlglBXXf+TRuYLnQuE0bwynBS7Lb5wNeH8wa1vDMbq3kw
         jy8xf83fkz5Oa0tmJSzjJqXaijLXyxi0m1R10BuL44HFIT9rBEtypFrL/60Ecgv4iA
         mFrGqG6DXWYr8oz35yG4xxW4Ino79uF5p8Ho5rMtxwSLT5IshZwh93A7OXJ5LI98Hs
         s7ynDuVMarvJoVzIAM1mw77I+qV3rJ0uNpatBaHdW4f0gShrCsW4JwvvEb3QwXiDiT
         yZFmUnbEin95mSxmeKKVfZLuBbKmVzXAKTPWhJre6sAuZdQXETYvJFbyMwNws8VYlB
         UdgQ94gmABzwQ==
Date:   Fri, 5 Feb 2021 10:17:47 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: convert sysfs sprintf/snprintf family to
 sysfs_emit
In-Reply-To: <1612253940-19396-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Message-ID: <nycvar.YFH.7.76.2102051017370.28696@cbobk.fhfr.pm>
References: <1612253940-19396-1-git-send-email-jiapeng.chong@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2 Feb 2021, Jiapeng Chong wrote:

> Fix the following coccicheck warning:
> 
> ./drivers/hid/wacom_sys.c:1828:8-16: WARNING: use scnprintf or sprintf.
> 
> Reported-by: Abaci Robot<abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/hid/wacom_sys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index aa9e488..8328ef1 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -1825,7 +1825,7 @@ static ssize_t wacom_show_speed(struct device *dev,
>  	struct hid_device *hdev = to_hid_device(dev);
>  	struct wacom *wacom = hid_get_drvdata(hdev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%i\n", wacom->wacom_wac.bt_high_speed);
> +	return sysfs_emit(buf, "%i\n", wacom->wacom_wac.bt_high_speed);
>  }

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

