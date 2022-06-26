Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC6555AFD8
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbiFZHYh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbiFZHYg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:24:36 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B25D62EC;
        Sun, 26 Jun 2022 00:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtT2fYEFn0lnFGip7N8GpxXWItxhhzy2oAEzPRQrnCZ1SmKZj9hgcyvHMEP4z1KNycjPxxbh98JHEqKRvccvBnt400udxPnfBvAYkbRcvXoAxNNFF1n/44AQrD37QYOtKiNxf5Ow/ZQRCdLU2WLP1MlSNmi5M/JE0WJwR8C8ZUeIKdCVNNMCaBledDV+UwJTT92/D1ZDCo6YeNOdRBtMycHYwPQeE0V2OaD5A77OCy6mlafJ11oDJHDZADWo0kls6yt/q0xqRlZjTehM8C8v4tcAdVR1bDX727Y51sKwPLxgG4U1ag3FFP0wSMBau+6ALDIbFNMH7ap0gh78Pyo2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vZJ2E0SGfjCd7v/2HvXrK7HITs7imX1d2X26u1WgaQ=;
 b=LXdQeupu8YwSuzAP19ID6xyJPXmN8PwZoTMg2z4pd8wC+oa+rpTyDECGMA6rcI0yKCzOf+ZPAK83gNTQJexjGBS3g9KIsk8Udj2dU2pnvKBuq4Vst8VjQMwbn0wlJOP+9LTQ3jNv7Dhkid4O+KnItrWjjF/H9v9p97x/9qSNpgaSXg6/ibpsZMpIMryPkEZVb5+YJdGiJrgDGmQXCpWBvi0VcbjXOZcYEVnEGPKodENthEqvW2bqyglp2J3EV9JxI5IwIHJy2bS/binao54O6tZ3UkvSCWsxiwH58k294iAw3m5c3iq8ob7s5DG7JUucSrxywRnMIlvKwqoFO4DwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vZJ2E0SGfjCd7v/2HvXrK7HITs7imX1d2X26u1WgaQ=;
 b=w/L0gbK82BJe7Q16ZuFSXmu7eVmsrNwXhY7+TyXddEE0uim7xnaNKbOAs53abNiVFXdjugMg2SzOh23F65k5CzJnCU/grKQ5uyBH0mQRID107MEacOuqmPRhtSchy8wZmEAgLw6RjXyJD8Jkys2FwDndCnqMc6jE4o1aZ1Wvhqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:24:32 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:24:31 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 0/9] Miscellaneous fixes for Azoteq IQS7222A/B/C
