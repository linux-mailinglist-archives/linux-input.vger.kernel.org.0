Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A754A276866
	for <lists+linux-input@lfdr.de>; Thu, 24 Sep 2020 07:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgIXFaw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Sep 2020 01:30:52 -0400
Received: from mail-bn8nam12on2078.outbound.protection.outlook.com ([40.107.237.78]:65415
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726683AbgIXFaw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Sep 2020 01:30:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn+YMej0it07hEnOcZEFPNBVZ+GWoQPO5JoJrPvY8R1Xi9aIPgUGNxwW0K0Wb8lt7qVqxNDfaWNWIgeS/jv2f1D80wbKBJ/n80XVM5u7FmIN6fQDVHw3l1YU6q3718+XYsDRey7W2VsiVbI/baky1Wr7hHqZkWDB5+/tkAupDWlSXDrMauBYu8+66cr3FI3EDJPHA/uc8yFV1qd2qTrt896IlDBBtcNPe5RB+9A76YBcbgT994KbSl9VSM1w9ZzJHufoajM43Uokf+10qlNBhaLnU1BFUmlFoBknPlvQg4Mnh9Q+9KugJUKU7YpDj90970OtHXeKpxLkvNJRat+iUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YI7UOfCxXLQlzgrcXf5LjrsRxaDZgzjv2LPwNr90+U=;
 b=hrkMT8C86QPmmseykwQgx0n7GEzrlXASIelUuRreZDQC1x46aTgCOirtdUmqJiueY6/8lq7VvhCCh7vBb7MDP/wGgVCFj+bC7+FU00t3qdkrD4eG8IHvr77k0NyJYdl9Idh5ilrJSU4L4SSH3VuwqQDJcQBAu/cZZk70zYSbOeDBlsjSfzxIk5J96xAKEtaDp5lwQQ0dRZfulkV7IQGUAR6Z3IURqc8+qXJ+brKRT/1YBcOGa6f7irNCFKQ0o5PT9QAvZz9KTT7G5VReC5wftGgpgCJ1siYeF1s1JV2M6DoIhkkhBOHsviL8rZMrf98DhdDcxjvknO3dMo6w+2kZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YI7UOfCxXLQlzgrcXf5LjrsRxaDZgzjv2LPwNr90+U=;
 b=lvBXm7rAY8zU6EBGE11wu3QPJJEpjemI8Ah/vfQUAhePDnldtHKAN1JnPhQQzKiEg2PALsCogag62F/RQRte7GMhBjR0wbGg5hX7L21MNjswqsMQ+8OODwNvyCKDTzIhZ2WYV0GWJeWcVjfRA6SzxcRfElaO5yFOb7Wkff7MaTo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SA0PR03MB5626.namprd03.prod.outlook.com (2603:10b6:806:ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 24 Sep
 2020 05:30:48 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 05:30:48 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
Subject: [PATCH] Input: trackpoint - enable Synaptics trackpoints
Date:   Thu, 24 Sep 2020 13:30:13 +0800
Message-Id: <20200924053013.1056953-1-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.7 via Frontend Transport; Thu, 24 Sep 2020 05:30:46 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.250.40.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffcad57c-4cd3-4981-67bc-08d8604afe01
X-MS-TrafficTypeDiagnostic: SA0PR03MB5626:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB562626CA5276A34A176EC425D6390@SA0PR03MB5626.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Owj9GHaadUMcurtMgbSNpc+bwBtCR6EdFO+sA0ruLamIXL3mquC6w4I46NgAALbg61ttgfNZoVDl9IMQ3cICIeToquo7OGwRUjjxjQdDedG18RJ0FJUmYrOoDCyhNLU2XVCLrBrRuVkj0gEp6VyUzAv4XnUJktMuSM95wtLFFGwD4hhDLjmF5SJr1NROu3wwAum7J6/VgsRH0OUyJ+CeRLSYWKOcLS/jTXdviJfxXaDE819xSRU6qRpoI+f+kUDKzdm9n1dSYKdJjSLxKvYdT/bEGXkNjC+aoSkQ8cxkK7kvnoWk72XoUzJxHUA7zsYbBLiHf4FrZJo4wmbzIjMZHn4YW+fQBxiJUBJKMvxsXjzEwZuSMaOVW7j5yvEL1eJX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(346002)(136003)(396003)(66476007)(66946007)(2616005)(4744005)(1076003)(26005)(186003)(6666004)(956004)(6506007)(16526019)(52116002)(6486002)(44832011)(316002)(4326008)(6512007)(107886003)(86362001)(478600001)(54906003)(8936002)(8676002)(5660300002)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5TJE/FP+Zl6eEzfXuYa5XZq9lhScwYxwJET30wQO+SRKmjjKlJpuR6MdN7wO45OWfBbxdZ4dIPzHFAK/4Uw/IQ7CqfSxE0/Jc1ZJXw+zDxathpeRX0tDJ1yJjQNVBAiBsNIhgUfaUrD9cQYdTVYbROzX33r3IaffMM5HiRW1WmqrwCqZEMHrNMo3LoQks/H/mdEofTHP8OGV4zpINPCiR9ucnB307fDQasZuXtvXsK459+MOLj5UGGnDgwCaX2r7bUFTHC4y7wUTr7fNzfEwIPyxs4wOUKMCotU+h+R7elhbQWRqF9wIinPDtDxpx5DFsVhA+ARhZFlCp+QbQxU57XUYurSg2tU30l6xTBUUUfAc5BZoFT8i/Nf27qp3g9ozdw42FY51uerNKAwwPDu8QUGtAl4cOoywZ66c5VtJEBN3a9cw5DaagtvcHRr9BT6H0Xq4WQ8Vj2PegOIjbMDd2LO9HUecosS8bL79Vua5lPyj5BKKMY54fEQTHV97kjhyg+qndwmgHP8Z5ag3wbeqlrrFWODgkINp3LoYvLf1So/dM41Z+gcUAJWL5Qjm8T80gBI+KD0O2sulyoP8IaaTWgb64XuCCqVvlOGZbRCf1iNk/k6JiG0EjBcWJ1KNXic928L2dUkwGdmhT2zdKeBsAg==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcad57c-4cd3-4981-67bc-08d8604afe01
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 05:30:48.2852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/d9BkZv0Ty3peGpojXR3vqH/iTvRdxT4NMuORkULHPljj4mjkN8U9EbkD0Wc/xnK/UCySucnG84Rdqiv5Z1CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add Synaptics IDs in trackpoint_start_protocol() to mark them as valid.

Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
---
 drivers/input/mouse/trackpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 854d5e758724..ef2fa0905208 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -282,6 +282,8 @@ static int trackpoint_start_protocol(struct psmouse *psmouse,
 	case TP_VARIANT_ALPS:
 	case TP_VARIANT_ELAN:
 	case TP_VARIANT_NXP:
+	case TP_VARIANT_JYT_SYNAPTICS:
+	case TP_VARIANT_SYNAPTICS:
 		if (variant_id)
 			*variant_id = param[0];
 		if (firmware_id)
-- 
2.25.1

