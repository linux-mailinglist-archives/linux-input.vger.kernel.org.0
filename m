Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC224FDC8D
	for <lists+linux-input@lfdr.de>; Tue, 12 Apr 2022 13:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344063AbiDLKbv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 06:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379746AbiDLKTq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 06:19:46 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAE0BCC
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 02:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWM1UGKbcAHP2gQJ8AosihzGfv48ZqQ1Zke1Hgivi7RkWEWg55Z17USoMeKlTp1V1Tlsi2pEtMW3SXrY9BCz4conRciamxKM4oCCCs5ns8bozb75WnTIdmgOr1BHbxoC5xBcnTbjeDFO4SBWE12LwWeFML0KwpRuvRI99TQotnBRuu5OKsoh0UHM75GxGIsKAjJlK+0Xx3lSCSEmQooE1tB4pV0jWwa1qq4uMqGVidJXRAnSj1Nb94agaNyBoolPyZySxRW+h36rHllRmmmoEe9crapH6tDeOlbawp3DDJwXZHq6PykWBZqOx9nRSjme6U/ueDgYVrfezQ/TqSy2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxuBVqxLfnZbMOpf7p2Rl/JuBAe1+c4w8M8S5FYzKt8=;
 b=hWGD/ePuvFzM84+L9Q2I6UcGcTb0lZZZ1Yj6T4nAAGpgX5vIlw6jBGf6mbWevQfR/bC7WGp7ANWkq4UQ/XJcMWglxCmJmVti2LhiN2/EgVrePSoRDdwAm50mRBmdfxU/PijryhuXAlpoTUOQyhKQKAaOnlq0VTuMeCfkHPEpMX+9SN8W4dkH+e75gMOkJWTc6gmRgfeV2sHWj1RDFjJLWNY2heRyWgOOrC5DrZKo2RNITMZ/ndERewKbW51mjBxKCbCaroUD6gwEVL6l5VjbztL1lK3GYvUFXmz4+igJiuZvlwVygUbKmbWTlGKoV+dcjdKK6jK3mUcDNJHyF104zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxuBVqxLfnZbMOpf7p2Rl/JuBAe1+c4w8M8S5FYzKt8=;
 b=NmVNE0+StKuxVjdQPUqhpeC7km0AFOndKbxFYu30sbe8vMjA293kqkiDPINJbiXqimns2jy3Xr0Im/u+2yaxeGNydSytSAGsH9/qSh9KKZXiPv7nYhSKBGaMskQ9x91HX0ofRuNfySzgW3hB5nyREFGf/yhGyRIpmqWzjOEGGN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB5816.namprd08.prod.outlook.com (2603:10b6:a03:11e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 09:22:57 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408%5]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 09:22:57 +0000
Date:   Tue, 12 Apr 2022 04:22:51 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] Input: add support for Azoteq IQS7222A/B/C
Message-ID: <20220412092251.GA10886@nixie71>
References: <20220412075937.GA8684@kili>
 <20220412080123.GN12805@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412080123.GN12805@kadam>
