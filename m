Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA385048E7
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 20:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234767AbiDQSbl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 14:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbiDQSbk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 14:31:40 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2045.outbound.protection.outlook.com [40.107.95.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F22D19C30
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 11:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFM22CkJOib0G+MGg2oqe358+sBHMBBdCqFvp9fblZjGUcYfJmwefn0NkIKpbLvbPyerRvKy+ArhCbCS6txL353CxnUEeKACzyD9mV5hzPXN+sdKNRpZOfrgNUX5RZ5VVQSVbUsD+74t0oe0Zsd3b4TYjGaNt+6r6DS8Rd2DOj0H6NuiCTI9Ncb4R+vj3TQbYQfBj42A/US2En2Esv0+Lm3cjh+Eh3K5apFluRQuakc1KnOhJfwu5Ajn9XE/aqlPGRF44KkMxRbbcurjaEo/VhwjHYUjZCApz+qhCuBwcVjaIcL8iJ0Eg4Aq+t5s6H1+SwtKnQfKEM9O9fb4rKhCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ9rBga0xr30APNQjqD87M+rjCw4Qvrq+JIGhRdJQdY=;
 b=N3Ez6mZzqRfeJMorpFaYOeOdE/TpKZ4hhVtiOWXMh9H53bNjxi5zQexJKAvjCA5AKY9+xBpTUS9fWhu6U0rj6GXbxJgeMQkUbkGXaJE51ObOezVwzXw0ToZ+bDbd0T168rdjXpkLGSdHQ/+wNQCk/4aMmMim3eq47Nh4MTvtPU+J52m50gTGB4XokgL4jrfsv6NslGEae6qhXUYnIAvmkwFJGxZu2F+6t5mOzeH6WIZgExjpwgMlKKo7/c6zAn5Kl17E8MTdgMucaOQ72JGjQ5mQtuj9w6AE6I1LYGlSu2L2LLWXsj9vjxzPIytSF1yUzax2rwDU/nx5fBZToZD2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ9rBga0xr30APNQjqD87M+rjCw4Qvrq+JIGhRdJQdY=;
 b=hKVP9naHPrxbJIB3wNAzLUXCKe9GSGrA2gzRMy83NaHZr2jGkBaVU8q9lyGLEJECq7mMUzYIL5yLhPb03nZ0ircLI8h1A+31OY0tfYR1aXV8juV7V7uUp1HZTtVeBSZR133/WoPsCDrN7ESn28mRQifBpRoAF8ACWoqB5AhiSAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by SA2PR08MB6539.namprd08.prod.outlook.com (2603:10b6:806:116::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Sun, 17 Apr
 2022 18:29:02 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408%5]) with mapi id 15.20.5164.025; Sun, 17 Apr 2022
 18:29:01 +0000
Date:   Sun, 17 Apr 2022 13:28:55 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] Input: add support for Azoteq IQS7222A/B/C
Message-ID: <20220417182855.GA4789@nixie71>
References: <20220412075937.GA8684@kili>
 <20220412080123.GN12805@kadam>
 <20220412092251.GA10886@nixie71>
 <20220412093039.GO12805@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412093039.GO12805@kadam>
