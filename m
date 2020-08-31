Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FFC25747A
	for <lists+linux-input@lfdr.de>; Mon, 31 Aug 2020 09:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgHaHsY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Aug 2020 03:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgHaHsX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Aug 2020 03:48:23 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0A8020738;
        Mon, 31 Aug 2020 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598860103;
        bh=bzCEwJwBzyL8mUKGPxv8akcTe2V/jC3XhEh2aWcfKbQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=eYlAGf5W8IFyry5inhks7nPA7dexSMHcPKmFMA9JUuu5Ja48tnVeXw10lD28Favtf
         QyzmqDyOFM3IBXYj17Hip75dMDGK9d+UdArlhZyuGcR9FyVxcNI3V45chDF64WeX66
         vc9EJs7ogjcUKnGoEAanNm8bjviU9VSeAnXjVMS8=
Date:   Mon, 31 Aug 2020 09:48:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
cc:     kjlu@umn.edu, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexandrov Stansilav <neko@nya.ai>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: elan: Fix memleak in elan_input_configured
In-Reply-To: <20200824072400.9612-1-dinghao.liu@zju.edu.cn>
Message-ID: <nycvar.YFH.7.76.2008310947070.27422@cbobk.fhfr.pm>
References: <20200824072400.9612-1-dinghao.liu@zju.edu.cn>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 24 Aug 2020, Dinghao Liu wrote:

> When input_mt_init_slots() fails, input should be
> freed to prevent memleak.
> 
> Fixes: 9a6a4193d65b8 ("HID: Add driver for USB ELAN Touchpad")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/hid/hid-elan.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
> index 45c4f888b7c4..858442004258 100644
> --- a/drivers/hid/hid-elan.c
> +++ b/drivers/hid/hid-elan.c
> @@ -188,6 +188,7 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	ret = input_mt_init_slots(input, ELAN_MAX_FINGERS, INPUT_MT_POINTER);
>  	if (ret) {
>  		hid_err(hdev, "Failed to init elan MT slots: %d\n", ret);
> +		input_free_device(input);
>  		return ret;

Good catch, but apparently it's not the only memleak there -- 
input_mt_init_slots() allocates the input_mt slots and friends, so we need 
input_mt_destroy_slots() there as well.

Could you please add this to your patch too, while you are at fixing this 
error codepath anyway, and resubmit?

Thanks!

-- 
Jiri Kosina
SUSE Labs