X-ClientProxiedBy: DM5PR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:4:ad::26) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 994b2d9a-1b2e-4904-e46e-08da1c6607d8
X-MS-TrafficTypeDiagnostic: BYAPR08MB5816:EE_
X-Microsoft-Antispam-PRVS: <BYAPR08MB58166B4F44B0DB771382EFFFD3ED9@BYAPR08MB5816.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKt/S/2x/fXXPBuy7/Smt4yjCfMryCq+FjgppLt4s3nnlG7717kLKPIvRHaaqldJlCwc9h4OdHi6GSb0UXCJKgYd9ir1gSDraRVqPtUtOxWBH4joI/ct3Vr02MbcxEwYZsjPeLFfd9QeSn20AjCvul9HBeMcoXpQN/rvzKg20ZvjlUss/TtU1R0HzR6zPdWV5xX7VApMPqtZ74yfpvOSlQ6IXPDerRiAxDQ6UgrOuyw4YagRE6gE2mQ1/AzRQ4F4bDTdZNUuJiKyVHo1hpqqvFzcvfAa6QtlBwNree6e+31DpsEg40wlh96QPTspXv8NZN+wdAWtcrQ5JTJ1LMst/NCCviZQiSD/kN40JomROJf2FqWnprAqe03A6sP9R+LY6cqNuyR7DELMFcDD8JKvg63OZOJEqr3vO/bqF/NjImRD+Utcu+r1cRCFIKgkG6zNlBNddG0U0Dhubq+LkSj8nxz7Q94TxoHLRf+oxF/hRZ2U0z8axUKi5+HSZ2E4hxDZpZY6ATj1FhpSQU/yLf6zGmLcvZ0r6gW5nlieu68fKMrdGYrciasigHUsRHewGYeIKCadRbDiseAga3oil23DJW+MJZjtiu8Tjo7GfksEl+XMAIYM2NAvniXZf+AViQ/PKBukkPo4emSLUEhq2aNpDvIbmY1o9eACE+A0bKkrVBscJlssJzytyGWpjfKbVoCzg6lF6PpSIy+zuLuAtpZGQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(346002)(136003)(39830400003)(366004)(396003)(376002)(8936002)(33656002)(83380400001)(6666004)(6916009)(2906002)(6506007)(316002)(9686003)(52116002)(6512007)(1076003)(4326008)(8676002)(33716001)(66946007)(66476007)(66556008)(5660300002)(508600001)(38350700002)(6486002)(38100700002)(26005)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sTo1Iyyf4R4ta8BGETnbQpcun0slyTKcDO2CavyZilX76cXwloOzv/Kl+LJ?=
 =?us-ascii?Q?958Ef2/2+Zgt/0QBE7cbtCsrvyw21guWPilzwCJsacClGAPV48cmDKBgsz9p?=
 =?us-ascii?Q?D+ROPtzpuAB20mPHQfnlTP7dT6Q+SjgxyuyGiZA8vrVIn5aWm/8SmJ7wvU13?=
 =?us-ascii?Q?ppPBy2Hy6a0D0drmiLsNoS5SzLUIyYaMOaJVzWAH2UzAM/1CtFAaEodBilss?=
 =?us-ascii?Q?KUB2+YSMFg1cH7cYCfbn7FQjZvpnwoRSM2bgY7cZhSH6Titg4fFmuwXFHG+2?=
 =?us-ascii?Q?Imn+CrbVz5DPzk5oIVJjinaM6UwZohjs7bVeXd+Tkupyh0iWIL81eVSPk/+9?=
 =?us-ascii?Q?ZjZezKt9hPmmYkNjfrkKPcKXB1fgDfrJajELYGHIHje+PM9OXBpqMNH12As2?=
 =?us-ascii?Q?+KTUVCHxmDywA/OWWaIZCBPGS2gE21g5OXFlvlBQwxmqTYxQdkAILZcOGpC9?=
 =?us-ascii?Q?9rjYD+VEFI7olpKCkA0MUYdYdipn46aBjbqq0NlPD+Vy6QZQWIoaMfoSNXzc?=
 =?us-ascii?Q?KRK6nZaU85mIKjXUlLHiPeGg7X2oOZtqL0nFqjgCZLHSzJqBsMAjgusBPUPM?=
 =?us-ascii?Q?QvRPZALIPLnwY7/pZ0ddFstVsIP2S3WvbMNiTWQ9zqnTuxFI8joUDJwVGwRa?=
 =?us-ascii?Q?wLNuyL0irqgU09CZR3hMy2oAhdqucjOdD6KCA2rne6kzA66jZ7kNPGPO/l85?=
 =?us-ascii?Q?+QXdkiQagAcW4wFH9lz60E28lp+DgHehZ4BRa2KCZx5AMzJhNF6Pi5flPV98?=
 =?us-ascii?Q?6N9zajzD4fiLiUtEl6w+S+NENoXB9sIOU5+pWO+CvZdMl3XgiPSnC7ay813q?=
 =?us-ascii?Q?Ir2sLIeb5wjcjtrsgzL9FU66NL2HSaf3HgnU/55gFGi86XCdZO6lIw4Abggl?=
 =?us-ascii?Q?+STltatl5YtKMfCfLEIlcL/q4Ws4AS2lMsG7KI5AruR1e8pklUm8jYhFWs0B?=
 =?us-ascii?Q?DHaxrI/CfWASF6T89VlvqshLCytySXXwQYHNXsdq0pcss8ElhsyucuuVeus7?=
 =?us-ascii?Q?qtUpffrlrQqu5S+cNiHeyFuISzucN3iVPSHJ/u79gGYjWd047c5FZwdp5I5k?=
 =?us-ascii?Q?HhLu3XTssh0R1YC7OhKhfzkTTKEOTCS+/AH5Q7GXrqsLHUxfWUoVbnYGuRYB?=
 =?us-ascii?Q?pvvMTeSZNtZgutOFKlEO72hnv44x8OumD2fPXrk7piK9MxQ87X24oKxsPfPs?=
 =?us-ascii?Q?oXETYBEVzKH3cPdqn03F2PFbbtRH7+XmJyn+26KWvFcm1HAi+WgQzV98+MKi?=
 =?us-ascii?Q?ACNXw67HWHkiRjsp+OHghKIODYPRsHvZbD4E1n74Ew6ddOIFyaQ+VTMZxaE0?=
 =?us-ascii?Q?+W59sARFInGTFUO56FpKQ5XmgF2NDrFmEOzLMCmKMhrcJn6onhnKWFh/Tjih?=
 =?us-ascii?Q?qTQE68lk5Yrk8+x6T65EKupeUp/C8WLJUEOAmXcHEEnY+Nnso1HSFaZrSNRL?=
 =?us-ascii?Q?loD23Jvhz+unDqe0PSqwQCO5jzH2DQ7vU8WmJcqfkRqkjQ6qhJkW+1r7x3ne?=
 =?us-ascii?Q?45xTiv1iv03YEFd0/sMP4hcbqkvn/dwCxSMqROXICTBTTuXtED29HfO1Zty2?=
 =?us-ascii?Q?gX8iC4lCZCB7Z3Ys12lu4S1VlK9dAIZQcz8Sfn2iAHMxlWDAJq3l3Pzf5RY3?=
 =?us-ascii?Q?agl6+I4pRGmrlSCc+BUiJKsAvxSR3FReNw/1zXBgznXOqlYez4wqCgR/B0Vs?=
 =?us-ascii?Q?kl2ZxoxSlrtf83Z3lKjNXVSSlDKT+lHrXAeDor/nSP8J1nM7N2/i9Z+ySADo?=
 =?us-ascii?Q?0da23FGR9w=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994b2d9a-1b2e-4904-e46e-08da1c6607d8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:22:57.3055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Um+jEEWmSjQhHCZmIaUtc7awIDJ8Yb+Gxk34hL7DurT2RgBsGBsLKLWI76oGhDjljP+PCZYjAjMJMNH/gD7k8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5816
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dan,

