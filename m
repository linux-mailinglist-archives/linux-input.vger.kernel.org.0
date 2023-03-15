Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E2D6BA5D4
	for <lists+linux-input@lfdr.de>; Wed, 15 Mar 2023 05:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjCOEBO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Mar 2023 00:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjCOEBM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Mar 2023 00:01:12 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6DB34324;
        Tue, 14 Mar 2023 21:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFShtwyySpirX+WZdaxnE/Fb90UCGJjhmrXLVrSTK7vEHEMg89cz0z9MLIM64D3nQZKayTbswzFccbaRfkfMwy65afBNsoOaZIER89+1p3+0D6btyr5R6OZQ3ecekyuiqxLPffPSOnMTmXodomr752a3zGUPXfAGkeYWERGfUTJTRdSvFdcs/OpB13MqQANuP3AqHZxG478UYxp8Fso0jCNXgQVA0Lj750CcvFGdJlPCgKxyS07y0EHKWIWzTGf6iOts5JtpAzYFfZ0miKDHliR1XoQLEN8B6Cs6tD2rmEQiJW1wGLgmbXw0ginv9/y8XMnXR0UQ6UDPOUGSykj0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6R2iAIrHu+HQQMUSN5/OOifMs8PL6vmkwl40S1h0hA=;
 b=KLxe0ffmKTXYjM31k/w7Eqrl/a44RH8z6Ou8CRe0SawUITJBsRCl47IWXxGlurqnwC77YRGE7bAtfEh7oen/S//5PEpew/i67Kn1DqHiFttwaF2CXylKSEsbdXcN3n59LXjTpdXEJU8QWs7OC+dRdQWC+a0mrt9JQx3hUjyyn5puQtrRz2eNFXR/TEnpdNjbt35iUvIjwzNjUImlyulaoXLCk6f5ksP/zNRLGA0c1Xjo+lS98/FohYLh+Jmw36crneU1wup8O6FS/PqG6T8EgeXRTz9QCn78ecDQLIxXnkJ5cCTtcbdtNBkA8Ovt8RRI2DODpdXkZSc4adfWNRKhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6R2iAIrHu+HQQMUSN5/OOifMs8PL6vmkwl40S1h0hA=;
 b=bhh+GyFAzjfZKQsg6YPUw2OIHoBWwxoUBCwaEYJNDJRDfeRUTHlnhXpNZ4KGZEpe6tHW38uLh9cVD1lZ9C1sl+xMaJrwJ9cTRu8XMRjoHy49DJ6sEzStwveCk2xyRN1/PZDHRnLvnDwX+u+cGzqJNSIyZK+VJ1yn+CkASNzQQc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN0PR08MB7487.namprd08.prod.outlook.com
 (2603:10b6:408:157::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 04:01:05 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4%6]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 04:01:05 +0000
