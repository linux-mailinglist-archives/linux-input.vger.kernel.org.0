Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36D43C98D9
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 08:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhGOGmA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 02:42:00 -0400
Received: from mail-sn1anam02on2043.outbound.protection.outlook.com ([40.107.96.43]:56506
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229828AbhGOGl7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 02:41:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYCL5Z1uaxA81Z48cIcP1v9fBrTTegq5Rkdw2TUYB9sN5wd40j/WhMERykCVt4d+IseDlYGCiEr+2EPdxqrFV3ykScIIp/DTsBKJjNek5Y4QerwcHW81FLPkwN/eRhOcrd0SrF3GozbFy7Sp19EGjUpahu7xtI8UogNfekwhfhC/mwZUA1amHdJBwyCyCjIIh+J+VlCr82Bk2O4BniIDWswYhVkd0CPvo/0NAQ202Vt/eD7/3AyWRNMpBjBVbiLwPvD50FkpVy97jk0SjaJ46sKlcR97T5EgpNCSXP9pVOCoa74F8hEChVNhXx5UpULKjWUzZoeIyzDhKE0thtUzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMFho+vdnN6oA06gCJ/Uml/JITntejJPOX1gQZyPr40=;
 b=gVecQeKx5iZ0iAZlxPIp0DAOLp2rxGZfx84aQb+w31uNnkbSC8JaOPJOfPxQHjuyDRggrDcOGxVvcLVmGZTT5JJOeNLxQMNQb2O+Vm+THabWBkH7JnLq+A2D6lpO+WxWQ7lW2dmCilwYz7fZD2zpGrKpr9Hvps01l9YMtQEyH1KfLHLReXgSVfWezOpKc6J/NDy5Sl7qLYsbndTiAssTuzAogLWPRlC1wNxmqmq3UIjmutlbaUnjq8GVcBwWEdT3dX49fLVYnKQbU7UeP9qsOwxc1vLIu0PgUppYQ7AdjuKElEKQ5rmqxDDAiQRKfOec/CJlVfsbYv1RIm8JDdbIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMFho+vdnN6oA06gCJ/Uml/JITntejJPOX1gQZyPr40=;
 b=L483LS0yahLCfgJVzSUYWwtAnE7sx7TzfARYAMw20lu2A9qwscGUXJhamJvOeQvYBmfIKbPC8OrKb/JzjbT5pvfVuuWCqV8UmTYJh2el+R5qzSdkdqe1yt3JREnAk96BbCoepBq+nRv4Kmsu36eVAJ5T4qFNXClM5jmWSDruYTM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM8PR12MB5496.namprd12.prod.outlook.com (2603:10b6:8:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 06:39:05 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3%3]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 06:39:05 +0000
Subject: Re: [PATCH 0/3] Add SFH sensor support for newer AMD platforms
To:     Jiri Kosina <jikos@kernel.org>,
        Dylan MacKenzie <ecstaticmorse@gmail.com>
Cc:     Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        shyam-sundar.s-k@amd.com
References: <CAHpHHjbnhAnhkq-G1UbtjP=SB24FVnEtsXqkT8_ZTb7UD8j_kA@mail.gmail.com>
 <nycvar.YFH.7.76.2107121007410.8253@cbobk.fhfr.pm>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <75e4df4a-5771-f4f4-7536-6359375af42f@amd.com>
Date:   Thu, 15 Jul 2021 12:08:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <nycvar.YFH.7.76.2107121007410.8253@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MA1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::15)
 To DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.213] (117.213.166.145) by MA1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 06:39:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a493ee2-18bc-4306-0d9b-08d9475b3d88
