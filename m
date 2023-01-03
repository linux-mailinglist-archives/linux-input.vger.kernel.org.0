Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2324565C588
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 18:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238284AbjACR7I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 12:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238554AbjACR6g (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 12:58:36 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA86D11474
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 09:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYVC9E73yv6JVx6NpLsvlKrptCsVVT0mKYX6nqxMWsWZ3n91EqtywuqjuaIXUJAqNlh33c4PC0nx3PtZiE8RW/g8dqq2glcOPYXs3rNx77UlHZN3p6zFTBTSyfuJO8VYSH4YXgh8WmLXND6RIIAS7HH/MBWD4ll+OhPv4WY3uYnvJIIjr1MLyaLdQ0ssbBocWWzhmJnTLQ7VbPdmm+zr9ybbEej9nlVqsWTom7vSxMeXmlpzSTwFXVlhewUSuMU5jiPaP2aF6zQfkmbPF/y5GaFzwuEDARfDWpo5evZ+E6Y6273GNutHALnID9D658eXKga42Yvrr8TnFyLn/QHDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4O5l4+WxGyJVkUPN/TKSf1paCeWD8d1NAtRK6yvst0=;
 b=Z/YYgeaRknaW1TzrhC10e26rriSQeCVeM3VbXkT0E4YMyH+pgeBjj1aVkrXS4hhm/omYxmH7zMrCYhXilBwWRF7AfwPw7krbxlRySEofMQ8V4jO+yilAPvTaIUsKn61oaVrSlDqUs7cLS/wuBBrrMWCZRIJb0OcGA5hhe0z/sZiC0946SLvvJ2qyidXIDsoQAgmbTb7nrV+yiCacdGcZwSNz7pxQzc1G9UbdQU46Q0gBMDh4UadEQJ3kn/8R1BeqqMSiyObD3LmDMZZkQn6b31Ktu3A0Gf47crZ/2EV9L7jTS+KhYRfRxMZPuI76uZEldbFgvTYYDUcP9ouutHIEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4O5l4+WxGyJVkUPN/TKSf1paCeWD8d1NAtRK6yvst0=;
 b=Oouz50rIL9hgoTw32vY7HWprYYlOzs3WrRPfN/3bkuLlh0ecn1+0ZjHTv+hti/MBmRgHwAknKlfn6l7Pl8+YU6A9++prSsHJ8hzMwZL5YZEIA/pFREAXoXpzrh9Rm3h3pWLrcoMawnQ5oGJrbrCwXjaLKaObnvV78zCUTtXda1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB4474.namprd08.prod.outlook.com
 (2603:10b6:5:9f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 17:58:33 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 17:58:33 +0000
Date:   Tue, 3 Jan 2023 11:58:31 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2 1/5] Input: iqs269a - drop unused device node references
Message-ID: <Y7Rsx68k/gvDVXAt@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7RsTqhYJOZs11sK@nixie71>
References: <Y7RsTqhYJOZs11sK@nixie71>
X-ClientProxiedBy: DM6PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::21) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a326be-3cd3-4544-3eb4-08daedb42125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LjQVQFCKQFpK6Ux+RVDsqF/1q95rR8ls1rutPl//WB5m2R7YkdaLgbh0jNzvewBYYxvZ5NNbUGteYLoYVzHJswSEuNnQVbaIrbFnlpyXIf2TSIZB67sstIOh7z+ODNWb1LXqT7NkkI2w93r2MVsw/8sDzoCLyMMtrmRmbi7pXvzFrLUo4YY//aGntfBP2FeNyMHaOa7yjnmJOMErb2S9keUY2d5QZe+La/W4gvtnAZH3gMCYCKTm5mnpqiQV4Fpv5QoTzRLGup3zOZBZnWk67wy0RdcU4OYZ8ln4QbeFB+ORVeTbIZh+awgE/2ej/9ANhKkziw6eT5+iVQ6roxcbdDd4fbvwt/h4GLfD3AdnVxm+oalUW1nfc1DEqIyncQ41JJxCVt7d49meduZH+1uqYj191tKhppUqQ37/Qv0fFoUIpnnxtFYUakxK/I/QoHMFNR/ptRQRTAiKlYYFUbVBKi6RgUKEaujyy4DfQAxB1IhzccaaX+lJDXqho38Gdax2cv89+AH4lEVDvRyDgIdWHPEAtqBf3bvnf2HqqVdw1+JqE9B1oLbDSpE7w3aM6eQS+c46RUfPi11SKaW88dTkQ5itUQz/aq0VFwY59vHL27SvEgtJlOv1H3wITt9m7wXYIYU1t56PyuKGFPdXhPKXD+ys0szVzl/4zTeKaSuqiGrtnzwBOweIk8/Zu0kmnsje
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(376002)(396003)(366004)(136003)(346002)(451199015)(6916009)(316002)(38100700002)(8936002)(66946007)(41300700001)(66556008)(8676002)(66476007)(4326008)(86362001)(83380400001)(33716001)(6486002)(478600001)(6506007)(107886003)(9686003)(186003)(26005)(6512007)(2906002)(5660300002)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Nzfdsl2BifipI02bF8hqYKzRLBzzFy4s3cSsDg+4cbLvQ/kodNdQoRMox5q?=
 =?us-ascii?Q?nO/Is+F8hQ+LsWFfbTEFMOhNh+DU7O52ruS0N5Z/j4TGpfN+1ewgmTfsH2CN?=
 =?us-ascii?Q?cnRtYAoC27IUWZmE8HC/cz/99Xmh44VnK+LggQ35hHrM5wBQtA00ymnHYmO1?=
 =?us-ascii?Q?jYxgWpXl5bW31DtccTc1op8kodHrb1zoiGa745Ij5UBMLIAu0nQTPBVXRCvP?=
 =?us-ascii?Q?hU8UqvMzUuusgX+9VqMa9Dgxc5pbKuJgSScuNjba6DPMMDc+BafqEkRtwyl9?=
 =?us-ascii?Q?redWdnVeIN3bwDQi1ISL+3ijGVUexW7j8HfVxc4aaD2Pc16HWsyTsoFc/3L5?=
 =?us-ascii?Q?HPuM7uKH2xMf2cZPqJtj3WTOf5rfs1OKqySx/wNWVmfaSZEsX9aQwx1rPTfZ?=
 =?us-ascii?Q?Ul34N768TXoj5IcagQia59AE9hdX0pO6ND6NtzJZ5X/iiFBkcwKQroBl8gW0?=
 =?us-ascii?Q?wfb9OmLg3Zaawvljbhy6HtMBDbXivhC9JAn8iF1+V44terscHtIaz2e85sCA?=
 =?us-ascii?Q?GhGQ57TI53Ny7c4S7sGHi8zWOK7SDNiHczzDyOX/L5mJIPFu6icNfQELVWKV?=
 =?us-ascii?Q?K4iK+93Utho4izzAfn/6wcZwrsjSLk1pDr13E/eOq9dm6MCsTundXolStFR/?=
 =?us-ascii?Q?6Nmo9igd4Yi/Rui3gbmVAs/y1QLPDOCjp/VFWCDtEXkaiQsVSTPbxHprlI8M?=
 =?us-ascii?Q?fZqAZhAACwRmknTalG/0XzWy/yzHKlR6c5ft7LGHW1FXpBFS+5eJkdDsk0Rx?=
 =?us-ascii?Q?mrhabz/zN6wn12dCLcsxwPA5AjKtKMmPu+SStysGQxRnPW3eaf0pHSpRKNEB?=
 =?us-ascii?Q?boxuohQSBSRj6oZ8uUbd30W8R1/+5nxdanZnFL/9CO0qcfmWg6WVY+erayc3?=
 =?us-ascii?Q?nYJsuanukW6h2uOeOsMHU/juSt2m40gFPXM7CQVMbb21dNGxu4pZhIv5LVrj?=
 =?us-ascii?Q?Q9Nyl3WrraczY62GzWMIsblLnYufdRLNULloBU0ZaVCxdwzJWZ1lO1Ei6tui?=
 =?us-ascii?Q?D6Sv+cugRiWDAnVAkVfwbZ3L7Qk2m3M7bFaiDU2fd8xixntivaaftLJth1Qs?=
 =?us-ascii?Q?Hiqjl4T2EbrOaINqYFDZAXuOmf5LB40Z4vbkDukNS0/EEGkm/ClqZCAO9qrx?=
 =?us-ascii?Q?BYdI3pwfpdDiqQVpx0UMlboIkIf0FT0XX6cG3X2isHBgS8n27a5fZsZL/1DT?=
 =?us-ascii?Q?dede/SfiJ+2pUITwdkN1A63KZhz37xOB++ucfjr+3xNgP37y80GgF3QzTgB/?=
 =?us-ascii?Q?HP4ckx90Bjpha5rmufVRQKfWg5s3uels5oDFPQzyOhFEHRX035OLTAVobd+K?=
 =?us-ascii?Q?PP9Tw4xkxiKUZYqKj3fhm4csc9F23uXObH8XQxz2gslIFN0YS9Ha3j5FQh7A?=
 =?us-ascii?Q?UIG6MNiKXdyWROkAb6dUDaAl3IByutf1ZET+bgDC6WYH3mXPPtCOlK6a7+AT?=
 =?us-ascii?Q?g71khIGMlnwTYNnZtdXyD6j1E7UhWkQ5sKVb8NSq3ugkc58LDDTFKIbTCqjy?=
 =?us-ascii?Q?Mi4aGr//1H8SCNXtXGpMp24wkjoqlohxXttmV+Xydy5KhgaXH7ffHkhqp8qG?=
 =?us-ascii?Q?uTfGvB3+F6FOV/PJbpi4G3WgrjJB1CluqxlW14kb?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a326be-3cd3-4544-3eb4-08daedb42125
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 17:58:33.3737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQqkmvObTvMbOID/G+fuRW3YMDV/vYx2Y9yBxCu7nWB2Zdrk3Ac2liApBiRG7DdEPi2S1rgSIPftZ5aHqY3BXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4474
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Each call to device/fwnode_get_named_child_node() must be matched
with a call to fwnode_handle_put() once the corresponding node is
no longer in use. This ensures a reference count remains balanced
in the case of dynamic device tree support.

Currently, the driver does not call fwnode_handle_put() on nested
event nodes. This patch solves this problem by adding the missing
instances of fwnode_handle_put().

As part of this change, the logic which parses each channel's key
code is gently refactored in order to reduce the number of places
from which fwnode_handle_put() is called.

Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Minor refactoring of error paths

 drivers/input/misc/iqs269a.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index a348247d3d38..ea3c97c5f764 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -694,6 +694,7 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 				dev_err(&client->dev,
 					"Invalid channel %u threshold: %u\n",
 					reg, val);
+				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -707,6 +708,7 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 				dev_err(&client->dev,
 					"Invalid channel %u hysteresis: %u\n",
 					reg, val);
+				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -721,8 +723,16 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 			}
 		}
 
-		if (fwnode_property_read_u32(ev_node, "linux,code", &val))
+		error = fwnode_property_read_u32(ev_node, "linux,code", &val);
+		fwnode_handle_put(ev_node);
+		if (error == -EINVAL) {
 			continue;
+		} else if (error) {
+			dev_err(&client->dev,
+				"Failed to read channel %u code: %d\n", reg,
+				error);
+			return error;
+		}
 
 		switch (reg) {
 		case IQS269_CHx_HALL_ACTIVE:
-- 
2.34.1

