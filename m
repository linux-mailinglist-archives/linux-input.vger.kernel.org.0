Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40858609099
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiJWA46 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiJWA45 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:56:57 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F916FC53;
        Sat, 22 Oct 2022 17:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LG/EntL/dh3fZurqQucP9Vg+Lp+TMyILiKrSO0SYMbOXDOr/BKc+NhIplvqzec+F+EMMaZNaENrm+EPDpTCXIdsMtBGESn4z5BikvcjRfvTioTqjc3R2RbAvYBn2L4w1uW5ieNctzPWeuhBnQlBpEoART0ryl/1S72YvlqGRpLidR9ovgd+xYOQyuPffmkH58wcnlGzZPERbxVVuVtN6iRxB03K/IIxySwG84t8AzGCr+SKe9eNXRLvmb3/DGXzsBwkwI8YWtDsc901dzN+dWBBtZoh7M5JCLm5LvoXerMy34TVsUJI4ZCwmMHSt6EnWJPfm3/duZg9Rsrbfp/wPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv7ACRtHxLiqz2slFo425iQreJljEZ1CamuAqvbf7oo=;
 b=SWKHIgnZae5LblvTJ7v15HNiauXCKYHQSE8BpRKUectduDc+XVvv/DIBjBqFxHXZsBWF4eDsk1Pzayp1+XuRJXJYDZNqeLV8wM3uJcotB/5PShknRVtR49064quX49jnqEvH4S2qXo1SNIltxjM9stxZ6qhhbQpeebtHJyJkH5z77/7jl5RPfu1Qvl15ZQbm7FOV/KjITYIO7DE0DCkC7I9Pp4+8HwAXKPEvQI3KvQWRuv3b5/fbEiJN0FaBXaHm28RUZhOKsTH/S4DohDiL58wPY89igfm801486+DyJjzQUl5uimGbi52QCxcHTwfQJqDgls/O0UN6cNv1H6seIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv7ACRtHxLiqz2slFo425iQreJljEZ1CamuAqvbf7oo=;
 b=rm7uqrn6liZkj/Im05EdZ/z4RGTKWK3QpqU5P0yfwOLP2lMdloJhfqDig70UtvH0ZY/N/PITa4iaH+UFO8KCPhaFRUxkRkoO9+DtKnTOwuL7dDButpry3UwsinsO16J76KhewTlXUImtx6HD9SBKexExRbJXDQq3Bku017f3FTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:56:52 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:56:52 +0000
Date:   Sat, 22 Oct 2022 19:56:51 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 4/7] dt-bindings: input: iqs7222: Correct minimum slider
 size
