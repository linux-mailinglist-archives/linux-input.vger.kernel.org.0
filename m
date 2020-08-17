Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392B4247EA0
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 08:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgHRGsZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 02:48:25 -0400
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:26446
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726228AbgHRGsY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 02:48:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJBwKnFFYvXvr/xYMitzSs5YYzYIIVjO76555hFUVLX1+ml7dqKY1sIiTNM6lHt0ann6uaBBpZUhqIJD6FuyaOmvxetd7ItZ8YPbP0K4hp3s3NrAs4Nh+ffvY0UWoBD2cCN4EyjmUB023XU9IOh85Ba1fP1CzRp2//WcBRAyzamV7wb7Z/l2JAVnHBV9G6Ndgv7+1n9T+26sVYSuxn6YiJ0jI0yAMk6kvB3ULKKAnS+bT5MShXdzoiJibo/pcZSPWVuEmRr7R7D3qiaXq0H1Gc0CD4jpMsxFU2LMyq/ZE7052QEpU78bRf2neSo5j8NJnLsuPCEpDZM4enfIA4c8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpA0AEx8xzuaSMrwN5WI0m2klXLYN08vjJqOpZawb/0=;
 b=ltbMMZ4rcQJFcbdZYbQFZiZBL/B9lDvqna8up4aUIUNV51PS1XUnSdUVhe7cycV8bV64fq7FlXPuB0zz9q9dbQdVR2YBiNUZCU/KwiySDzzGsyEEY2+mudg5n8iBboeMDnvJMIUO1j8gLKoSMefYvJgEzQ3z7zEqkf7601WP9tek6VDCyDwepG+z+XuTkubcDnVX4CcsmPSGZXTWCUkNGhb8tkBdhTVebFVnwtu02eTmdG1wGJgJMvcyG/d422dUD2gq9N8dPM6OV1eqTBrMFT6Tldd27fewxQgp8AWa8Grr8O2DvAmZd+YZ9FpFMNQ0/2ro01EBYCr6a5m8kRFYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=neutral (sender ip is
 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpA0AEx8xzuaSMrwN5WI0m2klXLYN08vjJqOpZawb/0=;
 b=sRA5rNfnlc/T8bZZrPmdRnUgBhLKSEZPrej6u0XaUkCK+YmGO5nA3hjqS7QFvZZ4JD9fIuyQG5dnbeguD+1Px2crFP2+5Q0kqqDukpSVRYOTPuU043WvBpurlvaPZL0Vqo19/Elu2r/FnVcwEbqAiytR1gRjHrlICckW9E7GptI=
Received: from MR2P264CA0187.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::26) by
 AM0PR10MB3668.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Tue, 18 Aug
 2020 06:48:20 +0000
Received: from VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::f4) by MR2P264CA0187.outlook.office365.com
 (2603:10a6:501::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 18 Aug 2020 06:48:20 +0000
X-MS-Exchange-Authentication-Results: spf=neutral (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: Neutral (protection.outlook.com: 193.240.239.45 is neither
 permitted nor denied by domain of diasemi.com)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT031.mail.protection.outlook.com (10.152.12.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 06:48:20 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 18 Aug 2020 08:48:16 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 58E1A13F671; Tue, 18 Aug 2020 15:48:15 +0900 (KST)
Message-ID: <cover.1597706056.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 18 Aug 2020 08:14:16 +0900
Subject: [RESEND PATCH v19 0/3]  da7280: haptic driver submission
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
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b318110-d4be-49b7-2b55-08d84342b1d2
X-MS-TrafficTypeDiagnostic: AM0PR10MB3668:
X-Microsoft-Antispam-PRVS: <AM0PR10MB366812B8E4FED0380B8CD2E5A25C0@AM0PR10MB3668.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SqO7ZST2vYYYFWNzu8PdAyBBDY09e3NhJMjMoVSwzkh8PJZPhKipXQlwL9vXfBtPPvJM5wlYVRmQ4xpmsvIqsWH34U1TqbhH5ATg5oec5KF0etjbi9kl2HKU06Hm1blpxl10Lmx1xPRlUknn2+XqG/s3KVejzDus08uC06w5wh6ZPr8xrGBwdhxLF93OeTvMwzn4+quIb7HxYxJ1JtNpZgy4E7AR/Z4sWluZh5n0LK4J8isp3jLIzN/0En19kIxMEazbRuA0q/G3IjDHxQnDoODlPzJpfByd9yxIB6bHQlAjoY556ZVCdJK6S16quS5S8S3xbUxMoRgcRSLcsbh1ZlkKXhz/sfkP3zTsKtCD+uQ2JdZhBttZoGajK2jTzB2mBs6u9BaMEeC/8/1wy/U2Xe+revY13NFT2VN5l494fXnpmLXxP32I9QgdisCizuV4
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(70586007)(33310700002)(70206006)(356005)(81166007)(47076004)(8936002)(426003)(8676002)(478600001)(4744005)(2616005)(336012)(82310400002)(6266002)(26005)(186003)(86362001)(82740400003)(316002)(42186006)(83380400001)(2906002)(36906005)(7416002)(36756003)(5660300002)(110136005)(54906003)(4326008)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 06:48:20.0662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b318110-d4be-49b7-2b55-08d84342b1d2
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3668
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v19 1/3] MAINTAINERS file update for DA7280
[PATCH v19 2/3] DA7280 DT Binding
[PATCH v19 3/3] DA7280 Driver

This patch applies against linux-next and v5.8

Thank you,
Roy Im, Dialog Semiconductor Ltd.

Roy Im (3):
  MAINTAINERS: da7280 updates to the Dialog Semiconductor search terms
  dt-bindings: input: Add document bindings for DA7280
  Input: new da7280 haptic driver

 .../devicetree/bindings/input/dlg,da7280.txt       |  109 ++
 MAINTAINERS                                        |    2 +
 drivers/input/misc/Kconfig                         |   12 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/da7280.c                        | 1476 ++++++++++++++++++++
 5 files changed, 1600 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for RESEND PATCH v19

