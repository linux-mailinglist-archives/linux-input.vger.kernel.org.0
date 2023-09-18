Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F417A4F25
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 18:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjIRQe5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 12:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjIRQep (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 12:34:45 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1484206
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 09:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGn6JInwC3gfn86PO2UWAUdfrf5N1se97qZ3+JNmi61Dchus0XhXrvdpe/gWkcPi8zVOjvdcm6wzlfZIL9p8dLhzSwa4cXXwqaVHiv/kweIigDXHQgCFkwLZSOAkNx3nOEJN6VgmMrX7NlGhE3BhFoOGTnEOTkzPmTQJ9f1DHsu9Ag/h1Hm3wEAVKP4Rfxj5dSWEIxI1Uzz7PeCN76XzCcUizd6Z7BBFv1OROsMDYw6Nn56Ja+AfHoH95CTv4bXoWiLHEspNFr6/KhSw8dMg3yJcY1O69vKUwba3Ut1VKmuWX+w5QtkaY5GsF6+PicczoQYgRSAAVBawylGtfSsenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMz1yqiZeD3TOB5fZClWD70dF6JIJDeP6/zlKA8FCJs=;
 b=JN7f4Z/JldTBwHi4arRMmQP1ulS+Ngcvxjh5aiKlf3UBhCeQIYkbgdXY+A1YCHv45sjVznT7dVaMNmish2TrC0Yt/aO/SnI4dQrP5KGui1rnEncb1AiRv2ONFdXjshm1rcbL4mMOfbnb21VCpALAhjUQ2YqMViVOUPxxEzCognqagz4D4MjupS1NXd/bFt4HTmKdfk3LbuJK2IrxxszYDAluA5kdBz/GH+V/2nl93rJzTmcBHOrVs46/QngovYDRdS5YtO8jJAxsKJeEoj9lgdVrTuEA8XM0NXI5B8/A4WFwTm7xGe6VnhhwuLisWrF25TnOoAxC8h/VR802SAlvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMz1yqiZeD3TOB5fZClWD70dF6JIJDeP6/zlKA8FCJs=;
 b=cyppB5eAf+pN13mAUPoEOVyICdrf5++rL8mSdwjK3OB67uru7JEVL58XQ/INJ/9HZAfPAvuMDtP42v3ASTFFRTjoj87fPBVx/fv7gqIcvzTTQgT9Pp31VNkgTNYvKsn/XmTP4cjeEjOGo5Lyf98OsrouQMt90pCO7Hz7kNjzXVCCpSNjKsiOA05Jl2bdw8ETQtxtiJi3QJO46+tlJU/p21groeKF4Cx2Tw0HGbbqYd7H7TOsEc5fV6uX4Hed1WJ0lhGf4EAKqKMrjUWVpzHMbROT3bCJWZgI4Toh7wptNp1Na9ZqCDCKIXTqlzhGNxvij7hTZRXv3T+0jSuN6Js1Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by SJ0PR12MB5610.namprd12.prod.outlook.com (2603:10b6:a03:423::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 16:18:11 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::5cc1:1ea3:4ec5:72af]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::5cc1:1ea3:4ec5:72af%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 16:18:11 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nvidia-shield: Select POWER_SUPPLY Kconfig option
References: <20230917151850.62505-1-rrameshbabu@nvidia.com>
        <nycvar.YFH.7.76.2309181656130.14216@cbobk.fhfr.pm>
Date:   Mon, 18 Sep 2023 09:18:00 -0700
In-Reply-To: <nycvar.YFH.7.76.2309181656130.14216@cbobk.fhfr.pm> (Jiri
        Kosina's message of "Mon, 18 Sep 2023 16:56:49 +0200 (CEST)")
Message-ID: <875y478ngn.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|SJ0PR12MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: dc70320d-d3ad-4862-e78c-08dbb862da90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +XmEEfFCPYzvZx0PZgs1wXT7v40USMKGNeMq39hBNDfZdZAMKfKlWXjyYwLhyan+TyRkm0nsjAIIXox2xDEgdrxod+DYrXQrXAkhTFoy4K4g6uNFT2EBTykz0oR/QnWAnKEamj0sRhDiGuTF4ZAnwz6o2V9oA0VARpnu2onzKUKxuDatU0CeKphxFUAnLJPQ+o7ljQ/yj8Z2nf9M8XLXc+/Pe4noGPZWEKxEk0plDez/PfqahrvUvkf+YXta/TYDHNlpoUPPoEWEe/J1wMeaEjUOTuwPYIMqUsGiJZmNrKIBsx8CtivRIx7hHEXh7cBBSUIDxmkz4iUSHeYEjn/dq4HrgvWYak3XkdxkEtKgCacbINw3KR95va4fnjy+j21XcVmHu0ZLAzoDOdmG8AD+CTxvTRYiyhk5cTd25lMji8ueWlq1rmI2q8tAdYhe2hi18oN9HPpvzkduy0dPK34QGkwsO+jjNThWWN1kgiF0LHLrotbe2JzOVaxxq31FiP3gILm1/1LmV4HcS6iMN6OaMMBBi64CjXiMzn+9lz/s9Yh8V9yafJSENvvWiXm6nzdb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(1800799009)(451199024)(186009)(4326008)(8936002)(8676002)(6916009)(26005)(316002)(38100700002)(5660300002)(2906002)(478600001)(41300700001)(6512007)(6666004)(6506007)(36756003)(6486002)(66946007)(2616005)(66476007)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oAMPBeqpzY78CH718IpHL9u0QEEOW+ssCh34lsRcrap7Oene1B/OxahmGzQv?=
 =?us-ascii?Q?Lj+WFbSOMR26RBzqfTbyagk+NRJj1UhGlsJM94Z4gnwppz5vQW35BU3/CKWe?=
 =?us-ascii?Q?feof8iZu0pwbzMLiAslaHGF4EJBikX1MlRwlwnlirFe5lMCyURvyW+d8eb5d?=
 =?us-ascii?Q?EYHDbAQNoQBD8hONqLBAIV7GB6Y9KFhnmT6eIGHDj3nz/btiB6GKt2jCHD9t?=
 =?us-ascii?Q?UHr+BwalLYp4T8M0R6ENXFjmjDM3j+QBBKoGWjeQVSkY7U6QEWcHUu9Wm2LX?=
 =?us-ascii?Q?FFR6/2WxEu/W9NQdP1jl+Ho6EWXYIvlfHpZq0J8mKHLIWcv4b7m5DaQSqgMJ?=
 =?us-ascii?Q?TdMfjeD3vU3ROb6lRak7cctRyB1+v103oH9nQFUfyrP+ZKm95MTNX6yhOPEU?=
 =?us-ascii?Q?G40SAGuKRoM36VeReZZq1GhBqKGeuQQeIHL+uTnTFvzMG38mYrMQRnJ86Hdq?=
 =?us-ascii?Q?I7CWMow7ySzTc85cs3ljKEwQ3IQV9ZSvMKU1zfPMLmZywrUchGoMgQiW9xNu?=
 =?us-ascii?Q?+VoM4JeG1z7rFLBjLnnyI3T/mp1F5OyW/vSq5I1JwM1FHt7eR6ixv9kzbqpa?=
 =?us-ascii?Q?0Sp3bBrCrnbeuGpKWxqJ1USU4kNberakwtQV+g2KFC1u9IdNWDH704zPFpVF?=
 =?us-ascii?Q?yge++zXFeEEc9Rrs7ig6Js+tzLexlu7Sie+SzmKGyYiduPLTSsIp9SC+cfW9?=
 =?us-ascii?Q?NXHenNQk1JR6x/F5xEHHa00P3GHjZNlsQvx/zFX2E5nfERSbHTVRtHymLro3?=
 =?us-ascii?Q?xsUDhFDRPhdUX9QfroiykOjhV3TSlKJUDF+t7fUYQLrtOxm6Em7On+CISIpx?=
 =?us-ascii?Q?hF/tWG5cTanj1RIEXpEsl3islTPBdmmCJsTOL5Jv5jocUw4s9SAmOCm1iGEV?=
 =?us-ascii?Q?4UMJqK+lK9l+nV/lY7GvZaRzDciSAXmBxJ5bfQqy4zTfNgJQRHPlOsqp7A2m?=
 =?us-ascii?Q?mVxarzaH9sYaVhJzPz3wknlgPTUt9NEV0Hj+9ylwItRt4DcfHjZrASy07q85?=
 =?us-ascii?Q?5S00B4sBAXIL7zYQyFlTwDL0zIN+nuVUAOZ14utQzajwYPhObA4G9lZusFHh?=
 =?us-ascii?Q?2RrKnlxsVuNaAJmj4c/5Wwp7NAY9GyFy8jrYpPecHFVK0QBHYeZ8TlUWsFc3?=
 =?us-ascii?Q?G0XPla4Z4UDtGrBCansW0bvnipAxLZgoy3uKvZ7G6dgEVggj3gJcGCITzP7n?=
 =?us-ascii?Q?ZQEKTyGy8WkBXeaw43l2RBQJORX8ZZ+WhloIdD6M95DfpjTjWTcG7XLNYeJJ?=
 =?us-ascii?Q?1G/h+s+S2DWDiYaeuYTjjE+9kYaww2kANOHzFhlmBM2Sxg88hliuOKTvJ0ss?=
 =?us-ascii?Q?7Prl8Br9Q0aJvdGiOwcrCUK6TrGjbDIKGcSBC0exNmxSdm12nlnI2/Zohn4R?=
 =?us-ascii?Q?NKEajTm8zpThBqN4BIGON4IhoU/dy2uh8hJ5fWtEobUvEZBUw+QP4dICNlKH?=
 =?us-ascii?Q?3cboO9TgXE8IM8kvE5Lr8NtGOKRNysy+s9zHayuqc/AX8eS5fyPrEt+lxSSK?=
 =?us-ascii?Q?eOHsKqCM3ZyTdk4tmk8WfFUFJcGw5VZIc/x+m/UoRmwIM8wBFn6v+ZfSMa5O?=
 =?us-ascii?Q?suVRwi2zFMY3jmHwCueEvVFxK0+vfzTwi06mCkW6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc70320d-d3ad-4862-e78c-08dbb862da90
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 16:18:11.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGq0+URjg458U00HATA+XWldv6sVD3VTrk8hsdnld30UhYWXcYGVk/SULXBb4hEgXGAMT8Lx/p9lhgY4pSBjgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5610
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 18 Sep, 2023 16:56:49 +0200 Jiri Kosina <jikos@kernel.org> wrote:
> On Sun, 17 Sep 2023, Rahul Rameshbabu wrote:
>
>> Battery information reported by the driver depends on the power supply 
>> subsystem. Select the required subsystem when the HID_NVIDIA_SHIELD 
>> Kconfig option is enabled.
>> 
>> Fixes: 3ab196f88237 ("HID: nvidia-shield: Add battery support for Thunderstrike")
>> Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
>> ---
>>  drivers/hid/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>> index e11c1c803676..dc227f477601 100644
>> --- a/drivers/hid/Kconfig
>> +++ b/drivers/hid/Kconfig
>> @@ -792,6 +792,7 @@ config HID_NVIDIA_SHIELD
>>  	tristate "NVIDIA SHIELD devices"
>>  	depends on USB_HID
>>  	depends on BT_HIDP
>> +	select POWER_SUPPLY
>
> Is there a reason not to do it the standard way using 'depends on', and 
> not vice versa?

I originally used 'depends on' for POWER_SUPPLY. I took a look at
drivers/hid/Kconfig and saw that all modules that depended on
POWER_SUPPLY in the hid subsystem used 'select' instead. I figured I
should follow the trend.

--
Thanks,

Rahul Rameshbabu
