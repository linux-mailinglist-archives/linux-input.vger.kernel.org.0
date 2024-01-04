Return-Path: <linux-input+bounces-1098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8D823D6F
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 09:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948931C20951
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 08:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CAC20307;
	Thu,  4 Jan 2024 08:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yhhWgghS"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EAB2030C
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gH5M4HVnR7Cna+TUC8QBPcxFGQyvVkq/NcEEo+WKVU/VCLH9dJHESltEA92mQ6PGR61kafS/JacxoX5ulXOtVQynlciRX1OwUCAkiuzsZzvLjd73RzNZ/3n8tC5V+9X8AGxuj5ab0Su2CpTQ7IApX6mPgra4rLeG5RY8XzovWtx3sJ+1CBVqAmAywfG8r7CUFhRRzAVf9Uy8grJixE1f+H0KnwT5Olr4sSkfMuAY0ZFXRHGleU+xsAazOdMR1LUTyWGXfAPmZROS+fZUucCPs/GHINFrH+TShSAPV1Rro30wJpl+ayg1mNaQgeegSlmxi/g42WJL9XDObpjchDFZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XCdBr08T+3PPyVDhiah5hT+exlFaUn800xMuIOS+H8=;
 b=a8QMOr2fJqMfQtP0pEnkMO4CgQ8fTBhgCjDXzdJLsQtxDDrD98r6zi75BSF+riQ0srJ4Ex7z0GRcW6J0YIjiz6fAH1P7ehlcqxhVvhNsEqo7mDkpXW1uCvrxd0iFLIN7nNXYwzFoYZylI/L9+Z3AwCt7XhXChZ0Hd/wTWOhgV5eyTyghqTfjOSfDWNctMYjMn1sNiSegtMzjMpOZgwiR1xrwTvMXjtnEK1YLAhXvWFNNPHZplbd8YlCXXS35PyZsbm+Yxo9rxQyKGDTjDsGKXV8cylX5NKZWMKbiseK79QmgaxoMs9L77gnI5sGHKOdsSNcjjIL8C+clLVv0CID3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XCdBr08T+3PPyVDhiah5hT+exlFaUn800xMuIOS+H8=;
 b=yhhWgghSh4cKLYDA6MXWQ3K8xMN7EXQ8IzNbdzWaXiLIx6xFkaqZ+RaNluMyp97YKaxxSNoUo057Ys2xtPlcZPkV1emHY+j89CJ/xqAnQGlvtIJJCLLP3jrbX1L4ZfGRAXer020+2FjNveapCN+df+QoB5zPfykpd1gd3fqWXNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Thu, 4 Jan
 2024 08:29:53 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c82c:884a:3ca3:3319]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c82c:884a:3ca3:3319%3]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 08:29:53 +0000
