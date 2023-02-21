Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3FF69E8EA
	for <lists+linux-input@lfdr.de>; Tue, 21 Feb 2023 21:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjBUUMe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Feb 2023 15:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjBUUMd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Feb 2023 15:12:33 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D518FE068
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 12:12:31 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9FEF385A5F;
        Tue, 21 Feb 2023 21:12:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677010350;
        bh=Rd3BFAiNZDn+MqoEoWRfEjEkSI3JgbQpI1rzULApEow=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=uAyhoyRSdWXxu+50SPwa/O0EIFg0+kpdeSLtn6CCo11UsSLFuf8S2qPvdSn/fUoK5
         ikTj+kS9Lycxkpb/Ziv0KuFFLJuABjscI0HHTtbqyNRqbljRzdE6uTT1hOtfviDtX6
         gQn7JG8YVbe5I99wfeiqAv90qRheOqUKq8iSrCKoI7EHsKaRfg2n4SfhkE/lrIVb71
         YpwjVJIgcb3gQbGdtpQfweBxm/Xn2K8r0fikWiFzM19DvAHbjYG0H7ru9sJRfTSrE8
         3dJ6ncBWLW88M0yGoWNcMvBb00+X9/OEqYQZFhyOpZtzuM0oyzDqJ0PV9ePA/K4Hs1
         zpxglDtJ+NT/Q==
Message-ID: <bb6ad0b1-dc51-6002-a179-bbe59ff4d701@denx.de>
Date:   Tue, 21 Feb 2023 21:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] Input: ili210x - Probe even if no resolution
 information
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
References: <20230217025200.203833-1-marex@denx.de>
 <Y/UeFbZaMtHLuljN@google.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y/UeFbZaMtHLuljN@google.com>
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

On 2/21/23 20:40, Dmitry Torokhov wrote:
> Hi Marek,
> 
> On Fri, Feb 17, 2023 at 03:52:00AM +0100, Marek Vasut wrote:
>> Probe the touch controller driver even if resolution information is not
>> available. This can happen e.g. in case the touch controller suffered a
>> failed firmware update and is stuck in bootloader mode.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Joe Hung <joe_hung@ilitek.com>
>> Cc: Luca Hsu <luca_hsu@ilitek.com>
>> ---
>> V2: Add dev_warn() in case resolution is invalid
>> ---
>>   drivers/input/touchscreen/ili210x.c | 28 +++++++++++++++++++---------
>>   1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
>> index 4897fafa4204d..d64b6d77d2e08 100644
>> --- a/drivers/input/touchscreen/ili210x.c
>> +++ b/drivers/input/touchscreen/ili210x.c
>> @@ -370,22 +370,33 @@ static int ili251x_firmware_update_resolution(struct device *dev)
>>   
>>   	/* The firmware update blob might have changed the resolution. */
>>   	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
>> -	if (error)
>> -		return error;
>> +	if (!error) {
>> +		resx = le16_to_cpup((__le16 *)rs);
>> +		resy = le16_to_cpup((__le16 *)(rs + 2));
>>   
>> -	resx = le16_to_cpup((__le16 *)rs);
>> -	resy = le16_to_cpup((__le16 *)(rs + 2));
>> +		/* The value reported by the firmware is invalid. */
>> +		if (!resx || resx == 0xffff || !resy || resy == 0xffff)
>> +			error = -EINVAL;
>> +	}
>>   
>> -	/* The value reported by the firmware is invalid. */
>> -	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
>> -		return -EINVAL;
>> +	/*
>> +	 * In case of error, the firmware might be stuck in bootloader mode,
>> +	 * e.g. after a failed firmware update. Set maximum resolution, but
>> +	 * do not fail to probe, so the user can re-trigger the firmware
>> +	 * update and recover the touch controller.
>> +	 */
>> +	if (error) {
>> +		dev_warn(dev, "Invalid resolution reported by controller.\n");
>> +		resx = 16384;
>> +		resy = 16384;
>> +	}
>>   
>>   	input_abs_set_max(priv->input, ABS_X, resx - 1);
>>   	input_abs_set_max(priv->input, ABS_Y, resy - 1);
>>   	input_abs_set_max(priv->input, ABS_MT_POSITION_X, resx - 1);
>>   	input_abs_set_max(priv->input, ABS_MT_POSITION_Y, resy - 1);
>>   
>> -	return 0;
>> +	return error;
> 
> I think this will make ili251x_firmware_update_cached_state() continue
> failing when it reports invalid coordinates. Was this intended?

This is actually correct, ili251x_firmware_update_cached_state() will 
fail, but ili210x_i2c_probe() won't stop there anymore, see the second 
hunk of this patch. The driver will instantiate the controller, so user 
can load correct firmware into it and recover the hardware.
