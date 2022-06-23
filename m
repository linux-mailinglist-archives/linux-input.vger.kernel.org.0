Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C461557209
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbiFWErE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244271AbiFWDyE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:54:04 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E028EE07;
        Wed, 22 Jun 2022 20:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWKeSNs4aobO/3J1Ns1FvUqa/Ia1/C9XgTWRiu/hlhtFePcYJZd0uvmSf+TB21BIafn2Z2nZ+N7OTbzVhu5dfm5BVYVBIBWYWWBShXd+6E1btVlL5cnDU2F/3hezzYJsAryEY9RbPQV2iL8E4mv+yoUKlJOXkFYapE5cqf4ydjR7mjE4pw5EH4J6zUfS0DKWPDSyMmz838vvszl2mFeW2agG7XeJtyhGNBYIJ04Aw+D5trYokHGA84en6CIdxjLDmCx85wawe/6jSOIhalJjPtyQ8Hy/AKqLzOHoH6AYSWjzZk54Pocbg1KCHvsvFxhigp01iMTSIFQG45yRQzPIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T57uWwEghk5SWJu2OmvKpEz+EQz4s2moYunfZi8OYKE=;
 b=JKxb7jaEIULVvwvIaXSgIOupp5OoQbJfzGI0WiU5ef3up+oifPImxCN1jEX1NBVZbjuEvXPhb4diahEDEyjqmZU7/d8DyaGmrTsOBOKQYm/kMlk9R1rzpK1ix53De99dMho7FVki32aLtE61ENRVCOVIJxcwjCfvfNTfAUHN//icDMQ7z9cccI+7JBVLYlDDKCAuJmarNgeWAe1eBREQuTzfVi5At49gZw6XRAFdyJSVRimmxzbMeOqLYQyAG/gybsQZp4crdn6eYsNsKiNgNtJrEhax60zz2uOaRK1fqAiovQp0vroZEEK7Ul1rgzHgz7D09PZuapay+3seDirT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T57uWwEghk5SWJu2OmvKpEz+EQz4s2moYunfZi8OYKE=;
 b=bwxTvEuUHh1yQ4vBRrrOfuTS2ohqQ0ng6D22EXZ2U8Flk356JPMSklizPvRKAMEfGTB2ej3HgkCzi0qLVxZgbH0qCz3FvH2u444viQZEbHkyOXFq56+gNqCgGVxVEHCJAeEXyE3AEVI8rslpaf99uikXy9ZpnGSO4qLIxuH0KWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7766.namprd08.prod.outlook.com
 (2603:10b6:a03:3db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 03:54:02 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:54:02 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 6/7] dt-bindings: input: iqs7222: Remove support for RF filter
Date:   Wed, 22 Jun 2022 22:53:08 -0500
Message-Id: <20220623035309.39528-7-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623035309.39528-1-jeff@labundy.com>
References: <20220623035309.39528-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0001.namprd07.prod.outlook.com
 (2603:10b6:803:28::11) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7aed253-0320-43a9-537f-08da54cc02f5
