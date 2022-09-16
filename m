Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3214E5BA5F1
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiIPEcH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiIPEcF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:32:05 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1338C9FAA7;
        Thu, 15 Sep 2022 21:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWd6DUrb03uVHEqtaGmbUN/H3iGOmbNOOPUOdzNVxbZtqWdb+DGMclu1UQ0Bpvzqa4H2fnzhJEIX6H3f5l/KndiI24i3pxSIHo1F8G7i7eDtKS4/6kMyVbNfRYTn08sB/qhZsgoltSaB5Ngmm0z8DfgFSTPvLRbV7bR17JJ9QQVMQ9rHUlZzYuxY+MKtsNONxm/D4rEflKZUmRixQPyNednJV9WVgp0TvD2EXeqrdw2xkg4WCWlSr/oMYZYdkn/CUMcsMPkyCL28zsWt7Q5f1uK226Y281inLWDMiVZu2dRVFTz5+uMuB0qdQsJzr15eFdvM/QT8SFKEOaE6QtDrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjsotK1960hLSrMOflnU1L7Sxn7MKrSbB2Dze/81BaI=;
 b=NGEbHbN42APCW9cYDDJNPksYg4IQPulcF6tB1g9NJISHgq0vA5Ew/5pGg3Tqg8zaRaU7EwzGhBRhTRmQwtVu6iMTaPZCURfDWzhiPJnmuXl/e3FM53OXHrBuBrJAoqNnGdwkMQ7SXw4OJKbvqFMXUMTNPDSluwUPtTiUyk3c5PbZ/ba9xQXCgxsZneccuV4m2+axYPXnEhvyZjGDHMRuQnv5kI7/2nfJKUTPRmW7IVdYHIuiag+eCb4bgV5+ibyU2ysvbhj/PbdY+g3zJteTg5A3NaOQp++t/xK/n60Q5oh4WtNwLzRcVOxXJmg5hJUllDJ69UNppB9hue+jsjOJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjsotK1960hLSrMOflnU1L7Sxn7MKrSbB2Dze/81BaI=;
 b=a8P+mDmdkN5CAVSyZhM9vF1EBwfDIUCUAOj5HHMB2Bvv9kJpeFYgZ5VWv4nr9kUrYM9m9vPfCsvlbeaj3yRho+MCXyu6LNV+yq0acjtr2BpuwIWtoPJtR5VWqo4TU7hkCEIBfioUhO0UKJaGhDiw9eB+yRGJwQ2QTSOo+MtMDWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by BN7PR08MB4132.namprd08.prod.outlook.com (2603:10b6:406:8a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:32:02 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:32:01 +0000
Date:   Thu, 15 Sep 2022 23:32:00 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 6/7] dt-bindings: input: iqs7222: Add support for IQS7222A
 v1.13+
