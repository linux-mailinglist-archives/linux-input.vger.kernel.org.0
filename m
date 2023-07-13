Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9884275299D
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 19:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjGMROH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 13:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjGMROG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 13:14:06 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF511BF3
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 10:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhdE1DqyRhIe0ViOctBePZjB5ZcjWqD1Bq1SVAxU4jlUiyXuOf23fMXCNe+saW0ldksDkaqNKyDfcWnvKOaEq+nKCQ89XOO6WU0o8kwFEqOf+72CkUpCvsnHH6lPGgSHa8xZzw86r2D8bDjKvBlc3f2DEnyXjH8McKCXRtcGEOTJAbCVGHZfUEUPLEkfbt3miTyJhmB3gxbEOa919WZYECC8sUja//TZbGU8QI0kRZemAGHZpfylEpg7KdchxOfni9TEBHMvLJhAeL7sRbZeeFbdEY1R2wSVC4S4ibT/BLArFWtNx1aRv3xek1oYdH5WSMRzIRM6xGNzki/mZVS3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygQ6a/JWOwwd1qXv2QY5OOP3bi7oIim/DWBs88y3Jmw=;
 b=WPDf3UJCa4in1QAEC40bgSBBd9KGlRRHw5lLDFJcQfEZezKRm7TVaQD9p5inNJPaPoKzwE4MVyGZ5EtprDQi87YBkM1KQs85LJMfmEIFpMzfWgYwu6MGsOVh+fOAz2xKE7VHi7YtRotT6zI+2wPdCwz+ZK69wn7y9AThbnos/VOB4Q6NbCCW3qC/WxZSamk4oqJGAa2s/zwzGdmhWC9ycCVsIdwgpzyA5ezsz7O9Ka27WZdEYktPzLu3ozOV2niG9Iawvrb4/82gnIck2Gb/bpPIBmZO+u1B2EZAWysAFVpZp2jIplJWTsEndkryMe3tUaOsCfMLexCjjUhpzdeODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygQ6a/JWOwwd1qXv2QY5OOP3bi7oIim/DWBs88y3Jmw=;
 b=ALAiv4Aoe9YYFy/2YUboJYfV11bCZHOTBB/wNAKsVde+4WX38Z6dbA6QRFoVZemArKyjbfIfvzjp1Jfeiy5clDZGqHboDG9atIj/z5vry+f5tf5gis0s8Qr1aNioAfLyELK+LFV+yHJieuzUwpEmTBOv65FjIWZ4T+vtyILPxdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY3PR08MB7122.namprd08.prod.outlook.com
 (2603:10b6:a03:36e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 17:14:02 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::a1c0:edd6:d172:7ff7%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 17:14:01 +0000
Date:   Thu, 13 Jul 2023 12:13:58 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7211 - point to match data directly
Message-ID: <ZLAw1i0LzaEFf3DN@nixie71>
References: <ZLAhFgOatNoReBa2@nixie71>
 <ZLAtlfhUMXKRzdoE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLAtlfhUMXKRzdoE@google.com>
X-ClientProxiedBy: DM6PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:5:335::27) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BY3PR08MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 4186f7b2-e47a-4322-8f87-08db83c48d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aX6aH5sVNjoatgUGoifdCPswOzNjUdHvLVs2Ky+YrlSn8PDELUubIkCbwAyDB8Uk7bm+RQDupAA5MBQY3AOB1gPcU5TlvKOBdbkBn9TUmaOmvZeL7cC7+5BHdwmknIz7jIhZ4X7SEep+Qkfekcz7ubkcVvMBoC5+BJqRufbWpNkxl3Ybyb9NyMtht8rvkdtYjM5QLxAs4SLox7fxpXFmXB5kOmGiLomrlz1OUorPwjIs/QuW5Cb5gfxOSdmU7Gqe/bNUGDXJxna3Vez7Vvi/coSgvZblOfDDltp0x2ZIVUzr0yPspaHopxmyrJqFKHOpn4tRxG91nrqPcZH0m316sbNeQHQGOv5rrPb/P/Yl1V90Er/ZYQyNER6/WLUyIfSNZyuzJbGkVMFY54CcHOb/bkTAK68VuDoQr+eWcnrAWtMXvU2quwznfnA4d3/ZNjMSGVjUVIHaM0odyCzWAA/ZLiLUvrHhelECahivDjMMXwTQcHyWGtdA/5Vrg2CtV7/Phn/eavMRZaNCPiRyPdCvhnQjxg2V4I7gTWuv8UCfUNiehkWDbyVPiN5U13YV4q3Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(39830400003)(346002)(396003)(376002)(366004)(136003)(451199021)(4744005)(86362001)(38100700002)(5660300002)(8936002)(8676002)(6916009)(4326008)(316002)(41300700001)(66476007)(6666004)(6486002)(6512007)(6506007)(66556008)(186003)(66946007)(9686003)(26005)(478600001)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhYBv1DDbFiWtkAjhZarww8k+ZcxjN/h5JThIT2Y/VKdl/zG8BbHONnNUks6?=
 =?us-ascii?Q?RQkdVMsc/mubT+wpX8lY7EHaC9NxeRySvD9EcbV58k7+l7nI3V/+qjlnG65r?=
 =?us-ascii?Q?l327sbjyV756tjCKnOEHlYHt+mRdb9G4VRZAvngGV6+0/Hzm0S0jIdRcE5Mf?=
 =?us-ascii?Q?W3syFrfFMoPSttl9oTINrv1UQT2+F75K7Xehzfce+FTJVb5RtPLSk0grtHTo?=
 =?us-ascii?Q?zTRExj2yaANUVEtYcyeYLLlMofiHoV0TMl1NnRN14+kV2vSyiQI4KU1xKa+E?=
 =?us-ascii?Q?CdXCpRjr/llI3rQL+fuYsFsNTsnH8rK4k+uANcgknc897CDp03Vo2xgphv/T?=
 =?us-ascii?Q?JhkTC6Nc1JUGcAw4/LMBIepNpmovCRyLJpvsIxFOvdh8Zghpou+ehS2jG6VU?=
 =?us-ascii?Q?jM25wZLoaeAeXKRAczRRwY0HKoGqoE2VPYNAGZLKpE1j48dn5JbdLh9JL1rZ?=
 =?us-ascii?Q?BziXQQa+QQAkwsuDAowCf/iZWD3TNx2iy1+R5l0BuFfE+YyM/dWkYs5KqhYa?=
 =?us-ascii?Q?JT/5zzgx8CI5l8SL/Zx+leF2CPhRS3bCNreL101qctmO6Df+VfHAo+QC7jKd?=
 =?us-ascii?Q?X0I+iIMc7MbjoaYmWSRR9jc5WB2Onf7wT1ZZcSeFDwuE3u2zG4+MxltuUVjl?=
 =?us-ascii?Q?ObaUwja/QFqgzMjm9fyb3Yvq5eVx5fbCt3l1pxT0t1VcfDIs1AmFvnqUaDsR?=
 =?us-ascii?Q?IirHNYQlc3cABduASjwd8JuHYyJGNLD8BKVuv/ehpPP/PrTB0G6sLZ5fqEzO?=
 =?us-ascii?Q?FQYD46TGZYfC7djD298u0X2LMYF6a8UtR39NEgaBkeBqcZKnWRTX+WOnJHvO?=
 =?us-ascii?Q?cTN+xrCXNcEl7PP6Sb9NdXCST0EM7rh7YlY6t1+6E6wSm76urk3zT/iSYLNM?=
 =?us-ascii?Q?ToDRSA2qNdgrFZG2VW3GxkDi2nF1T73dXZjzVJYWw+hRSrzVx7uy9YIFHvdE?=
 =?us-ascii?Q?U6lFM61z7ij4iysdKAdh/daL1bx5K4it/4+NOv2vt72vxM7+YJ/uKwyER/IL?=
 =?us-ascii?Q?8TGruI7i25WA8BhfuV2FFQTTKnMp5d1jvF0SUKTqVgBtI7QVfu02VAlfuv7H?=
 =?us-ascii?Q?kQ/vYHoZvNPZ4HGIavHmL5IVyqgw1Cd2rTesvwkKo37u20a0Zb7bs8Z8fIho?=
 =?us-ascii?Q?GcuW4MeelHTwb1gWmJnibtPNytx1uPI0aqkq1L8PuZelginHaikNo3YxjYbM?=
 =?us-ascii?Q?UOvjlAUL14yki/6OAQ5r9yo2BwO80TPiW70+LZU9nCkMTdc4rviwzbz0Z9rB?=
 =?us-ascii?Q?Bc29X21SBtIqiUAj3x6xtWBqq32WK86IEE0FFapKwpeUQxTdI8gFa7p0MPxf?=
 =?us-ascii?Q?W7CIU9fOnivyXmcowcE7YXk5Vckh0zKRTYT4u/YJkS2UYr3ZrfHh3rNrd3cx?=
 =?us-ascii?Q?k0+7GtUUxT6ajUcLT5JXy7wqTR51JuOvSS9oZuF9OcgqXcPwO4L2PjMZH+8B?=
 =?us-ascii?Q?ODoX0Dqhy30MtMi10YvTGsnq4JCavJEuNNFrP89vcQlcJYNWFzcrUVeHEcLP?=
 =?us-ascii?Q?JBDYQMqLcjdMxN0zPO9G0Rv3ol3SO/jKxrShfLn70Eb2c04bPpUy8wuzczXy?=
 =?us-ascii?Q?xptBAV4eGhP9of36EIov96Y1bfAiY1302vh1F5mH?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4186f7b2-e47a-4322-8f87-08db83c48d81
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 17:14:01.5871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +THPZdFQuXM/0QOGlyS0wrP+vdN9UZ87jofKpDJ/GCtoPpwSwaOZXlf4s4cKC3p3WiwOV0FwyL30he3NzeSMmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR08MB7122
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Jul 13, 2023 at 10:00:05AM -0700, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Thu, Jul 13, 2023 at 11:06:46AM -0500, Jeff LaBundy wrote:
> > @@ -2460,13 +2451,11 @@ static int iqs7211_probe(struct i2c_client *client)
> >  
> >  	INIT_LIST_HEAD(&iqs7211->reg_field_head);
> >  
> > -	if (client->dev.of_node)
> > -		dev_id = (enum iqs7211_dev_id)of_device_get_match_data(&client->dev);
> > -	else
> > -		dev_id = i2c_match_id(iqs7211_id, client)->driver_data;
> > +	iqs7211->dev_desc = of_device_get_match_data(&client->dev);
> 
> Can we make it device_get_match_data() instead of using OF-specific
> variant?

Ah yes, good catch; I'll fix that.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
