Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF503391C06
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 17:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhEZPcS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 11:32:18 -0400
Received: from mail-dm6nam10on2068.outbound.protection.outlook.com ([40.107.93.68]:4704
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232692AbhEZPcS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 11:32:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNuEY0+Fxr3SVxWlCqkOIEL8vpGkZ57OR7LdVo8EIQMH0pvFOUJdleVqUqvpSmSUmfHfdX6PH/WMXKH8ZAvTMuYYaAU5Y8oPTEe/v1hflnYMpyuvIp/FlFlnQnNHpXSk+MSb+fawUpTc2PAoMkLrtzijHUVIt63tr6gusLgVJcpFqqeW2f2R5No+t4rKTMlEyXJ6p7Yel9mbZXK7IPF79jAgQm2wedZxIA15b4GC7/2xVqo7wDiDN/kRQY7NUcgSpheDCajgdwIGaBxD4dKg3kC47gAHfS9kwPrYwWTbhZ3JbHa0Pzqqg7I+RMHr+u0XDuftqLsvz+q2addONP7WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6i2QB7pGtBSmuR5Vt0FnHGKEIpsrGwM0je4HQf/3+Q=;
 b=mo0AWVwbZJhyZEeAeM2KheBLbM0f4YJMiFzSSEYmiireyxqrd7DS26Uef8k4cz68OKVr2RDOvgNDNr2UZHGUpn8N7c29jhKLQX9n3jMzbNZ5YxWjr9rLAhk5OOUTwbz7YoWtegE4lrt7Pn8bWDpSTVx0dvmH3zC3/HJQeXOKvMi2OiPX85R6qXl8GpTUH8t82bRinmCXSPKiwsAe7k2O7VJtI43lHuN3KOFE8khySRwwWJQK+N9km0Gv4aagWkzVqU6+sXQiOK+RR1ztdfztZl0Vvx0wofIO6wRlbyrCn5bDgCsLuINQPQtmQMVlzqVJ6nNJzClpPy0cmmFIEXgP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6i2QB7pGtBSmuR5Vt0FnHGKEIpsrGwM0je4HQf/3+Q=;
 b=oXnxlQXL3l5mNBVF7O6BW+E3tKyhq+t+7KLm89zBiz4+H3cwZwicgASzDjdRzTuq4j6b7YmpfCzRYEBEynqQHu9oDZtMX6kfVKJgYBqtMMNKJdsihQRNRO3KFXc1DuECNJLrW3ziR13ZitEDu/e85a+vxS2FlYxR3VgcV7RsXO0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5166.namprd12.prod.outlook.com (2603:10b6:5:395::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 15:30:45 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3157:cd9d:233e:70f9]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3157:cd9d:233e:70f9%7]) with mapi id 15.20.4129.036; Wed, 26 May 2021
 15:30:45 +0000
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     Nehal-Bakulchandra.shah@amd.com, Sandeep.Singh@amd.com,
        shyam-sundar.s-k@amd.com,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
