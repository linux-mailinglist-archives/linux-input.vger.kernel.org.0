Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9417276DC2
	for <lists+linux-input@lfdr.de>; Thu, 24 Sep 2020 11:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIXJrt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Sep 2020 05:47:49 -0400
Received: from mail-eopbgr680065.outbound.protection.outlook.com ([40.107.68.65]:5019
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgIXJrt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Sep 2020 05:47:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKDb5C3BBQyUIni22YSXjPhIjyPNfDHfyjLDg9+fBReBumCWjelNXlMFBAjlXZrg7Dz3HlAcqGp3MbYp+/KAK+Nme51fuVemcGHlijrsjvsxJYNEcQEfubZKveTlYkSwzmOdo7K5oeBfBAPHoMRI3tKOQ96Om1rtkkO+EokdbljggbgbiOATmhlSuKITmEpakeRyK6Opeg6jqfNA6+o3yjKHsA/UG+FR3Ap3sOv7HOEtQES2cuj3JzpQbsrX6iJ4Muro4gh70KT5Ah18rtLq5EsrW/wWDFsR3GXT6H5z2TJVvIe/dRY+2XtebbPNkScDFFUl/E2H06817WQseTKy/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ELgnvY4PlJ/IvkxSJ//+RDS1Ey8sm369jHoQtkHgDY=;
 b=Kd9jE1SUA21zF5kOMdvju/9+b1Kq7nVyxW3oLmHZJf5hfEBHVWDP27j4lEuxW0/qXQGa5vdSaRgXcPzqBOWcFZ1ZNRKtcqFp5G0lYeXdVdtS0rgixMbbJYCFHXbTkpdJQhDo8QDmJ/+IOOow4bywr/QJGPTXpiUPor59UyvECbNo46OM7RwMgc/fBKbRyJTW/3/gV7HEp/PoB1iJYk0+nLtaX4UWpSNGt0/MzaBXp/X6eYlYGIy2Tku26+HKQHK2p9slqVrFK6OYlAAHlTdgaUFEa73gh5yRR3pjRplrYWPiTynSMscF3TAoNoRc4AV5pW/FyBYbjBYcJp6H1keSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ELgnvY4PlJ/IvkxSJ//+RDS1Ey8sm369jHoQtkHgDY=;
 b=lVZ6UmdDbe6G/TFO/Hwe084B9VcAs6/ZFYgUdl3rhkciq3ZCFFVREqau7WRJkq42YvA64OVROcayPmAoj82Ll7VZZLcW97sbKwKwSuI53woeGcffFAWsGAMQvSD5KvbfybwhC/ZV7KHEpNFOB9YtDi/fGzv8OeqXTUdgIQ1QzIc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB4496.namprd03.prod.outlook.com (2603:10b6:805:103::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 09:47:46 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 09:47:46 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: [PATCH 0/3] Add support for F3A
Date:   Thu, 24 Sep 2020 17:46:25 +0800
Message-Id: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 09:47:42 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.250.40.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 440725bb-8a0e-4f6e-a508-08d8606ee3b9
X-MS-TrafficTypeDiagnostic: SN6PR03MB4496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4496BD6515B87AC328AB4837D6390@SN6PR03MB4496.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 74zElQedt0ip1PWC7DdMMH0Uek86C5DpleFqq0P9DG/oavp6fNkFNT2hVlU6JGoD5MHvzZvuZnJI5qrL15L1+6j5F9bzYf7thcUB7iyWMdgMI58ATHyyA1sFcOFxIcnJnOQQ7AUQXLa1S1mWnLCDJwcmCu70wFYlUXqJGG3pn+aTl/7d3ehxp2vapyUslZkw6W4ASpNBQQn5Ji5Yz+gpq8Kj6W0YE3tcHzrm+iyzBLWRfUIAKsrEjxynOE6kdb8MPzoxP4xowFXgH1MUuqeIIBs6ox5QRUNOalveYcFxxypFiJj+3F2s4SJfcV43ahjK0sIf4ttnULiqCs6OKfY5Ba+lyvVQDfUKXqdCr59vhIZt2EA26a35JGNIuo/0L6/e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(66556008)(44832011)(26005)(6512007)(83380400001)(16526019)(186003)(8676002)(8936002)(6506007)(52116002)(1076003)(498600001)(66476007)(54906003)(86362001)(5660300002)(66946007)(2906002)(6486002)(107886003)(6666004)(4744005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jSOsAHXZjaWtZe5wmAkreo/j74LWBAiEtupQ2b+DjjN3sKyU9Bnt/QR5LUMLOXVut0ZJuPogwkvyImTG6kXCFG/fwOvkEvLwUcLi3BXYW1UkqoBUDIJ8lrvYBiPGBzITxMbfR3oCZx06J33sqnMcXSvooL4TV9YFO0RN/ZNQ1Ek1+zOfQ2LXnoK0+02wrP7Pqzv6pphhbtQ5xls0mU8WbHch7RTjOqdBLfU8Hzem6bRJFibLI/8vZ7DifFlcs9tDa2c71pLqeOPoOYcrXtLmlXx+vZxgRDw31d5qFFd5NLRlZJz82ABApYLk3txLRmqcIh1Oz4Gv9TeKksXqctddpU4kr0ZS2SxBFzmkKl5RmDDa3l+gjYUJa3ihwp6mqNuWqirFpWSllsuAnz/xHPT2pSa/MOYpD4SpBNDM6drM9XWOIaVC1pS8UQjq77tQ2tVJbP9Hz9MJGiViuTxo3cQBWy1o8ivCDt9wPDyK6EKA9xPQHctIhxcnS3B/oE0VKzTnRPD1Tbgea5KHGrvvxhdUlx9euge2w1AwQcWBn0ARS8tG4fNSMP8HGnyU8CMoLKofoGSHdFQ8DTsKD7BLtK61zb6M0GitgMq8dQxtL60xPYIqeDH1CU/RVSZEShU2ylKS4iWycpEdSGaQGgr7ZXmSjQ==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440725bb-8a0e-4f6e-a508-08d8606ee3b9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 09:47:46.0440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IafFd90Hc2kb9wN/rrCNNVvIIFt3TT6ovLKM69OAYeqVKxv1/dUDu50xtpBzqU+uhML4pXvGY8IjPXaQWOOUvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4496
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

RMI4 F3A supports the touchpad GPIO function, it's designed to support
more GPIOs and used on newer touchpads. The patches add support of
touchpad buttons and rename f30_data to avoid confusion.

Vincent Huang (3):
  Input: synaptics-rmi4 - rename f30_data to gpio_data
  HID: rmi - rename f30_data to gpio_data
  Input: synaptics-rmi4 - add support for F3A

 drivers/hid/hid-rmi.c           |   2 +-
 drivers/input/mouse/synaptics.c |   2 +-
 drivers/input/rmi4/Kconfig      |   8 ++
 drivers/input/rmi4/Makefile     |   1 +
 drivers/input/rmi4/rmi_bus.c    |   3 +
 drivers/input/rmi4/rmi_driver.h |   1 +
 drivers/input/rmi4/rmi_f30.c    |  14 +-
 drivers/input/rmi4/rmi_f3a.c    | 241 ++++++++++++++++++++++++++++++++
 include/linux/rmi.h             |  11 +-
 9 files changed, 269 insertions(+), 14 deletions(-)
 create mode 100644 drivers/input/rmi4/rmi_f3a.c

-- 
2.25.1

