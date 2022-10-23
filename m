Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874B460909C
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiJWA5F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJWA5E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:57:04 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0DE6FC59;
        Sat, 22 Oct 2022 17:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZksq9bMDBLlyPMot9WVw+sl1XdNwwiw09r+KwUCIs4iQFeNeUlEMNuTQObECl2nH03XcmantreteNjxbuxeLGTb1MJl4/QmFpui47FF66IMsrEIN9YTyxidbJ/oFO1hfSjsSdgKLQujR6nd5mKydQRhh8ZrOo/OI/RSDKJ3NLOeX62cdyeQNaV7H9ptBWYhqTalwgIuSq3poVWKBjY9/mPJWPZYzENe7E9yS4v6zPU+fpbxaJfI1yd8vjxnKJrXLvYkK9m5rKcw+p8fZi4glFHR7WELUvTvluRziJhlLbJV2UAtpIRYqm4rQ3ofkToYYEnuI2gI9Z7RQmPZkICe+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXJ5SCYEVsgv+7MUmitiFrDln+lhibJDQg5dsOBMsUw=;
 b=IKu+rXzk4fcZ5/eE1Rb+2pMVUxs9fH7APn1YZDYZqDJTEy1AOrpBhq0Yp3EeKGQbSf9u1zk6H/knlfuc6ML39SCHSoVXNzrmAO1uYt0RjZHb/9TrAhCkTOrjld9lOld266NxjjEr9jOVWIf5a2MQq8vMbvCEDmO1tTcOTB3BEUXH2N7zvYaH3qZlIvyDd1JjHEF4uPGmSOGDI+EgaDcgYoVcYynLywMJBbh8WPwb2JJYLhmf664EQTTJrGRiE2wshtfRew70XRLhHI3EjIUvRuT3T5sFqAv2AwdjNoiegiacwgvvHc1wd/cWGBdwjPfxZyxL2/mfUC5WyDcbDdf7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXJ5SCYEVsgv+7MUmitiFrDln+lhibJDQg5dsOBMsUw=;
 b=tum//7xP7T8QNPel5juSrKq63iK5ymTRMmQfvG9c0klB4BuC8Vww69oM9Pm71BtjdxpdQusv+gxv7OwRWTfjBdfWBVqa70Z0cfP1tPY7fjpxD9zeBiWwYd4rOtdA9fZcUbUSNr7tBd8LkKP4B71ciq+T0f6g9VBHFPQs4hNMjtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:57:02 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:57:02 +0000
