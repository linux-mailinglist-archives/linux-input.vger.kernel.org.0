Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98E95B4344
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 02:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiIJABM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Sep 2022 20:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiIJABK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Sep 2022 20:01:10 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40ACB8A77;
        Fri,  9 Sep 2022 17:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuA1kTIZGZtps8kG2omGeZgDN77k3RKGDe5V80wcMyK9cHFVWLkx6auEytNz62pb7jE4xKSj7oWX4IDI9TeQBQU2HHnP3WnRBe79MUUvMq3EYdysgYtI70XixNl60HeXZ262DUoy/ZTcodpWdzU3vV1jx7Y9HT1e7w092jqaH+8D0ppM96Sp7wYfJLlV3uYIfd67P5wi63Ieo34u5aneGLTHT01Pl8ozhbXpxRRyEtsmJO5DTLKTgIhHFfnc7Pj90HaTItjpnhp2qCkdFHzRryzB7kDZZyjon7Ej3NlksICJc0DWf0v+6ZnEMa4pTK2vIQgAg0y9G1BH+UU+LYYA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oqjc4iGLurU7cWQRTenmCVRArp5mU4fUh3lSDKMIG4o=;
 b=XneSaGk8ouonC8oy2hj+EqKlicfZhKUtQP9nGbFG1hjCCGdo32qY+NF7/G1QReBqnMsLPlvCOmru2QZ4kzDee59EJtlbAEtXs3yfCmNw4Pzx1Y1xRgOZhxBF/z4jQoc1tf7napQ05NVkjFhyyCsS7v9yKmdmAZPaP4xz32eRkk61OXs6BnEr3oU6+ogD+hrsigrU5QoW+P6nUXI6wApEFoQQxLwIKx+pEFsmIS0/h/1TqfqrKQF++BJStT7Q2aL3XwOssES0Qd14my6sdDL89NP8UymByo5NHsb5igti2y4QGfITD07Sp4bmd9vmnHPxKeAoaK+9LGb7OMTIui4Ayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oqjc4iGLurU7cWQRTenmCVRArp5mU4fUh3lSDKMIG4o=;
 b=FBtULb5pg4/FnHPal4hYLx9FG79/nwV+4vVvHQAsP57CsAUYmO6vmi6WZlf6l2YWy47+cOfPwqc4iFtWDHZ8WOXnGslncMI/aDpeQ5amTozG9h95foajFo1zakiQXzXBtY+vY7IopkcArxDGIU9WrWrZZrPacssB+HIMs8YwuY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB5164.namprd08.prod.outlook.com
 (2603:10b6:5:49::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Sat, 10 Sep
 2022 00:01:03 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee%6]) with mapi id 15.20.5612.020; Sat, 10 Sep 2022
 00:01:01 +0000
Date:   Fri, 9 Sep 2022 19:00:53 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/11] Input: iqs7222 - drop unused device node references
Message-ID: <YxvTtW/NkQQ7aGNF@nixie71>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-2-jeff@labundy.com>
 <Yxpb4QdZej4QnZlo@google.com>
 <20220909020355.GA3306@nixie71>
 <YxrDJYOsllUDqiod@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxrDJYOsllUDqiod@google.com>
