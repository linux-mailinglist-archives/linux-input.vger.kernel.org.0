Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D0B1A3901
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 19:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgDIRiY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 13:38:24 -0400
Received: from mail-oln040092065092.outbound.protection.outlook.com ([40.92.65.92]:50574
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725970AbgDIRiX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 13:38:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa+S8g/w1ImOP4OOpOqhYdWIYe5tCwxlLDI7Qle0ILcqWVHvGIAe11rOwWTw7xm7JiE9/WFJSGX5qufHXpTgFQjuBpmtPeXIt/hcym3WZ4mmJPEyH7gVVjXJ2lmEqBwj+XPpYLEXsalgmg/SFKh3/zprZV1y4iMJNHeT53t7AZYCCsAJ68D2x7oxKFTEy3GgTcyBe2QJdHGeGnNV3DtuidDxw9BpYdOO0l+yXN4yOlAPE2U+AL9Zg2UkHkh7Ld/3e21mXweQqqIQXF6Na1fAQRhpHiK1dlYgkwHcBubWF0kQzjMko5PH1X3AHbYAm+my7xlIjTDCfxVFqnEW0Ol7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOozkK2+QO5oDAWsFNrE/yEo8MG6qRuSXbOhJ20S+e4=;
 b=SdqQ0bFiDi8yfsm385gghDPJtVF3m6SwQVBSR3eO3UfAsZHfc0LIPuFd3lwp/QYjgjOZW/nm1JyKczhx4FDnYFDCcbZz9QgYDDaNjPLL8Z0QkFvl8+Mv9+kxC5M7egfM3yHqnPmYe4vP8J+PXIEvrPQgHqWblxrp5t2+DXSAE9fVHRJsD39IXjfHydhAXQqP9Mux663cA9V8CWwl6k4itgM8F5hLsXv560bz2guXF8JQtvP3flj86HO/T5uhI7ubO03sLzPewOm7oegQ6URW0TdLDr3VTn2tM/JHFbR8rZQJIjQdcgefAd6sAdfmccWEkGgvbv4yOUm+mX2VWkbEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.de; dmarc=pass action=none header.from=hotmail.de;
 dkim=pass header.d=hotmail.de; arc=none
Received: from HE1EUR01FT059.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::48) by
 HE1EUR01HT222.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::400)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Thu, 9 Apr
 2020 17:38:20 +0000
Received: from AM6PR03MB5170.eurprd03.prod.outlook.com
 (2a01:111:e400:7e18::51) by HE1EUR01FT059.mail.protection.outlook.com
 (2a01:111:e400:7e18::241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Thu, 9 Apr 2020 17:38:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BD0E0DA883FE934427513D795F10F4D91D108FFE883B35F6E53BE023884A3082;UpperCasedChecksum:0CEE1ADFF56F00355451C439DEEE618238EE2B6C00F363BBF65407907A0AF536;SizeAsReceived:9647;Count:50
Received: from AM6PR03MB5170.eurprd03.prod.outlook.com
 ([fe80::d57:5853:a396:969d]) by AM6PR03MB5170.eurprd03.prod.outlook.com
 ([fe80::d57:5853:a396:969d%7]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 17:38:20 +0000
Subject: Re: [PATCH v2] Input: elantech - fix x_max/y_max values
From:   Bernd Edlinger <bernd.edlinger@hotmail.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Dave.Wang" <dave.wang@emc.com.tw>, jingle <jingle.wu@emc.com.tw>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        Aaron Ma <aaron.ma@canonical.com>
References: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <CAO-hwJ+eua8-fNj9o8CxjFyM0i1+R9ZwPMroF9uLUH6NVu3Tdg@mail.gmail.com>
 <PR2PR03MB51799BF709B3975A08F139F4E4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <AM6PR03MB5170F5FC30556BEF89C775C2E4EB0@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB5170D26019747F5090FE74B5E4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB51702AF00C6BA06BBC9F517EE4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
Message-ID: <AM6PR03MB51705B32136F527B99CCD907E4C10@AM6PR03MB5170.eurprd03.prod.outlook.com>
Date:   Thu, 9 Apr 2020 19:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <AM6PR03MB51702AF00C6BA06BBC9F517EE4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::25) To AM6PR03MB5170.eurprd03.prod.outlook.com
 (2603:10a6:20b:ca::23)
X-Microsoft-Original-Message-ID: <bf55d540-bedc-5ec0-e387-1730d1a28ccc@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.101] (92.77.140.102) by AM0PR01CA0084.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 17:38:19 +0000
X-Microsoft-Original-Message-ID: <bf55d540-bedc-5ec0-e387-1730d1a28ccc@hotmail.de>
X-TMN:  [uB2t+kqjyc4tIh+IC5coYO5n8c4NphG/]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f9b79a9c-612e-4b46-05b3-08d7dcaccb2d
X-MS-TrafficTypeDiagnostic: HE1EUR01HT222:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohUyZhGPqy9Zvgkej6Mz3xa5su+eK/9OS+1KBvLL3l/gOnGODdfLDLKDKavh8Ba+JEluwpXqPMsZE5TOoSNXUXkzx2+bX0h5khVAz/Z3PKkUC8eBy5bx6yYm+tGR/JPtLEnaRFESn2L369KNKiuScjj87c1Ea+4tNZrS4t69NRnhV0Z6fZ5cICz5lZUNmhkT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5170.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: JhDbI+a+gf2jqiVVzGURza1gnFc7wVR0hxccQjcR/DeEk7YV3axbkM0TxK3jMRThAO9x3wseusQCn6KVY0rHhk92my7UxJCCPybIG8H6Bp8TTnENOV0WCpNbKJbc2gdoAnYAhTGH8OBkmgX+iOQBGA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b79a9c-612e-4b46-05b3-08d7dcaccb2d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 17:38:20.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT222
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Are you there?

