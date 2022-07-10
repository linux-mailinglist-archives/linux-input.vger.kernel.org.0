Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4238356CC7B
	for <lists+linux-input@lfdr.de>; Sun, 10 Jul 2022 04:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiGJCrk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jul 2022 22:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJCrj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Jul 2022 22:47:39 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9FD1C12B;
        Sat,  9 Jul 2022 19:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrNGelPYcMtKKDfUi9hN2awhTwz1TVIPhcbDbuGoQjQGf92X5uj8uPt96zQtHI1GpdOTfvjHAflDuax4skEjO1uEWFcF24vrjVPk1HM0mkOvIYw12VywN7m1x9YbG3TlZRXmXaY2UJXPMU8d45fAweuMAP5fppXWcesJa/HYaqrZKm7//yL3zUiu4JVZc6ebcA4HX4uG+vGK6UZPkht2jqMlDqS0AKe7lJOo7y3d2dKh/x3/kyU0WqJB+6qKyNjyjI++mhREVGIuUmaPJY01+eSSwE1s+H0sDE2h3DyJfPLuWkQwnM8Uli2plM2Arptt6KBAMoNmpX+IIrSr5gxQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGAi9JwXfj1XLnnVpm9toj2BszzGtwICzC/LWCFuPK8=;
 b=V29x9nFkv8+PN1RCtGNkroZshnyWQSRIrfSFsGgS8TVF4RQxciPmsI2wiPK0P+5fC2n3dFDj0GiHSJl3NsRpTj3lxB8POu278u7Bh/cw6LGllY3as1/TTD1OLUPd/fJ4fUgeS+tWa3AIlYMabOTycqm7toSNqwJHQ2JW73Ff1UrQs6V8Dak0gAgB8DJEtJc/TaJ6BsnzEJTHwDMSw3eq8uTECOr2Vm8lfiqIasyRB4YT0qV4hSupHhVeUJkoc226RpywWt/h7DhZlPS9OsRI2Vxa+/rCBhEHAGLoOlNsA/YUepy3BaApotoEfdaoKFjSTCI5fACHyphv2dh5VCTANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGAi9JwXfj1XLnnVpm9toj2BszzGtwICzC/LWCFuPK8=;
 b=dqQdMVngO2/0rRJ1GFJjektSJSIpd3ekTgiN/4dWzKzqpeceavBJZZnZrmNYB0eBtdr2BAwn+YGusnPTcfvfHRUUP0x+c1g7Z3jjL8lp0RyaSzCPh7eLsK0x4I6BLrMgiEhMqOiA/SCDgnGoLPhWjJmz9TTWYbCYH1Ti3YKP+0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by DM5PR08MB2905.namprd08.prod.outlook.com (2603:10b6:3:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Sun, 10 Jul
 2022 02:47:35 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::8096:f29d:569b:d74d]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::8096:f29d:569b:d74d%5]) with mapi id 15.20.5417.023; Sun, 10 Jul 2022
 02:47:34 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH] dt-bindings: input: iqs7222: Use central 'linux,code' definition
Date:   Sat,  9 Jul 2022 21:47:13 -0500
Message-Id: <20220710024713.17275-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0570.namprd03.prod.outlook.com
 (2603:10b6:408:138::35) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7446b316-66d3-47b7-dee4-08da621e8af0
