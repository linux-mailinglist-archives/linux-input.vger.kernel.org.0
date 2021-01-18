Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AFC2FABC8
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394442AbhARUrv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:47:51 -0500
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com ([40.107.244.46]:61569
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394188AbhARUo5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:44:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8WYFtCzYp7l2keyD7B/O1rbhp+9dFxtL/M8l+CFw00vCZkJQio20KO6kfVaXNrHDFIWKx5xjGpozX6xhNAc08Wg0jjRevbU+jEY9+McbNgWFB1psOoZ0YWbYaXNU9+auuXavCX+/CuY9OHKR5c545WYUaAM5/3WLQCDD6VHdoi/XsLkPtvNPlI+zYAsmgVppmj1BaRVAPpkmZxRhOos3Iqs6v9Fifs39uk59lcZT6GdBdlydrJF0EzZcwGnNtZM5Ei64tLdd3j0iY7IQjMEtTzOuoMt6CL6UaMPebfholK0KhGlCILs7zTPYrPG3TaQnD1AS+VPtmxVl34hTjWFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI/WWCaIdTK8iErcIAovc8ZTfzt+R8igDm4qyFOCPAk=;
 b=lV89E7CLwIOYwzySeHBExifXvKr00oafGBXGyIL4+WBl2bUnnZIXk1wQdbDdp4sDo64dRBRXhJzCJWjmm+i7V63MLHF6CF65JoTqGYumdxNVdZ/e/FCqtvyGQB7T2dzkaxb+/pPGB9BefEccg7GxYXMz+shRLGsB2HCNZSn2T2Nu+WU+/Ua2UZ7XdvcjTr97x/0aixWTvqWD6fjpKZ1n/wfb0NIMlSZUlYOT+wRa00gu2aCtJRwQ355k+wPg6VQ7AXi/gWxOVL677l31XWfkD0DSBZ1ctVw8J+/TjlC7QqjDcpybN3adogjVu6MUIW9HbUWutb0Kahrt1GwopB7zZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI/WWCaIdTK8iErcIAovc8ZTfzt+R8igDm4qyFOCPAk=;
 b=KQFkcITj3vmHZM4mZ/k5h5Q9w6oUlcB9QBdDD+6MX1jTdGgnY6ilAbvuPHIgG4htRdL1HeZVs3QgcQPEX/tjOfgRPHOaE1WKAx2cklH2DkHY3Y4voTa0qyFWwq5eUoH6iIJPfgapXZEfACfkThUIvwwjOYp5CxVDsE5umfkZDbk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:43:59 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:43:59 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 00/10] input: iqs5xx: Minor enhancements and optimizations
