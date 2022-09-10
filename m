Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C2F5B4347
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 02:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiIJAE3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Sep 2022 20:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiIJAE2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Sep 2022 20:04:28 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BDECF3;
        Fri,  9 Sep 2022 17:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kA/XQ8xY/2vVCJD5WhMC1PEfI5g7HQdgpLZtb+IM2LGHojIKfN+q+3z0nks3cEZiydG2kR43PMC/dFDJQJlI7Z1DLs7ihBWpsqMLtI02RNxck52NVJU4NTS8w75DtFvnxB3322mpkt8UIYhE3Fo/GjnHvqDXd2aE1+ZWyslulD0vsvSbf4/IZ0KmEKMpD6o1obnwSYJ4f9wz3XzDqbh1Y0oQE58ZMwfartC+vqZlS3tW+DXaYCFN7EeRhiAQHUFFa24NyxI6VQbrup7BUy6cp1fQ0qDCotwg+OOGVuYJbx4fHJ4InSWZsUn5NstxK5L89P0ahBBdMuHywG9wUwHA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WO3ThAbCiDngc2SVbRVeRr12mAWL0B+NZOoWwJo/CI=;
 b=ktZYKQjVfEFFfuhMXIcTj4tv4twFpCzdrtxHVOdZdWCHFWYQW0M7qb3zhU9kK/IJjxMznaI83UMBCd0S//9QXLZHbOMGZG7Za7wmAX9RPXn3O3lUuJuZDsOM4qnTXVr5dUp9yBeqrp65AsZ+tRW3IG2Rv3dGDnAQYxyY7c+yQynHB0uvw0nlMq6Lwkk0rRLnfoXzxZpajFHCtypJAg5qqiMRigFb4kKK3xtl6kfE4tdqQRwcnqf83g7awTp3fLzNKQq+4YZyIjK4bTjc7FOfqihmjW6I3XOqvU+IiKfvzVG45E9axXDtvG9tqfeVLy4wXxURl2kKoB+htL51WlwZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WO3ThAbCiDngc2SVbRVeRr12mAWL0B+NZOoWwJo/CI=;
 b=BwbkLXSsG1TavclxWRhXXofA9UXmdG4UQSheyuO5EZ2tO4cOEi3EkrqrXsx4e5X2zJPBauE2oTektbaMVNg58CnBjK1EPwtkPYHV/rNxjdqk28TMI+fpnR8D1IX8IjbWHRiXsE/o/ryqKMt39dgN+HLQxt8dlrUjiKUYlk7+1vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB5164.namprd08.prod.outlook.com
 (2603:10b6:5:49::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Sat, 10 Sep
 2022 00:04:24 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee%6]) with mapi id 15.20.5612.020; Sat, 10 Sep 2022
 00:04:24 +0000
Date:   Fri, 9 Sep 2022 19:04:21 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] Input: iqs7222 - report malformed properties
Message-ID: <YxvUhab0v9/N3K9G@nixie71>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-3-jeff@labundy.com>
 <YxpcyY0BAumyaeVR@google.com>
 <20220909020809.GB3306@nixie71>
 <YxrER3gYKg3joI7u@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxrER3gYKg3joI7u@google.com>
