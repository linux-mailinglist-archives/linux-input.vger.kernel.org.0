Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14ED60909D
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiJWA5R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJWA5Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:57:16 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3896FC59;
        Sat, 22 Oct 2022 17:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2/cHnopfA9SAVaMOpVfeO6IjG5mG6MyF1KYs0a0Ua2UPzbC7zlJ6b9BMNYMVPImay432YLvKiJY8OsJ4/JFh0RNXveWARBqbjJ76FZwaY2tc5GS9dCKGubeD5+UBHj5jUggli6dVb+DBl+DBtFKN/IUbMZwKkmg2T0rYKk+K0SepUVL5fmpyoRr6krkBw5jjJUfPBs03q0FvqaNjkSJLQYzTH62fptdWf/hqnC5mXc4XWYfP3SHTbvQk9P807LqruzoZtN3MfgzLXzZzWmxjzpijVJ9LJccZis7yUXjA6LkyTGFifwKjFz+bNB2xBBQvRXpt0Z1I2I2+bqR8UqOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AN62QG8HQBCFyq/0bRO9070JfA6KLOTZZ4t7WhFmIS4=;
 b=HV6N+YN3CTaPAegZNh4yFAT4MZMZBgHVO0jawn1yhk5hmozJd7/8xZRq5jWfvlK9U3jR8fHUl6MC9q1HHeGjxyMTGS4xMwe5eok04Dyk6f5vOxa9BHQ5+LLBOYyvmflnMloBhu3dsAU87Z9DO/vOd6iE1YoajmWlSfTfgAGyHphjIcG5T9bLffjsAZzyIH1RLTL2QW/npsB+oSK6sCRiyLyjh3MVLFd1kHMvbm3DLaD6ZibL6Zgl4T/k/HhYHHmvBXR4LZhHnKuHzBNwPxGrWvFPcwV2a8Wby/D7DPZG/fh9v+77R9wRSYueP07loyysLi5Jwz4+WtuKLe/jlAEWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AN62QG8HQBCFyq/0bRO9070JfA6KLOTZZ4t7WhFmIS4=;
 b=qLGxFBt3sbOp6GsnJWqOaoncLIuAqvqqBbS5uWG/8EmPjabQoIK56Hgemo1919kEkeILHo5xEvcekhZyp8UaB6yKHGbK38nyEBSN4K529OeETcDdU5G+2qz2NCman93WoDrcQzUXTHxt81k0JKXBEFCxdBOcZCyB2HA12P40Ru0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:57:14 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:57:14 +0000
Date:   Sat, 22 Oct 2022 19:57:13 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 6/7] dt-bindings: input: iqs7222: Add support for IQS7222A
 v1.13+
