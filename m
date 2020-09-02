Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E493125A8D7
	for <lists+linux-input@lfdr.de>; Wed,  2 Sep 2020 11:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgIBJsJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Sep 2020 05:48:09 -0400
Received: from mail-db8eur05on2044.outbound.protection.outlook.com ([40.107.20.44]:36736
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726140AbgIBJsE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Sep 2020 05:48:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9kuWoz/FNGWlerzOtBEGjlzg5gwEHq1CkDyI2/kVcr/8PRn7rRyieynZXzUANprkYiyEGPzQb4xxt/vjCYCyibsk1Z+B+J1SiFmmlIYPwKPe8SW9vmAkBEoZG4xLkXhOx8NOnEALXDS2BSvxvAGn1kQLp8bzt+4LoQphnzMoL/ElGHThmxl8lMPy8IxuZGi0/nUKBloWRykKX7IYH9N3b6V+XV4Efn4S2TFv+JCX8TEKPKibsIyzvzpxZ3AE68BBx8n6GqaWkhgHps9F9o5cd0cjsFFUL1UhLOlQvuWaEAHdaEcgYKYdT99kl7vBHK0wnoh3V5Ap1aJUYJKDMZX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpA0AEx8xzuaSMrwN5WI0m2klXLYN08vjJqOpZawb/0=;
 b=E2YK+ZrE2Od5392805Aw2RE9fE+pLycRXPpGH0JS4eqfGt2QORt4hbrY/RpUST6u1lxaT0sx7M8iGmffPAn4w7tuw9U+foRyRSory8If4wF48R4FhzAcuGOlD+OilAArXxjZd8TDfuaqS4F9oUASrF/KSFtYChAQ+4iy1KU1S0+rh1Jwt6B4LdyGnamPJxb97SuVUJHDwxgJ1RB9XnRZv66Q5s34PYe9jbWyET12WVl9DwyhLfBiN3MlCHhVgcJ/XgGps97BVRLwYVWGfUiUy9DhJ869UynSmStGMYmx+m3/fUBHkgRkbljo3QWaWzz+MLOtw/Z04FRrqi8Rf/UKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=neutral (sender ip is
 193.240.239.45) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=diasemi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=diasemi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpA0AEx8xzuaSMrwN5WI0m2klXLYN08vjJqOpZawb/0=;
 b=ByK4Ip2wgxctz4axJpmTpnK1KkAJ5Z3anrJixhEaWVGu6ImrkoOp8ea7Wdxc0wHyBChtHfTt0eW85mxKJvZqXO38iirOPhJybl0IaB6g46SN26qqEnNe4MskWmL7hWBygKv06Hwb8xRN7QLdFp8pfCfDuh/1DZcLoFRZLZ2WOmQ=
Received: from AM5PR0701CA0023.eurprd07.prod.outlook.com
 (2603:10a6:203:51::33) by VI1PR10MB1949.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:2d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 09:48:01 +0000
Received: from HE1EUR02FT004.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::67) by AM5PR0701CA0023.outlook.office365.com
 (2603:10a6:203:51::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5 via Frontend
 Transport; Wed, 2 Sep 2020 09:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=neutral (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; linuxfoundation.org; dkim=none
 (message not signed) header.d=none;linuxfoundation.org; dmarc=fail
 action=none header.from=diasemi.com;
Received-SPF: Neutral (protection.outlook.com: 193.240.239.45 is neither
 permitted nor denied by domain of diasemi.com)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT004.mail.protection.outlook.com (10.152.10.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 09:48:00 +0000
Received: from krsrvapps-03.diasemi.com (10.93.17.2) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 2 Sep 2020 11:47:58 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 42C8213F671; Wed,  2 Sep 2020 18:47:56 +0900 (KST)
Message-ID: <cover.1599022115.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Wed, 2 Sep 2020 13:48:35 +0900
Subject: [RESEND PATCH v19 0/3]  da7280: haptic driver submission
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
X-MS-Office365-Filtering-Correlation-Id: a5c16150-621e-4a79-2fe8-08d84f2547ae
X-MS-TrafficTypeDiagnostic: VI1PR10MB1949:
X-Microsoft-Antispam-PRVS: <VI1PR10MB1949474AFC829901250A4FAAA22F0@VI1PR10MB1949.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R7iTFSYJTrt49SogvP1ralwkUCtuH1LyBcbFkr1EaSrdxcOXRa2b2cGsL6J6znUznm+XksoW7/O9k2LRUDbfrDKDkAZ9ry3w3K/S+wrR84cRR/BCWj05gb379I2czVR+Zgojbf88GtQ1XB0PTpQB+ALnG8pV8vHic7j+7s28hgWOC0Wi/Fcn+xJBPpJPOA5WV2HwcB60SGjmj/kHwCU2cZJRs6Mt2rV6tfoeF34WDfNwgh02XlwaXDVjLXjfSbKUuMbNMk6z9RM08Kdeebj5df2+lWIMHb2KFfuXWCuHWwTvmghOpy0k7j53vZaXZ0GT3H+74ZkFaxJe8Ta6bUR3B29LPOd55e6hDGguTKnxjSq9i96K9PKmFdS6M0wYczOZjY7xMYjFlxzGobOx2DlS+3I+EJsGVNODxFFjbZJkVyzNRv0NHnm5CpYwSuUsjnWb
X-Forefront-Antispam-Report: CIP:193.240.239.45;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay1.diasemi.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966005)(4326008)(2906002)(5660300002)(2616005)(8936002)(6266002)(110136005)(426003)(36756003)(498600001)(6666004)(54906003)(186003)(4744005)(336012)(70206006)(7416002)(36906005)(70586007)(42186006)(26005)(356005)(47076004)(8676002)(82310400003)(81166007)(83380400001)(86362001)(33310700002)(921003);DIR:OUT;SFP:1101;
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 09:48:00.5118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c16150-621e-4a79-2fe8-08d84f2547ae
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c;Ip=[193.240.239.45];Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT004.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1949
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
end-of-patch for RESEND PATCH v19