X-MS-TrafficTypeDiagnostic: DM8PR12MB5496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5496D0980122E91DF944EBD3E6129@DM8PR12MB5496.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Ed5YPPmd4U9MUfCqR0Rly6N6ar1kVsWzgoMkTqNj/cWR5yjDpMwlfLAkmaWAJm6mcGO9H6kEZrKjH1mEgKiX8nAPfM0TBMj3bdXpdMCZbVK3VcirhX3ZRuyKHe3weSaB7mp2GocqyRZKbeU3S9SA8jCVVW8YoSq2ztXjr+Intfeqi3sO+f7fVRyQuhQCqqpWqj+n9JAfP5HN+6sJh3Ry3nbscHP+vPjeEDBtp71Z2LxlLOxdyF1gPLAe++ezZKES25Xkfb36Mb0xB6DvLA8wWWbc7QDLx3CkSdlHxlOwzSa1NHh+Ilws05NaAC4KeBrw91aWg69J7vVJHXjXFoyimnZlG2JsO/eXashvb3Tz4wGfyyuHlUdIK40p85EmgKEytQrawTo9TxX0qjr6QQivEa6SKah5XBIXo4PKCJ4w9g9mZnpTSmp3qxavY+WNhRyWtQ2xZ08gWoBdJaN0aTODB20P6xQApLlG8XE25nirCutlXMhSqeY1cTsgIeRaDKB+HFmkUYVCmBFB1nn/0duweZKHs3GcG0IWDzGAaaJsnpq3BAFtnUVQi2fJwDQvZzScPkUs6KpvlZ+uWRAI3+KqmEtPnO8Y8CNHLNzTvth66xlTBpjJIV8gvdb8aPSy+g6qwY8pdDoCo163cSDWqzoRkC/v4WMqSNYVFS+El0bgWvJjLoCHyfQZv2/9dmrulifD87REQSf3VpnuUOCtW6HybmupJTUbnhpPRmRG/uC140=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(8676002)(53546011)(16576012)(956004)(4744005)(31696002)(8936002)(26005)(2906002)(110136005)(6486002)(6666004)(83380400001)(478600001)(316002)(186003)(2616005)(38100700002)(31686004)(5660300002)(4326008)(66476007)(66556008)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGY4b0U0UnlWcVF4a2xFM1BpNURvU3dtMFlMMmxHUWhtNXg5T2FnMmhNb2Fx?=
 =?utf-8?B?M05IaVQyTXdMUC8waW80T3RReGxlRVZsaEdsN3VTREl5UlorM1BvZWxwRXhp?=
 =?utf-8?B?RXVpay90d0lUcENRNzZSSlpoamsyZjh0NEJUc1F4dm1QT0t3RUhmVElOL1F0?=
 =?utf-8?B?TzcvSEM0cTh4WTlhWnJ3QXQvTkk3bE0vc0RDRUZJWjlCMDhLZ3YweTdiZDMr?=
 =?utf-8?B?cW5vaTFZdVpGVmFnUmpuQld1TUdlbHNVZEJYdE11UElFUHVkazNycHptVHpo?=
 =?utf-8?B?Ky9FbW8vV2p1RGRTWWwyUVJwOUl6R3ltS2lRV0ViaFB2Z2RFMDNtMHhFOWZK?=
 =?utf-8?B?NHZqT21YcVI3UVcwUWlvcVV2eXJWelNWN2h0OHdjNS81V3R0eGVtNFFZTm9o?=
 =?utf-8?B?NmFPYVkySk5CcFNzN3dTWG5IV2t1cDRkN0M0Sm1wRzcyWU9iS2tFVGY0QW5F?=
 =?utf-8?B?NThDVzVpQkhMalhmSzVPeUdPQzlUdy9PZ1VSV0JYMEIrTzlWczkvMldrQW9T?=
 =?utf-8?B?Vkw3VGlHMnhJdmdHVU9tdzBSRU93TzVUcnJKRCsrSVBxQlY0Q3lDeHhPd1o3?=
 =?utf-8?B?OXlVNkthU2ZaSXNjRTA1bkJwMlNKUnhsaU1DcStYZjhldFIvQjBFak9XSHY5?=
 =?utf-8?B?OW1IK3AwNVNLRUJvSG4xTVlGbmZSVE13VGwxeXFRaTIxSFFVWmlnb0RRWmtO?=
 =?utf-8?B?LzVXa2YxWlQxdEtvd0RraDk0aGtYWkl5UnZGVWpGU3FPdmhoSzJBcGFoVEtQ?=
 =?utf-8?B?VUZudzZXWlhPK3lpU2xVUHlEeElaUEEzalIzYVF6SFE3ajNvaU54VDkrWnM5?=
 =?utf-8?B?VjNkdlRyZjJrSFNZalFIR2s3Nk40NnhFbU9TaHlmbXJoa0t1TE5GNUlLS01E?=
 =?utf-8?B?bTJYSDFjblgyZitraEQ2UzR2NURIbDJuenFoNHVYdWtlMkcvd3JxdlFEZUtu?=
 =?utf-8?B?d2pGZXJqQjVQbzNMVlg0MVZuZGNVWEE5aEFmN01LOVJtMEZSektnUWM1dGJu?=
 =?utf-8?B?dDRlN3o4Tjl6TkxOL3V3OUJNOXlUd3NFNjU4Z2M3V0FnRm1BQXJqaGp5bEhm?=
 =?utf-8?B?WXljaFh4c3BXaTJxZTZiNnkwNkJpUVNCK0NnT0ZyeXAxVHNRTW0vZ0YvTVBI?=
 =?utf-8?B?aXNUMmgyTktEWVVrOWIwYUgzVzZxbDJybm1qMTRVd01TRm1DRi80RVZBSGhX?=
 =?utf-8?B?K1ZCWWo4RDd1Y0ZHNVd0eTlqNmhKRVZsa0lEa2xFblZrRGR3SUFPcll1R2NF?=
 =?utf-8?B?akg2S1E1cEQ5R3ZwSFh0NW45N3BpeGFSelcrSUxTVmthc1VCSGZZUDdPRzhv?=
 =?utf-8?B?ZEZseGdNMVkrZWZJUmFtekYrSjVLT3phTEtKNEx4T3lWSU1sKzB2eE0yb3lY?=
 =?utf-8?B?ejNuVW5JVTZTS1pxcTJ1WTFBMVRGTlJlWUpyL282clcyNDduaHpkejRXdTZ2?=
 =?utf-8?B?V2MzT0lCY2hGWXJNVWhLVnhyWklSVG1leGRLZW1mUEY2Y3FqZDcvYmdXU3p4?=
 =?utf-8?B?ZFQrWkMxdFRmVGtUeUNWc0I0LzA2MmpHV09yNiszM2NaZ0F4c3pNQ0V4aTdv?=
 =?utf-8?B?WWJpVU9xUFJJZEJoUWlQcExpZjJVdGZ1ZkFOanZxRlgwaTI5RkpLL2VoMnVX?=
 =?utf-8?B?SEI3aGFQTVc1cmg0YWxWdktrSFBLenp0TFg0WXVEbTB2VlhxRENUT2xxVDJ3?=
 =?utf-8?B?WE96MlM5RkZDWEI1djNZSUE5NFdPVnJpYTFsOHhETkNwdmQ3Z1hLbFlsWnhm?=
 =?utf-8?Q?Pqo1erE2YY0UlQsBwL7tjueZ6u1pqLswlvPdicv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a493ee2-18bc-4306-0d9b-08d9475b3d88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 06:39:05.0832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbQR4XX/ulPohxaPGIxfSUF9Ep4eFcEt+AW+/woCdFHJaimsdfFeJhz8McYujkuaoY1JT8O4YVKSBgH3msOw9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5496
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hi Jiri

On 7/12/2021 1:38 PM, Jiri Kosina wrote:
> [CAUTION: External Email]
>
> On Sat, 26 Jun 2021, Dylan MacKenzie wrote:
>
>>> Now queued in for-5.14/amd-sfh. Thanks,
>> FYI, this patch still uses the wrong register in `amd_sensor_stop_v2`.
>> Basavaraj confirmed this, but my email client didn't CC the list for
>> that conversation. Whoops!
> Could you please send a followup patch on top of for-5.14/amd-sfh branch
> to fix that?

I see that, Dylan MacKenzie has already sent a followup patch.

Thanks,
Basavaraj