Message-ID: <Y1SRaVGwj30z/g6r@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: Y1SQ2t6yUvdaIQPG@nixie71
References: Y1SQ2t6yUvdaIQPG@nixie71
X-ClientProxiedBy: SN6PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:805:f2::47) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 058a6fe8-6846-49b0-e820-08dab4918685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5H10bsjKr2pqttEQ43t9+Jr8u6UzMkzkPXQgIIwUT+phEpMJoD6imunBCBOTQi89NV47W/Rxzs0Yi5FAxfEn5pc0HuJt0r8Y4EGbaQ06bGE7f4Q7FDVS2UFQKzXrfBH4ahWf6A9nSUR4vejV8uMzSQDjWBLBMJxBf1/VBmr8kBdI3NFHMPTXtCNwWJ9RPwwebtCVW55mIojzUQKvp1npu/rNkAjlZJHVaoX8set/Kwywem4uk5fBZFmvv4U0Os4aoOoquVlLrss1ma2Ljt+gBvQoqgV2hbsEQl3nwHTDm1XeddStizNTi4T3B9jTfaz68zCvMYnrjiq2WkVErkqCCuO/hxRHeAvBdZiYRfn50zI+w9Vq0Ul2XOh3xuqqf+joREcRQJpOlQ/wpXp8svXjTX2kgk/Kgo64/XnnPKUZ6XfazLCP4SpnCrnDIij3P5AYy8fe1LninWvBtrc8NpR84FfywbOnHwhi8WnVO07zE2qSzucp+Yfykoxw5OgC/sISE/m/c6+IAUyNcsQRffEl/ht/y3S2lik90exIQeVwGfpd31ZuJnbLArQWSyJYvgHaqClbcvYk6rCC3xHmxZs68MXav/0OnqQXSp2PC4WU7dT4sgDRpcaDaoH5nSTsa1yJfYbuzhMXklWqCvC/GoRhsW5sfYhJE0xjrvVJQkNclcJg8AAokACnwfd7IT2Ey7ku4a3v2ha02w1d2JWMEXeVSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(2906002)(38100700002)(186003)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ulq3MMq6bveAeoSUxElZAgaxsix3rsTgpv+pCOBHLQA5Gyu8N/ZMPOlZZIXs?=
 =?us-ascii?Q?ryQfRS6HYNe0NodPvyparh5BvCoZUiMxM+DrUznfkPD8ZBKHY/EPGV9zbfFg?=
 =?us-ascii?Q?ZtFt5GJJBvPpBEO4e64RfFCOQzQz0giI/kGd2djLIoSRGhAwb94NgSlKjcTM?=
 =?us-ascii?Q?zGmewpdHItWvLTE0p+Hf63PXys2AXgiGMAu+m7vyw6MhxOzmSZ8Uw05hblZ4?=
 =?us-ascii?Q?nUzuhc3O565zLe2YXejc2EvXtbj6vdW83GnHJUlBWJ2ls8kZAsVNzzjcsODz?=
 =?us-ascii?Q?onFRSbbZBFk8Si4ftjyUlfWlZ2muLCDCI2kKmyBuwvHqsd70NRiUofJnTjHJ?=
 =?us-ascii?Q?Xd+ZopdN8BnAl7pO06z9osa2SM2MugHRbj+QTPxGFED/ni4lwh6/zaZkFarB?=
 =?us-ascii?Q?x393GQSoU7c8aCysTfVW5LAR/6S0rZpuXLKxsohZ0A5AD7q0Qmaofnfxl5un?=
 =?us-ascii?Q?hvqlMThXjCe6HNKYWIms1s5CnFUhwi2rhL7XqYtTE+rCWiGvdorRaDAWlE39?=
 =?us-ascii?Q?HBkW4xjYZ9vi8ER7YcEbAO3QKpHwTrWVVO0ptGNWBd2y6g/etHSaURw+a+PJ?=
 =?us-ascii?Q?JvLNKu78PboOATFBYFzI+D1KCgS7mYivyF0MIBwVpWhAvCh2WRTLWLfXBVwM?=
 =?us-ascii?Q?J9rb4SIXnEyqQGt3RQWVO9EcfFgzDDKu2rrY5g2Hs43RDbCTlu8q9Q2NXbaU?=
 =?us-ascii?Q?w1X53ltSsOKvYaIRFukVONUjALKQUJLX9zJAW8ddc7dtfuNoVcSrl4xZmXcE?=
 =?us-ascii?Q?Ztv/JHFfZStEuGJfT8C7WLS0f/WpAJvlEtLGUP+rRlu2ymvRYYcLArtcPHGK?=
 =?us-ascii?Q?XMyF21r41judaxCoCaLECjqeAaaN6jzBlKEEjTBeq4l7cnK+DGy072kNdK83?=
 =?us-ascii?Q?I1Ei2qZVJXFY35sBr+1Sb9wAkLxkHVprXPcn2UEYvUYyv4/WqpoB5je3E/jk?=
 =?us-ascii?Q?jqVUU/ks2qrpPMFpkLgsfvK97AmPqvaOM4xgdbl/E89u1T2a8FPl6EvL1o/5?=
 =?us-ascii?Q?/YkWdZXJ5pbKJ8NG1S6CXVjLSnRyWcHO/XwCXC1mlP/9e9P4g66Xw+K0nLVz?=
 =?us-ascii?Q?qBMdFLgkkplONEqqm03PwYvt7afkxYrniRXaQ9EHNd+hp4WSnPtD7YOfcUdd?=
 =?us-ascii?Q?wiiTa2CvE61RtIBC2FqwvF8XEsSKEukngfsTJscdp+JdiKlilybrS/mZMdQl?=
 =?us-ascii?Q?UtyV0E7p1RFRxwU+5tat5k5E3gVVe/OPiPLJnSpUv1Go4uqsAC5+VEL1yvs/?=
 =?us-ascii?Q?0F6JcjgCDafR2BJwMYVK8/97RBLz8sT4GR6R56v4qpYKTVCEHcxkBoszCPlw?=
 =?us-ascii?Q?bldEQUUMVnm16RWQn4m6fM6voWMtUoj29hDAxDTAzsNV/ssZUXdR365I4rRb?=
 =?us-ascii?Q?pREAMZxPsypjy38bYtsMuVDWdMTJDd5wGPldOpQZZf0vrL0n+9YCr/JWHos6?=
 =?us-ascii?Q?bCEciEocD/3s4FfU1Rltt46JedU438rfYgnl/pK5pXOrMu6EVJIdidVSPVAO?=
 =?us-ascii?Q?o7G3RAN+LvXg+ZFBVMt6XDxo19TlpsOwJeGZH9lKkYZyWTvx0IxfuXc+SEmS?=
 =?us-ascii?Q?wjFduhZ+U8HiZ2VL61KPqBOg30aHf5l6oJ8fnIdo?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058a6fe8-6846-49b0-e820-08dab4918685
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:57:14.7464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDeJtnIBboCkkhvmh8qnws2LimJAf3blqNcjo2tc/N2KjuLkNceZZ6DDi4bDV2KzlD0bvdgSFL7qmc2zN+CzYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
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
Changes in v3:
 - None

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