X-MS-TrafficTypeDiagnostic: DM5PR08MB2905:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgieM8ZvXJWYgU6xYOBPmCNPQNMHAL5g7sFJEP9+nC5QnCXfLowcIyZSczIIRCqqaqpcCPp8SI5/NySpyA7MScV69R0z6JxZWlTjSn/oAdTzdmS4yp2Ye85E7b+pU4rb4iCFYuu8ZlK5vScpAol3BLIOh0rdGZC23+kE0sDOFCL9ARa4ZAl/kqLpALeKS3gOivF36cy9os1iDcHyrPMzjZBAVJr2Stw51VV8hlx3udwLySu6cuJKK2g5vXmom0C2RCJXR3HqIPPbEYLRL2GRlD4Be4/GG2Ux1Mvu798Qim0ZGiFrdg39a2NYkmkRLUjPLq+WTEdsrRIiQH+oZdKx0QETfNFLY3uB21+L6rOkaIu4/MQq5l3vHHVVTXyfgZdGpD3E1vwFEE2YfY3LuY8jro6enZ1TiZdApIrxs/R+VJW+P2dlQDN6j+WUVUhbdNZk/HSI2Jn25fkXO+nZvu7TBm69qdhK6d8HgLeMEcsDDdcnPvy2MVnQczZ+Jtwf68rIrU37AXATtd9gZWS3iFcmVVhBGRTV0fPaZ5Eb6vFGL2oooXCzx8OKC5/6z5aNXhX7zEF2E3mTFkBlFc/ZFniso7NPQVc9HsgZW1ce3JkW5mOopOJDj1CCNNZvH/J7ZefRduRkeCBnEgfg63wJGmuqxBjVZR5MpDbnXh6YCCHCvVe/Qc01awih1exEOoxqfHvsZYHgFevu58gG+z1vY1nlXUPABmoHiGCPaTIK/AkmifNfzrDQgfdGA8fhZP6PtH34ZVx8HzVuoeDe9SiorTbhtoxJAq3eZ7iE4+XIHovU7IEBVUKspPNVhOCLUlyZQdcZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(396003)(39830400003)(346002)(86362001)(6666004)(38100700002)(478600001)(316002)(6486002)(38350700002)(5660300002)(41300700001)(2906002)(8936002)(6512007)(107886003)(66476007)(66946007)(8676002)(52116002)(66556008)(4326008)(36756003)(83380400001)(186003)(26005)(1076003)(2616005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPnx5PPDRz54oFtTbxZ03eMidI6jKhfbII+roe/aA1cz6gSQ596EbdB7a6OT?=
 =?us-ascii?Q?zmbCNJkWzOdY4Mtui37XNRSl5j7HQVzWXXlk/zo/ZlNXAUZ2OJ84V/QYcdqb?=
 =?us-ascii?Q?K5zUa7ZYCsWr5eGX0Pb/VEY0E1stS8Z8hN/YcRuLrR2jsj1TGlJsXnHm76dy?=
 =?us-ascii?Q?yp21P8kfRQ16ILS5QBWqArvm0/tN/Re1xctSdzS51MEUWA1FEcZVFmFZvUma?=
 =?us-ascii?Q?KR8+Ag1FdJF9QxBzlYTuaTe/Lc3icOe9oHQC/XlfBDo30DR5/N63dkQ7u80k?=
 =?us-ascii?Q?VE/LESBL0SU5o3QY9Hs7d4wC9EWPuYpmj4u7B55H46kLj8ruIbGz19IP0/cH?=
 =?us-ascii?Q?5FM5IHXiAB9hyctwW+38yRNA35xqIlIpOh/chim1FqhCQ/u9Nt39Bc3DSbiH?=
 =?us-ascii?Q?2+vKVjd1jrGVShX5y0ga9arzjT7T8+u9nS7WnXkK1jhPWGUAHPS/yz+1seD1?=
 =?us-ascii?Q?W3iFiCL7ON7b90QYgdqi99C43OEjxituIhdar4U/ZtJiGCSo5aLuOaZDM+TN?=
 =?us-ascii?Q?i0ZC+Vt8xOdWJ2QcuMBBptspf1hflDhMO3MSdBjQz0/YJuxUqLl0gAY5REC2?=
 =?us-ascii?Q?rVxICKvTKaGUO7hOntIcgDMYWQ5iUy2DRf1yuufVZ8YglhtZ2E4fUwZySwZn?=
 =?us-ascii?Q?UaW5KhrnGK/WSHP7mMq0afeLTnJf5mCpvowy4Qus3EDlACZBaPGAkCH9SOEo?=
 =?us-ascii?Q?wPM+Oj/EuUsA3G8+u7GmPK47cpXHoe6p9ag7stPwTDIJlTjTvp5/oaVjtKq/?=
 =?us-ascii?Q?psOVXu3eo26oJ+1rbjfphZ0e/DKbYv0+7G+Q0LpaMrUjn9ZGFNcE0dV9INnT?=
 =?us-ascii?Q?FgBmRMoQrlCx9G0/glh6ues2NbG2xNrI6HRusWJIxATIN/RZahmlPs2T+4f2?=
 =?us-ascii?Q?FKpm4TV18UhfSEQ0D4+i5gEqTKqrJ8uROYw/DCPVUXRXhnBe3rAeplthzXjc?=
 =?us-ascii?Q?T8SVcmFNaFPgFPScPNiP0g5w9WicK9M2bk134kXyhyrvMFHwLIU/HnMN84OX?=
 =?us-ascii?Q?9WEm3yUVL76HczfbQYfhIamllzfv7xFD46m67Krpsfi7IXTmpNroyh5q4G4Q?=
 =?us-ascii?Q?A4Mg0b7IJrB06yHUNfalsqSGEEZVVxU77uNCyK8Sj4LeLXDXYuvLTl5095wJ?=
 =?us-ascii?Q?Y3v0xciGYqwFoEd+e1dWU8HlzcJaKkJgHjK4O2VgCn5xzlW8bxs4xvvD+fXD?=
 =?us-ascii?Q?amv1otOt/W1QaXp9JEBBxfoTYG0pdPKZ/Pk9OBzLsO+ncpvYaaXv/hwGkF4t?=
 =?us-ascii?Q?4WuVLX/gQI5HtCKG6fQF7I6Lhd4dtQ6IS5XqTVHMUoJk32dRvHpPUhYiN8UT?=
 =?us-ascii?Q?4iBdkh4FixHloAfyw16Jz670LfM9PuYEyKAGN2lAO1PUzFILsP5oneaeOp++?=
 =?us-ascii?Q?cUHt4ebyx3UjzohDt/7bh3LrRaC0xHiVx4N7IvWMVq8SqCNNSAV0O3X13fSa?=
 =?us-ascii?Q?WhcD0+zaX/6U+cwbq5Yl97oZDmtLAPvzpTOJyKg2dXRF/Ki1rlfCtQT3ANTu?=
 =?us-ascii?Q?ibF1DgChJJ+oTqE3z/gLrB5zYnu+lzSgjYBjv4QU0vCvm232UhXbaBcSsrms?=
 =?us-ascii?Q?G4eT8VWI3Hos+IVXnZpvV4gYadVYby8n7Wc0Qz7+?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7446b316-66d3-47b7-dee4-08da621e8af0
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2022 02:47:34.8272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tsQkad3T7kvH4N0k71+9KOr6fAKZAXOAXC7sOlHRhKe6WH8g6lmUBu9QgZoNAWJmhuASXmKlyxOwR7dfOa1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2905
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Channel events adopt the newly centralized 'linux,code' property;
slider events should too.

Fixes: 8ac14d2c2d81 ("dt-bindings: input: Centralize 'linux,code' definition")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index aa41fa3bde7a..02e605fac408 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -566,14 +566,13 @@ patternProperties:
     patternProperties:
       "^event-(press|tap|(swipe|flick)-(pos|neg))$":
         type: object
+        $ref: input.yaml#
         description:
           Represents a press or gesture (IQS7222A only) event reported by
           the slider.
 
         properties:
-          linux,code:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            description: Numeric key code associated with the event.
+          linux,code: true
 
           azoteq,gesture-max-ms:
             multipleOf: 4
-- 
2.25.1

