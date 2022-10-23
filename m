Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB3C609094
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiJWA43 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJWA42 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:56:28 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B416F243;
        Sat, 22 Oct 2022 17:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmZwvesRQNrol+PdKnFxENMQ2zdP+e03HSgZK/Fdi70OBsw44z0iQs4GwX5412+IvHumNzS24aqVaom8esx5QFb+mN3Q+ds2UMqZUg1/fkuZFgKzxBYrOVM3SiMqgI3MTmOCIlmhQ9P/PCzyt+uDQlgi3kU1ypFdja3PPMv2+wwfNLU9+9cQQAz0DDow189asnJ0jWi8F/PMC6BAZZncukmnUOsCFUCt1ndFwW8P+w5aYGfWDd7jXcT20jUy8TsyU0YL/yrQ+ZQpi2tkGdU2Qb9C90NqEFy8X+GGDnOHH/fuNdGxCWJKGlfKxtYNTUOB0kuLCe/wr9QTOUfyyilp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0ZocgFFw2B2Fw/swof05fVIq40q/ekasECq3+VYjiQ=;
 b=cxq0thyH85VxUJNF4L6iTEsMT92nIhY9h051pDfSpsVJhmC38fwcE2gmjLvbKCXiTMYZcwqNRIKPt71+qfuPMgbQqYaHddIgMggQimhJSDBrjK9lTG7TAdhdmtDekbdCksvKNe+5hAqiq5oLD/qn9BXS4yyh9297Hj8GrPjIZ3hdUAtOddps6GJVnStONNhaeGuZX4qwgagPSGyaVqhidxhAN1ovy2dFtM0L46kGHq4lsPnf5BOGif9kn/mT0GhQyLNFYKm68ezAY0Q9/Uhc1GyzDDkUi3MQrKYc92BiuWa8DuQnp2o5e4sdn3jCCm1xsuE3D7vujAX/7d4HGJpbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0ZocgFFw2B2Fw/swof05fVIq40q/ekasECq3+VYjiQ=;
 b=ZhmqrrsnWj8klzxv7e+1LRi8snP89/fuZ+OqO/HtU4a4yYXWqfZcHVSHeU1rDEucXb5Su9JWzM+cAQHiRpdR44aXyqqkxQYpZrWhCPNlnrEpzf7inY/HbTwhtg7Ra+2CPQPjpuAZR3O4cN0otXzeITvi7unrV5ms9IYwdIAIDGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:56:26 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:56:26 +0000
Date:   Sat, 22 Oct 2022 19:56:24 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 2/7] dt-bindings: input: iqs7222: Reduce 'linux,code' to
 optional
