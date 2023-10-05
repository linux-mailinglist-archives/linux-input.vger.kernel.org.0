Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80E2C7BAF6B
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 01:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjJEXzF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Oct 2023 19:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjJEXzD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Oct 2023 19:55:03 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634C8D6
        for <linux-input@vger.kernel.org>; Thu,  5 Oct 2023 16:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS/ovQgoDDBPvcCxj96vT6rgMwZkuSkRXdOM51zgkkQfLsJ9whmOD0gxJ1zGFNG702ihXrFcR/3itoHgGxi1Jb4MI5GeIfdGJTv54b4J3Y3jhcigmDBjQLhLkkMLIan6oxm3Vxzhe8s5cTU6lCtqh+lU5BwsD56amrmmeVBVVyODNiS/xo8Ya9BxICjPauwgTmzbn41Dj0zChlmTgCqyldXIysFJFtmVCQDNikX5PyTQuD9LpAVn/cHoQVvSmqGS8wZTg9lODkafktXCryHxwMvGb/0KJhkIPooU6tdUadRwab/6JOtrfygWYtsxw5tiJjJM1Nkx4sGmlxswxDXfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfs1UfPJFZH0mL3+o1P2eCjYERXe+Go9GAHfLl2n1kE=;
 b=Fs+VP98UlLNxxJEHtYbJOvWw99fZ0PXSE1XY1EvYVgR2tg1FocJgHLLFIPYVw+du3RPsm1SGv/R62RbtTY0qxljCdE77QtLp+k++/+c42ae19PEsSnJP0VY2hYqxs+zBJFMZEQhD0E3b4htxm1TChMIuwaU2S+KpAb/bW2cXhhsFBtaTEDfcbObLa0PwLZNYmrzvNQWHOZ625LwTe/zpazaCxbN+BLfXpWdfVTY/Pj8+fI5NHvyiEFgKv3pAAC8h70aG9IP9OGyeRdtjyNARqj6SI41a/BQsPl2ny57xYMjR2KfaUMgebfXN4dqIvjkjcRqEj4MEkHo5oIej4Snymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfs1UfPJFZH0mL3+o1P2eCjYERXe+Go9GAHfLl2n1kE=;
 b=HjDHwvSgDecgT1M1pY4lO+fwdSyK+BJv7v/qNOembLlIfCDPiupvCQDzHCUIqK38xcH6tB92Q8+pxTDL7CsRSp5/7uQFQll0j4kLw7kp3R3IG9qvSXocAfvU5tIkjU0KxUGPAISBtxMGPa8m6D1FHBCdvqLAE+GhCVKiL2XhDiKxI+pBXxV6gjwDFva64IriY41lfeVUJoYsyz/uwcXvliWYg2zKuuejRSmnsWAumCXtFAkgJK0aLt02x3trQgLTeOUYK32eTD4Oy23J6dohsk95jmk8YRWrEr0+dG70xTU7tWKItWM70VjxmgY/1Hk6qXdIr7HsBvS4ZIXfNDMZ6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN7PR12MB2740.namprd12.prod.outlook.com (2603:10b6:408:23::16)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Thu, 5 Oct
 2023 23:55:00 +0000
Received: from BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::902a:6e5:9ed7:2ffd]) by BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::902a:6e5:9ed7:2ffd%6]) with mapi id 15.20.6838.030; Thu, 5 Oct 2023
 23:54:59 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nvidia-shield: Select POWER_SUPPLY Kconfig option
References: <20230917151850.62505-1-rrameshbabu@nvidia.com>
        <nycvar.YFH.7.76.2309181656130.14216@cbobk.fhfr.pm>
        <875y478ngn.fsf@nvidia.com>
        <nycvar.YFH.7.76.2310042048280.3534@cbobk.fhfr.pm>
Date:   Thu, 05 Oct 2023 16:54:51 -0700
In-Reply-To: <nycvar.YFH.7.76.2310042048280.3534@cbobk.fhfr.pm> (Jiri Kosina's
        message of "Wed, 4 Oct 2023 20:49:07 +0200 (CEST)")
