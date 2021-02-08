Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C85F31365A
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 16:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhBHPJr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Feb 2021 10:09:47 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58387 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhBHPIY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Feb 2021 10:08:24 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l988U-0002fU-6W; Mon, 08 Feb 2021 15:07:34 +0000
Subject: Re: [PATCH] HID: logitech-dj: fix unintentional integer overflow on
 left shift
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210207232120.8885-1-colin.king@canonical.com>
 <20210208150610.GI2696@kadam>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <7f79107a-93ad-251d-33bd-9a2cf2748aa9@canonical.com>
Date:   Mon, 8 Feb 2021 15:07:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208150610.GI2696@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 08/02/2021 15:06, Dan Carpenter wrote:
> On Sun, Feb 07, 2021 at 11:21:20PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Shifting the integer value 1 is evaluated using 32-bit rithmetic
>> and then used in an expression that expects a 64-bit value, so
>> there is potentially an integer overflow. Fix this by using th
>> BIT_ULL macro to perform the shift and avoid the overflow.
>>
>> Addresses-Coverity: ("Uninitentional integer overflow")
>> Fixes: 534a7b8e10ec ("HID: Add full support for Logitech Unifying receivers")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/hid/hid-logitech-dj.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
>> index 45e7e0bdd382..747f41be0603 100644
>> --- a/drivers/hid/hid-logitech-dj.c
>> +++ b/drivers/hid/hid-logitech-dj.c
>> @@ -1035,7 +1035,7 @@ static void logi_dj_recv_forward_null_report(struct dj_receiver_dev *djrcv_dev,
>>  	memset(reportbuffer, 0, sizeof(reportbuffer));
>>  
>>  	for (i = 0; i < NUMBER_OF_HID_REPORTS; i++) {
>                         ^^^^^^^^^^^^^^^^^^^^^
> This is 32, so it can't be undefined.

Urgh, looks like coverity is being overly pedantic here. :-(

> 
>> -		if (djdev->reports_supported & (1 << i)) {
>> +		if (djdev->reports_supported & BIT_ULL(i)) {
>>  			reportbuffer[0] = i;
>>  			if (hid_input_report(djdev->hdev,
>>  					     HID_INPUT_REPORT,
> 
> regards,
> dan carpenter
> 

