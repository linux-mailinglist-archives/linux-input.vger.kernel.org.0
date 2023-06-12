Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887F072B50B
	for <lists+linux-input@lfdr.de>; Mon, 12 Jun 2023 03:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjFLBGi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Jun 2023 21:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjFLBGh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Jun 2023 21:06:37 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BBD12D;
        Sun, 11 Jun 2023 18:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWd0I090naWF8mGBQCZ96LtpFudgpTw7+fZ+CY4IbZIS7tUeCss8Fo7FSymgDlW1sosc3FNLGbqdH2wHLz/o+29HZsrqCDjZsEZYW0MokUW4we0bbfEStSR+EcueIzSEaSfPuX+fw++cxyFSYIOv/dyaJh8MsKAy/bDiSF8D3VKW5DacGh/y+fv1NtkNexl43NbEHpACAH+mwKVIShf2BX8LtxG9hXmZi/8PZsxCfxki/HdweLtZcm571MwcKr4ugWiVaI70S48Dn1uisqxDuHk1CKPAZJ9l9wgApbyirO0XkcJ9xMr/ofpAVpN5MWZ90CPJ7XtPWDChI58k21P6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULFmjent1KJ87cyf48CnrsJBiil03YDIZr7TMwfS1/o=;
 b=gaqFVgsxIF8rhRBPN71bmxE/sEEQZy9qfNFhThD7IefrJl95slwNesIXlNggjkKFrpVdzR19QwQ8uFxAzdAAuoJ6kFpkQG5AyjRNImzDTVHQwJ81E7scrvNggWHRePokZKb55JSJaFyMx3wynrmDHCwYSiHb44F2yncOYHM8aj6NyGO8L8Y8rheWZjrHIU5/oLi168Ab2osSRppTDv+8HVQymwYUoXprlt8SouL4Or6C0XX4ImTc3FsmMH/8f+r8C4MS6zwjQ2uSpU2jAswYpB+ExU6lNWwl5YE54u1NZTGNIibsQyEas48tO0fLUAbzoKZdA8Z0TWQVSxiMbapptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULFmjent1KJ87cyf48CnrsJBiil03YDIZr7TMwfS1/o=;
 b=uhQOaA4H6xaw1aE631UKperY74NzANT28QdpcVkoW88G1FwLTRyxEl8P9/19hEmN6ag0zC1tuiu30bckAp7gx5Z+bKC9Kdu1261JZBSATJOphFrEIWRPXPi7l/t+MBn3ZWlto5bSdr/QpT0R/NGN47zqkTAsVzhqMAULze+C5FU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB8457.namprd08.prod.outlook.com
 (2603:10b6:a03:4e0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 01:06:32 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ca3a:84ac:381c:1506]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ca3a:84ac:381c:1506%4]) with mapi id 15.20.6455.043; Mon, 12 Jun 2023
 01:06:32 +0000
Date:   Sun, 11 Jun 2023 20:06:24 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <ZIZvkGqr4a0kOGnR@nixie71>
References: <ZHVD/9OgRTAwBhqx@nixie71>
 <ZHVEa0yM1LLUJEfO@nixie71>
 <20230609142538.GA878396-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609142538.GA878396-robh@kernel.org>
