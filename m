Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CA027A6E7
	for <lists+linux-input@lfdr.de>; Mon, 28 Sep 2020 07:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgI1FWM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 01:22:12 -0400
Received: from mail-dm6nam11on2057.outbound.protection.outlook.com ([40.107.223.57]:59713
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725298AbgI1FWL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 01:22:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSg6VmFAuXRA1EyO2Cv383JQGYZSnCJBjVXYOvonhBpHxmF61WqcWoJ98Mj8O8jipYhE7uOXdDfiETnozS8ZGMoM1dS/SywqAOhqNOReDESVYLPYTq4wtoLQHSegP7wiY0FfKr9Gdo0tFJIsQU1S53DifkKWEOyXIYQOLqIna4jYeSB/YhdZF7goRMHhsTSc0NZFhEOBRF+PILdo8a/6/avfzf0s7pXff6tgGqUo+7TQinbfCA3GGBQ4AwHVjX2zwz+kHYty8eJsqfLybC03lu2MarA5N0hu1sgotbpNugn1WcIiE6d5Rs4bfq7JGE4TmEszcsCYTujqnHwgrkhEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQi4gXMWS2BE5AmgaDDPejnBwfBYI9PgyaJzcxqC80g=;
 b=CR/EcZQeNAhq93UgL3/Gedj/jZN3SURD9gr9z2qKzssCBS6uV81bxG2DKZvLF5Zo0ZDpQeBAXK6h4WgbXaxTYibciZDrJlzF0wAcud30DNt6wJToVj4ZhOo4iUd3rm1UfVxwo6Qt7g0Qq+p9tecldNIdJ5gzZ7Wy4PncAEU9f8CNDfH42WXnNPb1DsaYTGUbHfSh1bO//8H0x9+M/f+ZRboeEOjzlzn/7xe404fjK2HpqY1uN/VN1rsvg4p+NLATQ4A5GHGGsvIKv6sN6/6PGGgAvvzZxxUyhmeiMT6DrFK1gf20uhgTtRcSuJdfhzlpgwi2eLAEomVW6Z8jUY26TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQi4gXMWS2BE5AmgaDDPejnBwfBYI9PgyaJzcxqC80g=;
 b=Dsrf9IsXSjBeClXpjcJ4jbKDXGXJ2eCV96c2oMjPoRI1uOAA10PTBThjOMd2yDw+azB71iglUytYT+S/U9gLwBdBDmebB45Mr6k4INNsIAg0+KFdQ2pb23gtAZZ/EVq3g/XdOvzBb+AV32gvfyCQ74sel/Uvu+Vpsp1iJLwyKIw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB3757.namprd03.prod.outlook.com (2603:10b6:805:6c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Mon, 28 Sep
 2020 05:22:09 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 05:22:09 +0000
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
Subject: [PATCH v2 0/2] Add support for F3A
Date:   Mon, 28 Sep 2020 13:20:06 +0800
Message-Id: <20200928052008.279274-1-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.250.40.146]
X-ClientProxiedBy: HK2PR02CA0218.apcprd02.prod.outlook.com
 (2603:1096:201:20::30) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR02CA0218.apcprd02.prod.outlook.com (2603:1096:201:20::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 05:22:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 484ceb5c-63a6-432c-083c-08d8636e720d
X-MS-TrafficTypeDiagnostic: SN6PR03MB3757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB37571D62DA35A6365ECB63CBD6350@SN6PR03MB3757.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+rmzWeZJXOa/DKNPeZON0AJ2R7Lg/h3YZITER3PXQzH9JQaDd2+PFAuzkBTQdNAwO3YD2DbQJK5dmmYIFsQioRQnqbbYn7HxLNweJe4mHQoo8dfN4IIpa1PAeSRdhpW5B1OvYt+vacL0LyhkeT6LlZv6N469jBliymGR1E9anar4+/jSFvGVsd0iH7sCZPbhZdmvaKm7UUyO3WYctKdcVbGvBWFCTgC+zXnXgp1G3Ccpg5jMb5XO9/EColSADyHtmy2FBYMyJVsuiBOMXd/z6FKlxS/wmo9WnsUre7WzDJMo5N8F38s6cI5HmmDly6UZ91GRi0tyTZT34a/zm3XsFjgTtHGisvjglXLOEP1HrBxPL6r+GV8EzDTj6vZtCLk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(366004)(136003)(376002)(396003)(16526019)(54906003)(186003)(2616005)(956004)(316002)(8936002)(6506007)(52116002)(478600001)(4744005)(66946007)(6486002)(1076003)(5660300002)(26005)(4326008)(107886003)(6512007)(8676002)(2906002)(86362001)(83380400001)(44832011)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: lIshbd3bQsG0HAeb4Hb+w/LwjA9XoIekoFbNY4zKZHtJCG0z5yVw85ggefb0upzVe2WEzphrvtB6xmBOCNyoglMddU56sFyrf3INRM7ywwD1icO9IsJtcZOwjkWPZLsjEvM+r388rDuYkuWDwRLkUG8aG1G9Gw/aPrMNoAEaQV3NCKKZ+UqYCXJlRmCZPHf/rMnwPAJez2wyPTWE0DtIPWPVbGrruS5bE/8jeellm3hAyM3C1wDwp3NEa/EYuy4kPyQln4TVkrdLdXStJ0YGB3kX3RhVO+nhIEwx/qYeNyevlXVw6juRySuMZ3H9j5KOqwfrxDKK0QJSmysaCgJMA3P7ASAsDs77ShWhxfkgbUiGsakuGp5HGro8OuKba5TJBPhRQNI8zPtBi04T7WxL23k0HbIdwyQ5dJ0IV9/iAHYXRnqFDrQsIaz/VCfFnYq9dDR6WefQqa97WS8Rg8AyHoMHUrHP+iXhuuYwmstYYugxITtk26hYr2NkxnG99Zk7bYVJWkbvzZqVNS8TETmSISSyviDWE6Gus1Vk94i5DZHzuUeuN4/Ej4gU+4jK3EBTrV1851Zi4WCV8ON+R8Q/cZS5Gq9DK9CVZftKwfRC4pWQO6koNz9lehAycUn8jctHm+VfEH4M6hLEx4saWoFQ0A==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484ceb5c-63a6-432c-083c-08d8636e720d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 05:22:08.8751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/4wDTn9BX1ZvVek6G6SwIGLBlRJqRtlEXmL6R9P9BImlF4DddmUEDqqJfm+zUm0mmRuLQicyb28vig2coPd6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3757
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

RMI4 F3A supports the touchpad GPIO function, it's designed to support
more GPIOs and used on newer touchpads. The patches add support of
touchpad buttons and rename f30_data to avoid confusion.

Changes in v2:
- Combined patch 1 and 2 of v1 to fix bisectability.

Vincent Huang (2):
  Input: synaptics-rmi4 - rename f30_data to gpio_data
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

