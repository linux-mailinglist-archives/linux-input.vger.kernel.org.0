Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB8D5B2BF0
	for <lists+linux-input@lfdr.de>; Fri,  9 Sep 2022 04:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiIICIT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 22:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiIICIT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 22:08:19 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2075.outbound.protection.outlook.com [40.107.212.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C439B276A;
        Thu,  8 Sep 2022 19:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu0t6nuVxnaaZCCH+pZ4N/e5AOHUmZbAuKliSUvuj3WL0ASzJHRsVoWwLy3c686teyReNYYmNWcedKDl2QKxeG2Yt+cHtr+JKYNd9iUTmWNMnSYlHC23003ZIWYSoRbU4GWLWA0tF3dc0rN1ITTXCla5fdPyZseCg6hNVRvKPFsE630Lmw6Fw3kMGJxfD1XLqfQvoNEaex8aBhpTe5li8FiA6TAz2O+OGz7azYqjE9iBZa109WzadeigXtk4S4WxKde3Q4XYNqG3obZoL50iRVjzJYOsCTFnaFvcb32HVW7xv5CaSoTy4spPNdpsjTXwLw3EYd4utENAdv514I121A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5TgJHHbB7ktPOSDFz5zrJdx4Jj7WhzymTYsNMItPJg=;
 b=eCGsQ4qHsEQ3f4hu/G92Z4sgN8KMw6/+XMJxU+fX8sM706Qkf9U4+HrMuAGef7BhJUk128+pUiXBqbIILwVKhX4EU40ANvaj23wx5Klb2SCmvGZa83LQYQxyvuKiqJO4TIAEDRzcFaMwBMKAkoABMI+SYpSzETn2/ojjni+gJ+YWM07ViGNUxvLLo+6Kd+vPn0OM5U4H+LaXFEBXvRcbSBVYFwp+brT+nQMcLWBPy0aA7kfEtsEdSe9z8DOtLU3GEsNZPDbD0KaXfSzFXeMo9e3CeAREeBr0tgAZ+EmFxOUQp2voKJNUmuW16s+lMcMoNAgtOyCzEs/jYdJJovEWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5TgJHHbB7ktPOSDFz5zrJdx4Jj7WhzymTYsNMItPJg=;
 b=i5zVs8CBlsg1Mtbe3YIaHsdH2eCc2ku0EG2erf+QlyHYfUDp4fXXwUze+sMS4G46yv+Vw3BhRzCOQ87ccyM/yC2MKjl8G3wUupuh94HVf7+tINJafzTK2UThMkg4rqr7R1GJ/wPDd4Rc+O71arZgoRDl4SvT+YYdTUxTqru6faE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4015.namprd08.prod.outlook.com
 (2603:10b6:805:22::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 9 Sep
 2022 02:08:11 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Fri, 9 Sep 2022
 02:08:11 +0000
Date:   Thu, 8 Sep 2022 21:08:09 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] Input: iqs7222 - report malformed properties
Message-ID: <20220909020809.GB3306@nixie71>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-3-jeff@labundy.com>
 <YxpcyY0BAumyaeVR@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxpcyY0BAumyaeVR@google.com>
X-ClientProxiedBy: DS7PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::25) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f226ed74-a010-4ad1-2540-08da920825b2
X-MS-TrafficTypeDiagnostic: SN6PR08MB4015:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJCDxcf28+34dY4KV2k5v/DpTWjAZ9za4pRfD1Jdv9QhTcatxYf4MSW3b8dDKgr1hVLHfqdoqYyJu+F3GYQ2hIVhCQ9UPsyIzISOKLoU3rNn5p1vDDO6gMLpRSJlNsyEh3sBGyFQ4RgQq0Jiim6I9fHtnru7grW9exlzCOGhoSmHXdAIShoJdcI09h0qA1Atzi8B0cPZN8xP+OzLKVSEy5DdQI1U7zjcWvokHv3pTeIv8WFC/kqhAeB44ORl2CNdkeecc7TAHm5ixErNES/x9olqB6eS123GNlfNNmvNBBdhzthXhbU5GDL95aBYSYUBowQGB3K5utrVK/9Y/KLfmNZQiE654AGm0FuFT+g50uOIpih1J9qIpJGG4NoFayP1hM19DgJ0+rNLuiceJGDQQv7bIXBokaUGwKqRrQ+cIGWduV92yPrmXKfZc59jDksEUoUReJj0xPWfCGnaUj5Fyh8dish9sBfhOR2fH8mFmbhDMqM6/lMS96ZqZT8nt1mXmYSGIKGnUlYukSwC6jya5mmT5raCo0QxDVBlJ5uf881OhUzOlMH+1qepWuVKDaZRQKtHRrVS+P0SQiWbAK77Aey01Tj10UaZ/HanaOCLxzxgowyNOg4Hr4pYuSOCw6A0UF84JGJj41ZDEpVbPIuQpdi8SLJAtRi9m35QPy7GevrH4lfOOHM3sLGLrM9fJ12kCQxIvePb+ey9J5fLIHWp7Yzz5y0GiqJbnE/7D4E7ER9CQdCUciKRX08o6zk31JQW8N0hTYs6Kvg9TTSdlncCRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(39830400003)(396003)(376002)(346002)(136003)(33716001)(38350700002)(38100700002)(86362001)(66476007)(4326008)(478600001)(66556008)(66946007)(8676002)(5660300002)(8936002)(41300700001)(52116002)(6486002)(316002)(6916009)(186003)(83380400001)(26005)(33656002)(2906002)(9686003)(6512007)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qvWq26ZQgiCp14kKwls7bevj5zFI6JEuX/vgO/8BcD3+dohKOU+HQ/9rQdK6?=
 =?us-ascii?Q?Prc5nVJYbtONXq6N7Bn9OB7uOd6THqY0f3en1rbPE27eMXbpZEBhhPrPKBug?=
 =?us-ascii?Q?mwHt/X4g7SlgaYx3ghGxmjnumofApCmwEk81Y1ukSL0vel0AQIY5srt7Y6hz?=
 =?us-ascii?Q?zODjAyQvOX1Rcgnrplh9i4dePdktEEfOQFUQ0yPsoHnr+bZ6dIyGc0md0rK/?=
 =?us-ascii?Q?jS5L+akZDPU+fUrpCTIKx5TB/U0Y4dXv6w8K5mPjTsTGXSbmPY74uEQyvUIg?=
 =?us-ascii?Q?PN6XSZijnzX4RJMuF/pqN6w4Oa6My04ICqwCrImm4/jY0XdVhkG7G0Q/6sHt?=
 =?us-ascii?Q?QV8uW9D+QumsUyCucTxf9JMKICSxUYt/AhAids4Tm995q8WIwy8Re+TjVIgM?=
 =?us-ascii?Q?kezeoa/5czscQoyIUnHw+nJILXh1HPZllEdhpzmZpc1qnXnJ7IkwljDTKz43?=
 =?us-ascii?Q?V6QDI7b++UkPVfHuEU1OK9mB1Wkm6Rn+/Pgl96GI7VBjXzEc1YJXku+77WFz?=
 =?us-ascii?Q?1tFxhN3LnVXwpfvsvcnRSAqPx9OMO+q/QkQP7TvDgDNCA8WICy8BFyNkgc6k?=
 =?us-ascii?Q?k0iIxrpKPeyVjqcABeePdCLF/xRu2/P0XnQc1k4KinWhKdKwtIP+ZvFNsdmJ?=
 =?us-ascii?Q?jsxLlZYYRP5Hlt3xT1jlX43scCdLpnbVGtNnF9o71dJPS9fgYQ5S+6t2g8XY?=
 =?us-ascii?Q?SvXJJxkgkWAO7MX1CZlPR7VQJgZzNSfuFT9jtLBP/cCYg0D5EB3ia7iAaZsD?=
 =?us-ascii?Q?dXfd2/MLH8HtDc2IQXxvVnoe1Na06/PLji7vosIxA/uy1kw9ET20UIsOrMMb?=
 =?us-ascii?Q?6LXcHPTpfFEwx5zMWhei/aY0Ov85pbZL3Zf0hjUYo1pWkBcNTtrmjoqhOwl3?=
 =?us-ascii?Q?0qpTnx3R3lX72NlHycJNSe5NjzotFSo3hVOcesDyE5D4yDxC6yxOXjsrbwnE?=
 =?us-ascii?Q?55rDsjtN2Qb9SpjtX4MGDmkc/+0rlKJ7/KnlaZw4ZownVdBeTF5kMLxspOuT?=
 =?us-ascii?Q?whRTlexdGhTygSzDPHT2Zu9dybBHxmqGB0f1mVsMed4iXL6ezBFNuARkXcT+?=
 =?us-ascii?Q?M8I9wNk0YcRwkHJz/jUOcJ63thMIkM/c8Vp4UD04BZY6M66gGh+huTkkjfEi?=
 =?us-ascii?Q?HwvonN1/RT8KQM6uCXDCWCXUPArdH8CiSWqbnKqtXCBpOP9ao4jOQjHqi9jR?=
 =?us-ascii?Q?1LKe64QLvPtOQKL23A34WfYlU46Pbj+YoKqX/nO6BNvQeEHwPZCm1Keyqodr?=
 =?us-ascii?Q?lUy7vmBuAd+sJ40ds4S4W+eqAMxse35ADGLwQ7T9y9jw7x3c4VS/7sH5rtC7?=
 =?us-ascii?Q?3i328qbuJrnqhXBsStqEhIL4DMaAXo+0529WtVJ1aphL0QHQZfW4A54X259c?=
 =?us-ascii?Q?yTEvShR+2MunxIEqTVX9jqx5yt23X4MQEE7t/houzxUICD4kVsZmA+h9xBgL?=
 =?us-ascii?Q?5EstAPTkkdSrspAM9klwEJhw9bpkEZAxsFk8ylgRJxElrWHdaxvBVsa/9ue0?=
 =?us-ascii?Q?bGei2y6qX6mMrXuTXZy8jGp1J27jKuSipOLkWTyESIhcYnQBwJGDfhoH1tbz?=
 =?us-ascii?Q?PQNcJNTpathq/jlT6G0J7++WE6XaYvbMcjeUE746?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f226ed74-a010-4ad1-2540-08da920825b2
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 02:08:11.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjkGKqUDJHbI0dydWzag2r9plh5pLNhwbRaSVQv8WAUYfAbpKAPLHitaZvjbI71ctoWWihwhkfC5iMqjSEuweQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4015
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Sep 08, 2022 at 02:21:13PM -0700, Dmitry Torokhov wrote:
> On Thu, Sep 08, 2022 at 08:15:39AM -0500, Jeff LaBundy wrote:
> > Nonzero return values of several calls to fwnode_property_read_u32()
> > are silenty ignored, leaving no way to know that the properties were
> > not applied in the event of an error.
> > 
> > To solve this problem, follow the design pattern used throughout the
> > rest of the driver by first checking if the property is present, and
> > then evaluating the return value of fwnode_property_read_u32().
> > 
> > Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  drivers/input/misc/iqs7222.c | 65 ++++++++++++++++++++++++++++++------
> >  1 file changed, 55 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> > index 04c1050d845c..fdade24caa8a 100644
> > --- a/drivers/input/misc/iqs7222.c
> > +++ b/drivers/input/misc/iqs7222.c
> > @@ -1819,8 +1819,17 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
> >  		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
> >  		chan_setup[4] = val * 42 + 1048;
> >  
> > -		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> > -					      &val)) {
> > +		if (fwnode_property_present(chan_node, "azoteq,ref-weight")) {
> > +			error = fwnode_property_read_u32(chan_node,
> > +							 "azoteq,ref-weight",
> > +							 &val);
> 
> fwnode_property_read_u32() returns EINVAL if property is missing, so
> maybe have:
> 
> 		error = fwnode_property_read_u32(chan_node,
> 						 "azoteq,ref-weight", &val);
> 		if (!error) {
> 			...
> 		} else {
> 			if (error != -EINVAL) {
> 				dev_err(&client->dev,
> 					"Failed to read %s reference weight: %d\n",
> 					fwnode_get_name(chan_node), error);
> 				goto put_chan_node;
> 			}
> 		}
> 
> to avoid double calls into property handling code?

That's a better idea; I can fold this into the helper functions proposed
for the previous patch too.

> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
