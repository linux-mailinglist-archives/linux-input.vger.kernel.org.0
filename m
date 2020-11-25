Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FF22C4544
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 17:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730824AbgKYQct (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 11:32:49 -0500
Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]:3140
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729690AbgKYQct (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 11:32:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5VABY5wwsibAo56kEj8pKAlcnnUCgBLKu55T7O2l1VAb7AM0T2D33+oT5gog6fxfocRaLD9GLJVQOjkkmhqc1SGHgf5bNyetiEnvtSs64Iz+URvm/gvWSdORlb7qpzCDKwVxfP4lbWuCMs5YrOCY85jB8vzjrs3BufRkEMEcyENwZn1/PMfaUZmoAXgbJOZQguJOIcFN2tdaI54aIKXYNly31tmrWV5fnj85X5BBLyD5C98DjGu9VpIUudhvSLuNrtgslHhIrkvXMm3oXKh15QixGI5FnHpKYduA6007VwHERJUU2fIk0H4SChDEHgSKUJPM3iE9+tDIIGriQQfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2ZgXstmf+OwCOrjWc5lr1Zv8Kg9quRSlbjoz0/YS78=;
 b=W/EUH7QtE9ldSlHXXfAjsTL1AyKFrrARWxkts673HphSNeOvC+Mday2porU8H+zWPcUw/5+d5jbU6d0UG8D7ltfoqxFTVjxWl/86cTb9C9a8wviSB5prALf9Gn4y74+6dHJyukLn72G34rmV6DNXH2AN3n6V38IIzaOsMnY5PkBE7Zy+aD6+AmuoSBBs0cFRTmF4ctCkaJiblHJgSq/yVQwFKah1hRf4ckVDo1YSI2zrn+JkSZzlQxlK99XOvqcv0WNgJkrs6MRY6C2v6GH65GP7ft4Z3RPm4V2V8SbERJ1A0y4z2RNUw3AwDsGf5KzyafsdUoyoFDWpbk7iRKm6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2ZgXstmf+OwCOrjWc5lr1Zv8Kg9quRSlbjoz0/YS78=;
 b=dZC0Gh/+lMdi3QDbLbTipH6qxXtYZaKu2t6weU5vXfwSqxiZS404blWzWn3QGPQkGCzmmtWR57Ms/GrDcDnbvL2b9vPjD9s9ZX+K+UA/A5lmizGyLDQWMNiRoYo55BcfZ9aD5OM5L5bIKTRqO8JLZXyKRgAq6+WTlYxQZycFbos=
Received: from AM4PR0202CA0011.eurprd02.prod.outlook.com
 (2603:10a6:200:89::21) by DB6PR1001MB1094.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:61::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 25 Nov
 2020 16:32:45 +0000
Received: from AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:200:89:cafe::b1) by AM4PR0202CA0011.outlook.office365.com
 (2603:10a6:200:89::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 16:32:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 AM5EUR02FT028.mail.protection.outlook.com (10.152.8.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3611.23 via Frontend Transport; Wed, 25 Nov 2020 16:32:45 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 25 Nov 2020 17:32:44 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 27F9613F671; Thu, 26 Nov 2020 01:32:43 +0900 (KST)
Message-ID: <cover.1606320459.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 26 Nov 2020 01:07:39 +0900
Subject: [RESEND PATCH V20 0/3]  da7280: haptic driver submission
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
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
X-MS-Office365-Filtering-Correlation-Id: 55efb5dd-be79-4b73-dfde-08d8915fbd3d
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1094:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB10940CB37231F29481B9371DA2FA0@DB6PR1001MB1094.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAoN10bh6V84HHyNvq9hX/WTCMCrFSvwPN34SPbGwwz+Y4E6exVQ7K4mCo66NDOmzIZDmeCd4Lx0zaFiuXnFEYJ9sncnqXieVmLSZBGmBwYStRhsyDD0i5Kmo/dDeVPZ+5qR09EJ6gGtI6RWrh7+9cqQzwthf+/GKWwf0Ishf3r+gcAbCL1KLKH1D1MPQL7r/bJWwO31O7GEyfJj6ed4JywcMQJKizCANkl2/X74V3fUqVtDqy6sWSXCfLhhNqfcx89hvNN+GxLjZ5zpoAWZo5rbkxfhrH0iEWBrg+FsZH36ShzE9Jcrte4s+eABrhaVQQQRusrQOqLtkl/5Umr1jQSsEy6bJFtSZmTp402+C8lD3LdQGfBG5hgphleICrWK81iOkWV5j8EqRxBARrNnkM0/7SmL8XJy2lnvGiEMYCNmsItcGnz/Cgw/QvDLfY8N
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(5660300002)(6266002)(478600001)(4744005)(47076004)(7416002)(70206006)(42186006)(36906005)(70586007)(4326008)(110136005)(316002)(54906003)(921005)(6666004)(33310700002)(8936002)(336012)(26005)(82740400003)(86362001)(8676002)(82310400003)(36756003)(81166007)(426003)(2616005)(356005)(186003)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 16:32:45.3345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55efb5dd-be79-4b73-dfde-08d8915fbd3d
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT028.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1094
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v20 1/3] MAINTAINERS file update for DA7280
[PATCH v20 2/3] DA7280 DT Binding
[PATCH v20 3/3] DA7280 Driver

This patch applies against linux-mainline and v5.10-rc5

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
end-of-patch for RESEND PATCH V20

