Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0234304D7
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 21:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243987AbhJPTxE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 15:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234499AbhJPTxE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 15:53:04 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5E3C061765
        for <linux-input@vger.kernel.org>; Sat, 16 Oct 2021 12:50:55 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 0368983209;
        Sat, 16 Oct 2021 21:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634413853;
        bh=EX7i968i89IfmIX8XL20e8Q5Cnu4eiOHTSljrF/m974=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pWIwzqtZVED81axOyTz4J4lKW9X1xLtIeruVCEvyRoewcbG/++ioqX0aC+ZEhd+T4
         RjcksyniLMnJH/8CxSgaeq7n+L9Zez61CnLyVvLg7vBEOcn9JTNtWDc3GSzQ3vejt8
         lbPhMsYv5Ns2YKRym3+O6zOVWaXSM6N8+nLqMlyN/cNVJvUR3t7TCZL4COV72Yu80u
         tZDqxYNCfMWKTaA9kannL+Wop1ONUWAl0tN9mcs9ONu+pTEaakgKjeoYibApwIFtKV
         WRpY1eQ37L3b/Y421uFipTfIum9BodDqenmjg/swNcMq5yXbnR9huv17eiXOi/IpwF
         mJbJLfUvM31Qw==
Subject: Re: [PATCH v3 1/3] Input: ili210x - use resolution from ili251x
 firmware
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     ch@denx.de, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
References: <20210831202506.181927-1-marex@denx.de>
From:   Marek Vasut <marex@denx.de>
Message-ID: <864eac36-c381-01fd-d80a-7a0f39e24788@denx.de>
Date:   Sat, 16 Oct 2021 21:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210831202506.181927-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/31/21 10:25 PM, Marek Vasut wrote:
> The ili251x firmware protocol permits readout of panel resolution,
> implement this, but make it possible to override this value using
> DT bindings. This way, older DTs which contain touchscreen-size-x
> and touchscreen-size-y properties will behave just like before and
> new DTs may avoid specifying these for ILI251x.
> 
> Note that the command format is different on other controllers, so
> this functionality is isolated to ILI251x.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
> V2: New patch
> V3: - Use le16_to_cpup() byte-swap resolution data
>      - Check Y-resolution range up to 0xffff too
>      - Use .has_firmware_proto flag to discern supported MCU protocol
>      - Use input_abs_set_max() per include/linux/input.h INPUT_GENERATE_ABS_ACCESSORS
>      - Rename variable ret to error
>      - Add a wrapper function ili251x_firmware_update_cached_state(),
>        which would call pull other cacheable state from the controller
>        in subsequent patch (hence also the ret variable in it which
>        looks like it could be removed, this will reduce the number of
>        changes in the next patch).
>      - Wait for the firmware to fully stabilize itself after reset.
>        No, those 200 milliseconds is not a mistake, but a value taken
>        from example code. Anything less sometimes does report partly
>        invalid values.

I hope I addressed all the feedback from V2 in this V3. I haven't heard 
anything about these patches for a long time. Do you think they can be 
applied now ?
