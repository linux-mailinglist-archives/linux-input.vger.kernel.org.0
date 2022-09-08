Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82CA5B1E5F
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbiIHNQ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiIHNQv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:16:51 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F3E52FD4;
        Thu,  8 Sep 2022 06:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXLF+8HdaK/juKkJN3EE4FTb3SEvVaCfmZNI+ZcmhElFtOzdDtNpp/BmGWNosRsDn1lZo0ch9l029reRQFYyia8Jekq59SYEmzPcXp9plfCrL3puKTlaEecNzFur0M4reEsBT8dSOyA/ZX5wVjtrXM/xjp5gRN1d8LDRYaKDmUrTEgPFZZBowxSE4mlJkRufAjbjeos+CsS/nzBniOKLK1BmInNE9fyMbeJW9tongD/iVERcvA2Y50YoazKI9vtfTiHasI/EJWIFAjWsK03X6rOtRhVGjDYAH0oecTSYmDCHej3uBmEc+NiG0rV3m1+4jG8zZgfp49gszgA2Q15e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coroPJHWt+C4LWUy2Uw75TKHzDJawsxXyaAJn1EYJjg=;
 b=P7S0WHwSJTfEWfYAciufnxYmVu3WhcOo8ZyCtQkhgvgKB8GyZxVuN0pImkcSfeajEZaXX4a+e1CeIYjksbXmucNI61+X1Xp1bMunrvGGHF6DrVItLpoM88jD4NQ0V5mYqo85bMTiYUxva3uYmemcxI7/ebn8mo7LdZsc0frCGjCW0Ya2P7l+KQfe/GemJZz6P9h90DAITmRzenVLleFiYynyxK5AIfKP2ghwoAI01xIJEYfWZ24v+H1hZJDRzLN9cypjQugCY+fUCNmjqkC1x+fyIwNyIL0p7N6c5qTBNuM0vzEfBUbCFQdCRcD5t++IG4sO0AH6BGYqkX1RrkEXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coroPJHWt+C4LWUy2Uw75TKHzDJawsxXyaAJn1EYJjg=;
 b=mWYjy9Vx5wdqWRNv7C04teRh3ExpxQiP6DRMqM+fOuZUp9EAHEmF7DhduYwhBKFMFT6woj1fM6rpocK5/ktmwE3sjEI+g41VfZFyNhnoy7Fl6pQvZloteh7G7g2mwaKWsaKKEGyr18kK+ng6IO7UkNiKcfFFG7E8ScxiRtrlqZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:16:38 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:16:38 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 00/11] Additional fixes for Azoteq IQS7222A/B/C
