Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F511B3431
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 02:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDVAyW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 20:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726012AbgDVAyW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 20:54:22 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D839C0610D5;
        Tue, 21 Apr 2020 17:54:22 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k18so223575pll.6;
        Tue, 21 Apr 2020 17:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YOdZFvk+6bmIjWVMk3ZS5OgJr20Jdq2fWyo55D6d2YE=;
        b=n9EkAxNzxm5oKbg0/6Ld25HxkeLVB5k35B6s0UXQ/yYtU8fx2SqXvyp+vPo2us+ZWy
         P/zC32Gd6vlT2CbT560rszwyu78rZrM2K2aMP+rmbsAoPvUvSuj+cfJkAhYZF8nZvpy2
         Y0a9hQYnxZmSHF4S14x7P/F2cMXH6vmDrX1/IZ8zzdXgihagBZhmyJSmE/NCwcSfrwIg
         1V1slQ0FY91qJDjXDay1507ut2oUQQC8K9xSoUgp7U09qnBVZmLzDegJ7Ijwhl+LK484
         TmOOLVbL7sxyIQJvLYRVhBOpw2hYQBFrAmNfpF0dD8g7bWmvdQtfXPOyBJAzQLtlFA68
         8U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YOdZFvk+6bmIjWVMk3ZS5OgJr20Jdq2fWyo55D6d2YE=;
        b=dusxenv/46FeBM2U0xTl17VwJrqDnrIqkVQ/Kq0namrAO/Y9onMVbXl+MJi1KCvKoB
         FeiBr3gh717K/BGgSFXX30ET8f/1TUuTll72x2OpydNslHfJIeyafdLgoxj3VjP8QMbD
         Q/iP70+IF3l5NSi5zbqe946P0Od/8IZQCKUHLWp+gnWP4vweYD9DOuxsWeQjZayTI49l
         BnzSjg5S0TBSUaGiB2IvGuHiHP8FI1S5130LABOsepeLCq7vp39OuJZXOVRJoaaodCFa
         Iyu5igRLOglzugxuwgM4H7y9365mQ2g5MyNXVTv2iHSXrtnNYs2kcVVidH4SecNvdywO
         yJOg==
X-Gm-Message-State: AGi0PubQWbl2CBu7qvcnUGWC5BGhgbio4s6eVMZ6tuKYoVAOXWZVKGFh
        uFiVYfOE6CnRvLDuvJ6cS4ztfRAp54vm+Q==
X-Google-Smtp-Source: APiQypLM9f008fp5IFx6gLV69yBrskOt/tFdR+z6lhjdhE+NpzJFeXdKMs3e/XH5IvGHEi4JCNvPAQ==
X-Received: by 2002:a17:90b:14ce:: with SMTP id jz14mr664508pjb.30.1587516861090;
        Tue, 21 Apr 2020 17:54:21 -0700 (PDT)
Received: from ?IPv6:2604:4080:1012:8d30:9eb6:d0ff:fe8b:175f? ([2604:4080:1012:8d30:9eb6:d0ff:fe8b:175f])
        by smtp.gmail.com with ESMTPSA id c15sm3602690pfo.188.2020.04.21.17.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 17:54:20 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad - Add custom init packet for Xbox One S
 controllers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LuK1337 <priv.luk@gmail.com>
Cc:     Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <436c79ed-ca21-c075-e2da-0934da5000a2@gmail.com>
 <20200421092434.3360503-1-priv.luk@gmail.com>
 <20200421180851.GA125362@dtor-ws>
From:   Cameron Gutman <aicommander@gmail.com>
Message-ID: <92b71dc5-ddd5-7ffd-65f8-65a6610dfe43@gmail.com>
Date:   Tue, 21 Apr 2020 17:54:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200421180851.GA125362@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/21/20 11:08 AM, Dmitry Torokhov wrote:
> Adding Cameron...
> 
> On Tue, Apr 21, 2020 at 11:24:33AM +0200, LuK1337 wrote:
>> From: Łukasz Patron <priv.luk@gmail.com>
>>
>> Sending [ 0x05, 0x20, 0x02, 0x0f, 0x06 ] packet for
>> Xbox One S controllers fixes an issue where controller
>> is stuck in Bluetooth mode and not sending any inputs.
>>

This one is much better. It's working on both the old 3.1 firmware and the
new 4.8 firmware for the Xbox One S controller.

Just for fun I also decided to test this against my other Xbox One gamepads:
- idVendor=045e, idProduct=02ea, bcdDevice= 3.01
- idVendor=045e, idProduct=02ea, bcdDevice= 4.08
- idVendor=045e, idProduct=02dd, bcdDevice= 2.03
- idVendor=24c6, idProduct=543a, bcdDevice= 1.01

Initialization was successful on all 4 tested gamepads, so this packet looks
well-tolerated across the range of devices.

I think we should also mark this for stable to get this backported to older
kernels, otherwise input will break as users update their firmware. Since you
mentioned you are new to LKML, you can read about stable updates here [0]
and include the Cc tag on v2 of this patch with my suggested changes below
if you agree.

>> Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
>> ---
>>  drivers/input/joystick/xpad.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index 6b40a1c68f9f..4e1781968411 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -458,6 +458,15 @@ static const u8 xboxone_fw2015_init[] = {
>>  	0x05, 0x20, 0x00, 0x01, 0x00
>>  };
>>  
>> +/*
>> + * This packet is required for Xbox One S pads (0x045e:0x02ea)
>> + * to initialize the controller that was previously used in
>> + * Bluetooth mode.
>> + */
>> +static const u8 xboxone_s_init[] = {
>> +	0x05, 0x20, 0x02, 0x0f, 0x06
>> +};

The sequence numbers are populated when the driver sends the init packet, so
you should go ahead and replace that 0x02 with 0x00 to match the other packets.

>> +
>>  /*
>>   * This packet is required for the Titanfall 2 Xbox One pads
>>   * (0x0e6f:0x0165) to finish initialization and for Hori pads
>> @@ -516,6 +525,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
>>  	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_init),
>>  	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_init),
>>  	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
>> +	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),

Can you also add an entry here for the Xbox One Elite Series 2 (0x045e, 0x0b00)
gamepad? According to [1], it has the same problem as the Xbox One S with the
4.8 firmware when exiting Bluetooth mode.

>>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
>>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
>>  	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
>> -- 
>> 2.26.0
>>
> 

[0]: https://www.kernel.org/doc/html/v5.6/process/stable-kernel-rules.html
[1]: https://github.com/spurious/SDL-mirror/commit/a0f80727972429bad309d7cf6cca949801d11d45

Regards,
Cameron



