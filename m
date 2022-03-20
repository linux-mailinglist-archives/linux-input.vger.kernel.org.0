Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0420F4E1981
	for <lists+linux-input@lfdr.de>; Sun, 20 Mar 2022 03:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242364AbiCTC6y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Mar 2022 22:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbiCTC6y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Mar 2022 22:58:54 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77231CD7CC
        for <linux-input@vger.kernel.org>; Sat, 19 Mar 2022 19:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgM/xlKx6QeOsi03IEE5KrozFqMcp/rxrTFaYZhz4EoZzlaHMbKBQ/6nx82MlFLq9ZRK5zekLIL/Uvx7tmezNaoKI1GrdHAt9Ho0Uv36Jb7X62dXgkJzP1bKzUyT4GiflN2dvcOsGYayJUtEueDW8DPmSEVoUbX1AirZTNM55yHvXRFOV8rQYzNg12k0AHPsnBF0Kre1ujCHtdHMBzd7AdwvGoiPUfLo660nl5d1hQhzN0mcyriOfMfP0rvUyYfMUNsiQPsDNz+zJawq8vTppwUheKvm6k9jfJh6A7wXlOkFImSpL1fO4C1Eh5Rel1AVCThN7MOhwsXWovNmaHYOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+RAsfbJqEKEuU4eihF/mV0Nr0sv0gUF9i1Zt6FzLpM=;
 b=Q05P0uSBdHgErTq50RNN10QCZrYnA5cNBhHd8f5Y2lFVmmQososV+hMonrAxamFVDu0pqR1XSmZno4igwpRBSUAFDULJSyGJ7UoCpfYcEPzkR+AO4KYIQ5K2BEMhmaJpI3rsnFuIz8HcRIeTKzw5VERHVSbERU1J/WU2v2+Wsvo9ekqZh1nTo5OJLlrsIqRw8Wxx+TIXykVo0XZGFzKy00MOy0zPOwbyNXmdN6ppzeXw4M5G3qAmiMrNPHOS77iXqN7CaIDk4eUDDMSuDF5Y6nTS5FRROAedxff5UKRI/9leXtwZnmLBQ6uVLZu2Myc8YWCXB1KJrJAnQbLW5uDTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+RAsfbJqEKEuU4eihF/mV0Nr0sv0gUF9i1Zt6FzLpM=;
 b=etNzGcP//e2dVhQw/48DNZic0+U+nOVEHtNaCJBNcKUwe4OeaArSXNXFRJiMNlWun40kDFz0LDSxFP2zYoJYZZ4keWxeYSoedW68WOAjn1h2u5aVg4+HLHCRgnNfXAFdHrZEl65WYB0tyYtxpKhYgbbgEBACn6LBckC3ahJ94hA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by SN4PR0801MB7838.namprd08.prod.outlook.com (2603:10b6:806:21d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Sun, 20 Mar
 2022 02:57:28 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481%6]) with mapi id 15.20.5081.022; Sun, 20 Mar 2022
 02:57:28 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH] Input: iqs5xx - use local input_dev pointer
Date:   Sat, 19 Mar 2022 21:57:07 -0500
Message-Id: <20220320025707.404544-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR12CA0021.namprd12.prod.outlook.com
 (2603:10b6:806:6f::26) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bee6d2b9-0936-4a5d-a67d-08da0a1d5e2b
