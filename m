Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1AE74C67C
	for <lists+linux-input@lfdr.de>; Sun,  9 Jul 2023 19:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjGIRHE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jul 2023 13:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjGIRHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jul 2023 13:07:03 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1B4E7;
        Sun,  9 Jul 2023 10:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lERVV25DgcnEEM27oEiwz2sfubT+dt6/fmxbuc96aUU7khgUnoEY0FsujSvEc+DwsMEh8GtU+nO9R5nskzubpaUCG3zIeNl2+rXSOC9IGFUF6FXos/z99OH9bBTjEl4ShgSNi1tgiHSTsmHt1hFhZdLzdn2LN28gDQPjo+fpRY+jegV3KGKoHXvSQJzAvCsdJOVJzRM4r0jXKPQubojNx3QsnTF8XQIMeGdwTRpwVmZz+zoxTMhAWwQXE127GpnxldJrJARSFm+FtacBArhQiIWwBP54QK5eA9GUnvMxNVVR8/pjyqen8piTbX94uNFasIQ7yhSjfTTcmPAQ5n8l3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFkE5uoZqkr4LkeK9kUEeXy59JxDo+7JNTh+hdPVJF4=;
 b=VDCtDnfJj5d9fdkNqVJjQ/CoZrOz+liwY+vFlZVi4OgyvF6Od5zqmykNQwzH0S7BjhG7iANBKkqefUs7OFICfJJPRnnaYQoLL6YEFi8965S1uc4YMYsRHjJVaw2MR4k3Pj+RpnilRX7F5RcWYQJr052mXtxuIlHNmcSIkS8MriFg4T63psrslmNmbZAB4zCTzw+VVnp3ZkY0L7bLXGOzcuGu5vcuxGgbJWKav9qfxgPw6rh3Ghp1smbw7O2dVwafH/RkT6AjVw2XmZhVseTZTIoIBqznRflkDJdUPMUq7Ui3UXVYXajxRrVxyeaptj7dMHLWSz1nSjrHnbhLQhsLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFkE5uoZqkr4LkeK9kUEeXy59JxDo+7JNTh+hdPVJF4=;
 b=xZRO6xgEGUxSXT1NxIgq+pnWcdQ9UktTf2g6P0ccN+t/iIc8ZZueNbdoTQy6TeQg/0mHNIHZyI3cPg737zcbs9e0bV9y+COUaGUAkiM7s6JQj+LVb671zesSrrGunhDotecMEZwnj8qukUy0UWTQwDiizy9r/8BuVmBEhSRg8Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7020.namprd08.prod.outlook.com
 (2603:10b6:510:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Sun, 9 Jul
 2023 17:06:59 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae%5]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 17:06:59 +0000
Date:   Sun, 9 Jul 2023 12:06:57 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 2/4] dt-bindings: input: iqs7222: Define units for slider
 properties
