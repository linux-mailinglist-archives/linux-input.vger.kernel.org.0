Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18C65049A7
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 23:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbiDQVpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 17:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbiDQVpR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 17:45:17 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2088.outbound.protection.outlook.com [40.107.212.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAD9AE6B
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 14:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY+WMr/q3uyEIC0jOIkaIfAoA13tJlG/8DzdOFgjvHoefJWHpjs170AA+zI9zOX5G3MSN6XGofwKba/NHWhN4dkrcVdsvpotkPNCkA1UkcIR2qRudeQMO0qievNC7sMN4y0VNvzohzbNYGvw1Wh2so/5c0z1xdByiiRWuTS7KrwlK1+NJEEleY2yrPF8qYSdODjf8FYf7t8alGquo4CgCqNrdLOQhWaWkYFP0kfSFQkQ9VmKFCvpvHcEYiCS1ky4732bicbMFm5BiC8EG1Zn08SfhfibR1e3cUyrt1H3u+rXzBDbSEyahtTWOG5efc11uqIV3bwvrF/2Nu9AR0I62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJLs4I2gL5SmmHw1lr3BjQS24AFq2cz0/zMkglAy/JU=;
 b=AZpyGXYuh3ePP9pUonPoDik0BsFgOVsnoDWsW2uMqgq6gkIM7hFjBgQpigBytP2KfVTZLH9oClKaZnium+5v7WQ03IrN3sxuw3ePFEO0hFGgXRzwXghpL4QVv7UlzY063lnCSkoKYDTudAGwYrz4+InPAMJmym7l3bLFaHTbtUkwTA7IuCPmWfAECOpS4Y3jprN9f7l9quhl7U+1srqM+CDZkfJOdRZ+hf+x/HF5XHtFRqF+T1XGJIViNIEk2Tx2ndMCia6gqkd1ZKdz4U0OrA+RSZV5lUsLEyi0M+oerEiTItJ8C14eBgxmqg66dZfFzVf5rqBkzd6YnuwfZw8EYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJLs4I2gL5SmmHw1lr3BjQS24AFq2cz0/zMkglAy/JU=;
 b=N1ljqH8p7lTLtWikCCebvksexcsW0fk7EY47TSHUVOxVY3e29eSWBEmrOuPJLAvWKpwA0BycTqPPBWtj12wqNqfvst6vIhH5ZMI3VrNdapBOQDwCGukpUzoDBE+qSddgK/YHdx5jjkDDtPw38o+jUnsXCWIbcz70SS9Wg69tSg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB5749.namprd08.prod.outlook.com (2603:10b6:a03:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Sun, 17 Apr
 2022 21:42:35 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408%5]) with mapi id 15.20.5164.025; Sun, 17 Apr 2022
 21:42:35 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] Input: iqs7222 - avoid dereferencing a NULL pointer