X-ClientProxiedBy: SN7PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:806:f2::27) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 53402eff-c945-4b1b-9739-08da92bf8bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQbg2E68D52FuMFqWtv02IsnhQR39OmSZzIyqkT9xYWB9gg/YlJksxh3nqvKxbJdnoBiBwGuooXkIWbpEJHOBxu56JoLbEc5xdEbjYv6a0Y5mtEYG/hjVHFRsAMbDpuLzlohydvlL9XMKnlsYsUREOiV6Zpa+ZmrKpPBf89O78hQkcviFu2ObKCX5l48U4sZJfoaix3IWsLdlxlJWhZhdgoi6WBAwGOj1jLY+IPRkWyqwZbtmIi9zC5OtSHoKFvBGMnIxGcOQ7N17Nk6KKmaRZGWVveAGe7L0uxklPc1Tqbr1rs0gZ5P9njB7HSkMyjHAIya+9JB67HWxHQL6WQaxJWOM1swfBoLO/WRLNyozNILjvhKT28uyWPBquOAX0CyeM6wXQCymLqj116J2mAfPtP4X8PbRBgp2mrBvhYkRyDiJPZ6GknTTejuFXRBJckGH+MDh8JQWqlrnL0d24yAqT2L2njMl82dIJY4UMhEdh7R1FVWgUhbYBNR9zPwhI8mM9tAIiM1operhxwOkkuqJ34hsLa7TW0fJ9M2ADU4Je2VCd3IjnICRVeqo0HFpizcig73s9dTlzGPmYsG5lBjM4jZlPp9hd+udDGBKgqVCL/Sdi4Dv+Hi2Y9Fqm6m/gPOuU61+s5RpuwmYDz5bqX0ioytEhSX1yxpy80Oz3TK9cWgXP+eG6e2FDwfm3p5WCYwHX2EMpdKODLvBDc8R2fFaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(136003)(366004)(39830400003)(376002)(396003)(6512007)(26005)(6506007)(41300700001)(478600001)(9686003)(6486002)(6666004)(186003)(8936002)(5660300002)(2906002)(316002)(33716001)(6916009)(66476007)(66946007)(4326008)(8676002)(66556008)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DkeBWgDt0yTHs6FusEmaNF0OtEuHmoXok8niTcroBnIfwHySz5okDt0yqt8R?=
 =?us-ascii?Q?vxjUNb0xdtKGvarH5sKVzaFR8pE4Yr5S+2nGJYrQiWqPt3stjuw3ifZMIT4y?=
 =?us-ascii?Q?wt7hIlXxGsB+ldpPm5sDxQ66N4LE6NOn60keckkqJeP+Ir7qTYEkvJUN5nF+?=
 =?us-ascii?Q?owNo3YlErm81O6YuiYa6IPTq/8yKaOtNX7tCgQ9mVx9kmS+2hlgDKj+RaNdl?=
 =?us-ascii?Q?Swac75z9DnHa+dr96nLnAMyHnog6GVOxZM7qVNPhVsATaa8qh3/QPf1jJPeU?=
 =?us-ascii?Q?7IkMg7ZLEsNT8+kwv0XwRUKsmJHQODWgOGPGw13CoWcZdyprtDf3alH2ySvC?=
 =?us-ascii?Q?58HLjfkSYUpyrYYe8xvqPOt9IeRiebKmXkdovjWeXPMHNfOKEp3S1cTpj7ll?=
 =?us-ascii?Q?v+nf7T8Y7OsmuesIXQW/EPT/QQyL8XMZDmwKG7LwZuhX88wLC9/y4FlUGE6Z?=
 =?us-ascii?Q?jgzpaWB73X0Cxyzr1Ue36fpyHtgfpYnkjn3nYBdwlnAWp6g1usptejTqIURt?=
 =?us-ascii?Q?oEzdxf1mfSZQX+8E0seabYNoqDzGpN9zP1BdA6QvAvfereiD0tq254k2g6Ym?=
 =?us-ascii?Q?sPzWKpUaAncRt/lZL4YugPpzz6DtFnw/WixYc4RMmNHhPJk82FybyxEyr7dt?=
 =?us-ascii?Q?X+i9I/nO3YYAuc2zhMHUEZc7X7m3M/f4QQH2gCKUGBhvKPenE3q6UK8t7cPi?=
 =?us-ascii?Q?fQNo/mn4hqvaMQzX4JrpAoEidMERd+SmfZtH1IjwUx2aOKh+nhulRB1ViRJU?=
 =?us-ascii?Q?q4KVnQBbHM9psf743MENSAmOgKkj2lpSpdCYyomfrTgLXaYmbgWWsHjLd+eC?=
 =?us-ascii?Q?oEWQYEkDl1L1MXv9jwtF40tQ5BROrWJXSy3M4MT4qFi6DpylamaCoZYgPwze?=
 =?us-ascii?Q?Sk3KL/ZuszlNEyndBDwoER2JeuF6xqTs77ouckHRLM7OQqhDXwL7k1nmPaMf?=
 =?us-ascii?Q?VxQH++Nwq0+jCb2fMXRMs8gqiCswr7+Vz0XIc3r966lLxuVAh7y5eEVFg27n?=
 =?us-ascii?Q?SBlhwj1GNFceeFTDS6At0WbIuDRtiLN1M9BcjfBIcd5nkINGntps01ZKKya3?=
 =?us-ascii?Q?6DKSL3IoQCuge6nrcMo78F9nqE60z1hD28Rn++yb1ZfdXV8AOmTGvCXeC2ch?=
 =?us-ascii?Q?3B5DDiuyzXtS65bd/S7/Pj6QJMPWMf47qQjgMow5L5b3H4T24Vw7ZjvKGrK5?=
 =?us-ascii?Q?z59IwrDl+HqqRX0BLwECRS/ttACyPC8jY49cn3RXD+Hv5VaMgPqKlNP9wFPc?=
 =?us-ascii?Q?pDTo9eleJQDadmc3ZtMv0pJaf/mGWGO7qeI2vxylBDtvNuAOWeEPVLtfRs5Q?=
 =?us-ascii?Q?n9nZf1Amazbj5mHxTaGLUk6Fi3H6kylMrp3RH+nfgcNUAQzgZuEEeL2tRzHV?=
 =?us-ascii?Q?kNLBOxPjyxZLUL7NcAUyVkVm+gsn+ztWiT4oLsQISiljMJfo7Egi5gC0dB6N?=
 =?us-ascii?Q?rmn+WiAKRnq2IGZu1UpEJ4fz4aiOwFTk+LdmSP2yP6U8SHubdmTXH2cffpnh?=
 =?us-ascii?Q?PqbINkLBGyIEr1FFOTN2gkbwdDR/SOJBgw6X8xSL+OC0wMSekSfDn8HnLeil?=
 =?us-ascii?Q?A6B4HX/+SvzZpejzzKd76zQwfGyOFlisK/v9gD6m?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53402eff-c945-4b1b-9739-08da92bf8bce
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2022 00:01:01.5514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMmbJj3+Cc38hc0oDMyP+0/ziXAA4nlsBvaQA8hRyPimFf510Js6jDkvV+muxJvR+d48/asYvivC6Z20LyjlTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5164
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Sep 08, 2022 at 09:37:57PM -0700, Dmitry Torokhov wrote:
> On Thu, Sep 08, 2022 at 09:04:06PM -0500, Jeff LaBundy wrote:
> > Hi Dmitry,
> > 
> > Thank you for taking a look.
> > 
> > On Thu, Sep 08, 2022 at 02:17:21PM -0700, Dmitry Torokhov wrote:
> > > On Thu, Sep 08, 2022 at 08:15:38AM -0500, Jeff LaBundy wrote:
> > > > Each call to device/fwnode_get_named_child_node() must be matched
> > > > with a call to fwnode_handle_put() once the corresponding node is
> > > > no longer in use. This ensures a reference count remains balanced
> > > > in the case of dynamic device tree support.
> > > > 
> > > > Currently, the driver never calls fwnode_handle_put(). This patch
> > > > adds the missing calls.
> > > 
> > > Hmm, dev_fwnode() however does not do that, which means that
> > > iqs7222_parse_props() has different refounting, depending on what is
> > > being fetched. I think we need to start there.
> > 
> > Right, but none of the callers that prompt iqs7222_parse_props() to
> > use dev_fwnode() follow with fwnode_handle_put().
> 
> I think this is a problem that code has to be aware of that and behave
> differently. I'd recommend bumping up refcount in dev_fwnode() path so
> that all callers would behave uniformly. 

Agreed, right now the problem is that not all callers have a node to
put. So, I think the solution is to more thoughtfully encapsulate all
of this such that the caller is always responsible for passing a node,
iqs7222_parse_props() bumps the refcount of whatever it is fetching,
and the caller is always responsible for dropping the node.

This way, callers of iqs7222_parse_props() need not be burdened with
what it chooses to do under the hood.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
