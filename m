Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D916242929
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 16:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437710AbfFLO3r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 10:29:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33736 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437399AbfFLO3r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 10:29:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3A02961795; Wed, 12 Jun 2019 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560349786;
        bh=2Oiz7arDHtcsbqJ5qurHIFsnbQjEzk7WOOl4kBSHdr4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=H3bVY9VINfmcsDU+Nvxdu9FSmyf8DmLum+Woq+cWB010tBej6zfw5hNgH1ubrnnmr
         9u20fq1dv181uxe2RGgPN3UPe36GzMSlHORgtNnVPmts6dCMpmxkR1l6SnDCwlUdMi
         +frHGk8hXTIoopnxE8Di6PTq1otntW2E4Y1O1UXg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B603661795;
        Wed, 12 Jun 2019 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560349784;
        bh=2Oiz7arDHtcsbqJ5qurHIFsnbQjEzk7WOOl4kBSHdr4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TMF+IA/JNP7TGUt4oK6PzyzIlIkKk01X82x73NaflUjs4WU5GpDNr+PS18JDi/qCn
         D8HcBqsfM5qP0oRNjLnNR7n8QO7agdMqRP3qFpods57JWHd8byvqbM0sZYZn89hZuk
         ls1QG+T86h2A8rRtmLxJR8noBS+CjbMuE0+Whl6c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B603661795
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v5 2/3] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        bjorn.andersson@linaro.org, lee.jones@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org,
        david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
 <20190606161322.47192-1-jeffrey.l.hugo@gmail.com>
 <20190612003507.GG143729@dtor-ws>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <2282f3e1-e76a-4fe7-d447-51d9a4bee2de@codeaurora.org>
Date:   Wed, 12 Jun 2019 08:29:43 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612003507.GG143729@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/11/2019 6:35 PM, Dmitry Torokhov wrote:
> On Thu, Jun 06, 2019 at 09:13:22AM -0700, Jeffrey Hugo wrote:
>> There needs to be coordination between hid-quirks and the elan_i2c driver
>> about which devices are handled by what drivers.  Currently, both use
>> whitelists, which results in valid devices being unhandled by default,
>> when they should not be rejected by hid-quirks.  This is quickly becoming
>> an issue.
>>
>> Since elan_i2c has a maintained whitelist of what devices it will handle,
>> use that to implement a blacklist in hid-quirks so that only the devices
>> that need to be handled by elan_i2c get rejected by hid-quirks, and
>> everything else is handled by default.  The downside is the whitelist and
>> blacklist need to be kept in sync.
>>
>> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>> ---
>>   drivers/hid/hid-quirks.c | 78 ++++++++++++++++++++++++++++++++++------
>>   1 file changed, 67 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>> index e5ca6fe2ca57..edebd0700e3d 100644
>> --- a/drivers/hid/hid-quirks.c
>> +++ b/drivers/hid/hid-quirks.c
>> @@ -912,8 +912,66 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
>>   	{ }
>>   };
>>   
>> +/*
>> + * List of device names that elan_i2c is handling and HID should ignore.  Must
>> + * be kept in sync with elan_i2c
>> + */
>> +static const char *hid_elan_i2c_ignore[] = {
> 
> If this is a copy of elan whitelist, then, if we do not want to bother
> with sharing it in object form (as a elan-i2c-ids module), can we at
> least move it into include/linux/input/elan-i2c-ids.h and consume from
> hid-quirks.c?

I can put it in a shared header file, however elan-i2c and hid-quirks
would need to be updated in the same change to prevent a breakage, but
that would seem to violate a concern Benjamin brought up in v4 given
that elan-i2c is maintained in your input tree, and hid-quirks is
maintained in his hid tree.

Are you ok with the elan-i2c changes going through Benjamin's hid tree?

