Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7608557221
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbiFWErH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbiFWDyJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:54:09 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568D26439;
        Wed, 22 Jun 2022 20:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGy8rOW0uGBSAgH6BX5DvybVkM+d/REToRm1bkQ5XHeyo+wwQuoRHhVoqB6BaDgWyxzGc32J2FcJAE99G9kvyvpdoZ4hkjGeXI9PCrl6huiJQQkxBjQSdb+OVbcJ5SiNrZ7r649ngV9ePlWrQKnnp+UVg37T5hJ0GZj9K2kxlWnkTpPJCa9Srh++YgYIWqW1Er44OQbRGfvbpJGif5u8hx5sP7sBRSE1P0uY0eAIIyb8kxcfdxPsJJ/ChHpQG7GwyLFYQ7wGVaGl1DSf+A/uAq9ylOlZCq5Gzsn2a4ROYPeNWAhNd7plynTf2eEsokv4RK5sReyZZR5RLAlMbIWy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I21zdh2GSYfEjqyzPr+01/FgikYnPOsZhUOr2AFRhc4=;
 b=mIdMK3sauHUxHw/FKHBz7ZqUqT6DE4T84qc6waGtNMb/QGLpQhTSF6apHsOCf0Ouxxz/GJez+CS7yIS3TPmtCfPO87sEoN6cjxkJCGRFh+J004zEoJehJaZze2Xpc2JB+2dMxoqJyBtisEZLawio0J2fQiuKTPQWpBkdFukcv/xJjv3RhBlxJLB2yhSXyBsZs0eipoeRh3TO0dKpS4aFGgDS8PHcsug1r30hLbWCUcScw1N/4H78EjKhn0CTzPxGkX0J1DJWCWXia/hET8EUk96jNRwVxfAYBeJ35qTFLG9yImegEdDm9QNBJts/3Qc0hrPyR8Cpw8o9H3GA9IwG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I21zdh2GSYfEjqyzPr+01/FgikYnPOsZhUOr2AFRhc4=;
 b=QD8AdIRHgq/jjbekBBXilgWuoghWbvLxWiCCd9dKjP55kVzxOma/1b4yiGD4vYxJFTd8xeuA1cUdmzJxzXki3rKY7n4hUNYtoBcU1o5npIi+KJEAapgP7K3K6Y04jwA+fdpUNG50jIGzM+JEc++Q1UXP4zz6quFqTFRZM2Eo/AQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7766.namprd08.prod.outlook.com
 (2603:10b6:a03:3db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 03:54:07 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:54:07 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 7/7] dt-bindings: input: iqs7222: Correct bottom speed step size
