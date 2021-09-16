Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBED40EB39
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 22:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhIPUBe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 16:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236082AbhIPUBe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 16:01:34 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B28C061574;
        Thu, 16 Sep 2021 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=O9Ii6LJ9LsmL6+RSz1Wyr9Day281eVLBIDqbMWg5CEI=; b=kdO0IA4LIiPOteuRg+V7ustgb3
        voPhakwEaqypUeDp87CmypZiruUFBC72IV0RhMC+tCBQn4+PCBKQWIb7BANz0GdBjO8wDebtD2DTx
        2dT903GpRsMFpEBqDgBF+vQh1URs6k8OI1It3jWo3fHb42VUVRJdR7MT9j3dXZMEZNWtmCg3WjcES
        UH+Mv6Pi49TzTLQOzMLLL3qwxxHhbnm0zHTzWk35/BCjGnneoRBt9CREH1IWkWloDiXMLBjIqfq0f
        Psb1k+1U6QTcxGG406gW3mIA0VDnVmTVDIk18YJpfAt56amlTzhc43wa3PoNGyRPBQAlFSwHz+BT8
        NkKvCVCg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQxYK-00CIRj-Hh; Thu, 16 Sep 2021 20:00:12 +0000
Subject: Re: [PATCH] Support for side buttons of Xiaomi Mi Dual Mode Wireless
 Mouse Silent Edition
To:     Ilya Skriblovsky <ilyaskriblovsky@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <YUOg5aDkO0lp7eM8@ilya-330s>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e02a942b-286a-7185-3a45-d77af9b5cc6f@infradead.org>
Date:   Thu, 16 Sep 2021 13:00:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUOg5aDkO0lp7eM8@ilya-330s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 9/16/21 12:54 PM, Ilya Skriblovsky wrote:
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 76937f716fbe..d09abc63290e 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -467,6 +467,13 @@ config HID_VIEWSONIC
>   	help
>   	  Support for ViewSonic/Signotec PD1011 signature pad.
>   
> +config HID_XIAOMI:

No ending ':' above.

> +	tristate "Xiaomi"
> +	depends on HID
> +	help
> +	Adds support for side buttons of Xiaomi Mi Dual Mode Wireless
> +	Mouse Silent Edition

End the description with a '.', please.

And the 2 lines of help text should be indented with an extra 2
spaces (although some parts of this Kconfig file are not done
like that and other parts are).

> +

thanks.
-- 
~Randy

