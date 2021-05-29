Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBE4394CC6
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 17:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhE2PTd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 11:19:33 -0400
Received: from mail-oln040092065039.outbound.protection.outlook.com ([40.92.65.39]:23470
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229693AbhE2PTc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 11:19:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEyVJkMmJo8NIx76cpZzp27fI5pqP5H+tB6hLHHoLUnOtmfJaNuXLP3MpHYNhRgjl0N7CvITpvAR4nbo0UZsHE0Z9fq72qjQ5BeYXtKjt0vbncinwltSczE1dC3qm7zVLW8z5aGly2Mze8JgLmxNe6HBtvSkoZBqc0ToIxWh4CzGot03lvuEJ8SDkFbI8ImQNR2yi+8Xr+7SqmA9l4RTmlSbalUwusz6jI5guXA+74YClFyMXPCdCOP0arwy5wa8/y7WCawZhi/+yefhDfJ9t/lNSYX+ue5P+d8wwCmaGoS7BIT0NXVXkAqpyGmWeQWxBAd0Ag7ihxVTem2B5/vVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqyBDjIyFmdCcbRUuE2UWpgX0dTpQ1MQBZ9OJdDXb7o=;
 b=nf8N9wptz2MWWEmQYODjxjNF1J7LPHPZEwvgeHgkJ/6y/HeMzHEoq7UM25ng69Gg1vCdfAsQbzgD/bGa/dU9MQJIkx9cu/7Y+eN2+0xC/BhXrYY4qh6eshwl9TqsgC/DuvAoegkc9Is6/IDIdhIrW5hRWUeeKZJ3TUTlN8VOuYedB090fEwn24G/6oYQLOPjJQxibGRxnXRU7kiZDzEWcZGWNSF2WujOWYv6OAKhfKhtbit7xQymYI9te593Dh2Rf4Z1Kz6t+p7uBwSq+6DDGXp5e/6ZFgEBRu+dZ6V6sQo22NuT8h3P+QUCMSxdhUG+wDkNN4UFpiA6xqisD+ctDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::40) by
 VE1EUR01HT104.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::377)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.30; Sat, 29 May
 2021 15:17:53 +0000
Received: from AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 (2a01:111:e400:7e19::45) by VE1EUR01FT005.mail.protection.outlook.com
 (2a01:111:e400:7e19::142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.30 via Frontend
 Transport; Sat, 29 May 2021 15:17:53 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F9C3D44F2CA0855D177A19807EDF915D85808FB7323AE825BAE024773DC819D5;UpperCasedChecksum:B21A3F72AF20375DFD630FD195E34C831814E9D64EB2961100FAD019056B731C;SizeAsReceived:9701;Count:48
Received: from AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ad12:6a2c:b949:f65d]) by AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ad12:6a2c:b949:f65d%5]) with mapi id 15.20.4173.027; Sat, 29 May 2021
 15:17:53 +0000
Subject: Re: [PATCH v2] Input: elantech - fix x_max/y_max values
To:     jingle <jingle.wu@emc.com.tw>,
        'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
Cc:     'Benjamin Tissoires' <benjamin.tissoires@redhat.com>,
        "'Dave.Wang'" <dave.wang@emc.com.tw>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        'Kai-Heng Feng' <kai.heng.feng@canonical.com>,
        'Enrico Weigelt' <info@metux.net>,
        'Allison Randal' <allison@lohutok.net>,
        'Aaron Ma' <aaron.ma@canonical.com>,
        =?UTF-8?B?J+S5iemahi1waG9lbml4Jw==?= <phoenix@emc.com.tw>
References: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <CAO-hwJ+eua8-fNj9o8CxjFyM0i1+R9ZwPMroF9uLUH6NVu3Tdg@mail.gmail.com>
 <PR2PR03MB51799BF709B3975A08F139F4E4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <AM6PR03MB5170F5FC30556BEF89C775C2E4EB0@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB5170D26019747F5090FE74B5E4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB51702AF00C6BA06BBC9F517EE4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB51705B32136F527B99CCD907E4C10@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <20200409200746.GP75430@dtor-ws> <001b01d61223$3b1e5fd0$b15b1f70$@emc.com.tw>