Message-ID: <71296fab-d6dd-490b-b29d-468f0eecb244@amd.com>
Date: Thu, 4 Jan 2024 13:59:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add new SFH interfaces
To: Jiri Kosina <jkosina@suse.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: benjamin.tissoires@redhat.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2401021122350.29548@cbobk.fhfr.pm>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <nycvar.YFH.7.76.2401021122350.29548@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8d6045-670b-4df2-a127-08dc0cff534f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4QZbyG/SzcpzJXBMq72/b+tgvugvMiNGBvkObvIlM4SW3HqZ1k/Djek0EmChhrUi2qpY/6GC3Rkb/a5DB1qR5adRTcJPbD1eqf8DbPXF59WqO1NiPIXTUPCj59PAVp8kGcQmO38JPOymScHu+IPFgXPIV1D00ksBDVNdPGIpJJstJLx8uWpxaS+XNMCvnb0+mtfRqo96xheI5aQiZpdlp9Zj/lVGsfj2Pzn0T8CnwOI9b4t2AxiMBZPi0rw2Y399A0SjzLh3uwyRw5cQyq63JGga/SAWt1WGftnfGlqu9/VTFWBsgJi61Hr2OvQDbcDnsfJ4XCHe1j/+zwpEbgVJcrfov8PMRSepEDH34orBzmDfEqVHSzb7r1xdnFUsd/zPRWF59fKYnwGURDgIR28wDhpua7o/EyU6xQrioIE3cBdpoplPFz8tzakFaabCbTujkFr36sYoaDVZpaaMEKbvQo+6O1hLeAMVYnRNbaH8xA+uKCEFb4fOZWyNqvtsV89XYJR6LvAk0rZ9eCvRnA1CJit4FTuZFpnJL8qaijjcDnVwJCL5tNa8ErMM1pqJ6kt/lzaSIG80sU3dg4QfxCSZNgKuCznCNjGpEGA1/7UrmUol6QFgLuk/eEeKwSuqjx4qkpXOHh5WrA3lJhfWRCBLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(53546011)(26005)(6666004)(478600001)(6486002)(6512007)(6506007)(2616005)(5660300002)(2906002)(4744005)(41300700001)(66476007)(66556008)(66946007)(316002)(6636002)(110136005)(8936002)(8676002)(4326008)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bURVc1dXVnRMcG50U3BYbnhqbGV2eUJsTFkraS9sR0o1SnhPekVkckRoTEV1?=
 =?utf-8?B?b3pPZlFjckJNOEl2TXZIRVEvYmZ4R2dqVlBVSWRvcU41R2s1L1BUUDUrcXNp?=
 =?utf-8?B?THlzb2d5Y294K01ubUFPT1hRNHVXYis2WmNkS1Z6eHo5R1pRZzZDUm8wY3Y2?=
 =?utf-8?B?Y1ZWOEpscWwzbTBvR2RZV1ZXTHZnM0lXMTd6YmxkeER5ajVSU0hXWHpSakJZ?=
 =?utf-8?B?V1hYQUlHVHFzbmNGcGNkSndsQlUyeEFKTU50UFdpcjNkWWd3cVpCQWlHeTZZ?=
 =?utf-8?B?WHNiR2RlcWhvYkpQQWxQR1dkZXdWbVluUXJUSE84Z1RSS1E3VnZHSzl4Ymor?=
 =?utf-8?B?NkV2LzZ4Und4YTZKTmxHSHV0dDA2d1FBOXRpRU9vT0JYb2FiR2g2dWpPaXo5?=
 =?utf-8?B?SVo4WWxpMUFobjRUMDBudGUzajhOemJTNnA0bUsxWFZ6cXFVZnJuQWVTQm1z?=
 =?utf-8?B?UTNaRm9ndjhaZHR4aTFvSnNvVFRXeGdzRVFUMUdMa01CSDNLUS9zd2FuOGJ5?=
 =?utf-8?B?cGFXV2hWbFBnbys5aWZ5eEJScFpyWHE5cVRJZFROVk0xcXZjNkIwMm5jNE5X?=
 =?utf-8?B?NzFTcUp3TFhtZFF2VzVnbTFKN2FOOVkwMndKMlRoQkhJcENoZjdhZVJKQzRR?=
 =?utf-8?B?RUhRNnBLUmtHeWVXSW9kUGQ5OHpudVpJOWxuRDNHcjIyT1cyYkJZSERBL0tV?=
 =?utf-8?B?Wnkyc1kxUmRUUGYwVElHNFNwVE1mRG1Odnkwcm8yTFc1Q1dNWk13d3RpSTRs?=
 =?utf-8?B?K1UyanZuTmQ4UVJHQmpQTTNKb2ZKaWFjbVBFL3d5TjY2OEw5dEsvT3dUU2k4?=
 =?utf-8?B?WmM5T1FBV0Y0TlBZaWg3dEZTMUdDS0NuNHZxcXVOSDFuTjZCa00wQ3UrRk1z?=
 =?utf-8?B?eCtOdmpzY0ZBM0tMWk9RNTF4ektLenJyMHBXQXUzRGxqTTR2RkZKVjdOVVNq?=
 =?utf-8?B?OXAycTcxYkZwV1IxalNNVWRPQ3pBOUM3MjNpa3RLeS9QUW0wcXgxN1hSNmls?=
 =?utf-8?B?QXppaTJSSlRFWWdaQkxvL25GUVA5MWI0eTl5RVpLaXdEQ014VHhBYW9Sd1hN?=
 =?utf-8?B?UnJubEVMMkVrSmtLL251VUsvM2ZHOU9vQzVOR3I4b2V2NFhhK3pTM3lsZG5p?=
 =?utf-8?B?djlwQlVuZXFHdlRGZTlOcWxOcEhGbm1SNS9oQkNxSmdJTjBzbWMwa3ZiM2ZH?=
 =?utf-8?B?YTd3Z3RRTFBuU2dpL0kydE9nY1hOb3NiMGpZUHJ4SVF1OW9LYnFXZnRLWk9J?=
 =?utf-8?B?Wm55MG1WdEQweUdSZC9Xc2VSVnQxT0hQbmJzV3Q0SWt0dEszbWVsUFdVMUw0?=
 =?utf-8?B?dHhLNEJKY2xLb0NsRk1RbGppYzJvZGMybWN6NlIrUUFOaThvSzBKZk8xN3Z6?=
 =?utf-8?B?OE5KMWhSUUc4ZGJqanNuMHVrYVAzUHNHQnRCTldUWjVpaDZmWURwVlVOZWVn?=
 =?utf-8?B?d0N2dmxwNHN5UkRjUnFDTGFCUWNad3FKMTZ4cnpwSHpwUldHWmZHR2hieTRh?=
 =?utf-8?B?WGtpY3p3cFVLM2psL0dJTGd6QVlHbXFTME10WU1YZjlxTGptSVZDRDB4dUdB?=
 =?utf-8?B?MUh4dC83Si9ReTZFZEg4OEozNlp5QzZvNnJSOHFIaWRobjFZTTVkc2NrdDlG?=
 =?utf-8?B?cVZBMGs2KzlVYmR1WXZYckxoM2Z2Nmcyekl4OHNRM29oM2JrTCs3djNOQ3lC?=
 =?utf-8?B?R0xkWS9PQ2NZMWVEMmlpb1JPVzhWaWhiNUJqald6ek90b0JYaUhTQm9xbzlw?=
 =?utf-8?B?Y3QrOUtBUm40VyszdkpTSTJrQ21Eb3k4L2dUb1dZMUNsbzRtbHc0YVRtYlpl?=
 =?utf-8?B?eFNTVzBoWkMzTXVBS0VOV01PT2Zha280c2NTbkFWZ3lSOWozcHNxU0NsSGk2?=
 =?utf-8?B?WmF6djV2S3ZYUFdCaytNQWdLUVNsclBJazN1Yk0yMzY0ZCs0MWVIYU5ZYWxM?=
 =?utf-8?B?dFd4SUhaYzFCbG12d0Qxa1JaSkIrbVp1QVFCNTdLUmlVd0I3YS94WldadG1i?=
 =?utf-8?B?ZFdnQjlZblpYbFV6dG1Va0cxZmd3ekdFSFl1YmlJL01IMWl6S21iS21tcitt?=
 =?utf-8?B?WlFVcHA0aWJkckRGL2NqY0lHVkthcDQ2dU14L0VxOWEyQ2JEUWk2MVBqcmx5?=
 =?utf-8?Q?B5gA+IIMNpBEAUEpx8UNNWTl5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8d6045-670b-4df2-a127-08dc0cff534f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 08:29:53.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B49eb7ewlXpjEGMlomI/Dwrxy+wz2oknXjzQ/wFMEPfRD1MlDf6cPXtYzjp8G/mlqXQaOrKEpwmsfJkwHXo3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356

Hi Jiri,

On 1/2/2024 3:53 PM, Jiri Kosina wrote:
> On Wed, 20 Dec 2023, Basavaraj Natikar wrote:
> 
>> This series adds new interfaces to export User presence information and
>> Ambient light to other drivers within the kernel.
> 
> Hi,
> 
> thanks for the patches. I'd like this to go in together with the actual 
> users of it on the PMF side. Does that code already exist?

I am yet to submit the patches that uses the new SFH interfaces
defined in this series.

The suggestion from Hans is to have the SFH changes landed
independently, so that Hans can take the PMF changes alone later
during the rc's as fix. IMO, we can have this series merged first alone.

But I am OK to have both PMF and SFH changes together.

Hans, what is your feedback for Jiri's question?

Thanks,
Shyam


> 
> Thanks,
> 

