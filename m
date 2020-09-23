Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5E8274EEE
	for <lists+linux-input@lfdr.de>; Wed, 23 Sep 2020 04:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbgIWCUA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 22:20:00 -0400
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:2535
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727031AbgIWCT7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 22:19:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSuQvlKzElq9Eioa5sS5MJ9TNoQAMBuKsDHVhvMAT9I5+WdvegNm0qqoo3D9VUm1Pclg6dw2SfGZPptuVmsSqfvgPNf882ioTJwuE+SRIpChQQOEwPiqq0J1FarULQMyM7hA55tTHpR+DEpbcTbydJFZyuZwNkaMeHGxRpCJxeNgwdlaGD1N131x/aIiPGNKFRmwCsK5Ro7KwRUZRv6xNfkTxJJ0BlTrpNXvZjTmZQ1ZmEk8OouQUTBNsprut+uX+pcJPE8yQHAfpZEzyrRYwnxQSQXlSuY0aIrbEN9k9sb/ifi/OAjvNba8CLuYguSDNXmmxTK+qYu9fkEjIuVegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPjQRjxf8QSX1L/3hZAtlzKEG2S03DeYW82eY1L6MSc=;
 b=VDrFFsyxfiuMDKBrnfJ5j650aL98xnvpI7n07ROG1liWdlbp5Ccj/j4OjOUsvpWBNaeM6fxHcqMP9J3kCbaY87bqHFYdgSOrFGDMjpAg30YbG2Fe9PSbQx/coA5Gtyp9vaWeCrwwbo72fTPszAClqtlVAx/F8PrFQWLJgoiFvsFBidKXOdmpxe2xZvGCnLZM5iAZaGAF93UguYOZPITS69mgwEAd2H9bo/H02ICdeWy2O5/PKsAlItF24dgR7jarm2zdNQwv9v+0a01EOLWH+MS4vF6ogP3nKuz3wEwWKWqSqUZzAvXNA7S4k0v3L3gmIMN6ZIvE1n6JC9JUoDX/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPjQRjxf8QSX1L/3hZAtlzKEG2S03DeYW82eY1L6MSc=;
 b=kShhIZKC0F7mfhYoF1C6xHsKAdQnTU0dItGoY+1/SB/rFi33SlmJqk4uVr5y/h38TJNKvixOi931PbENVV2FVvaRX5XJ2cBXY7XezwcTp80sBc8lTNc1WnNDRZ8HYJrq5DmyKCWtdRzNnBrNgiEmDvtZ64gZriAQwvTzAuTNl3A=
Received: from FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::12)
 by AM5PR1001MB1154.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 02:19:55 +0000
Received: from HE1EUR02FT044.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:14:cafe::3a) by FR2P281CA0025.outlook.office365.com
 (2603:10a6:d10:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Wed, 23 Sep 2020 02:19:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT044.mail.protection.outlook.com (10.152.11.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 02:19:55 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 23 Sep 2020 04:19:51 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 8EA5913F671; Wed, 23 Sep 2020 11:19:49 +0900 (KST)
Message-ID: <cover.1600823131.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 23 Sep 2020 10:05:31 +0900
Subject: [PATCH v20 0/3]  da7280: haptic driver submission
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
X-MS-Office365-Filtering-Correlation-Id: 0f96efeb-8099-47ae-39ad-08d85f672963
X-MS-TrafficTypeDiagnostic: AM5PR1001MB1154:
X-Microsoft-Antispam-PRVS: <AM5PR1001MB11542496F863775ECEEF929DA2380@AM5PR1001MB1154.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvSMvV0RLp3O/2Jf/sC6ECcYkvMepx1AVB4MhhQBCVBsdmMgAnXx8DBxKchtYh0y8xlEOUyG37YBiOohSy1U5Tseyt9M8LN9w8MwSnETo1O/+CCf34okXBlYvO5l8YWvcjGvI6sQgd9VVdFdFChB0pXAGQFJO3VVwVN2IbCUsik9x1VwKPumafnX1ZubnFmG2DBa8LkvnRKEcGjZYJuYyqCzKuLxnDztaFHciqZ6aO26TlHdC4szw+AeowUt5oWmnYGcRwqHAp5CS/2CMLJSYp+EWypo4mrrTVKH9L6xHWdfLiw++LHv9NuH0UH/jtQIYxqinOF/PlySpJEkjGlXPdpGxIPkDYDtQe9T6JUSUGOI/1HQctSYO5VFLC1snn4M3f5LVlqWWoiqlTq9rqNYfi5zXx6h2jccPLTYC885aUq70BXYDKNhmA8tnCLN2rbA
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(26005)(8676002)(8936002)(316002)(70206006)(6666004)(110136005)(478600001)(4744005)(7416002)(70586007)(42186006)(54906003)(36906005)(2616005)(336012)(4326008)(36756003)(186003)(2906002)(426003)(6266002)(82740400003)(47076004)(5660300002)(82310400003)(86362001)(83380400001)(33310700002)(81166007)(356005)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 02:19:55.0755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f96efeb-8099-47ae-39ad-08d85f672963
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT044.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1154
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH v20 1/3] MAINTAINERS file update for DA7280
[PATCH v20 2/3] DA7280 DT Binding
[PATCH v20 3/3] DA7280 Driver

This patch applies against linux-mainline and v5.9-rc6

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
end-of-patch for PATCH v20