X-ClientProxiedBy: SN6PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:805:f2::42) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: d53280a2-1235-4b57-7a37-08da92c004d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APJiLdwGGORH75ZwsCiLVTB08RpkGwTevRhvuV3BmhfZHbHbswCMLOwnuZeGpPBEi4LqBAWf9SBi5BF4wckCE6BqQTspCcZm1ixL/xhmBIbYz2WwVkL5t6VGBq8tT3uYXjzeD7AtVV8gpS7H0G8BEFT/C5OTBl3EFr014zNkk6BLj3UallYK3brksIpg2Vd7qS8fjUQKS6xOiRkijL07r85lMyMKg8thg6LR9sFU/CtyuA5ecQ9vssUNSPam3PbU8zBoZA1DGhndNEMCO//PabTHUueQN8TM9UeZQxPOxkRNSZrOirE723mquhUYcYPbsAKxIdeR9wnF6xJGhwRS/RF2cCQRxpKTzCRigXid1QRuLn2o5oikG7a31ktUJGpigXW0+TaOKl50uxxqcRniIzENIYsyyV4YZBUx+XdfDuJjLwn/5mI6l69iR1erNdcYQTwGrAZop45o2s4RP1qssPA6iRU5yUpvWZN0FSDEqmRZp2X7xWavJjylT6hcqJmlGdYTv1dGkRH0BYjbcNAllp2dhQP3EFD9rMS3LeR+VLmLMaKceCwTbMnYi3vcS9wnNalBbRlZy2uzPx23+EdotViEd6bAQ03NU8Sw3omt/go35xd5/OSxzbRWxD4vpiooPSC2hBkUll1Vx/5r8ltMdm222PE7ylscCvbhD1NTeHLHd6lA4SCZQj7dk4USm/5FkxXEX/tGXa2X/dssobagvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(136003)(366004)(39830400003)(376002)(396003)(6512007)(26005)(6506007)(41300700001)(478600001)(9686003)(6486002)(6666004)(83380400001)(186003)(8936002)(5660300002)(2906002)(316002)(33716001)(6916009)(66476007)(66946007)(4326008)(8676002)(66556008)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+eFgNcewhyqlT7TeIePW5V9wWQWD+Luu4sOOoU/Vkw07/IKPoGwGbDBMU+L?=
 =?us-ascii?Q?BL/dODpgp4vVTY8SkByqEghXuGAd+Q6Yl5Ui51rrokH938PZrGDj6pgnjjkN?=
 =?us-ascii?Q?wcziO+sV1sehea9OPrhdac6ls6OxDW6lCHY+vDGpcukYJ27ub6l14Vc4itf5?=
 =?us-ascii?Q?SvCU1bHgPRF4IaQmXt6DKG25sCgiUn+6Q78NHyUpD+G0AnNSrP24bhwsF7hx?=
 =?us-ascii?Q?FVJOS5LfKNTULZEK4G/d6K8M66btjZawGB/SynQts0c50IFTiG4r7lh/oThl?=
 =?us-ascii?Q?0nSPxVevAyf17hN0CoEBKZ3hYWraNx6cW2Z9TN02eevvjGGjKTCreDC+UzdR?=
 =?us-ascii?Q?1UN7IMX2FYdCslVUFQ/7AxlQSAq0k2zji8Y4kMSwTQrDEnjOHb86uWLFazDN?=
 =?us-ascii?Q?mtYLWRuTZqvkZl5jGWRkGf0dP0oG1lLdQBVVNlzY2IUlW2RGqBFsweuqVRj6?=
 =?us-ascii?Q?CHREKcQJzdWtVEOaEX947K6+5FVw+btZzL1suNM5b7+dI+DU8LiqtyBpUAVw?=
 =?us-ascii?Q?Y455JX5ba88YuCZZ8rAxCJKmBD7Cr9Pllpalb+57w5gJunj41Qt5GUZF89sa?=
 =?us-ascii?Q?IsACwYCaws/rwNwM8AfKgpa5h8f5+yL3Xoe+VLmoLTcoG3Pzo/hM5upAkCWh?=
 =?us-ascii?Q?oy/fAQQeiOH3hXoU0tgHwX/KZuF6/1tgQqhgFSjsFtUwPrHE3CCWbNqK7loU?=
 =?us-ascii?Q?NJY8uDT+RY77kZV04kCNgcmhBLh9CNVfNXKbDzLWziwl7kDAm7gaNBO/OtHz?=
 =?us-ascii?Q?Wq7TccH1l2xC2DMFWctsd9SbphSYirVfv4mBCHVQufU7YD8C4ByYhbn3P/fT?=
 =?us-ascii?Q?vx1tVx6uCH6yUfka7sdUtUhcTaNjsBmlSr/5DioS+PMTW40tgIqI+OXgkhv6?=
 =?us-ascii?Q?wRpkh5IPjF2yAKQfEcRAJiI6KuIiCrfxwbGUU+SS7BmlovhYihANCXZGilj8?=
 =?us-ascii?Q?DnsmoeURlNJ+MN68NgfpiP/+39lQ1xZ5vTH6WvHupbLRZ1VKjw0QJnMYe0mv?=
 =?us-ascii?Q?lxGbQSS8ga+VPghsBf48I2I1+a+h4G5A0wSAIWpyPRb2JHFe6GGBkGSol9bH?=
 =?us-ascii?Q?yRwPB8Q7v6lzPShKZlBFKB5ZGmxON6OAObmsNMNrIRSonyrWLXz+LMRuw/op?=
 =?us-ascii?Q?vavsc5wwc5RQlsMs+kNpjEApMgMV7MdytVlYWWxwXbryL6qYpKps+YT8U/W+?=
 =?us-ascii?Q?qHrjJg6wHKEfKjw2WlYY7FXgLc69gx/fFzgEzkNksy5/seH0SX/FcYplD2nS?=
 =?us-ascii?Q?d1pMdDFLup1pvwq+4pwXXNzId8GK+Pgpx/duFt51PLY3f96XnFNoyShjS31t?=
 =?us-ascii?Q?00yGzz9zka/F335Cer8Tg4nyrIDICjM0ppVB3VlSpHcgnwoR0KCm9ClOTgfv?=
 =?us-ascii?Q?thszM7++8GaErh9ZMGOjdgZuyubTbRazHyuNbIk1+e4GzE9RV006DVf9oQMH?=
 =?us-ascii?Q?1n62imHYlFUmpKTQPp2ANCIJAZAQLQbmHXPwVChVop0VB/ylPtkGXMF2uj0j?=
 =?us-ascii?Q?1nlhW+SbflvtT370pGS0wGpeApc8TJtkMVOJgE8U4r/oQA+hsREQL/RxWWax?=
 =?us-ascii?Q?9JilVTsPHIx3Knqbvu4LrvZe7erE1pqbwrm3t6xh?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53280a2-1235-4b57-7a37-08da92c004d7
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2022 00:04:24.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gR6Zhswn56wv65ItFE+mw6UkwkFfG4WzzbmZb9kFQ0UxV6GpTaAGVMIjonXkJa66FvA7ToMBH+xnjBAFY4rlQQ==
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

