Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0405C23B9B9
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 13:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgHDLjV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 07:39:21 -0400
Received: from mail-vi1eur05on2051.outbound.protection.outlook.com ([40.107.21.51]:45501
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730241AbgHDLjS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Aug 2020 07:39:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8/MlGjroAvRJnVyD2umX2nVMXSKb3mouoIPRE+W8jj0MTqQGUZsgf3lub6HX+1XscHbeP4I4rRgb6JUXZhHruTQF8NPSzni9dNtB0jSiEcjGHGnBQCQZRYVcgEmWIv/vNyn9C1GNTw94t4SI7Ut6XKGAJVxQtAwOxZiBKyrVMIPoXV82nOkbb0eteeP1dBDlFl+UM0DG//XINk85hxT6XMeAlkXhgZHxtcqlU2wrgTAs2/q6WpSGg7yw8RscYgWF77ZPwV6Tbk1YYV/SKsjfiCgqgWgbups2egWTkr0skr8U1kWLkcydK7QmJuuV4wI73TR60g9iq1gYzr+hQ/E2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmD4whx8jiOb/lqqAsWsthsqKw9n3+ivVO2mGCKdjmI=;
 b=n8v3ypHgF573ImF8jtRmbYaKhgyjxH5ajLEN5NFzyZwNBfvWc022MdK6aumEdYVvxpmHfzqUa30rbHa+G1A9OvGAplyAd3CTlWcC87Bk5pAmtmXakKN0UQ2Snl1FWTcLRuEhxbQmBXVCDG00fgBQKzEGvdn6+Yql2NTcfKN1N7nOIeGTUkjRjtgI00owAz59p6hR9/5qQzjlTWCePpKTRXv1THCI2KNexOBJm7RjIhinKiwzaPrgCK+CB0wjvtfBr7jTRvUQUcYDvwJx4i5O6EZgtcbP5gJMqCp1HiVHPBoYm9iZZjHRmunYmdqTwMDJ/E17jrm6FgqniohhogYKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmD4whx8jiOb/lqqAsWsthsqKw9n3+ivVO2mGCKdjmI=;
 b=aXnylbWMGzOuLT20Ew9GheWbfKxTrDxa5RCIr/wa5pHSa73i6lxPhBLowdcsM3wa5VY2Lg6ywjgE0L3kzGfyGcakUs52Up9Fqx5tvJey8xo8VHFWdero5fKSqtdApHfTQp5iNq96hXmXBzbzd1pwDBeaqKaWOb6joXj1C+nOrFI=
Received: from PR3P192CA0046.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:57::21)
 by DB6PR1001MB1205.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:63::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:39:14 +0000
Received: from HE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:102:57:cafe::c6) by PR3P192CA0046.outlook.office365.com
 (2603:10a6:102:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Tue, 4 Aug 2020 11:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT063.mail.protection.outlook.com (10.152.11.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3239.20 via Frontend Transport; Tue, 4 Aug 2020 11:39:13 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 4 Aug 2020 13:39:06 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 4A30D13F671; Tue,  4 Aug 2020 20:39:04 +0900 (KST)
Message-ID: <cover.1596522828.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 4 Aug 2020 15:33:48 +0900
Subject: [PATCH v19 0/3]  da7280: haptic driver submission
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
X-MS-Office365-Filtering-Correlation-Id: 94c218f7-5121-4373-0f54-08d8386b0341
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1205:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB1205E9DC06A1CD8EDC1A305AA24A0@DB6PR1001MB1205.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nsJv6QhnIaf3jNSgGGWHte1mfQvU4YGtOMHTdMWCud1fFNIyXGl5xoneBS7ErDWqhUWiz5uV6PdsArnSkXr5wpMIJaN9HQ273D1Pui2Bcj+X8gQgIpnBEqOjmEgO5KRhKkrR+aR/Ia1407SJYewoubRKtjVEGZQqUe9gpSYvmJBqFe9tfOqS7IViL7WOjnS0GcrEGW43r+LenibvWt6SUmUuLDF/Z9rk4YlWZZvONEMCZRKIWhNkZhOO3G/bsB5cqApkHaSJfROsQjCGCef2TE/Y0GQihW6b4cgFTYoRh1Pl+ecmBL7k7+dFuuDTN8zCDN3fpX21P0X95yjMuXeswvvMwJ5XlK2Ykw+rudvdFhmQNdSQKb6gHfHtbEQ0y8TCWyxL1d8Ty23Yu8xtly/wp3yee2pSEYixxYQtBA6sn3yEw+vOzNPOIKTG1M8HD5n
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(4636009)(46966005)(426003)(86362001)(2616005)(6266002)(47076004)(54906003)(110136005)(2906002)(336012)(8676002)(6666004)(70586007)(42186006)(26005)(83380400001)(8936002)(36756003)(82310400002)(33310700002)(5660300002)(36906005)(186003)(4744005)(70206006)(498600001)(4326008)(356005)(7416002)(81166007)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:39:13.7107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c218f7-5121-4373-0f54-08d8386b0341
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1205
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
end-of-patch for PATCH v19

