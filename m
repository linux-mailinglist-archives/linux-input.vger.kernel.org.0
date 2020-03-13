Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 356BF184923
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 15:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgCMOUH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 10:20:07 -0400
Received: from mail.astralinux.ru ([217.74.38.120]:57369 "EHLO astralinux.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726406AbgCMOUH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 10:20:07 -0400
Received: from [46.148.196.138] (account dmastykin@astralinux.ru HELO [192.168.32.103])
  by astralinux.ru (CommuniGate Pro SMTP 6.2.7)
  with ESMTPSA id 1759932; Fri, 13 Mar 2020 17:17:52 +0300
Subject: Re: [PATCH v2 2/2] Input: goodix - Ignore spurious interrupts
To:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20200312145009.27449-1-dmastykin@astralinux.ru>
 <20200312145009.27449-2-dmastykin@astralinux.ru>
 <f7519cf8de6bd6982ae1064d0352370f2d725444.camel@hadess.net>
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
Message-ID: <ca4b48c0-bff4-99ba-1870-7484a30825b1@astralinux.ru>
Date:   Fri, 13 Mar 2020 17:20:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f7519cf8de6bd6982ae1064d0352370f2d725444.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,
Agree, it's better like this, especially the header.
Kind regards
Dmitry Mastykin

On 3/13/20 4:28 PM, Bastien Nocera wrote:
> On Thu, 2020-03-12 at 17:50 +0300, Dmitry Mastykin wrote:
>> The goodix panel sends spurious interrupts after a 'finger up' event,
>> which always cause a timeout.
>> The timeout was reported as touch_num == 0 and caused reading of
>> not ready buffer and false key release event.
>> In this patch the timeout is reported as ENOMSG and not processed.
> 
> I think a better commit message would be:
> "
> Input: goodix - Fix spurious key release events
> 
> The goodix panel sends spurious interrupts after a 'finger up' event,
> which always cause a timeout.
> We were exiting the interrupt handler by reporting touch_num == 0, but
> this was still processed as valid and caused the code to use the
> uninitialised point_data, creating spurious key release events.
> 
> Report an error from the interrupt handler so as to avoid processing
> invalid point_data further.
> "
> 
> Looks good otherwise.
> 
>>
>> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
>> ---
>> Changes in v2:
>> - Improve commit message
>> ---
>>   drivers/input/touchscreen/goodix.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c
>> b/drivers/input/touchscreen/goodix.c
>> index daf1781..0e14719 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -329,7 +329,7 @@ static int goodix_ts_read_input_report(struct
>> goodix_ts_data *ts, u8 *data)
>>   	 * The Goodix panel will send spurious interrupts after a
>>   	 * 'finger up' event, which will always cause a timeout.
>>   	 */
>> -	return 0;
>> +	return -ENOMSG;
>>   }
>>   
>>   static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8
>> *coor_data)
> 
