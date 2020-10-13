Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE65228CA16
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 10:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391350AbgJMIVN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 04:21:13 -0400
Received: from mail-eopbgr10049.outbound.protection.outlook.com ([40.107.1.49]:50389
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727744AbgJMIVJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 04:21:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeUAQqoHgDaqLneeGwtPpqnW78js6Q3idE+lx7eA2i8qnp+8iecwAg7XU75HmTvoPy6KrUirY5y/kt280uG800myJ/U7Zy4X+kD7sukCHlTNkAyPsDnVMwJhCqC9Te9qNIqPAcPBY/edYO/cvAtNMnPxgRs+KeSxYJbZror5sL6DzYrxtxIe+/8KxAbP3VjIbq/rsDuBvvq7hnuyPKfLowpQ/NYDG5w6XWsB1lphHLTa+dvivw2lP64mSGOm53QxdqZODpm0bl7/RBvqTpix6SChvQgiqiSsZtieere8Y7lEWB4I8WOyWxypBkDCqUWCgXRtn4unf2QEJv3HZaP1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgtbqbYxmvpPNuBpU35IFEsVGMMKuevzn+k6Qa7Gebk=;
 b=RGL1gTFHfkjL9ZICxebf7a/CeDzu0HZTKmTHXHLRg3Z6k6GGmFHlbt9KQ1VVqQnBBllcUl3FQBkCVsyJaOv1W5UsJj9I/OlcG7ueBtU+8xpahG7JrvLlKO9bgIP1PIhy027dLpdmWL5GTqdGfRj/9HoWUcc+a7jAXtKe47j1Frfa+1I8EHyrThEU90JOg3iM4jFMhxTNaakgVt0Nf+OtYzuLoqRj4DQL0Y14uNxyaKvrmOdB+s7qCZdPb0YKjISILj/srKmAHcYUfSUDUoG5R795b+K/v6Q5Rf0fkJVyBbbUAIv94wxfxFB7Gzsm8MTmub/HbD8/nLYOATajo25ROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgtbqbYxmvpPNuBpU35IFEsVGMMKuevzn+k6Qa7Gebk=;
 b=jIEPxpNIV5DISK3x1gu4rkcWox5/mbY38HdJJba4081+Hg4qAtDh1gXSRGqXsTB0zpi328ezjiFkokEzpWi9rYBmjsSLu3089ybhw121TRwHYHpeJsL0Id3lUOLoTIuaCZD8UYJsDoxezE9UYxmT/pOQ8OAYo8PTMZBohEUHiWE=
Received: from AM7PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:20b:130::20)
 by DB7PR10MB2266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Tue, 13 Oct
 2020 08:21:05 +0000
Received: from HE1EUR02FT012.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::2e) by AM7PR03CA0010.outlook.office365.com
 (2603:10a6:20b:130::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Tue, 13 Oct 2020 08:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT012.mail.protection.outlook.com (10.152.10.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 08:21:04 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 13 Oct 2020 10:21:03 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 DAC6213F671; Tue, 13 Oct 2020 17:21:01 +0900 (KST)
Message-ID: <cover.1602570380.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 13 Oct 2020 15:26:20 +0900
Subject: [RESEND PATCH v20 0/3]  da7280: haptic driver submission
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
X-MS-Office365-Filtering-Correlation-Id: c94b9b06-d64a-471b-995a-08d86f50ed8d
X-MS-TrafficTypeDiagnostic: DB7PR10MB2266:
X-Microsoft-Antispam-PRVS: <DB7PR10MB2266F62967E5F6DBD16EC715A2040@DB7PR10MB2266.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DOSekNAMVnInNW9Ec2322z3tFLe3OduB+JLS7u4fsxn0wB2RS/a4amt35OnDIw4aamkNuSc+4afkbt9YDl02cnP8WBL1saaQ2JeYS8fwzSlUpW4GqAs6khb/LsxfeIhF2qzWxM2izNV2if73bGtwQDmesK52yOOTtW5hYldVb+FTcP9nBmMrO8UeiRWLEuws0f2fkoDKi8gJDaVLME4+7O/+Fl0BgLWt2UT30S9GuB1g1T1lGIOYh1FUJH36kGFceZFIuyOMpe6cX73DlQGE7wZTJ4R6KX4g0SOCx4gp0L/XJ70ylDY7mZy6xLJgP6FWl8E14jopgsycuDstFxFAac/XDBf2rR678BuLTTJxC4lx8kWBpzUWk6AIcekZOYMwBggB6vEm+V98PD1Qi/cIskQmDkvqXYdD8cCqolAl7pz771l/mZvvai9LKk7eNY6o
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(46966005)(82310400003)(8676002)(478600001)(42186006)(70586007)(4326008)(186003)(6266002)(6666004)(8936002)(70206006)(54906003)(86362001)(110136005)(36906005)(5660300002)(7416002)(316002)(2906002)(426003)(356005)(26005)(336012)(83380400001)(36756003)(82740400003)(33310700002)(47076004)(2616005)(4744005)(81166007)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 08:21:04.5792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c94b9b06-d64a-471b-995a-08d86f50ed8d
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT012.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2266
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v20 1/3] MAINTAINERS file update for DA7280
[PATCH v20 2/3] DA7280 DT Binding
[PATCH v20 3/3] DA7280 Driver

This patch applies against linux-mainline and v5.9

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
 drivers/input/misc/da7280.c                        | 1375 ++++++++++++++++++++
 5 files changed, 1499 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for RESEND PATCH v20