X-ClientProxiedBy: DM6PR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:5:54::38) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SJ0PR08MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef3479d-8ca8-4c4e-31fe-08db6ae1428d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5E6qlyXJ4+VDTcFy/26sUGFxnhr57MJbFD3sGPMvlA31tczrpB0pHJQN7ckKIrly5sjuwZy44yo0dYhYEA2BuSyjuLePKD4tnD0x86tC8kbtuXn3MNHGI/5rYGDkextBg5u2oy/X0X3mn7AlwwNVwSPo1+lhMMziQaE3TCShOdLHcPpyt1xTnbWk56qEZZVt7OnbsDrSSaXCzh51bZZre0kB3wTWEU5/V3xEqkr6ueg+RvQmCYJxQOaLJrT4We0VdDWkwxiN6dkCXX/AReRfM2hjMQuTGpafwwBQlSjJ2R66Idq1P4VIwSBZ0ApZ15Su+CatQ0kOZjfO1QAeK+RELsv9Le3zzgNvYB9xyOY0XoUf4bbTjOTRmOjMWlAZZ4S/X0Qy9qoEO3PIkLOAt5Sx0JGB0p/LNtKpNVLJFI5M/jDPnEK+pD/EW1hkWlEo2H5REjb2tHxwnxqyhrlsuY4+J1bRKOVimKqHK81PZB/SelqOqnl2cD5QnYST8WFtBZkpuWZDuoNgrX8EQvDGXwGmJDdOTsINYcBcYWUTlFIQjf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(39830400003)(366004)(376002)(136003)(346002)(84040400005)(451199021)(66946007)(6506007)(9686003)(966005)(6512007)(6666004)(26005)(478600001)(186003)(83380400001)(6486002)(6916009)(66476007)(316002)(8676002)(38100700002)(8936002)(66556008)(5660300002)(2906002)(4326008)(41300700001)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8btW9eYEB0JSubIPvLEKPitSG1QOf+A6n10qx5xnCMarmPar0ClR0aLqBg1x?=
 =?us-ascii?Q?6Z6v7SeL14xInGumSGnO2Tw9PQI7EOXJCCUEcaiBOB+9RI6vVWrrpOsL77Ap?=
 =?us-ascii?Q?AX69BuG4yn6GdrsOaF8ItwNpg2l3ofWF+Tas5JaF+zHB2KA4y853y6Btv6kh?=
 =?us-ascii?Q?X2wKJZq8xGTcB+bEXUOVSDF7HbRxK8NGPvKs844eYkUkIta/gYY4/Dvx1lxt?=
 =?us-ascii?Q?ERKbhEAIngOSOANenQZTSIiN6mSXkon7dGD/H3eLHdmGl3VpFD29NT7um7iH?=
 =?us-ascii?Q?Sagq4iaEvqAOpf138owviF6qpXdnzVA1zgpPn23WswfSsqYM2LI7fC7rf4nJ?=
 =?us-ascii?Q?0BwexVRi6CHASS+NeK/JiuUrQ6fPUP4880s3t8hpNW0w5Sb7xpTxGFnmPZ9V?=
 =?us-ascii?Q?OOdtILHtL29B3k8EOiDRzfCc8EiValKQhee4BhKTdHZ6yBQuZb6QdGRPKrGu?=
 =?us-ascii?Q?zospNcSauGOEo35AHp8qHnKU0XEwjFMgS/9dq/tCFUPbIcQm4JmqaahY3//3?=
 =?us-ascii?Q?ZMffwKx8nHbMcmL+iDcqJO7NkuJYuDCWtYVDp1F2VoSiMPJB78uGELzo12Ji?=
 =?us-ascii?Q?/fxgiB9dpds1jZ8P1CqeYizOQENE37Ca50Ml9g3pijZn5q3kCg1st8MO6Oxp?=
 =?us-ascii?Q?N1WS8itKGDGXypjftp89eSHlraapKXlXV/38X1lttp1OvY23IkA5AJxl5ZF+?=
 =?us-ascii?Q?igFY7xSnmkHyUa0i4kBEpEgbxDSI7pc/U57d+d5O5c4K4eJUwIRTx5LOa/oD?=
 =?us-ascii?Q?PYpJaANRi/GIBkwBIJnSC1DIZtJRwIOgv0N6h+yu88VPI834WhQsl/WO654T?=
 =?us-ascii?Q?qcZqbmP/GwhRNVbafJ9iWU16ZQHFyBMDUVxgb5Q9aZgEokLBa7j7oYuNgbt/?=
 =?us-ascii?Q?IhbTL76kKd8KYBDkJT3zLCTMBGRJVqao5tJVJ8QseT0WEGompQU+Vm7PviBF?=
 =?us-ascii?Q?Hl0eA8dlu2Pz7nLvSxo22ZOqsx2OEpqdvPXXx5HC+bOFADEx9tg9K7qWsOkT?=
 =?us-ascii?Q?CwdfEx1/PbqktEZqw2s+CsjuCTsNn2kl3ijQiroHQVi5f7codLBWRZ70WngX?=
 =?us-ascii?Q?5CjfYKxm0A347QHRq/bPHFtZFhCXlzg/nwOa+p73q/5jm7XLa5Xj/jIeWRG2?=
 =?us-ascii?Q?qYF5vuKqhGamPFssV70bD1+1KGi2KEzYZOYduRQtJS9yfqCuf0VXfVdnjN0w?=
 =?us-ascii?Q?mRBU4syBzRP0XmrdtRWVq3yrFEbtxl6Ox89oAn0vok4yvPKEQ9VuiY3/Ry0q?=
 =?us-ascii?Q?coPvgwZREsi+Qcuw6qRXDP315Ov7st8hwVsRmGJlngUbdDqZLt8i9x9YJhb4?=
 =?us-ascii?Q?+oXuTBZX/Wtp4WVftvS77IYFl0g4z2VesLX7dKELcPQTZL0Z/258efeFcEan?=
 =?us-ascii?Q?64bqellboJj27zt+j7bVVPCtiAxlCNeJ36pDs80molsLQQMoLwXKGvyCTRRI?=
 =?us-ascii?Q?9Kzu1VkxsNIwcNCZveI5C+NvtvXaqq79ywEqXt2rykRooou8RnpzCUlY4mcA?=
 =?us-ascii?Q?/anUZDpHjY1g6DXg2hHr3+e9VJLi78wIRiqfGL1xc/p8p7lOgq6mRQa0tZ8w?=
 =?us-ascii?Q?D7pps2JpnlUmXbbUu8U+HzjwDqudJeaKg/RhuXUu?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef3479d-8ca8-4c4e-31fe-08db6ae1428d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 01:06:32.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKHdWENV19Ik+Jq0amGQibTbccInnc1j6c3KA+q/zk/D3tEKoY9Npu+xsix8HGTKoT3A2W7Srjg1KI1sq5hUqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB8457
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

