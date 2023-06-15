Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAC973213D
	for <lists+linux-input@lfdr.de>; Thu, 15 Jun 2023 23:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjFOVAR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jun 2023 17:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjFOVAQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jun 2023 17:00:16 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2084.outbound.protection.outlook.com [40.107.249.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0C0193
        for <linux-input@vger.kernel.org>; Thu, 15 Jun 2023 14:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq7KGeDwrC06VGod8/1sXvD+JNmPi6LW0CpiN70f1HMwipeyk3vdFIDuvkBjlGHfXJ9/2av1PqLwzSez1YPZcXLrbJ3K3x8//ZANQOHMAfFuDNy8XcGo3LtpLHq1b2iu/6FmleZs8qCK75XGdQ4Q4viBqvg0sVNcZ8cjwkC80MvX0YuPLSjSd6U4aKjbOv7YguBLNWMF2/VDlrBHOn8UbX50kzID1yQNf/aT4gC77WJm+bMWFjF4excjII6N1Hf+P84gp4OwS4f0PNYBh8iBQHDsgD0C2kGMpbiKzTpBuhgXgayx2kJR5tGDtulCLtvEhTeZj/aV41Jsv5XinWQECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz0G7yxjevT1lB9nWbX3SavNf46v8wA2hXbvxDcavs0=;
 b=Fsbhd4iYot8byEBR2ywDA6kFGuKZHwEMQInPb6bEf/SKF8l4VLovrVkhZN7d/7Bd1XoL4PTgSqh2Cr3fFR996rIt9B4ZbPpugAjzp4DVYp1fJy2fvN9BzGWmg9A1j+It4t14SxWQ5MaFj2VOc706CPDdpirR4Bn3dtGmrSG1mnquobN8CLXHXLwYHpF9FklnszN3I0lTU45U60s5r33TafFauFRk2a/3Dc+g5Db/aC7DtvqUm5nWjG1/SBtsedllgCvuJEPArSmEBAAk33EJ7W0qH3v+Aqeb6pQkDMdZrDlP3zvddMTQuudI7fp4IaSHWt+Zotz8GrcZNtFORcmM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz0G7yxjevT1lB9nWbX3SavNf46v8wA2hXbvxDcavs0=;
 b=NSdwQxvB6Bkn/T3ypyJE5ZEIakA2gIuX84LuzeB3/THGO90oZmGcclOYeL5v6f9TZ4O7U/Am5wwP7V6CVAb7jl6CDJVaZiOlPNCDcsUkzg29Im4HG+R/+KUK0rXokIqSPX5BOCsu8ejW65Cp+42Tb1jFWXSUVERUC2knrKDXcGfMmKGp1QAgsvP03GkHRMmb38L7ybBPk0/sg3/BXB2WoV7t7hUozm29sgR034M4t+kBkuHkTUlyrDrBP1pVYoYpEXJEL0dDyCUKFVY9UfXBxihu0XkUiFO6og7xqbdeL8ZHHnJz2E2T86cTawtnJ9ydcEM1gLQ6jL5LEjqDC12nHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:416::10)
 by AS1P251MB0502.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.38; Thu, 15 Jun
 2023 21:00:10 +0000
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8]) by AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8%3]) with mapi id 15.20.6477.028; Thu, 15 Jun 2023
 21:00:10 +0000
