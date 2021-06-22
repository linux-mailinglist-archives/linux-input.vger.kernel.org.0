Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025633AFC86
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 07:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhFVFQm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Jun 2021 01:16:42 -0400
Received: from mail-mw2nam08on2079.outbound.protection.outlook.com ([40.107.101.79]:28192
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229949AbhFVFQS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Jun 2021 01:16:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjcbBCUJ3oNumUfAShehkMQFlbp5PxGEOthBxMOWswhKRM4Ux3b+dgo67TYXsvhxZEufCTVUF31OoHt2Nu22L0e4U89fSCupuxQxd3AsspQEQpHGEY37AHdlKsgA/5MoX/DzxF97h5ZU2W05OzM3AfvNuLbdDEPJq11xOGjx9pmnaW+mLHbH+iM62qk77msmOzNYt+AaLuKnXHGKVsuI91iLWJdm4nyLvLHNQwP6LftlovSOcNx2ous9ykN1lWjiJ255f7fhVr5wwRJ9cEGggoDu2mFpgtyeMgp7pIs8Gdp3EezOyqJWzdBgqerrDKJeJYAq/qHEyO9xvYOXdPdT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H9GHNr1+QbPpiVpRwJpSPUi8Er7S+8l39mgUNpcZmQ=;
 b=GE7hzEgzWBo1eSMJtfqsD8dukbOiLUHULSktCYoPeS3KaRcfqEq2ZNaVEyQdfICnZNqh7vOEqEUse36e2dDB4tHxjWjuzgBr+iBh01f3FmsaPv9L/yZXX6PWkINDYmQrO4GUaYgL7QplFcKAX3O3PC1l2ycQRGZ7iaFwPVWlCTgAR4G7IKAh0HIkrBXG33hSBFCYBzK8xAIjb5bFjjhe4kQ147Hci1KoM/Po+EBQJw/b+c6i7b4sQYexdezmL0zOPnS44qEuPa/yGDlOSgeg579dIa/w/3ru+vXtdi+VYjlv203oKW9Bpm9ct10LbxFOKZ0afpmhojYpeVF+W7RM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H9GHNr1+QbPpiVpRwJpSPUi8Er7S+8l39mgUNpcZmQ=;
 b=buHT2UGTyck0IAlu4mtOCaFPI6cgWDtqGM3ZPqSA6FOtoO/6xqGIlb90fAEwvwLXb2uWuUqKfMYtZDlgVLYY3jbktPcZ9lsmB3UV5VuN9AYDiexxssY8LlwbJxkpWA0URElRsK9mfoNIZ+WUjYnwSlArhqTBQUc6YCHaAUr4kKo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5312.namprd12.prod.outlook.com (2603:10b6:5:39d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 05:13:56 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 05:13:56 +0000
Subject: Re: [PATCH 1/3] amd_sfh: Extend driver capabilities for
 multi-generation support
To:     Dylan MacKenzie <ecstaticmorse@gmail.com>,
        basavaraj.natikar@amd.com
Cc:     Nehal-Bakulchandra.shah@amd.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        shyam-sundar.s-k@amd.com
References: <CAHpHHjbDGjSaupSsG1aQpP+s_hzaSs6ggJfLSYQGei-ehnXu2w@mail.gmail.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <2a051e56-66c8-ee6b-452e-b26fbae7f56c@amd.com>
Date:   Tue, 22 Jun 2021 10:43:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAHpHHjbDGjSaupSsG1aQpP+s_hzaSs6ggJfLSYQGei-ehnXu2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.157.251]
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.44.26] (165.204.157.251) by MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 05:13:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0fef266-b6a5-4214-6c85-08d9353c88a2
X-MS-TrafficTypeDiagnostic: DM4PR12MB5312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB53129EDBFEA2E6C374A0DBBBE6099@DM4PR12MB5312.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSpX4BuCeUnU86LymaiRmGpALMXFZCfmUWpOs2609jJMwaCjHjYyMPYwQenVN7CN/0M+L7aWBNg+5qxQqfmj2FmqaVzkX2fW/LoR3eM8azDwa0vvLi5qT0Oa+bRnC5ccb68u68VwGVy7zKooYKYtO8ibpHT5OvW3H0+agQjicYsxoVqjJUPre/dW5kq94h3wlUIOmqPlujkRaZb30eHjV+O18TPFCDy4My1p5VafSlpUQdFu3+aYBbxxmo6FZdfvtm8VBAhlF5ccRWRf9so0//4l8RbPg8pIk0g0fMDPynkyxBVXuM52K20Nxz16w41rBgREPv/fuJfaisLU+bTAV4+rGCj+8/86Qjiv3TomSkeaqrqLLPqkwc+ymJHynVXQDDXLwi9I9wmTIaM+hyjYPQ9hdDUOuA4UXH582YJKDamiAxCWUst6xFbwsJxeNriPuAn5QdFhF8SdJ8u0tXFcu6MBv+dnOmb+Oalu3kkvNxjG86Mb8+GkWnjeq/gu2BfTK8VB/DbWH6369ScTfHSIkqK+yMLwfAqvxzIs+pN+8OzOW7CfAsv1mJUobaCy04P2lOWyxuMZNze54+1DtJj13Ok5QN1bdVOihuIDE6DclC/HMGvRlWL7o1C1xeJYhwZSEeSBaqTU1gFJr5Nb0iF3OKmayyAnb4ZQjcCDlD3wbUUJOS5h7HOfiuhMNTpOMcs0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(6486002)(478600001)(53546011)(6666004)(36756003)(8676002)(6636002)(26005)(16576012)(5660300002)(316002)(186003)(8936002)(956004)(4326008)(16526019)(2616005)(66476007)(66556008)(66946007)(38100700002)(31696002)(2906002)(31686004)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzhMMTNhdGowQTJhSXU4LzBvcXRNNVJHYUNUelowZlBjNGhkNjJiVjNucHZH?=
 =?utf-8?B?MUhkSE4yN1oyNUV6R1lpR3lTTDQ5YjdFcmZKQnNCckg5cFFNempZV3BUWjA1?=
 =?utf-8?B?S2lqMEorYks5RW8zK09XR0VNWEdZUDU0U3pDTWVZaWpSNldZUTlyRlZpeDVl?=
 =?utf-8?B?N0N1d0dldDE3TytwS2dhL05IblV4MWx1NXBGL1BwT1Z2OXVuRXBZaHVqVjZY?=
 =?utf-8?B?bDkydzkyeVh1OVRaM2lYcEExR29TZXZmaC95WllHVHAydTJpenFSaXJNZGE3?=
 =?utf-8?B?RjRYNXNVV3NBS3hER0ZsN1RqV0ZLYVpUR1RoL1RpVGxBRFROVWFwcG8xRU5n?=
 =?utf-8?B?Ym5nNlV1YUtvS1NjTGppdkt4L2djSmorbWRERzdrNG82aVhFNkgrREZCZXdi?=
 =?utf-8?B?SGsxNzVkQWpzZHVnd3kveTFhZ3BWSVNUY2pOT1VObnd1UGlaZG50MVpCVVpZ?=
 =?utf-8?B?ZFAzRDNKeFRrSCtZakZrbkViN0U0dFplekhQeVVXcmF1SzJGRStsZ2loeVlO?=
 =?utf-8?B?bGx3RGM0MU9leUc3R3JuclFWQ3JBdk96MFB0b2t3dFMrd0d4UEJleW5RbGxV?=
 =?utf-8?B?eXdCbHBNQjMwM09LMGZJaGNaYkF5a1lMZU1zd1JYdlh2VEE2bWY3MEhpZXZm?=
 =?utf-8?B?MFVJWHNQZ2pERVdMdFBRSURTYlJUMkExSjFKcXhuODZFUmJERDF1NEpHM2RO?=
 =?utf-8?B?RHVLY2tIb1FQZVp2a0RRRmVhT2Qxa2wwK2IxcXhKYWFKbm1QWjdyZHk2Z2Rr?=
 =?utf-8?B?MEo0dk9oYWl0blpIOTBxZFFVcWRZN3RtQ1MweGliRGR5dVNJYzkxUy9PdzZ2?=
 =?utf-8?B?b1kyQmxTbmk3RFIwVVdwRzZ4QXZXMVBKNWxaTEVTUDlBMEQvK2hFK0ZNSTA3?=
 =?utf-8?B?dHV6aVRmTXo4b1ltYjZmODh0MldSNnVIY2EraGtBc0llUVVkeDBiRzBKR25C?=
 =?utf-8?B?cmMveUQ5cWIvZzhYOGorWDdYWU9SRm1DRWprSXZMajRNbHYwU21GSXhqUXJo?=
 =?utf-8?B?eXltc21uMWhLVWg3T1RpTE8wMi8yL2V3WlZaaEhGS2RsU3Fpc3FiVU4zZ0I4?=
 =?utf-8?B?RnVpZ1RhSktmY3RmZ1lVZkxUdWVkSWRBRVRkTWZxWURWSlVYV3lpMGtsbGRi?=
 =?utf-8?B?cUE4Uk9UZ1ZUUTcvbzg0cFM2SHA0WFpOK0szYjcwTmVEa1BuWG80S29VZUR2?=
 =?utf-8?B?VFRsV0ZMOG9JdkRiWkE3Q2xuTE5KNDZZZ3pJYmdBU2JtRDg5VTVPN29CSWJr?=
 =?utf-8?B?aXJWbTNuWHQ5b2RwSTE5SUJhQVhDekY2RGxNNGFlTFprNU1mZ2tEN1I1OWRO?=
 =?utf-8?B?R2Z5MDVyTDBpc2NIR0pkcWNXY3JDaXVlQ0lCRk9tUnE4RjQzaHQ1ZEZxc0Ft?=
 =?utf-8?B?dDEweGhNUWZXUHMxZHFCZTZKV0tiMHZSWXRQNTE4V3RKRHQ0YjRxdTFvbjVH?=
 =?utf-8?B?OXgra09IN1FPVlMvMGduRVMya2xlY1lJMWRNd1phRkZYRi9NbWNOSEM5ZmNt?=
 =?utf-8?B?QVRacXpUS1ZaUm1ERnI2Y3o4T1FjN0Y5eUVVdllHOTlBdXMzelVmbHNMakQ1?=
 =?utf-8?B?RHRIZVpSdytRcUNsbkNGd2x3VFpYLzZiT0NOQ3c5YW11aHhRLzJtbVdpVnQ4?=
 =?utf-8?B?eUUwWEtoc0w2T1kyVm1WZ0d4VU0rMEVtb1JidFc1TUlmazFXc1Q0SWhUU2Fh?=
 =?utf-8?B?T01McEM1TmRzSVQ4enNKTXFnSG9VNCtIRHpJcExOWm9aWE5rN3VpL01lNDg2?=
 =?utf-8?Q?vz35sws0V46ok4lbJpTIgkNFELMAitF92ws05c2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fef266-b6a5-4214-6c85-08d9353c88a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 05:13:56.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJOkdpz2tEAstgtkF/JmqfKRwjoKf9SaNR5uQRpDlMySYKrmfyxP1YcKOp/d6ZM4VNEGBIztRWIroC+n++YW9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5312
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

Thanks for the review.

On 6/22/2021 10:16 AM, Dylan MacKenzie wrote:
> [CAUTION: External Email]
>
>> +static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
>> +{
>> + union sfh_cmd_base cmd_base;
>> +
>> + cmd_base.ul = 0;
>> + cmd_base.cmd_v2.cmd_id = DISABLE_SENSOR;
>> + cmd_base.cmd_v2.period = 0;
>> + cmd_base.cmd_v2.sensor_id = sensor_idx;
>> + cmd_base.cmd_v2.length  = 16;
>> +
>> + writeq(0x0, privdata->mmio + AMD_C2P_MSG2);
> That should be AMD_C2P_MSG1, no? The new hardware has no param register.

As per our firmware spec to stop the sensor from streaming the data,
1. Clear the dram address using AMD_C2P_MSG2 register.
2. Send DISABLE_SENSOR using AMD_C2P_MSG0 register.

This what precisely above function does.

Thanks,

Basavaraj

