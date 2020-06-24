Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5860209CD2
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 12:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403913AbgFYK2f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 06:28:35 -0400
Received: from mail-vi1eur05on2059.outbound.protection.outlook.com ([40.107.21.59]:35150
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403810AbgFYK2d (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 06:28:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb45cpSMTzRp48zrRgdIygHTLkbxKvFLvO9W4cMA8d8rPoDIqHeeeigYWBTqPQhKjuHV25fv8bv4XXOgEhYN1o7BQtluGtw4HMuKGlNjxXx2gjp0vAM6Db7MpqSI/Ok22Y6MNbjtVAjr7NQD1RHj+fIvEdPZrCc3xDWTefF1iBl6kK2ol/4Hz+nmLcCifQ4S2v+LlmKQB6mwZx/+8blDrrGLzoRrHIl5NoSc50/QlG+wmUMR2bmITRX+IY2Q2L+cP2RgxSzDGSpz+qn0CsKdXsiSUa8CPxT1DbdxbZUfJR4qKD/L527FkfvFpqD/UHAMUMgQfxsgsMuhO6oLnaLdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uZqx/J6gcNz90L8lNaJWmiAZJFzUjGU3aKVjrhu2I0=;
 b=mRbyrDvfRROLco4FRvEq6wEDil+ipOV6Z/Qqcb1827i4dBwuG1MLqe4eddRLfJVo6KLkCPkAoTAA9NEfCoF5vsKbZR8FBbekZkL1JynuM24p4+0vfxvT30byXvzXiJqL18Oy5zPIcQwlNpF7J6Y4KUErEZ0Kbw0JmVd0zQWSPq3e0GxZ7EvJBVrXYIxfiWyvZERhFl2dtLVwxvaEMhJ+tb4AIHVcvzYZ9Ifu5DHupRkx6YTs1SPZwO6J1EwgEWJzLyXCwy4o20wm+XzuZvQW9mDVeRgbAWWaXWueDbHPyP92SeJlBFXWcm7VFki8U0xMlqiH336uy9nsafthcPHGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uZqx/J6gcNz90L8lNaJWmiAZJFzUjGU3aKVjrhu2I0=;
 b=gP/8uj2lnIe/eZRVBnseXkiF3l+R/g+c//lBeP0W4zHuFZAs7FxZ8KXWsD/Pof1pXpkHAfkE//lz+aEWv2divY2i2HwWbsodWm0VmFVWLcbxJwgXrvlrHZ06uPqImxxTK4dg1AlbClTye00R5NTF/EOHoZFaxbmqG2saVYcLcVk=
Received: from AM6PR01CA0072.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::49) by DB8PR10MB3193.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:114::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 10:28:28 +0000
Received: from HE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::8f) by AM6PR01CA0072.outlook.office365.com
 (2603:10a6:20b:e0::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Thu, 25 Jun 2020 10:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT031.mail.protection.outlook.com (10.152.10.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 10:28:28 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 25 Jun 2020 12:28:27 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 A5E2913F671; Thu, 25 Jun 2020 19:28:25 +0900 (KST)
Message-ID: <cover.1593017969.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 25 Jun 2020 01:59:29 +0900
Subject: [PATCH v14 0/3]  da7280: haptic driver submission
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
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(46966005)(316002)(82740400003)(81166007)(110136005)(4744005)(36756003)(83380400001)(7416002)(33310700002)(36906005)(86362001)(356005)(82310400002)(2906002)(5660300002)(70206006)(26005)(186003)(70586007)(8676002)(426003)(478600001)(8936002)(42186006)(6266002)(54906003)(336012)(47076004)(2616005)(4326008)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c82ce1d-bfde-464c-3938-08d818f28042
X-MS-TrafficTypeDiagnostic: DB8PR10MB3193:
X-Microsoft-Antispam-PRVS: <DB8PR10MB3193BDBE40FEE9C00E954207A2920@DB8PR10MB3193.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gbe8+Tj2Cl3bYCNYXbHnIa5XHiTNGVz0PfjlXpGOz1KaHZjzM9SPR2asouzDIVK/NPh0Olt/+J2ZaFVtdpxSe5BuwqArURFHJcC2Uu6DWWylDz9AYTw1iU/8+fPWqGflIW5BxL1kyIb+89c0rp1fgXCrvroPoTPDEiWDD465NOIllYECVg7NIFyLGUFMnbS25jaeRorwwtHf9pC0XvCmqQoPL6QSujB7PMhqtBPc+kz5ODYSDdjqJFKVlKd1YfY+jC3bl7rJlpnQD0x4XWgpmA33X7sOc8+BwHvdZhN+oIFjLnX+r2DU/lzuagRpUIEmM72Le7udS6D2s3YYObDSUpgsY82H5GiLCs0Ho+2aDi2exPAdAb5gLhnbtH93A0V9kHg505G1VMTPuVdalnu3k3+jpjNx/u8OFARxKLuy8weuNXLjm0rcmyGn25ifdQ6V
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 10:28:28.3172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c82ce1d-bfde-464c-3938-08d818f28042
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3193
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v14 1/3] MAINTAINERS file update for DA7280
[PATCH v14 2/3] DA7280 DT Binding
[PATCH v14 3/3] DA7280 Driver

This patch applies against linux-next and v5.8-rc2

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
 drivers/input/misc/da7280.c                        | 1880 ++++++++++++++++++++
 5 files changed, 2005 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH v14