Date:   Mon, 18 Jan 2021 14:43:36 -0600
Message-Id: <1611002626-5889-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN4PR0501CA0137.namprd05.prod.outlook.com
 (2603:10b6:803:2c::15) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:43:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1193262e-c6b0-4cf0-e08e-08d8bbf1c814
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4846B7F274FDC7B784D637B9D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeMqyIb83tT60qoGSlFbEQkt4RTGKRA+rdBzZKhqw1f0IEUBlO08XPE1JoyQ2LaMYKfiJNTs309jDPLTzNoBERb8VJUpC0YJp5baIEY5jUaZq4vKXZND7hLa2lKg1P0w1C4ykTgLUONWugu7Apmii6b/v6uRZDp6h+FBZ1A5+lZLe8YLU6kMpUl6IzlG5vH3SYPwIlF1ue/Om2KqhMYf5vOxmdbQbnjt7VsGaBvcy7RJsR9yEimk1W+6A0mHdBAbHYHTNOiCpS52msftukdpoZ7cMtorDfFdR8CsV7WrvDSvwsQ9JYIoF6BiCTXdsaBUwV/NBUPUSuuV0Nwmrd8tI9U5EOcVHnZOaiwfdOEWO8fwuR2tDUexcp6sn8IlqkNEBLU/9kVN12AxTURSsk25UMeFsksX1p4RbuW+S6qnO6a8rMgpvy9LAEPigkakUCMgaHnfiTc/m2myoL1ttU+0bBm1m7bg/m5A87ir4E8Rous=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(4744005)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2bxInfWkZxjYy12wpLUz/zhHxH03Ex41zg0lmOQPRxtNrI0DOD1SEusMvbQE?=
 =?us-ascii?Q?kpw3+J9fiCvsJgSOe379Uq3pgTQP3glUi8fZVKi+lE0Xj7vzAqhAekiTjiYP?=
 =?us-ascii?Q?Jj/QkJlivnVVXumEjLEpT6Zt0hvXUKFHWdPnxTEUC0ZNrZ4PGAoOhjstPxE9?=
 =?us-ascii?Q?ru3XIx3PGzxTwFkvW21Sn767PWQjIL31DXPKaOIhgxfuM279yIMYS2BcW+xL?=
 =?us-ascii?Q?ui884Vke72AMpPNFRp4qyAPY0u5TwSS6qw5C+IJ36UrT0ycYDJfPcb2RqwYt?=
 =?us-ascii?Q?I8iucLNCxN4x5+bdVdUEgL7JKfk6J2c0dLwj7yvXLha91gKPF42Xed8sywFH?=
 =?us-ascii?Q?qV6khYGieUrL+0OEyzLjj4zdL1NKhw9a0eiHhsE8Ui1FbjXqI+mk3hLmHZI9?=
 =?us-ascii?Q?hFB53gZ4fzYJ5EvColzCDnyRMxHtgc7YkJSXx7BizYaejA8iIHAOutdMZIyb?=
 =?us-ascii?Q?iTs+eK03WmBa0SSzPIicJh0/dy6xqop/FCUJKr9JWqQsjWsVmaUq1cO6uuYM?=
 =?us-ascii?Q?R0Lz9I5qjDt1j6NbQiHte1kJeUSWl0BzLBoedACUYMADQWV9YVtmCxf5i1lX?=
 =?us-ascii?Q?9fGwvMTqaWTtnp0aVT444WFPheQVAoSuOWOQ3xR+TI1vYPPWdFoHvjTR59Yu?=
 =?us-ascii?Q?vjHGhlwStL4ZChN+FUg75fXQmv8EWWUVt8k/1OvJRAlE+M4QzSWGPpqt0cfS?=
 =?us-ascii?Q?VyrYz0tckpYR3DP/026xOzDfUU59rBC4Lbru3dBATtn90U9dbN4GJbOlTCE6?=
 =?us-ascii?Q?wffCl1gMxomGGsUhkKzrzq9S85SdBdsF4RhffNDEPi4dUzyNyr3B3QaOnMqU?=
 =?us-ascii?Q?DNHz67rSOjkjMCOBHfp4Pe5qFJ4Kh0CiFZZwk9jfwmcSdG04yry4kZmTb+X4?=
 =?us-ascii?Q?6GD3WP+Eul798aPBiXTt1MK9BIl4NWWPC/MxkVdpOagdEQx8GGyGTvy4lVYG?=
 =?us-ascii?Q?tPQDj35mLTxwsF6gbjVwzn8F6DbSJ82Z60vUtopA4zexATawuFKHbb0atzBH?=
 =?us-ascii?Q?lsxa?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1193262e-c6b0-4cf0-e08e-08d8bbf1c814
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:43:59.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHuTMN5VsvfcSxxZrAMyHIccQ4wyoXyUmYH4PqCRfYa9X2d78dryx2S+lrr32+6nKoJXkWklVQVDnMB/zwZA+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series includes a variety of minor enhancements and optimizations to
the Azoteq IQS550/572/525 trackpad/touchscreen controller driver, some of
which are based on learnings during recent work with other Azoteq devices.

As a result, the driver has shrunk a bit despite having gained additional
functionality.

Jeff LaBundy (10):
  input: iqs5xx: Minor cosmetic improvements
  input: iqs5xx: Preserve bootloader errors
  input: iqs5xx: Accommodate bootloader latency
  input: iqs5xx: Expose firmware revision to user space
  input: iqs5xx: Re-initialize device upon warm reset
  input: iqs5xx: Simplify axis setup logic
  input: iqs5xx: Eliminate unnecessary register read
  input: iqs5xx: Allow more time for ATI to complete
  input: iqs5xx: Make reset GPIO optional
  input: iqs5xx: Allow device to be a wake-up source

 drivers/input/touchscreen/iqs5xx.c | 231 ++++++++++++++++++-------------------
 1 file changed, 110 insertions(+), 121 deletions(-)

--
2.7.4

