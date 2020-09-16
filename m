Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7947D26CCF8
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgIPUwK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:52:10 -0400
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com ([40.107.236.81]:43233
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728589AbgIPUvw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 16:51:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTNREUrf/94e6nQbIbWhTVZray83thTgbsnKePmhEsHQsEztHNAHkl+pLSQej16cR3aWwzvBlU//+Nr1jR5sPoKt/ttBhA/HhQC/ybDr3CFqa8Kdgw0r+TCqL+TnVRp4Q3d0jB9taPunOMEUHoJ5zY5ILBtIYjobLRlaxwYZBsAfj3WzQwjPnmivw3F1B59YCvp6KLRzv+rHQUkW4a+N3DETpz1xZ9mApuOpe8na6+RwXVkMZ70wYwrp22VWaWqX1q/PeJ8NA9CsPR9+n5op7GyDYYli79d0KQ5sRFiJHSDh48g5GwEqNKGqu+F72aJ00NMmV1dEIN0ose6lc8ykkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZOS9QNE92oxGWSPhUfAu6jraI0qXSySjYhObHDbUcA=;
 b=Qfssxm3fLMg7b/TG5JxEiOWDP5QPH2iAzK3v/g2ybJcBB8+Wda7GmweT9R33UFDvPttZaN1BcQRrckyckul5CG2jUhXY8+C4sToHzenzxE9rFEMUCyfnHj0WX2XR6OTOptn4j7YkWNBXirvc2x+91dVFrr/axfI8UYJBAUh/xkQeCKmkF19wIjG8J+ggxJ4E0O0jcITid8UO3tgIBeY+5dkawD/53F8BGbUzVWqBsgVqjRefZwGMpE1ybMjB4dLcgNToUXCLcjpWIxaOxkpZtqTFZkMWTRAwwQtyGTsr9qYxMjCofyEnikTFk/NX+NH1CoIvHmYbkbLhEVmal5LzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZOS9QNE92oxGWSPhUfAu6jraI0qXSySjYhObHDbUcA=;
 b=RkCWY+gvsPeOvXXPTjmdzd4BiroLT3/mDuae7oTHKXEYUhpI8s4qYesZOUfOAfqcM6o04oC1Hf/uBrc7lKNed8HZ5v7ZNh9Jw/ZJ0puKbodrpIQhGfe6Nva1qO8ySMXBD+CW7sZit0ghiDOn6InzbFQSlR6jA2O/ykZq4AD+4VM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4094.namprd08.prod.outlook.com (2603:10b6:805:1c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 20:51:16 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:51:16 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [RESEND 5/5] input: iqs269a: Make sliders two-dimensional
Date:   Wed, 16 Sep 2020 15:50:00 -0500
Message-Id: <1600289400-27632-6-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600289400-27632-1-git-send-email-jeff@labundy.com>
References: <1600289400-27632-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:805:ca::34) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 20:51:15 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 406f8ed7-0a46-4d9f-d2d3-08d85a82411b
X-MS-TrafficTypeDiagnostic: SN6PR08MB4094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4094B546780882B342245E12D3210@SN6PR08MB4094.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDIj55veNCcyD4RtE2moWbF5iMUFKMo9hZhiBvDQ0RHnEfqXzwxT8LuxCXFVMTqrSrE44BRIWbOs9KIekMc4szPDewBWCtXIjve1G9PLzcvRPk7CA8IdDRB4O3QOMhiSpE0pu65Tp2Hn789L+sxcZWE9FRdD7r4rorQHzj3C7CeIcSvPe3g43Psfk8aSxgP60IXbOfBppwI7duE83bYz09vEKEOmVRxP3ZNaxRWGmq0/7pAcggpiCm7DeAl4mZIjJhvsG46dEkBAAjZ7zziW5QY0ATISM1ejR/Rfq8zPVd85FNCTl6O8YEInSKS+ZzeSyE/MexkrsgXyls3d9EMCzyeM9qQxrh3a+0otsw3zhE6CTlCg2wyaJ4rjadmcndQ7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(346002)(396003)(376002)(366004)(16526019)(8676002)(4326008)(956004)(6486002)(107886003)(186003)(69590400008)(4744005)(52116002)(478600001)(36756003)(6512007)(66556008)(66476007)(6506007)(316002)(2906002)(26005)(66946007)(6666004)(5660300002)(2616005)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: dumf+idUBYKAMpXPA+FQMMNv6drGC6HNBrwxRcNKD+1VTGhWXHv5uWfqwiOJSrOlDnI1Ud5KN4BCTTfVEO5LDzr2KHLaLJyr+nDNijWARdJDCsINLx6pe5coYeMh0pt07xAcvn/nIFvaYbAo+05aVNv5+wx3AGG5wmgcztUE3hxqYSjtaizxcl06yLErlTP7028+PobX0SFfeuYQNh3LWnWQzoxb6X1yNkJ1zn1696KreR1FlzjcGHrU+bTxfTIJrxWLTUm2frQJKKElu+0ag6P9Zs05HNdP7bqG/F54rFSUaKglVguK21t6RleH8JNMIWTPUAiyNvwfh8ysOzqcd+k2CNxK2J+NCQtg2UUNElAnU2zWr661Y5IGkCNLrMSM4dZrd4/8PP5+wuKybI5oQgx+xCLkAKrg8Ub0zjORwfWWNjm8shfruvACkCztyKawXD2znzfIN0gofSo8bwdZuU0Z0JYDnHOvQytin8CQKwsNP0U7iQ+DvdDMsWtokq0PyxFnv81OycmzyCz3zk7w/pKzeQsJ3Va6j9xd89CNMQvdigcTQUPQHVpXIc3yazE4t525KES5+vXjKLF03pVgI4rkeAv1IKls5BXs3ojKwX8UNbCrlAA9BLwsQ4S+VHufNEJ8m3w1s9Qk11rdqKFrtg==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406f8ed7-0a46-4d9f-d2d3-08d85a82411b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 20:51:15.9754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wL3UgXclz+I1fgyh1D/fqU5SeT4bGM7Lf86GY3hb+S0EpvxgTq+Cw7h8TcmOM+ewsIZoVQFTNutnJ0yJsIpXFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4094
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

libinput rejects devices that define one axis without the orthogonal
axis, as well as devices for which either axis's resolution is zero.

To solve this problem, present a thin y-axis with a resolution equal
to one.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 04947f1..4a0e4ec 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -1377,6 +1377,8 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 					     EV_KEY, BTN_TOUCH);
 			input_set_abs_params(iqs269->slider[i],
 					     ABS_X, 0, 255, 0, 0);
+			input_set_abs_params(iqs269->slider[i],
+					     ABS_Y, 0, 1, 0, 0);
 		}
 
 		error = input_register_device(iqs269->slider[i]);
-- 
2.7.4

