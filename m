Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA9886B5741
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 02:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjCKBKK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Mar 2023 20:10:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjCKBKJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Mar 2023 20:10:09 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3B6EFB8
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 17:10:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYrISxDhJZ/8hYHRZFfBidxmXAa/xkHmA/k9j4SwBJGL9ZgZiMVtHT9bfR92tTuRJv2hw8K2avNIBAs9EFG0t50oUgjMMl3IcLIsZ2zV3+bB+R/YtwbUjulNtaocEW8v03R49grR8DjR605rsM/+frNVO2WDIuBN4CosHurTuaVSkAhq5UxQuqgenJPTf9u1xUHCJxhhkG1g1KlTvX7Lnj0XF9fEAzrmWdhxxrXb7SUhzB0MHj+iln/K88pfVtr8sh1rynaJgUnm+DjN8xRBFD7QsRIzWptGqrqYlAytmscjAO0ofccITqf1d27UE+9KoTyvCqbNx9B9W6lzzVIK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maFcOCCTl6aTtJlEa/8fVf2Amh3tGRNMmBdkdF+eWH8=;
 b=Eh1UpD/e7lx/+TvPyNDj3zjBW6Sjcn4lxY6FV9J2YgGw/NEcspGWVJtSYQMKXeo3liqNcLIC0ThfdvPGFzJCN0FApP9AYZVkA3WuuPig7WsBzCFDUEUbXc+NkD88xTiSAPTg3jysljbZRoBQtIlVhzKxmNW1f3thVJG3F4EUVCjN/UP8FCWcUOh7QhsBtegDLI6a3GiSiwjignI76dDrJQZLwKVzdG5eeHEe9EdETe0wL8TgXeROPGR1/mbpOSa9fnTnO1NqraEeX7q03CUCN6KNiExLPS5mPMwxKwYKm0UKcvUOvce/l5Fu98WJ7/l6W/UDrjZoaj/XJ19R6o3t/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maFcOCCTl6aTtJlEa/8fVf2Amh3tGRNMmBdkdF+eWH8=;
 b=UIyCDc/iJ1oIeY+9KAQxz9j3yHsLM9ab1gaxGs2Z0kOztm0g1TYuZnUfPTnGW+FPu5GQyXvGj+6DQwGS6WFDUkiFM4xzskNEnJqK/hHQNy6VBNP0NPizYa4vSX7nWDKC2CR60SL/RdBjYr8qf6CSwqHNg9V6Hrt/DoZGpxQVuZuT0xhxq/egOfRhMKbB416SFk+MgzvXWsOWYEkJn1qA142Qf7m4ocZJn+49VU9u3o7TvYb18XhA+5z4hGJ4kcJiLuarTOQfD63dHKA1LaumFcefpfZwSInZj4/ztthgcxFSVQPS/zEqBSSgTSwLk1d4lIndtdV6wTBDlr6aGM7xbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN7PR12MB2740.namprd12.prod.outlook.com (2603:10b6:408:23::16)
 by MW6PR12MB8866.namprd12.prod.outlook.com (2603:10b6:303:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 01:10:05 +0000
Received: from BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::4136:66b8:8b5a:2214]) by BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::4136:66b8:8b5a:2214%2]) with mapi id 15.20.6178.019; Sat, 11 Mar 2023
 01:10:05 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>
