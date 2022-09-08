Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9185B1E65
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbiIHNRK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbiIHNRG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:06 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9711652FD4;
        Thu,  8 Sep 2022 06:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHwl+4E/o5WY2MckqpnmpfMbDPv3drkmNdlclIWcpj4czaQoegnZpm7DtYHJaV+bWunirJ742riTQ5MZExso7/1TY7bmWrTOtcNYyFeNRi0k+koE6H/RSK92yU6ohBLYkZPEnT/T23SBycqx44u2+/SiU++e+N/tFqJx+FS8j4BHnDm2Zy6AovLyRs7t1uhzt8gr8ge2Idea5P6J4OpMdv6h6lU0Qtx+bzxQBruCj7tgV2mFfMJucmccbne9VxQgHIyY6VlNye8dBfbT/K1IoXhGapEmySkIwbf1/7qWUEC34muZUSv7j58lUIu1/uRuGDrgHCmL86ktnBGxFjuUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQsUBvVvcVVrngGyh3Ie+QUgf6DrZBZZDVfOfexOXxU=;
 b=AvAxPoyqz7Fde+hYNDyEdVB55gxMIH5w4hX0vi4ywr2oMZVzrfGqd/+f2nn7GxxqfuCYtT6cK78+bkmCV2qNMCpT1m+mEiFVMd2a/s5bOKl2g5hjkwOC2QwVhzpq4uudw7P8aTI7fQmWLH1f4jAvf0Prl1t+jiTWdkyjQ0AU8VIYIUbbNfYG3ErU4c16MJ2LyPZj7BBD8erLyo2d1b4IzrJwjm3SfaulxfMgnvbT5Fmhp2axUBK6rOi0x67/iN1on24KORJ5c0JqWSOeJ4biKE9a72gveQ0Tx3c4B/e+VKuYU9oAar121cWI3ooqE1JE6s5nqvfGARkjE9QfeI543g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQsUBvVvcVVrngGyh3Ie+QUgf6DrZBZZDVfOfexOXxU=;
 b=VPgK4Xtuj7HjubzYHserPh+AToVQaW1BMfco2l0NXBaryM6Z3488kvuuKJlv/DhEEIqkIAwzsp1ueRLdTO1R0kAYffGY7wp+WLB4qUTa5XvzNLHdZY3RxI2P7VYHcT7AWoBOy7Na/LWTR829zbQshII2X2ZqIRxuc+R6HVg6puc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:04 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:04 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 03/11] dt-bindings: input: iqs7222: Correct minimum slider size
