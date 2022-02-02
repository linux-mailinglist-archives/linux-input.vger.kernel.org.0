Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76C54A74AA
	for <lists+linux-input@lfdr.de>; Wed,  2 Feb 2022 16:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344811AbiBBPfs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Feb 2022 10:35:48 -0500
Received: from mail-dm6nam12on2047.outbound.protection.outlook.com ([40.107.243.47]:21472
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345505AbiBBPfq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Feb 2022 10:35:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPYjeWP3FZoRyJi9KcTIATczWkNOWuRywrjGqiY/BajDqS3lRl9l6FhC4UMJVoWmqhgLeaVZncACY/WdQVyf94VSOIF+F+vDAfAQ2TkOyB5vwN8ggpCqFtIWwp8F9h8Als2WLY3N6SXMUgKo6a+zisx52xKF6PHDbqx61uMOlW4gbdmeynFY6VBosSTOpuOqRDCS3K12btLBd+FdZFlDohdm4eh9yCFWro615mWWqESVGg3nLIXnSGgvbjXMDA3epvmIyvNL9DqLYakVf8hGvc1Jv5Q9EUhhv7HXBheLBE6frsCSfl+eW+M9DGtpsHrfJ+0z3wxKJceVQvDAd5lp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15Gq/4ImGcoaOh281qmpYyej9nV1hKjAtP3KKJwDgYo=;
 b=O6Fl2VoJpIfH+SHj37KCdjn7QXIqNA50a3g4Vt+nqNt7C6u1VU5ltAYJ3N/ndtR/g55iilDv345jbhObJ++KNgpTRfm8zA/uLpUfy2ZcSqHf0KeUmEadRtsZp3Agx7QcioJc193LVPK127fpao9A8IP8VbSsxAmhkr0kHGx/8YoxmFdtnmzD3ssV1QrDwSNOQGsqTFUZLMOMB2q+ZXSpbrnGA+gCF0TNEeCAVgN+SInMFxjw62BB2X2albZhy4/uOAha6+yn2S1UrPUvL1fxPJTug/iSUp9O8ON9Hud1fp2I8n718wXzmij3tI2ubgw6MK3awEXZkJy2yb7/1uVK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15Gq/4ImGcoaOh281qmpYyej9nV1hKjAtP3KKJwDgYo=;
 b=fT1oMuDywywW6XL1CkctaLJZKh7GMmJ3bePCn9iKozC8uvMBu2P6J24l45dbPYEH6aPZuFOkSofEiGc2WOC9iocA4QcXRyvGfN5DhCOlEKdWMjRbelYcl9DDjGmK4ZB1N3URNKvdXzZ21lJVtHedUJmFYrH0hSDjO4z/sXpy7Iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 15:35:45 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::84cf:cad7:192:8089]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::84cf:cad7:192:8089%8]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:35:45 +0000