Date:   Sun, 17 Apr 2022 16:41:32 -0500
Message-Id: <20220417214132.497487-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:5:335::28) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d55341d4-86ec-4277-5a17-08da20bb2f5b
X-MS-TrafficTypeDiagnostic: BYAPR08MB5749:EE_
X-Microsoft-Antispam-PRVS: <BYAPR08MB57495E5586C8289B91F04FD3D3F09@BYAPR08MB5749.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vazKLcDwNcPdLg5iJYJcDurwcHFDlSbcGD47PomxWTaxF3XBZ13/1lC8T3z40bTLG05eh6vdk/PkjvRlD87qtSXTOhEDCixW4iO+wRZODKDGc0beCpCqTxb8c4P9F7mV0CexDevG1U2mD5MzbtPVggNGJm7f7HsRiORXgijQ4fSB6KH32r9TnNKR7DxRXkSEO6SJbOBvMgT7658zeoVKfdBX9uOpHVvsj4qIn54zepV1e/fcINVaVw4q8PMS6D3VfK3TY51znl4IbheyqoduWfxmev+ThMWkvnkdQUCVRnjExQ5R1BYKTE0NEJGq9RklMf6UMB0+j2Hj6Cis63n/dTPTgBA1k4465eaYtKO5jaxcNRRstlAp7k6MVtZWvb6VZ20K9GdEiIRmj4X6kpPCv/NjqRKuAvcWBaMHMRB9RL8KkIrj8J6IQeoNERErInqQ7vZt2AHnAOYdaGXgqPm2NdVYCeEgOGWX9mMS3q/0NkbZnsWHMVdHhAfZC1q553W2mSVxZUT1C3FPhfZv4KdmIrXDql67xBH7dpd90yqGu5M4eGXOVI+9qTIFxYJdAPetUN6vOBlODmkbViiTUGkiteAMu5zeY4eUwNaaoqmKa9xbE7gv/MnDN4b3rqsmwqJwpMsYD8qc8fwIlnWTnKKYX1EqWoRsWsJXcTUOq9HmrCQ5l9Y1zz06Dn6QLCwIUE00q+tXzDo9PqI7/LSD3mtyBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(376002)(366004)(136003)(39830400003)(396003)(346002)(8936002)(6486002)(38100700002)(6916009)(1076003)(66946007)(66556008)(66476007)(4326008)(2616005)(8676002)(26005)(186003)(54906003)(38350700002)(508600001)(6512007)(2906002)(52116002)(83380400001)(6506007)(36756003)(316002)(86362001)(5660300002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ekuaK2prxVv8/1AnpM5ejpG+IVcZ4EiqRRsFghGjPzvoqdQCnSbWncHUs4Oe?=
 =?us-ascii?Q?AL3bUZbUWjgbpnt6RCn+Mwj9e841l/ux5X7OgDxd1lO3NEY2HpeJFfw4t3FN?=
 =?us-ascii?Q?UrfKBEsTX7zeA0oSAbptxmjzzLMX6cDculiDAFq0fvyhDtRvzHwtho6e+4dM?=
 =?us-ascii?Q?Rlf/zOw6VLh11CnYqYcbpjGKqI6MqXfaZkE+vixKxKkDjXPitKTCdGuflHEn?=
 =?us-ascii?Q?T3wVhvy+9Rci94j4qMPaGDlE1CX955Y6dGLlopEGVAjna9m6Nc5c5aR8XqTV?=
 =?us-ascii?Q?cZJOZrOHDajbq2g1AgnqyPukaukeGSskcS+dX8sXHsMMzSyWExG/J+dy3Slz?=
 =?us-ascii?Q?S3t7BCLwsYg4htGCmKPGBz4MB7mNGw7S7cpcI/ZMp0X1T3ZG+LE1l/pbj47Q?=
 =?us-ascii?Q?tOALDz7stkZz5Yjv1FqC1M2xjxspj0iA7ftTHafAfgKjzNRwQZtq0oYQOwvg?=
 =?us-ascii?Q?XyRtHQzJbRgEQEwcGW9MMT/DtLl/PIgAQLLKtxszELvWx3brxd5aWk+LW36R?=
 =?us-ascii?Q?53H1Wz1Eh67FtexaezK33zAIVnBSQ1S0WeoMa2nxIq3Jj0XHkNy/U+PjW1fV?=
 =?us-ascii?Q?Kgwk5CBAy9dxIwvuDml3nXI0uSvSzvBSSw+4Hy6YkdNBo7qojkDRGZ69495Y?=
 =?us-ascii?Q?Fw77urSD4snniOQw8WQPPHeuFeTf39yE3pTBNurq3PGVMDtfh4GRhA1mUUz+?=
 =?us-ascii?Q?O8qdiMgVjC9rutyX87nhg+OZiB58L0Pu6UdvG1Me0gLpfOiBdmf3z3Dq0LmT?=
 =?us-ascii?Q?Qik/icDUljYeHJvHS95AffG+4f/D6QRlqnWhXQ/cWVccB6JPCYZFqKtlEh9D?=
 =?us-ascii?Q?LLeetd8dqCEoOfUUrWRSomcefnQ2BFKTanq7cqpw/zIYC2OHBghd5QTYoZHA?=
 =?us-ascii?Q?hrp7QEq36EUU90KssKcHJ9sukAxuc3aYsARp9pEYIq7/ZigDhOyblqN1cMj0?=
 =?us-ascii?Q?IW5iTFr/ysiVj/rw1RMHma6pvEp/f1Pss+zeI9oSHsABSXyw1RgQo+i4WtZn?=
 =?us-ascii?Q?O8DeNQsCbnfBzE5QFOgPWsMVjL7+QcUxzs8cfbefFn5jvg18JCad4W6sKwgx?=
 =?us-ascii?Q?/JWnY75w6NrRJWO8UH42h2i8AcRIB0k6qvxl3PB0XhZOGMHXxKQi1zGilHjq?=
 =?us-ascii?Q?Xepg4joYAPpLYXyeiNiPBY+vX1Zl3p4ZR8EGTZO5BuFx9XssJZaPvFxS66mq?=
 =?us-ascii?Q?Qah1w/obykoQ7XqkQE8VgsBeM3IKHKn1U2dlvzA740WcVwU4mpMVQ7hw8of9?=
 =?us-ascii?Q?dCwjTQuLr96ySZLmN+sIMh3oDdhQtXgZmgTCas2nXJ3PzhVCEKaXqOmn2q9x?=
 =?us-ascii?Q?fndTsav+nxTm2frMbTFWv3skwsPhRwvua/cEHCtbKK4ng0yTEQFrLM7zWt+F?=
 =?us-ascii?Q?MPcUUIlDVRy9dFe3loPCUoxzPK22EBo5xND4A+OAfwbulLs8nxPSJufJ+7db?=
 =?us-ascii?Q?s8TmAh9bXjoUHJ+RWsI4tLC47ViFJEPL5tMLP5n5U9K872Jczzr6TazKoCxz?=
 =?us-ascii?Q?44EHCeMxLfS+HgoXqgxYqVgClALh3dbt+gfsCGoelfRgvmnbYVYrHVp0nTiX?=
 =?us-ascii?Q?O323Od1y3geFj6QHu1tC2iIsmGKcGDdqAEUoGSl/cjuwFh8fmXKR4dCwy6Ki?=
 =?us-ascii?Q?kJ5iAaAYvnxzYLmUADPvoUFYNuIw5vJYanCTYvu2GwlsJ1kPKT03MarsvVy3?=
 =?us-ascii?Q?7+BTxsZ8myV6KsXzXV+ngHhXiRXcWOAGj5pJu1+SWwICw0SKV2N09tdFRJ3K?=
 =?us-ascii?Q?ewjEB2ENVQ=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55341d4-86ec-4277-5a17-08da20bb2f5b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2022 21:42:35.3709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D93VwFzrkSRQAjRT5ZXgiN4HIAy7Wz4bpscv+dPy8/LwUerVSEjDxs0piq5nVTJV6SZJQ12temntFBJRmrS0Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5749
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Select callers of iqs7222_parse_props() do not expect a child node
to be derived and returned via pointer. As such, these callers set
**child_node to NULL. However, this pointer is dereferenced in all
cases.

To solve this problem, dereference the pointer only for cases that
expect a child node in the first place. In these cases, the caller
provides a valid pointer.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index c0b273222092..6b4138771a3f 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1534,8 +1534,8 @@ static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
 			       enum iqs7222_reg_key_id reg_key)
 {
 	u16 *setup = iqs7222_setup(iqs7222, reg_grp, child_index);
-	struct fwnode_handle *reg_grp_node = *child_node;
 	struct i2c_client *client = iqs7222->client;
+	struct fwnode_handle *reg_grp_node;
 	char reg_grp_name[16];
 	int i;
 
@@ -1550,7 +1550,8 @@ static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
 		 * for additional group-specific processing. In some cases, the
 		 * child node may have already been derived.
 		 */
-		if (*child_node)
+		reg_grp_node = *child_node;
+		if (reg_grp_node)
 			break;
 
 		snprintf(reg_grp_name, sizeof(reg_grp_name), "%s-%d",
-- 
2.25.1