Date:   Wed, 22 Jun 2022 22:53:09 -0500
Message-Id: <20220623035309.39528-8-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2632ac6c-d9d5-47a1-9f20-08da54cc0576
X-MS-TrafficTypeDiagnostic: SJ0PR08MB7766:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR08MB77665C41E89B1EF8F1D00D7DD3B59@SJ0PR08MB7766.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CojT4+MgpAG6yKlnbh7jz+pucnu/S3o5Brq8earZkEuSNifkx78qYludrfI4PKHH98osq7lbsZKOejM7566BRhty1NOAd9/X6q1+Q8JjdMjiw3X05sCjBJS08sBPe/2U1KLbzauaRIwEZXHIjWpvlV32RAmvYFn3LLmlG/DORDuGkcNZ4cA/28w19emxaqjm7jO8s6Ag4iyuhXvLBsHVXN23l/enVLqsLz0GsfiG89fCV1OivqRUBBIK9NFO1Eng4duNagrFU0kKPix27+KoZFaRVyxD02X2d36Ng0AJuTujrnyXl6A8ZSiNkO3/CeQTNn3GCSOHDVgxgYkKBNJuQ5HxLkBpyHItdBO9qUWqm6CHE+Uml8C8Gqsng486yUT3eaN9ipPfaWk1V6WrAZCqHZDrqNsVoNG1Gu95Zu9euu9LxXbyH0y2Wlazh8o42EoAxnjYJazaa7gkNT7n6oOiNcze3+ZAR39fI4Prb4y+FIg4ErjKwHGpbSaY/PauGEdWYIBktzgwf9CJ3IgAq6taEzNoWwoN4x6C3aRj/DlI/UI6EfRB463IQpQm0vgqOPHJl8Qa4ahtFXdh2LZmO6OgJ5BheUGu7f/BX0vVDO9l9nbu00oBz6xO/jzyU31sqqa2SwbnK7KWXObcZphbBfqtPQ63r+oOeCRxkIdi7FHVt2eP4nEoGrFCJFxIippp963ZYaeyL65qM9f5IEviagflJg6/epgoDeO/eG6cjRLqYQuuR1TlSpn2Ix9VCWWd/i7X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39830400003)(376002)(52116002)(26005)(6506007)(107886003)(38350700002)(36756003)(186003)(5660300002)(2906002)(1076003)(83380400001)(41300700001)(38100700002)(66946007)(2616005)(6512007)(86362001)(4326008)(8676002)(66556008)(8936002)(4744005)(316002)(66476007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KyNA9MWshKRMDCCKmlFU5LG23J8E8GRF+GUXE3kUDrwEYqp43boQ2EYRa9e+?=
 =?us-ascii?Q?AIvubX9D0GAm5NMy2VyGC23820OXKGzox8VvFsf5x+R2JUf3K1qKd0qqXCps?=
 =?us-ascii?Q?KQDY8NONmuJqvcUXGYQOl8P3IJqV8BZOnO6Sn6P4McKvLgCI3AEjcrm9R8C+?=
 =?us-ascii?Q?otHL3lxemrpaXDECizkouAggzS3feRW7s1tOixQA0itoudXChLo5IijDKwvl?=
 =?us-ascii?Q?FvskP5Rozkkqt9mQbf0e+MDs8dIJPppdFi/2YNn0r9A96B68Ow0yhxGLqPVF?=
 =?us-ascii?Q?2pfkXyrTGqCxBUqm85DzxSLUOpZyw0uIy1yjymcuZp+C0JY/pQZSOP/ctmkw?=
 =?us-ascii?Q?cxKq8PUVMXLH1VrztjznNOIE9eXkxZBSBKrcJ+Tv4mjKpbvsWP3/6XhhyM2n?=
 =?us-ascii?Q?yHmXrOXCxYHIn2xfnOoivbDno6Fi/9DXwD5JWL8VM5cZs4EUm6YUmzLhOWIY?=
 =?us-ascii?Q?qPOJx6aIlqK0ijRs0qujHoDg17s+a9zPFEPeox96cdOrvY9CaxHU8meb17Nw?=
 =?us-ascii?Q?k2/HQQScdGjeqQGXiHQZrGnuNRVT0Khd/l0sGsJsxLsOFYWBF5m5bZgvZNat?=
 =?us-ascii?Q?s0my3Ck97uY9onCYBoJvBjNaoxdkPCvgslXCL1QrO5H2Jzp+dcwmMHpV81i0?=
 =?us-ascii?Q?RtEipguFndjvutqlNFg/OLeAfjCdO+6rqu54deUuPuRbLHqcgwtY2gA4uviB?=
 =?us-ascii?Q?XA6vrIrTTohe/kxOI6geQrz7YKE1vQtZdeiRVxcX1e/02CICO2CZDGkr6EIz?=
 =?us-ascii?Q?d5abrSmILA+hVYKlf/5xHSILS0KipeX5ylwoyKbfR9GkEBKFMunTSxKUckRs?=
 =?us-ascii?Q?i3DbsiT29KVG1whsro9cVUa0mCRkNdwad1aFfbE8s6P7+mhfu8dU4ce4i866?=
 =?us-ascii?Q?pc5gKdMRVcdDOcc4RHkZC4OftyTQ4ScsdUK09TUj3JHNP7WGZXm/f+ebbp26?=
 =?us-ascii?Q?1xIUi5+SuSd/xZvx0srtxIZHicwJC/A0qQeOvwXYN/tyZtJGrPlCvspJRss3?=
 =?us-ascii?Q?eT2GuE86SR6jJdkNzLOIpk67v6LhrZeW9m3/evQ1A+YkRpDy1O3QK684OaQs?=
 =?us-ascii?Q?QyWERjFZt6xKNTbmzpptO3fq9KMc4E5ZMjJQVG3YfWGwcmeEXkqwKnzvMOqA?=
 =?us-ascii?Q?WFLlL1hHdlzU3slgootJopJ9WjddSmop7/IeTPZyhfOuOPzEH0vz4xVh0nj5?=
 =?us-ascii?Q?BbrIVdslmJbtcCWageccrmCcGW7SHCNrxQXSUfl4IgWL2JBL4+zWEp93NXLq?=
 =?us-ascii?Q?STJw+8+9voZxe7yUsnJPYNKKSlnm18MW+zoCXyGWlKGLtBbKWfGlC5C3y5zC?=
 =?us-ascii?Q?uVYM832EpelxA0g4s2nEeZgMP/AwOi7g2KoE4vgrl8MuItDTZcgRSP+p3AAY?=
 =?us-ascii?Q?4il9iSqNPEtbFuMCf3m8CdIOt7vOqrCXrHbn1pB17bTOj2wcp0py2rzzrpKS?=
 =?us-ascii?Q?ralFySMgKrADzAcxQYNS9myJxC/EobIz+6aq1PkDAGHeCjsTFQ7vGxpKTfM9?=
 =?us-ascii?Q?EVQYhLprO5fveGDj2AtMCz9eaMd52cjjh8r7ti7wjHS56oQLCSmyhIj6/Xsg?=
 =?us-ascii?Q?6s+1x5IY2MQw3vKPS1dmVY2IN0dtLXGrJWi6o2IXZ/PFGTLDrCAf2TU9hOa0?=
 =?us-ascii?Q?kpzPSIlxhsY0QWu7+0dFdKBu7+oKJQt1KjklF+KnPCJaVyhsgMm5MLeo5gqB?=
 =?us-ascii?Q?Jp3QLOOMDPsCvLTBxTTML/Tk/JOBaoZc3q+FxxUApbduxYEN7PCh4QENKZPe?=
 =?us-ascii?Q?kKK8WhOMEg=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2632ac6c-d9d5-47a1-9f20-08da54cc0576
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:54:06.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arHpX4oGwtbb8jeHf9sT6LlaWEc1vcwleHQSg/8qOpdTzL34aHWJvMiyAR4AwQITiD8pLbBvPBNNWduHYExZfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7766
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

