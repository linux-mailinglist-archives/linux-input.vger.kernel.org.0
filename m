Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CBA6BA5DB
	for <lists+linux-input@lfdr.de>; Wed, 15 Mar 2023 05:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjCOECn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Mar 2023 00:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCOECn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Mar 2023 00:02:43 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2064.outbound.protection.outlook.com [40.107.95.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF17423A54;
        Tue, 14 Mar 2023 21:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQT4/LtjdQc/ZLYmK9SvkqCRBo4aZkLFiXcZgMDOci6Dn/WaK1eVc90a2ourVgLLSBf065vJXYV8fIq+xIXNM6sQzuSlnO6r+C4zPIMNTxb4mrcrP977Y0NbcGhOIdNMCozeksWO88KhpWr+6Jwvpgvd/i1gMfjSgVpW7BQUgAbV7idJS05voROqCMPn/1KrnIUW3p8dxf0afe91Ne60iQ7C0u5Wp93JSTZfU6lxtbycsWvxsmTnKwGWnuGRGXZ73q7IWH56Jx1r4IlfilnEbFItiaByGl3PhNVaM7vdsgYCuZ9hlfBvgf1d9PZkbarN9ACJ0UtfnNYFKf3XSREMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmrF2mH0HfCfd9gvHQUZ/nIT4ZUD7/yr3F3VmSk5VhI=;
 b=ZKWIjEXPyoN4o+Y3hci8gh+Y7/ALHYwA/E+SHINBNleJodpplWT9dXoM3iahL7UvuTVHhQbZ01YcmlPdiouBZ2Da2pcflfEIPyguu2A5M4AbchL7YI+5Kbfoow2+vGVqcsUUw1+VT05J2L9kpY1hxNTnmplkTg2b/GqNQjTOd/9JyTzlZddG4XmK2HVxIbLjEQlRdXPjaB6cbZ9mpgZHGNbZtReek5sCjLFngE1f0OzM+q9ElgfGndAKWlx2QVdsaevwFfdjd7gIkWyrvXXa5bVnYoXXB+prGmnQh0M9kCyEUQhSw7u/v/weoJktPZkuggaiA8SrX2Is/3YyAxAA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmrF2mH0HfCfd9gvHQUZ/nIT4ZUD7/yr3F3VmSk5VhI=;
 b=E3SwyWkkVWWop8USqLhgjWsFICdQoV8KfFUGuR3ch0xulu1U9ZJKzk3okIbc71WkzgNtbJK9vVDJ0JK5uEP8G+3bF+wjd7RehZgAq3Gq7LKhjYmeyLx7Xp7nz9rBfGy19iLatwd705gCPLrCDujgmD5JzTJG8ashZJNY7aaTssw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN0PR08MB7487.namprd08.prod.outlook.com
 (2603:10b6:408:157::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 04:02:40 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4%6]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 04:02:40 +0000
Date:   Tue, 14 Mar 2023 23:02:38 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 3/4] dt-bindings: input: iqs269a: Add bindings for OTP
 variants
