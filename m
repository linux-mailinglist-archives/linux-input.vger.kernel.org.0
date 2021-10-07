Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F969425227
	for <lists+linux-input@lfdr.de>; Thu,  7 Oct 2021 13:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhJGLkm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Oct 2021 07:40:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:40766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230091AbhJGLkm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Oct 2021 07:40:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66F0B61139;
        Thu,  7 Oct 2021 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633606728;
        bh=L/hUnFbL8E5m8uUbr/4q4eZDVlgAdpApRMT2soUfbsU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=exSsfhQcJLCg3pS34CUf3tR49DeihE8X0tgWhegqkCnyxRErRXtcg78s9nsDUmBRZ
         GGUXOEpzuUgcnOOOK6BJfdc2gGfTjoycpo8Xyw4drIs2nORs6n1rMzMNyxAfRR6XCe
         DtYJ1DhBahJkQVbhNpxUO+W5cdM8JvgjuvRCM67WCkRdn4HlVykT6qEKW4UgVAevDt
         pFhOKrNw15qJz6hkLP1PN7FbthJDQgB4eH4GU0Te5F3iaHN7cqvd9N4SxYM9wTcUAL
         5oe/el/Ik8LqD0WY4id5a47ETAbiyFf4Q8NpGHPzUulYACeKHHfTJUGv2Ri1qf6X8g
         BirybJrt2C3Sw==
Date:   Thu, 7 Oct 2021 13:38:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: Make use of the helper function
 devm_add_action_or_reset()
In-Reply-To: <20210922125939.427-1-caihuoqing@baidu.com>
Message-ID: <nycvar.YFH.7.76.2110071338010.29107@cbobk.fhfr.pm>
References: <20210922125939.427-1-caihuoqing@baidu.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 22 Sep 2021, Cai Huoqing wrote:

> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and if devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

CCing Jason and Ping to Ack this for the Wacom driver.

> ---
>  drivers/hid/wacom_sys.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 93f49b766376..3aed7ba249f7 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -892,10 +892,9 @@ static int wacom_add_shared_data(struct hid_device *hdev)
>  
>  	wacom_wac->shared = &data->shared;
>  
> -	retval = devm_add_action(&hdev->dev, wacom_remove_shared_data, wacom);
> +	retval = devm_add_action_or_reset(&hdev->dev, wacom_remove_shared_data, wacom);
>  	if (retval) {
>  		mutex_unlock(&wacom_udev_list_lock);
> -		wacom_remove_shared_data(wacom);
>  		return retval;
>  	}
>  
> -- 
> 2.25.1
> 

-- 
Jiri Kosina
SUSE Labs