Subject: [PATCH HID for-next v1 0/1] HID: shield
Date:   Fri, 10 Mar 2023 17:09:39 -0800
Message-Id: <20230311010940.57585-1-rrameshbabu@nvidia.com>
X-Mailer: git-send-email 2.38.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::35) To BN7PR12MB2740.namprd12.prod.outlook.com
 (2603:10b6:408:23::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR12MB2740:EE_|MW6PR12MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: ee41a348-3ca1-4436-c837-08db21cd5922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68gCGZ1m0OEIdO7cvcXpJTAAylHXvGOwpQKrmqsJ778mIn2yN2O4Msp9qqmENnbQeHUKQsq4wAMaRAFPSo1fqO9X9Eeyn8M9d4BcdzEh26OsOT0P+CgfoYeu5i6WZPMm1wfIDaMrhSWq6jEc2z1rDzf66jKmIn/dgTmGKgQCEs73sZ3GtxOjY8Lz9eMxQ/MQvghU7MctAX9A/98/ea3lpjak8+FegcWCwSYhoTtg29yo6a+jlw7nMFNGktks2NaYPfjKfJtbMwOGzqiQkAWnhaJxeBpWVgdfT/3RmFkIn+mCESJDjsOXSjeMjijLncrVL6D+2tCytdXmpWijYfSJdoX5pKBB3umZJlyFpd5Gq9zTBwzCRjlRNESffuS67DLv1tLA9zZz41bH/68VFjOG65ff5CTsHwZymJWj9CAkIHf1xqvRfAHpz+9Gaqeam/CDk+Q0H6ooqNAkCvUEeR6rcF6kVi6ox1xpv88YzwDVgbFXbhiikhU49L9kLA0EKkUXcMMEfxmgMmQ7QMU49JR0HO6Uh3Zt6gRkwwIk2uSb1p838nSCazpjmazVXEbYtYPuGd2oUH1PdrWTdzrij0nPuJxqIF5JQ8ZhrcRa1vaNyYCulianA/YiWE5TuqiqJ/TakBDxtjzDOye7ACunTtxp5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2740.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199018)(4744005)(5660300002)(36756003)(86362001)(6666004)(66946007)(6486002)(186003)(107886003)(6506007)(2616005)(6512007)(1076003)(478600001)(4326008)(6916009)(66476007)(41300700001)(8936002)(66556008)(8676002)(54906003)(38100700002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xME0hblqDtn842ybJGX6t0/6ZIqBCEpu5x2DbreO8Ke9S39kOxO4Xs3apgPX?=
 =?us-ascii?Q?Xezi5IuFg48ulDq39xfMsJ/FWaZ7VOSU27+4zCJ+AYZUgKF7X9Y9SOeXHj6X?=
 =?us-ascii?Q?HLDQryiQ2T2N66jRAye8TD46SH1uBKa29VEdKUXtbNKaXcM2VZRvjQ1jC2dg?=
 =?us-ascii?Q?wkmD/ASYN5fcXRq/MtVc1OEby/JOWeIRze/rxbEkX+MPArWamI1tSroQljJe?=
 =?us-ascii?Q?sxmJZksLcR8J14Fb1/4fGpQWQP/oj1gZiLoFCTadhBKClhb4o40BVn0TCfXa?=
 =?us-ascii?Q?1X/XCdFNyoeFgY/X3KpC7FhWfg9UTuNS2ooE2widAFPhRmtGwbfveb1jZTXf?=
 =?us-ascii?Q?d0QRwpFElrYAFxvms+Zb2wI7UAQOL9wA1DmdMjCkSaitq+Sy7b7gLHkNT35k?=
 =?us-ascii?Q?H35lUvWKekHQf1jmBbkLFC8RLDWOUJ5uc86BOIVFs606lyQZFL4kuSYuYrtu?=
 =?us-ascii?Q?tEu+iROYUBQugQXHgPaWTOu0nqV/Cnh14T9nkftggjNOF9oRLJSWDhKX+DCN?=
 =?us-ascii?Q?23Gbnu3N87ACC71njobc1JYKD/SVbP8enpD4OTX8z+oVsXpfD66NSBpErjmY?=
 =?us-ascii?Q?jpTypwAjPtvDmBk/4c7VlpUpzaJASLzDG0ceYLFImC+MPUAJh2ZemHVR+9Qd?=
 =?us-ascii?Q?W76BpjKwWYWfpm+HiwR2RvH19EGeQUkl+QCgXckdYdStBtbqRF9IJBKR9v46?=
 =?us-ascii?Q?mh6I4C3P5w3RQiOTRk7BJCbMvygKcIxBsyzBoifzdF3AtEVhQtr6PRI47qn4?=
 =?us-ascii?Q?ajyyc3ccR/y7Bv5CgWiV7N2Dx613051iOAbTwmjPM9mErLb4a/FXbggxHk1e?=
 =?us-ascii?Q?t1zKgKAbhgOEaviatzbLPp5R+XVg814LfQJMGPh22muZtBGj149UF4pTo+h9?=
 =?us-ascii?Q?VmLahnkEjriOLZYJRS6nUyMqlonEQoIFCo68Kh1A8Gqwf5mbv0UyWs3Apvtr?=
 =?us-ascii?Q?wj59tdiIq99dWbDhOBbe8VqSvnb0itR6uoLdQX4hW0UEmksf5caGoe1LjfEU?=
 =?us-ascii?Q?t+EriFbzkm60fR248DuoHCJkl+v8dqlhddPnIwtuzM8cleeuekO4Wzf3nGyX?=
 =?us-ascii?Q?EVol3HuqtNkovl4pv3J7+aRmy7JzQy0U/3IfeWm08nDFhqfhyyD1Aieceb+V?=
 =?us-ascii?Q?TT3CqH1D3EaZRuLuoMR54GxO8lEPxSBq8Anj2nOB7p7G5w7RL5woRZZZ1urb?=
 =?us-ascii?Q?6LlVBcpFWLIhVWjiWd5IC3wSPSgp8JgsT+zXcwLCM04ZBw/Yg7Jt28zyKZtT?=
 =?us-ascii?Q?irydVuDmA7Ltv8K4/XYgLPjLXVzhcm/+MNc5U4dmtqQlDgGTgO7VGtQman6B?=
 =?us-ascii?Q?vqtnScPTvXW7UBx2UNhIxxbnb1zLgeMOTZaroD14w6fODiw09wwKq9Gm/WII?=
 =?us-ascii?Q?0RK64e2FkK8baCYPPzqgJPlLzF1iIfGjfq3kWHf/ZljSH1HqjGpojUTsOuQe?=
 =?us-ascii?Q?NlAySn9fD5KGSUyNQISbwPP+CAOROe1O8cYcPtoquX1N7K1wbuDjvHHVLnt+?=
 =?us-ascii?Q?gsxohQMp5ifZe6Cp1YlOdH3gmos4Ebok/+VcWuOu+trx4x6sqVJdynM/1qia?=
 =?us-ascii?Q?v00NuqWLXY2rOAScFg9+Q2tlI/FYve+mk3OQNRMgc7E0NRIceOp2wB2CCEzz?=
 =?us-ascii?Q?L6HFMDZ5klDWTq0EsJl2ss9KNEDmBym87sILz2FcoygK9v5rXYixqegSDBTe?=
 =?us-ascii?Q?HMXhXw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee41a348-3ca1-4436-c837-08db21cd5922
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2740.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 01:10:05.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZPX3aLODN//aQBZ4CCgUEpp2kuBIq0dVgE2SN6BXzEhHe0eUc8I3ebQSyOwXIRlTMRCK/gYKHEdz5pud54YDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8866
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi.

This is an initial driver implementation for supporting NVIDIA SHIELD
peripherals. Currently supports the following functionality for the
THUNDERSTRIKE (SHIELD 2017) controller.

  - Haptics (ff_memless)
  - Serial number query (sysfs)
  - Hardware information query (sysfs)
  - Firmware version query (sysfs)

Rahul Rameshbabu (1):
  HID: shield: Initial driver implementation with Thunderstrike support

 MAINTAINERS              |   6 +
 drivers/hid/Kconfig      |  18 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-ids.h    |   3 +
 drivers/hid/hid-shield.c | 587 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 615 insertions(+)
 create mode 100644 drivers/hid/hid-shield.c

-- 
2.38.3