Date:   Sun, 26 Jun 2022 02:24:03 -0500
Message-Id: <20220626072412.475211-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db6f2aaf-b30b-436b-3387-08da5744e955
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27e76jzuA7ndv2CicpzAc6CgxKDfA7Aw4VEFE0GuwReZORPENzfMHMPTY5ZSQwqUtFAQsxg2lrvcPybccMmi6+fiSsNouwXaJCq9uuzgemEwKq1B2ksAEiI6HqYZHHhKxsiBfy4PYTzDdejWTvglD4OBF2sdXGOxMCCTtjyNG/+Vhs4kY9R7Uq0u/jZ8ZV0JTrIopQil9uAvrOoAACY2NSfgBc1XTd4L3t3gPaJBx9Dwr347zg9d6rqrXaezWyquZN8q01T5jZ4KdN5NDikkRAWUU9xpQS/Kkj043R40/aClOkCk1ZT+ZyfPyW1wV+F3EwwzA9vaAXEF8M2JTL1yIBJOpO8zyAlx8aILPQR4fAJ91Hndz6uvI8hMflvIERQ0jlehQ+54RRTy58gpVavnyjGvRDgjZK18Doxz4fROeJ1KfFXtbsDBBJ+kJODs+xZEdsVct7q0bIXKzTlkq95b91Zr+zmH7eCYgT8EhKLGsjjj0spMnK3osas6Hy/ZcRiDJzsbsKbq4c1kOmZQdlOCoQsb7N/rkWRaPd1rNUgLVMDVTMjWU3wTSK+FRH3WeNR1VeDdfcHF4FuGauF3An3F0IfqJBp1LggyA83wxtTfvZZb0UDhdC2d+g6SaQRNFgsvMqmaki1msk6tW3ZUChTouVSam0SXkqPsvzIFDt1VVF76s4L1fRNZ+dwyEqpXLgQGR3mHC/ljZ3j20BNuStZ4FTr2ZQ4x/WQLxjR/6RIyi5DqaSxhiU+lqU4ZL3QL2FPy2XLQX29YeAE1RmAV2i/m8zjToOBSGx5x32jqlCJK2GQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(4744005)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yAbT5nhX1dd0MK6HtVYSEwNB+bChL9yZ7APh1znYIiy1AFyYfC66Im/XZajI?=
 =?us-ascii?Q?r85vdPTp4cmq+XpT5Y8llKbbH0r5fw+LohTZsMwgTKEYYP8V2oHVU2yXcp8v?=
 =?us-ascii?Q?rHP6f4FdPgtEu9p0FhiwU+DJElApJqVnvJ9aMKBKtBYrBleigkbbUucguXjV?=
 =?us-ascii?Q?waWsngL+BCyzlrvdH0AQ9L57g1k6mTVrl7zB2ahhG4BBP6nLS9FAO0Jy+9ew?=
 =?us-ascii?Q?bdhsp0tHXptOK4zc2tkDGEqlPQmtcYwlnvvHLeYbolKIByBKMVMjNMC8adZ/?=
 =?us-ascii?Q?Nt996b+ga7vZOsyw/A8wLWsq2CTbqlYGEoaDNchrwa5d+4H2eWiKWqTLDV+Q?=
 =?us-ascii?Q?qiFPalgSzyr12Z7WmFRVVuAjsgWnCXly9nLWX31XkVKWvHR0TSh2QDzeBxn6?=
 =?us-ascii?Q?vFHXHQMCmZrVaY/xOvY3qyJiGtQwSoO31T5OVvysk/ozknHawXKj0DZN2cbD?=
 =?us-ascii?Q?wPcSMbIQHNMijYYcckBMHoZHRR7BcF8SszZLhmPr8SdEXykPpzk6rbTwd64R?=
 =?us-ascii?Q?HHD5csoqrGzue7K//duDib+Z60mDiTKvwoG2uRX0R0RKS8JUdHL+jDGk+7em?=
 =?us-ascii?Q?w88sX4SNuaUky/p9EctF5+gkFIu55TjooKFHX+gp4lJztKrzNmMoXO02PXz5?=
 =?us-ascii?Q?jrxk/flNfkfSAaMCP3mAVG7R8/00j0X6PlnpCjbkna5s5NHu0N8vdbp1vyu5?=
 =?us-ascii?Q?d/TC3rTba/ZftwPWdt7LoowLclsvapj2wDzkyQqjWkvaoXTjXnXASsJ93PrY?=
 =?us-ascii?Q?MMW6gldRRUkpXk4fTenV9UzPvlSvyI4fQSiVHrdWsEHyH27BrESEGE5DhbaW?=
 =?us-ascii?Q?6FTCgTggmBhvsHL/NnWVYYUEy9CUaD8WNUCdn2QRP+8ZgdL/eWc+zwJjysNt?=
 =?us-ascii?Q?8Ekhg6hh2/BOXMadelcSo9EeYPwJzBdAO4RXbn0cbxLt+HSsjnkMBXK1Wnw2?=
 =?us-ascii?Q?o0TYaEEACmTS5Bmr9832QzsFm4AAZwB6hS9uU7JYo8ugkcgcM2C/xhUr4HHx?=
 =?us-ascii?Q?26GWZxM9b6UxYMYqqW+4bcsoQMiLe9tgiVLixf/We9zoA0uylI0eDZS3F0LT?=
 =?us-ascii?Q?3Ef4Z/JBDcIdv00sVnugvQArDy8VI7z4rnq+1E7JaKv+VfiNGfBxWDYr7ZPs?=
 =?us-ascii?Q?yhFFEykhrwkKtQhme7QUtpp6UHpbHLri/s+AF+i9f5uOcHVbjpQeJgKoUhMR?=
 =?us-ascii?Q?Y8mlEfWXmL1HH22BbacZYvmltcrThaUXy044TF/j13PS22tuDZmFEgSwCR+8?=
 =?us-ascii?Q?L454eUeOuN4kyoQYMJQK4wCnbaImIWDftgoJ9nASdQe2QeVcIdAiuRUtukdP?=
 =?us-ascii?Q?IZCQar7Yz5Na/1M+eEGTWY/iYafqhXAGVnyu3fAX77IHy4Lvdg3pNg0Q8FsR?=
 =?us-ascii?Q?+ENxiHdETS61dl2u59Pss+yrVciEBxyCAXtQMdj8+5jPr9i35wAwn54gosaT?=
 =?us-ascii?Q?dk2/8H8KObGSg3O7tBgzn4/Yc/vjE4+TbyQOQ3PbEEBcsjsNyddEuakXUpSc?=
 =?us-ascii?Q?2CmbFTCrnSaX0ncfEQdATdRieMZJFltpegHqqV21fhh6pWlRIg1cbJbM88Pj?=
 =?us-ascii?Q?XeC2biN87konUnoDQnUw764Sx8csIFWla1E/djiJ?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6f2aaf-b30b-436b-3387-08da5744e955
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:24:31.2132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSm19NaywFEde+R12GPoUwv/lXFbMg1gj8818bGIe0YwpPEv9/pEbjLR5qVx5oXMb0T5+hj3GX0WbmnuzTX5iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series comprises a handful of minor fixes that result from
continued testing and updated guidance from the vendor.

Jeff LaBundy (9):
  Input: iqs7222 - correct slider event disable logic
  Input: iqs7222 - fortify slider event reporting
  Input: iqs7222 - protect volatile registers
  Input: iqs7222 - acknowledge reset before writing registers
  Input: iqs7222 - handle reset during ATI
  Input: iqs7222 - remove support for RF filter
  dt-bindings: input: iqs7222: Remove support for RF filter
  dt-bindings: input: iqs7222: Correct bottom speed step size
  dt-bindings: input: iqs7222: Extend slider-mapped GPIO to IQS7222C

 .../bindings/input/azoteq,iqs7222.yaml        |  28 +--
 drivers/input/misc/iqs7222.c                  | 178 ++++++++++++------
 2 files changed, 130 insertions(+), 76 deletions(-)

-- 
2.25.1

