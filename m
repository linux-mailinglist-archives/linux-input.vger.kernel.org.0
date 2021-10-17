Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76F34309BF
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 16:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343858AbhJQOaA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 10:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbhJQOaA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 10:30:00 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB6CC061765
        for <linux-input@vger.kernel.org>; Sun, 17 Oct 2021 07:27:50 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3DFA28319C;
        Sun, 17 Oct 2021 16:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634480867;
        bh=Waf4OTQv2t/D92eR21SWyWR6BZgjBk4OyTewn/kjHtI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EwWxFMxa595IwgNwn6D93Muf39gV5Xk1llEVSAZ+hPpoCBZLB6X0Oyz360XlTc1Ll
         EnxGDfAU/rt+zwOkrSdXmtZ2ohL9fLtx8F8R2fiYI+gGFDZJCawnldPF6sTfiiYzBj
         XYGfkyRy3bCcSSRvC79TyOOyAGSq0qjbTejaJ4Ol6H7R+yyjBEMeDXgI6e3Bf66mku
         sIG7K7Nn6CKWAd9+GWtC7x9C6GW4eXHL2SDf0U4ocxMd1CsZ7NiH/E/3G/57eCVHER
         HJsM0QoneDzGP5PxBTvt8hDuerJ+4xNRYBmpqWOk2Ed1D5SeviNi1vg2tVUVmw827V
         K+bjD/HwbKvHQ==
Subject: Re: [PATCH v3 3/3] Input: ili210x - add ili251x firmware update
 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
References: <20210831202506.181927-1-marex@denx.de>
 <20210831202506.181927-3-marex@denx.de> <YWu0GWttNy9FWrfo@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <a174583f-ddd8-3fed-b3ea-22b03fd4d7e5@denx.de>
Date:   Sun, 17 Oct 2021 16:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWu0GWttNy9FWrfo@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10/17/21 7:26 AM, Dmitry Torokhov wrote:
> On Tue, Aug 31, 2021 at 10:25:06PM +0200, Marek Vasut wrote:
>> +
>> +	/* DF end address is the last address in the firmware blob */
>> +	*df_end = fw_addr + fw_len;
>> +	*buf = fw_buf;
>> +	release_firmware(fw);
>> +	return 0;
>> +err_big:
>> +	kfree(fw_buf);
>> +err_alloc:
>> +	release_firmware(fw);
>> +	return error;
> 
> I do not quite like that we have to release firmware in both success
> and error paths, so I moved the call to request_ihex_firmware() to the
> caller of this function and release it before checking the result of
> loading the firmware to buffer, and applied.

Hmmm, looking at the result, maybe it would be better to do the entire 
request_ihex_firmware() / release_firmware) in 
ili251x_firmware_to_buffer(). I'll try and see how that looks and maybe 
send you a subsequent patch if it looks better.

Otherwise, thanks for picking those up.