On Thu, Sep 08, 2022 at 09:42:47PM -0700, Dmitry Torokhov wrote:
> On Thu, Sep 08, 2022 at 09:08:09PM -0500, Jeff LaBundy wrote:
> > Hi Dmitry,
> > 
> > On Thu, Sep 08, 2022 at 02:21:13PM -0700, Dmitry Torokhov wrote:
> > > On Thu, Sep 08, 2022 at 08:15:39AM -0500, Jeff LaBundy wrote:
> > > > Nonzero return values of several calls to fwnode_property_read_u32()
> > > > are silenty ignored, leaving no way to know that the properties were
> > > > not applied in the event of an error.
> > > > 
> > > > To solve this problem, follow the design pattern used throughout the
> > > > rest of the driver by first checking if the property is present, and
> > > > then evaluating the return value of fwnode_property_read_u32().
> > > > 
> > > > Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> > > > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > > > ---
> > > >  drivers/input/misc/iqs7222.c | 65 ++++++++++++++++++++++++++++++------
> > > >  1 file changed, 55 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> > > > index 04c1050d845c..fdade24caa8a 100644
> > > > --- a/drivers/input/misc/iqs7222.c
> > > > +++ b/drivers/input/misc/iqs7222.c
> > > > @@ -1819,8 +1819,17 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
> > > >  		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
> > > >  		chan_setup[4] = val * 42 + 1048;
> > > >  
> > > > -		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> > > > -					      &val)) {
> > > > +		if (fwnode_property_present(chan_node, "azoteq,ref-weight")) {
> > > > +			error = fwnode_property_read_u32(chan_node,
> > > > +							 "azoteq,ref-weight",
> > > > +							 &val);
> > > 
> > > fwnode_property_read_u32() returns EINVAL if property is missing, so
> > > maybe have:
> > > 
> > > 		error = fwnode_property_read_u32(chan_node,
> > > 						 "azoteq,ref-weight", &val);
> > > 		if (!error) {
> > > 			...
> > > 		} else {
> > > 			if (error != -EINVAL) {
> > > 				dev_err(&client->dev,
> > > 					"Failed to read %s reference weight: %d\n",
> > > 					fwnode_get_name(chan_node), error);
> > > 				goto put_chan_node;
> > > 			}
> > > 		}
> > > 
> > > to avoid double calls into property handling code?
> > 
> > That's a better idea; I can fold this into the helper functions proposed
> > for the previous patch too.
> 
> We might be talking about different helpers. I had in mind:
> 
> static int __iqs7222_parse_cycle(...)
> {
> ...
> }
> 
> static int iqs7222_parse_cycle(...)
> {
> ...
> 	int retval = 0;
> 
> 	error = iqs7222_parse_props(iqs7222, &cycle_node, cycle_index,
> 				    IQS7222_REG_GRP_CYCLE,
> 				    IQS7222_REG_KEY_NONE);
> 	if (error)
> 		return error;
> 
> 	if (cycle_node) {
> 		retval = __iqs7222_parse_cycle(...);
> 		fwnode_put(cycle_node);
> 	}
> 
> 
> 	return retval;
> }
> 
> so that we drop the node from one place.

Right, originally I had imagined a wrapper around fwnode_property_read_u32()
that calls fwnode_handle_put() in the error path. However, your proposal is
even better.

Thanks for the fruitful discussion; I'll clean all of this up for v2.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
