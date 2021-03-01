Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44E132A57B
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350739AbhCBMpt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:45:49 -0500
Received: from mail-dm6nam11on2045.outbound.protection.outlook.com ([40.107.223.45]:65249
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346973AbhCAXvY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 18:51:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diF56BHZcH7hprXDlUOXB7eQg3mEFRIfyEPDIhX6DV7gE6qqipXGn0wg9ZSqknRkJ0UnUPb1F/iS8+YYL26zkzH0YYiAS9B55RAdrsS52wE9p7O6wRydb/js7SM5P7l81cRdmUNLN9Qkx9X1ujuC1kmCuH1GWVp1X17LuQc07FiO63hKr0D6d60OAgQvjRrJERlCYVCyFnWM1uE/jMzwp/0VO45dL/ELjaZvYmtnd0SBPxY+T+XJtdiyDsZ5hBYel6noGhmkhco+H+5HJQpL/fSNGaIAxcXVqLlewcoCg0XdiD6YKAeLPI8Y3PYF2xGGfgqjXOEzD4rxhRvgCbD42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l/Ism4reLcdigBf3PXlp6dnPc9bUTyWathYFf8t27E=;
 b=ZnKqAb3dPf2rTKt5njhvByzCbGq/c8WdK0acqZdKiTn3IGxxcq5D22bJf1e933PfiIRs2qZFBQVeLfyEHe7Wq9/2MNTNbDaiRo9OIfNTYhxeXx1kXCleAcKKPkpgrzQ/L6TFIMvIQOmusvMwr+r82iF8tXuLDELO2Y0bU5e9Phu3RRFNp6syIXVlwnU5HI33Lq2zuBeCSTf1jDJl6rzCQcPIuL5znymhbsFFwdC3VAibtZVkY7yGSgHJApJEc2A0YH/hj89sqIfjQdyGaJ3Rbgsgr4m6pbNh6z1FWdiaJks3UHRaLhDJBuS76/MqE+JS88MhETwbu/DVa8ZYAK+jFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l/Ism4reLcdigBf3PXlp6dnPc9bUTyWathYFf8t27E=;
 b=yUnp7/Tq1580myi87A0HPcM3lqI7cRExtMDqJvpHQs4DSXOcq75EJivfjiIWNUeBm4BbjSHdWt1oYzfjqmtdSMyFWp5F3mJiDGEf7+p6Nf/C0zmjOTmeAvWwsJ2aiT0eF1Bs/PWhh2GsbPRZks4RTxpsU1D59Y5xq785JotFIjE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5151.namprd08.prod.outlook.com (2603:10b6:805:76::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 23:49:58 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 23:49:57 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 1/4] Input: touchscreen - move helper functions to core
Date:   Mon,  1 Mar 2021 17:49:25 -0600
Message-Id: <20210301234928.4298-2-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301234928.4298-1-jeff@labundy.com>
References: <20210301234928.4298-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA0PR11CA0110.namprd11.prod.outlook.com
 (2603:10b6:806:d1::25) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA0PR11CA0110.namprd11.prod.outlook.com (2603:10b6:806:d1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 23:49:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a2ca7e0-c44e-475c-2e5e-08d8dd0cb851
X-MS-TrafficTypeDiagnostic: SN6PR08MB5151:
X-MS-Exchange-MinimumUrlDomainAge: kernel.org#8760
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB515104ECCA0A08106B93EC5DD39A9@SN6PR08MB5151.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZC43r1BQi8jagIRxhFbwMs1vjY74G8nrp4Rgn/fXYGzlWFqxl6cTCVpdpRhnCUhZz79x3xQjpyBUvzJtdXrVFMRd9DkGs7jDEgJhLMqP1QithxoFe88CThNDsHn6zaZ3b0ZMmRPUOgIBcsw+ImszqFQAaZl4ntxStNUiZnc+6BlPfx5fzILoJscMvk75WzD2N/+07vA6D/wrkguQeCJdQt9fhMnuwMX/8o97HMzEc1Ei5/UDblxlWKMmJzxCkCGyZ9fBqGeQzfSRROTJF/84/IgytvvLgo3LKX912nO5AlOKqZso6St2TE4MpFy3MHZ7yFciT2V+/Yj+tvzq3DFbKp62Tjhj1R8zR8GVn3fwg1oILucIfPIf/ESEWX486YRNX2RLkPOMN5az9+qMiBUJBmo7iOOcghHkn7xPFYKoMb7qiJ9O3kJBtB0b6/cLlIIg8u1uUdLXozYhkRojg5maD1ytro2/7NDNqsYK9sDykLUtYrpAOkrcpX9VfKo7dGbzhhlZzUGVa4C71/2mETlUCQV8bTzdSbOnAkRpkknrBihBnj1eZpJkBeOqv0Gks0uj7q/G77B1iqPdIIm7zKe3ly9wAeHxKCvLGFRp+M9xdC3E/v/n57K3DytbzuxIlwh4kul0N1eUUjvuCzboOwHsHU/HOhko2ExGQH4DjvCh/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39830400003)(376002)(366004)(396003)(1076003)(4326008)(956004)(6506007)(52116002)(107886003)(86362001)(316002)(5660300002)(83380400001)(2616005)(36756003)(69590400012)(186003)(16526019)(26005)(66946007)(66556008)(8936002)(6512007)(6666004)(8676002)(966005)(66476007)(478600001)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m5NGL9F5tadI4QINchBTsBt1RPFho1icxy10s0fdXZ/+nhhwOs29SB5Dl2PX?=
 =?us-ascii?Q?SOTsCqLm7lrrn435lWTbqiiGoxWTHR947nFBhAk0BYPYaJsL+aC4jXXC1DZ1?=
 =?us-ascii?Q?ek9xSwThprDKobbpj5bv9gEDmeuIsza3BZ5cXGtP0VO/b/z/VZzksfm+SSk+?=
 =?us-ascii?Q?o1HF0+lqKTqB/jL8PuqMFCtn9co5O4zsRqgJ+crLA6yE34ZNFigcmS8/0O3Y?=
 =?us-ascii?Q?/vnRL25Cg63mbo1On1zK+FJi33C+ygrOPXf1d3LfWLt84Uoqx1UVQcaZlPqg?=
 =?us-ascii?Q?MJ7Hf3YjHqejer45kvD7OOhQhiIzZHObSBlNqusmD9Tlf6pztMgLNbGkOYwC?=
 =?us-ascii?Q?VzF4evJYplxpXb/kd/s4vT7W+U6wvw4cvw+AJGS54KQB5cZv5F9hlRa4MKCf?=
 =?us-ascii?Q?NGhIx93rQ0KxEBGCee00xG1D6WsHX9TKOvgs+DDzecQMInnzr62sYLxffgcP?=
 =?us-ascii?Q?JQIaGLH4512tRuNGO0RYmdxzj0+7kXI4bokq79pXKWf5FRNqM7sNqqktXuJe?=
 =?us-ascii?Q?/yWRmrU27PU0YAwLCeAR8ob7QlZdIPWTSioVtyFffUt9XhoIWURyihX/lZfD?=
 =?us-ascii?Q?XoxkOaq+0h5UYvcXJKssRZuL5Q3MA3a8/CdBBzlIhvbrbwPpiPbq02qF12hn?=
 =?us-ascii?Q?A9bqrnsoD6t9F5n3COxS7enuwNJgHn4dp4Xk6ovD5d9o3ec9ef4BZLWt1D1l?=
 =?us-ascii?Q?0up2j/kZFQv7lCMX8w4yflzCq/PKPu0UTDjqKR6lygbzqgXU1zT2wgC1QJ5/?=
 =?us-ascii?Q?hGUc/iIb7pvJQRh6GH0GwowKMNxruAawSZr5lWmG6AQGFQK4xDGPaq8eT64R?=
 =?us-ascii?Q?kH82iOF72/xLl+T1MNjkeDzbd6fBKts/Z2Bdbj5TjVBXmAza20u5BJ7wWyA1?=
 =?us-ascii?Q?aUOqapa+LHEiO+AuOrS9SdLs4ofTw+ZbdmP5IBuA3biJQNc3Ls/OxtG3P1Zq?=
 =?us-ascii?Q?vqDlchshUIElu+JV7s2XkihItkRVOGsSyPlW6oCvnDcphbuxSVcBPP9lAJiy?=
 =?us-ascii?Q?pfybvfhJvOx+DMEZXGZBLvjK8JFZhXLGsQS3BZZ2jdToYf+Gl8VsDvrBt0Bn?=
 =?us-ascii?Q?mXwXStt0/ZU1hkDnj6ejlQaUNJQzhP8p+r6/xnOdCwsNAYSlj/QHILQNJc3J?=
 =?us-ascii?Q?mR5aNcF1PTlP3J31IIuF74/2G6FYd59Jiz6G2eNI6+mBUNeb5wedpkwDqR82?=
 =?us-ascii?Q?agbQ7JIqTGi+s+Hl5jKNNDE3/vGiF2+gKBngkrjclaAUkWNUp+ICPdULUtMF?=
 =?us-ascii?Q?2/rmnKdK8Zo0J6YWrfhUclw09GeOJR4zssCkyyRXn0yKPZG1/CA8+EoNZBoG?=
 =?us-ascii?Q?xiCOprupR+2JRHXCklCaaY5n?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2ca7e0-c44e-475c-2e5e-08d8dd0cb851
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 23:49:57.6258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jw7G3n2HGY/rS9iYkcRL08UqHoqxkgCRW3g2EASr7/7RtxFgmgOVuuBngglo9V4Yqj1HTz5P9OS6PK3BOc2KrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5151
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices outside of drivers/input/touchscreen/ can still make
use of the touchscreen helper functions. Therefore, it was agreed
in [1] to move them outside of drivers/input/touchscreen/ so that
other devices can call them without INPUT_TOUCHSCREEN being set.

As part of this change, 'of' is dropped from the filename because
the helpers no longer actually use OF. No changes are made to the
file contents whatsoever.

Based on the feedback in [2], the corresponding binding documents
(touchscreen.yaml and touchscreen.txt) are left in their original
locations.

[1] https://patchwork.kernel.org/patch/11924029/
[2] https://patchwork.kernel.org/patch/12042037/

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v3:
 - Updated the commit message to reference the discussion over the bindings

Changes in v2:
 - Added this patch to the series

 drivers/input/Makefile                                        | 1 +
 drivers/input/{touchscreen/of_touchscreen.c => touchscreen.c} | 0
 drivers/input/touchscreen/Kconfig                             | 4 ----
 drivers/input/touchscreen/Makefile                            | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)
 rename drivers/input/{touchscreen/of_touchscreen.c => touchscreen.c} (100%)

diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index d8f5310e22ba..037cc595106c 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -7,6 +7,7 @@

 obj-$(CONFIG_INPUT)		+= input-core.o
 input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
+input-core-y += touchscreen.o

 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_SPARSEKMAP)	+= sparse-keymap.o
diff --git a/drivers/input/touchscreen/of_touchscreen.c b/drivers/input/touchscreen.c
similarity index 100%
rename from drivers/input/touchscreen/of_touchscreen.c
rename to drivers/input/touchscreen.c
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 529614d364fe..aead3ad6ba6a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -12,10 +12,6 @@ menuconfig INPUT_TOUCHSCREEN

 if INPUT_TOUCHSCREEN

-config TOUCHSCREEN_PROPERTIES
-	def_tristate INPUT
-	depends on INPUT
-
 config TOUCHSCREEN_88PM860X
 	tristate "Marvell 88PM860x touchscreen"
 	depends on MFD_88PM860X
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541e9173..80cd241b4c1b 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -7,7 +7,6 @@

 wm97xx-ts-y := wm97xx-core.o

-obj-$(CONFIG_TOUCHSCREEN_PROPERTIES)	+= of_touchscreen.o
 obj-$(CONFIG_TOUCHSCREEN_88PM860X)	+= 88pm860x-ts.o
 obj-$(CONFIG_TOUCHSCREEN_AD7877)	+= ad7877.o
 obj-$(CONFIG_TOUCHSCREEN_AD7879)	+= ad7879.o
--
2.17.1

