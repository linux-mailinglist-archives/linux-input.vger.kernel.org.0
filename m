Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84AF22B4AB
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 19:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgGWRU4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jul 2020 13:20:56 -0400
Received: from mail-eopbgr10065.outbound.protection.outlook.com ([40.107.1.65]:41280
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727044AbgGWRU4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jul 2020 13:20:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkadnWytPMKaqWUqE/hNBbXIdmlkUv/3PBQWZxdEAodDO5t7MaPJLEVlThk0Ld91qcUrR47QzRKo6LAGGZisPdmNcQe+4+82QRe+zIJypBvRduYIlHNBOhIwYEKnxWujluItsg7OBqub1NJrQqw4YFDqt+73Zk94zabzI9JeLM3AiHNgz/OPnh7v5HloeTtfeMggjRJ9MZHv7EjtnkwHkOIHYUrZ3zib8DigBr98czVy0UKaUrj4vOfveYLbsy9PfiPcfn+yFie4cvFJhCF2iNPzvHSQO8EiacKsRPeQjzF0iZyuTcFhc1mCKZ7/k8K1Di63pk3prrxkaZPrvsvlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+44xVhRCa9KxkG5uPst6GMEsSVkgIiFEgCsYek+7Crk=;
 b=cKWzaTuqVVmDvJiUrIrC5y84VWPUlkPmG94w6mkw4zK3nvfy+tqPnshluMm5ZWoHaA2bL/S3e5U9qLZMSC4iw3/92/W2PYEHDTwQV7Ism9a9k6he/no+q0eGjgc7r6xm9WmPt4bkRmdn3bJKQ3gGyvVY34rtY2N/V70i/oCmksSvWkn0yCKK1l4gixKtY4HXLRMkXEHM8jKceSDKruJT3Dzm5dZN5K92D+v32Ztkz6DnesEnGHxvsPsKLFW9qS3Q3fJZ+EO5o40P1nrs6txOXNWGEsBwvlV3/AQaNimy0AcjqlHs3nmbehZlxDfWbqwzPjIfhA9J/qXQtJfDqb+tsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+44xVhRCa9KxkG5uPst6GMEsSVkgIiFEgCsYek+7Crk=;
 b=PB2ohY9mdpD/uUbeqzq9PVYBKIksrenf5rl6LZkKuqA/Vuk2lperonIcnUW5g7MpQRVluw3gotYQdueQvrDSNqdgjBSlTB+zuhccV0V8f1FFWh8uodVpQ6y8XKGhheyXsu63xrF+RpGiWKa9+CohppxPhqFHas/QT4kdfW58s7U=
Received: from AM5PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:203:51::22) by AM0PR10MB2868.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 17:20:52 +0000
Received: from HE1EUR02FT049.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::a6) by AM5PR0701CA0012.outlook.office365.com
 (2603:10a6:203:51::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Thu, 23 Jul 2020 17:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT049.mail.protection.outlook.com (10.152.11.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 17:20:52 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 23 Jul 2020 19:20:49 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 9FFEB13F672; Fri, 24 Jul 2020 02:20:47 +0900 (KST)
Message-ID: <cover.1595516501.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Fri, 24 Jul 2020 00:01:41 +0900
Subject: [PATCH v17 0/3]  da7280: haptic driver submission
To:     "David S. Miller" <davem@davemloft.net>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>,
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
X-MS-Office365-Filtering-Correlation-Id: 21a6e378-507f-4227-f271-08d82f2cc066
X-MS-TrafficTypeDiagnostic: AM0PR10MB2868:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2868013D41ABB324AE2C16B0A2760@AM0PR10MB2868.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJ7M/LVDfzQ9QIJvxstlMNInIomNL+wCh8cC/hH85x4kWs/JzZssNUn0oobfUP1wZfH3IaA5w+9gvy7TmHfzBwN2PgtXlRyktKnW6eBEazH7PFkx9uEV/VhMWRbn3qGb0NAQT+UqTurnAyCwIokvDTBZvNsTrhXXAyFHeoAI1iRlvw8QwkYesWBUZW95jhIhaKGQWPUBe+2sV0apREsDHH5Ml32MAHpG/q+vHaLxxjVq5FQp/VN6YywzouhYwhgn3jmVs1GJZykYjofnk0fR+eA1zoGOp6M+VjJYsyELYDPhf4kmA+Ca2JaW9FBBeUrC2E6HIT0g+ad+CjH2qZPueCL77/hT5RnS8Vg0aHGUTGN2cNL/jF7ovm74RSApbcyhEHlqfDsP5Yv2b6WVPWklLbqp4o6eIUQaK1XAD0S+Ac7HM6fzdEIKwaz8lEOD7mpb
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(6666004)(36756003)(36906005)(8936002)(2616005)(6266002)(4326008)(5660300002)(70206006)(426003)(8676002)(336012)(86362001)(26005)(83380400001)(478600001)(186003)(47076004)(2906002)(4744005)(42186006)(82310400002)(82740400003)(33310700002)(316002)(54906003)(81166007)(356005)(70586007)(110136005)(7416002)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 17:20:52.2835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a6e378-507f-4227-f271-08d82f2cc066
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT049.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2868
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v17 1/3] MAINTAINERS file update for DA7280
[PATCH v17 2/3] DA7280 DT Binding
[PATCH v17 3/3] DA7280 Driver

This patch applies against linux-next and v5.8-rc6

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
end-of-patch for PATCH v17