Message-ID: <ZBFDXnejC506Ov+2@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBFC+e/3JcYITClP@nixie71>
References: <ZBFC+e/3JcYITClP@nixie71>
X-ClientProxiedBy: DS7PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN0PR08MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a62e7a-21be-4185-1fd7-08db250a1ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVEiETMsmTt2IPruNbkXmBlqIqdkVrWIX/3qx/KT0FNDaEonR1/W/2nARNtJU1oiZPmaXl9bhWL7+87CvLOkgHwmfhsuJH+gx7vnWwJ0Bv0HmDyjCODszGeTIdxHvoH3lskcLkzZA/5M1Lbie8XnvhJ3up5NHgdAPTMAMOsnJtaQ5pekI+mOeu2Ehy6fvzgme++jO1J6yAwciYkWG8pKjFZijzXhl29dwLRDWYrMQlzXGWeMn/gIvb/z6wwm6Wpsp13i7ZQrrt6ZBr0V3MS8LRNGSfis4fQpDZ2Cuj+ltEoY6Z3NzTnBkU230H58ihfafIbanf1FHY81LWVOwwbYZOYPINLUqK6sAswooRlnAjFovnQsrATm3fP6jAJbNYdGJGQj377i3e9QK/x+JnvJxNAJGilWwjAcLhw+rR9fIaqofpZPbs7IF3HSywN7QCr61BnyMx6jRvDhb6ub3TH2K1Xa5syR8QQS1hPdLgiGr9YGuUfHWJbbBX1DqFMfA7R4VVZDq9qPzh9RPRILpa7wH+lWjckCRJN+ixX1ImXjO2uiHK4GjcwkMKJsbB55kuPilNHXdwpseoUrWztmcpiIqf7FzgTQfBGfgT+ZDpxnoFeQYp0JmRxgc9jEB4n0Xd+TX0GlTdX6KOMwfGU/io+Gt/pLaQ9nfrS6m/Rvv9WxDyIDbUZNU//67f0Wzse5rn8L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39830400003)(376002)(136003)(366004)(346002)(396003)(451199018)(86362001)(8936002)(478600001)(5660300002)(2906002)(4326008)(41300700001)(66476007)(66946007)(8676002)(316002)(66556008)(33716001)(83380400001)(38100700002)(9686003)(6506007)(107886003)(6512007)(26005)(186003)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HVeUTsSVEiyGvHoCJipq72oi6LnpIrD4yf78nlmxfV7m0BDkSNbYPT+KnvKe?=
 =?us-ascii?Q?SUfww9z9mlkjfdX4rnikYTfO8vRTlrj1ZVwfvLLIILGy6pMdQfN0yzOZmvEd?=
 =?us-ascii?Q?6vwbGKuFdYQS3Ujj6M2JG4+wlbMpsYIFIDg9W98dw1Llk6ngx2zBKYs4Peqi?=
 =?us-ascii?Q?5IaFD16GnDDDsPMdHjo670NOu5UlRrL0hxzzniBKG6mP4vzmBQjqiP6M9L1N?=
 =?us-ascii?Q?bMJcMW1Xa9xQo6yyQ4dYXXCNw3C4rEbodipz8dU2RvTSRbTxa5wgfdvLzoPO?=
 =?us-ascii?Q?vWzpd74WUoCTruCGbfBKKAj3axHaG9gPuv0H2nd4MD0/CXo2aj8gEJ+Q96HC?=
 =?us-ascii?Q?hW9FCImvrq1LLkos4cr4N7u6uaideDCl5u5YOPlrew6s51j2FLIaFcQUt5f6?=
 =?us-ascii?Q?pQIF8DY4jQxUyjOVrQC2LoOLmeEfxO1+oS3bsn3dAl7IQ33073O/w1qV/czH?=
 =?us-ascii?Q?fn61+KKEiWnf9Jipcte2xpCCAbXJLv/2MT7yCWAlnM0kPELYLSRd6yZv/iaW?=
 =?us-ascii?Q?vNVwodI5OBIjemdczXyZ2oFd8EAfiBTX+OkEdqjBNZ9ccoRa/TOYa9oWeTfG?=
 =?us-ascii?Q?3nVz7G+mUFo59E34taRd8xebEd0YRUwGUOIv1SpmjzQCVROLdMok+YssjIcF?=
 =?us-ascii?Q?FBJK2UvkBSzbyk8AitDeu1YCkrdz0jfTmHP2HbduIWNWzUcpZukIKPAouuQY?=
 =?us-ascii?Q?MY677n618R42YxUGb99oGPrp4a1OeymHEbnEk/97njsjinP1sXtPcxgFaKNr?=
 =?us-ascii?Q?1TMAeFLchT+12ror7Syx/MU89GZ4x68s5wgn3aSnkzcKfT2r9RchhCXNILTt?=
 =?us-ascii?Q?X2CHMpGzPhehv/GP4Su9aBawH+K/e/WpLfD4VebEIBJZs52t3c2ye47pB8mI?=
 =?us-ascii?Q?ylP5yyDQD7qzBeeVg7ANpYn9zR6YPMW7W4NXBE1mUs2woiBWzrlXWsIb0I3G?=
 =?us-ascii?Q?+8QVMs0Oisj7Uz2npVBvP2ZW+ZWeEGUpoM/cuvzbkn9BhzccPkFsWoETX2g4?=
 =?us-ascii?Q?GBbiwv/67X96kIZRpSRL3Dcm3bE4Djtyg9Bds4ySLFoKLrrejXEzm0EzcAU2?=
 =?us-ascii?Q?Nq/po6MeZWoj+D6jTNxG2vianBjX0wMKwA6w68RAo636uE53Sx91Mk4XgrsC?=
 =?us-ascii?Q?ZHFmFIH2SmFFAPG21XCAEppgJwmIlvCYB9+4rPARBtUYNyats5KL3BRaKsc9?=
 =?us-ascii?Q?iz+I5IueLwPHy1zUtYOo9F8+LG/yaf0eEmCXBcRvPAvDoHU/otRyKGtJckiD?=
 =?us-ascii?Q?fAtwHz/CL9GInwcxG9UY0SDz5lBn4OMtX74CSjQ3WaDI2ufYIIphNR58H8iw?=
 =?us-ascii?Q?af6AFawTZFS6ESszyW65aFTDzCawephliDKe3ScnYKtN+ZaFrLCZZ8HtJLE3?=
 =?us-ascii?Q?kzv7LkDh8Byzao4vWmQqmETKXuJXZjzsp1CnKpEyCAKS46aUEMkYHipVkhWS?=
 =?us-ascii?Q?SpZttpjLHN9Z5kweTPzwlUBb02NSPueOq4gy4qbgy1z4lwmUTuFk2EwUZVCH?=
 =?us-ascii?Q?Q0aREshL4K5ZMdYbzJDhKfgEo9rbV69pBwIZrp+JOfvF+jiLc0WrNnHhq5ap?=
 =?us-ascii?Q?NjiDfukv8nd32Rg5pQLw7OFwVv7ed/rgdfznHYMg?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a62e7a-21be-4185-1fd7-08db250a1ef8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 04:02:40.3785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZIs34Jr2gRm35nlr7sEV+27Mr0nyqGUMVVRossGcSTP1dpHoKISG+VT3OWv+FxHFBYvEe06zMfUP1Xflhfgkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7487
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for the D0 order code of the device. This
order code represents an OTP variant that enables a touch-and-hold
function in place of slider 1.