Message-ID: <578673a3-920f-25f3-c9f7-7f1812c3e731@amd.com>
Date:   Wed, 2 Feb 2022 21:05:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] Fixes to amd_sfh driver
Content-Language: en-US
To:     Jiri Kosina <jikos@kernel.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Nehal-Bakulchandra.shah@amd.com
References: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2202021504470.11721@cbobk.fhfr.pm>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <nycvar.YFH.7.76.2202021504470.11721@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::31) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 393084ee-5840-4c6b-1c9a-08d9e661ada5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1849:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1849F04565E7B979BAA2253CE6279@DM5PR12MB1849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4D+0pu+EXPLVQ67FNklsUgFp8RN9kTjqmn4WKLCzGz/Ais67OKBV2LUVUg8GozY9K2gFTc4po/2/cfLOwRpkW3tipdp7iOP8YiPydhZ20wrmbPiAlPVxysQW01JKlJ9ni+lsdYajgUQLkRpm8DygiKv5iUw+jDqn2A4Y/yka+VH3ZDItSNGv/P/JhPRsmR1mY4xi3B/af98xnrGE0tH77nZDeSxymniI9Sb/6mtAPGrD3seKcNx76uMlu0jv/va8SIdiWEr3iibTX7kJNOHQP9H/wR3Dq4r3FQOxFnpF7+tWOrqeBRMWkeXBh+GqTuCc8cpXt3ny+98Tbs4ANjQ+o//ZwYsynW9L8rjmWEOj9Gbo3yrUkPDXE+UCbjY1CHa5ebe9b0JHJI+mjufL067Z9q3twYV19SdCC9pLxo1AE+fm+Pi5vLFCfDpbHufKfarW8mKmob15p2e469i5sXjrjyFKrblq/bVXhTL1IVkF4MzG8dOz5DooqxMzF/hozcd7VdSxZoqyprTl57lsehGGU42Ga2NyXEcP3IQq3rpbxPt8o3dsAhDmi4uT0O6EB9lymdcGfn5wRFeaS59VDvaIxqR0EjnPK/ZUzNPWS5nD0TUF4Rj+dZT4GUEB5s4oAsQoLA9JiEbzO/gdCC6UeezI3X05lcd+4MFauwJq7IkJfiueunTur8nr8pVQs1eQwCuDySO+j59EgK5I6PcQfYv5hMbF7jDwWFsUvtTAX9jVVxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(186003)(26005)(38100700002)(2616005)(2906002)(31686004)(66946007)(66476007)(4326008)(8936002)(66556008)(8676002)(4744005)(5660300002)(36756003)(316002)(31696002)(508600001)(6666004)(6506007)(53546011)(6512007)(6486002)(6636002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGZKSkJVNlAzNC9QdGx0OU84WkFWTjZudlBLSlJCcU4vSXFya3ViSU5WWnAv?=
 =?utf-8?B?QjZ4cDJ2ZjhEWEUrWUsreDVoYlplTTdleGpnaDdnVGdIVlh2UmVJbm1XOXZa?=
 =?utf-8?B?YTRFU3ZpdGFpbk41ZGFOSjVQQWVvd3JESk5xa1drQmdaYnhNL01mV21wS1lI?=
 =?utf-8?B?V1lXQWJ6OHNXeWZadXpldlRuYTN4dFA3TmRLNTk2WEROR2NIYzFLZVRGN0FH?=
 =?utf-8?B?eHpTejcxZHhFZTA2NjJaLy9JakZDaHZVaHNSNTY2V2JPcWsvRkM1UDdpS3pI?=
 =?utf-8?B?QVl2S3cyZlZncjF3eE1IZHpOYUQ5TkdXcE9sY1NMT1EyS3pCbitpWVZiTitQ?=
 =?utf-8?B?NSsvUzNraUV5dTBWa3pLb1NtTTRnRkZxRGNJcFNMTlVkNTlOc2hBNjc0UGNL?=
 =?utf-8?B?MWJrNlVqcUl2MWxzNDV5dzlZNDFYSjN1b2I2NlUrbU43U3A2UFNGOTFZSGpK?=
 =?utf-8?B?THdsWHpiTWFUaE1yR1VKZjQwdWUxQXRpSTRDaW42RUVuY25mYkhIVktFMGZD?=
 =?utf-8?B?Zmc5RjhqdDc5bi93TGxndVdvOWJJNDF6YWpIM0pZL1pnQXBqRC80MVVFbjlv?=
 =?utf-8?B?Wm93Y3ozc1dvRmVZeWtqRXAvZTJKM1hjd29abGtpdFlpcjFCY0hsbThkejdM?=
 =?utf-8?B?ajI1eVJtUHp3dGI3d2VZMElxTGQ0S3VhUHQwd21KU1BnTnliSHdVZmpRdXNS?=
 =?utf-8?B?bUh0K01MckxkUm9MSDF3VHVIeXZrYUhjczd1NStGVUlwc0lDYjc1TUxvZTk2?=
 =?utf-8?B?YUN1YWdHVHpoL2srbldIRE5KWkxoTHJtamVnRXNFdzIrTmMwRTRzVzZPamdo?=
 =?utf-8?B?YTM4Q3FBRDlHaDZyN2c3Vm1vcVBUSm8yWXdpbWFLR09MT0xyOGJBU2ZvN0k4?=
 =?utf-8?B?WVF4YmhDMVpWRXlxaDllUVljZ3piVWs5RXFycGdzVXZjUVFWZVY4dkRaN3ZX?=
 =?utf-8?B?YUF2ZEpsbnlKR3VTU1lnM2p2UVVqaFM0QU04SHVkUS9JL0pxYklOWE94M0ZO?=
 =?utf-8?B?dDcrME9QRTduTWEvZkk3UWcrenZXalZLcjAxN1lGazJaWVJqejN2TE5hWCtI?=
 =?utf-8?B?dGVwY05BMkNvNXVDZGN1ZCtaN1phSHlYbmVRZmE3ZjB6M0FYOFBKZXVheFEy?=
 =?utf-8?B?RlpZelN0WURkd2VkYmhXdXBqNllWZ282QlpZczJKc1p4WkZPcGNGM0RTVjVh?=
 =?utf-8?B?UWhyL2hPS1IzUXlva2ZXUmpQMkNUZXVVaUlmMG92ZE5paUJzKzdsNndWSjVW?=
 =?utf-8?B?MnRVaW8xbW0rZGcvbU1sK2hPZ2pLRnN1UkF3RzRzTzZhT1pqY2JieXZ5T21B?=
 =?utf-8?B?eW1zSmwxcHZZMGFQM2JnRmQ4ZEt4S3NsSkdVNzdyS1ZUL3Eya2RiYUVESlQ2?=
 =?utf-8?B?VlZPT1Myc1JoRkVrWmJORGdHRnRFenRXZXJTNTlVeTgzWnFabmtpd1BwR3hU?=
 =?utf-8?B?aXh2ZEZDMnlhUGNlK2pCVmg4RzRDcldvWEJRU1ZYb2FIZ2owTk93ampZMjZP?=
 =?utf-8?B?RWVla3oxR0tHUk9zYnZCcHFBUkpNL1gxU3hiendPM2doYUhUVVpXZk8xMU9X?=
 =?utf-8?B?MnVHb3kxZ1hybjZBcldEOFRSR1ZRSGNvSng5cm9BNzBWeDhvakpreDVkakxQ?=
 =?utf-8?B?TGZPazFIUFB4aUFYWGVBeGRTMWRLaGh1cUJmeGN5ak5SbW9rT1lUN0RVcTN6?=
 =?utf-8?B?c2RKNzNNdmxHbVFUQ3BHN0JkUjNiQVRZMFJYT3RWSXZpS2NtME93aWhHTzcy?=
 =?utf-8?B?RW5FaDFnZnRLSG1HZFZlL1N4TmJDRWx6WDVJbFV1eHZhbjRKelFDZXhDcFRh?=
 =?utf-8?B?RkRJbGRsVWpJcTJWSE80VzVKMjFoNjFxSXlUeHErYzI1eW9qTXYvUmpzSU9N?=
 =?utf-8?B?OGhjOWtqUlI1V3pTcHBXb2ZLKzRmQ0xHOTRPcVZtUW1PRWRET1lmOGVjZWtU?=
 =?utf-8?B?eXVXNmpObDlpVElad1krYlNrS3Z1TjB5Qy80TzhaTTF4S1BXUXRpOVFiWU45?=
 =?utf-8?B?KytBYXdya2VqNWNmVmY2M2hMSVl6T1pKYnBHMXZTSzlDSitEK3ZsTTMzUEsr?=
 =?utf-8?B?ZTlkNDNxYjZaVk1QNVBWZ2JSN1JVVTl2U2FZUmtaR2ZuMnlhNysrNHBuU2Jn?=
 =?utf-8?B?V1hVV1R6Wm0zWTlidnc4SjIvUUFhSnJYQ3J2YU5OUytxa0Q0dlpBSHFmck13?=
 =?utf-8?Q?gkYIJ/BF9wI1/WvH3+gAAFk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393084ee-5840-4c6b-1c9a-08d9e661ada5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:35:45.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciYJoK/LSpmkTWT/XHYVzRGTE3qAqntJkOZa1pNTt0SMLQcivND/XzP9UdaVlQs+BI2TPH8i8zt9WXv49z+l3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2/2/2022 7:35 PM, Jiri Kosina wrote:
> On Mon, 31 Jan 2022, Basavaraj Natikar wrote:
>
>> Changes include increasing sensor command timeout and
>> adding illuminance mask value.
>>
>> Basavaraj Natikar (2):
>>   amd_sfh: Increase sensor command timeout
>>   amd_sfh: Add illuminance mask to limit ALS max value
> Please make sure to follow the convention and always prefix HID patches 
> with 'HID: ' in the shortlog.
>
> I've fixed that up on my side now and applied for 5.17. Thanks,
>
Thanks for the feedback. Sure, I will follow this for future patches.

- Basavaraj

