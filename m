Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C67A331035
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 14:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhCHN5r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 08:57:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:37800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229899AbhCHN5a (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 08:57:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC31E65100;
        Mon,  8 Mar 2021 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615211849;
        bh=If5x3HN/M8OLBSjsY63p6B1WFvmGwPJvtPWrHlYgbBE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=efTKRUDNcG8eD7VYyt1H1fGSPnt793HUxO6ERVLOHlYOA8QmSmWJ68CW3meth6SBm
         BPJn3XwHmIi/klnir5PqB29WaTnHjYziGDhqzEXUQmJYGo9RUL81AUfSThPd3lvhWC
         YoQOTWX2hxrKOrTH7oCGFZs4YHcb2fTPTQPE3GY9LXE5eDTmwP5s2KnwQ79r5omXzx
         1mAbHG7ni2we9AmJ6mZgl4ZhXg89cyzRgd2s/OOhyzX/1p/mn8erVzCFMmM/sVMyBd
         LDOfDsiuwHqr0zZrIUlvlOMzN+i9nWPj90prOL86VGK7koIELNzI7Mrk9Y2xnyJVU9
         xm6Kv+OzJrWKg==
Date:   Mon, 8 Mar 2021 14:57:27 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: Assign boolean values to a bool variable
In-Reply-To: <1611128070-59752-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Message-ID: <nycvar.YFH.7.76.2103081457220.12405@cbobk.fhfr.pm>
References: <1611128070-59752-1-git-send-email-abaci-bugfix@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 20 Jan 2021, Jiapeng Zhong wrote:

> Fix the following coccicheck warnings:
> 
> ./drivers/hid/wacom_wac.c:2536:2-6: WARNING: Assignment of
> 0/1 to bool variable.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
> ---
>  drivers/hid/wacom_wac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 1bd0eb7..62b0f71 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -2533,7 +2533,7 @@ static void wacom_wac_finger_slot(struct wacom_wac *wacom_wac,
>  	    !wacom_wac->shared->is_touch_on) {
>  		if (!wacom_wac->shared->touch_down)
>  			return;
> -		prox = 0;
> +		prox = false;
>  	}

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

