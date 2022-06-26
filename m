Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B605655AFEA
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiFZHZR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233862AbiFZHZP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:25:15 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D698810572;
        Sun, 26 Jun 2022 00:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNnhOL7t/PFBpjRJakuh84iFOgJeWG5tJdJib49hT/ROBEOJM+n5ilsrGHD4UpPMcoHxHpwx4HVcWRo0nb6aLjYTJQHzfo/x1fDk7IY0jowEYLAygNI0byQEPhHgNl83V4lFBKsFBIgqDhyiLCmvatoXl3sXWtMkachMGofViy+Y6Uin4SP+F0JDoz4LUgC01SKZxvlzJIRuFzJ+jMUzRUwOlgE32l8bUIldn4b12ulLknaKTrDXIwzvUC6wrLKBHzKAEuMLwRPT5xYqxavJEClzqhVcZ77330LkZ22oZYZQp5wL1wAzM2FWNw+rc3dX6mxbivPEsS9gl21N43JyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBOBAJ5GS8Z+aS5SZekg0OjKkAUNy0wdwFcPBDkc8SE=;
 b=UyGG+xGQwmf157zYqSYvpCX/0xg3r3M27KH/VeNbgYi0OU6YPGdndKu2IjJl5FqCh5ZTE8AAjzDfjTbd81bgXBXFvPkDsTTxaI9oNy9jGUKaWNcGOwUG9Iqum/BEUGbFAOJqVQV5qtSx+7xl3tAZmVym74JG2iSMnfcK2zlh6l0yOnzaQlzu9tzDfQFr2pC1tKbz044PviR+AfV2pXzMOtQyslZRpOhWRs6dP+W79z2ZobJqv9XxTJ8F3UX2zVG8NuaKeI0uwgCg7Rwbzj3gNb+xfPN2IznG1IBFetOmJUxtqXXp8IbgMIHb6QP0j84yGqNUE6bLK1J4CSjg8uVTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBOBAJ5GS8Z+aS5SZekg0OjKkAUNy0wdwFcPBDkc8SE=;
 b=CsdJ19vP/PfbEjDNAGC3ZRxgOmIqYhMe95fHdPl2V8Ziilfrc7EWb/k3Av8Smf8O8JnMqGRzTaQXqA60bLZ/L9JfCh93CIOrKJQ/NSlcYBZHiFEHp0cMyR5KDNZH7UpoPDYQVG4N3Sr163M49Fwb+j5oJ7JGY/8YH3UZtJAv55g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:25:13 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:25:13 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 8/9] dt-bindings: input: iqs7222: Correct bottom speed step size