From:   Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <AM8PR10MB4708F28B8B8ED4A9B2D843CFE4219@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
Date:   Sat, 29 May 2021 17:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <001b01d61223$3b1e5fd0$b15b1f70$@emc.com.tw>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN:  [9F0t3Q8LyCzKDzHUfcUoDb8rlzPsKSHj]
X-ClientProxiedBy: AM0PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:208:1::35) To AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:364::23)
X-Microsoft-Original-Message-ID: <844c2733-69b9-b500-2251-8d0ae645ed71@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.101] (84.57.61.94) by AM0PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:208:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Sat, 29 May 2021 15:17:52 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 939e2c92-09ae-4c6f-ad99-08d922b4ee0a
X-MS-TrafficTypeDiagnostic: VE1EUR01HT104:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KsMaawi22sAlVCxAZ8dzi6glMumFCq0+21YQIG9n1D6IJ97+4YWgM93pFCM1pH0q6xBensexXaSK89zRGIZFrx32XWCqV6pOOBU3APOW+ZJJ8bG6TWmUH25S3NYGPEZD60LxTPiXBmkO/6sxnGEqFA5AfF3ZRW961qAHEF4SD1j0yb/jrTK1bZivBIEYUpd6LBc9zVXRXXaLPca23d78W6ZTztRbFkpIAT7Yck89upPd/+iFdWwvkQ0C1IHwzrgc/Wf3ZwlUqq7/haAaqQjfplluUiZ2t3c1LJN3NlTmLE6q2EacF0XKLG3MP0IPPRLY+Dit1C8892Ma296OZ7sK8SH5IFzO4hVDRf8CgfpoL9IHOkEL7lTOwH5+PUCx7ztNiadri8vEoiDuenFq56xyAQ==
X-MS-Exchange-AntiSpam-MessageData: 0LZsK1zYUoXLTFaZs0fqOMEvKJc9ZZlsQ5UKO9HVG5MjbZsqNBe9S8VBrQ7jza8XJVRFpJRB8ZyrUKHhFb2NVcvqZYJ7UWy30FhmNrRFRXU9zXJcExJYBprJJvThTikw9Q3MfwoBZssiGD2CA+Pk8Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939e2c92-09ae-4c6f-ad99-08d922b4ee0a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2021 15:17:53.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT104
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

apologies for not responding earlier, but better late than never...

Okay, if I understood your advice correctly, you want me to
elantech_set_absolute_mode from elantech_query_info
for hardware version 2 and 3, before sending the ETP_FW_ID_QUERY
command, while hardware version 4 devices will not need that.

Initially when I wrote this patch I was concerned that there might
be a way how the firmware might be in a different state after doing
this when elantech_setup_smbus is called later.

But meanwhile I convinced myself that this can never happen, since
the elantech_setup_smbus seems to be unreachable for version < 4
devices.

I'll send a new version of the patch later today, if everything works
as expected.


Thanks,
Bernd.