X-ClientProxiedBy: SN7PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:806:f3::21) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1b996e-9f70-4643-d65e-08da20a024f2
X-MS-TrafficTypeDiagnostic: SA2PR08MB6539:EE_
X-Microsoft-Antispam-PRVS: <SA2PR08MB6539AE50BF38E88CCFAAAC30D3F09@SA2PR08MB6539.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7clm/YGzNNA8MfHL5+RxdrQcNcvzBrU7e7o4zpgVckjeEbSZD2tIdHQs62o0cAChm6sW10K7Rs878AlXOUQjcjRU1XN4JjAF+/Ra/Bb4vxM4xn9XkWS7NZKQDuTnFlA85t4CsAFoZXTYk39pmmZO4PdhPg29TN5/cVpmav43Fk0gf/z90zWmd0uUqPIDKaw//GajwZfC4hjgZbdAGMuLa9cLX2hhjS95mZofmZqojezumStvbIwlu0BQk0UckigRFkfs/jTAp3k3DBTB+J+pIsbW8M1TJAFCjsg1MBiYzVkr0RjOO7IXTRgagpmozyT15BheQmb3g1drXpJWQjKN9WJimHECrd2P+3StUAXLmGnGHVHRMfenvSomNicjreLVgIqHBpXnGgs+gvizS4ymAbdKSfjEQqV/jObTJDE+Sr7/IqARB1VCnV0NVFPawM1MmrQ6AVQzIXrH9j8WvUkj8GY4jQmjEScuKeyKAdIV9d0R+24EuovaZ2pe1Ff+aFgEGWCi+Zoow4KGM7fFS15wwFsytni+jl5f1npUMWGQsHN37ntUFhB0VHMZ6kYkaW4ydGJIPGV0FduLpTmi7mgb4mDEosw/KP3M4W/qfS6NFDHbXYojUOleSfPwQ5yWLMDJJsmvPCHeVy9LjRr0GQOdHb6qZLLyTZaG5bWkVDsYipZv3ki6YtUw8vMMyMJQbxnkIkZd5lzMEN3IiA8IriLoLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(396003)(346002)(136003)(376002)(366004)(39830400003)(5660300002)(6916009)(86362001)(83380400001)(6666004)(1076003)(186003)(26005)(316002)(6486002)(38350700002)(38100700002)(66946007)(8676002)(66476007)(66556008)(33656002)(4326008)(33716001)(508600001)(8936002)(6506007)(52116002)(9686003)(2906002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MbFrLWPJm6nr+mcxtaqlouMMRd5skjex1hNbDFtgORgEhvtZkzfhsmfhhBdH?=
 =?us-ascii?Q?HawpsifpjjhzYl9Sa18s0DEin5iPI8XCudNjGz9y0jBapJlHNoXnmtPwqQR6?=
 =?us-ascii?Q?QuoBs7kPsdyXqcNNtsNfwLZk5lzHHEzqkA9lbgO3rjUmfuFZwl+D/LlSQBQc?=
 =?us-ascii?Q?uWrKXppsY8gwnAeIKr+5KL4ggvKXUhv/pcPEC7MKHTAXq77W/2WthcHawD74?=
 =?us-ascii?Q?1wWRY2awu22yzD2JhLivMs7H7Y971nwxfV/XDtwWIyne/7ZEfh5U3yABo/Y0?=
 =?us-ascii?Q?ygIOsE4HzuAZ0sD0VXb/KWlubyhfq43KMqJKp9uteBt6bi8hvziNAuR2Jxo9?=
 =?us-ascii?Q?+L7u9qRrF5ePZSouqPCC4noVtg6rjGtLqkqVRG6tr5Qay7IEmepBfpCDlGny?=
 =?us-ascii?Q?9TAMMFozUbt60t2c8XZV909u6yf8pD+sRCIrmDnjmA4iYU5GXMFm0LJL/A9J?=
 =?us-ascii?Q?vV5Qn8nmvCy6UGtizNkIJiGt7xqKcR6qIAQiuEP9Da0M9Szje2CKTvYQupkt?=
 =?us-ascii?Q?C0cTouRtOQZUr4Y90nF0O5xm+vmy+ASYkonNeOLYZgz0I7KL2NtKtP6z8GX9?=
 =?us-ascii?Q?Zenavlv4Ya/ZGDfbpome+eII/7vGHfff7E1OZujuJEmsTPjKm6CVR1K89QD3?=
 =?us-ascii?Q?S2tsWVHXOMqN/HdRm5n8E5P+jObDug6+yehpPTknJSi/oumxiYlkzK0Q/dtA?=
 =?us-ascii?Q?Ly6bK7Zjf2YCRbSBMFVm36QdUIuOQUVWCgFSFCzAQIHY/BBf2C9F3hvvuIs3?=
 =?us-ascii?Q?1EtFTpvz7wQMfFxpFqIqRmx3ifyzMl23xSu3khtDsEP60X1BMygBZuzkt4yL?=
 =?us-ascii?Q?soppHc04Se9rZDLYx0Q7EeAq57EPui8k4FbeKpmwSh9W+2h5zW1QPvt8PJ53?=
 =?us-ascii?Q?NlJ0X1ToQdB/utH0RGcBAJE6kUm305bHtFuMMO9oXLEDk7CqNrcCgaB6QbVC?=
 =?us-ascii?Q?onvA/jLgBQ5DTVUMNOYqixqYUzlPdgoldmCQZlHqesJSSJSuUOLMJtrChfR7?=
 =?us-ascii?Q?b9sXlO8kXOPvZdGdxYgStpLi19JCKiZ23fBJ4DdFjbb4bA8Cfcj9nW9cchXF?=
 =?us-ascii?Q?X3fORFouEV/KMltaef8F4mvm+EYDb4G8VIqzojfwohs4vJraKJxJNcMwoXgE?=
 =?us-ascii?Q?WtwqYzyusaYQPJvDq+E7wHNueW/9k4aD1A5qqW7OD14R+Jw1+M1olMF/MJ93?=
 =?us-ascii?Q?UB4VtXUcQq2TtvXp34QdLyWa0c0FnDZWxSJec7H4d6dQ4b4zUYESjaxtEkcd?=
 =?us-ascii?Q?e/KKo9ECqQn5GkB4cashiQV0Mx3G4DfU9DoQ6F+N6XELm+O7Ac+OvW25cEZ2?=
 =?us-ascii?Q?hPtUbHoQj2j2YrPt3uLsXTq1JgYRUKcSsVCLFD9MJaBo0y/e9TcAClCSgwg9?=
 =?us-ascii?Q?+L1Y51SzWePclMHL/pbmx/iyZfN2QaBsdS9APpfPnwIjSZmkQXHIYzfn4wdK?=
 =?us-ascii?Q?kxanU3uVIdOjqNoikufG/cqLR4FmFJmtvsBDGlS41IUUpDGnAUILcLaGILSS?=
 =?us-ascii?Q?c3KmQPi8yuNgKc1Z0fAfKAp4nBtE6ZES+joU9fB/wMOtn/tiBdopldPGu7HN?=
 =?us-ascii?Q?7l7eUt54fnv3Y5+AbVdJwlLUBXSpNQ1cEaKOs/41VB7VGj2FDD4wKzUcVWq9?=
 =?us-ascii?Q?20PgDTxJGQkL74PqLBfGs9llB+pmCN/uDtVkTCcKUY8wtWbsx1UapJ8gMZW8?=
 =?us-ascii?Q?zCTMSLrAV7VHm8IorQOQsVkrewIHGB8IwLnZU3QnYsHxLkINOuOJXOg/2vba?=
 =?us-ascii?Q?5c2FdBDDmQ=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1b996e-9f70-4643-d65e-08da20a024f2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2022 18:29:01.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZomYHsbC+B+OaHaJ3+ZSBEybKaPgekLIj+wJV93/zBhYvHS03yI1960hI4e4KZKt94NNwCtCoj9rPrI/4+mrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6539
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dan,