Should I re-post the v2 patch, was that dropped somehow?

If I don't hear anything I'll assume I just repost, probably
as unchanged v3, right?

Thanks,
Bernd.


On 4/5/20 7:54 AM, Bernd Edlinger wrote:
> And, furthermore, there is one thing I find really confusing,
> 
> I do not see the message v2 quoted below which had an updated commit message,
> due to that Benjamin Tissoires request.
> 
> It was from my point of view sent on 2/27/20 11:03 PM,
> but I cannot find it neither on spinics, nor on marc.info.
> That is funny.
> 
> Did it reach you guys at all?
> Or should I re-send it just in case?
> 
> 
> Thanks
> Bernd.
> 
> On 4/5/20 7:26 AM, Bernd Edlinger wrote:
>> Ping...
>>
>> This patch works fine for me since several weeks,
>> without it I would not be able to use my laptop any more.
>>
>> Could you please accept this patch?
>>
>>
>> Thanks
>> Bernd.
>>
>>
>> On 2/27/20 11:03 PM, Bernd Edlinger wrote:
>>> Since commit 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
>>> moved the querying of the x_max/y_max values from
>>> elantech_set_input_params to elantech_query_info,
>>> the returned x_max/y_max values are different than before,
>>> at least for some firmware versions.
>>>
>>> The reason is likely that this is now done before
>>> elantech_set_absolute_mode does run.  So it may happen that
>>> the returned values are exactly half of what they used to be,
>>> which makes input_report_abs in PS/2 mode report ABS_X values which
>>> exceed the x_max value, which is very annoying since the mouse stops
>>> to move then, and ABS_Y value become negative, which is benign.
>>>
>>> This was observed with a MSI GX70 laptop:
>>>
>>> elantech: assuming hardware version 3 (with firmware version 0x250f01)
>>> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
>>> elantech: Elan sample query result 05, 0e, 00
>>> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
>>>
>>> Correct this by doubling the returned x_max and y_max
>>> value for this specific firmware version.
>>>
>>> Fixes: 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
>>>
>>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
>>> ---
>>>  drivers/input/mouse/elantech.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
>>> index 2d8434b..3399db8 100644
>>> --- a/drivers/input/mouse/elantech.c
>>> +++ b/drivers/input/mouse/elantech.c
>>> @@ -1720,6 +1720,10 @@ static int elantech_query_info(struct psmouse *psmouse,
>>>  
>>>  		info->x_max = (0x0f & param[0]) << 8 | param[1];
>>>  		info->y_max = (0xf0 & param[0]) << 4 | param[2];
>>> +		if (info->fw_version == 0x250f01) {
>>> +			info->x_max <<= 1;
>>> +			info->y_max <<= 1;
>>> +		}
>>>  		break;
>>>  
>>>  	case 4:
>>>
