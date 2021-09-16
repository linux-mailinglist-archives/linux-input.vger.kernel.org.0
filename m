Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF8E40D2FC
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 07:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbhIPGBI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 02:01:08 -0400
Received: from mail-dm6nam10on2047.outbound.protection.outlook.com ([40.107.93.47]:34392
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231281AbhIPGBH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 02:01:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j82HLtqvYwAaIoED8+3Q3cqIPvu22nP3mxk/7GDaeBlLgOouo5TkLfVzaLG1zC6E0uNyjNcZ+Q1ROicqZgh4NGeE/crGrjlIi104Krva2jxdvWc5XigU39b8HA9eSYnPf/SNY/LNCvbYrOoLUv8V9k0WUSfYUf7X9Xdzvr8TywqbYjeu/NryF8wi9KDINBp4g/9f6YqKjf/Q0Y+vsKe6gNg9AwwXjn00k8Xgl2bjIk4M6QkVbzYP7SLImLSXU4jIIc356Y68sSolmtRF02RQcamkDYRGdFlG96meEe1NIO5XDhQnFEu7LUMG8jcIuVQNuqEMojLhJB31TvAbsRcL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rqhYGaJK36X/TC7V/H1aXR1o8OBsTp5dZJFvu1DOqx8=;
 b=kgfPVZCihf5EGe0KC5/l0sC/yj45GywNzTSrTB5iUh4NCrghWHhEbIFoC/6FECeSR1qZZGofS+A2YAMpSLsnZs5YYmAhXJatgrU+zMkSHFIj/2JXg3zeyw90r8xni1eNony1IwXxgQf25AtC9yQzQEHTjExVYOr3nUWq6hS+gsQ1UF13wnlKD07FXiBdaGljFxRWMtQeGlB2gODb+4wqpUy/8VUSp7vajwZei1jszlnK2v6zIYwGJjOs0LZVIVRaQd2AJY9XJyHToxKPMi0II9xUPojUH427XSA36+adxrS4UzGjKu4/EfqI8QBD7ukbfRwYEW++/6V8cR4OdlMrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqhYGaJK36X/TC7V/H1aXR1o8OBsTp5dZJFvu1DOqx8=;
 b=TjB+UIRjOQ/oalu+sVHcO8DzIaoaSz0HnN2omzaT59F3N6uzWIukDHbZfSThSEo222R0I0iVogcgnUvJ4lw7QekuNt6+kkzh/ZaWhKaEmRgSBulgBJcEi1hw6Cy3jyG6mFUDagGqP/ghIEpB21j3BQa0emHik7rJoSvtOamZwHs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 05:59:46 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 05:59:46 +0000
Subject: Re: [PATCH] AMD_SFH: Fix potential NULL pointer dereference
To:     "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Evgeny Novikov <novikov@ispras.ru>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>
References: <20210601163801.17848-1-novikov@ispras.ru>
 <nycvar.YFH.7.76.2109151657580.15944@cbobk.fhfr.pm>
 <BN9PR12MB505242B95EA964CF0990C006A0DB9@BN9PR12MB5052.namprd12.prod.outlook.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <9597d27e-6df2-03c3-57fe-e77f0b044d4b@amd.com>
Date:   Thu, 16 Sep 2021 11:29:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <BN9PR12MB505242B95EA964CF0990C006A0DB9@BN9PR12MB5052.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::19) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
Received: from [10.252.90.200] (165.204.159.242) by PN1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 05:59:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ced68b7d-06e3-4e68-f2b7-08d978d72f6d
X-MS-TrafficTypeDiagnostic: DM6PR12MB5565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB5565E64BE6F35CA1B69E79DBE6DC9@DM6PR12MB5565.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKxrn22bZVfwbQqlCgTggMy3DRluLRAwOSStHS6w4X1wEBhKjg6X2lt3J7uID9ol9DS2v8yLrJrr9dgIOGciC128JBHnhnZO4QfF6fyvEzs6PJV+aLSLWAEyxa25rB7wYvn7A3XNC5Q6KgfMtn2tY7Ngxw+LyLkmr7C+6a0MHH0KmiwhFvGj/zJqiRxgnNILPEMpqtpkqMjobbsB8O4+sDlj87PMLZvdPN4VjjOQsFxPM8GAV6aUXQgZ4ttBSX2/oPsOZyfT2AcsCPiqt7GJdeMWqYGjnUcUAS/0KcUjP+C5TIDGOkWYbq9uzjgeHRwPqCrUBEOvbLsIY0nu4qsdVwRyjol0nHtgLt9FUQUY6V2jllFCqskevKB+H48P88LhuwmkBpCw+3FjZiScnFQknzxYvABmZUjZrUrCqCfTWHWN4YJ7WH5yyuVGWd/3/V18+Z9TaWLUVYtCfH1yG1bi2wRQehYHBuNPKl7VQ7ceC1jt4YOGB7WECt+zGzzpUpxzo6v7878HW4jlCYB3KsoF/P/foievdwIBs3exWeT0/G0QtxRe22DISGUN8o11U7/WP2O1MGFkG4FwYM6LvKU2loJTww13obGOf1PmztW9TGXxVOvZiDwtxN5gzAkebrY8H1+Rwg7LMe8HHQ2LYNlNWaW/g2uaBZBE5Ki4LeguoK1eFm3veC0hzyQNYabNEpg7EauS/wv/LBGUZN7IBzRs2DqXMx3HJ7hQeQdZUjKGeBFs8jFmqDogEDNbh4Qqej3m
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(26005)(6666004)(31686004)(66476007)(36756003)(2616005)(110136005)(316002)(54906003)(2906002)(478600001)(83380400001)(66946007)(8676002)(8936002)(5660300002)(38100700002)(16576012)(53546011)(4326008)(956004)(6486002)(31696002)(186003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNrcEhlMVVicUhLbU1ZOWZGRENCSHhWWm42Y2R0dFZlQ2U5b2dlZlBFTStS?=
 =?utf-8?B?SHdWV3p2N1VLYmxpcEMzLzZveTFWN09FSW5UckxrMlZxWXJFbC9lbGtySUlB?=
 =?utf-8?B?dGc0c3JpdEZ3eDJEWEt0SDUvUzdhMkw5RnZTRlBDUy9QdWlab3M4UVE1N2dI?=
 =?utf-8?B?R0FnQVVaZndXSTZrMVg4aVJtWGFENUhuS0FMaE10MEZPRkJHZmJEVTZIeGNp?=
 =?utf-8?B?SlkwUVFrdnRQZEV5cm9rVXp4WE1SejhaTFVMQWtMU3V5N291OW1xRUpMZjA0?=
 =?utf-8?B?cEhHd0RzcmNwaHFUcS9oeTNyeWZGU0FDRVhFZXhQTC9ETHlCOUI5bkQydHlG?=
 =?utf-8?B?N0ttT2hOZHpIZHdTT21WM0NTRGptNVhDSUFzZndTR2Rma0JlZ1ZwVi9uaExn?=
 =?utf-8?B?V3BDbVlLVWZGemY1L2JyVEwwY3pLODJxUUtyZ0F6NFZ4ZFRKVGF4YU5zWGU1?=
 =?utf-8?B?a2U3MUdGNDBscThTRmF5eEFuMXFiVjIyUk1qMFJod3dMZUVUSXdDU0FIVHVB?=
 =?utf-8?B?SmV1b25Cdkc4RyszaFN6Nmg3TmhUOXJVYWYvWEdPMFpNWWV0ZC9vS21uTlMr?=
 =?utf-8?B?TGNQOGNKNWlUYldiellRMWhTVWh6VE9pb3dOdktMb2xHNno3TDNqdWhHeVpa?=
 =?utf-8?B?S2taZ2xmTjliNUx4TUc2SlNObW9FVWQzVGpDWEJ5cDVTbnUvWXFQNzJNMnYv?=
 =?utf-8?B?czF6QWlyRUJQbGxsbDZlUXJTZG12anZ2ejdOL2Nqa1BTREpxNEkxaVF3Zml1?=
 =?utf-8?B?Tkg1Z2tnZ0JpL1pETkhRN3o3ampZZC9lZDdtUmROZVZWTHQ1amw5WUFJTU5M?=
 =?utf-8?B?OWxLNUVaYUhkcm1TM2JUazh1T0YwSFR3MmpJNnVkRnppMEdYbTR2K2VaMENW?=
 =?utf-8?B?WUlVSkdWMUc0QmYybUxpQ2lhRE82YlVMNmVKQXZ5MGs0NzBCNFlUOVZVZ3FH?=
 =?utf-8?B?enNNTjFPb2ZFUzlCSko5N3hRTkd1U3QrVVdzYkhjVTF6R21CNG9hbTAySG5I?=
 =?utf-8?B?MThzWkNDMzBTc3FseVNvczdqSUQ3ZWxDS3l6Y2dremc2T2NSdXBkOWxLdG5R?=
 =?utf-8?B?OHpSWktYZ1FWd1NlY2d4eXdCczYzVlNFdXErV3F2TUI0WlpPKy9yejZVdFkr?=
 =?utf-8?B?UEFyL0JSaDROLzNYV1FQY3pqZW1xSTdxcmc1cHpYdm5RVkVFdDRrWW13SSt2?=
 =?utf-8?B?SWRMUUtqVndabkVyWWhkMjBocXdsQzdDWGhiZE9ENm5ES3djd1RhQUM0TVJ6?=
 =?utf-8?B?WDhBK2xOQUFrQzBhdUF4R1Y3QzZmdnZ3U1pmRVlaaTR0RU1JWWcvRWg5QzM1?=
 =?utf-8?B?WWY4VDQ1UlhQWWVyVERwSXBSeG11bUx4VDlDZWVFRGtPdzNnNEVpbGxVNnZP?=
 =?utf-8?B?dGRuRndGUVlVOVhKSDhlNzcrRXh0WTB1T1N2ZjFNdlY3SEZFeHREZGl6WDYz?=
 =?utf-8?B?WXJ0OHR0ZXFmZUE2d3g4RVQvcmhML2Qwb3ZKOUhUYVA3ei92RFRPa2hXRTJ2?=
 =?utf-8?B?S2xnQ1FsUmpia1d2ZTBLL1QwQmFDMmg1OFcyTXBZK1FxWmcvSmJjRFZlRy9w?=
 =?utf-8?B?QUorNy8vRHhiRTVOQ1BBWkhpMjBmRzJDTHgyZmRNbFY5c0ovKzkvOFByKzNr?=
 =?utf-8?B?SjNzOWtRT3BUaEpwNENWL2FEeG1iZy9tZFY3VjRyNFBFaFlnTG9hMEdYbksr?=
 =?utf-8?B?cmJQWWQreXI1eFA3MldVbU5RTFFqUVRKS1RkbWlRejdnZDVFV2Vxd3pxdDVw?=
 =?utf-8?Q?tiOtL8iDDc8hw2/7vaR0DeEM+cIMQKqQxkhXn3W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced68b7d-06e3-4e68-f2b7-08d978d72f6d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 05:59:46.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjEhdFl12YAGPBrt8smK7dE6K+p2CF1mzoF/xqX1UsCKyU+zy00o0sCwHb2bEv8eV+96DyTLJiJ55JK6V3nf7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5565
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/15/2021 11:02 PM, Shah, Nehal-bakulchandra wrote:
> Adding Basavaraj
>
> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org> 
> Sent: Wednesday, September 15, 2021 8:28 PM
> To: Evgeny Novikov <novikov@ispras.ru>
> Cc: Shah, Nehal-bakulchandra <Nehal-bakulchandra.Shah@amd.com>; Sandeep Singh <sandeep.singh@amd.com>; Benjamin Tissoires <benjamin.tissoires@redhat.com>; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; ldv-project@linuxtesting.org
> Subject: Re: [PATCH] AMD_SFH: Fix potential NULL pointer dereference
>
> On Tue, 1 Jun 2021, Evgeny Novikov wrote:
>
>> devm_add_action_or_reset() can suddenly invoke amd_mp2_pci_remove() at 
>> registration that will cause NULL pointer dereference since 
>> corresponding data is not initialized yet. The patch moves 
>> initialization of data before devm_add_action_or_reset().
>>
>> Found by Linux Driver Verification project (linuxtesting.org).
>>
>> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> Nehal, Basavaraj, could you please Review/Ack this one?
>
Patch looks good to me. Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