On Fri, Jun 09, 2023 at 08:25:38AM -0600, Rob Herring wrote:
> On Mon, May 29, 2023 at 07:33:47PM -0500, Jeff LaBundy wrote:
> > Add bindings for the Azoteq IQS7210A/7211A/E family of trackpad/
> > touchscreen controllers.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> > Changes in v2:
> >  - Renamed 'azoteq,default-comms' to 'azoteq,forced-comms-default' and redefined
> >    0, 1 and 2 as unspecified, 0 and 1, respectively
> >  - Defined ATI upon its first occurrence
> >  - Redefined 'azoteq,gesture-angle' in units of degrees
> >  - Declared 'azoteq,rx-enable' to depend upon 'azoteq,tx-enable' within the
> >    'trackpad' node
> > 
> > Hi Rob,
> > 
> > I attempted to reference existing properties from a common binding [1] as per
> > your feedback in [2], however 'make DT_CHECKER_FLAGS=-m dt_binding_check' fails
> > with the message 'Vendor specific properties must have a type and description
> > unless they have a defined, common suffix.'
> 
> Is that because you have differing constraints in each case?

In the failing example [2], I have started with a simple boolean that carries
nothing but a type and description. From the new azoteq,common.yaml:

properties:
  [...]

  azoteq,use-prox:
    type: boolean
    description: foo

And from the first consumer:

patternProperties:
  "^hall-switch-(north|south)$":
    type: object
    allOf:
      - $ref: input.yaml#
      - $ref: azoteq,common.yaml#
    description: bar

    properties:
      linux,code: true
      azoteq,use-prox: true

However, the tooling presents the following:

  CHKDT   Documentation/devicetree/bindings/processed-schema.json
/home/jlabundy/work/linux/Documentation/devicetree/bindings/input/iqs62x-keys.yaml: patternProperties:^hall-switch-(north|south)$:properties:azoteq,use-prox: True is not of type 'object'
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

[...]

I am committed to addressing your feedback; to help me do so, can you help me
identify what I've done wrong, and/or point me to an example that successfully
passes dt_binding_check?

> 
> > This seems related to the discussion in [3], where you warned that the tooling
> > cannot yet deduce that vendor-specific properties have already been typed in an
> > externally $ref'd binding. The only other example of a common vendor schema is
> > [4], but in that case the common properties are defined under arbitraily named
> > pinmux config nodes. As such, they are part of 'additionalProperties' instead of
> > 'properties' and hence exempt from this particular validation.
> > 
> > Please let me know if I am mistaken (surprise!), in which case I will continue
> > on this path and send a v3. Otherwise, I would like to suggest that the review
> > moves forward under the premise that I will happily consolidate these bindings
> > once the tooling supports this idea.
> > 
> > Kind regards,
> > Jeff LaBundy

[2] https://github.com/jlabundy/linux/tree/azoteq-common

Kind regards,
Jeff LaBundy
