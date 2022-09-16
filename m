Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD41C5BA5EE
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiIPEbz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiIPEbx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:31:53 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2063.outbound.protection.outlook.com [40.107.96.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4450B558DE;
        Thu, 15 Sep 2022 21:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rr20nZglYqxODQa3byILmGD1jqyHTuIZWBg7DRVyFiIe7HK4GgC+L4uXovKiL7wbgmDeDRw2UV7pUQHoCmP5TDA8iw4eFvTC7dLePBL+amnx1QKUQeoZwo9JZdcWuP9TTIPMXotGMrPolEupwIMSR7U6tG8vXuQD2lWRlT6UnJUI8YBRn6NtPrDGhnht9HZpdL1nPyCNDtdx0ne4sykYb+kvfr/oA0XcHurA+jReu5mQg9sRMrF3lnZxEJ14y3vfRaDlC8xv6n7++OBWB5dABLw1MxZCWtuKJ0Ap0QIBg8NCa9vjnoxSGBwpynHVnJjk95BS/tk8Qqq0DGcYZMUscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbsnWtist44WeBoTBHertNl1L9gKD3nD0ppGUQL00wk=;
 b=dCSeS2x4R3kU9mjf2cUCpGWIo1nxcbzglb7fYdr4AlAEkLy/Ws+G71SBdvKGn9+99Rl0VRqWVIphcCvZ2SQp7OKWLfT96oQ7YZ3MTs2LfrYVJHm+Bkkg59Zdi9/WY0lBk2xfUSbX0RYLqnjMC7rikL7/tFUYQ8gLvAhXSScoh8ka+FMVHfzGjk9E/Ukrz2lipA0XrfFMY/LJ06PElC2O9uuOJEgn4GOaw9DsKElC8XOQG3k9kGYwO2K+V1GOP5XqE8JLBHJStvRzfCFFGz/js+ozMaI/tA6BfO1L7dBZXxATvUYbXBsmKFRfzIO3+LACTDm6rJRbAO/ZSrJnM4PDHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbsnWtist44WeBoTBHertNl1L9gKD3nD0ppGUQL00wk=;
 b=WxXhQhCpy92AGapZhp0u0IoZwcQWwh/hsAcdwqzf546YoHbc7au4OvSyDMJISxuNcAsACV37xMy6uAoK+qfa1mfydMRmRmybg1t3rENlQWTQxKjcF6dL/y2ruVSLTRVIuv5HBBvca/voeYSTL3D41X6758NdDjPD4g6SxiIW0pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by PH0PR08MB7210.namprd08.prod.outlook.com (2603:10b6:510:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:31:51 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:31:51 +0000
Date:   Thu, 15 Sep 2022 23:31:50 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 5/7] Input: iqs7222 - protect against undefined slider size
Message-ID: <YyP8Nh8CdQr3dwiH@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP7l/ts6SFI9iM2@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
X-ClientProxiedBy: DM6PR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:5:174::27) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|PH0PR08MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e4b1c6-8bd5-4674-c6a5-08da979c607c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +HCsTkvWGHjIMAXGeOpUJRtVyFDH9T+gXsKo+7H7zLyDsxsCdXdhUxg86ZhqHUbhbVZNpJS4cm6FvrBZqtLW15Q46ucIOn83bztyQz4XB+pL6ICHF6i1dz4eJKoo9/b5Lw1yoFuj6b/bkfgYfrypcheDtbF+vMALWNua9RJi7OHf/a/+or4LMps550LEzh7S+oTsy8tfv6TU3RbYbk6kr0Z5+/729ubAE9xQ/BFy1zRuxuFFEXVpH6cbrbJU7DQTDSfAuWhfk/3Alh4kBWIqVkisAe6pZ+E8uvME5HRZfHGDbJ7a9B5nJKuBKE8/i1nHO3jbO97393pVBm3JtC7i+7B2etP/eK3X56vPvvBxDdkmSGGBeqyhSDgxcwAzHagDx62vqvAgDWxo/9H76CKGDU8oMUZqUGUIit6wkmlkEAE6nAOuveZwnCDXZyfEqZM5+0KcEeqd2M4GfUiKqOtotAXBIYcFOdYqRaiwG16ZL64sQNC5wLmMxfVpvPFbx2LkADQEzqwXn5sk8ubLSUqHl+j7yGAWEm9saUImiFkcyFVzJ8gJCWM5sPqlwxVaTSaRyFSMGF6IMZ43fmKH40f2Ejr7qSEdhiOY8Yv+4ImF3KysMb/rEzlKHTrRvnWF/2tDfp5ZKBYiTzwGsrsgJLOxoPF0xtgfBlZEqwz6u0mlG0h+krhe/fwe6eXqD1rZX556iY3QhHsPsIA3+Bqpw8+DLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(376002)(136003)(39830400003)(396003)(451199015)(86362001)(33716001)(6486002)(316002)(38100700002)(478600001)(6506007)(107886003)(8676002)(9686003)(26005)(6512007)(66946007)(66556008)(66476007)(4326008)(8936002)(41300700001)(2906002)(186003)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FdGcLMsF6vJCDVESGTDY3gcYTK4PnnoR2D951E7z+WVu0vkHozwGW2v0Z5TG?=
 =?us-ascii?Q?IBhDQfPCwzWSCrrbSkqaYfmLR1zYCznfEbjrjSyBqH+X33EcF4d02355SPdE?=
 =?us-ascii?Q?8rWTyAag2sY7aYFeLi953G/Lc8lTXKMZeWOMVEtNDb+U2+3hSGgcQEwlKaa7?=
 =?us-ascii?Q?ZcKMrPJ93H6yqoUth/7de+oZZyHx9LlAm6pcByarIKtFWBirx62aZqayjy8Y?=
 =?us-ascii?Q?dPmPXyHedKL8OdyKvEuHhPsKWEAq6NJ5pD+xnVvl9o7QCk7I2HVAAe3HYGi9?=
 =?us-ascii?Q?04FfVQYMRpxKFGlmLisbPbU657SfVJ+LUK1cJz/0ul6lXR6sz+Yoc4QDnPyH?=
 =?us-ascii?Q?H9XyHJtzd7dyN5fBvM+ZKKE+1TEs984I2tPVYU74cTeajUbg52chzZgakLb8?=
 =?us-ascii?Q?8DOVlSSRxm69bqLp40x7hhhGJr/Uf/VJ8l6avPoXj4YweC21zhirfBB+q8Ex?=
 =?us-ascii?Q?2+mdhGribqgP4WSQ0j4mYJzP4CfmY1l/HS/RF1LwLgnxc3Kj+AR/MBclB/Jd?=
 =?us-ascii?Q?9pi3U3zDupLJT7ddvyo0PZs1IsUSYHZnLWg3u0Y5zEaOB9mfPdGUVJXdLr2K?=
 =?us-ascii?Q?2+0rRkvE47KkDDu9sRF89BzlHMqDuAmt4TURC2Q/3NBfJaaEyow8yPGp39Ux?=
 =?us-ascii?Q?4EMsMsw371h/j5sdQXgTe4jAGCz3zkirOAIOvHE80EGztRubBRB47CoeOGep?=
 =?us-ascii?Q?3PlDSlL8C5DgdMmD+DExI8prMw+NZkA98x6lKcvGAwE9a2Oif1gg1CogStfG?=
 =?us-ascii?Q?Sp7xB2A3b4vfs48QotdrDWJGM9Cj/kEReqFdNqqsGyet/AqLVUKm1lOrdqbP?=
 =?us-ascii?Q?VaTfqCv19AiniNWl8ovskx0kjkioKDW1uHFKcM7kY+o/PJimwwkZxB75ZFju?=
 =?us-ascii?Q?NuFffj4Cmniu8xHgEUuiT1f0EN8p8ejLITTK7XPh6iUqJDGSB/29m9gWtZVy?=
 =?us-ascii?Q?QFy0m6Y2/8bBIygum31fyDL5orJ09hRcb1QgcMuZ7Tm1mCZjxrQBIykrrucg?=
 =?us-ascii?Q?kLU0/Zi8pc5mIQl349VaqyreYeLv6tdNVuDrypa3mut+W/CfrJoN5/n86Y91?=
 =?us-ascii?Q?MZFq8w1esXhdJ3E8cwj4pttzAh1QOpZAEs/ErTf/cpp8SNVlDGAsAuuIkYiE?=
 =?us-ascii?Q?VQ2rq6pZGS1rIraP1H3mxM1pONvKk9Ol0E+j4TzziArmuBmh1WlE1WcmpKk0?=
 =?us-ascii?Q?M0NUUI39y0BgWjNC97vxqpW7l5Ax3CukAESDoEaLA8NImynSyrXNBjv/7kdE?=
 =?us-ascii?Q?B1tbWU6AY95CHY1hXESrMxAPe3VuAvHiQY4qKl5Vqu0heOJxPLihgreQd/Z5?=
 =?us-ascii?Q?wi69m3FaKrDWcZxzcW9j0vBa+rfyAKZHhmizQoex7mZpG3f7UFm8AC4uMLa+?=
 =?us-ascii?Q?aEt8i7FIHI1ODtcxy4fGbtNJ03IDL1hHyqaGEradhGKxAJRd4ITaUzn52tWL?=
 =?us-ascii?Q?TbcLVNMSOYODMIre4I3YqAZ1ezh4xiDeOP7oCA4Z5cEGoblgRjOlIMfaixG0?=
 =?us-ascii?Q?aTFJcEXGO6QYhKdNqLxrBwVdxXrjboRFBySgJVxlSHyIa9RqCzA2svkj62l2?=
 =?us-ascii?Q?1yAQR7Zp/qtnSadOz5Oa0j+Nbv7eeqeVQRKlD9oZ?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e4b1c6-8bd5-4674-c6a5-08da979c607c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:31:51.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mSB/yLkFr8xgczYVkm7ktbSIQT414AnarhHrBWdxNkvBp5Ddai1M17b89oP1iDwIqN7IMhwLadh/SW52BfzPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7210
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
Changes in v2:
 - Rebased to account for changes earlier in series

 drivers/input/misc/iqs7222.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 36c3b24e99a3..0a592b90f471 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2042,7 +2042,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 
 	error = fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val);
 	if (!error) {
-		if (!val || val > dev_desc->sldr_res) {
+		if (val > dev_desc->sldr_res) {
 			dev_err(&client->dev, "Invalid %s size: %u\n",
 				fwnode_get_name(sldr_node), val);
 			return -EINVAL;
@@ -2061,6 +2061,13 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
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