Also included is the ability to specify the 00 order code (default
option with no OTP customization) explicitly.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
 - None

 .../devicetree/bindings/input/iqs269a.yaml    | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
index b42f07542d27..2c3f693b8982 100644
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -20,7 +20,10 @@ description: |
 
 properties:
   compatible:
-    const: azoteq,iqs269a
+    enum:
+      - azoteq,iqs269a
+      - azoteq,iqs269a-00
+      - azoteq,iqs269a-d0
 
   reg:
     maxItems: 1
@@ -207,6 +210,16 @@ properties:
     default: 1
     description: Specifies the slider coordinate filter strength.
 
+  azoteq,touch-hold-ms:
+    multipleOf: 256
+    minimum: 256
+    maximum: 65280
+    default: 5120
+    description:
+      Specifies the length of time (in ms) for which the channel selected by
+      'azoteq,gpio3-select' must be held in a state of touch in order for an
+      approximately 60-ms pulse to be asserted on the GPIO4 pin.
+
   linux,keycodes:
     minItems: 1
     maxItems: 8
@@ -514,6 +527,21 @@ patternProperties:
 
     additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - azoteq,iqs269a-d0
+then:
+  patternProperties:
+    "^channel@[0-7]$":
+      properties:
+        azoteq,slider1-select: false
+else:
+  properties:
+    azoteq,touch-hold-ms: false
+
 required:
   - compatible
   - reg
-- 
2.34.1