Date:   Thu,  8 Sep 2022 08:15:40 -0500
Message-Id: <20220908131548.48120-4-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908131548.48120-1-jeff@labundy.com>
References: <20220908131548.48120-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71912bf7-3360-4735-bb6c-08da919c6c12
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMzpXzEe5hbk0WClpOCS0584cMUWBo6jeAj6NukqyChCP57r+msHWlMM3qP/Dy8Ney50U1doYJS1Dl2e69gcmdUBwQTuEc2ZuRIYAQG8PvK0LFgOxP2pfadygPJY4oTOwSzKYL+aMULEGDFn85zQ/ARAbcVXnNALj5rAAmaKcchXkxIdOzGcE5lXUqcvsxQs8M5SOWfzjAdBIeIcvBM1apqcYGUmQyAVuHbo7sqnFTLDTkOI/vpUhEtdYM+NsBwg4OKe1eFs/oq1a/4qsHC2KCGwwpEBu8wuA05ttAPo5Qt6LKiFZ/rQOSkfjaj6mU45bL7jf3OM1hFIHs8RuYct9tYHrD1rBRzR2uJWiki3R/h+LfgiFpmFD1vCBbRk4j49t1QC0k8vBex/A65OuVOiLCbFSe/lREfbdRo7fMq+iGRNkQNEcTzVoyvxYdcHRgf5EhZ3HRmJppZBdWAPPh5gdRRBN+YiX1fYCsdjKfgC3V1cHFqpzMz1dT8ReN1+r1wlw4VF/2rUEKoRTilNbc6pzLZuP2oiiMqLLjrGezxVRlfzvIcgzrkeTgvvvfQQKgxdz2jW/CdV7uyg13/nTnTw9A2hRWAt6ActkB8+xktGHTb3pHAm4TU6HI3AM+pV+HWaU/+Ya6oeGprzjsUsa7ZCuQgl8zgUapvtgT0AkOvyvQBR4BUkdL4zwKQSfAn+4rPD+nlatYkeu9aP4L7XMJt7ZHB6Hy4qB5TXJe/SEXkIdCuyGTflQd88eJlz/KVvriHC2Tl2kDLx8/ctnbUlfqZoVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpelpPHr8HWFnlKTEyKK/0+Z/cWIP40qRnetoTgaxGgh4NV+MFnjya/EDIq4?=
 =?us-ascii?Q?lZ7ldBPRJmwG7kE2nYAUXUajEdUm79K7Y08ZWXmuXQG88PhqwJXNirgOefSm?=
 =?us-ascii?Q?TGYH+yLiyj99pKfJYdHAIpVE0JA2XCUmyPWMFOP3w5QVrE1RI1Ri3CuroVK4?=
 =?us-ascii?Q?v3mUCwItwynkxeskHLOtP4DdfeYimYofM/E2QQ9OqlF2FRAccsrZgFwObrAT?=
 =?us-ascii?Q?dlx0XV6Zh5GLhUr+CfYPDwF2Txn7tHK7MLXSqms2V4DwEG1HksDbdqfGOBgY?=
 =?us-ascii?Q?tyC5mRqaN0Ae9dsvEEjTQOUO6MDjqnjaTGZMRk4ezold7cpXfH4IyGJ3NIar?=
 =?us-ascii?Q?+xu5+gOr81PFjqPXvdOYnT3ulYlEjECYqKMcP7RF1W7fnJqREs/ImRwMVFWo?=
 =?us-ascii?Q?RJIN/uPcZpvJcOB2X+1S2IIXr0D8IDW/YCM237vsREsbmqgk5F3pwYEPmEin?=
 =?us-ascii?Q?Y3QQ2zw3925a65wY2n4WflIQx1iVFfg+DezMuc+BXBEAGxcgs5h2Jmw+awvP?=
 =?us-ascii?Q?am6EQsK2B9QfPAHJWTMLrPg2cxMFmxbFtx639PbhRqe90b2hHk6UtSLvaGH/?=
 =?us-ascii?Q?J+BcLtBk9D/VlDFqqd5zPILHobZf2ZluMwHKqv9WbMDafupZIy6tg7CiU8sY?=
 =?us-ascii?Q?3kZvzQIwtxKUD2yL2sJeYbPx7C/U0wqDIlN3/lH3OOVaZwWeAulOXFncRcJD?=
 =?us-ascii?Q?9weLeDbptd0NgBenAOzq3MIwiJ5NTAUtrYxzLaRCQb46BnyRQKVmju+bjhtf?=
 =?us-ascii?Q?ILk/x2ZbMPyVJoQ3tSwj8eAJTZOIVIyARbsbGMCAEwJbPDkDO1dr2gi/7/K9?=
 =?us-ascii?Q?snUDZDdhD4yF7y1gkRCHYlvd/Sub+UPzXQYMtb/yQ+902bTdYYJhPsqtV+Iy?=
 =?us-ascii?Q?jDl8wDQcfR0O1DR0wuz3/F1HeWV0ROkw6aQ8K0R7XVhG8rURde8sasA8peK/?=
 =?us-ascii?Q?MIezzUi8BVhQm/lppEvDUgCfiZ7PXprLh3jaD4zl9mzUeky5VL0ra+yw2OJX?=
 =?us-ascii?Q?5t5kYktQl9wdFBZ3NRr/ptXIPI8dUqBbJOEnZOCer03VLk7H3PVJdPEhZdgc?=
 =?us-ascii?Q?og50dongjztXorD5HGv2f28vQFzr0AKr8+NweuJChn2fhAAZbLL9/D8tIcd5?=
 =?us-ascii?Q?BLUG8NUNtJ5DTE2os6ULpQFlfdEBTruJUFks0fjcvhu6uhzSYssjMjDwaadG?=
 =?us-ascii?Q?Q2yFWH4d97Z3NA1RKiDuYLO5wBqEVe/LLfPZWDrSRl6Is2nNAu2YFDXBXPw4?=
 =?us-ascii?Q?/vOPaDywSEbJYUHct1QzCvMFFQpIHpZFXM7/URXC/OOjKIzcqghR64umw80k?=
 =?us-ascii?Q?KCfaj/56ctJPBiWKBJe60+SduQlIeYi/7zGRw9muoDbrYolCORf9G/2c8v8K?=
 =?us-ascii?Q?EbVWl84JAARlLunkbNv8lGqVJeIiites8jGjKUVAWzDbdmwgXSa7eOnO5FFm?=
 =?us-ascii?Q?uyWiqV6FJqAXOJJRNw76lH7FKKNMt4l0nv2s1hap8g3zdQhpc9Esryl+/mzf?=
 =?us-ascii?Q?8cp5IJuAPaxg+FSlz+Rj+qbu+FVgQEEFApbrI9H1pLbixdYCdone845k11YH?=
 =?us-ascii?Q?BCO9UmQbGc9UsyurIl46NUuHjnHdX5cWcHT94aKZ?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71912bf7-3360-4735-bb6c-08da919c6c12
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:04.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZKaAV95YNxC0VeQz+LacJSrdffxXOC6ORwFEs6ZRgYygEPO7kxfT4tDAvMKoIP+pHulXf7O8oVgJ+5BJFsGYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The minimum slider size enforced by the driver is 1 or 16 for the
IQS7222C or IQS7222A, respectively.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 02e605fac408..785fb9e83354 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -501,7 +501,7 @@ patternProperties:
 
       azoteq,slider-size:
         $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
+        minimum: 1
         maximum: 65535
         description:
           Specifies the slider's one-dimensional resolution, equal to the
@@ -693,6 +693,7 @@ allOf:
           properties:
             azoteq,slider-size:
               multipleOf: 16
+              minimum: 16
               maximum: 4080
 
             azoteq,top-speed:
-- 
2.25.1

