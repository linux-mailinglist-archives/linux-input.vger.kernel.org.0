Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D972B296C00
	for <lists+linux-input@lfdr.de>; Fri, 23 Oct 2020 11:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461372AbgJWJXE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 05:23:04 -0400
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com ([40.107.243.46]:28512
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S461369AbgJWJXE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 05:23:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fH/D5m06wkc5/327hfrrn221xWXKVL+GD1BZYsgXQYJOK9X2SpSHIpNKyuxiXP6U30xCFQIr3qUJz/AibXf4qNgJivzNmLdmuxC0UD7fNu04dRlAcrdjHlMsWlnKN2ZgEWKeQH3qnwrLWFL0KVo9auIPZJsRsoYxde2wouhBJSf9KBYqU0J++x//+JABGDHlEvvzCuMDlrlxtloiBchjPp2v9MLmyYU+f5vD8vbNDEyupyCBfjbtKYt9i8p/vrdWvzT05+dX0SXVJ4cEOwu7c6F00wTpg2W0McVLKFfwfwIS16IAztX8UeWpnvUyxOxJ6lxCsyTwlFD1NoTm7ykmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN+/MuraXRqasCzOljP7fvXQbLhqd5xMCknA6RHw54U=;
 b=na+DfJkdLYiC0c7XX8cqw6Jle7q7/zIBRjPT5tCDiGkFsynKVeI5E+aQPFhqY4vXvKo76BlKtc9Y10w67kImDCEJf+TkPd9jzqCgkllx+M6XDoLgib2gJMxj6v2SIAe6YTdKz5U9OOxmfS/7zxl7p56c13LeqoIBZxLs/HaUJNikL2evDImx/hj6JxnfdkRh0bayDKOh8+qwmqm376vuNdjm+SWfoOaPB3uzr34/c8qcV5G4ssykvK3Z3FlVjUapvk8CPo8SqWoHcykW95ZChjmOLivIwC9qNzBggqtTYQE2cYXEqjBMuo0ty/65CqVcq+PtdmPXvtFtF1toiTcL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN+/MuraXRqasCzOljP7fvXQbLhqd5xMCknA6RHw54U=;
 b=2xWwFK3NHRM1jej9LQHPoKVNpieW7Nz+CkyUkn63fNQhJaNx2NbfcsRquvZqmxcQ2gV/Lb+MBUhvaPWWZxt62PH1XVC042BE4br+kWnglaMEypeiY0t4nxxOP5C/MTs2D8YJjSCWG5jViHQb409FYs7uOIPD/lpjiUnYuROBYDo=
Authentication-Results: richard-neumann.de; dkim=none (message not signed)
 header.d=none;richard-neumann.de; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 by BYAPR12MB3157.namprd12.prod.outlook.com (2603:10b6:a03:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 23 Oct
 2020 09:23:00 +0000
Received: from BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d]) by BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d%5]) with mapi id 15.20.3477.029; Fri, 23 Oct 2020
 09:23:00 +0000
Subject: Re: [PATCH] AMD_SFH: Fix for incorrect Sensor index
To:     Jiri Kosina <jikos@kernel.org>,
        Sandeep Singh <Sandeep.Singh@amd.com>
Cc:     benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, jic23@kernel.org,
        Nehal-bakulchandra.Shah@amd.com, Shyam-sundar.S-k@amd.com,
        lipheng@hanmail.net, Richard Neumann <mail@richard-neumann.de>
References: <20201023085947.459045-1-Sandeep.Singh@amd.com>
 <nycvar.YFH.7.76.2010231104540.18859@cbobk.fhfr.pm>