On Tue, Apr 12, 2022 at 12:30:39PM +0300, Dan Carpenter wrote:
> On Tue, Apr 12, 2022 at 04:22:51AM -0500, Jeff LaBundy wrote:
> > Hi Dan,
> > 
> > Thank you for reaching out.
> > 
> > On Tue, Apr 12, 2022 at 11:01:23AM +0300, Dan Carpenter wrote:
> > > There are a couple other warnings as well:
> > > 
> > > drivers/input/misc/iqs7222.c:2214 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()
> > > drivers/input/misc/iqs7222.c:2234 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()
> > 
> > All three of these code paths are tested and do not lead to a crash; I
> > am suspicious that the warnings are false positives.
> > 
> 
> Are we looking at the same code.  I am looking at linux-next.  To me it
> looks like the checker is obviously correct.

Please accept my apology for the delayed response as well as the
confusion from my side. Not surprisingly, both you and the tool
are correct on all counts.

> 
>   1530        static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
>   1531                                       struct fwnode_handle **child_node,
>                                                                   ^^^^^^^^^^^^
> child_node is NULL
> 
>   1532                                       int child_index,
>   1533                                       enum iqs7222_reg_grp_id reg_grp,
>   1534                                       enum iqs7222_reg_key_id reg_key)
>   1535        {
>   1536                u16 *setup = iqs7222_setup(iqs7222, reg_grp, child_index);
>   1537                struct fwnode_handle *reg_grp_node = *child_node;
>                                                            ^
> Boom.  Dead.  What have I missed?

This line was left over from some early development, and I simply
missed it. The code is working on real hardware, so I imagine the
compiler has simply optimized this out in favor of the subsequent
reassignment.

> 
>   1538                struct i2c_client *client = iqs7222->client;
>   1539                char reg_grp_name[16];
>   1540                int i;
>   1541
> 
> regards,
> dan carpenter

This is an easy fix and I will send out a patch shortly. Thank you
for digging into this with me.

Kind regards,
Jeff LaBundy
