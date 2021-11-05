Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A01D446A2E
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 21:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbhKEU4V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 16:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhKEU4V (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 16:56:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816D3C061714;
        Fri,  5 Nov 2021 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=foWIUn3EVKz1t6fa/u04+WvizPsE4kVQFqtzJb/v8vA=; b=3xb1NDkrBW9UmfQcm7RJORPNxA
        wfhJXEreFdQRsnrFYkej5Nyaj8osXkrRvkhEbaVG5My7o+6MQfWP/WGgY9/5st+Z6Tj2gSytcsvT3
        PPMdmK2sz8f/L4pIWe37TX7kHuPuHxj5QWg7ZuQvvcQWp3i86anJq3T162g3ejts6DDVaa431OFQJ
        sEBL9hXX+x/LWumLxuq7IJNv02mw/vGtsz5d7jw0L5BtI4B3/GGdckGlRcmLODyj6tOmxhGEYR8K6
        KF5LLOONt6IbNJWBgbqhvCr3GYOrfjzEU/l2/I3pbKgxWKpmLCJsFpKmwVBqSeziordL0DUSswYkW
        d3GqkHtQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mj6DU-00CKk3-LY; Fri, 05 Nov 2021 20:53:40 +0000
Subject: Re: [RFC 6/8] HID: usi: Add driver for Universal Stylus Interface
 (USI)
To:     Tero Kristo <tero.kristo@linux.intel.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, mika.westerberg@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
 <20211104133701.1733551-7-tero.kristo@linux.intel.com>
 <07757860-06bd-b47a-51ff-24cf31a7b28b@infradead.org>
 <1c3bb031-c4dc-6525-95c0-c41c84b47ea5@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <27f5089a-36a4-18ae-a75d-7db106ea5267@infradead.org>
Date:   Fri, 5 Nov 2021 13:53:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1c3bb031-c4dc-6525-95c0-c41c84b47ea5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/4/21 11:33 PM, Tero Kristo wrote:
> 
> On 04/11/2021 17:03, Randy Dunlap wrote:
>> On 11/4/21 6:36 AM, Tero Kristo wrote:
>>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>>> index 3c33bf572d6d..c235ecb8f037 100644
>>> --- a/drivers/hid/Kconfig
>>> +++ b/drivers/hid/Kconfig
>>> @@ -1222,6 +1222,11 @@ config HID_MCP2221
>>>       To compile this driver as a module, choose M here: the module
>>>       will be called hid-mcp2221.ko.
>>>   +config HID_USI
>>> +    tristate "USI (Universal Stylus Interface) support"
>>> +    help
>>> +    Provides USI support over I2C HID interface.
>>
>> Indent help text "Provides ..." with 2 additional spaces, please,
>> per coding-style.rst.
>>
> Sorry yeah, this slipped through. Seems most of the drivers/hid/Kconfig is with wrong indentation, copied layout from there. I also need to add a bit more beef to this help text while updating it, and remove the mention of i2c only.

Thanks for adding more beef to it.

And yes, I have noticed that drivers/hid/Kconfig is a bit messy. :\

-- 
~Randy
