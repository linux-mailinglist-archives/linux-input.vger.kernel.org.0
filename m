Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5D969EB0A
	for <lists+linux-input@lfdr.de>; Wed, 22 Feb 2023 00:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjBUXO1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Feb 2023 18:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjBUXO1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Feb 2023 18:14:27 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35902B293
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 15:14:24 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 378A185A7C;
        Wed, 22 Feb 2023 00:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677021262;
        bh=8NU2a6WxClrdqeQa93YZvK8Lhf9nDnAd6gDovLf85F0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JdI+qidz0F2XO+lmyaEnNzoBrPGPJNepemkflSM7kKPb6GXG6x8thsgU8PuT89XX3
         0Dn+Z1jKf9+z/4l9pYtEdsA+vCR/EYbHKFDw/xOXeBA3lfKBxtdiGBt+1dzQHwYX2R
         iDW0eo4KhInr7pKPNuhzu0VXORG7tIZGiEypQW2etHpVR2K4lRYMbMTPsTsTFsHWiA
         0iy09u6Q9jhE7rDM/4KK8nSkUILFOCRm3Qff00gD+EV2r6DtBzHLxOPlfPtUX+zJcR
         codrOxTrtLLveGrBmOHvzQnW5mTxgIfdRBkZeUyWCWX3qJS5HsvXwbFig8kkrTAol8
         jCL7s17wc8QCg==
Message-ID: <83bf921d-e941-3f93-6264-2e5a70f1aff5@denx.de>
Date:   Wed, 22 Feb 2023 00:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] Input: ili210x - Probe even if no resolution
 information
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
References: <20230217025200.203833-1-marex@denx.de>
 <Y/UeFbZaMtHLuljN@google.com> <bb6ad0b1-dc51-6002-a179-bbe59ff4d701@denx.de>
 <Y/U0LTx2O2bVsUKY@google.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y/U0LTx2O2bVsUKY@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2/21/23 22:14, Dmitry Torokhov wrote:
> On Tue, Feb 21, 2023 at 09:12:29PM +0100, Marek Vasut wrote:
>> On 2/21/23 20:40, Dmitry Torokhov wrote:
>>> Hi Marek,
>>>
>>> On Fri, Feb 17, 2023 at 03:52:00AM +0100, Marek Vasut wrote:
>>>> Probe the touch controller driver even if resolution information is not
>>>> available. This can happen e.g. in case the touch controller suffered a
>>>> failed firmware update and is stuck in bootloader mode.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>> Cc: Joe Hung <joe_hung@ilitek.com>
>>>> Cc: Luca Hsu <luca_hsu@ilitek.com>
>>>> ---
>>>> V2: Add dev_warn() in case resolution is invalid
>>>> ---
>>>>    drivers/input/touchscreen/ili210x.c | 28 +++++++++++++++++++---------
>>>>    1 file changed, 19 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
>>>> index 4897fafa4204d..d64b6d77d2e08 100644
>>>> --- a/drivers/input/touchscreen/ili210x.c
>>>> +++ b/drivers/input/touchscreen/ili210x.c
>>>> @@ -370,22 +370,33 @@ static int ili251x_firmware_update_resolution(struct device *dev)
>>>>    	/* The firmware update blob might have changed the resolution. */
>>>>    	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
>>>> -	if (error)
>>>> -		return error;
>>>> +	if (!error) {
>>>> +		resx = le16_to_cpup((__le16 *)rs);
>>>> +		resy = le16_to_cpup((__le16 *)(rs + 2));
>>>> -	resx = le16_to_cpup((__le16 *)rs);
>>>> -	resy = le16_to_cpup((__le16 *)(rs + 2));
>>>> +		/* The value reported by the firmware is invalid. */
>>>> +		if (!resx || resx == 0xffff || !resy || resy == 0xffff)
>>>> +			error = -EINVAL;
>>>> +	}
>>>> -	/* The value reported by the firmware is invalid. */
>>>> -	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
>>>> -		return -EINVAL;
>>>> +	/*
>>>> +	 * In case of error, the firmware might be stuck in bootloader mode,
>>>> +	 * e.g. after a failed firmware update. Set maximum resolution, but
>>>> +	 * do not fail to probe, so the user can re-trigger the firmware
>>>> +	 * update and recover the touch controller.
>>>> +	 */
>>>> +	if (error) {
>>>> +		dev_warn(dev, "Invalid resolution reported by controller.\n");
>>>> +		resx = 16384;
>>>> +		resy = 16384;
>>>> +	}
>>>>    	input_abs_set_max(priv->input, ABS_X, resx - 1);
>>>>    	input_abs_set_max(priv->input, ABS_Y, resy - 1);
>>>>    	input_abs_set_max(priv->input, ABS_MT_POSITION_X, resx - 1);
>>>>    	input_abs_set_max(priv->input, ABS_MT_POSITION_Y, resy - 1);
>>>> -	return 0;
>>>> +	return error;
>>>
>>> I think this will make ili251x_firmware_update_cached_state() continue
>>> failing when it reports invalid coordinates. Was this intended?
>>
>> This is actually correct, ili251x_firmware_update_cached_state() will fail,
>> but ili210x_i2c_probe() won't stop there anymore, see the second hunk of
>> this patch. The driver will instantiate the controller, so user can load
>> correct firmware into it and recover the hardware.
> 
> I was concerned about call from ili210x_firmware_update_store() which
> will continue returning error.

It hopefully won't, because at that point the controller would be 
running new and working firmware, which would report the correct values. 
If the firmware is broken, then yes, it would fail.
