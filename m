Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7EE357237
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 18:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347388AbhDGQfz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 7 Apr 2021 12:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbhDGQfy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 12:35:54 -0400
X-Greylist: delayed 443 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Apr 2021 09:35:44 PDT
Received: from smtprelay.restena.lu (smtprelay.restena.lu [IPv6:2001:a18:1::62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633B0C061756;
        Wed,  7 Apr 2021 09:35:44 -0700 (PDT)
Received: from hemera.lan.sysophe.eu (unknown [IPv6:2001:a18:1:12::1])
        by smtprelay.restena.lu (Postfix) with ESMTPS id 9FF9B40BFF;
        Wed,  7 Apr 2021 18:28:14 +0200 (CEST)
Date:   Wed, 7 Apr 2021 18:28:09 +0200
From:   Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: picolcd: remove unused variable
Message-ID: <20210407182809.135323e5@hemera.lan.sysophe.eu>
In-Reply-To: <1617777562-86341-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1617777562-86341-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiapeng,

This is a dupe of a fix already sent two weeks ago by Lee Jones.

see series "Rid W=1 warnings from HID".


@Benjamin: At first glance the patch will not break anything.
           I've had no time though to check what 
             struct hid_device_id.raw_event
           expects as return value to verify if we can just drop ret
           or rather effectively should return something specific based
           on it.

Bruno

On Wed,  7 Apr 2021 14:39:22 +0800 Jiapeng Chong wrote:
> Fix the following gcc warning:
> 
> drivers/hid/hid-picolcd_core.c:332:6: warning: variable ‘ret’ set but
> not used [-Wunused-but-set-variable].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/hid/hid-picolcd_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
> index 1b5c632..682c2a2 100644
> --- a/drivers/hid/hid-picolcd_core.c
> +++ b/drivers/hid/hid-picolcd_core.c
> @@ -329,7 +329,6 @@ static int picolcd_raw_event(struct hid_device *hdev,
>  {
>  	struct picolcd_data *data = hid_get_drvdata(hdev);
>  	unsigned long flags;
> -	int ret = 0;
>  
>  	if (!data)
>  		return 1;
> @@ -342,9 +341,9 @@ static int picolcd_raw_event(struct hid_device *hdev,
>  
>  	if (report->id == REPORT_KEY_STATE) {
>  		if (data->input_keys)
> -			ret = picolcd_raw_keypad(data, report, raw_data+1, size-1);
> +			picolcd_raw_keypad(data, report, raw_data+1, size-1);
>  	} else if (report->id == REPORT_IR_DATA) {
> -		ret = picolcd_raw_cir(data, report, raw_data+1, size-1);
> +			picolcd_raw_cir(data, report, raw_data+1, size-1);
>  	} else {
>  		spin_lock_irqsave(&data->lock, flags);
>  		/*