Subject: [PATCH] amd_sfh: change in maintainer
Message-ID: <365fa7b9-2829-75b4-c152-d58dffc6eead@amd.com>
Date:   Wed, 26 May 2021 21:00:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: MA1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::28) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.90.99] (165.204.159.242) by MA1PR0101CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 15:30:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46f68a9a-0f5b-49db-e9d0-08d9205b3aef
X-MS-TrafficTypeDiagnostic: DM4PR12MB5166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5166C818EE4EBB3484D50538E6249@DM4PR12MB5166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UEBx+aIdguIp2H+sjM+jBNKh+KydOm24axwgPDsANqsqRw/lNEgXC+rQODaBTrOCWzHF5oHep56OGvFElHbJRXfehuJSrCG2QFdjapCCR4xI28IT7EedoKBgsawodUjMIoZa8lU9WMeYrx1MPZ45yP3JVRhdZwhmj9znz8ka9VZ7ntUivWzQdsKlLNweq/G7Q4fNjNY+yhYs4f1c7S+SSl1fdz1OlpA14U8eq+/prIYt774/N4fN6613oEKhn09Nrg+w+pbfzByDN618N5WnL+CRnBHcaYv234rX3PqgdqClR2qyjbICQtVsPS6WlcFsyNdRQMyKCc8xKjqVu1247JYe+qehP8HNZEETuKrF/QhVuY9nIyLtdVF6wTDm78PMGuwODLIYz5kul4MBl6r8yQ30rXQuxzHUh2EzXlaREfdUM6suKlmV2fy3U3Mjn8fIQWwv/lNzZ8jmpzirJP7mgeIY28n4GXOPa1NkLJQSr75n6zo37y4TwrToffRXKvgtMOg2KY5IYo/zW5cl4fD0WAdxSjSXuZcuZOyA1Gb59avY3nQV7ybLFErxDAw1VuqAL/c2NSE9PT3WOpAeiAQVJZSWPN9osAkl8kGiAoU+XfU5inqplQeraaLmIOCVJqfpGM0uiOdQ1fkFTjBdhZ9epm2AV1yZsVou0in1tI3qPgvm9CB6KYDyZvzYHvizNg2j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(31686004)(6666004)(6486002)(83380400001)(36756003)(478600001)(26005)(4326008)(186003)(16576012)(316002)(16526019)(2616005)(66946007)(5660300002)(8676002)(31696002)(38100700002)(956004)(66476007)(66556008)(8936002)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sk9Ld3BKWCtOakJsZGJHSFpOc2N0WmFRNUxFMkxXOVE0SEhYeTZ0VXo2Slhu?=
 =?utf-8?B?Zm42S05QdnhEQjFoVmZFdVdHcTd6aHlIWVJad2dBVnN0UUtjM3ZtVWx1Tmpo?=
 =?utf-8?B?VDZpY2tiNWNjdzVOYXpINWU2cEFWWS9DeWVCZEVpOVhnby9VVUZVQ0o1Nkkw?=
 =?utf-8?B?SUtSWnlSQU5BNlM0MnJRYldlWHNrM2djcGxydU9NQXFwL0pZMGlIOS9ETzQx?=
 =?utf-8?B?UHlDQzZPbGF2eUtQbXNMc3hieG9icXBqWUlRY1Q4V0trNVhqdUZZOGhKeDFJ?=
 =?utf-8?B?ajZYTmhwWTBFU1krMjMzVzBiTHMzamcwN2RSTm45amxsbWpoVWc1OHNuWkJR?=
 =?utf-8?B?OFJKL3hqM0toZU0rYVFEejh4WkJQc2diWm4yWVViMFE1QVNuT0FscVRCT0pj?=
 =?utf-8?B?MzRKTzVzVVVGOVRDOHNZaVpvc28za1ozU0dXV08zMUlKQU5VWUxDL2xZL1U1?=
 =?utf-8?B?TFFZbFpEekxtZ0Nmb3ZyV1RQZjNvb0dzU0ZwUjloZUdKeTRTendmWWxrTVB3?=
 =?utf-8?B?QmYyR1R0V3JWS1BxeTZmR3A3eEIxejFOZVFJVlhzY2tja2wzYndaVm42L2Jp?=
 =?utf-8?B?SUNId1lUQm9UdVB0eEVaWkgvak1JcEZzUUhIMDY2czFaYmdzeW8ycEdhYkhs?=
 =?utf-8?B?bm5qY1V4dzN4MlUyRjNBTithZ3oyYW4zUmJKWkNMRlpLY1YyRG5JWTJzN0lR?=
 =?utf-8?B?ZGVpWk5ualV1clB5SXdDaXk2THprbkNSdG1mNHN3ZjR4aXRkWlNDMmF3K2RK?=
 =?utf-8?B?azF3MWJKdnJuZHdkK2xLS2tjcm85ZU5yK0RORUkydmdYckRoUXgxN2Fmc1Vx?=
 =?utf-8?B?cUNUaUUvY3NDeXg4R1VXREhKb2dQbXhvZndVNXRmbHpxU0d6ZEk3WUtFMzds?=
 =?utf-8?B?YVhNZVBHQm1PNTE5alBNemJ4eEJGU2t3MlZsem52dTFIMmVHYnc4NkNVNzZG?=
 =?utf-8?B?WHFRNzM1L0J4cVhISzZJeHlhVWJEN0UvMWxkZ1BCWFRZRlpFWDJGNlFHZFpJ?=
 =?utf-8?B?L2U4KzZTWUNaSk5zSDVZQXlXdVd6eHNiUVFWeWxUQTQwK3VKbENqQWJ6Z2pN?=
 =?utf-8?B?OUJOTG5hZElNUENUeU04VmFXZHRtbkY1REcwZFRtNjFJVU5JeTJQaWhkNmFH?=
 =?utf-8?B?alZFZlh0TjNxT3UzcXdFaWRtblR2Q3lPQ2lyWFlENTVWN2ZqMDBiZ0VERk40?=
 =?utf-8?B?YzhyWXcybUJNSmZLQTRzVklKWWMyTm8wbHIxZ0NXdUhBSzgzNjJBbENmbWJI?=
 =?utf-8?B?U0ljb1B6WGVZV3ZTS2c2cHhWR0ZRUzR2RTB6azQwNWJ1Ykk3M3JDbEFuV0xC?=
 =?utf-8?B?dmJ1bm5IdzFaZ1M1dmFMWGw3MjN6emlaSERaRCs0Tlo3bFV2SUQ5S2gvaDRY?=
 =?utf-8?B?cDJaZmJ3QU1jbGJwZnZLMGorTjRzMkxwa01VRy9lcDNpWXREeXYrOWJpazU3?=
 =?utf-8?B?QkQ4S1k1V3ErcE4zUzhTZU1CMUFWdEtpb0tXMWUvV2lIcUp3cS9GcnhINzJw?=
 =?utf-8?B?V3R5TlFpLzExV05YYWFOL1AwUzdXKytTanRRaDh6bVpXRXVsWWJRcmU5MURp?=
 =?utf-8?B?SVRwTDBxdTczdVQyZ2Z2cTNIOEdMNkNvTzRNRXpueGxDdkxPdFNqZ0hXSEdC?=
 =?utf-8?B?UU5XdUJhU051ay9raEw4aGgvZVZURHR3UTFoMzNmekNkR2t5cWJJVFZZMlVC?=
 =?utf-8?B?bTFiSVBXRitlNG5HbHIwSFMyWXdkQ2VCNW00NVpnL25RbWdVMDVZSjh2SzJR?=
 =?utf-8?Q?4HNVYEQJsZ2KwHZDTQzFlG6Q4YDwcdpbl6IrHKr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f68a9a-0f5b-49db-e9d0-08d9205b3aef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 15:30:45.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syT+RnLk0lmNPxiXs36coXOlEz4uMYxm7tFk0P19nTlyzuHF8T90elR5qecje0sVLHt1ElvHgrGegJEMKIdJaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5166
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I would like to take the maintainer-ship of AMD SENSOR FUSION HUB DRIVER Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com> ---  MAINTAINERS | 2 +-  1 file changed, 1 insertion(+), 1
deletion(-) diff --git a/MAINTAINERS b/MAINTAINERS index 04babfa8fc76..1d27060fca21 100644 --- a/MAINTAINERS +++ b/MAINTAINERS @@ -973,7 +973,7 @@ F:  drivers/net/ethernet/amd/xgbe/  AMD SENSOR FUSION
HUB DRIVER  M:     Nehal Shah <nehal-bakulchandra.shah@amd.com> -M:     Sandeep Singh <sandeep.singh@amd.com> +M:     Basavaraj Natikar <basavaraj.natikar@amd.com>  L:     linux-input@vger.kernel.org
 S:     Maintained  F:     Documentation/hid/amd-sfh* --

2.25.1

