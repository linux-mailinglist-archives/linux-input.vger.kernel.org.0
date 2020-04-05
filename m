Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83C3819E982
	for <lists+linux-input@lfdr.de>; Sun,  5 Apr 2020 07:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgDEFys (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Apr 2020 01:54:48 -0400
Received: from mail-oln040092074052.outbound.protection.outlook.com ([40.92.74.52]:8423
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726227AbgDEFys (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Apr 2020 01:54:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUAxOpkh0l4N4Pik+T0muQlOcdWSUb1lEQCVm1b3hy4sENg8b6igbBgwyITRafUn4eCtMRxzFPuN7qI38/9wmyZnQRN66FdF4EPTz/Xavj9ZKlbWyQF5nMw5l3nG8tLOnNfo5Vyb/4/UeAu6AMvEot8GYlRFAxmJlGJdKFL+o0H1oQuK0FV130mlJDybUZtMr43f6esu4Mjl5ULIY7ctc28wQjpp1x+pd47oy+xGiEdmBUpYNCJLdPdeHdwg6sz3KbXMGSCfg6LPZYdDMPZL83hcTuw0KOx83VUh6ngO09SfReB9KgD5DWspA9G59aTDhbDumviiFhtW9uNzABIvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qj+RZX0qDBLwiAT8NOnRXVTrFt6ZvX2M4iEE0Qm1Ds=;
 b=NgowfiGMoCdxuAoN4+noK6K+y2al7//1HhyLVPCIVGc7Wy+nW3c2JVsTh/sHoziczw+wcPIZ/b24GcGdQZ607MkMZMwdc9RW2OQOIFtLk3sn3oU/MXn1wct1ww2yZG+Ksqkiw/qa4HJNBM9nM8IQ8Ml0o7/+IjyvYiiIFivlvWNpXup5kdMlXTeooW8Cu29VS86Qja/o4DdxJDaC1Zi2DPNOMMQJaYEL/LvEBo5NVQXIlfU87P9a5vw+Zxr1fPloUSz35nmpRdAZ9IHcVrVTR+F0vV63lNWd5W23L/Yv/IIPChj+8LigojumZqCLl5X1/3Bdul5i0D1vHkWhGIQwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.de; dmarc=pass action=none header.from=hotmail.de;
 dkim=pass header.d=hotmail.de; arc=none
Received: from DB3EUR04FT064.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::4f) by
 DB3EUR04HT224.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::396)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Sun, 5 Apr
 2020 05:54:42 +0000
Received: from AM6PR03MB5170.eurprd03.prod.outlook.com
 (2a01:111:e400:7e0c::49) by DB3EUR04FT064.mail.protection.outlook.com
 (2a01:111:e400:7e0c::87) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Sun, 5 Apr 2020 05:54:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:4725BFE1BA578D952D178933BF2040AB5F8472CD490742E0F9CA1F02869268D4;UpperCasedChecksum:F2F7E5831117D36E378FE0D91A33C1B63F184050AEE351FAEAFA3B8DBBE36069;SizeAsReceived:9555;Count:50
Received: from AM6PR03MB5170.eurprd03.prod.outlook.com
 ([fe80::d57:5853:a396:969d]) by AM6PR03MB5170.eurprd03.prod.outlook.com
 ([fe80::d57:5853:a396:969d%7]) with mapi id 15.20.2878.018; Sun, 5 Apr 2020
 05:54:42 +0000
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
Message-ID: <AM6PR03MB51702AF00C6BA06BBC9F517EE4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
Date:   Sun, 5 Apr 2020 07:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <AM6PR03MB5170D26019747F5090FE74B5E4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0060.eurprd05.prod.outlook.com
 (2603:10a6:200:68::28) To AM6PR03MB5170.eurprd03.prod.outlook.com
 (2603:10a6:20b:ca::23)
X-Microsoft-Original-Message-ID: <3263655f-b1b7-d3e0-5d74-13aef7683934@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.101] (92.77.140.102) by AM4PR0501CA0060.eurprd05.prod.outlook.com (2603:10a6:200:68::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20 via Frontend Transport; Sun, 5 Apr 2020 05:54:41 +0000
X-Microsoft-Original-Message-ID: <3263655f-b1b7-d3e0-5d74-13aef7683934@hotmail.de>
X-TMN:  [CYpz/8VWbG9mi5qEU0X2ElsChLPp65gc]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2fa5b077-1254-446d-b880-08d7d925d5a2
X-MS-TrafficTypeDiagnostic: DB3EUR04HT224:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igT0uXJq6102qEzVXyjLE7f8GT9yWOfcbRdy64zCX/EpLL9jUshxSEg6Srql0PlIbxo4d9VC31JBmwEQaLeeiQX55FYxcRLTwgqxeF7P1JZfnMYim69eFkERclM+BQZp8glZomIEmXsaXBp/cjO64BeAmyEFZtXPPhxZOS145t1eLsqEIKUzpkWbDK8TM5h2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5170.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 9GliAXvZG2zqWx3mFe+jVgw6Uwyyv2k/eQYNz4JaMJsgxy2LYguoDOBm1rzv2SjWMuekxZv9hfVkisJV5aszu9vvv4SDm4GyAWBWp5hkaSNLulyQekWb3VqipS33l4owTiaoZZ3stMoOqpvOH2xKFg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa5b077-1254-446d-b880-08d7d925d5a2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2020 05:54:42.0471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT224
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

And, furthermore, there is one thing I find really confusing,

I do not see the message v2 quoted below which had an updated commit message,
due to that Benjamin Tissoires request.

It was from my point of view sent on 2/27/20 11:03 PM,
but I cannot find it neither on spinics, nor on marc.info.
That is funny.

Did it reach you guys at all?
Or should I re-send it just in case?


Thanks
Bernd.

On 4/5/20 7:26 AM, Bernd Edlinger wrote:
> Ping...
> 
> This patch works fine for me since several weeks,
> without it I would not be able to use my laptop any more.
> 
> Could you please accept this patch?
> 
> 
> Thanks
> Bernd.
> 
> 
> On 2/27/20 11:03 PM, Bernd Edlinger wrote:
>> Since commit 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
>> moved the querying of the x_max/y_max values from
>> elantech_set_input_params to elantech_query_info,
>> the returned x_max/y_max values are different than before,
>> at least for some firmware versions.
>>
>> The reason is likely that this is now done before
>> elantech_set_absolute_mode does run.  So it may happen that
>> the returned values are exactly half of what they used to be,
>> which makes input_report_abs in PS/2 mode report ABS_X values which
>> exceed the x_max value, which is very annoying since the mouse stops
>> to move then, and ABS_Y value become negative, which is benign.
>>
>> This was observed with a MSI GX70 laptop:
>>
>> elantech: assuming hardware version 3 (with firmware version 0x250f01)
>> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
>> elantech: Elan sample query result 05, 0e, 00
>> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
>>
>> Correct this by doubling the returned x_max and y_max
>> value for this specific firmware version.
>>
>> Fixes: 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
>>
>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
>> ---
>>  drivers/input/mouse/elantech.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
>> index 2d8434b..3399db8 100644
>> --- a/drivers/input/mouse/elantech.c
>> +++ b/drivers/input/mouse/elantech.c
>> @@ -1720,6 +1720,10 @@ static int elantech_query_info(struct psmouse *psmouse,
>>  
>>  		info->x_max = (0x0f & param[0]) << 8 | param[1];
>>  		info->y_max = (0xf0 & param[0]) << 4 | param[2];
>> +		if (info->fw_version == 0x250f01) {
>> +			info->x_max <<= 1;
>> +			info->y_max <<= 1;
>> +		}
>>  		break;
>>  
>>  	case 4:
>>