Message-ID: <Y1SRU37t74wRvZv3@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: Y1SQ2t6yUvdaIQPG@nixie71
References: Y1SQ2t6yUvdaIQPG@nixie71
X-ClientProxiedBy: SN6PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:805:106::14) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 78643cfc-c656-45e0-2a30-08dab4917956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wxbz1UasrEmTGXnkSwSIRGeaOppQhMdTpdnavWom+Pw6tkclAK3QQMn1kV8bHIPrL7/NH2S3zp4D+Q9nSWTPx2LQyZGajMckI2eTgnxFjeWdW56BB28rpdVU0Pmyks+fliJL2vUlVcIZ1HtcU0jaj905jmz5rd/fQqkWqq5ncS4KXLcOUjvCenQgDQJqrQYS7lhPAdgw45rqdG2yB+mGrf63nROwj9vBLkzEUOUXjeCkC2Poxmlbq/ZnyNgQLhJglmHwCndtcxOpLHchCWGJXws258aVQ6FtXHy/Fom2Y9sM5EPhaVKdmdrgYKygthUmp4Z1Q6vkuidc7cS0uW8TuKQr79sOiZFBkFpOoYjC8jEKklMYUqGQroj69hOBxW1WOAFY+aBcCwbgbUagsJBM5kIDjBNg7fZZ9BL5mvmhQ19xRFkA0Y3XwMqAdqDeNPXrbFTcu28s2m+eDt1AO4E7GiWmavi1rCBLE6v82L7rAgQibd30Y7Gqxmm+hft2pN61q0026vt9Io7f1Lm/2sXyrkgcP5eFao16U+6UTNtXkxqaE3Se0DtE9nUPjksxbJO9WOdt02tmzXQQKC2u4/GYOew1GnadBSC0VN43AWczJC2PJs4ZUh1kQWnQJgRrNagTmn31DURNItg9FA0vOuNEGkg8kVDna3yRFTsyhWaHxwEfjyn8ia8sTrRxCeD3cVG+6Gds5QSuaPkvf8OjgUEdeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(2906002)(38100700002)(186003)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4A3ZK/qRLr7zvDG9jpYBJl+gTH/t9c1UaKqz+OzMS3Js9QjKbDptr8rXqRC4?=
 =?us-ascii?Q?5F1ks3YRxH/9A6pBmovDJGVEegR1klEm2XX/4C2OwbX7EAbrh2fvM6uniHsC?=
 =?us-ascii?Q?Fi70YLsG0o6wQzKNvYUKvVUQmjRHicAKGZ6n5qeY8rajp0VD+nr3rX0/a9rm?=
 =?us-ascii?Q?8JjjuilzYBQhRV9ktYw/bBQXCZuaE9r09/BuX3x5d4jh661BjtLKprewgQ1l?=
 =?us-ascii?Q?hdDki9bqclgG5lSd0NauX1tWZy0zwMkNpTpHCfHWD7yJUveJ6OYcTAJ4j6F6?=
 =?us-ascii?Q?fhehkaCBaVLWjUo0zo6sWOA4xP5v/kZhfdAuffszvbYVXK9BM6SXe7G8lZn/?=
 =?us-ascii?Q?Uq4MqazYiTqflReh7YDkFz5NO3YMncKwqfUcHIWEz2lLKCC0sHl4y0rKXlXC?=
 =?us-ascii?Q?ce/bFGwB0IlijaNK+zWqx1ZNLuxEyNEMfn6AJyqdLRAm1n9Cs2O0EtwB9JFN?=
 =?us-ascii?Q?JW5y77y0d6SsgFkp3oOVX4hJFBx+u5KhZuC0GDBhVnY+bpyAz5LjMe/0Pmik?=
 =?us-ascii?Q?phuWkTgho8cGRfVCDCEXERpjygAC5MsMf9xTWZ3H7S2wS7qN9wr02jBDbebM?=
 =?us-ascii?Q?ygCl/FZpMGU9LDT/Xi1+ycomitzT67wVs7WDc/WEZsdmLAnlZG5QDVncQBpm?=
 =?us-ascii?Q?W70tC0fJGxueDBvaV+LuA1PTrE8X7gqQuJ0ZX4dX1jv5IWF/eE6zTKaTN0qH?=
 =?us-ascii?Q?+4Nq03axx1uHwwGt7oUrno702zhEpKqUa6N6k/Zm1vFcHVf3b5vDDJRIDagJ?=
 =?us-ascii?Q?GPpcMYJHwa5xvgXoXiWV7L0m0vxfqx41rrRvH8NOhW7vLAlxMmaWAqXtVu9Q?=
 =?us-ascii?Q?rRywyRUz41/zwsr0fX6vxNSi1yyMdIfCkfB0+hwoeros/y60Wrif/KdE2Kum?=
 =?us-ascii?Q?kxie8HsNNcct8sZIL0EmCtQK2ceZs2RTSkoz+aiG8OWETdfUK8IMn4T3t39Z?=
 =?us-ascii?Q?dU1F3zO9kSbeUqQswZHQMkVf6K4K94Qc5EDiyDrkzErvg1X9d2P1Z0Pl6ees?=
 =?us-ascii?Q?WClh0UB+paxO4EbvVulc+RQDb1duHPuScqwDGsSHbO0vT749VMqNK0L8BVWP?=
 =?us-ascii?Q?eOYGQwxv2h3FJL0uUOf+cnrUm3N9Lds2F/No1Ub1joXZ/faSFq6WCru9GlNN?=
 =?us-ascii?Q?Cq6qeGyK0YDYxWjir9qLBg/gkY6RjmnwPxOy9iIr2PFO2DktPFfkvVs+a5DJ?=
 =?us-ascii?Q?ZaGxZR3yllWYpIxhanFDUPdyIS5ftbDR/0K/KtAUt/kfBE1p0XsXC2orbZ91?=
 =?us-ascii?Q?bbWJ5tHSP1ejEYeMk8k5iRf+VbkjksFKGZU6L/X0lkHUpFIxoieMXtvy4G5o?=
 =?us-ascii?Q?Fow8Lu+UeeuXiJdLfsxjBxQynWyvYLt4F+9PNvEl8qg85HghiZuzrPq0mMSt?=
 =?us-ascii?Q?Orif0z7zDg0SxQzK2MaLGdaD7TPeOg4qfodCyjK5C8i1dlr/kLZ1gjGzvlSO?=
 =?us-ascii?Q?/cB9UD2pkeIVPYskV4mOyoOvvg/7atc4BdQKs6zN06V+P2f3X49uHtwtUg6a?=
 =?us-ascii?Q?hNUZ0Tq041an+XXD+hnnLEJsEBm7eCjCDrIiZAbS2KhiP7+uxpxrWjpzm4gK?=
 =?us-ascii?Q?1FsU64X/mDPN1B3r+NXgZhjyU1BtM85Fjl7PYFMh?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78643cfc-c656-45e0-2a30-08dab4917956
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:56:52.6231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOwkoAOrdgAAcZopG1a60x21rgpQ7nKumnnp8TM6gZTJ+OcmEbszmMT0kc1mrXQHSyUEzjUc/MSeU25lrcfUsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
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
Changes in v3:
 - None

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