Message-ID: <Y1SROIrrC1LwX0Sd@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: Y1SQ2t6yUvdaIQPG@nixie71
References: Y1SQ2t6yUvdaIQPG@nixie71
X-ClientProxiedBy: DM6PR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:5:177::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b723ec-55a8-4ddb-5de2-08dab4916981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWjSINy5nZH2981XP4D/yy10VWYm2QMx+w1XHJAl72dfj4kZAAq+/vS6P9vwfnhCq6K+Chi012VBJLicpkAIs2hTCxclj1cfFq16ObSeGtbCuE7DSB8s3BJ9rHhU3IyduKGx+93gNDwV26je7HxMnQFPhfVG8OxHypHIRu3oxsb55lMMigDyOEUKCBr+ACZy9h5d2H1xtT31gbuitXPUmBhFGmHcCIaHO7dFNzgMl+QjjPLrdmNiWWpKB0URvjxVXcK/9r1XEPzCRSFX8Ot9fkHkg6WGiZy7Ic1jY427Fkg0wAdg4vlhxfGJhUpQOmNGzSuZ2vdGSuv11bL0B7QsS3LHqg4CwyEvRdJwTcYrGaIWofayEbEGE06SI82NQfwjSwKLVVHiL7LNriMzCrkTuCX5esnXiQvUIdXVjH76lxD8DArXeY947CndND05eTaw2d7eJ6+uOUAe+qT/2tmzAVgjFOkCHwBF5OnJq+wMEE9bxxZAgIwUHP1gtEBPBjQqE0MknnmUsY0zxWexY+D9lmlTjGvnmHnOeSP6gQOTXYhYzC7rSSreQYf5yLN3Y14g1Vw6iV2VuOSJ+Qnojo4bgUezAxBGo2SKityRFUUsM1fyUdC01R8UK++tjQaAtZD/UoFmXUdUYK/1H4ZiYwVwxmemZNx5BUdpt6WwoeIcZLuXq4oB66vwpTdx8Mkja+BlEZ6MA1zSSYtEcaD1eYj4Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(2906002)(38100700002)(186003)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?veGZPDkhQI1OSHjgUpiI9A19l8bNsI9GpzfOry2nCzS7U6C5VmNc6VWV9o64?=
 =?us-ascii?Q?eyn9ghO1Wjvwks5qmrQOfglZdZy14Dng8uxSymdxiH7+ne+EV8PfDL5yms2E?=
 =?us-ascii?Q?idIZNws/JOmxsJKstIAHQjYtsZ48sQJrjVYRfd5KofbG8fvGCqBW+fVKlw/L?=
 =?us-ascii?Q?d0hg/rj+lBu3a1DWAKGW4l4tAplBvNW3p600UcywhnnaLHJRXfS6tAldYSxE?=
 =?us-ascii?Q?Kb1l4DirVl5NZ/Y+fF2QPsm2mA38mBvx8rDuBNWIv1SFYjZ1FsXaRcYnQBII?=
 =?us-ascii?Q?MSw8qydG4hJopH95k7QL9JvEw6ltj2FyZdBhkc1OnxKyXLgcri6Xbg6DyiCZ?=
 =?us-ascii?Q?0Ussh9iiX/AOtcUp028JhNJqem0A8P94/6KujapzXnHd6mOBhdR9+lv7tM5V?=
 =?us-ascii?Q?1DFMOfznMgxy91KZ+1KD1lDoMj0B67Uu3Ulpk0DY0U3kXi+lJzslegSh8UE5?=
 =?us-ascii?Q?8rSLPvD6p275tTlJPqx5ybi7J05IaMJOpzqTL1i5uayJ8UYUIUpHCKnyM3sg?=
 =?us-ascii?Q?hsRe6hJ0RneRBxomS92ElqCFn1+vUq8HA8DA3zqJ/Bf9QPXc0IXRG5ZfRrQk?=
 =?us-ascii?Q?pABSw6XJsX9Q/8sngSgo69U+DdkXG1Xg+bD0R1ZLoR5jGhhRUbPFtLO7jlyJ?=
 =?us-ascii?Q?yZ5WcsjbJA7qAQT2cnKCT2Ty7t75ykZMTtCTO6IfFeRp8wi4VkUJIkhmz7Tc?=
 =?us-ascii?Q?8hciqTq7EjQEC20AH0R/IBuyo/dt0zvMN+67I+xx4U9IwhGgKWimNfbL2fJ3?=
 =?us-ascii?Q?LpFpAW4/+210RLbN2vSxFOnCk1kY/oORw4+malTV0qnSPPo6IxBQKM6tUNDG?=
 =?us-ascii?Q?Qm4LIV/2cEoeJfUhEzq+MV6w1vlWgToamqeaoYUjaqCC0maLzjDvDWlruXQ8?=
 =?us-ascii?Q?2Onc4wmzeoSkJkjCzvu6FS1o18/Dmi4iOiA3QdDG0YF8pmiP8j6xDE37WxEk?=
 =?us-ascii?Q?i9iCtNI/HzwKJZzyZmd6yAh5c4ZZlan2R2FsGlI/xwmstal0TKeEoz1qtiW8?=
 =?us-ascii?Q?ZeGdswoFzdznB73rZQtHZyFikxg6+CxOAx3N/EKz4ukx4szPX6KuoilYZSaW?=
 =?us-ascii?Q?7u6Pbwtu+2cctKaonYiFr+a7G6ZouSstAimt6CkKevLEOpOZroPrCeT0PXKU?=
 =?us-ascii?Q?uTI8T8Wk9wcI6aMDnmGtUX4J5Sfa1G/f45E4MY4RB942GgYH42yKfigsfGSd?=
 =?us-ascii?Q?QW9F12ETkWW5kwUXsr6Q2Q/8dVgJ3KkzbUTmT3Q3Y+y3WtPeb0hRXHeOOGM7?=
 =?us-ascii?Q?MoLfw0bwJ5JYgabcaxW8Eu4hrHJNFZ7HPPvf0Gz3l/ybuuEzM7x0cgZrWNd3?=
 =?us-ascii?Q?BWO+jUvRmbTbt41e88G+UAYB5EsxRZgorM5HrMIzlmTKkRPovEcpcTS54ODf?=
 =?us-ascii?Q?3ktUoVUfBBl3GlU1wrzNxzJabhL49EohKcNFaEA9irqFcQgi3orQgJqcTUub?=
 =?us-ascii?Q?mYNIoWu9R7YRmGADTKnOdaCqNpWVsrlpfS1XGad5bA9hUbRIQNa3iaDjO3AP?=
 =?us-ascii?Q?IbocamTCS92SsFUzQG+5+fk5aPSR+PmCtctLAloZ4p772U7ICJICQqd1vHI8?=
 =?us-ascii?Q?7B40iRxplCltfmrIbPS1hdZP03HmG0ElbgGlLA++?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b723ec-55a8-4ddb-5de2-08dab4916981
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:56:26.0783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGGUw753FH/d8JU2gIL/mU0a74BgLT5VqDt0JefWANnRLardaoL97obTVoS7CEskTXpksHbVYSphLsSOuu4YdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Following a recent refactor of the driver to properly drop unused
device nodes, the 'linux,code' property is now optional. This can
be useful for applications that define GPIO-mapped events that do
not correspond to any keycode.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
 - Added Reviewed-by

Changes in v2:
 - Updated commit message

 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 02e605fac408..b4eb650dbcb8 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -473,9 +473,6 @@ patternProperties:
               Specifies whether the event is to be interpreted as a key (1)
               or a switch (5).
 
-        required:
-          - linux,code
-
         additionalProperties: false
 
     dependencies:
@@ -620,9 +617,6 @@ patternProperties:
               GPIO, they must all be of the same type (proximity, touch or
               slider gesture).
 
-        required:
-          - linux,code
-
         additionalProperties: false
 
     required:
-- 
2.34.1

