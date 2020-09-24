Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8EB6276DD2
	for <lists+linux-input@lfdr.de>; Thu, 24 Sep 2020 11:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgIXJsc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Sep 2020 05:48:32 -0400
Received: from mail-eopbgr750057.outbound.protection.outlook.com ([40.107.75.57]:4929
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727367AbgIXJs0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Sep 2020 05:48:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2n8jQ9Q/QsEDMZicZPlCNWT71RG9sfjxx14qqbYcX1zBNd6IAhy6gfZ8Lh31uYGVdJ8CYzuQGe+SemcXSe8fDda46AUgDhnWqC7KjMWNu6ux6ShI9VERftT1fizxq73Ym8IJmRLNoBA3FivwjXAjQkRPlkh/UoinkdQ/Nwgl+a/m9M6sjxyRljmv+CUbNy/qD0SF9bWG9QPi6FvERlP+/HzinWVrfoNkrTwb7IGDt0KxVYuXp+7CC0e+sQ23I/TlOL3mk4nei+d3YaQRXfL15XnrKkG4ttzy7IhINqAYxJzRTD96WdVzvEhjdeNuSV53gaffBPVJXaqZd4IJCk0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy7zmDyTs2oyvhI9zsOvF7rVN8oWYwurWACSeTjTrl0=;
 b=mH83NADa4Q/+I8/vo76yBwXxVQbLO0AGS/E1wvTIlS+I0Qvis6NMoKmYrS43IpmLjxGNSqTKEwi+ffOx+vwT+ImLOOMqyPgabOfiMbUzEXprphV7YanNks0sKsG1XXxJhN9cERVKeu4aMMR3d3p6V2bHUSqiFx+cjihOXHNAs6sOveHfGizK+9B5vLvjEEcm6r8z7LG+pAFiZE7az5mh0OMgtZyv+oNSTK/k4kFWGlFhs7S3e90MMTn0uNWLDA+c6jnT8tA2kYaLTsTQhYJ2C/5bqFJdpYa3CopQ2bXGoPoPGmW+8mtFZia4/KXWe69W6adnhtS5IhAWF/MiRdSd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy7zmDyTs2oyvhI9zsOvF7rVN8oWYwurWACSeTjTrl0=;
 b=L5xqJn/5b31D6g2H6o9oFcox62rl4ktUMfE6+E/pXG223cY6bCiB9sARGMOTb9tc8uGyudKEbh0LcZqDGQ5ZfYoObo6Dw8556E6wNIhYtv894hSBD3CByUTjbDYuhrqHEVePRtfQKvkgShLwvNWtum/a8ff1srAxmTeMpjHezFo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB4496.namprd03.prod.outlook.com (2603:10b6:805:103::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 09:48:23 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 09:48:23 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: [PATCH 2/3] HID: rmi - rename f30_data to gpio_data
Date:   Thu, 24 Sep 2020 17:46:27 +0800
Message-Id: <20200924094628.1085000-3-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com>
References: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 09:48:20 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.250.40.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a55f5bc-fe28-4d2f-930a-08d8606efa10
X-MS-TrafficTypeDiagnostic: SN6PR03MB4496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB44966001E9FD505AF490102CD6390@SN6PR03MB4496.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7KA6St6Ia0/WCn4Gq1Y6+/bXg+nHXJRi/IC8LL7L7SCvWXOSKegC0emrEPz68w5oP0sKRJDK1TwXYJC3HiHW3Yr9zBALipVb5g3Ex+5zhNFIoISjfUFkZJw158v+qcVC6GqDuUidhrxuG29sDA5hhVb1w6L4JAN90rMQVAOcfrrgWE5OkG+VeAYyuHqX+utVSykbQl6n4mwnithrILnFD1VFcwe6VbawjZqvg9fpRKe5zUeTuklOQhvOjhLHfeHmpFIeUfDrft0tJDfd49s5wtLt3CwVcA7kheA4aRDOmjpD8UNYyXFSyuaD3rIpsXCygSHfRha1806GRumXOt57di5IM2sEQ75DQhUu/pFadgTBfxgcd9Si9bXaz6gAeRM7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(346002)(136003)(376002)(2616005)(956004)(66556008)(44832011)(26005)(6512007)(83380400001)(16526019)(186003)(8676002)(8936002)(6506007)(52116002)(1076003)(478600001)(66476007)(54906003)(86362001)(5660300002)(66946007)(2906002)(6486002)(316002)(107886003)(4744005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: eEst2ww4Q/LUkVtvfs9/FSTkvH/sxkIyPmlKP/NzSWsjyw1kn/esV8eH6wfyEns55r7ozq6Pc/H44TPOTzcz50v+w6krIio1GbtW6mnbeWuJJnrVaQtq5VKesALVzxThynNcO4+RIJyv/Goq9sRGbjS3mQqPuAeRvlFSx77iLtF4mcKQFL6v9QR74GHlpfR4ml1XoR40aiNdnexl4kSU1II2ylSJMygrS5/W5As9Q2sgC9yN53NeR7+QBUvhHUIg2cpRu57lcKCXeCEF1YeVRT+SRY6Yo2Tuf2rHIfu7r39EZOfD+5UjwZmN7S+yo5DWYMSiFMiqUnj8wioJpwH2KcOh8gUbgU/u59+2//H1YhrkAdy5P4kZBdtEU+ZDhQmN4hW0HM9MXcvJ/6rte08SogA3DoMdukvsbxfAk1ZEaGwW39fxeP2lw5N2scluTAWueDxZF+Qej+CmV4ZrqeqgwHFsRknvTrBZQxl7JhPOdXqaUtXMq9qsoF/uCZYb/j2hmEQPJFb2L+7RqsNKrFS9EQ8M9+83CfVAJabHWYRfQTm/Rx6mrhH3VatOfP+ZjWdFA/43abdeqUjgsiA1YYNEzTL4MAmuPbec5NNr1BCbBhAcN1PQITp5iwIQzav2LoITLrvS9sWxiuUpGhMtIJbT9Q==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a55f5bc-fe28-4d2f-930a-08d8606efa10
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 09:48:23.4577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfV++j8eEQOQxCAMcyZWCZuH7aX4lCfZwvmwsnooaev1yS6/Ag93swnIvLoq3bWoYVw3o/tut7pw6PKvpg4Vsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4496
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

f30_data in rmi_device_platform_data could be also referenced by RMI
function 3A, so rename it and the structure name to avoid confusion.

Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
---
 drivers/hid/hid-rmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 9ce22acdfaca..62315e31d520 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -722,7 +722,7 @@ static int rmi_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (data->device_flags & RMI_DEVICE_HAS_PHYS_BUTTONS)
-		rmi_hid_pdata.f30_data.disable = true;
+		rmi_hid_pdata.gpio_data.disable = true;
 
 	data->xport.dev = hdev->dev.parent;
 	data->xport.pdata = rmi_hid_pdata;
-- 
2.25.1

