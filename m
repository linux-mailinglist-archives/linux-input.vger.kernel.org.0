Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543482A5D4F
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 05:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgKDEWK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 23:22:10 -0500
Received: from mail-db8eur05on2088.outbound.protection.outlook.com ([40.107.20.88]:41537
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726008AbgKDEWK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Nov 2020 23:22:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaHy60htxHtKQy2VxuSO6qwggS1Ko9jAJorsMvt6fELpTa0UuwfKqpdj32TabeOUvcPC19eKXbyykmfnkrGJ0xzMcBRbc8KhPSwy3IxlD43xEKLiAczwzCWNfPhi4okL8KJbm5stJ+US1r0CMho8R/h/92h/wurLBy0mksoCO99YBLqR8cI2aOQeirbhBN2ZT78NCw6RSr4BtLpDhLAowR1zaez2SOkWzvmZgudixUuzEosCaN47FiK0RuSAPD3RUDLzROA2skkM8VTURas7AqE7+aotU/UC5wfFJj/dTTYxoRh77paQQKEkOGUWCgZNuNvmc6MIJr4KZsqe/i0cYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbuI1pIpv1IPnn3r4S61Nz6DzPBJy7HlhWi58ccW2jc=;
 b=OmEMybsebxFTrkqu5XX+zZ64jHFzPTk8hA0Z3ZuQcpKIHDTBK0U+fvF4xc1YnlRfSBnjLb2VnTXFcyHLxOW1RoFbcz5Yxge+71GmN5Iw3dKdXTxW/+xN8WgehkjlBzJrlQAWMJMzw6EyoH3c0ITRzYcFfedHik3JYKjvSru1aCzGsMzO8L5CRCuHXTAOy1KXlsFk8D3bTzFlaozyi7t7hYi8MfQ79wdQT7GofT8+CVbi8PCOnWDQRazxTTO0A/oRZL8jJ62vDCd8LWVnnUETWrDCgz6momqmyn68DNdMCmg5dO0HkQsjYZ+4zruw7/hdBsn/T+GoLHR8VRN7lGotZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbuI1pIpv1IPnn3r4S61Nz6DzPBJy7HlhWi58ccW2jc=;
 b=VlzCDisIQfc20jIIUpHaTgGqUIiFD9a1qV4TdR5o1TdwtshLnQ26OeS7rVlCc6JQmpVAQ70E0jNYSCQfvnjGDECbzrnZuS6PsuM+UpEF16YFpfjN5PfD59lymZJqnEueyjZ0ueSgq6X70QSh7LMiJxjHo8hDtGH2vtbRD/B4pfE=
Received: from AM5PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:206:1::36)
 by DB7PR10MB2203.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22; Wed, 4 Nov
 2020 04:22:06 +0000
Received: from HE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::11) by AM5PR04CA0023.outlook.office365.com
 (2603:10a6:206:1::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 04:22:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT057.mail.protection.outlook.com (10.152.11.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 04:22:04 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 4 Nov 2020 05:22:02 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 5EDAE13F671; Wed,  4 Nov 2020 13:22:01 +0900 (KST)
Message-ID: <cover.1604451966.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 4 Nov 2020 10:06:06 +0900
Subject: [RESEND PATCH v20 0/3]  da7280: haptic driver submission
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
X-MS-Office365-Filtering-Correlation-Id: 682de7d0-023f-4662-1f2f-08d880792f7b
X-MS-TrafficTypeDiagnostic: DB7PR10MB2203:
X-Microsoft-Antispam-PRVS: <DB7PR10MB22036197A4045E84CF503D78A2EF0@DB7PR10MB2203.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NW8rooPo43AhcV5AyaoeJ3tCBpj8xllr7N1PeeEjp1ZkNT7OIXmf1c7YTKG84JNHHB/SmnPz7NOhs1BwIjZTM71zzolhbrcFdyoApqUB+4tWfdlq/WcSQ/SEl1lg2O2xWlFVvFv97aMvmUp8WL/3Bo5DZrp9R57zr4/pkcmBPS1GctlPplEh+UxAj9Tf4xNh/lxYsNEjuXBEk5nTniYfG6umqqOTLauf8+fHGSfUjuiy6HCg61E7O902DvbTaU/o95rx//K38y0oH3GJJdL2zHB4DGLCB9kbhWBT8mjFDfmD3APzmBdwdUmV1sUMPYra5+f3UJJWlq799/aR870uun4NqvxBt4TgLOxBrVLqC96A3eAZR5UhOn+Ag9iI7ppYPetn7zv3BtlqVs8W+i8pE7zNVdB0daniHdAw9KNae39L1j7Vq8/XbKQ3XExuQ1HW
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(46966005)(8676002)(4326008)(70586007)(70206006)(54906003)(42186006)(83380400001)(36906005)(478600001)(110136005)(82310400003)(316002)(4744005)(26005)(186003)(82740400003)(5660300002)(2616005)(336012)(426003)(86362001)(36756003)(33310700002)(7416002)(356005)(81166007)(6266002)(2906002)(8936002)(47076004)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 04:22:04.6052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 682de7d0-023f-4662-1f2f-08d880792f7b
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2203
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v20 1/3] MAINTAINERS file update for DA7280
[PATCH v20 2/3] DA7280 DT Binding
[PATCH v20 3/3] DA7280 Driver

This patch applies against linux-mainline and v5.10-rc2

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

