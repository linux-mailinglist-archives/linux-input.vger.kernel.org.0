Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A8C558CAA
	for <lists+linux-input@lfdr.de>; Fri, 24 Jun 2022 03:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiFXBNp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 21:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiFXBNo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jun 2022 21:13:44 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54FF5675A;
        Thu, 23 Jun 2022 18:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5E5oIOYRzezv7qJUfdd+euTCU3o0eK3kijySwH/EgwmNmnc6gbfpI9htQpf28EkibunyHIu3J0rVIkDl2mKvPlEs9lNZ+Gd+uJVDe46VRLBeCuXvbKmR85ws8Z+WfR/9i6TVww9ZKFzCnyeiV+l57GkdZNeNx6cxvKkios7NTJM+OSJXGcnJiSMWsjn2B+6knMDBslrtHEyB+bnNThV07nCDF2fgxsGeulQibUL/oQ7FZROf+/qcKCaOIAPgIijQ2VH7OShHHwzzUS9WUPpjj9ZaIP2KtR/EjpC/yVCyd+krfc62ej0p4TtwoE8ahn76Opno8RWmM4vyucbUgdvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky1RTkforugfFxsogW4vlj6GWqC29uwlOqa62lcBTj0=;
 b=WNv4khQOncTf6eLNYOI2fSueBQ08TAox5vtmS2jARX36VLmibhdH5/abrbV1ZexfxMDat8S6M1gprQqGM7JtCicOWKSnoNqF5EWUZgnyJiov1hFX4teIPihejPjdyTglDA3vraWQC5GQYuN2bRmiqh1iCgE4qH3ujNnfcFWToS9bfrcjA9NTxoQDKALIxi5+0p9e2KaaIx/w8xfVozuPI15onu8zS03rRMClHJHwe/B+lDtyi4+E8AZizaixNgoIVuo8zgeRkrd66R/5g7HS+SHDc5a38T3U6dxZsGMt0qdqTX+XfbbkSY7zVV2Nc2xGiQHWxSX5XREj2ZB7uRJxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky1RTkforugfFxsogW4vlj6GWqC29uwlOqa62lcBTj0=;
 b=BWPSNPw50mVr6iBGWXu0/RR09onlEO4vI8gyRQsXoeu3hZPBZm21lupbuPAo4Y4sot/CmmBNam7J9Siqh2C5C2uKy1oYOBkNbYoYUDnGeVPVpwgz5bROG9QpO4ORUNYQa52NeshMnn/i2N7TWdHNxTsOhRw4WoDhvVHomERjCHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB5433.namprd08.prod.outlook.com
 (2603:10b6:5:f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Fri, 24 Jun
 2022 01:13:36 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 01:13:36 +0000
Date:   Thu, 23 Jun 2022 20:13:31 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7] Input: iqs7222 - remove support for RF filter
Message-ID: <20220624011331.GA87950@nixie71>
References: <20220623035309.39528-1-jeff@labundy.com>
 <20220623035309.39528-6-jeff@labundy.com>
 <YrUN115qdy14sfEx@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrUN115qdy14sfEx@google.com>
X-ClientProxiedBy: SN4PR0501CA0035.namprd05.prod.outlook.com
 (2603:10b6:803:40::48) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8062099e-f383-4a6f-d18b-08da557ec371
