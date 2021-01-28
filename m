Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188F03078D6
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 16:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhA1O50 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 09:57:26 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42430 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbhA1O41 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 09:56:27 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l58i1-0004jj-BX; Thu, 28 Jan 2021 14:55:45 +0000
Subject: Re: [PATCH][next] Input: iqs5xx: Ensure error_bl is initialized on
 error exit path
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210128121903.636652-1-colin.king@canonical.com>
 <20210128143946.GA14625@labundy.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <b5dc0706-1933-fd2b-5dfc-49fb4aed38f1@canonical.com>
Date:   Thu, 28 Jan 2021 14:55:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128143946.GA14625@labundy.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28/01/2021 14:39, Jeff LaBundy wrote:
> Hi Colin,
> 
> On Thu, Jan 28, 2021 at 12:19:03PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently if the call to qs5xx_fw_file_parse fails the error return
>> exit path will read the uninitialized variable error_bl. Fix this
>> by ensuring error_bl is initialized to zero.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
>> Fixes: 2539da6677b6 ("Input: iqs5xx - preserve bootloader errors")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This was fixed in [1]; it just needs pushed.

OK, thanks for letting me know.
> 
> [1] https://patchwork.kernel.org/patch/12043701
> 
>> ---
>>  drivers/input/touchscreen/iqs5xx.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
>> index 05e0c6ff217b..54f30038dca4 100644
>> --- a/drivers/input/touchscreen/iqs5xx.c
>> +++ b/drivers/input/touchscreen/iqs5xx.c
>> @@ -852,7 +852,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
>>  static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
>>  {
>>  	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
>> -	int error, error_bl;
>> +	int error, error_bl = 0;
>>  	u8 *pmap;
>>  
>>  	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_NONE)
>> -- 
>> 2.29.2
>>
> 
> Kind regards,
> Jeff LaBundy
> 