Date:   Thu,  8 Sep 2022 08:15:37 -0500
Message-Id: <20220908131548.48120-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b46252f-565f-4246-1e6e-08da919c5cf3
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eDiIeLpgf92UfNvjpDWgjy5BcB7UZlP1n8mHXV6NWIg4KY3tMi1LDKqsgm08Ux8njudGIbUyqkkstwQRad+Oeh2A+ki/sKY2SOlEpXkC9aL/Tj7saBahFby5nNdvruTQFViYG29EiqQG3IiiZSTDjgeuIac6PNy5b63lbb1Z8R9fIctR2TcKZ6Tt5HtwZK3cHaFtHngK5fyr+Nyr/VeaogL663FQDB0enwQEaTdRLdMLea/yfi8IMgjubT0F39YIgGHimsEB5wzfOhQSkKjdkLEdMe2TFH/ldb48ck6F5WloGmEXIgNnRiIIS8AqkvwPE3MFx0s6/Vk+DfwBoGNgq8v/5upIa4pmR0bVu3A2qGwSEhvMNsKSsUO6jZ/x/EwiOw9egXz9oBavJiVmFxadd0N33Lxqieo8uO/04W5q2kD/KiSNrhU8th2AP5LOu34lrFRTvYxsy2JsDQQlqgyE/BOTGjaejpDV8yqbtLfYJb56AnDkaPPx3Io9Hp85t1sSSAW/67dtKH1Sr3vQmN0j5T/NN9GbXeDpcFo5dKuTIB07Lcwg7DsC17nyCjj6E4jrNSGZUQulKFvGY0Am/P2SAwVTy/G5zl0QeX/R0pzKAVBxDpfvwAVCocOfyhIWcvReYxBhwpSazJPPJ9tdXiMwaiNEx36bFUlCX/wCTmPSN+omIioqhMT12PX7zvl4aUGqiaF/F0T0/m6dC3RbrTyCNElOKwicvNq0CzQYtClhNoXve/Jt55zj/8RbUPbT+6eVc67Uypi6HJg5/ZEVPP+65g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(4744005)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MLYR2+didA9Fk8Djd2CGzbXEYrvcGcV0C3NsQ3rGEiZhk/pdLt30jLjXwkz+?=
 =?us-ascii?Q?tYjucF6T/b008wMFLcYoVAWYbeU5YMs0y29ltnT63xt7AFv3l26XaM4SIIbJ?=
 =?us-ascii?Q?F4e/G4EBgqf9vWZKcF9W8tD4LN2q+4Gsag5bL4dOrv7zVSoorSImsQ83JDFN?=
 =?us-ascii?Q?U6omXHCrpuToTVF1ot3hRxBL7tKc9NfGa6PzfJZhnCPpcEynPM3jMB6o/YHn?=
 =?us-ascii?Q?VVDl2oD6ncRvw8xAvibtdqK4cyd3OhuarQm7/SnSjXkVqeygKwcoxpxBYJMV?=
 =?us-ascii?Q?1I9uzSarEQMDN0rfil7hI0FGl7m+Cg5262ONp/tqHox+V1jCBwHs+cEHIU8m?=
 =?us-ascii?Q?l/RGOTmY/Y2U/e7gd2lcKr835iuyLJixxnj5++PE0zE18g5SiAcz0TDhZVl5?=
 =?us-ascii?Q?+FQCu0xNJU1HzjUbeYnHkKt195jg/vvEwSeRm6M2rfxrWw0ktzVNfRvpJVCh?=
 =?us-ascii?Q?wPDcO675ZOZJD0CUfKQjAe+MKtZZe411fD6atnxXs3znHqdhFIEeWEZPOZFt?=
 =?us-ascii?Q?rmWq3nIzVeZOSYEo2W3RJafJVeEDIAk60AzKDRKFLyFOL93vpF70sbxs7X6Q?=
 =?us-ascii?Q?fHoUgmlUdh2csl6nNioCTlmovDXRqBcRszyiCSaHWx1ydKe6tqMPLF5O2+al?=
 =?us-ascii?Q?bq51tqEsVWE7CZN3BlYB/9DfG5m+WH+oU8cB0nxm1blAmJ7RDVHJiBAKnsRs?=
 =?us-ascii?Q?wsTdHj2rmz+dQdeAe31SWuJa9B0aTlj1F8jK5S0iOpSA44/C8bqLHP8MTXif?=
 =?us-ascii?Q?LXbPWeDZsqLqMI3QQoF2ELyRVGrFblIcFtpx95qin32wVFyN/eVj+ryxMtTp?=
 =?us-ascii?Q?5VTnll7XgEG+U7uh0knfGdH2skaffLcA1VIeweCB17nzaZIZihhMs24Uf4BM?=
 =?us-ascii?Q?4oUDe0C4WxitJ0hxTqIUMJX1w1tD+INMLqPkCznhZ5TaxzELItIhw4y6QkUs?=
 =?us-ascii?Q?gbroqTILbWQz6Xphu3hoCvRg1Y3CifEWVnkM6KVxNJwAOcH2uFacebw+d+RX?=
 =?us-ascii?Q?KXjtTwM3z8aXledLwZjixb9mjHz4g1kkRoDSFpgRI7Fpiq8WG5NfAsLgD+H8?=
 =?us-ascii?Q?+EZPQ/RZvcgg1q8NiLMtKQChsJBISfRxkDS3Z7HQnE48BL0nckzTN+kfuSOM?=
 =?us-ascii?Q?0FJwE9mVEWCfTeu+3v1AEr0gs2RuzeaDJuuxnWkPWHFumWfDR2QJzy6Dyh5j?=
 =?us-ascii?Q?Txs9f8+T2GVxSeEERGj+3oFrnSDx+BV3l9V4Oi198FyYSMhxMmHUBiy7KnwU?=
 =?us-ascii?Q?w8QMwSDuIJetnFfV2JrU+5A644Wsv8zK3Cz1rerTM4yEY8fbeW8gLtQruEsd?=
 =?us-ascii?Q?xgfB5fWpazdHme17cxhvErL2gvsBxlx6dsjARClEJ0icbFDfvjxW3uDGcqkv?=
 =?us-ascii?Q?wy/BrOFsp0LQi9wkCixhlYwOYDfCwpNau0e6+BtoAg3NDVhAvtwK0RSb9By4?=
 =?us-ascii?Q?2vfqXNyOzv6l049iMbKUst63Hctk17RDGIxcb08ev9MlJI5MUZvaTZY+nAli?=
 =?us-ascii?Q?wrB1N7Yj1pVqXGRlOpw0Lqj9fXZM/lFGaMT73KJ1EnrEkYq2byZg/6HzAqfu?=
 =?us-ascii?Q?AuTYvV63SW6wwbbPs59RkxbEnteKT39dmtQ0hEEC?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b46252f-565f-4246-1e6e-08da919c5cf3
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:16:38.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GE2aJSVhayhXV4E6vAIkvF8glYb5dOYKMBhwu+tjau7/wBQotTqBfeptea3O1P0moxCnOJ/3AvHZ+2wM24nWsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series comprises a second round of fixes that result from
continued testing and updated guidance from the vendor.

Jeff LaBundy (11):
  Input: iqs7222 - drop unused device node references
  Input: iqs7222 - report malformed properties
  dt-bindings: input: iqs7222: Correct minimum slider size
  Input: iqs7222 - protect against undefined slider size
  Input: iqs7222 - trim force communication command
  Input: iqs7222 - avoid sending empty SYN_REPORT events
  Input: iqs7222 - set all ULP entry masks by default
  Input: iqs7222 - allow 'linux,code' to be optional
  dt-bindings: input: iqs7222: Allow 'linux,code' to be optional
  dt-bindings: input: iqs7222: Add support for IQS7222A v1.13+
  Input: iqs7222 - add support for IQS7222A v1.13+

 .../bindings/input/azoteq,iqs7222.yaml        |  25 +-
 drivers/input/misc/iqs7222.c                  | 365 ++++++++++++++----
 2 files changed, 303 insertions(+), 87 deletions(-)

-- 
2.25.1

