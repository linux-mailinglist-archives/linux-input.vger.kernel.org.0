Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9B120EBB5
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 05:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgF3DA4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jun 2020 23:00:56 -0400
Received: from mail-eopbgr00058.outbound.protection.outlook.com ([40.107.0.58]:46129
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726746AbgF3DAz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jun 2020 23:00:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnfLzem53c/LA4JxpSza80fiOE3B8drhsEIggpShZ6rRzJ9dkzkB3B09rk1LnxJAtr0w39iV/4MQpdvHsyxsoGasunbcJG707Ylel3MLL/3gAzWClH+n+tRNh7zHwm5bJmiz6qEl41n7EgZV8/ZCCYbP5JxEuRHYpRQh3t9fiP5SoJI8gM8RSFf/YYKbmhbAdh3jC2gqTxD/tvmfLDhc346CUFWqu/tsw2vhFVUUG5XdaUR3uFwCvyu6ZYf+uNMtyXIA96pHPU+FNtLS8RVFbYD01+lGSRRXgTAg5NQZJul+9XMKg8BeSS/7x3Dy3E3eQGltn8PiGZIfI/iJcm+efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoeDv81AW76/K7TgZGMi0d6NeBet+xJIv+lV7Roxj1Y=;
 b=ffpC5INOUnU5/q3S9KQdCIM9n1uU4ITunQZeCTMZGCo5GYjC8jibmxauFZc3JpJ1+bZPXzaZ8HyaPHOzdT88C7GlZ+zaxiW+m5YflbxCjZrOVdNklG4YTW3G4DS9ZVMnoUqhH4LT8smL8Med/0hn+7n8w9napSDtztH5QUq6Z8JNbnMlkvdtzHNZ7pho8gomn84NIz1godfEOymoAKaJ2RBAuSpOFiQH/qy1Ozdc2e0RFLvr5LeFE+HWVlZZzu6mmVxswO+jPKKm6QPP9VjmXBznIB2GqU1TeiZYke//7Ybk9X2tTn89Rv970JS0iQQO/GZfvG0sjWk57xAw9MELCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoeDv81AW76/K7TgZGMi0d6NeBet+xJIv+lV7Roxj1Y=;
 b=Z1P3kuFJhsb5NGyeXRfKzvvz4oCkAAGWsednebzFp/pj1qQYqGEOgn+jVQRfoK1NmPlzi0NAZWKyAN/Tzl/n+BJsSa5S75r3O50oIrxqGfZcEL7l+Ur0Yh0VWv3DLedy8ALu9a9Ov9dX43JfDYCdUlNPjknEXIQCk+a2pyRvNxY=
Received: from AM5PR1001CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::44) by AM6PR10MB2454.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 03:00:52 +0000
Received: from VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::47) by AM5PR1001CA0067.outlook.office365.com
 (2603:10a6:206:15::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Tue, 30 Jun 2020 03:00:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 VE1EUR02FT031.mail.protection.outlook.com (10.152.12.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3131.20 via Frontend Transport; Tue, 30 Jun 2020 03:00:51 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 30 Jun 2020 05:00:48 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 76F6E13F671; Tue, 30 Jun 2020 12:00:47 +0900 (KST)
Message-ID: <cover.1593435662.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Mon, 29 Jun 2020 22:01:02 +0900
Subject: [PATCH v15 0/3]  da7280: haptic driver submission
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
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(86362001)(478600001)(33310700002)(54906003)(8936002)(110136005)(7416002)(186003)(26005)(356005)(2616005)(426003)(82310400002)(8676002)(2906002)(336012)(81166007)(4326008)(82740400003)(70586007)(83380400001)(70206006)(5660300002)(36756003)(47076004)(4744005)(36906005)(6666004)(316002)(6266002)(42186006)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27977355-d97b-4e67-e97d-08d81ca1cc58
X-MS-TrafficTypeDiagnostic: AM6PR10MB2454:
X-Microsoft-Antispam-PRVS: <AM6PR10MB245400F144445A6D423B0353A26F0@AM6PR10MB2454.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spRIbFoJD14xwGX/lTNxXqR1GqtGq2pp+Ar4PKC0aDpKRp1cSXjC3ukibyA/7mAKY7P1fKG21wZLl+ZIPagksKZ8ZE37fcUHDS6QlmjX4Tuqwbv9Rn+hn3XHzVnF4opWKeCo5NUE9ehVpG3ZmihagZqb7s9Mw1+fNd37z+x13Yt9hVfTsUZEek/fvQzhuftbEcLbtTrNAiEa4QnPNLs7lOEtR3XAdD20Xna6f0OgVLTVF6GtvJeNpCZQBYfeD5yp0SQVs6HoaYg46CO716PXiNf3PyoeECCqFLwraplS8liXnM9obYyTHqZCnLO8kL19h5d+kXk6JXuOWEgqUAlsP3Ru7508csKniv8f/R4HPJq0OOCxtQqikGVLuqkku1wAdfeUGJ5X8WQ8ZE2TAZ6tK0KLyHg682hZd/jGTiULvUTLaqY6x4AArTs3Lx380kkJ
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 03:00:51.4077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27977355-d97b-4e67-e97d-08d81ca1cc58
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2454
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v15 1/3] MAINTAINERS file update for DA7280
[PATCH v15 2/3] DA7280 DT Binding
[PATCH v15 3/3] DA7280 Driver

This patch applies against linux-next and v5.8-rc3

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
 drivers/input/misc/da7280.c                        | 1838 ++++++++++++++++++++
 5 files changed, 1963 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH v15

