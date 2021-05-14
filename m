Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B70380F26
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 19:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbhENRmK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 13:42:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232126AbhENRmK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 13:42:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFB6461442;
        Fri, 14 May 2021 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621014058;
        bh=biVegCOZ2raeXYTzsP/wUbgSQrfcL5Nq+3E9P7gDvrw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gIt3oB13HNetM5fP/z4MAi14o2EVQ1ovTEyO+RDlFlU0gNwx+NqhjUdhK59LGTCb0
         BhSz5obZp209T7KbYoYBj+B+7VjvyMkgVU6yvGlZmkqMxwPjLUcJeP+Zq1RDy9f2If
         +i35lf8WHGJ31KUQkBkn2h8Qe6LZs0JV9lPUO2yEOcm3+1ByFMAA/jNWujK+lJWqnX
         Hsda8I2o6Tv3NPjipE5uGKiT0cl7IXWGH89ItF2MNJ2YP3fHzU3341RN5UL9sBW78F
         DuGLSSEknezXawDbIE7y9lw9NNFENMa/s+r16x2Zg48ynbJlVNvg07qKn9gdu+DtOW
         fnkBRCfp6LItg==
Subject: Re: [PATCH] HID: i2c-hid: fix format string mismatch
To:     Arnd Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Julian Sax <jsbc@gmx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        Coiby Xu <coiby.xu@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20210514135901.2924982-1-arnd@kernel.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <84b20dcb-b063-b2b0-b2dc-1a1befbc334c@kernel.org>
Date:   Fri, 14 May 2021 10:40:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514135901.2924982-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 5/14/2021 6:58 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang doesn't like printing a 32-bit integer using %hX format string:
> 
> drivers/hid/i2c-hid/i2c-hid-core.c:994:18: error: format specifies type 'unsigned short' but the argument has type '__u32' (aka 'unsigned int') [-Werror,-Wformat]
>                   client->name, hid->vendor, hid->product);
>                                 ^~~~~~~~~~~
> drivers/hid/i2c-hid/i2c-hid-core.c:994:31: error: format specifies type 'unsigned short' but the argument has type '__u32' (aka 'unsigned int') [-Werror,-Wformat]
>                   client->name, hid->vendor, hid->product);
>                                              ^~~~~~~~~~~~
> 
> Use an explicit cast to truncate it to the low 16 bits instead.
> 
> Fixes: 9ee3e06610fd ("HID: i2c-hid: override HID descriptors for certain devices")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   drivers/hid/i2c-hid/i2c-hid-core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 9993133989a5..f9d28ad17d9c 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -990,8 +990,8 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>   	hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
>   	hid->product = le16_to_cpu(ihid->hdesc.wProductID);
>   
> -	snprintf(hid->name, sizeof(hid->name), "%s %04hX:%04hX",
> -		 client->name, hid->vendor, hid->product);
> +	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X",
> +		 client->name, (u16)hid->vendor, (u16)hid->product);
>   	strlcpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
>   
>   	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
> 

