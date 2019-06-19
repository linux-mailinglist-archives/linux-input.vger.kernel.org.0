Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04BCF4BFEB
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 19:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730435AbfFSRkg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 13:40:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38914 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730224AbfFSRkg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 13:40:36 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 78D3561B7E; Wed, 19 Jun 2019 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560966034;
        bh=3g9wLryrQ2F10ZSjtE5svtR7JJ802mUzznx1+lwmBzs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=k16j+97HKeRzrK2dBga+ebAtQTXtxl0uthMtVMONMf/w9PvQiBR3zFrN8R9BCQBZu
         i7BbsW9mYNAJRiuJmchVuqQklJAwHAFc0F1FXoFstBVFq7rWlKPPOlDrIopgV4Oc1n
         0p+SqFJzhTDzxMcnJqa5VcE51i6sjk9OqXCENVO0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D85FB618EA;
        Wed, 19 Jun 2019 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560966030;
        bh=3g9wLryrQ2F10ZSjtE5svtR7JJ802mUzznx1+lwmBzs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kleMmKW0cdmDe0Y3kyJmC0sfObgfizGuc5eh8tpwyhr9krvCDvVkTtuU13eoKcbAP
         zhj2SEhIKm/wIrRhf23XD6KrqRcstL8hpTMx8cKoFV2tc1u5z1wGiTxd81DOx3mfO7
         plBfFAhGOC4cwTIs2QcG1QQOS/okDiobs6Ilbucs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D85FB618EA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v6 2/5] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        hdegoede@redhat.com, bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
 <20190612212721.32195-1-jeffrey.l.hugo@gmail.com>
 <20190612214636.GA40779@dtor-ws>
 <84e7d83f-e133-0281-612a-94d8c4319040@codeaurora.org>
 <20190619171010.24c25oenpmjpiayw@penguin>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <8cd10509-6a67-7c5b-9139-89bdcaa35f3f@codeaurora.org>
Date:   Wed, 19 Jun 2019 11:40:28 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619171010.24c25oenpmjpiayw@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/19/2019 11:10 AM, Dmitry Torokhov wrote:
> On Wed, Jun 12, 2019 at 04:20:42PM -0600, Jeffrey Hugo wrote:
>> On 6/12/2019 3:46 PM, Dmitry Torokhov wrote:
>>> On Wed, Jun 12, 2019 at 02:27:21PM -0700, Jeffrey Hugo wrote:
>>>> There needs to be coordination between hid-quirks and the elan_i2c driver
>>>> about which devices are handled by what drivers.  Currently, both use
>>>> whitelists, which results in valid devices being unhandled by default,
>>>> when they should not be rejected by hid-quirks.  This is quickly becoming
>>>> an issue.
>>>>
>>>> Since elan_i2c has a maintained whitelist of what devices it will handle,
>>>> which is now in a header file that hid-quirks can access, use that to
>>>> implement a blacklist in hid-quirks so that only the devices that need to
>>>> be handled by elan_i2c get rejected by hid-quirks, and everything else is
>>>> handled by default.
>>>>
>>>> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>>>> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>>>> ---
>>>>    drivers/hid/hid-quirks.c | 27 ++++++++++++++++-----------
>>>>    1 file changed, 16 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>>>> index e5ca6fe2ca57..bd81bb090222 100644
>>>> --- a/drivers/hid/hid-quirks.c
>>>> +++ b/drivers/hid/hid-quirks.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include <linux/export.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/mutex.h>
>>>> +#include <linux/input/elan-i2c-ids.h>
>>>>    #include "hid-ids.h"
>>>> @@ -914,6 +915,8 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
>>>>    bool hid_ignore(struct hid_device *hdev)
>>>>    {
>>>> +	int i;
>>>> +
>>>>    	if (hdev->quirks & HID_QUIRK_NO_IGNORE)
>>>>    		return false;
>>>>    	if (hdev->quirks & HID_QUIRK_IGNORE)
>>>> @@ -978,18 +981,20 @@ bool hid_ignore(struct hid_device *hdev)
>>>>    		break;
>>>>    	case USB_VENDOR_ID_ELAN:
>>>>    		/*
>>>> -		 * Many Elan devices have a product id of 0x0401 and are handled
>>>> -		 * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
>>>> -		 * is not (and cannot be) handled by that driver ->
>>>> -		 * Ignore all 0x0401 devs except for the ELAN0800 dev.
>>>> +		 * Blacklist of everything that gets handled by the elan_i2c
>>>> +		 * input driver.  This avoids disabling valid touchpads and
>>>> +		 * other ELAN devices.
>>>>    		 */
>>>> -		if (hdev->product == 0x0401 &&
>>>> -		    strncmp(hdev->name, "ELAN0800", 8) != 0)
>>>> -			return true;
>>>> -		/* Same with product id 0x0400 */
>>>> -		if (hdev->product == 0x0400 &&
>>>> -		    strncmp(hdev->name, "QTEC0001", 8) != 0)
>>>> -			return true;
>>>> +		if ((hdev->product == 0x0401 || hdev->product == 0x0400)) {
>>>> +			for (i = 0; strlen(elan_acpi_id[i].id); ++i)
>>>> +				if (!strncmp(hdev->name, elan_acpi_id[i].id,
>>>> +					     strlen(elan_acpi_id[i].id)))
>>>> +					return true;
>>>> +			for (i = 0; strlen(elan_of_match[i].name); ++i)
>>>> +				if (!strncmp(hdev->name, elan_of_match[i].name,
>>>> +					     strlen(elan_of_match[i].name)))
>>>> +					return true;
>>>
>>> Do we really need to blacklist the OF case here? I thought that in ACPI
>>> case we have clashes as HID gets matched by elan_i2c and CID is matched
>>> by i2c-hid, but I do not believe we'll run into the same situation on OF
>>> systems.
>>
>> I think its the safer approach.
>>
>> On an OF system, such as patch 3 in the series, the "hid-over-i2c" will end
>> up running through this (kind of the whole reason why this series exists).
>> The vendor and product ids will still match, so we'll end up going through
>> the lists to see if the hdev->name (the compatible string) will match the
>> blacklist.  "hid-over-i2c" won't match the blacklist, but if there is a more
>> specific compatible, it might.
>>
>> In that case, not matching OF would work, however how it could break today
>> is if both "hid-over-i2c" and "elan,ekth3000" were listed for the same
>> device, and elan_i2c was not compiled.  In that case, if we skip the OF part
>> of the black list, hid-quirks will not reject the device, and you'll
>> probably have some odd behavior instead of the obvious "the device doesn't
>> work because the correct driver isn't present" behavior.
>>
>> While that scenario might be far fetched since having both "hid-over-i2c"
>> and "elan,ekth3000" probably violates the OF bindings, its still safer to
>> include the OF case in the blacklist against future scenarios.
> 
> Yes, I believe it is quite far fetched. We are talking about someone
> setting compatible sting to something that is decidedly not compatible.
> I.e. we know that devices driven by elan_i2c are not compatible with
> hi-over-i2c driver/protocol, so why do we expect that they both will be
> specified in the same compatible string? I know ACPI case is messier in
> this regard as 2 drivers look at the different data items when
> evaluating whether they should bind to the device, but here we are
> dealing with the same string.

Alright.  Sounds like you really want the DT matching dropped, so I'll 
update the series with a new version ASAP that drops that.