Message-ID: <f702b1fb-a31d-0cd0-9f42-dd8d1a0573b5@polimi.it>
Date:   Thu, 15 Jun 2023 23:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: [PATCH RFC 0/1] HID: allow specifying quirks params for hid-core
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Language: en-US, it
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::23) To AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:416::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0350:EE_|AS1P251MB0502:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcf68f1-33b4-484d-0c04-08db6de38176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LcikRh6TbE5F3rty7hq4IMrANON+eBs/vD1VJzzThJmHMAPcTZgO0WNQtdzv/hsmwDmm9oo3kXta31IRoMQNBhihzmLMM5ZocSfRBTKXioGdvpPIDraYw3yphjSu+M0MybA8VLb4Rti0ODGPq+a3D0KmBGx6CiytmCnDJBhmE2V433Y9I4U/O25U80hnthRuFzLw/QqwQLrfzDsgrwBOeUtTzjdN6tVJAbSVXXvM4j66EVNmJkxm6Xn9HxHiK83eUd/sMEjaKIdHQYVmwCouoXT9fMVITgaii18bzNSHu+bHMFzHLuPpcoCucRbVKdoYqmo2oKNilMNfvsKAaCQI4tFUUVoFK0WK6+T8mkR23EUIYeQbkEq2hggtK5UZ+7E4wTjfpEe87+LAAlTLnEVZx+T3E3Qirf4slRQUh+tMZ5Tr4Vm9Xv6OBedJUvgIjhzlv+UHSHOOD+O1igvYuhgzMMhF+/PVxYE67TJOzOJtVxuSOQT8whrPfrMyFh7JDZaaOq6lxeign2A55RjVss31kEOfev2p84JHnAJXSZMrCM94hKWUmHYRHB/iVrZB9+6OqydokLJMUe/nSAcGFN9NPHyqNo+wfrLeSjvi52bGnys/ZcAoTY73ocULFiIOWeNcYJP7vHrj0qGwob4pDh+yNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0350.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199021)(6512007)(6506007)(478600001)(36756003)(186003)(6666004)(6486002)(2906002)(4744005)(8936002)(786003)(316002)(41300700001)(44832011)(8676002)(86362001)(31696002)(31686004)(5660300002)(38100700002)(110136005)(2616005)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNXWklVODg5TmZiOEcwSldaQzF1bWhZU3BkK01MbFVpN29kYXMyTnBEeXls?=
 =?utf-8?B?dDVJdHdhbzlhUFBydnpoR1EwR3JvYkROZlpVdEFrcDBuV2RoZ09NMklKRHNW?=
 =?utf-8?B?VEVUZjhmNGpkNUxWZXBsQlJxaEpEcTlRdHQrNWxUYWVoY0pZcGpJUXd1MVF6?=
 =?utf-8?B?QStMcWRydG1CT1FWb0JmQ0xtMkg3bjlpTDlzQXlBWmlaSk9LVmdSWWVzS292?=
 =?utf-8?B?d3JGdGIzYTh6elFIbE9yeSt1N0FldHQvKzA2UE9NY3RoSURQYTVvc2tVcnFL?=
 =?utf-8?B?Z1QvNnBWazRqOXdoNHN2RzJiZE9DT1E5eUlJazlmbmI1MUVQM3V2cTdtNGl0?=
 =?utf-8?B?NUdjai90NkVpMjFZam82U0xFNWM1dE96bmlkUHRBaFBiMXY5UFZXYTBLOVV5?=
 =?utf-8?B?bmgrM29NeW5PVFMvU1BCZkFxekM5SHBpRTVoR3ZCQlhtKy9ST2lQVHJIQWxp?=
 =?utf-8?B?bCs1YzRKWThBZm5qcUdxV2xIU0owSmRmY3Y3bHZCYjcxbFpZdGxBZUk1M21m?=
 =?utf-8?B?QjllVGMwY2VNenNVQ1BhVFFOWDRTWlFyWncwbDI4NU5PQWlFb2pGY21GcEZH?=
 =?utf-8?B?U1NtbW1PN2lVV0YxK2dENVpySHBJU2xnK3FNeEYyR2JGNVFRL0hoczRwSkhw?=
 =?utf-8?B?WFg2dG5lSE9obnAweGU2di9HRzVNODkxdEJERGUxRGlFOVdPSFdkREdEYUJR?=
 =?utf-8?B?Qy9RK3ROVWlCMHROUCtVZ0hQWVY0MHNkYzA3dTRGbjNRQ1hLenZSQys1VHZw?=
 =?utf-8?B?TFIwN2t5VjE2aWNGTVdNNGZtWndzc3h0N0pyeE1FVGVXVGE5T1JOTmZ3YXho?=
 =?utf-8?B?U2FvWG5LTXRCc0tlU1pUeUR1dU5INHo0U3F4WkloMmkvcUZOczBsZGh0QXNI?=
 =?utf-8?B?eXQzUFVxZjVQOWVSaXZ0cVg1cHFvVm8yNWF1Yms4elpUTXFFTnRBRGtaNHQ3?=
 =?utf-8?B?dG1RQTcwVitrWFE1aXZsbmJKeUc0bXBMS2NoVkNuWGJsNFMrMXVDaHdESmFH?=
 =?utf-8?B?TDVLRFVGakxiSEh4TkNiVjFMa2Y3WWZCelJBMzZ6TU9aeHRTMWliamU2eVQy?=
 =?utf-8?B?Kzk2ZUtGTG16Sm5uOVU0VGNEa0I5N3hSZkUvM3dLby9taXZ0SzVtNW1IYmt5?=
 =?utf-8?B?cXpMUkRjVGNTSlpnaXkxL2hEc1V1QU02dHcwNnQ4OVZXRFdkWUkzWHEyVEd5?=
 =?utf-8?B?WVZra2FYZEltbk5oTlZIK1U1V2JPRlN3Qk01elB4bUVkYXM1MTEvN1BTZ3R6?=
 =?utf-8?B?MndIV3lZcDJrbHNNSUZSY1hkbngxUmdpbzV6VWhRSndvZUkrMlgwSmpsbnls?=
 =?utf-8?B?TVYrd24zTFdZb25WQXRmK0tsOEVwSHN5R3VLZ1plU29ibmJHNWdkZ1BTc1c5?=
 =?utf-8?B?cy9iVmtmZkJHVWQ1cjVHZHdmSGZpRitONVZ5RWozVkRGVmFkdlBzczk3Y0Fs?=
 =?utf-8?B?cUdzY29xYmlLdXkwTnhKSFdJU09QeVc1T3BVNyt6VDhCeWM4TkZmZVkyeXQr?=
 =?utf-8?B?WkdQWW8vMzBxUlRlbndCRUpNMjFWZE8vUVExc05ZWnlVdXF5VmhhKyttVGZm?=
 =?utf-8?B?cWNuWW5pdkdTNG8yTzVpVjN4ZE14VFNlWkpBVU5DenplL2RkQ3lTL3kzQUIw?=
 =?utf-8?B?Y1BRTDdQSTlXZjIyTkxwem9QSG1SY0JIa2pRZWlJVTJOZ2s0U2VMaVFSVDJx?=
 =?utf-8?B?NHBDMHVtL1Rtazcwc0F2cmx0VFRMOFRNeE4xTTljalNJS05hc0Z6ZWJ4dEdL?=
 =?utf-8?B?Y1NSWVFPUldVUmpMTDRNalNhMitEYXhVdTNmSEVoT2kxSGEvZWhrNXFHdEJu?=
 =?utf-8?B?TDFSUkQyL0o1dGV1OVRsNkwwRzBrNXpDVHYxdnNNOTdJdFRFK0xPUnhEMkhV?=
 =?utf-8?B?cnRSSytTLzVPeW9BMnJUbzM5b2wwOEhQYStPUVZOYm55b1RzSmwwT2tpQ1ZH?=
 =?utf-8?B?QlpRY3NFcWU2ZW13b1hwaHFwTC95aCt5SWJSdzYrWWg1b1hXQUFMNWZoZysr?=
 =?utf-8?B?YXZtTjRha2dGWWh1UVNsNGJjKzNHdUc2aWcvUlFiZzRCeEN6dHZ5YXFMa2J5?=
 =?utf-8?B?RXJDeTJpR0oyOGk3bDFLRmU2UDZPR2hNVVRMRzVCMlV4S3VkK2Zubm1ud2tH?=
 =?utf-8?B?MTU3dnNsTjFWbnU5SW5YaHJPd1Z6akI5azlqdTU5MHoxaHJUdFhmK3ZQSjRC?=
 =?utf-8?Q?4+aYQbH+ddJsbAl7LaA1jHI0X1kbAY7wg3+fQiy82QeJ?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcf68f1-33b4-484d-0c04-08db6de38176
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 21:00:10.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rspAfX5RyVnnaKAZB7pVVX8LYH8qF5VlRq2C46PLWO1ObQXsb4V7TftGJUf2CFgzHboez3x79Yxyn1O0kyMaMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P251MB0502
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Right now, only usbhid accepts parameters 
specifying quirks.

Following Benjamin's explanations,
this patch allows specifying them for hid
in the form hid.quirks=BUS:vendorID:productID:quirks

I don't know if this is a good idea or not, thus the RFC.

If it was for me, I'd get rid of the usbhid parameters
and of the duplicated hid_quirks_init,
forcing everyone to specify the bus,
but I fear this could be a regression for user space.

Marco Morandini (1)
  HID: allow specifying quirks params for hid-core

 drivers/hid/hid-core.c   | 13 +++++++++++++
 drivers/hid/hid-quirks.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/hid.h      |  1 +
 3 files changed, 47 insertions(+)

-- 
2.41.0
