Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 537205BA5EC
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiIPEbn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiIPEbm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:31:42 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2058.outbound.protection.outlook.com [40.107.96.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55436E883;
        Thu, 15 Sep 2022 21:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RC4itAoMeFliQyZS5kOpIEkRXRe3AC+sF2jYysUQrwTtKBNJmD2KgpPfvoX2N60vLLusYxA+eNB3VGToU9/PV82IZgTIX1CMYYPxQy3pNsxbZ+9j85j8EKEQK2ynBWEN84mjxXjXPR6MPfa+YeFIltjOsMl1g5ObYWYT4pCEz+J0QTywj0InyEaWA94x0r+tXLQRB9qpg/3N/RVds54WnASbgW0VqpuG+05dhZt7yB2i3dOUo0FbKEON4nQLP7Wc5bT+9hUlg0SsJnhE35N7cgRQfvjrXK2rrVyAa8ffva0eC5v968kaUd0z7O/fSvzYdsOqImQAtbiz6L5lENun3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etw85XkC6I96qQjN9N3LolKkUo1Nww5s0VbFG1ejUbk=;
 b=KG8yixpkO6Vk75PT8gF7gd42hrD6vYzcCw74a2Fl6G0jPUNDCXMueHpq1jMQdsVe9l5eKHyK97T4Mk4H5i2qOpwej5a0up3zGILsIYJQdzDnRQ5/Plk4EPTu2SKO0pE1/WcS/JJ3PmhCgg7W9BfjVJbVMx0IZjkneKkaZsdAbA2dpDMIk3fazyO8MfgmgGU6TznYcAOOOlL3M+w7StdsYhc8Vi5Ah6S7ZIoUSajqDNwTe7JSNAI9Bqk0X9lDrXWb2s4DCKS0X8iYsZUbmnjR91Adap6qjtvz/5G7U1DAJ1rVvK+jUHgYQBKeB1ZA0cbM6qNEl7wJ7gt9112nNRTgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etw85XkC6I96qQjN9N3LolKkUo1Nww5s0VbFG1ejUbk=;
 b=MPHe8/JjOxYwjKkWl4xtjcHqGOGTjHToQk7g4N0NrO9MWyuTXCN3iPJBMGhRc2ayVCcI6nAo6WPIna/iqIfM7axe1wnFwGd5BB64uTJ2j39S35XjY358xCt40BY5gJ/m7T/xPa1/IJ+cZujaYCWbOngsbqCsiSBVX2Exr/MjWk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by PH0PR08MB7210.namprd08.prod.outlook.com (2603:10b6:510:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:31:40 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:31:40 +0000
Date:   Thu, 15 Sep 2022 23:31:38 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 4/7] dt-bindings: input: iqs7222: Correct minimum slider
 size
Message-ID: <YyP8Ksp7gnqQ1o+e@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP7l/ts6SFI9iM2@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
X-ClientProxiedBy: SN1PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:802:20::15) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|PH0PR08MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: b4edcc5a-8ca1-4662-f9a5-08da979c59b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ujx3XFVOJX4U1CzWlWN6DmVeUZmc7GP6o1jO/VfCspAhhwvoR2AwmBdcU5/LAT5sdpVjF7ptFaONSjzKJV0QNiiGAR84OoqvuFfKFrITZwr90kWBbfNcYBWKyzGUCipPaRHPArNxaU5jHzfiO0I0SDMzRYO1B/1FNi15ab/JnwYnPu5bSf4t6PjIn5OSDQESFX2QWWLnn44Z0z25vzuuGnuQ+z5FWe/jgr8CMiPIZKpRv+ly79fUkjTKsdwhvrm8Du079ODv1H1BVxvDERe0ZMoCibFLKQjD5wbuQHLgIQ6sV/F69+98FQ1l9C7IkesFNRPOpgYPR5Qo9XY7T9F40MhCy/SdauObplw5w5TNcPPctqA/v9lrtIvEO3/4ULkeOaCGlcFpOz/K2PP9pA/c4alXVhxyRPgMvA4yXd+/8QpGHRHQsJFoqZjAnN2iVfW2g6JCZvingbT2gwxRo7ic4C0MnUCodIEO4uh+xF3a4lhTMnLLpj/SeY+yFY/GpcstIZOdhDYW6x59CPwGAPnlRrYIZqzrCioEtSi7vj6u5nYasD2S8aaTrRYFRYIYkrsrnbsWMppW4Zckvl6inbI8uQI0SeAgrSO5aniyXg12Qekl5o3jK7ILbUtlMU56blBWPncNRVXYIHnN3wbCDt4BAH1RZaRgfq3AFf2gWSRT9Ksv3J2cK2NDTb//yUnMR8dfH6mytF62ZNxPLwGLIcAdKlkbL93vNMYcgnLIbNXOUp2auTpdkhXVu7uFAuFlRUTA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(376002)(136003)(39830400003)(396003)(451199015)(86362001)(33716001)(6486002)(316002)(38100700002)(478600001)(6506007)(107886003)(8676002)(9686003)(26005)(6512007)(66946007)(66556008)(66476007)(4326008)(8936002)(41300700001)(2906002)(186003)(5660300002)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ox4XH1FZyc8uqHhuFNIi+160+YLUx7kntTe1/+RCo86mthr0EIs45+YdR1sW?=
 =?us-ascii?Q?Y7LPTs88R4i+UctDdFbnmjmbWLB83gdLZFM3ePhRXAcdLjYaHM8MTrB4gauu?=
 =?us-ascii?Q?MCsn0O2HB3ejdUwZeheFd6qwkEf0XUDo1h4qxFtrjYIiYqdywqrbE0tQ4PyX?=
 =?us-ascii?Q?6nC4ipUnT/+a78ewrlqRmIZ2rqLv07TnrxG/9t2baIkjMmQmbKHP+qqx8QIp?=
 =?us-ascii?Q?SZC79v70NySwSrjIIM5pabpKg6P2rPN04txybIYiKI7EHlQrXrvKVhmBB14Q?=
 =?us-ascii?Q?sqCuuljr0krQ124lVBdpa/s/QZ/BsRcy0+m3REU98hbwHzNqAAfWy3nWzSBP?=
 =?us-ascii?Q?IGuE4XiL1yRM0UICSgc6SdT8LvPMrugt4DvtJ/kjamqs+Gt/RAv8xcXv0iC5?=
 =?us-ascii?Q?a3X73E/cpaMc6svqizdEQeOr+muv2h2JPzDKZiZ/6mEq3H2tkq7Om1sLG6Z3?=
 =?us-ascii?Q?c/M6eSNAieleKwSreIp8BSIQVSVzbjUiaKhji/YP/YkklYoExm79Pt/2C2qh?=
 =?us-ascii?Q?Iru9bQyf4uuMSLJicWy2wVJTAaSigSgoj9zDkom2ZHxZd3HOJ78YJXXrCTEI?=
 =?us-ascii?Q?I1KJNcNtLKjZ24ufahvZQek7viqI8NVuBk1ZSKbw+voM9NtcMPknsKNUIuCa?=
 =?us-ascii?Q?Bl7nmWk3oGyM/Xo8n0rfjOdnqgBwkAiPhxMt2t62hO82v8iiXXs7ufnkNBdT?=
 =?us-ascii?Q?3j7aFFKTNpDQ5LUuwAwDgLEorre6PxCAvP7zkApKEZkCqOfkqCrpgHH2dEv5?=
 =?us-ascii?Q?f6YGY3DVVbOlfQQw2lx6eS+AKVDJtx048FWQ919cPauMBR1rn8lFHDPwypWP?=
 =?us-ascii?Q?j2Scq2GzovWVabvEs7+S8PcAn+RnfEKOIVWn1DdlEOCEUkjhabfwftRNW6Z8?=
 =?us-ascii?Q?tL9PxgrbKa4kkNMpXyxtcz03bHMxbp5y2LqN79l8BKBhyrPaQN2O0DHc2rdo?=
 =?us-ascii?Q?Fnvf6csTFUrerRK3NFnL4XXRWRvkRL0RMF4V6pzdqjMo9LkRYRjj7qPtab6l?=
 =?us-ascii?Q?os+HIdoQEyMc74ZdRdbHfe/2ilgMC7qYkn8BOfU+O9ibEf5p0UabmUE8xQK3?=
 =?us-ascii?Q?cBWDhTv/N4T6vMoQM0oqfknDE6Y5AnfnT1EUZT0D3XldUUGwv2YiHLzbuDI2?=
 =?us-ascii?Q?OUmyp8fvm7THBcY6RP1Ekv7PxaMWzVNbP/o0jTkbmr42BTUP6W/ivNbE262i?=
 =?us-ascii?Q?mNAzvIROG+mi24y9fZbxjYT9JvvexpUhsVi7qyBndLLNR8I6f2wspBwvjWWr?=
 =?us-ascii?Q?DGwwhQIHVsvWleZ6KOewnkfM95oHs2TPYqPQ9rTHPP21fQFMrlqUg4Qpi86a?=
 =?us-ascii?Q?JdL+wguV4/tjjOCeM9PyGLtroOdxR1zPLRfkup/IoDGBRMyGRgnoVjYxbaEW?=
 =?us-ascii?Q?rs/GIS9FY8SVE8FPUtjWCGTCqF5Ta/LcwMhQ7jy5m5rzZy7COTgUlLzgoiTM?=
 =?us-ascii?Q?k+UMduhn9VZZNyLNyh/mSJOnOwRr57iTWd9P5Sp3cd2g8S/QDpaksW94ilfs?=
 =?us-ascii?Q?zc8Tsu5swyjFTpheZX4EmBqHnUxUqTwMRyqCHSUn7/O5YafTJnIV7IeIq225?=
 =?us-ascii?Q?zGI+9C9P1JpZ9rxhoeYsn/x4t5K3pkn288kAetW+?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4edcc5a-8ca1-4662-f9a5-08da979c59b9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:31:40.3649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ne+RBxTFXGo0tEqxmsnPRx1id42LmBsNuohCtxUX+tLX5+zuH0itOF/AXrkcwHI8p8Gllgztc8o31K1HC2akZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7210
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The minimum slider size enforced by the driver is 1 or 16 for the
IQS7222C or IQS7222A, respectively.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
 - Added Acked-by

 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index b4eb650dbcb8..913fd2da9862 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -498,7 +498,7 @@ patternProperties:
 
       azoteq,slider-size:
         $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
+        minimum: 1
         maximum: 65535
         description:
           Specifies the slider's one-dimensional resolution, equal to the
@@ -687,6 +687,7 @@ allOf:
           properties:
             azoteq,slider-size:
               multipleOf: 16
+              minimum: 16
               maximum: 4080
 
             azoteq,top-speed:
-- 
2.34.1

