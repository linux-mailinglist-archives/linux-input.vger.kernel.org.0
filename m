Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60349445FB4
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 07:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhKEGge (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 02:36:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:4603 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhKEGgd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Nov 2021 02:36:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="212598629"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; 
   d="scan'208";a="212598629"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 23:33:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; 
   d="scan'208";a="639630158"
Received: from therrane-mobl.ger.corp.intel.com (HELO [10.249.32.113]) ([10.249.32.113])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 23:33:53 -0700
Subject: Re: [RFC 6/8] HID: usi: Add driver for Universal Stylus Interface
 (USI)
To:     Randy Dunlap <rdunlap@infradead.org>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, mika.westerberg@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
 <20211104133701.1733551-7-tero.kristo@linux.intel.com>
 <07757860-06bd-b47a-51ff-24cf31a7b28b@infradead.org>
From:   Tero Kristo <tero.kristo@linux.intel.com>
Message-ID: <1c3bb031-c4dc-6525-95c0-c41c84b47ea5@linux.intel.com>
Date:   Fri, 5 Nov 2021 08:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <07757860-06bd-b47a-51ff-24cf31a7b28b@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 04/11/2021 17:03, Randy Dunlap wrote:
> On 11/4/21 6:36 AM, Tero Kristo wrote:
>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>> index 3c33bf572d6d..c235ecb8f037 100644
>> --- a/drivers/hid/Kconfig
>> +++ b/drivers/hid/Kconfig
>> @@ -1222,6 +1222,11 @@ config HID_MCP2221
>>       To compile this driver as a module, choose M here: the module
>>       will be called hid-mcp2221.ko.
>>   +config HID_USI
>> +    tristate "USI (Universal Stylus Interface) support"
>> +    help
>> +    Provides USI support over I2C HID interface.
>
> Indent help text "Provides ..." with 2 additional spaces, please,
> per coding-style.rst.
>
Sorry yeah, this slipped through. Seems most of the drivers/hid/Kconfig 
is with wrong indentation, copied layout from there. I also need to add 
a bit more beef to this help text while updating it, and remove the 
mention of i2c only.

-Tero

