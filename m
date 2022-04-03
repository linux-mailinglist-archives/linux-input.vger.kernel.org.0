Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F454F0CBE
	for <lists+linux-input@lfdr.de>; Mon,  4 Apr 2022 00:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376535AbiDCWTY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Apr 2022 18:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376527AbiDCWTW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Apr 2022 18:19:22 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2078.outbound.protection.outlook.com [40.107.96.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E1939832;
        Sun,  3 Apr 2022 15:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYX4zchT//j+BCo/xa7WUSK9KGZ9pu6/iH3jK3LscAY9w7omm++b0/xf54bt2DbftJ0gUI/OjUmNgUPlydBTfsGxDCr/Y+mdN0ZDKF7rQrFc4ga1aP5J7i4ZHS9Dm4mi3qX/VDAoYttiVqdLs6GQnCVe4zuv2Q1k/tSTxsZfuwvZOODJ9dkFr+eiLUrjI+yJFBOYSCGwPDaTj9hpgZ4ON39pz3LokdJ6S3FO8sJVGlo42RrTuNrCjrMHfUjBWgixXHZkDUIcmVvsCccgiMivY0EZ/wj4MBSqaqqYr3/k/mGqM43EKLUFv+oxCSudXTqSQbeNpjIYbGD2a54Y7daw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTZahbNgOKqs9IjWOAaxpk0xnRadMYqF7cMje3SK4/o=;
 b=Gh0beB1U4mhGjWgKWNNmBTFXh4RoYDQXBIjBLbLRe7xygL0eagAysjfV+mQMZ94tHJJW7VxKkzSI3TWYH/XC/U/luEa17eVBs49xSsvHiZPb90XlMlgnW7MXE7cBJfalYeUWdZSdVwAWWLTgLkcyqet+HOqOV9sra4eA1MqJ2vwU48jiWkMZAT9MlUD2Cqhd51TfQUMj31h/Djs62KYCP4p6t6JGOelY7uS3grVFx4M4MyQ8Bfplr3cfkrH5SiT+ul/RZTyvex3eSBu5tyTNn3t5LnqoZNPVE2FhBcVWz22dRUbUaTjgTjaQj2E2/hy9MUl/39GuLuYQLXP3ImggkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTZahbNgOKqs9IjWOAaxpk0xnRadMYqF7cMje3SK4/o=;
 b=B5ze+SliuWnwzprq5gxbmrY06Q76Qn+h6FUUo9pjl1B4DV0qsMaMaw1lRe0jOoeuTPJswceymdNREgrEnUC+OyDul+ipWQMhSCTPNXQGUcmXk4UdZb5EM3itKlhLMl0DUv5WmaRtqmDaBDB+ZTBo0dDljt79E4+trvEMm9bTbSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by CY4PR0801MB3796.namprd08.prod.outlook.com (2603:10b6:910:8f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Sun, 3 Apr
 2022 22:17:21 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::a007:fd2d:e5a6:8591]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::a007:fd2d:e5a6:8591%3]) with mapi id 15.20.5123.031; Sun, 3 Apr 2022
 22:17:21 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 0/2] Add support for Azoteq IQS7222A/B/C
