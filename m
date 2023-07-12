Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD1A75129E
	for <lists+linux-input@lfdr.de>; Wed, 12 Jul 2023 23:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjGLV1L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jul 2023 17:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjGLV1K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jul 2023 17:27:10 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4C31BF6;
        Wed, 12 Jul 2023 14:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvLhJfQ2h9YlRWrTOsJ7NNkaqB9hUnjkik42GaHL0XdelZYjeMHzA5mrBrEO+Mky7/z4ldECJANzNKCQrSq//Dj/dutJ+B4YC9URjo1XeGRyNoNnl2SGhquUdlJR3QWUuw1LPL6YJ1O6ESyGuAHXL9Qa/d3YmEQ7sNi/JNwwlNP6GaiWQ5QWEzWUy++9rh4j3NF0rFj7lY5zNE3/2+I03+0bRHU4FR9ZKvHk37bPMA0oUNX2ki1U2PetvUYKVA3VUp02iFo2Z369TS2TmTTXc5u9T+RBvqz4ugIGQb58g+jNhCPBQ2NVEJ7QUEL7Cmhf4ITV/SMbF/HVyWfdPfF/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR7ZWYWPbrRqtgQjIzxI3g1hJ/eYV3xBqFtNZUsDfbw=;
 b=A/WB+kJhsWCcVuSG19KWXC9YAY25uzaFxG4SBOSAUeSj0nGAdAannb5oWvYzVtvNHyxsDuofTCCR66AYxlhue15LSTgyn1m3W9NxknrGsnCW8c8FzLyiQt3ONN+BJkLUKPuuyBsfYy5t1FHuy5XRP/jaGqqD9v3WFh1V+u0cUfQxaMl2mJ4ZRwXz+wF0vqyJS/6FtB51RC/0FHpVoGThaUg/dGgRe6BaK1gf+TKhvMm7mXLgyvTmsf1mB0uuEur3LS/9LngYtEutvKSNf1nhyVRug4aiPMh86m3bszw1mPJK68h8LuPQ6FDdZDDtl0zY9zlbRGgtlh3l7eEcicTtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR7ZWYWPbrRqtgQjIzxI3g1hJ/eYV3xBqFtNZUsDfbw=;
 b=Hh/wkRVVekEBcxtu5+48vDkeSqqZRQ1XIjeaVIV+kw0LEh2OGLDnoOXhtGbitLeI7LcmFQO13izT8nCaafuo9SqDLZH+YZNuSBlfr6d90j6AT7ODwxc62rS/w0v9X/fSlnI/4TXB4TpBTDUilSpLtuseh3aJh+RoFwr0vSdBFhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7702.namprd08.prod.outlook.com
 (2603:10b6:a03:3d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 21:27:03 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 21:27:02 +0000
Date:   Wed, 12 Jul 2023 16:26:58 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add support for Azoteq IQS7210A/7211A/E
Message-ID: <ZK8aoiVOoZgWSCDc@nixie71>
References: <ZHVD/9OgRTAwBhqx@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHVD/9OgRTAwBhqx@nixie71>
X-ClientProxiedBy: DM6PR10CA0032.namprd10.prod.outlook.com
 (2603:10b6:5:60::45) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SJ0PR08MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: d163e526-44e6-4f6a-c6a4-08db831ebb77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Z1JlDXJgeD1tVfB2mXcdBcPitOQUtbUwZ8JLGziwVdyUvtNjRT5kjAdZJYCeBOjHRkcbRvlZ+M9W6YcXFG8nU4ea4AaWchKUT201yO3+zVj1PCM7tg36HZEdYKTFzqtoRDKdm7BN/UaAZEdsY0+teloUUoANjfaGh3gCvekDAIf2nehxAXsMWbTeZ5nScg7mhQWyQ+xjZODipHx7ZDUe3AM5GTeNzi6UeGwOOX+Dz17oJa0oxnCTvI4Dx+dgqe+nzt3zwIKBQJWz9ODXHHQM744MGjvhmSxIMteSdzfNjX3d0eWFxdb4ksTSZJpvnEpDAqaGyMULpgUisqYAtHc7d9Z9hyUcZsE0Q7VsrdvsUzPkNzYcMcG0T/xbAtmcGcOz7FO+6/M/qf4V8/kBy0VFsMw/IXPZsaAikDvQsJcYZh4OFvOzqdcAAq5HISWAksI9+d+UcCiD5uag/m0H+LxCEzxcTKuiH7vPPAIgtExmtBMcsF2aqHQxI8MdgH9KvmHIaFd2FsrXc0pAb/zZgSitt7K+jbXRb4XE85Oh4tl/AY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(39830400003)(366004)(396003)(136003)(346002)(451199021)(86362001)(8676002)(8936002)(186003)(2906002)(5660300002)(9686003)(26005)(6506007)(33716001)(38100700002)(6666004)(66946007)(66556008)(6486002)(4326008)(66476007)(478600001)(41300700001)(316002)(966005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uO/DP6WmZ/zNY9j4pU2LUw5WnTVJhYD8H1rvQyF+8fOrc/dfsDaRLf1+mnYS?=
 =?us-ascii?Q?vgFZYazr0cN7enhKiMX0MrhWklKnb+87NGeaBSAHP3Ewg7NEiTNZoDyp5RlM?=
 =?us-ascii?Q?Q6zkVNS9rHCT/5LZgv3S3vqimnvAPJAqemue+3PSfE8Z2L/ow05+EvaM8yJ6?=
 =?us-ascii?Q?8/riCyIjZvcTIjAgpac6CYRgWuq54xD+N+juQiGvvkp1HqNQkIC1GjLfBnA0?=
 =?us-ascii?Q?iPHGIHLRA6wKO0C18PJMCKMUQvK6u//RRfWvptuZ/94K65kV7mKxmLZvvwcV?=
 =?us-ascii?Q?JtKiRZL4Beu7WEgBcn7wMrdB4MLN839TKYt+gJtvUnCYQmscbuk10U3E6XlO?=
 =?us-ascii?Q?JYEVR25iAf9E/08Ybz5sOzQRasm4ypJ+xuQZg8cvSh2cAtfazuob8ClHAlRS?=
 =?us-ascii?Q?pdIuLcduD0qfnkrlYZqXI0hmO+kzTKVNHu19TlMWwWv2RgPjVPfeTNxgtIpH?=
 =?us-ascii?Q?pzcqAFwqovAREAVHcFUP5ddrXKJvGlldOPUnOFNFeQgbirUpGXI4Ky11xTet?=
 =?us-ascii?Q?JBIRIQ6vDhbwJkK5JTrOuIHeUL/gOvh88BcsOOdTdnkDzhbPYzu+M/JjGXER?=
 =?us-ascii?Q?Q4kCMhhItQ6fv08S/RnMH+cAmhg1wMrrUYO8y6oRv+/qde1yhyJfw8P+OamR?=
 =?us-ascii?Q?l9qpl9TY4ywovfNOPGNDf3SX7DHnt4YQatl6BoS6CNIsVs+X0b8jKefsE17x?=
 =?us-ascii?Q?Gq2ocFOpsmbpeG+TtoBjG5ypj7VASMtSUIUQC5RfgrnOC/a1f/LbDcFmFDh8?=
 =?us-ascii?Q?I5g8AuxubBHAhxPKd9Uu1j21ewfBA6mUm5sER+FGDoTAaj2ILo3KR6H6eyQQ?=
 =?us-ascii?Q?xxD57kcQFyUi0hBFjxQNaLwmUuOLzs+iWx0UsIff1m57wT4Q2z1n0O7/X6jO?=
 =?us-ascii?Q?xa4SkHPR6AzuGzECgj7KouQzZAV7EdovGzJK/+N+G9Kk7dx/9aR1mT5iUKR5?=
 =?us-ascii?Q?fzgPW+CQvfc/OvBSIdN0eFlAfLMVZ2jwwgOhIEVwnY1OEdgzAcmDrbpo11z8?=
 =?us-ascii?Q?ALSkUddFYTW3XPF8Ae4qGlszznKIQkGAjASqHCjr8f7LvxbX2LMLB/qPhsJN?=
 =?us-ascii?Q?hyRA4grlWGF44ePs61VcZIaW7Ta4Z39pGenxmLb6trCO4RXmvaxOY2umrtv8?=
 =?us-ascii?Q?/AQwyIrJ14ORujgVPjwDge8eJ/RZ8KWU7Mzd3PZA10Yl4d8Yw2YI7LtoptIx?=
 =?us-ascii?Q?Z3xSnYqtXdYHXEfn/Pk+rcMItbEN78N/xKHNl+RF5b318nUbmaJY0VsYVzXb?=
 =?us-ascii?Q?9QBY46ALUEqgCQZDiwCeu5j0A2227IoyWeW94CwJuUx47rx65caKyvi/MI6y?=
 =?us-ascii?Q?PBOb6u/ScsPg8i6hw/Kn1bvv4AwJoLZRVt1z5u5c/3gSZEky50cxRptETSlR?=
 =?us-ascii?Q?RtooYMC3+SPFGuWM6mlMIX8ovVy6+xMHsWHhrhRtHqfnQxeki+UCDrgi56Fy?=
 =?us-ascii?Q?Y0X1j23MBy8D5BM1XEtFBiYgukqF+eQEscTLoBYqeSbMYSCqrrVyl5k+Obyf?=
 =?us-ascii?Q?qLtraxmKSouCNdkcIJxFQW0OA5CDSKnhYQUFouiLoTpmWkZARZmEtM7mhIz1?=
 =?us-ascii?Q?Cx1SVlTzFg0pdXC63TLPCIWcEHfMDrHr4s9KeGap?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d163e526-44e6-4f6a-c6a4-08db831ebb77
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 21:27:02.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye6zSxKNpLYXQVUkktT5xhuMyetNzxfx9yZrNOwOsVb4WtjMmGgPpFi/jn756PoBWJ3+RELZbOsUxgSszr/QBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7702
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, May 29, 2023 at 07:31:59PM -0500, Jeff LaBundy wrote:
> This series introduces support for the Azoteq IQS7210A, IQS7211A and
> IQS7211E trackpad/touchscreen controllers. Optimized for wearable
> applications, these devices track up to two contacts and are capable
> of reporting an array of gestures.
> 
> The IQS7210A includes an additional channel to support an inductive
> or capacitive button, while the IQS7211E adds an advanced assortment
> of gestures. All three devices are demonstrated in [1].
> 
> These devices can be configured during production using OTP memory,
> or over I2C using the device tree. For the latter case, the binding
> covers all major parameters called out by the vendor in [2].
> 
> [1] https://youtu.be/RjB8rNkzQJQ
> [2] https://www.azoteq.com/images/stories/pdf/azd123_iqs721xy_trackpad_userguide.pdf
> 
> Jeff LaBundy (2):
>   dt-bindings: input: Add bindings for Azoteq IQS7210A/7211A/E
>   Input: add support for Azoteq IQS7210A/7211A/E
> 
>  .../input/touchscreen/azoteq,iqs7211.yaml     |  769 +++++
>  drivers/input/touchscreen/Kconfig             |   10 +
>  drivers/input/touchscreen/Makefile            |    1 +
>  drivers/input/touchscreen/iqs7211.c           | 2569 +++++++++++++++++
>  4 files changed, 3349 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
>  create mode 100644 drivers/input/touchscreen/iqs7211.c
> 
> -- 
> 2.34.1
> 

Just bumping this one; any interest in taking it?

Kind regards,
Jeff LaBundy