X-MS-TrafficTypeDiagnostic: SJ0PR08MB7766:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR08MB77668973EF79ED4368D83961D3B59@SJ0PR08MB7766.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nduLLunHGwnbny0/NWNMc/+ST/gnTAlX2ChrezCvgib6HHgzTB7gG7ttxiJ+B60djZkFG13OEHnpyTeCgVM8vKCUR1QCb5xKsDRmo9/640aEzQEH76m5ZnXdNzeuX5NzIoc1v+oALPYCa3RNdPHJDqT1bESPWdumuiQn3lhN2MzvfmfCrGT+pP+vFI1VqZOVrbKH1WldyS0dE0aMlyFoWE9b8Hx8NG18IbCEY681B9uBlxjKf2HMoiCYc/u+7o+/o6x12id+oD44ddaJdHU9UcW6AlM0LZY8mG+ZAc3/yAHTPPU5VIO3U5RZ/Kwz0HwJqMihzZYdUUPZp9awUcmezPthBy6qXYkqL4rGRlXuWiiztW6KHZFdUQWiex3A8ow+bEFvobs8BYwzo5hZSV1Dgwd7wAYfXAuTKnX1IG2RR8nFxas/+x6AecxMET28T9gH90tL99EWrTjMLsABd4BA3IZK0ljhE1qjETz1OZov4Ih7CnexghUp/AGilIRe4YavsdAtV+bsJTx9XD6xsyiG8ofLguneHm5dyJmPYMppTSo+TMUWTr6fshMLNlLLBNBuQH9R3FWR+xAih3W2pD/BQhpnSfea5hRQrPRcPKULw3A0Ib5RsSkGf9QTvN47P8K07bcM9oB907MnTso5ymYx26wSbNIFCE0WnBBp1IeYBGS6VRsSZml6pi9jHE6EqwWnfD0E6wAffmTj/ZUkUv+q/+ntKcALMRxviL1tSbAo004mNCmF7lRQQA4yd1caSrq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39830400003)(376002)(52116002)(26005)(6506007)(107886003)(38350700002)(36756003)(186003)(5660300002)(2906002)(1076003)(83380400001)(41300700001)(38100700002)(66946007)(2616005)(6512007)(86362001)(4326008)(8676002)(66556008)(8936002)(4744005)(316002)(66476007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXLOGF4RdoUQ9y7w2RbNagSrupRQnVyML9VDsDQZcqt0JgA89AL1de+FXlUZ?=
 =?us-ascii?Q?8MhPebMU3P8XHRpRHqeV8cpn02d2rZ7imp6XFceOSVJ51Cw0jMy7xU4x7Gjj?=
 =?us-ascii?Q?sAdMqdouCyznSE8Tbmq/smtY7fbjlH1Er9dyHKisoBImJuFG4otaJfSZ4OOi?=
 =?us-ascii?Q?W8Ks50LHrYfF+BrVT83HeYcVwISCq6Jb/Nt12Lpp3nJFLv0B/mzrmXG3j3jI?=
 =?us-ascii?Q?cNOfGGvlGi/wMNJWVfR+vuY4HPdK7UBnZpJuTOIQEND4lH72bxJXShmJbDB4?=
 =?us-ascii?Q?Bm7lK2fzRaNguHb+qNzt7VJpxiJHcwMTUs/JkoPwJDTO2oYjlL0DLxhVzrxL?=
 =?us-ascii?Q?HuiChS0+fNQ48XMaAgl/leiZRHbXoCSD22urHBZwsYngg9nmp2HqBXTaPtkh?=
 =?us-ascii?Q?X9SjLwZ9YsHjXFl6Xc86CI2XuGF5CXm/0S6QBl2BQ+GUvl6mmZtXr/EzcH7B?=
 =?us-ascii?Q?lNYxnU5j8wqaTO4gobY/rSgUVnM74YWQ9lQkiJhlG5q+KyEKgHyVV4FHmjhA?=
 =?us-ascii?Q?9Xi45JXbSaf43Hm05xq7vVBKDZVBcuTZXrobfekQS5eoPNefBXj85UK03Xdy?=
 =?us-ascii?Q?MgKJd+91PBcZnHM4ETs3ZraUImoooEXe1kpiRaFm7bc5BMnYoPm2Kqj9KYKC?=
 =?us-ascii?Q?xgdz5CSLpxKhTdnvifRkQPYyDoQBrl8DWEcChg2SKRgTmOAWc5j1n8NLxsfj?=
 =?us-ascii?Q?ThseoRMpOVGo4GdtSddfrD3FX466cmJnGlLVgPqGr5NzuKYziKKE1USWDVaT?=
 =?us-ascii?Q?7Zeg2g39j4NMzFZ93T/qHD6oZWXguAqrtIu/K9+xWGsnhXFxGIwQkUEfs5gj?=
 =?us-ascii?Q?PI/wEA+mt0JW7UDHgPuElBfPLU7njmiOpI9JOG97Ya/eCZGEDAPtTqJvtLNQ?=
 =?us-ascii?Q?1agrnsLVCZE07oRiRzTMhRmgDaic5faoKvr5fXmn9byb10q1UpKVIliT77dT?=
 =?us-ascii?Q?zcyehXhjNSMwNXU9pZgiHnydyubvz038o4Gesr19eUKSZ1FYA+yuFIK7PExI?=
 =?us-ascii?Q?p70sENIDyIDGe/rqc1jcSlUeZHgMEYSOHbLPmDTdLpdnJk2Ifs0/VYTuiNmB?=
 =?us-ascii?Q?st/DO1lGQvXKNn/JpNdJDMF8bGYNYKiLVbbCMBphAKwrALVPjo0xDl/ykqjy?=
 =?us-ascii?Q?Y9a18dzaQ4Y/Ac9Mp39FmkJyCjHSAWuPxgOceUc+0NG9lLwMXCXd5/5Bxf8w?=
 =?us-ascii?Q?qLHBlUpgMzeNbf7We+34SwObrOhbO1IYru6kEcnT3p9NO/R4sW6ZFKQ4QZhs?=
 =?us-ascii?Q?DXf2UTy0AMStcnWdewZC2hEGmFtAqV57tpUTJFqZKqfhmoKQSf7xfnmY3iZ6?=
 =?us-ascii?Q?rzZQtUDcpgPSnSPg8PBtuo5ZfB1PQz71qRA5wAOf46ROV8cyz+dTMmo99zdw?=
 =?us-ascii?Q?o8NvGI1LzcnhRm0VFUyZtOrRYKrCO/NSMjKLnxH13tpYcKFlgrdIXIF2wDab?=
 =?us-ascii?Q?1lodMrsbKnv2Piow7T4YdwpzRlSovNn3iy65lNOMGLhl4tDMkMfP19Ga41nj?=
 =?us-ascii?Q?gGEU4PyIChC6iHwz/qfFzm4n7rp965EStU5Rda00GmR6cPSMyKn7vbUN5Eb3?=
 =?us-ascii?Q?iZQjh6RJ89ae6YIK5t2TF/FZ1fAxZEks8uISaY7eSnreRIDNuN6W33HSSriw?=
 =?us-ascii?Q?ue3XyjL+AEy1iI4plRxA/eybjMykNIfSnKnBbu6D9d+HA2uwGNZ1B1u7pbfg?=
 =?us-ascii?Q?J1QNUJtMecneNpIiMnUTZi3h4qHne0Xtp0IhJGFwCjeb3PeBpJpXIo4VZDmU?=
 =?us-ascii?Q?fxGc6+FJ2Q=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7aed253-0320-43a9-537f-08da54cc02f5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:54:02.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv/BrnQfTXlP5xsu3oPobxUnOAsLW16tOC56K9pyQF8QCNS9JzPlQxzIGd6EzkgJiQys273xx0PEAWXnUH8sHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7766
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The vendor has redacted the RF filter enable control; remove it from
the binding.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index a3a1e5a65306..6180f7ee2284 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -37,10 +37,6 @@ properties:
       device is temporarily held in hardware reset prior to initialization if
       this property is present.
 
-  azoteq,rf-filt-enable:
-    type: boolean
-    description: Enables the device's internal RF filter.
-
   azoteq,max-counts:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2, 3]
-- 
2.25.1