From:   "Singh, Sandeep" <ssingh1@amd.com>
Message-ID: <ca400980-9f3f-4269-dbfa-15c16a85d106@amd.com>
Date:   Fri, 23 Oct 2020 14:52:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <nycvar.YFH.7.76.2010231104540.18859@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BM1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::26) To BY5PR12MB4098.namprd12.prod.outlook.com
 (2603:10b6:a03:205::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.81.223] (165.204.159.242) by BM1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 09:22:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b16d921-6dce-4dc8-74c1-08d877353c3c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB31577E975A8093530D2715B0E01A0@BYAPR12MB3157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+Uvxs2LA/wwfuqSaDXbMGWyuwyTjIafuB41wI6tg24SskTSpAztcsCTSoXeskKb4nt/YrpScj+qnmpA5is2Pf1hQJcULI+hhE9teDusCcBkOKOBDqz72+VN3Qm62OIcp+xnLYlpcfFcxoI9bR3gBdTy40RtnLtXvGNMSTrMYMHv8gBSyHWqVw6TheNFdNoKf+SshLnPkj+6Q4/zgKmmM0d4zZW1zNvuV+sA+NNFdnO7WhX2LJm7DQqRwYfSmaX1OFFRD45B5eTjQ7qx9xdgXZIIi3YkFPWjYm1YUreex+CRdkaazZLOqRSposhOsFYb/8dE+OyFfXmo28zJ3FQM439pHHyVwptcOyRyGhix/qVzbbqi+6NuW5RbUET0Zr1G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4098.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(6636002)(8676002)(53546011)(52116002)(8936002)(6666004)(31686004)(16576012)(316002)(110136005)(83380400001)(26005)(31696002)(2616005)(956004)(186003)(5660300002)(2906002)(66476007)(6486002)(4326008)(478600001)(36756003)(66946007)(66556008)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: aTJ35WTLbYlLkgsOpYRvk/kJsnl3gBXLprHWJ0+BA1BjJoPtZNAIb1oYjOACTwyJ6W9eRkiQ5SuHKwwtdYUTmmarQVriBIpvemnKUB59z0jmE4Yqfs3YBD4QM3Ua1Ht3IbpXv1UkO50CV+hijznk4jZ6aJwvREzJMoT5Ydgaj7y5oNP4g+WAl4Up+a9vntgRqLYOzUNVusBy+pxE7ep+V3CCUKHgLQ6ByVw0tSX0AnsslS/2DqFSdN8qkKXHLgm82wEjI7Wegrw13DxR6a6RAdVf7K4uf2X0ammJ9SpstaBBykXaff5c4jTfbdKX+59sHuXSiZPJ4Oze+Q0/Pegz+kA2b9HTaYqJdhHoVWcxtKvw1XIXDpeToK9iTyQNmwg4WutcN0y9wufy7794PHcyfIeBjLbckEuArD5kmNQv/HSVw0MTxXONvVf9kNyMgzUw6X/tejJV8DdaAuF0tS7XaB6XGVPgsLBKPGf8ueDQWgvatc7VrXy34xjxamltBDW4MUjmRnNagEogHLxZMO+R2VRMvc6OZYfqFq6yc4jCGKdGWqFQUIBPwxKy2VhA7Bmdr7+u4M+o0AHXbTUjWic3eYkoIROLQcfR3tQ+jqLiiw3AUpGCD6RS44ttaEeoeSMulbblSqr9JE5ZzgLs+0Ou2Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b16d921-6dce-4dc8-74c1-08d877353c3c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4098.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 09:23:00.4021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZAuWS08V14g4/A0fIQ6GVgmM/+kbn2I/VI1YBGq4pESGfGXLSyPjzQ+tPGsrVMz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3157
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

On 10/23/2020 2:35 PM, Jiri Kosina wrote:
> [CAUTION: External Email]
>
> On Fri, 23 Oct 2020, Sandeep Singh wrote:
>
>> From: Sandeep Singh <sandeep.singh@amd.com>
>>
>> Add fix for incorrect sensor index and minor code clean-up.
>>
>> Reported-by: Mandoli <lipheng@hanmail.net>
> CCing Richard Neumann, I believe he reported exactly the same issue too,
> and thus should be added as Reported-by: too. Agreed?

Mandoli is the user who reported this issue, since he replied in another 
mail thread.

I believe Richard also pointing to same user (Mandoli) in his last 
conversion.

Thanks

>
> Thanks.
>
>> Signed-off-by: Sandeep Singh <sandeep.singh@amd.com>
>> Fixes: SFH: PCIe driver to add support of AMD sensor fusion hub (4f567b9f8141)
>> ---
>> This patch can be applied on = for-5.11/amd-sfh-hid
>>
>>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c             |  6 +++---
>>   .../amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h  | 14 --------------
>>   2 files changed, 3 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> index 9c5eb442e1a6..a51c7b76283b 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> @@ -20,9 +20,9 @@
>>   #define DRIVER_NAME  "pcie_mp2_amd"
>>   #define DRIVER_DESC  "AMD(R) PCIe MP2 Communication Driver"
>>
>> -#define ACEL_EN              BIT(1)
>> -#define GYRO_EN              BIT(2)
>> -#define MAGNO_EN     BIT(3)
>> +#define ACEL_EN              BIT(0)
>> +#define GYRO_EN              BIT(1)
>> +#define MAGNO_EN             BIT(2)
>>   #define ALS_EN               BIT(19)
>>
>>   void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
>> diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
>> index ac9a01cc1454..095c471d8fd6 100644
>> --- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
>> +++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
>> @@ -16,11 +16,6 @@ enum desc_type {
>>        feature_size,
>>   };
>>
>> -struct _hid_report_descriptor {
>> -     u8 bDescriptorType;
>> -     u8 wDescriptorLength;
>> -};
>> -
>>   struct common_feature_property {
>>        /* common properties */
>>        u8 report_id;
>> @@ -38,15 +33,6 @@ struct common_input_property {
>>        u8 event_type;
>>   } __packed;
>>
>> -struct _hid_device_descriptor {
>> -     u8 bLength;
>> -     u8 bDescriptorType;
>> -     u8 bcdHID[2];
>> -     u8 bCountryCode;
>> -     u8 bNumDescriptors;
>> -     struct _hid_report_descriptor *reports;
>> -};
>> -
>>   struct accel3_feature_report {
>>        struct common_feature_property common_property;
>>        /* properties specific to this sensor */
>> --
>> 2.25.1
>>
> --
> Jiri Kosina
> SUSE Labs
>