Date:   Sun,  3 Apr 2022 17:16:57 -0500
Message-Id: <20220403221659.865997-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:6e::27) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 524f0348-d9d0-4def-cf28-08da15bfb8a7
X-MS-TrafficTypeDiagnostic: CY4PR0801MB3796:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0801MB3796046539A106041B2C7192D3E29@CY4PR0801MB3796.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gga/VyfD4u2alqrLesAK+gkxOc2nMlR383tCn3MpnuXTiH8KZBYSRI0rGkhRUnmTw7yAuewBl5W1CwZQUy1kovYsknxYr9FTFMF9DoULu5Kh69pazWL5WTcYTv/SUtJj6HqPBGzZIA+AwJZ2jKSh8f+ojayukoMgleiqx/U8iJf+CyK8fpPmDCjooX5ZnyED0ORo65V47h0oKB2Q61fwR7dywdbjKWkHszTVRyc2rgWVuYTapvNs1IH0wCIc8Y3aqfeXuuG/u8FNVhf7An+Pzdw5pKHjewaTurGf93JpFhaXnkojIW70+A5/J2Ceh46bgjhAguGbx8zN4/QhuzM0B5O41QKC08CM8gtNEWoIdIAD8t0kAl3wv4YFDQThtMZ3hu3cS7jv19grKtIhDasRQ4+i9hW+/6GLugZQ0iv7nYo4zK79EqJ2s6z9wKR69KzDohVml+t4iVPT2ZA434FrldaLDymKuZa/T2wyElBnF/9Q9fWEqAzIyfE6QU4d9SzPviBcqx6hk7rydCrYjw5deuUKpktfVsQ/J9DU1vjAx9ZvVh0vVHbsXsRGDX5WNs+Lvtdkb7t6E5v7scV9ORF6BqNqqxjn8ZX40Po/1nin4W6vk9L3ZbHxDgUwVlYiy750flA8vyM8fhv1+HflCQB3EDGgVtfpTyvYhNvdYWHhW7OMvTRnRpVltsjBarUXE7uNZeU2zde5evCI1SnKDPsfqcD3RfUmEHzT3AnvL8uFe339PbX8VUdeKnciMlQOQr+MAjw0WjQceaLFcC2HjVFfbYhaa15YTzC9hetLCRk9ygAbqVEvuFB4FL89VktVl7aF3eWJBGCFnJ8ECVv3Ir6yaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(396003)(376002)(39830400003)(366004)(346002)(26005)(186003)(86362001)(52116002)(6506007)(2906002)(8936002)(316002)(966005)(6666004)(6486002)(5660300002)(38350700002)(38100700002)(83380400001)(6512007)(1076003)(107886003)(508600001)(66476007)(36756003)(66556008)(2616005)(66946007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KU5y2LQeI4AtB51N70LVCCPpWTgtXoZlSPS+EoIIlEwqgyiazQLufmivxVXq?=
 =?us-ascii?Q?QsxivQOf8wG0RoVW5+lsh4S5SFDgFPihA5876xIQfDsw6Ey+bJvxindqSvqJ?=
 =?us-ascii?Q?90bjeWMbIuDMz2KZrb7ikHk/g8FDbG3xcmq8CjdRWE2oQ4teWRx/CzeqyghP?=
 =?us-ascii?Q?tVY5mjTmx2LH+A/esgSmBHXTaKGGf9Rayu8V2r36GDPuDi3hu6OZIPo1CcgG?=
 =?us-ascii?Q?eF/aRbC4BLhzOWAzU41QKPHnNsezo6o7AkYzl+HyiuRvkTSV0ejGevCdy4dw?=
 =?us-ascii?Q?XyPacu2ucvaij2N+hFukGX5pm2jw4WWf4hBCIz7wOZypPkJCtWvwuAcnrnMw?=
 =?us-ascii?Q?xRfTGg9XS/HzAcnzZwx7UlZzyVY9Bd+wXzwXf512jdILge/ojzZTopmJn1NO?=
 =?us-ascii?Q?qbb0PFqbvangm/ov4pNXMPBN1G1QK91fsa5qbzFaT0C+I7n0QnA3brqOT1tw?=
 =?us-ascii?Q?ELR2hXgejcPlSG68Mluc6+R8vllGS9BfGmiu4fqWveAVjGdwo33rKxbp4418?=
 =?us-ascii?Q?3PaD6fS5bRgDUmilFYlJNmhB/IFLpssjiw5oMijXctFHlEgv9EhdqQEt4Lha?=
 =?us-ascii?Q?goHZcMcWKf+O5p7FcoKqI81/IROpKl92qsPNGCcxJvLBwsxV1qZrRHBGSuoj?=
 =?us-ascii?Q?LyfXGAtuVbq+SIl8/pKD8IrPaybTod4oXpFo4SbEbI5dLcKoKRxNcHwj0Y4d?=
 =?us-ascii?Q?2IKEqEOcABNyF89Y95AXPAS9fRlm6AwHkEOON2mmLELIaYW3IgNWFiv4i4BY?=
 =?us-ascii?Q?LU2PTNXFf9hVGbw6+4lrUmLoAFIlHKt1hIR8JwMC+xBtAKDysuc1PG1hcI//?=
 =?us-ascii?Q?WxrBwihMzZfPlqPgbWXUNXikGy5BxhOQyI026+YL5si6S9e4JvxSBgG/bGfj?=
 =?us-ascii?Q?uAORFzSFgEGLInJM3pOYZMudnl5y3gDxfVP04WuOMb2Zi1zQ1BEYDTnTBJk1?=
 =?us-ascii?Q?DfBbbRFDIxKMlei7q9+UxMpO+U7YVkxPTsv94zh0M3UjiJkOuZdDSJfMNyeu?=
 =?us-ascii?Q?ZdmZYJVrRJlsXn2suEHlKA79bRABdyux6V6ccQjTR9RN1hL/15Qn5JcdAtvn?=
 =?us-ascii?Q?an4W8yf4eGyRf8YTmBWnBtB8FUUf3lORa0jNN/cFJSlpuZqXqDuL6vGeGG2p?=
 =?us-ascii?Q?VEEeZaWxUZXbQ2jOSKrE0njDxTCbj1cjNSTTOPaond1cAKqSDt1zsxValWP8?=
 =?us-ascii?Q?6CmA8CXJXQx7Ljoa0pyWni+MxtId2DWv7H+uaAo3cwQhoKnII9a7+5/GueS6?=
 =?us-ascii?Q?960Kl59AM3cgiGcicF0jNI/DzShHVipBxsiBGIDaD0Wp8Tyk2oaeY1yzizCu?=
 =?us-ascii?Q?HL4rPYvckKwYv8E6Q/PHWuKlnL+QPwPyuWQhIA9QN7fkwTCTB5tOGD0hYVHG?=
 =?us-ascii?Q?Yrv3lINpEdWDY/oOv6HuNzOK+Yjs+QQX6fMQ5PSUCj6VNQOykdBZnjqBEE5N?=
 =?us-ascii?Q?DrDeBXISom7ePFsoUgqJi1UdknkJqAP81fShpNCWTX9h7meJNc8P76FnkXEA?=
 =?us-ascii?Q?g3R2rcyLRI7yyxCHFj5E446yohL2cON7mhv6WTyTPrgKyiBgjAkslfI2eKuc?=
 =?us-ascii?Q?/ee9vGWTXkKQG91bu4KUuV++LbpYgANClx+HOjO7nKoYUcv3P8Q7ZkFTrRbF?=
 =?us-ascii?Q?WF95FxKKmJsMceeOnmtaK5XQ5hY6bQ5D6fjATicW56jWEdyetJOHGRKQD5BD?=
 =?us-ascii?Q?ky3c7fj+ZYnTEcvEbFPnleC98vZR0l4Me/o4zGUnkfy5z+Xdf5T3d0WXZSoJ?=
 =?us-ascii?Q?vaxx9C/9CQ=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524f0348-d9d0-4def-cf28-08da15bfb8a7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2022 22:17:20.8694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfnQtOQbo/QO6/cjMuU1pqP1sV2BxslZB7jO9W9zcLIvq+MvU6y0t5z2O+STjF+smb54v9choRhmQnupsqowug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0801MB3796
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for the Azoteq IQS7222A, IQS7222B and
IQS7222C capacitive touch controllers. This new family of devices is
similar to the IQS269A, a key difference being the delineation between
conversion cycles and sensing channels.

A cycle represents the charge transfer mechanism shared by up to two
channels. Channels may represent keys or switches and have two levels
of detection (proximity and touch).

Each device has its own unique features including channel count, slider
or wheel support, and Hall-effect sensing. The driver is demonstrated
with each device in the following videos:

IQS7222A: https://youtu.be/SyHhe9pSr8c
IQS7222B: https://youtu.be/R9Yd8yFPmN8
IQS7222C: https://youtu.be/-ahg52Co5zo

Like the IQS269A and its close cousin IQS626A, the IQS7222A/B/C are
highly configurable and follow the same general structure in terms of
how their bindings are represented.

Jeff LaBundy (2):
  dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
  Input: add support for Azoteq IQS7222A/B/C

 .../bindings/input/azoteq,iqs7222.yaml        |  960 +++++++
 drivers/input/misc/Kconfig                    |   10 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/iqs7222.c                  | 2445 +++++++++++++++++
 4 files changed, 3416 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
 create mode 100644 drivers/input/misc/iqs7222.c

-- 
2.25.1