Message-ID: <ZKrpMekZBt95Gmnr@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKrotyhz7eueujys@nixie71>
References: <ZKrotyhz7eueujys@nixie71>
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: bb667944-1725-49ef-93f6-08db809ee889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kBR6tvr0iYI0U/GfF0Oi+LrUl16HeI62MFTVC90vC0M4wVUwSifwtrc/bvhiczqUn/vaNPoBs8ESwo/Xvth+keeBS05WUkSSxnKFdTGp6ZghcSkG7uNBfxUduH/1H2cS/kD85+4znI1TzsMXf0H2iERH5bLUH3t/432RcKrrGmNulX2hLSiAs+ixgcxkt7ymuLX71arFbQWyGbO9DZQkY75FSdvkN3IsYp2NmaMMFX3EJiLpD3ag/mdvHhbQ17U86qtYU/JtS2yzHt0i1UsbIpSBZPjhaOuZfLtziHsS51qgkBPvpL4Zc76ZqThvczDbPtaoQc/gXB+o2NkAdheWaJqVpfX8pL3mCUkYdIXAWKyoxYqQLZo5vFqZNIuS8frd8XunF35RZSPQTzzwZM7f8yZ3l6g1rdkUOSGx0vljLHMILqOKSg+uhu7XCgUiuyi3P1SC6/kablPGNaIjMyPE1cwBjdIm+cTunIs47QvWypJj6wtdHGlGIAygvkJfiDSZRjYt+ZD6jwLVyXrNfjeCwhoUlgiSJJvJIyv9Fwv2rIZd2YRP2E1KyzmCzZIG5BZK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(396003)(39830400003)(376002)(366004)(451199021)(86362001)(38100700002)(6486002)(33716001)(107886003)(26005)(6506007)(9686003)(186003)(6512007)(5660300002)(316002)(2906002)(66556008)(66946007)(478600001)(8676002)(8936002)(66476007)(83380400001)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3lYwwQp8YpVl9edHA6VCGmve/HkXd3pgMbR5UfQrQzTH7fqBDqBGMBB9gOTb?=
 =?us-ascii?Q?ZUrWKot9pq+mD4ncshrIfC1ZkH64ZAdArX9WkCs4Dy6Wvxtm82uMDI5Nf+Ja?=
 =?us-ascii?Q?P07cA07f7v//9pPf1Z4H81tglWd4A1wTwBsq8aA2u8rp1oRMpa2CxExOCWC4?=
 =?us-ascii?Q?D1uWA4ExhkHJE3MiJh89c/6MzYvcpzgMtmnPBANmKpB5fryOphNk2yla2wUC?=
 =?us-ascii?Q?UMEVQ7yR7Ks03Pg7a3z96jMIT0WB/7CKBdPGZASCMHDEX7EYrtT25rC6rOEC?=
 =?us-ascii?Q?JXme+bqIOcE+9oRU0UHeTrt/d3zwesIj682WWReqwbxD5QxkAOp8X1CE1365?=
 =?us-ascii?Q?HAN9q01ckWeHJIqxhinfFLQEXeNGJLAcdC25DJ0bhKFFvPoSmqtL7HAN9NPp?=
 =?us-ascii?Q?xIKZaPEskELwYaZVrSKRY7cCB7MswVcigbtmN3X6UJMbPObSGC0PTE6qD1j1?=
 =?us-ascii?Q?uwDcEJh3p4yd+o5LqQf77Ll3cwFZ+FkYqLks54v6tRvztXOcL7P7n7410uek?=
 =?us-ascii?Q?hNGc0RzMVQhcfOYRppX3xsy1G/PSQ6oOnWiaqaVXtMsFOWA1NFXPkK/z8Jmn?=
 =?us-ascii?Q?NSjCtW9UwR/OuxuswFS26F44WQ0pcBbh7YwYb/74lSKyn5APopZO5wDEeruS?=
 =?us-ascii?Q?CJTdV4JEeX9xgP1CtxqCYmQFx2ViVtKgqpbFA8muAozG04gyz90i2QXuZxvf?=
 =?us-ascii?Q?ywjRbPrrnvbe8ds5ygQepvfbrwhBf8rzLVjRwRQKtrPLLRM0UdgBLWvSyoqO?=
 =?us-ascii?Q?0WQtrINxZVH+1nJHwz4eW9onB70wIGtql1nky4XKc8qwZt/cp6hfPBaekJer?=
 =?us-ascii?Q?6g0uToJmB0oF97pDzIuueK0WExubtXKOHARo77mu7TlW5T9uwH/b+JSTEvly?=
 =?us-ascii?Q?aRusuBPSacEo06Xv8wu6ed3ulLkI9hmJ+xgymwr51e1+cuYN68p2ub7Ldwtn?=
 =?us-ascii?Q?JbOe2b75FwtENVvrHFmpAIeoogLDlXDrgqUj3urT16VRvBET9jhfQ53ArG1a?=
 =?us-ascii?Q?QQ9qLf+oFk1XHrurYwMsRXOB24kJ2QUiBidry7eUtjhYzZ8avpEQ2keY/kkM?=
 =?us-ascii?Q?Dhxfok21Cv0AnrmvEKI09q62wgwWBgTEDr+a8qjRR0JBj2qImLwD5b+EnieL?=
 =?us-ascii?Q?abJ0mwLC5Dt+r5sXO5YWR98AjV5OXdbAOzGXmrMm3Yd89Yau0Nsg/JOBP9+U?=
 =?us-ascii?Q?OzSa6PlaXkcR4G30GsBoF71exmE/XuSMeZiQG3qQ4MuS2PTp7V5LtQa4Mr/z?=
 =?us-ascii?Q?cXf31rAdlk1mMhDKKmXVGqsS/5llaI/3uV9tE3A5kxYpx2QdRLfgYXns3Gax?=
 =?us-ascii?Q?iODFkt5H0drTc8LXZ8Y8veMO1JQez8tlX6Gso1uYKfIvlqqlbjFtYzMJOkT4?=
 =?us-ascii?Q?gC3bGh7C3+RfNwpbCIYR6j9eT8RMt2+ETNj/36SlGlh2VI3ocgYqdosTts9N?=
 =?us-ascii?Q?B22gNXtijAWSAkgcZbgTR2Cy4Qwdlc8LdttcGZAHFKK9QX8zDF7ug9+k7C1m?=
 =?us-ascii?Q?eTYs1UcPmSS7pHz8AWLDZfvEXHw5gatznWzMnOMSyg00JpUaekB37QSNo+xt?=
 =?us-ascii?Q?rBjqlT+G1TwpYOeDw/hwiG+igtjrMTj5lwEsTAAC?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb667944-1725-49ef-93f6-08db809ee889
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2023 17:06:59.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTy7fvEjOsFpb6ifYVaORGFAzBCZ6VNg/MQDK4F4eaGITfjrHfalndSdrYh+1I1n0FKT/NBXWMigoQdD2YmtDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7020
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The units assumed by the 'azoteq,top-speed', 'azoteq,bottom-speed'
and 'azoteq,gesture-dist' properties are unspecified; define them
according to the device's datasheet.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../bindings/input/azoteq,iqs7222.yaml           | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 9ddba7f2e7aa..4c8690b62ce0 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -521,16 +521,16 @@ patternProperties:
         minimum: 0
         maximum: 65535
         description:
-          Specifies the speed of movement after which coordinate filtering is
-          no longer applied.
+          Specifies the speed (in coordinates traveled per conversion) after
+          which coordinate filtering is no longer applied.
 
       azoteq,bottom-speed:
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 255
         description:
-          Specifies the speed of movement after which coordinate filtering is
-          linearly reduced.
+          Specifies the speed (in coordinates traveled per conversion) after
+          which coordinate filtering is linearly reduced.
 
       azoteq,bottom-beta:
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -595,10 +595,10 @@ patternProperties:
             minimum: 0
             maximum: 4080
             description:
-              Specifies the distance across which a swipe or flick gesture must
-              travel in order to be acknowledged by the device. The number spec-
-              ified for any one swipe or flick gesture applies to all remaining
-              swipe or flick gestures.
+              Specifies the distance (in coordinates) across which a swipe or
+              flick gesture must travel in order to be acknowledged by the
+              device. The number specified for any one swipe or flick gesture
+              applies to all remaining swipe or flick gestures.
 
           azoteq,gpio-select:
             $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.34.1

