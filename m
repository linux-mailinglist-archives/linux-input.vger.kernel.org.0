Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4091F95D6
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 14:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbgFOMBI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 08:01:08 -0400
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:18182
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729787AbgFOMBG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 08:01:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7bxfFQ6mJOqEtFJcZTPFYgRxK1bpK7aIh8pWHx1TCbKE8vOo4MrWWoP9kXhjGOp9CUq5xV1UMEcJxltw8R7IxFEb8oFRWx0D0puw8MqxQ03KLPQl6WQv4qIFCfMCicxhIA39wB6RQk472bwgCrve7J5PL5DtBVIhNOfkVy9T4yuJuIKniw/rHP+5M9w2VIp9miytNC2auDvzPvJCGahMZz/xN65fyGGybGfNMGfWmZQ8hTUvkHr9RiSe8Tt3UafETapLqcN/Y/tWIx2xLPRjJffoOA5Bt9QMVIu2c4EXc7qnQFFUSAe5y7F1o8hJZA7GU90EBeoQUkBekSsnF2OhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3Yf5utQw3QcyZtnfxkbrJv1MWgqFnzFMVoguWS9B6I=;
 b=YqgyRc75zbnpRTdbD3qeTBjtiIwdOoAOQkUWZ/Nc1PPvh9/un3JHD6OV3FjPopv45efUbFmQUQ6/FOXIPPFMm2LMHq64HfnVFmu0Mxs3vbhLDSVCYg+LrXeBaDiia9+74+6mMRNDYzGjKTiHW+CNL1YPqiPDkWEUu52uHQdkI2eudw3vsL+v2JW+UetQwLpAgwb3POZRcdnSXeEjeH9zhtsPTRX8dUPUSQhPDG8joN2UkB4lHGSuhaXcqDG01cKkW0m+sUUfw/rHVPJePaJhhYZ4vp/vCoMJ8AWb8Jo5XGATRkev6PdVIbWSpjH8rGlXP0OdjuApFvMD+naNFN5h5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3Yf5utQw3QcyZtnfxkbrJv1MWgqFnzFMVoguWS9B6I=;
 b=HgSEGdz0E5NZK3N1SGEc8vBtTxOX1Z1XHKKtfg53guQCNnYrdNgx/Rcy7gM4bqComW+69mugZqM+UnMmTVA15Pyj7XNHSLJQpDhmiEAABfMISB3D8U8OpQNg8VPBC1dbd1QHPSwlNKE420HgRa6Dm+YZe3rTLpROh/+Y7bVENZA=
Received: from AM6PR0202CA0066.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::43) by AM0PR10MB2385.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:da::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Mon, 15 Jun
 2020 12:01:00 +0000
Received: from HE1EUR02FT005.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::9e) by AM6PR0202CA0066.outlook.office365.com
 (2603:10a6:20b:3a::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Mon, 15 Jun 2020 12:01:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT005.mail.protection.outlook.com (10.152.10.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3088.22 via Frontend Transport; Mon, 15 Jun 2020 12:01:00 +0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Mon, 15 Jun 2020 14:00:57 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 8C77C13F671; Mon, 15 Jun 2020 21:00:56 +0900 (KST)
Message-ID: <cover.1592221223.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Mon, 15 Jun 2020 20:40:23 +0900
Subject: [RESEND PATCH V13 0/3]  da7280: haptic driver submission
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
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(46966005)(478600001)(7416002)(186003)(26005)(4744005)(70206006)(70586007)(36756003)(2906002)(5660300002)(6666004)(42186006)(6266002)(4326008)(82740400003)(33310700002)(82310400002)(8936002)(356005)(110136005)(86362001)(2616005)(336012)(8676002)(36906005)(316002)(81166007)(426003)(54906003)(47076004)(83380400001)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73616045-8eb1-461f-48fe-08d81123c564
X-MS-TrafficTypeDiagnostic: AM0PR10MB2385:
X-Microsoft-Antispam-PRVS: <AM0PR10MB238547CC1A0B557942651741A29C0@AM0PR10MB2385.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: em725tbdaFM4KyEJ8UaVsDASnhGJBReiAvn0s0nE8Yg0jiv59LUo4zlyOIygO0x7bTdG1sBsL9e/A5oN8TcQ7HxB9nJju5qbY1FcDCiTdvJE4Vv2KBkNuRKfkXDMAZGPMcwp6RyQcmzpzT+zALKxWTBki/ZSJjYxqPMYHxWtghTfNOytMNRLt5Aag3iVNyGZfmRacDOTaxa1fSY4VjwxRo06p858CEfW5mqFFEW6Fy3iExSwFRifGnAu/7ax9aVnyx4m2b6E6R7ec3vJdqEwDfYJAq5b/CavnKzUT7+rm7iybYqpq6qGchQYdcMwVfSHJYmL6NEgicW4n6Iae9ArBJQECZtM23G9iiXDxyU+tJs3UP5RTS4yr4B+3+xlY0ow58Uxb4CRsTQCmqQXLnfBg0PyqYA9UpBfB47B3Zldm6hkB9zuQilbXTEm4y1ETlAi
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 12:01:00.3247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73616045-8eb1-461f-48fe-08d81123c564
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2385
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH V13 1/3] MAINTAINERS file update for DA7280
[PATCH V13 2/3] DA7280 DT Binding
[PATCH V13 3/3] DA7280 Driver

This patch applies against linux-mainline and v5.7

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
 drivers/input/misc/da7280.c                        | 1898 ++++++++++++++++++++
 5 files changed, 2023 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for RESEND PATCH V13