Date:   Sun, 26 Jun 2022 02:24:11 -0500
Message-Id: <20220626072412.475211-9-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220626072412.475211-1-jeff@labundy.com>
References: <20220626072412.475211-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89c367c0-63d4-4b1a-60b4-08da5745028f
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCcpHttSh+PTN7wxZgxVvNFHna8feDb0sM+MrzNLYE1hh0kSYvFf6g8Qj6P5ehNoRGOcgm/kRzJKYv39s7hdGp0DmE3+4xlCpy3QVuYYGE9VF/fTMz1wkxDErKKGOrSyFXB0bZoIJDc3rfhEJz9BZvbibRE5eS4W7h0BnDShuQGzYQGFlMFPmgjoqFaFs7rqr7xi3g1oqfBC2uUjPb5t8rpPcuRAs9GFiNrPmetmc9Tn2WX3NxyVAfvJ53XsVV0wuiQFe2yTgzZUTH26DnwcMvUF20ms8r1D2hv8+BR0gSPl626TSh/5SEP7efvtNtsEkl5VoMtnxwuwf23R8sLIUMrmMhNwREFECamMaFuFdQOi62lASqN+sbU7lNcnDhXukpz7dIRWLorJjjSoTY0NGofcZChSXJRTWhI92eAqmvnaYzmqC7d5I+fz4+TD2UE2ZIbF0HJzOu1DPOl5HP3AI3OmiiCmd0hBdf82oe39joSrY3fH1JDlIarFXXwdV9cElunbZ9pcyuZ+byXMnANlH01XakbyLgtOawSnpDahhyUBygtcJ6y2A8rUUqBgVHauMLGJI/NvEkufB6cLRjOK03hlx0Zb6BCkTw/HKpQ7nDQrepHTQPRKkKlgIfq3gxt4ZjdmE+8MxjaeS0Bpm7e/sV71kMgSWjKcEV6TRLa0JgbLqMcZK2v1GyKdRr51qj4GdUDJ/oWojbOpK1g3ngk03Nwd6CMFtc8fjgrGvXtJ2iceBHnn++M7VFoCx2VxlzmqqrXTWbMwZbhbAB85n0HCPhKc5xG1OaeeFCKHunLe1y4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(4744005)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0JAc86Rd5qqxnm4sUH7Svh2ItzoX+IQ5yhP2ksR6Bvdgi6+8+LtGA/EVX6PN?=
 =?us-ascii?Q?ePhK2VVR+tpgJgBWC4aHpJsEyDprPfFZWyqrMM0hdaPO/pkdyy5htyrY/gvQ?=
 =?us-ascii?Q?O7jNFR7dkeiLCdaNKRoHTpSo5mt6+S/hYsoMNDWIozcqFYdK86SWchKIyhn5?=
 =?us-ascii?Q?zBVyT554ztm2fBSQ34u+oKLZjJ5SPI8xxPk/Fo9/NI+E2s0AVkAItPAHV17P?=
 =?us-ascii?Q?WsduMUbEdXVs3P7sdAGY5v8qPNeQA14436joMtdj8M5Dn28FWRWmlfh4oemP?=
 =?us-ascii?Q?HGVrcZtj6Iu/yZfBJmFCy8QeZTLHWewzT+l91bbfjdyQG4fCHMq0aBfxQRui?=
 =?us-ascii?Q?Rwdfo/ZY368Uj/EG0bULQmlf5tXHYc+DCpr/8Hu8pdj6VrERT4Z1+OlQMck1?=
 =?us-ascii?Q?+phuWWKGQU63X16hpj3ulZq8iSl9Sm8+rjIhXFXZAQGd22CIaS6xuEzEpLNN?=
 =?us-ascii?Q?ahM08rIBqSzhOeIWi7+3Ls5IY9qt7+xDnQ72E61w874umkNvu1B9EEODSkPG?=
 =?us-ascii?Q?SdyzrEG3c+mlTtPSNvlQas789eHfT2zAz8Mp4iFA26in8JMDRuCIIDBU69z+?=
 =?us-ascii?Q?fTdwp3uwCSe1h84g6KMNtYJ0hAOumdrCSZ9a6R5IQbSGMC2Ykmfi1e5wTqs+?=
 =?us-ascii?Q?4bmfDJ3Hl7buY/d/uFdELvwfItkmXyYfkzX/4EpnCo0puWmUNHYacTanbI1+?=
 =?us-ascii?Q?RsYh1VuZtc1BU/Ad6u8U5SsuFLbCJgKm19U1XtV0q2l8cMS9APEtEujjIxqq?=
 =?us-ascii?Q?CzNtzfKhC8GSgVdMaoxkiRexQpGKuzAfP0fMgMsiYoG5Ej7p1iYz6AXOgQCt?=
 =?us-ascii?Q?zihlraHKpG06HXkG0zdJpTJsFE1wCGc8kfkdyCtz5bEZSqrW1C6pFr8L773X?=
 =?us-ascii?Q?M41Onpm4Qf6y3ARwYNXhfrALbfQsYvDL950jLIFyXq5i5ffMsbZXgmUO1G/G?=
 =?us-ascii?Q?adU/mNE/0M+kPnWYluZvJoTqZ3w3BmiMoMhDa/cQrPi/xoa6q9oG+0V+O6f4?=
 =?us-ascii?Q?XzAqVa1z5ONieRyDkK+KKsvHUmpsqYWfWGhNHQc+k/x0gqpedk/FOMQo3e4g?=
 =?us-ascii?Q?u/iSt9o2Gxar2dV/SxR5nwLGAZlIHR6Fgj5pfn23JJx8RGBVyiBgRQ8i4qi+?=
 =?us-ascii?Q?wsk1R04bcNvO75RXEMadT1aChtfwtJtc1CQKGfyucQcGRJByl19q2TskuM0P?=
 =?us-ascii?Q?ZPKt+6Iffs5Cc4SKCB1acxSAQdZHLUbpNmqfG003OAU4pg//2Hjw+enCRogs?=
 =?us-ascii?Q?AEABSBZTmSzE5xBlgkN5+fSsCKhr4qecMCPMin75oKFHAyNilHTb1QBdt1fk?=
 =?us-ascii?Q?k3HRTt6Ab7xHmfbbjjUViZMMsFrjFM29Z+kxwfjsRARfmF8t8ypVBXlVAEy0?=
 =?us-ascii?Q?qE1SO8uvtLNZOjh/NNYI+snOwgU44GgVu+gUEnyGXbzeVfcK5lZyabzOQ2fP?=
 =?us-ascii?Q?q6LJAvvlmvEAued6aVrJ7oA43J5IPeaJvENu05/bUOWXpexntehqqN9zfxjm?=
 =?us-ascii?Q?vCoElMXjk6jaIr/WVsANq0bHsx7A0BVnkB7GGJAbz8BLz8zaseB+bRU9YS8A?=
 =?us-ascii?Q?5YvDyb4wS1Jupd1KZhDrAX8v5avTvP/9azOLif7e?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c367c0-63d4-4b1a-60b4-08da5745028f
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:25:13.4750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ru/7RUG37kzkWRF+pXj6yht/+zqT2XjdEg/h52oUM/Fetw6bCVvgA79kAy2psvDAsFziu98Sqo/DWbroOUAjdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The bottom speed property is specified in steps of 1, not 4.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 6180f7ee2284..c9c3a1e9bcae 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -533,9 +533,8 @@ patternProperties:
 
       azoteq,bottom-speed:
         $ref: /schemas/types.yaml#/definitions/uint32
-        multipleOf: 4
         minimum: 0
-        maximum: 1020
+        maximum: 255
         description:
           Specifies the speed of movement after which coordinate filtering is
           linearly reduced.
-- 
2.25.1