Thank you for reaching out.

On Tue, Apr 12, 2022 at 11:01:23AM +0300, Dan Carpenter wrote:
> There are a couple other warnings as well:
> 
> drivers/input/misc/iqs7222.c:2214 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()
> drivers/input/misc/iqs7222.c:2234 iqs7222_parse_all() error: NULL dereference inside function 'iqs7222_parse_props()

All three of these code paths are tested and do not lead to a crash; I
am suspicious that the warnings are false positives.

> 
> regards,
> dan carpenter
> 
> On Tue, Apr 12, 2022 at 10:59:37AM +0300, Dan Carpenter wrote:
> > Hello Jeff LaBundy,
> > 
> > The patch e505edaedcb9: "Input: add support for Azoteq IQS7222A/B/C"
> > from Apr 8, 2022, leads to the following Smatch static checker
> > warning:
> > 
> > 	drivers/input/misc/iqs7222.c:2166 iqs7222_parse_all()
> > 	error: NULL dereference inside function 'iqs7222_parse_props()'
> > 
> > drivers/input/misc/iqs7222.c
> >     2150 static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
> >     2151 {
> >     2152         const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
> >     2153         const struct iqs7222_reg_grp_desc *reg_grps = dev_desc->reg_grps;
> >     2154         u16 *sys_setup = iqs7222->sys_setup;
> >     2155         int error, i;
> >     2156 
> >     2157         if (dev_desc->event_offset)
> >     2158                 sys_setup[dev_desc->event_offset] = IQS7222_EVENT_MASK_ATI;
> >     2159 
> >     2160         for (i = 0; i < reg_grps[IQS7222_REG_GRP_CYCLE].num_row; i++) {
> >     2161                 error = iqs7222_parse_cycle(iqs7222, i);
> >     2162                 if (error)
> >     2163                         return error;
> >     2164         }
> >     2165 
> > --> 2166         error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_GLBL,
> >                                                       ^^^^
> > This NULL is dereferenced inside iqs7222_parse_props() so this will
> > crash.

By design, all calls to iqs7222_parse_props() with **child_node equal
to NULL are accompanied by a value of reg_grp that prevents the pointer
from being dereferenced.

For these specific cases, the pointer is reassigned by way of a switch
block at line 1542 before being dereferenced by fwnode_property_*().

> > 
> >     2167                                     IQS7222_REG_KEY_NONE);
> >     2168         if (error)
> >     2169                 return error;
> >     2170 
> >     2171         for (i = 0; i < reg_grps[IQS7222_REG_GRP_GPIO].num_row; i++) {
> >     2172                 struct fwnode_handle *gpio_node = NULL;
> > 
> > regards,
> > dan carpenter

Please let me know in case I have misunderstood or you feel that I can
make any improvements.

Kind regards,
Jeff LaBundy
