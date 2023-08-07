Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC95D772A98
	for <lists+linux-input@lfdr.de>; Mon,  7 Aug 2023 18:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbjHGQZb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Aug 2023 12:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjHGQZa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Aug 2023 12:25:30 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EE1172B
        for <linux-input@vger.kernel.org>; Mon,  7 Aug 2023 09:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5lVf784YvBKuuWGHWvdlXIgNrLYwkYxd6rPTzVfIOfN4diCSgCZx+tIdJoHkvtpJouiniTScm+5IFH7PoKcBnTkh9Mzl7gLbTzM75Nx9ABVdN58QrwQVupdEewH8W+bkr92om3gWSwKJjGXOdRGSg4b+YQZPnKrDmIU2hYqmBUAgFFrUsr0A6QN/VsGayzSEgRrtDTj+3tQQIZeHWVFsSCeyfiniVQfuo17sLqgScE8uNBu5f+XVfjMr9YVruUV1Bi70h6gjGYkgoGWjiSkaqeC5eX2a6fQhaLnDmG8LwJ3NbDy9VgbyrgY4x9+bXZ15wdaSX4ZUxblrgWcKfitSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UemBnI/dPC3kKHDJjcvjfFOJ4EcVnuwMeXv+i201iZY=;
 b=mF56TMjTva6e1Hk156gUUySw5qhkPWqumNRebnf6i5waE1HY0fJiBI1839zysK5rpi9VwmcsUkG/OLAX+ZMZl8ZTBmYupkPoiXx3n6sCby9/F7xLmgb28FjR9OEuclrTYlP3Cg1O4BkWvLVkHyTLI+pLz+91fVyGE4p8u4gmGmnfSTysy8tS0hKAkWychlILl7QexFg6jpALZ9Jy8xc8YpI1OrJoglh/p173Tc8hmX1Y0/B2VbFgFZ0OPIdXNYCSN3Avi23wa9wnAA2IP3+y3gL4b9gbL7dvWXRNnLEx7x6rTHzTnXOAbi8cot+O2i2fYxU6q6N6t5K/TLfOEV4EOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UemBnI/dPC3kKHDJjcvjfFOJ4EcVnuwMeXv+i201iZY=;
 b=cgkU3RKNJTAiDl9bRacQlo0p2emb23VWA8zboIpVqDIXHZ37ooLl6Mmjlf7cmEGtxuW9Irn2uLMPpekvrGIbPrb/IehHSFUSXhfOOGq++eyCisOKBbs4zjn/2k1pdOMShWcd+DFaJwB1QXLRBdmQ2FTAM5goPd3tfWuVH1wwpIHOUSiXvQaCZNNDoZDOn/jWvgCkK7R0wEf9WS6NtWQC73eWfrWrJi5PNaoRElv4cbAnWvuG9No8f1RZ+cr5i8vzW6j8dXktlNUjaCnDDx0HEQTzSYKsuX/E3elEZxEMYwQ9Em2piv1frsVYteRjNJo/LQYcI40eKr+nMTr2d8pw4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Mon, 7 Aug
 2023 16:25:10 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::bd1:3314:4416:227f]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::bd1:3314:4416:227f%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 16:25:13 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     HP Dev <hphyperxdev@gmail.com>
Cc:     carl.ng@hp.com, chris.toledanes@hp.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, maxwell.nguyen@hp.com
Subject: Re: [PATCH V2] Input: xpad - Add HyperX Clutch Gladiate Support
References: <87o7k027p9.fsf@nvidia.com>
        <20230804201926.10723-1-hphyperxdev@gmail.com>
Date:   Mon, 07 Aug 2023 09:24:55 -0700
In-Reply-To: <20230804201926.10723-1-hphyperxdev@gmail.com> (HP Dev's message
        of "Fri, 4 Aug 2023 13:19:26 -0700")