Date:   Tue, 14 Mar 2023 23:00:57 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 0/4] Add support for slider gestures and OTP variants
Message-ID: <ZBFC+e/3JcYITClP@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SN4PR0501CA0123.namprd05.prod.outlook.com
 (2603:10b6:803:42::40) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN0PR08MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 9981989c-d87d-4edc-e310-08db2509e611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPjXfnfSItaiQo9YovcVKS3tV0g/dOomrwI3UCk0H/K23SKx5qbHPcST63yx/CAvx1xrTwkoY3V5pW4qMDE/8UFPqV+6FSXn5s9DHjzmSoNmTbA2MZ+TQth/urRBGNCzxCZkm4wAZ3D+YK3mNP/5GWKO+QzndeLD7xK9tQ1sdaTs4VkeZZJVnQ2AffyLyp6qD2fo9fNY5VDQ3jH4o9oavd20GX7RwcpuHt1YM1IoJei40+n/to5kueMYLFGlLIAzGceNN2xVMaL1GWbOe9m1z3CbiE/eil8B+LJOt+2ziFbbprrxpF5ncX5ifxhBDqBvqCped8q5iztDzQNn6gNFBiq/hKCChXoesfOkrUFU/z89xsDeTwYVQ3cZyZQ+sFwXaiopNWo3UHQT+GsLO/jj7qNQBM67a9YUrF1CgS4pbZ2v9RI/SlpCBB/r/qyy4nYvJbket8IAVfBkbSRqn0OB/RyvpzYnxAPaAUhOcPewjXK20U8g4G+kWzOs7zj5TAQFchU4WXNZI8ea5INS21hA7f/Dq8y0Om1jbbki1CRV9dpS8KpIu3HHKXfbR2/xaovhRTawSqFVgdSUBJRDuXAu1atHsN8Iyfhhur3juPKGcLSX9XGtEA/JLNViYQKt6xdd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39830400003)(376002)(136003)(366004)(346002)(396003)(451199018)(86362001)(8936002)(478600001)(5660300002)(2906002)(4326008)(41300700001)(66476007)(66946007)(8676002)(316002)(66556008)(33716001)(83380400001)(38100700002)(6666004)(9686003)(6506007)(107886003)(6512007)(26005)(186003)(966005)(6486002)(66899018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zmIcmvsFpcGxtU3ZhQPvmuCua4LwL1Cx/YtM0i1+Sf/lJ3YnraR+/Iylyj0s?=
 =?us-ascii?Q?i8Wc+rcTf6+3JirVKhyGj/C1YTeRNQw1CP26FPwvZoHpSAC97Pi7hsWFtInX?=
 =?us-ascii?Q?VI4J+YD8rqSty0p702RpK7B62CcM4K4sWQk0+HFLFsjINlvo3e45GtjzWRFk?=
 =?us-ascii?Q?BYWkG3t+iq9cuvpXwUjC70thqOBYYo/wcuctJJcdMRYYOiIngYPz/R6ztrI4?=
 =?us-ascii?Q?LfLwd4yUD9SkUfWdFaUEDUUTuQQLUryqzfCdEXt+qQN11qIIc0RDQwKf9Boo?=
 =?us-ascii?Q?9yiXyXCJULBhX3UDhJSgQl7z6Tf914w96nriMkDWDXl6CCTfW5q8j6RUWn4r?=
 =?us-ascii?Q?CHeRpXDW/h+kTXnTfiKW0FXiKSJLzp4Q3mEqNS92p0s92WS7xt3Kcuaf+XDD?=
 =?us-ascii?Q?S0uIVsqv7PAqWEZtQWRU7XmO6hvI5kXQ4VcxSm/TJAJncLgiJEa4dMETps0U?=
 =?us-ascii?Q?EcJhAcUesirwEkMUY5E9OyzxAyhRkOPeB83KPF1EYkq1gcYX2W+EPldaT9T9?=
 =?us-ascii?Q?wkkqK0t/s6QhvKezfxUD5subTH/sKun5RkpfXT5dp6CNy2/ThAhPiXbUGzJm?=
 =?us-ascii?Q?vmhTrLvXxoLQU2BFurDkIo7J9LV4VWa8RrXLDggWq5kup2mTnG1A9pRxqOXA?=
 =?us-ascii?Q?wTpb/6tvSVN0QM9jgg3a8djHgaEatY8i/hNVnoFF4nEulTDHUQVqznIWXIr7?=
 =?us-ascii?Q?2SlgYp06KY+sadcHQ8KAHL6Z/YcuKx08TW24Fmq8oXwSn3qhnbW0bL+y0kZm?=
 =?us-ascii?Q?xOzazb11igxMjJeKd7y7x0//MMHANeaVz7LKdyoB8uX4Q5ogMZedPmrFeI6U?=
 =?us-ascii?Q?Q2iekDZSE92Lol+2swhf0XWEWB+El0Uh+LvaD9zhHY1MOcYE+PpgZif1xwP1?=
 =?us-ascii?Q?HEyWUU6HM15X0qbMKM4zWa/ihpTY79MKJSUBJsXDmDF5GlhbBLua59y8c+/o?=
 =?us-ascii?Q?R+3nv/mSHICF3VtENIxj8wAd7s/G2QBnpsov2n/RVWlwDTvB54iP6lHAcTCs?=
 =?us-ascii?Q?nPesDrpQWal0olztdK1msbBXvw/FzcCuuY7xQN2gc4timZR8kEm7KNOd+4T8?=
 =?us-ascii?Q?emQSCUCrBuVAzMnxUCwZ9+TWf8OsP7eo3AY2P7EjS4y+r1eYsjj17qhP7opb?=
 =?us-ascii?Q?qQaRHG24eT4mNo0y/siDN339XoYz93+4JZ6RFKdNxizIh3CH6Bebjw0+xAC0?=
 =?us-ascii?Q?4UOOh56mo83Fag5I7NXWgpuX7TUKaXO+2JDOnqFqGS3nNTTkugcSmt0HRZWw?=
 =?us-ascii?Q?JZHov9Y4E0wPxE+AbBDV0oB5DlJES6lnBDk1Su/xVg84ZRMJSJ58Ks3QkZjn?=
 =?us-ascii?Q?cFV9l5KesM6KWk6QgmjR68GDz/87Ug4EH/rISirrmE/84DQ6Uqq9yl82NEPX?=
 =?us-ascii?Q?RL9hsPtY5Tg+p0Ar2jdtdKVdNfJrj0q38Zeu2TrmHdbV7ayQX6j4MDIbRKHb?=
 =?us-ascii?Q?QaSFmLBvzek91d082VFe+PaUEw3igWV/utaZ5M/qa1yl7CiQxsRNGRyNSR33?=
 =?us-ascii?Q?ELur7Peh29dVZbMJTVX/DUNWK6YjnYA8rpiDKCelc8HpCMULf8FvucqL1tnz?=
 =?us-ascii?Q?WHd1GSa0PrqOSUXwEEGjRVwdZvBS/YoL6yJb6XU7?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9981989c-d87d-4edc-e310-08db2509e611
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 04:01:04.9953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16mK1ESdAPswxFBYFdhs/r5ZL244TYVX6jsEA8UxJGu4GD8cVH68hzjAaG6PbtlZr02Nuk0bjwPd41SQ1ZBI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7487
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for some additional features offered by the
Azoteq IQS269A capacitive touch controller.

Patches 1 and 2 add support for slider gestures (e.g. tap or swipe). Gestures
are recognized by the hardware itself based on touch activity across the chan-
nels associated with the slider. This feature is useful for lightweight systems
that do not post-process absolute coordinates to determine gestures expressed
by the user.

Gestures are presented to user space as keycodes. An example use-case is an
array of multimedia keys as seen in the following demo:

https://youtu.be/k_vMRQiHLgA

Patches 3 and 4 add support for the device's available OTP variants, which
trade features or exhibit errata that require workarounds.

The original series was first introduced in [1]. Patch 5 was determined to be
non-optimal, and has since been dropped. Patch 6 has been dropped in favor of
[2] which has since been merged.

[1] https://patchwork.kernel.org/patch/11716215/
[2] https://patchwork.kernel.org/patch/13087783/

Jeff LaBundy (4):
  dt-bindings: input: iqs269a: Add bindings for slider gestures
  Input: iqs269a - add support for slider gestures
  dt-bindings: input: iqs269a: Add bindings for OTP variants
  Input: iqs269a - add support for OTP variants

 .../devicetree/bindings/input/iqs269a.yaml    |  98 +++++-
 drivers/input/misc/iqs269a.c                  | 314 ++++++++++++++++--
 2 files changed, 379 insertions(+), 33 deletions(-)

-- 
2.34.1