Message-ID: <87wmw062wk.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To BN7PR12MB2740.namprd12.prod.outlook.com
 (2603:10b6:408:23::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR12MB2740:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 4870b5d0-5910-46e5-54d4-08dbc5fe7c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzGYf8FljyzTI2Wbo2DKJeI0w8wXOiqKOj9j6nosGxkLiernU2ZkfNkgVMD3/1NQDrz++VQ54friHuYMxPQEcFqy+sLJ2SRbfL+3teZtAB+AO0HXuRKv4PcJhPZwTz2XJkF/Z5h7P2aZSU1ZfRJ1vGphQ/Yw78kef7bCa12tyjLY9e8+IwPOlpFDErxeAfJqVj5my0p4L5wyVTKie6vSgyOyZzQ5pTv3hVlw6O3IRZr7PgcZyr4tei904AfSrGUigKqCfJTJOnwES00+gKK6rmubvlzdeV7Pym9F/kYh/tGRCAxuDUUXn4GtiH6YHu2hK5H1PdP0kpo5V+6rCDTLMKDYe0hrvJso3l9xKytHpJGUILas9lGbpgBpdcCt+C37rULoD2WsV6v7gxtnJNpB2CtBPQKUJUGvJgaQ0f+WKER9gblWu6nUy4PIZPJmxH283f8mpxHlmDYupElNtB7gTyf/t2OhiNcoZS9dLGLSfdqGbMv0xJzQL3ajS57ub8Qwbjt597LCTayhtcI9i0ZNTvjOiW7LclgzkbhacrKZl6SeFSNjIDta7I27Kpb1IBkNKHf8FVJnAq4I29iHOKBsv9PkggSitmaNYSh9gcvRJXA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2740.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66946007)(66556008)(86362001)(5660300002)(26005)(2616005)(6512007)(2906002)(6666004)(38100700002)(6486002)(478600001)(36756003)(66476007)(8936002)(4326008)(6506007)(316002)(6916009)(41300700001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xycI5cnxJNz4gwlGnlCpMipGrHf9xckOBZDFLc9NFyAz0l/u7i9j9gwe+4en?=
 =?us-ascii?Q?XQS3LcGdZ7iE3x/SKV38ZjsfxAsMIaDWTQUiZ5IIZ21YjxwqT9OR5Nqhiu4t?=
 =?us-ascii?Q?gpD4QWfSpUHhwcaiG8zjdFdWPJObqrqbrkLiIKonXxgCv/fjq7PU/R71cOef?=
 =?us-ascii?Q?y2QiM8Y5w4Gh9X8GuNfs3+uLzpCvz6itW7o1cMDDINWuYWnmvB8o3jcdCWl2?=
 =?us-ascii?Q?Xkmt8l9dyO6xsRb/02ddAOs0/THiOZ1yYmASxgvUl4uFj5kMWZ3tDwnk38uI?=
 =?us-ascii?Q?Lil1zPmZ0fPrcQ+4wJCyzMmdB2KshVsmhNzzzAA5OuaqvxPnv2wkiC09c4oj?=
 =?us-ascii?Q?1rMl9fd8yLONLwC+mDqAKKkbMpCo/6QtPVVI3EDRuaZ4KB/KaUA4vPMRmW+j?=
 =?us-ascii?Q?96DwNwjNx4s34bDvgyhFwb1hS04M2gKoWZqgkf1dpNoZbU84CsRwtMxf+Svr?=
 =?us-ascii?Q?ML25qVFQGuASvexT/NLDoDNV2d3nPfc/R50TjCXhuQmRuC6+Vy18y34avWRq?=
 =?us-ascii?Q?pU9QYkvu5dTPHBQ9BtYOdSatkgdcmTKJvEudqAi742xFLRaJ6jsFnFlo5RCr?=
 =?us-ascii?Q?l/So8Y1O9qctA+5QqN7W33+3tfC64s9p6hL+dPxWCJe1JcgiDS4Yyegu1oC4?=
 =?us-ascii?Q?+Z4qja7ZkxBZOFU5FxEieymVCeC5A5LL12JiJ9nve/BrM3eXutM6/t3FVbLX?=
 =?us-ascii?Q?22Y/Hw2XdhcOjhqqYTlB7ZaXic1XcoyuOI1McQ+tN5OXwpJDl2/rH5LnoZd9?=
 =?us-ascii?Q?2vE9igGdXdbyU8PPBgOeuXQY4dOXntEJl6zb71hRzsMnOe4XXvXHkLB//vNK?=
 =?us-ascii?Q?eKLAvEC2iLLrCLYZgsrn18GAjCkK3hST7D+NJw4Df3DvegbDduXKAwDgYb0e?=
 =?us-ascii?Q?3UUCQo/qtfarVAQmo4ziRP0lHnhqTfvv5Bs+SeLtZ3RCRKNRi5HeIswHE2nP?=
 =?us-ascii?Q?Ovdd4zG/ch4xHXojbrTyyPkvI8kaT3QE5YZAdBlhHt2K/bLESExDmthJ2OL8?=
 =?us-ascii?Q?8cBiiEHpKZ3HwCrkGgjgiFSumD0wnuZzC7iy4dYJ2wZLnx+f1glCoudzpsS0?=
 =?us-ascii?Q?VBboCDY/HPuqQVJU99UKyvDUlUjkG/NbmJ31OJS94kOnsyrqpNPCe9P7Yl4P?=
 =?us-ascii?Q?Ob2+wal0WjV1tINxwN6SRAlVbbqho3kfPPwgKADR/VnRmfY60svW9zuWRBM8?=
 =?us-ascii?Q?tD6rBTtI+CKEL8GfOOBgkVXsut1coDDimhq+yY8GQO6IrDPEQkqhwmtCy835?=
 =?us-ascii?Q?xe9Dn7lUOFwkRlOKiuZ1RLeG2Fqf07L+6QPoq9vLJIHdSo/HAjE9cwcVnznr?=
 =?us-ascii?Q?P2tK8f5wJqzgnz/iH0T7lll2qiUEvQcRpEBiXnN/N/z9U+F3NT1kHo8U3asE?=
 =?us-ascii?Q?vSlYBBq+YDRPF3r1PAvWDFQ4L0a8feMMdQUMUr0XCI27/ki18tyA7+ysg5jb?=
 =?us-ascii?Q?hi0EgNPQaui889LDV/p8cI2rgbpFHryXUASLkEbnelFkyGJX+A3Z/zE2EnoS?=
 =?us-ascii?Q?zuIHxtmW4lRkDW2ta87n+kyDEjwscWlRRa34A56W07elv77l6Mi5yFaSc7x9?=
 =?us-ascii?Q?GhorUrrK1ruuI221Sir0DCHaC8HQy5UJR30OGNzDPt5oCBkZgHc2TMpNhHwV?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4870b5d0-5910-46e5-54d4-08dbc5fe7c15
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2740.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 23:54:59.8453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkuSb7GTwkOq/PChKrvIIJvEyzzUdGq34K1m3B32HEQ2wwCgrHN0gRBBgFUvb4a4vsIxrjVjsAwOOVSYPPYOFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 04 Oct, 2023 20:49:07 +0200 Jiri Kosina <jikos@kernel.org> wrote:
> On Mon, 18 Sep 2023, Rahul Rameshbabu wrote:
>
>> >> Battery information reported by the driver depends on the power supply 
>> >> subsystem. Select the required subsystem when the HID_NVIDIA_SHIELD 
>> >> Kconfig option is enabled.
>> >> 
>> >> Fixes: 3ab196f88237 ("HID: nvidia-shield: Add battery support for Thunderstrike")
>> >> Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
>> >> ---
>> >>  drivers/hid/Kconfig | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >> 
>> >> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>> >> index e11c1c803676..dc227f477601 100644
>> >> --- a/drivers/hid/Kconfig
>> >> +++ b/drivers/hid/Kconfig
>> >> @@ -792,6 +792,7 @@ config HID_NVIDIA_SHIELD
>> >>  	tristate "NVIDIA SHIELD devices"
>> >>  	depends on USB_HID
>> >>  	depends on BT_HIDP
>> >> +	select POWER_SUPPLY
>> >
>> > Is there a reason not to do it the standard way using 'depends on', and 
>> > not vice versa?
>> 
>> I originally used 'depends on' for POWER_SUPPLY. I took a look at
>> drivers/hid/Kconfig and saw that all modules that depended on
>> POWER_SUPPLY in the hid subsystem used 'select' instead. I figured I
>> should follow the trend.
>
> You are right.
>
> I still don't like the fact that we are forcefully selecting POWER_SUPPLY 
> like this, but that's a 6.7 material.

I agree. This bothered me as well, so I am glad you called it out. There
were some items I wanted to look at for 6.7. Do you want me to add this
to some other patches I am hoping to send out or did you want to take
care of this?

--
Thanks,

Rahul Rameshbabu