Message-ID: <87350uizvs.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|BY5PR12MB4068:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9d2702-493d-4f31-cfdd-08db9762e09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aAkRwWpCK4teGwmlsb5PwLaKTw6rxUNvZ20fFX93+N2dKYT2sfU7VglXOyx8zkR8T/lYGgYp1pna7a1w/nLNP5Om5xemS9MIMC2b7HM0JpHH6zlhU2Gcn2INQddBjGkWu0w1YZvE4E/g+aAG3/Kls4ateijGcucXc1z5BpjCWCC8oqnhEX3bJ6WmFVPJSbHo76Oqq8kgl9sgxtGUhzYfUQc3mzsNsGGqkecx1CohlU4G9vkcJ8qHn9/lt6PdHE/EZs4HBYIDLhIKt/jjY6A6aNkWbVuK5uDU3gXXUjNqk73y64uUC0w5Hmc+PcdRf+55udvssDPxy45FY9lQqnaR0/UAQtnCX508GiXGzCMOmSCR74G9k43Am9UnmXWdi8bxV24rKFozOMCv7+DxL9LzTGU00OFw/HOjbkv6ESCjEYF9pHdkT3wWQtYIIZJg6Lu5K5ouxDoWIMknVJf8M+8/xHUNbFdzOWI9m1CxRN7tMYcsu8IDi5zMnWB5fz0HrAeiu6DwLoUGbAOXkdiNhrcuAm1pohlhSpg0umjIIcLcUGY4oNsTwNWsNUHaloDi3+6q96YWaCmIlq9pEvkBvIzpbaqbNQ9jb2KhDykTx3b19wk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(83380400001)(4744005)(8936002)(8676002)(2616005)(478600001)(6916009)(86362001)(316002)(6506007)(38100700002)(6486002)(66476007)(66556008)(6666004)(66946007)(4326008)(6512007)(966005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wo75rLRYow867xyWeJirwmBJoEfCXYl89W5VcO20wnY1uxQIlUqqTtygTEAj?=
 =?us-ascii?Q?jDNksskNxCVAnraTiIBwVg2Rjnbv6x7QkbNTHFbIrtv4QR2tUp4CDnvj/q1M?=
 =?us-ascii?Q?sa6Cpaz51os2oZbU8GKPDjFjdkCgF4jfdkTkDkpjWT56stwJIdu92Pi1FZ/L?=
 =?us-ascii?Q?ff3YNG3LT8YID2fPNxcARFey4+5HtF9UKvl53ehvWGtYDeEG5gctzcMoI5Ww?=
 =?us-ascii?Q?OMpSlmcaf+tvuDtvXwRJMqqPguQh8nt/jhZP9Vlm/6Bi4zQTtzobt7dFGqf+?=
 =?us-ascii?Q?QUp1GuGI7BySUCw6oBBhaWHBXx+ELCprS00TAmP6cISMFFmpwft5PkBfiWed?=
 =?us-ascii?Q?98FeE9GR+8QTiLfhQJfLmRFV7dPpJuRWUDKeIXsdUuTjGuL/9WcQGm1PNjEq?=
 =?us-ascii?Q?969ZP2EYz/S/bfoJBBbq7cdTHhRXUC5ivnBV6tQQoA4+o0HXAD30HCh4FtuC?=
 =?us-ascii?Q?UgVhhamiUqlCgVoigveICCzM2WT+LczQTGdpLhhDbB23PxLYQXfDm07/HDrw?=
 =?us-ascii?Q?T7ufrjKZXV9QDIGJupp/kkjruydUbrKIM5tw+DM/ZbdJbjqc4L7aKfjO4cbr?=
 =?us-ascii?Q?coAqA7seu8il7+QrCkZFOre1BNqE37EIXNgHgplMhE7MgX+PehLGtT+C6CLh?=
 =?us-ascii?Q?sZS1JYKrBILeJMSAmPaotzl9m6/UqR2sKHUdf8lqSXrRLFnDXWBTQQxRlpn8?=
 =?us-ascii?Q?2PZFdQwyYXTcCjWlBchFw+q2ctz2G8PYLOzbcV5AHAW32tGsnei8gCeES5hM?=
 =?us-ascii?Q?qidVjOiZnnCrmFqr0b8EneCp51TZkCHjob250gkeOtJvBX3Mpr2KcdnIA9Ah?=
 =?us-ascii?Q?Amh7D2uCFurXk8tkjX+ummi1N0IU8ZXmxKhUiOBvikU7eaPUODXGZ/H+YJhn?=
 =?us-ascii?Q?gA5LC2Q8+oHg2Ms9BlDR6zv4Sx9arvhdqNs23d7i2C66fbiDeLwgm1AHyvNv?=
 =?us-ascii?Q?z6lRRtpekSF7R8E3YgJ6R8p7S0uIzlDYHGxEGr2N/UP7MJXbD4gzjLRy4VWj?=
 =?us-ascii?Q?GDSGyHjYWUvxs1+NNyzCtla7RtWX/ENpNVxsPVitgUnwebn6/D3/tsO0viFt?=
 =?us-ascii?Q?D7rIMErjwjyuYiSnI8QAodI1PQBAbIWaITS4E7MU8WM3vQ8e/mKN1hjlorVH?=
 =?us-ascii?Q?oqrvYNDwIxZ4ayYvZKot3YiCW8oZOVQ5FYefUw4okSLHaw/RC7vc3HFEg036?=
 =?us-ascii?Q?JlXuZ8RcljsQOqB65heB70V8V0mPLqXQwXR90Rk94XT0FRvPBcOL22fTTHdT?=
 =?us-ascii?Q?rHoap/SB/TySUbV0Y2lN1pK2ZFC7C3xDWO5f4f2EdM/m73b+Dmd+G7YS/Q4l?=
 =?us-ascii?Q?eLa8QothJ45HjogDOQij1a32JknD/8u4ldcw31b/Ejs6X5q1mAei+RVxF06q?=
 =?us-ascii?Q?iyujlUbJ9MCvJOTdC/N/f2L8rZKmV4tNpm3lMwjY82PVas+xHKfoRpCbYvs6?=
 =?us-ascii?Q?5dZJiDjc5OmquyhGFKtusqTBGhm30O2vJjZPA+j7d6iREpA6EZZOa8i6UTU7?=
 =?us-ascii?Q?DgQ/HzCapAbts07wbD+iH6cLTn3fcU2rWOFr9+E4JSI5sgBi1nyNpi61/o2i?=
 =?us-ascii?Q?c/TK13dJIItNaQm+cfxn0scsEx+twEu7YXvNz0YH+oc8TmjpTFC7PiZO+mOQ?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9d2702-493d-4f31-cfdd-08db9762e09e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 16:25:13.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxFkXGPgHTTvVpvix8jivN44d+xD5j67Wa/Cx/xBA7iPKFjMvQNPzuM9IVU+IrbNGyDgMiHWk8iLkaNT+xxXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 04 Aug, 2023 13:19:26 -0700 HP Dev <hphyperxdev@gmail.com> wrote:
> Hi Rahul,
> Is there anything else we need to provide?

From what I can tell, this patch looks good now to me.

> When can we expect the patch to be rolled in?

This is up to the subsystem maintainers to manage. In the case of the
input subsystem, that would be Dmitry. Keep in mind the subsystem
maintainers are busy and persevere to help look at patches. I am sure he
will get to it in the future when he has a chance.

  It's also ok to resend the patch or the patch series after a couple of
  weeks with the word "RESEND" added to the subject line:

  https://docs.kernel.org/process/submitting-patches.html#don-t-get-discouraged-or-impatient

If you need to do a RESEND for this patch after a couple weeks, feel
free to add my Reviewed-by to the git trailer in your commit message.

--
Thanks,

Rahul Rameshbabu