Date:   Sat, 22 Oct 2022 19:57:00 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 5/7] Input: iqs7222 - protect against undefined slider size
Message-ID: <Y1SRXEi7XMlncDWk@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: Y1SQ2t6yUvdaIQPG@nixie71
References: Y1SQ2t6yUvdaIQPG@nixie71
X-ClientProxiedBy: SA0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:806:130::28) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2f9ccb-eb15-4717-051b-08dab4917f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kG3tCFjYo3QKtDU2bGN05ZHjX/1mPN9asIXtiJlMefSHwrOXHrpSWVW57GPhmS8QC7dN7L74s7MlBF0NnYnPMMG25nwiDwACFYF/VsrqbvaHn8GS25Tz0pto3h5FLUbcnfSl4O3Ylgsn0d82gN9TSoZjMvIN9rebvntKAtel812sep5LDizkhqe2of+50ELpK5Q8/hAt7ilrO6AWX69Q3xhR2T2qQXVtBHm/8H70SfBtfAHRIQUkLgJGbsAMTSa6hsiOzHsNBjGx8SQ/b/uNCldm+rcKMP2KbK9YI4hg9PCyDHg9wFIWDHCrN36O+I7VQBA7rkicKhvCv5eNqa9fjWMW1QhPm6qhtnJd+yOcqBcsG8r2JGHb4b0xJw3UfQEsDJvtBxuNQkb/wuMypB0fEwYZSQTdpCZVD1Dsqu+eZZPEgmYlYCuH3+75FP//AbATUm8UF7tlY5XVNYTCckD2ubkdYgiEBE4n/sbGq9AJiqCbjWegHz2kchQQt8MnijGpPHpEeCGZGWm63AEEVONzuIfbbw5ez9xPi15XhhlsR3niB1gvvQBOkFdq902TcEzuN9Hm4hD+EvXDfqEYoIOemOGsJqXhLlB0Nm9T653xjYV4R0jeJQuxHEZbxVoX55jlNHuQhK91f3+ZNypV7+FKkzssj0z95XW0qBJJoW5w7m5cms+vckdqLMSsj3XvLGzG0V1aboG+UCUL7twf8YSw2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(2906002)(38100700002)(186003)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?npmeA2oRc/1/jGafsV2UVx3L4UdcLjYuIpSAHYOLDQyuONwXfuEw/njHlk/9?=
 =?us-ascii?Q?8fCZNZTZAGGzg7E9H/ueDqSh0eo3khmdCAtqgYvmpzFMEBnsUPNVWT6OeAhu?=
 =?us-ascii?Q?jmG4DXtdFdXZ2htL25tm9S/Bz1csUl6JC+rs9O6y0S/XKrrwsQJ1p9a8Xa2K?=
 =?us-ascii?Q?gGli+1CZk7Agua+uKCQqIaCQpKFjUVJNpVa3l8Nlo+bDRuvY/icEDNsTwmVq?=
 =?us-ascii?Q?vi1nfB4bJqfxLcvTl6iTfp2pJ48hhAxJ786rjVK6IqER3noVfAmgsc5wCpv9?=
 =?us-ascii?Q?5uPo+EoWLNgIFHD3OOvdcsl6hdJlYXgwlVYucbEj/m/6CYTq8SOWBhey6ypW?=
 =?us-ascii?Q?XpqvsHKblajYYUiJ4hkcoYasjE5ncPB6MuZ2Hb0XOzf9w+mFVwlaSVpL9lIx?=
 =?us-ascii?Q?CJiVg8cFrXWViLfybwii96L3CR/UmxcOjL35pOwxMoUiq9FQq2R6G2aroq5L?=
 =?us-ascii?Q?unM1aVC0hvugu0R9RMg2FqQctLCzR9YOZyJ6d6SAgcn8E1+YGQAoc4M237gy?=
 =?us-ascii?Q?FZfAgBNHwcsEv4ank1ykbz2ayCdYn5d9rTQhIujeV2dYlh1uGAi/BsF4sxIe?=
 =?us-ascii?Q?RxWCcmZrvqqyG3U+gPZliISa07oIH++i6hMlQ0XcMB6MCb/zzF86V/WJ8D51?=
 =?us-ascii?Q?YqEzvmjUjSyYUjRsV7ItolDNPCDV0MA8xocqBTCRa+8o4S/AN/6Fvm8kHsb/?=
 =?us-ascii?Q?3trLKXQU0HobxXfA9AjNLUBdVhCTSC3FjZw+nFr0KK4ddV/t+vFcbNKS7oc0?=
 =?us-ascii?Q?1sR/gPWfjBhozQwaZlzkrHOfnHSdaUb3X/St/tCza7fuM4x8y1sr1HVUbsvD?=
 =?us-ascii?Q?sS1GzXuppz4ASG8/LNiEa63d2a9LnDI7xSHRBdmWtjPYs6/MLt/FVlVpruKc?=
 =?us-ascii?Q?MJv40QFLXO0BXGZXFAuFNNWu+nDvILrCpPtJJIN7CmwqDCsEHYB1NVgSWbOF?=
 =?us-ascii?Q?Ob/PP99siLjIbTkzJkI1F+iSo3mmna9MZAiCOqFyJIX09xuT89kJfFnrIkY4?=
 =?us-ascii?Q?JAtoPieyf4LQbt0tvXg2pRWRb3nlKTTRc9Zflyyp9/3m/I3Ott2Ukvd5/u+P?=
 =?us-ascii?Q?D2DU3MDeE/jZcQaof62lSN5WFiqq+F3SS5r4Bjzv7Os/KGn2SlUW9WQuHBfl?=
 =?us-ascii?Q?GCoBBZH++2k8Acoagz8mQBKYoHr0JdbUAM4SDAYh6s7rJS92SarUExc9JWyI?=
 =?us-ascii?Q?1wP/u5uAiZMQGz7WhTIvu3inbRkauOkhVvVFRlqhpnyLwJ76M66aMa5qiT6v?=
 =?us-ascii?Q?7yMxGX3UmnCXZzS5LWveZO2Ow6ZJuaFFOrJ3mnD4sbBUfew8WXwwPyvcv3Kx?=
 =?us-ascii?Q?guf05P/EHfyY+DljvtFBvrpX3zioAki2wNH7dvVJBsmVhJdK7M9tpXXScAPN?=
 =?us-ascii?Q?YtHe3IgB3lZiLSGZELxotcQ9A/F9G4MTuoypQzA6pHyxXBBCdIMiNb/7yu88?=
 =?us-ascii?Q?T2DHGfQyxblzLJ9DhV0kRujdc9kWKQ/zBAbS6BHPF/c1PQKjMf4y2E19mlHG?=
 =?us-ascii?Q?PdHj/Y/JjHy2FS8/FmFeTgXMHtwxeDpQOswo5U8nm7QO7SKjxESRpN8WqEwF?=
 =?us-ascii?Q?a50usPAHcpGmcdsD0TPN6P2R7mFWbsgkIzgHpUfa?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2f9ccb-eb15-4717-051b-08dab4917f02
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:57:02.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQm9LspkYXmfXlIX5tqw7Kuy9okIft8dmL9jrhw5e0DWEWvmi7PWbtMq+ymDUBDRGpSem+qE6owz9bbr5FJvsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Select variants of silicon do not define a default slider size, in
which case the size must be specified in the device tree. If it is
not, the axis's maximum value is reported as 65535 due to unsigned
integer overflow.

To solve this problem, move the existing zero-check outside of the
conditional block that checks whether the property is present.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v3:
 - None

Changes in v2:
 - Rebased to account for changes earlier in series

 drivers/input/misc/iqs7222.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index a5c08b1d9c9b..6af25dfd1d2a 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2024,7 +2024,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 
 	error = fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val);
 	if (!error) {
-		if (!val || val > dev_desc->sldr_res) {
+		if (val > dev_desc->sldr_res) {
 			dev_err(&client->dev, "Invalid %s size: %u\n",
 				fwnode_get_name(sldr_node), val);
 			return -EINVAL;
@@ -2043,6 +2043,13 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 		return error;
 	}
 
+	if (!(reg_offset ? sldr_setup[3]
+			 : sldr_setup[2] & IQS7222_SLDR_SETUP_2_RES_MASK)) {
+		dev_err(&client->dev, "Undefined %s size\n",
+			fwnode_get_name(sldr_node));
+		return -EINVAL;
+	}
+
 	error = fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val);
 	if (!error) {
 		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
-- 
2.34.1

