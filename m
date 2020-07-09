Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D9D219B06
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 10:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgGIIjU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 04:39:20 -0400
Received: from mail-am6eur05on2070.outbound.protection.outlook.com ([40.107.22.70]:6052
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726247AbgGIIjT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Jul 2020 04:39:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnjIbPZSsoS3fLX4acqWunnwOl3FejVoFM7tYtsmZF2rk0R3pBqjM7EnhOHjkRwzy5jBBbGoNR+VAoAe5FTFov3hyZ/NB+CqGZVgt18juo6P5iTSKDTDhERhSZ5i4q8e3PCj0q4hi0qnzsPBkOMfaNk0iCQbd1mbyZZisF3VtgsnJNawp/SGnZpeSgBpOh4fW5aOAKxSFe+6evhnsSREQtwwI0IES/7kS5z17hT7yGIARl72a9VTFuR8M1VtQeNnD798mdO7ETe9o6e/gjTCqoiH8L3eUeBzgXzhDazYHMgb03fMxt3JshEWr6hhNiYpU74SuqbQcEESsbloHzs/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIvyGeHCyZRaPF7fqL3zCZXBuRBaraW8IgyKnBkX4i8=;
 b=CC2PSNHYfqFTsyH+lgQ+L+g3TBCufPZTUJh1XU/jiTmXhfc4RhyR+HZjXnJAsTKRzzmv4EksXfjj+oHv4Za9xIiA865oPiz/FRYko6r0oqJ5nMItjZSfq1p3Nzmet/VhFC+ry+SE22yZM/a+lpXT46njJkK7zi51U2rP0VDeDyr/CZjO310Y7JwEB24RC5ORRNxE0GwKv7/YabpT5/xVeqpYiHQUZX6urK0Sz1gDjM6CNscCDt+lp6dJ1ygdNzDuoTPkoUyJlF8xBPGDaiNlbxgS/jvs/qCqqtDKji/uqtdkp6JPyD7QkWSEMaoVHG7J5DKqGu8XB7/fBAEm31ZGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIvyGeHCyZRaPF7fqL3zCZXBuRBaraW8IgyKnBkX4i8=;
 b=xdQxcznWmM6WlhNU8M/TbDL/WKPtsoGzMyuow/hne5WroxZB30CmwP1UwRGiyFHn60eR0+ll+0JYgq9piPXqo7wnPFjSp9d7wYc+9NucTd3XSuMRmWjA35tQz1+wZGwkkR8SB+6YbLwn1240fmqMxHSXf+crlPg8EsYmtEkA33Y=
Received: from AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16)
 by VE1PR10MB3901.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Thu, 9 Jul
 2020 08:39:15 +0000
Received: from VE1EUR02FT054.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::ad) by AM6P191CA0075.outlook.office365.com
 (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Thu, 9 Jul 2020 08:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT054.mail.protection.outlook.com (10.152.13.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 08:39:15 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 9 Jul 2020 10:39:14 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 9C1B113F671; Thu,  9 Jul 2020 17:39:12 +0900 (KST)
Message-ID: <cover.1594279649.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 9 Jul 2020 16:27:29 +0900
Subject: [PATCH v16 0/3]  da7280: haptic driver submission
To:     "David S. Miller" <davem@davemloft.net>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(7416002)(82310400002)(86362001)(26005)(5660300002)(33310700002)(186003)(81166007)(6266002)(54906003)(110136005)(82740400003)(2906002)(8936002)(2616005)(356005)(70586007)(42186006)(316002)(8676002)(6666004)(83380400001)(36906005)(47076004)(478600001)(36756003)(4744005)(70206006)(426003)(336012)(4326008)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b224420-d248-4667-a862-08d823e39005
X-MS-TrafficTypeDiagnostic: VE1PR10MB3901:
X-Microsoft-Antispam-PRVS: <VE1PR10MB3901DC8ABCE7F789F1AF8217A2640@VE1PR10MB3901.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04599F3534
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrqiuF+r2t7qgnckMfiSE3MFOywonM+tXYr0Ce6HRpvCKXPPdTLMNjtaEmG8tuZca8AhsO6yeY6C1RI5CpUCRbkyPn59/ESIHgXT562BWWBCw1I3FzJsiMQiUx+DRTYG8D7sU4kGVbaiIRl46FkvySbjPdI08moSl94ykCKIIf7U+tGHC6L5zp1Cq/32ZqspUq+YOHyBFFpwEIvuyR460hEKSk8sYyb8eROq32zWB5npygamf5//o64K4dcY6XG6Wv20LEgP+nF8V1iux/LB5lnTVXRtj2B0FT0zGWphLzDE4VuNbP7rEOiNJOWXiV0KRy8wZVrFVMtKOT8RjXcTtRMne14QRg3h36gGRAFHCchgMnDJ698ENIgVPamjxSXNddb4kfoVyB6tVPC6obHCx6sjsk+fBQMrLEy80YoF295bAvHbpq1PsfEmkkjCEWm7
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 08:39:15.1214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b224420-d248-4667-a862-08d823e39005
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT054.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3901
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v16 1/3] MAINTAINERS file update for DA7280
[PATCH v16 2/3] DA7280 DT Binding
[PATCH v16 3/3] DA7280 Driver

This patch applies against linux-next and v5.8-rc4

Thank you,
Roy Im, Dialog Semiconductor Ltd.

Roy Im (3):
  MAINTAINERS: da7280 updates to the Dialog Semiconductor search terms
  dt-bindings: input: Add document bindings for DA7280
  Input: new da7280 haptic driver

 .../devicetree/bindings/input/dlg,da7280.txt       |  109 ++
 MAINTAINERS                                        |    2 +
 drivers/input/misc/Kconfig                         |   13 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/da7280.c                        | 1840 ++++++++++++++++++++
 5 files changed, 1965 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH v16