X-MS-TrafficTypeDiagnostic: DM6PR08MB5433:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AF1bYzvYKgLaGcnc3wUdSZIB65CJvNicPX5Wzn8mA9xn1t+iR1/wZmPR2SyvJd/eN1UcrSa2A0/zKxqjazeK2qSwlCzsTuoTSmSP5/rmUBP5ML4UndLXQUkGnmXNf7Nm2pyZCN7o1F/ZB7FxBS8j6ihdGOuPXdXQIfx+/bGAPEImOIMxlmum2yqWsg/2NyjSfbMWRSvCTfp3W7+KpjZA/MduIwt0VT2yU/4eNW3M70dYjT5GykL1U4Hocg8jUmiQ8o9Q6t09mKW6jRcHq4UxsizM1QoNP6CtTxCJMZOThPC69oWHk0L7cHpQuiDh/yut3nahE9+KRHpQzWTNfR6S3YyAZTVfSuAQE3bkmHXt3KSzPhjvZIFVvudx3nRvjjPFesz1dRy6NIMVWphaaAhPbC2+0cN5P7EmhJdv7+Ypsr4+8XQEAnL7bR5buHITFslXd9fLjAcyUaZuDeK/A+Kq9D6+wlTs+5AK/ukp4/wWt/trICi8M/l/VZtuelMsTUZ2XIze+N4evI4t9IwdEHKCaxayQqCpBTY3qXsl8lcw7eCCStBOmWtOUWetDVY2bMYgpo8itOdjPbFY9wMzmH8YvWHgZlxGiX+9q7B3XVsxQQlyhx/tCpx//Dr4I1zkkN4dE5ubYzysw+pvmDwKmree0EH3XnyR7ZmhXWT6RBGxpayv099EbCyzh2dUVatpTWr0NqD/O3XclNonA6TudtnPo6ucQBemgXeaNq+oS7YhI8yuSD1nhbsOqv9BN1g9fZ2HboFJlAc+eKQvm2FshUld/JLZsdl9PXV0r4baotabhr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(39830400003)(366004)(346002)(396003)(376002)(6666004)(6512007)(8936002)(478600001)(41300700001)(6916009)(6486002)(66476007)(4744005)(66946007)(52116002)(186003)(33656002)(1076003)(86362001)(38100700002)(8676002)(9686003)(5660300002)(2906002)(66556008)(38350700002)(4326008)(6506007)(316002)(26005)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZOW56Qt7WFpC+xsfM9nk5RSii8u0aZfyDoWuk1pR7A2mF4R7vR5Dt23Zt6FD?=
 =?us-ascii?Q?SLQVpRFxfs5WGReHxDzAVcATfav5rT8qbRmBHvEOXfqEBgVDeatRikLDrnaW?=
 =?us-ascii?Q?dDFgRWXrDWrx06O4AfC95k0rUfZNfiOX8LZSSWkepLtXgOuOa4CoDlW+SriH?=
 =?us-ascii?Q?b/fBY2Fwtz7sa3T0rajd4UguHFZtwuHoxo87xk/9ipoc7+TN2wxNku+3X5nb?=
 =?us-ascii?Q?TxI/WdUVm1Kk5q0BHuCoGoYgC/xOpTHzrJrMfhf2xtpU+t/e7cJqkqzTxfvL?=
 =?us-ascii?Q?i6kuBY2MYkcMPPirn5AyGZVFgHi/5NOq1nF+d9yxO2CeSs+1SfSpJ3VXfRoy?=
 =?us-ascii?Q?5dmCzAAtBgxAa4aUFRi6UH6QWwPZeTi88tFn1i8T4VoBTEMh9uvw273lrnoR?=
 =?us-ascii?Q?NZzWLc+AFeEv2Z6SJj1AiU1xZlCvM6oilm92C5tE+V40uNcLaoDLFdSTmgoy?=
 =?us-ascii?Q?CJzG3SLbKMGDIRPBTfxSv6iSaUsysYCdGVaQ5ofwBqmAwAZRlwG+w5hmVy+u?=
 =?us-ascii?Q?y3fK1i+co/opvmu5kFU24OHrkeRZ4BqqIGKi4dXbq6YML49sXxxOnUb3fbcn?=
 =?us-ascii?Q?nDJyLV3vtws3R/AaKhnjCJ4kcQtxm8mtQE4GUXXPRDsMRILgu3O6VWgSPtId?=
 =?us-ascii?Q?oCXA5olBdy6ZJ/8oH6Cknrpz7WJ5FZidobZBzlSZLC4G7VhLpoGE48+wcoAZ?=
 =?us-ascii?Q?tsPKs4esuVQfD8/5ZzY2QAR1TUu0nwZ2kDOxtKiosh8Ys9hZ9nCrdpjvt21J?=
 =?us-ascii?Q?Gz+p9GWYC2W+SUa1VnF9fLQ25hHuHyysH4Q6ZO17wO/Du01RWCC15sRer9bt?=
 =?us-ascii?Q?52RfR/T+7oHyCgYDmJ1+O6sBJImwj3/LzqhzbnOVMqlmyrkOnD6iDWkLyVZK?=
 =?us-ascii?Q?hXO3nwnepFaE0YkZRBaZ6mThy90vXAXk8y9GaV344iYeuqsrlkIUF6uXkIZ+?=
 =?us-ascii?Q?6etwKyfnf6msJ15NsBjHGQDFSUr+Ri+KpR2fYGggTQMRfeuv1FeCT/aE3Olu?=
 =?us-ascii?Q?4gjbEqJEXRIQyjLuHa69PWDWYOamlba7poyZr4iW2cMFCzsali8vAxEyzRTI?=
 =?us-ascii?Q?qbeON6U7EyNL/lh3yMrPDrbaK5m5EHio6noY3jTWi+K0Kd2XjhJdRYYTkqvt?=
 =?us-ascii?Q?92oJAIaOtWPDgfVCaa82W/9Jei5+j5r51c4VpG+CIkhKaBXMxHfj1F8yRugY?=
 =?us-ascii?Q?IwUmxi8pi/rFWvB/j++GPHy/vAyf7UEpAh72566ZKPpjrvFl5XHHPravhIof?=
 =?us-ascii?Q?e1e//Aaz9Vacefxb8md4mWcO6PkxzArgG0pbZ/uqDug/pOZQJq5TX6m4GAIS?=
 =?us-ascii?Q?qjDKUWkQKqCHy76CEv1u+OrsBjh0JoxIXEemQVAmf6bx0SYfVXeCBjbmK3+e?=
 =?us-ascii?Q?PieW43L+xkWhM5vu/jt/Qub+/nzzMSy6BfEisgAIpZG7XUEjuxCtTZosEmKU?=
 =?us-ascii?Q?hAxs6FU3TTMN6gwT7uDvUaClJOanYdFiuLbA8HypNWfGwIyRti0QqJth1alE?=
 =?us-ascii?Q?hfC54UMRGetVuJ/+n7BXSzS9//43Y/ESwpdU+dDqLdUojxIo9V/6DNnrE8cU?=
 =?us-ascii?Q?gm2DFSbHu00lTBi5yFh8N/kNh2VzDwGEIIDQHSoy?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8062099e-f383-4a6f-d18b-08da557ec371
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 01:13:36.0852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utKCscaGzOSMvxSJL+2pWADF0ZqSO6fHQ71/VQUZuX6aTWtdMfkcMpK8w6VtdWHaM9Em1KiypEvSBMkuFkVOmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5433
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Jun 23, 2022 at 06:05:27PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 22, 2022 at 10:53:07PM -0500, Jeff LaBundy wrote:
> > The vendor has redacted the RF filter enable control; remove it from
> 
> Did you mean "retracted" by chance?

I did mean redact, as in 'to censor,' as the field has since been
marked reserved in the datasheet since silicon was released.

That being said, I'm happy to re-spin with this stated explicitly
in case of poor word choice on my part.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
