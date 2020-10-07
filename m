Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F122285763
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 05:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgJGDv1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Oct 2020 23:51:27 -0400
Received: from mail-am6eur05on2073.outbound.protection.outlook.com ([40.107.22.73]:46945
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725981AbgJGDv1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Oct 2020 23:51:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS0tp7ERE+rGkhd3HTag9DC3KBSjSumcbbvfXhOUoOBbkFYGQnn/mr9Fntnq1AqYzrEnrrmjUy/Vz7gvGU5w58tYhn4cwLI82ptqmw2rb/H9pzOrrtjMLILuy+HseePZtEFs3vhn2+dbI83+JRCRpyz4WlyiQ4z+vV70QSMvPEYOmxvmv7hm2YnU4xHZVNX3AgdiygiePLb+Unnd/4IDcjKpGJ08xWTISMBQiHSXZcCploAw6IM7N4Tnq5KBFzfo8HbpfyhwhCo+S5lD8W4hzCobFUiTXcGu8tJsFkUIb5cCJRWFf7oU70uqA6UXJS/8bRTAnH8C4CECjOAblf+yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGom6g+x44RODCqZSKMf2Pb/GYc+o0nsJKpTeamh+DU=;
 b=ZTXp95x58dAFU2+m8gb2GQP8tqJA2caQ0HcIcPFNVcJvVJPMT17kWpZGaRD9aIyvevRhzIDp7FkGq0m0tP+wgVYeQns+v2wClCkSEHsglq6UP2AVTdXVK8YqQ6jbvMIXuf2bL7HzWRjq+TA3DWkE3AtI1py2muaGclTbz/6QsqrFpCcpp+UlYO3qh6SZFRm2QtZY384gMnFZEx1ZECL3BviRJYt6Z9UfytvTp+fKbiZ9qP68Chp0K+REaDnx2zCws7A4VkbNB5vR3qrLxUcCdcTOof0DeWXKtltDsyHxjJAaWLltvFRzowVzlUpaanHzO1XehWAdH23O7Z4DkE9Ijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nextfour.com; dmarc=pass action=none header.from=nextfour.com;
 dkim=pass header.d=nextfour.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NextfourGroupOy.onmicrosoft.com;
 s=selector2-NextfourGroupOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGom6g+x44RODCqZSKMf2Pb/GYc+o0nsJKpTeamh+DU=;
 b=hScLDr5ec2sK09PugRSPOtdZVO6o7spfu7KeZqS/vD2QeHqgvTiemEnmtZqUPP8VBlpTmqpCnnAWuGFoYDMM4ScNwqwuUkXJg6SkNuIyPZcOv/xmFqguGgon6vakcDIINIS2eoCaRte5mip9S4ZsfGyIYFwcSQzE6AkzWr5ai5E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=nextfour.com;
Received: from DBAPR03MB6630.eurprd03.prod.outlook.com (2603:10a6:10:194::6)
 by DB6PR03MB3077.eurprd03.prod.outlook.com (2603:10a6:6:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Wed, 7 Oct
 2020 03:51:25 +0000
Received: from DBAPR03MB6630.eurprd03.prod.outlook.com
 ([fe80::c0be:3d35:b3b:116f]) by DBAPR03MB6630.eurprd03.prod.outlook.com
 ([fe80::c0be:3d35:b3b:116f%6]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 03:51:25 +0000
From:   mika.penttila@nextfour.com
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     =?UTF-8?q?Mika=20Penttil=C3=A4?= <mika.penttila@nextfour.com>
Subject: [PATCH] Add MAINTAINERS entry for SiS i2c touch input driver.
Date:   Wed,  7 Oct 2020 06:51:08 +0300
Message-Id: <20201007035108.58636-1-mika.penttila@nextfour.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [194.157.170.35]
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To DBAPR03MB6630.eurprd03.prod.outlook.com
 (2603:10a6:10:194::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mjptr.nextfour.com (194.157.170.35) by HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 03:51:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19244a97-dbdc-49e5-d645-08d86a7442ff
X-MS-TrafficTypeDiagnostic: DB6PR03MB3077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR03MB3077AC5E98388F80FAD742CD830A0@DB6PR03MB3077.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRbDNNMTnphB4AuuLNtfniSdVKAxL5DjiMlSwUrWP0O2X9A3EJOIw1Al3Rb6sfDTwnXUnedZstlpW8EDE0lMYtBpvBGuaOYWD6Js4qN3MUY4prO6T5I/1DNYbhlJqBaCShnysWdkn9yXl3XUA3dxEULTx7kJdi5UhRUxRa5tqI2UngZ+oJxtE4qHAi47bn4OQ+hfHIJeKaFnBG9pIcl3bSPkvrudUu2qFQZ71nRlvzYbEqqq/ldl2+/drt1nUJHEa7+auFX/COOhLIrG+ITxhxC6YN4tXJFrCw+fA/UUeNLNNrDyF6iCUxWIuriG2Zqu45F7yz/VY2cwQ2HneR/x5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR03MB6630.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(39830400003)(376002)(9686003)(8676002)(5660300002)(107886003)(478600001)(86362001)(52116002)(7696005)(316002)(8936002)(2906002)(66946007)(66476007)(66556008)(6486002)(16526019)(36756003)(1076003)(4326008)(26005)(4744005)(956004)(186003)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ojkoC4FwgPQ7qLRdokrflpjEJq2dbzs+YbkUPvonK462Ojhz80jm7q24vzahY3HNy8d/2PCGuj8W+oS+1P/Jm+OCFq7Q6TonhF2xphhYswFcREE5E0MqWGmkeQ7qURFNVlN+pggxJZg3GcO/0P3sOsrQtm1+EDIA5ScCz2ZLUM40clvC9rynaR/lTxlym2A6La5+X6gro00C7dfJwy3HuTbnq0TAK+/e1yJlUcdVO+qn5jhFBpc2DdEUc3KgaejwZ+6MHLBcAGe5uZdqQXhoDmajUBGi9wjznpYcaQ96GuKHSB5VKlnfkPDstshstW7W5jLNjqge2e4c0kCUyOIbbdoIC8khWZ1jIettj/TOvqWYlhO3Qn8mCcOBt6xUkhsmtrBkuoIrarU0se+EttqaWwWKtEpeR95g5ZQvLx1sBrdG5/tKy19F4nCKaxGy3ZtsuGWwSkUH+0BMBPXt6WILwdTTlJZZR7dP2ZIW/YHhAOYQa38V711VmhhzPXth2R4ib//4fYRmC92efuqdYaMHEiHmj6jXH2S70PNc6DpO9dy76dLJ68sVsqOthW0xk1oKyYL/ycCXgu+HcET8TWF1mWS3JMN/NPk0MYO6GhaB1huSg1sGoPch4cMKDk/ZSs/fdz1oXfnUdoCwY/aOdoFoKA==
X-OriginatorOrg: nextfour.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19244a97-dbdc-49e5-d645-08d86a7442ff
X-MS-Exchange-CrossTenant-AuthSource: DBAPR03MB6630.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 03:51:25.0039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 972e95c2-9290-4a02-8705-4014700ea294
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz6MPfI9KjaZAg9ZLXvPUIDfHxAPXIVm9rc0SU6BhQm5SRxWdXNz/w/A4aBMbmb1W6ocsuF96uvhbw/a/AWl9iQC7eZsaSs6KjiHi6nkg/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB3077
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Penttilä <mika.penttila@nextfour.com>

Signed-off-by: Mika Penttilä <mika.penttila@nextfour.com>

---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a54806ebf02..b13c539783c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15913,6 +15913,13 @@ F:	Documentation/fb/sisfb.rst
 F:	drivers/video/fbdev/sis/
 F:	include/video/sisfb.h
 
+SIS I2C TOUCHSCREEN DRIVER
+M:      Mika Penttilä <mika.penttila@nextfour.com>
+L:      linux-input@vger.kernel.org
+S:      Maintained
+F:      Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
+F:      drivers/input/touchscreen/sis_i2c.c
+
 SIS USB2VGA DRIVER
 M:	Thomas Winischhofer <thomas@winischhofer.net>
 S:	Maintained
-- 
2.17.1

