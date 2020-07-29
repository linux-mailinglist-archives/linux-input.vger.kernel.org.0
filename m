Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2014231810
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 05:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgG2D0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jul 2020 23:26:37 -0400
Received: from mail-eopbgr20078.outbound.protection.outlook.com ([40.107.2.78]:31876
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726290AbgG2D0g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jul 2020 23:26:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlehY5pVLOC4lG56dM+ht+ymUesksNzDcMApERUIlYNfHfRokt+PWW6auu+zpfbU4916b33eZIxazfhvAU5MkFPY7igTdZgUWRJ8cLwEt7nn7TTCZbLaFFEPHSJHw9Ahy/f2LL/5wBjGFd+VH3ed4pYnMZ5JRQXjqSPGbLiVl+fyUnLT9USoGoD0HaZWX9SZ/9v7jIcrjkNgiOiQajpsFDBnmyfzWMHkl00gxXCo+ld4HgoL0z02z12yzf9ez8Mdkv0kx8M1DXqQciH4Za+y4jts6hPVJYFH7u3kr6xwUG6gtijKrfqbjbL/2bhuck+AyXVWV3vTr2eRrAx33v6m5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10aUvJMQGB2pNNRi/gwVF1g2xs7OyJVpAK42j+LyrkI=;
 b=mvvjX5aV/whgGVEGcPG+tZRhXIMHnhH1m9odnMsske8lH9gH05Vsi0JDtodGht4VGqnjsVw+BXloTwQ/zIeOVPk2xBsFs0KPPhPDKxy9l4F299o8QoB6f01IWpiBMuay2pdLNbn0hTkTnPdrzo5nTRQ7fPcayb2nJgjPlXCm7SyorEh+j2ki7qn7konKNJsQQQb2P0x8ywe4FzKxaYWNbWTv8BKiBae5eHtfnySkKS1QGbtr+HRgvh3OFz3VVFCWQJ7l+21i2ivn+s8XGgAZsTbDVFQ9QkOBWYuOYUTIFpA5T8rgG+lfiexy/tqUBvGKUy5hGlH83QCXPTBDcpJ5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.111.57) smtp.rcpttodomain=arm.com smtp.mailfrom=diasemi.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=diasemi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10aUvJMQGB2pNNRi/gwVF1g2xs7OyJVpAK42j+LyrkI=;
 b=EenHaMjwjBwUvDThiM/2HKaB+hsSS/Mks64RY5fx/qALYTT/Wsl1eVveId/37C12WU1UW6P6p3tfjheoPE3lPaC1BNulfv6ZkfM1UWYzoOXZaC9RmLLvEHJf4yPDE/B51r73rEfjanh28wd2LewrZIuGkZJGCOhHSZiTzvPlnNs=
Received: from AM6PR02CA0035.eurprd02.prod.outlook.com (2603:10a6:20b:6e::48)
 by VI1PR10MB1951.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:2a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 29 Jul
 2020 03:26:31 +0000
Received: from AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::c4) by AM6PR02CA0035.outlook.office365.com
 (2603:10a6:20b:6e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 29 Jul 2020 03:26:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.111.57) smtp.mailfrom=diasemi.com; arm.com; dkim=none (message not
 signed) header.d=none;arm.com; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.111.57 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.111.57) by
 AM5EUR02FT028.mail.protection.outlook.com (10.152.8.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 03:26:31 +0000
Received: from NB-EX-CASHUB01.diasemi.com (10.1.16.141) by
 DB-EX-CASHUB02.diasemi.com (10.0.16.142) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 29 Jul 2020 05:26:28 +0200
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 29 Jul 2020 05:26:27 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 B0F2513F671; Wed, 29 Jul 2020 12:26:25 +0900 (KST)
Message-ID: <cover.1595991580.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 29 Jul 2020 11:59:40 +0900
Subject: [PATCH v18 0/3]  da7280: haptic driver submission
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
X-MS-Office365-Filtering-Correlation-Id: 3498f789-1f12-422c-a4de-08d8336f3005
X-MS-TrafficTypeDiagnostic: VI1PR10MB1951:
X-Microsoft-Antispam-PRVS: <VI1PR10MB1951BD5D1071BCD80035229FA2700@VI1PR10MB1951.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieie+eatFQqITUObp4ppvg0FWgMxKrvVCEB8E53Ei6HsRfN6MbzWwzXH9HlkTrxggt6a235+LEFmBYf4N4w7vo8GtTg3lnmjvtKDlBIUzWIBS4b39BCYGcmuRnlL71wO/MuCfCodgQRkP0mxqQciqNxVLetYK4EbUScfC4uXo6yGgEDHwZ+T+xAiXRtLuFAn3KzktmvawngiAurI/XhVw9ZyWG8hcAejzFGNFIpCgRoBaDJVOxNKAALd6DY7mHcY4AqcXc2oDufraoAIDHoMSsE+YxGfidxGGjffUYvxCibS4HbRoDf9pNX6peL3j3m7sFUggpmp5Y4tKafSeZeZP/bvNo8bhMCAi+TODxm5Hnx7/yk9I+4mv/jxINvtYnYaW1UCxJBgM0zdwP5SUagsU/SflszyumgYfdpp8FEE8WfrjOk9HmoD+nChnSO4Ksal
X-Forefront-Antispam-Report: CIP:193.240.111.57;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(46966005)(81166007)(36756003)(478600001)(316002)(36906005)(6666004)(33310700002)(4326008)(82740400003)(47076004)(426003)(26005)(110136005)(70586007)(8936002)(5660300002)(86362001)(4744005)(2906002)(83380400001)(70206006)(82310400002)(356005)(8676002)(2616005)(7416002)(42186006)(54906003)(6266002)(336012)(186003)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 03:26:31.0587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3498f789-1f12-422c-a4de-08d8336f3005
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.111.57];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1951
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v18 1/3] MAINTAINERS file update for DA7280
[PATCH v18 2/3] DA7280 DT Binding
[PATCH v18 3/3] DA7280 Driver

This patch applies against linux-next and v5.8-rc7

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
 drivers/input/misc/da7280.c                        | 1845 ++++++++++++++++++++
 5 files changed, 1969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH v18

