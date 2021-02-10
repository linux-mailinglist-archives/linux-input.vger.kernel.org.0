Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55AB6315DC1
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 04:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhBJDNo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 22:13:44 -0500
Received: from mail-mw2nam10on2089.outbound.protection.outlook.com ([40.107.94.89]:24892
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229703AbhBJDNm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 22:13:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZnu3V1h4v9E8khQghNn83i/0uF+LZJqEYm0mqt/t/gsP2WQhOVbL7FlIvDYDDkSAs3EZX0pGrIi97QyEIZTjqEIkIrcDzyy6ACf7L9YDJocR0MUmLMhjAOfUQSNwt2Jkmim0LenKyve3H90QQx7CU+ublmy8nl0jrQhfX+EVWXGr6n1zWfhKPe4nDVhkraa38Rh4lWDBL5g9GWUltiGuiFOfonOEs56uakaXjBsZw5ChoDeYP6qXe27LZ3JyrZbfLDmXTgVka3T3UENSbyzOVR0naT5PPsHBXSBAuWef1Qq4otmB37JqCddKdq40TluTmdMb1uajp0GKFvbq+oscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7dgdIT/ze/VlPdhE7nk4i9b6eM3cJkvlTFgQ0yElzk=;
 b=S4R1JGTdqqrXpZoLnlxUV8tNR00jh2Gh94iXRK3bBYdY+USB1JMloCq1c1Z2FBhZn1p+uRRLTzCAlXYDJ16ThZkd2p6LGjp9UfeQ/oQPH3boeuk+JRCqhQXVIUoHKWdDBbOfelCVgf+IzddMrpY8Dbctrv2H9OaFk6/qQa8Ljb+Cu6mzQ09JbzSIcAXSsoqsVYyQUruejlWHMq4zJzUu+zI881lQHp7ILu3r5fVTIqGWgFc6Mm137OlO0ekcb4wWH02BdUN1Nzj9VPXK9wJUBtog4iWtnl4T0Tth9/9NT0EoEbbsPcADO4A0iT/pnV7sXwF3qNF4IPUXFXFQxqkyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7dgdIT/ze/VlPdhE7nk4i9b6eM3cJkvlTFgQ0yElzk=;
 b=KvSNJffnuiu35ZJqEOQw2aUu8Nl6vsK9g9jGwkrMlYxPWIsvP0dw6W4MFSqlhOTDtlABT9aCmBvJpVsu7DAuRKmGiyZBCmnMQ3v1b2fzuHycl7DgJ2h+AtUX6MHrB8kw8NHUB+/8EJ7N1e+7y3tdVd9/YOhs77vX9LuRqoa7eNE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB7247.namprd08.prod.outlook.com (2603:10b6:806:187::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Wed, 10 Feb
 2021 03:12:49 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.019; Wed, 10 Feb 2021
 03:12:49 +0000
Date:   Tue, 9 Feb 2021 21:12:46 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: input: touchscreen: Move helper
 bindings to core
Message-ID: <20210210031246.GB10151@labundy.com>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
 <1611459776-23265-4-git-send-email-jeff@labundy.com>
 <20210209162740.GA3874323@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209162740.GA3874323@robh.at.kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN7PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:806:120::21) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SN7PR04CA0046.namprd04.prod.outlook.com (2603:10b6:806:120::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Wed, 10 Feb 2021 03:12:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0515b82b-5a15-42d6-3745-08d8cd71bed0
X-MS-TrafficTypeDiagnostic: SA1PR08MB7247:
X-Microsoft-Antispam-PRVS: <SA1PR08MB7247ADD96E12B16EEDFFD3ECD38D9@SA1PR08MB7247.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ck9YHGqG4AtpL2jPEJMa0SDMtJmN5XBrMstBMSREZ73yREaLmGkIVTNpZy4h2848ZK/OG/fvmNhDpotH84wi6sQvvf0HDhMbkI2/TU/ObLGMpx/uC+RYSKZgCrxH2/wIQHaFFzFow1mNB+YHNq2tebHJkoNqD84kxZFrNDs1JwZXTn+yiObuia8fIO5g8c7GOPrJUV+gUeqsWsrp8xJc3iob0teqeM3PbEE2oBIog4p4G+SEhUc8QVWraAb4t6LSxj4n7CiY2U1F5RqH+kjCeLcUQ3DFcCRTog+Msm+oiPNbs1TEQW3uwSwhfzsge1RETDby9IX8pf0g3hEhzlfIdcqS4V2peFlWxuQOQsj88BVpsDVZeuhpPZ0MWJ3UEtdGUc2JlOW3OxRX4cE6UReRzaV1ntNAgzmkqatfojL0dPb5/uWO7m9cLQPHt+lcn0xYR7A3VAN/qKYTHnKpXdr9MoHrEov8akKKRa8zxk2aqsCYYiHWW7eaRWBMdcU2GnHC608WK6X3zskB57gLm1ga5+4teq6/tcRMdtrgtyKEvvgGZPqU+vUIalyKUz5r/RodiE7vVhgiqFOh74unQCNlCMgEEPVFJ9W0el7C/5HEaaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39830400003)(136003)(366004)(7696005)(83380400001)(6916009)(8886007)(2906002)(52116002)(2616005)(956004)(33656002)(966005)(86362001)(8676002)(55016002)(5660300002)(8936002)(1076003)(36756003)(316002)(66476007)(26005)(186003)(66556008)(16526019)(66946007)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?voxzbTNfzBezqE6FR8Qy0Uv6BXJqZtiRzABOeYf6gdcb8EOGzT1m1gF6WFWr?=
 =?us-ascii?Q?Ski12g1uVszs0qg+H9gI9Uf4/2bzGgy/qxaK/acOy6c7p60agw+nXn2JBayw?=
 =?us-ascii?Q?kdkPg05ODOBB3Lk5Rj3LBhQyuAVnAY2sEy+3ShcdZVpAkDtggNcpjjHy4wIJ?=
 =?us-ascii?Q?VTcWxagf1D8O7A/TmKorllFEqvWFiFP1BKYqFYcCDePL0fUgRxaUoy21zSqp?=
 =?us-ascii?Q?ds2yvpTErQ+O8g65gDjREVQMRJZKpH7dzhEZ0uLhEDcBo3qYyVekaCYgDzA2?=
 =?us-ascii?Q?5VKSLZDz293zE6XANmR6KKhJr6diH98nQhBAqIpIGwSwJEtRnkYX3uWieJPI?=
 =?us-ascii?Q?aWIKbX307MWow92Xb25Vxrv8IhYPSrTV/gsNh+Ql+7bNv1RuZO/sqh00p9iN?=
 =?us-ascii?Q?91k3XjZ5n/Kc326C4/JRw4f5qUre7KjxBhohiTMgftN+L4HS7pT0lfkziLtW?=
 =?us-ascii?Q?bffzeaso/XBFLpJwxwNxEC3oLHKD74mhHglLIFuNnT1ZTRwjdpmQqzWvpz/L?=
 =?us-ascii?Q?5lDeU9FlFylWQCfshpz87cHZw0Q8a+8mJGgf9vKTlGW8MZUcCjRqEo0StZy5?=
 =?us-ascii?Q?RvnVZyUofeCGHGudNs5t6Vp/SNa9EyD3sxqRvi1qiKkHreRtFj39M6Tk/ycK?=
 =?us-ascii?Q?i7Vf3dhEGHPSpMMqcd0HBfd0QUKmcna1Umey4KJsr/1Pgl/GOvejGV3XPeY1?=
 =?us-ascii?Q?TeSzabJvPTzrURTJTJ2Rk8B3hAqh8VWiSzMomOotlXJ38dizxY+9d7Pgv59j?=
 =?us-ascii?Q?xJhwCtw31UeHRBs7fIB6ZlgkrvZt35r7Hstpvz7uvHyiCYOhN1Gvjmvl7+tJ?=
 =?us-ascii?Q?puu7rYqJA2JPZIBo1PFc9eb9Q0mUl9bvugralpkR8RWhOcif/ps5nF5y3aWN?=
 =?us-ascii?Q?hcljI6nt9X7fyDzU06qx4a740C37B+YunH2IN9EXOnVuUt7rRyQusYOGrL8z?=
 =?us-ascii?Q?yverkFcu/gvnuA3XGyrV37Iy6F8TDR5Y52mRx2m46cO9RgOHCwDKBVu3aZcM?=
 =?us-ascii?Q?O7NCR4D7SBsfq0lbg93vTfADsSo1P+Ybr9tMXk6e/4BJIHCywSRF1YGJvwSL?=
 =?us-ascii?Q?B2LM84ZVlRT1M4x9ums6uQEAsra9WZpBnHWOY7J6BBA1IqcXAi/P/D+4DpWj?=
 =?us-ascii?Q?+tw9LERrMiMWijacIagADVLYcC6p/oR+3FJWR8W7MIq6hKKhed0JN2xrxxDO?=
 =?us-ascii?Q?Vslld2ulShUn42FZEKzavCP5KJXlPTsHtiNw9O1I7hzrCzNI80WL6WAHMguq?=
 =?us-ascii?Q?ITQ4G8cxenIxxzrx72Y0A4F6EnrLOIB02aSHPm642tBHRI4eBMMc9InL63o+?=
 =?us-ascii?Q?8FWKXG7h5wEkQ+yVY4u0aaaK?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0515b82b-5a15-42d6-3745-08d8cd71bed0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 03:12:49.0729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz2R62pJ1X+WjA1trSSbbyLPcs7BkGnCRruyahUPujVya0QmqNmFessHOqxcvEX77UG/AtXtmq1fDuy4iiIwBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7247
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

Thank you for taking a look at the series.

On Tue, Feb 09, 2021 at 10:27:40AM -0600, Rob Herring wrote:
> On Sat, Jan 23, 2021 at 09:42:54PM -0600, Jeff LaBundy wrote:
> > With the helper functions moving to /drivers/input/ following the
> > discussion in [1], touchscreen.yaml and touchscreen.txt are moved
> > one level up as well to maintain a consistent directory structure.
> > 
> > No changes are made to either file except to update the $id field
> > in touchscreen.yaml to reflect the new path. The handful of .yaml
> > bindings that reference the original relative path are updated as
> > well.
> > 
> > Last but not least, the handful of .txt bindings that included an
> > absolute path to touchscreen.txt are updated too.
> > 
> > [1] https://patchwork.kernel.org/patch/11924029/
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> > Changes in v2:
> >  - Added this patch to the series
> > 
> >  .../devicetree/bindings/input/elan_i2c.txt         |  2 +-
> >  .../devicetree/bindings/input/touchscreen.txt      |  1 +
> >  .../devicetree/bindings/input/touchscreen.yaml     | 83 ++++++++++++++++++++++
> >  .../bindings/input/touchscreen/ads7846.txt         |  2 +-
> >  .../bindings/input/touchscreen/bu21013.txt         |  2 +-
> >  .../input/touchscreen/cypress,cy8ctma140.yaml      |  2 +-
> >  .../bindings/input/touchscreen/edt-ft5x06.yaml     |  2 +-
> >  .../bindings/input/touchscreen/eeti,exc3000.yaml   |  2 +-
> >  .../input/touchscreen/elan,elants_i2c.yaml         |  2 +-
> >  .../bindings/input/touchscreen/goodix.yaml         |  2 +-
> >  .../bindings/input/touchscreen/iqs5xx.txt          |  2 +-
> >  .../bindings/input/touchscreen/mms114.txt          |  2 +-
> >  .../bindings/input/touchscreen/touchscreen.txt     |  1 -
> >  .../bindings/input/touchscreen/touchscreen.yaml    | 83 ----------------------
> >  14 files changed, 94 insertions(+), 94 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> 
> No, I prefer the current structure. It's easier to find similar types of 
> h/w as-is. In fact, if you wanted to move keyboards/keypads to their own 
> subdir, I'd welcome that.

No problem, I will drop this patch from the series and update the $ref in
patch [4/5] to reference the original touchscreen.yaml.

> 
> Rob

Kind regards,
Jeff LaBundy