X-MS-TrafficTypeDiagnostic: SN4PR0801MB7838:EE_
X-Microsoft-Antispam-PRVS: <SN4PR0801MB783802F2F9160FDCCF197212D3159@SN4PR0801MB7838.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ndVjheUPYeDjpAqAGBpSCGbNKrzkGjxC/t2rB53K4+cUOwb8AVJspBvJGLzd5CSJGulv/iHa3KdtlvV/IFnMQm7p4XeIcmp4nmfq0YZPKD3Q8f3nHe1BIAy7jk8MbOyl7glHVj/SWcOQmdel5sMtWmumVAHK+4y2cSIEo09Gn4qSakZdu1pnBhEGLhplwl+mFR6UKH+5IWPcleuzuhuYTfsvDxcxa6GPaZEd58IeV3SnsssmlJSWvZzZZJvFZWy34/hLekenEbSgr7m1cze+3cibcgRVwPFISQZ5o1npa0NmWF9oUR1zpaATMgb4INtBnOVT24iiksvj3qomemNMePsLe7yYN1sG6h/F/OOJ2rW5SaNp3nbpca81en4/KguQIp5z7RZDtWx44UcEmdEHnSCcCVcAVfyRSeHALWpX+dOpYgZ3h5hltupSFZGrIyWBeZeiq1XVxT0L+kmjLYFkLj6ZKnemfk4XM85ha3NlDUeWFpOf1q2elOcWPwxWkIGlDDdSt6l1rz4UDLWZFBnKEaQuzk5FzmxGXIwPM9IIWm9/ATf69drApjWdl33n+dtnfv6qRItGE8+Kvj8yzu+sV1QPU/DnOnpTVqyqNEJxrtInFgCiuJ0kaOj/cQaHusnBoeAsSOI8k6Nczsnh2laL6pum0kVrkRLwZIpwSI5Y+zn2ru5sXF/5WkOdSg0ImVJxg+9/zOV8N6L2olfDV4q4Jg4BpBXoMrX/OlM+bs2YSyKwRjhEdu1+MznI9BmWRdS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(346002)(376002)(39830400003)(366004)(396003)(136003)(6512007)(2906002)(8936002)(6506007)(38350700002)(36756003)(52116002)(316002)(38100700002)(26005)(186003)(86362001)(107886003)(1076003)(83380400001)(5660300002)(6666004)(6916009)(66946007)(6486002)(8676002)(66556008)(66476007)(4326008)(2616005)(508600001)(42413004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ec3h69eEG3BI4JeYr/AWOA87yddZcef5q+2gfomOXmT+kmyLqkJmvP2FD+Lv?=
 =?us-ascii?Q?pVaZiUwGXB+xshUtmbyRXvcwEfv90G3C0m0eTKH+ZQugi8QFrYgh1feySewv?=
 =?us-ascii?Q?1KGH2df1jPRF3A4oDjHJtEqabvaggtEfCS74Ddg1S9w1C1KkJcR5F7eLpWAs?=
 =?us-ascii?Q?wRVtclSxoL7mBt1SBS9A9yliUo+yHpP50yR7ie1OTUqj0Vci5BE2QmAaXc73?=
 =?us-ascii?Q?qluunjVUvJz2xFNymivAZzQBXJ9WrCQDV6Fjy7GcPVUEGO1D6EGbLx5ET9eV?=
 =?us-ascii?Q?5+k9LVqjkoYahg29AaOcE4mNpij9Fn+b/ln1ci+LvZt1FtCm9Vx6SbHFEq73?=
 =?us-ascii?Q?2Y9tVI4BWC5cXMlp+Lv2EUUN5cqiAC0UvGdoyAfeDeZ0nDIPDDGurwqzXsxb?=
 =?us-ascii?Q?OwdcIND7BLHVxIo8A1dpTOVys4XiPrxf+IvLNnzsDZfEUl0FlyEubRUj2EeK?=
 =?us-ascii?Q?iQrtov/dJCixpelUx61UOXCNzk7X6FHsbUByilWuxvyhIHVeUN2jppHEy212?=
 =?us-ascii?Q?/VC48PW9miAcpEK47KUCbhLL1I07eY4ibBzSVQBD4qsMD+TCGwNjW0pbfLpB?=
 =?us-ascii?Q?07ptKYtAjWYl9x6PdI1h1Q9v9JY1xK4PpKbnNyVHTrL+hEweJSU8eFxdN0/f?=
 =?us-ascii?Q?alD78JpC6/Zh7F1xPEBaa/q6OJd0irUfSrT2NdyrbmYHK5d76yTQ/ke7Wd5f?=
 =?us-ascii?Q?4BAufWP+uPcFoH8k/YT8y45tLBFwSOWj3EVccqXyM/JP5+F9tJ8ISS9fO2gm?=
 =?us-ascii?Q?GXJFBV0Q57+Q4dJrfdm3z0hTUZrapxNBVrk3ZCHBaT+/k8Mq6k4CP2Hl1Da2?=
 =?us-ascii?Q?WFJoXBwbMLaQfjXV9xeI/6xA/ycotoaSLoqwPh1jLlOzaMDsMw80tFlGHGFp?=
 =?us-ascii?Q?gTjHMizYvoRXl0bxUZR1NC+Z7fRLCrzLBjRU5WGexoDi3F4WPHFllkrDb9IH?=
 =?us-ascii?Q?1PzvYUfFO6kG4jk+whXNsx3xKxdwbBwmthVYoGLfcDgCbbsMUkRe+pA6Rdm/?=
 =?us-ascii?Q?v0mfX4zwXT0JtXn6STSjhigPljjbfnNL/stKCdscwhVW3lKqVGXcG5LxU0Gt?=
 =?us-ascii?Q?b85Dxjkv6NykwmOHdrx/cHf7aYtVqy8pqYzCZFMvlDrejHhkxE46szChgX3p?=
 =?us-ascii?Q?4/gFpvPbL7E3gA2HCf0P6ET+KQarTMga1qTQ0lNMgGFi8mkangnvPKdF4iWY?=
 =?us-ascii?Q?65Do5XlZJV4VrD0vg8ZjHrNUehN9geqL3AOIutWW3e96TWwkaVnZ5UPLV6Z2?=
 =?us-ascii?Q?tVdyCu0WSn/H4uRcEfeBCF7H1bhf2bIPKWFJJwpMgTBVKNUB0c7sYZ11PVfK?=
 =?us-ascii?Q?2IhYcH9Z+/H3mA2Jw9Kqhbo/YwGZHt7uA1YG69ezSN2DPMbuhRiHpjsUMhEU?=
 =?us-ascii?Q?YGtfLmVAErKNAhS0kC3vrh5ikDkJTRGfhc8gX0WkFb/NeYsOZxIaMOQucyfs?=
 =?us-ascii?Q?gEpPl9i+voa/d3V4TdDbtlNyZg64crZ9?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee6d2b9-0936-4a5d-a67d-08da0a1d5e2b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2022 02:57:28.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwOwcNn4+WcusxkHqqs2G+qZ+UjrLgIJrXgvZAfqDzFdJtizGxkDMHFWPmqVV4hluS8IWF8kg1ny/iuvDJPOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB7838
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Both iqs5xx_axis_init() and iqs5xx_irq() already define a local
input_dev pointer 'input'. Use this instead of iqs5xx->input so
as to make the code a bit smaller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index b3fa71213d60..34c4cca57d13 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -486,11 +486,11 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
 	struct touchscreen_properties *prop = &iqs5xx->prop;
-	struct input_dev *input;
+	struct input_dev *input = iqs5xx->input;
 	u16 max_x, max_y;
 	int error;
 
-	if (!iqs5xx->input) {
+	if (!input) {
 		input = devm_input_allocate_device(&client->dev);
 		if (!input)
 			return -ENOMEM;
@@ -512,11 +512,11 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 	if (error)
 		return error;
 
-	input_set_abs_params(iqs5xx->input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
-	input_set_abs_params(iqs5xx->input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
-	input_set_abs_params(iqs5xx->input, ABS_MT_PRESSURE, 0, U16_MAX, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
+	input_set_abs_params(input, ABS_MT_PRESSURE, 0, U16_MAX, 0, 0);
 
-	touchscreen_parse_properties(iqs5xx->input, true, prop);
+	touchscreen_parse_properties(input, true, prop);
 
 	/*
 	 * The device reserves 0xFFFF for coordinates that correspond to slots
@@ -540,7 +540,7 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 			return error;
 	}
 
-	error = input_mt_init_slots(iqs5xx->input, IQS5XX_NUM_CONTACTS,
+	error = input_mt_init_slots(input, IQS5XX_NUM_CONTACTS,
 				    INPUT_MT_DIRECT);
 	if (error)
 		dev_err(&client->dev, "Failed to initialize slots: %d\n",
@@ -674,7 +674,7 @@ static irqreturn_t iqs5xx_irq(int irq, void *data)
 		input_mt_slot(input, i);
 		if (input_mt_report_slot_state(input, MT_TOOL_FINGER,
 					       pressure != 0)) {
-			touchscreen_report_pos(iqs5xx->input, &iqs5xx->prop,
+			touchscreen_report_pos(input, &iqs5xx->prop,
 					       be16_to_cpu(touch_data->abs_x),
 					       be16_to_cpu(touch_data->abs_y),
 					       true);
-- 
2.25.1