On 4/14/20 8:09 AM, jingle wrote:
> Hi Dmitry, Bernd:
> 
> We have checked the related function internal. 
> It is right to switch the touchpad into absolute mode first to get valid
> results from the ID query call in hardware version 2 and 3.
> 
> Thanks
> jingle
> 
> -----Original Message-----
> From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
> Sent: Friday, April 10, 2020 4:08 AM
> To: Bernd Edlinger
> Cc: Benjamin Tissoires; Dave.Wang; jingle; linux-kernel@vger.kernel.org;
> linux-input@vger.kernel.org; Kai-Heng Feng; Enrico Weigelt; Allison Randal;
> Aaron Ma
> Subject: Re: [PATCH v2] Input: elantech - fix x_max/y_max values
> 
> Hi Bernd,
> 
> On Thu, Apr 09, 2020 at 07:38:17PM +0200, Bernd Edlinger wrote:
>> Are you there?
>>
>> Should I re-post the v2 patch, was that dropped somehow?
>>
>> If I don't hear anything I'll assume I just repost, probably as 
>> unchanged v3, right?
> 
> I do not think we ever got confirmation from Dave or Jingle; from my POV I
> really dislike arbitrary mangling of the data.
> 
> I think you are right that the issue is with order of calls, and we need to
> switch the touchpad into absolute mode to get valid results from the ID
> query call. Dave, Jingle, any impot here?
> 
> Benjamin, Kai-Feng, do you know if we try to switch to absolute mode to
> begin with, will it cause issues with SMBus mode?
> 
> Thanks.
> 
>>
>> Thanks,
>> Bernd.
>>
>>
>> On 4/5/20 7:54 AM, Bernd Edlinger wrote:
>>> And, furthermore, there is one thing I find really confusing,
>>>
>>> I do not see the message v2 quoted below which had an updated commit 
>>> message, due to that Benjamin Tissoires request.
>>>
>>> It was from my point of view sent on 2/27/20 11:03 PM, but I cannot 
>>> find it neither on spinics, nor on marc.info.
>>> That is funny.
>>>
>>> Did it reach you guys at all?
>>> Or should I re-send it just in case?
>>>
>>>
>>> Thanks
>>> Bernd.
>>>
>>> On 4/5/20 7:26 AM, Bernd Edlinger wrote:
>>>> Ping...
>>>>
>>>> This patch works fine for me since several weeks, without it I 
>>>> would not be able to use my laptop any more.
>>>>
>>>> Could you please accept this patch?
>>>>
>>>>
>>>> Thanks
>>>> Bernd.
>>>>
>>>>
>>>> On 2/27/20 11:03 PM, Bernd Edlinger wrote:
>>>>> Since commit 37548659bb22 ("Input: elantech - query the min/max 
>>>>> information beforehand too") moved the querying of the x_max/y_max 
>>>>> values from elantech_set_input_params to elantech_query_info, the 
>>>>> returned x_max/y_max values are different than before, at least 
>>>>> for some firmware versions.
>>>>>
>>>>> The reason is likely that this is now done before 
>>>>> elantech_set_absolute_mode does run.  So it may happen that the 
>>>>> returned values are exactly half of what they used to be, which 
>>>>> makes input_report_abs in PS/2 mode report ABS_X values which 
>>>>> exceed the x_max value, which is very annoying since the mouse 
>>>>> stops to move then, and ABS_Y value become negative, which is benign.
>>>>>
>>>>> This was observed with a MSI GX70 laptop:
>>>>>
>>>>> elantech: assuming hardware version 3 (with firmware version 
>>>>> 0x250f01)
>>>>> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
>>>>> elantech: Elan sample query result 05, 0e, 00
>>>>> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
>>>>>
>>>>> Correct this by doubling the returned x_max and y_max value for 
>>>>> this specific firmware version.
>>>>>
>>>>> Fixes: 37548659bb22 ("Input: elantech - query the min/max 
>>>>> information beforehand too")
>>>>>
>>>>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
>>>>> ---
>>>>>  drivers/input/mouse/elantech.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/input/mouse/elantech.c 
>>>>> b/drivers/input/mouse/elantech.c index 2d8434b..3399db8 100644
>>>>> --- a/drivers/input/mouse/elantech.c
>>>>> +++ b/drivers/input/mouse/elantech.c
>>>>> @@ -1720,6 +1720,10 @@ static int elantech_query_info(struct 
>>>>> psmouse *psmouse,
>>>>>  
>>>>>  		info->x_max = (0x0f & param[0]) << 8 | param[1];
>>>>>  		info->y_max = (0xf0 & param[0]) << 4 | param[2];
>>>>> +		if (info->fw_version == 0x250f01) {
>>>>> +			info->x_max <<= 1;
>>>>> +			info->y_max <<= 1;
>>>>> +		}
>>>>>  		break;
>>>>>  
>>>>>  	case 4:
>>>>>
> 
> --
> Dmitry
> 