Message-ID: <YyP8QABUUmD4ijC7@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP7l/ts6SFI9iM2@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
X-ClientProxiedBy: DM6PR02CA0112.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::14) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|BN7PR08MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 1208808d-e559-47f8-8d06-08da979c6672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWHWm3xXA43keajYjyLMa48nO4WeheSWRHbGIcoFA7DQrHwxxJ+O+Eytcxsp+YzaeXGx/ZyIgGLJstmmrlbGnDuhora75a5/Ig7DHG9T+/aDDO5YUogSZd6ecs2WeFylppn4k98+p8pXTopCsyPINJBD5ZtKwgdSBYnBIe+rDOF3FnidWJfSsVdLx9nHTOT9LSOjGH3aj0sNVeaaXbZTqHcE/1gMxsRG+kYMIG7+fk691L/Z6QNerYvC4Z1HSPyMwV3EY/2FxCLpAaiW7c2nrzvWw27AJ0VHpyiLro0xgN00M64prLROs9ThScOqK6Dyfu2qHKLhvJ6BymMh/8hUKPu4VZAYXlte+ovFDmC13XWmZdT+Ucn43WigzW308ILE0zn8mdN1/hijknwS6JZxW5S1t1crH24H4y8tooEv9aUIP6hnUOMP80+eliakI1Ja8z0o70jRO5oxitZW5SguDAOOts9U6r5OoeUOD38N6hj0kpfK1wNEm+Voumlu17c6o49MtFdAxsFaVndedvlibG+ICsbsty59ZXKpsOPRklTKTLaa2nDfp/xaVmihqer5cGgH6gyJ3oNzgkHs350xUcoqvbHn3gkwUEoBwnogp5t8UpA9uQI0Lv254xf/APgvqdVHXjFhne48Hc509861p3aBrj9g39WPM6jj8Vc9lNoZSDpbZj71AhD0UQ8ldurwavxWkaw5d0B/czdO7JMDXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(39830400003)(136003)(346002)(366004)(396003)(451199015)(8676002)(4326008)(316002)(66946007)(38100700002)(86362001)(83380400001)(186003)(41300700001)(478600001)(6486002)(107886003)(66476007)(6506007)(66556008)(26005)(9686003)(6512007)(2906002)(5660300002)(33716001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGpvwkxTQbxi7gWMdQa1TKcqvTHrSdY1mpdMLgfT4Oxpej9ioROvcJr94tiZ?=
 =?us-ascii?Q?hSsp6aMg+xRQMIL0U1l92M4g8a3tGJGvN40SMVEskmQaiWyE4cZqgeXH/0Ht?=
 =?us-ascii?Q?xIjAvWkvjRkYUSOsnmKrkRD0Of6NFP0ReVlmrevH/KZk5UVSI7tH6tWH3IhN?=
 =?us-ascii?Q?Wdnar5+vIyUNLGBaSKXSUq7UwEzfquhEl1MtjMx3ys6swCcxchmtr83QRHfZ?=
 =?us-ascii?Q?Y6amcNDbKnMBLWyTDs65HLqTWKmUN1ZE7Iy018xdUCBw9+WtDgpYiqBlS8Nj?=
 =?us-ascii?Q?9WNfAz4FdarYugoIaRtAeA6AJtcX7FdfuSW7DCE74wJekt3hoRPa5INYI2DI?=
 =?us-ascii?Q?4c+fabDiQi5n9sisGZ1ZOb4iUEwf/ijxHc3PMdrIm0B771Fe9Fr2Eox9ohv2?=
 =?us-ascii?Q?AUbScoX5qWACIGUUSKbhs32h+Bcn3TYLRK7svlrHlmKVAYBlpNF5J4KDN9WS?=
 =?us-ascii?Q?GSRu5Tyd3vmX+SAokw37SagTWNNUg+tvA04KKw0xjZYTniZdI24PRS5o6s4f?=
 =?us-ascii?Q?Ac8MgUZW6vXeuw3/xtZ6WMZ/cV9A0yHuMXwKGuWt4J8gEzLZCKDELX0423O3?=
 =?us-ascii?Q?rhVXhVNpXQMIV2gqQHKnQ2FDrSQj2uGxvlqfEa26gNWw3/4FsEgzSKlci26N?=
 =?us-ascii?Q?I7kOuPrrdvPVfiPYFcks6/WL86JFNsUafXKVuq+YHJpIyowDvE0sCHSQcR1v?=
 =?us-ascii?Q?A6PrFtoi6/MajYgVsFe8be4sLVsK3vq7QlfP4lSvl6BX1yT6/bP5KqK0x3Yy?=
 =?us-ascii?Q?vPYuf73MrSiM7qDQ3VtafhloYp+mVa3IxZ5lPc5XWtD7uTzS6jQpsZJ8KTBv?=
 =?us-ascii?Q?kkq6f5YJ6R2HAufc4QOK32s+NUNQbGYurCZzw6KBTRWiZtiA0/CHBUaiJ6tC?=
 =?us-ascii?Q?s6PgPcGgU88BluKcvh3BTnOYcuLqr54iSlfR5ssqa3sKKIUMt+pe4c0Upt3M?=
 =?us-ascii?Q?GBbMKyzGu/C8N5XMUHCzYEWGgQn5ETQ8srQ9y/MVkNepyjfN0/SEPrrX/mQk?=
 =?us-ascii?Q?58POb8V6Vgu5sAw/6GxAvOi6OItigOTiVdDsju8ieRIXWp3S5w678i5xkbtl?=
 =?us-ascii?Q?MkJ/0bRFwGZSJ66VXylaiuPHlz7vwje9MkJtgBE5hwyc4Ezl45hjhgZFR8rX?=
 =?us-ascii?Q?Xc6swGQgPQ9r6EWzhD1Y2wPOrgA6iBiag5xl1TVxtk8RKQeWMy1PkMh4vzCc?=
 =?us-ascii?Q?GiPNy7yxnB5okC93/R9tdDZpgUgjbHmZG9PVNxZJIDlwsj7c5tyZ/dfbCsDh?=
 =?us-ascii?Q?VNbOslaQ3rnCYdogsUY2MvPpJeUXQawdEQBaQFvAf7dUW8VNEhbV8NyQ3T6u?=
 =?us-ascii?Q?eSlLByZ8P8csv7z1oNYBug9VPvWKm0Y10KMtnmVOSBWEyviP90eDVl6SczRr?=
 =?us-ascii?Q?w31Aa0wbHwcvXuoxrmH8QgI/oiIk561B1RZBSnAwX9n5bSzMpzWfKy8FBBoS?=
 =?us-ascii?Q?3UNShKzORx12prIDUDj6SPH+P3t/3/qLotG5r+oSsQUjffnjwRm9aQLhoSRK?=
 =?us-ascii?Q?4xm6yjn8kIRcxwjXNPocfRvyDQburGCu0+wc53Hztx8Z2ss2tz2fPWL0Jr7D?=
 =?us-ascii?Q?UKqA7j95eXhLBziCKh8MR4ygDVfZLPSR2FuHb9JG?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1208808d-e559-47f8-8d06-08da979c6672
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:32:01.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbpMpYKE3mIc6KyjHUeKOrlA1lpBv2W5g1JKBw8wCgCiOvq5++Ni6gq8PguVbkEeVccZN3RLaeVwSxdUdfl/GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4132
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

IQS7222A revisions 1.13 and later widen the gesture multiplier from
x4 ms to x16 ms; update the binding accordingly.

As part of this change, refresh the corresponding properties in the
example as well.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
 - Added Reviewed-by

 .../bindings/input/azoteq,iqs7222.yaml           | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 913fd2da9862..9ddba7f2e7aa 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -572,9 +572,9 @@ patternProperties:
           linux,code: true
 
           azoteq,gesture-max-ms:
-            multipleOf: 4
+            multipleOf: 16
             minimum: 0
-            maximum: 1020
+            maximum: 4080
             description:
               Specifies the length of time (in ms) within which a tap, swipe
               or flick gesture must be completed in order to be acknowledged
@@ -582,9 +582,9 @@ patternProperties:
               gesture applies to all remaining swipe or flick gestures.
 
           azoteq,gesture-min-ms:
-            multipleOf: 4
+            multipleOf: 16
             minimum: 0
-            maximum: 124
+            maximum: 496
             description:
               Specifies the length of time (in ms) for which a tap gesture must
               be held in order to be acknowledged by the device.
@@ -930,14 +930,14 @@ examples:
 
                             event-tap {
                                     linux,code = <KEY_PLAYPAUSE>;
-                                    azoteq,gesture-max-ms = <600>;
-                                    azoteq,gesture-min-ms = <24>;
+                                    azoteq,gesture-max-ms = <400>;
+                                    azoteq,gesture-min-ms = <32>;
                             };
 
                             event-flick-pos {
                                     linux,code = <KEY_NEXTSONG>;
-                                    azoteq,gesture-max-ms = <600>;
-                                    azoteq,gesture-dist = <816>;
+                                    azoteq,gesture-max-ms = <800>;
+                                    azoteq,gesture-dist = <800>;
                             };
 
                             event-flick-neg {
-- 
2.34.1

