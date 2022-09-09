Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBE85B2BED
	for <lists+linux-input@lfdr.de>; Fri,  9 Sep 2022 04:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiIICES (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 22:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiIICEP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 22:04:15 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2059.outbound.protection.outlook.com [40.107.212.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4F19BB7B;
        Thu,  8 Sep 2022 19:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXZmn5YM8tVmYCMSJerSmXH6pOxYTAF0716XANEJLISftXzclVMgys14K0qR0geknebfXXz9lGc438GWqIXNbo5WxQ5DfNAYEW3TI9cP/fKOzum0BznH1jupyHopL47UJ7z5jdjqs0VfcuZeHZr/ygIJ46nT4CuH7RnPwmmiP5PGaZnSb0DNPtpAfkhCZzrPowmx1YoLjCVWZtKO9fYUKJ8ycqs4UCGLANuqDyb3SUvJHQz1o6akMzm0wbsF2XMuWDf72IeGNj6F6Oxy7IJBW9xvYyqVLaSUOtpe2bbYEplDcg0VLLavScSwAhOUIiZisXXY6PdfLkKlRx3TTjn2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYH0piXhbr8pK1+yJtfkaIU7JpoOAwD4cjSlXVhVAOs=;
 b=mS0N20kSHEyti3pFoAIfkTQ4qaw3wKA55qpiGuH9s3M+HXt16gxQdXM40sHGayh2UlOYdE+tO52fY48vkwkh0sWbLOs/uLUMlgdXq0QTNP/yzTWcPqr0jECQIHpMxonwhj945RKBoMz6YUvGw1V38cWu7gkPBFxDIJYXJmrKgeyRr4D1HOPPlPNlVY5EUktoCJoWl76eSDvQy4jOiQ1sG5ug+aTC8DnsCe8woKhyghyrWJOfKw4FcUGpmrY9OWxSQ4MEbam64eJyaC46EUoAJyhwceMsIAnPTrPMI5hQb4Qzbjzc0I+i0LYTJBHWYtIJOYR7D1i0bY0wBKhUuHdUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYH0piXhbr8pK1+yJtfkaIU7JpoOAwD4cjSlXVhVAOs=;
 b=URM/j1Q1eVwhrNJoSwdo4datzVS3ersdPsiHBWaPYUDeV74ciP7GkFCkPMh97vYvVmcwBgH8urq4nwOx3LV5X/l0o4GeuwJZEPtfz17rUJXL6A2VXuM+uNSw++yZV8YD0/xHbxlczzrihxjoHMs1nj6u32MJRYEuL9Qqjic3t30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4015.namprd08.prod.outlook.com
 (2603:10b6:805:22::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 9 Sep
 2022 02:04:11 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Fri, 9 Sep 2022
 02:04:11 +0000
Date:   Thu, 8 Sep 2022 21:04:06 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/11] Input: iqs7222 - drop unused device node references
Message-ID: <20220909020355.GA3306@nixie71>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-2-jeff@labundy.com>
 <Yxpb4QdZej4QnZlo@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxpb4QdZej4QnZlo@google.com>
X-ClientProxiedBy: SA1P222CA0048.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d968e41a-076c-466c-4467-08da92079659
X-MS-TrafficTypeDiagnostic: SN6PR08MB4015:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYA82y+N150jGkgHHq0VkrDxXaRWqpOFjalEXfbZwYXGXQ0zkRL0qBoCMBf6RaLFpphX/to9ashWgH5SWwFHC8yLFl8UXaW5ZMwBbAGapQ4+HrgZtfkGFeozhyg+Rvw0O1jG9k4JTl+Gz+WCerHntm62BoitVChvwjJbMGwlczHhVLStzLHQGc4S/1d3+Bs1HD70wH7X7NEq4eRyA3fEyrK4IGiagIoTyITT2MU3LkJ1PrXBMB0rXC5y/M2pZyDE9A8/5HxOXtQcsm/AcdC0iL9fe0gn1tXfPx/679uGnPc2dzPi9FQlu4IhWawMSh44CQuoHkR1R5JxiSwQM6Chc/55B9FGicQjLZE2IKSoqhdTVaw8j3bHEb1Scst5gJGdhTfuA3hc0xY1S/Vu1WJncVW7QmEhkDmUhMPQyShM7WSwcJhSl67lLdPEzyFvp2dIwleEqtyIi2SHpysH281lhzjrdRt363inqrsT38DHKAwFxJmJnRSbb4svSnisbRylIrQAKb6fIts15DUR4/iE/3NBN62MxE7lLCBYo9NZBdZ8i8j/geARtpnYZX/Uyk25j6AnAXlsWN0YLNe18KMrPyDvEXbMRwBoTWnSrO2L76PId4zMuC4nvJ8NTlTyLVeYgn+uqu+JlR8EoSPGQUuO1ldl+eKg4TYwGRtuGrYYsR0ZvaVCASbaouXW+Ups77MYIl8xfp2xijAeNZoMAxFIh14jNvh0+Eoj8zfd/HnQy3DF5Lp2x2U60mqPYACIAgNH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(39830400003)(396003)(376002)(346002)(136003)(33716001)(38350700002)(38100700002)(86362001)(66476007)(4326008)(478600001)(66556008)(66946007)(8676002)(5660300002)(8936002)(41300700001)(6666004)(52116002)(6486002)(316002)(6916009)(186003)(26005)(33656002)(2906002)(9686003)(6512007)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dOklvokQcqdiFh1TIMCEEHPaAMZeHzrcEo+hUqVC7gPzlfNhOUa8Y/QKmBvA?=
 =?us-ascii?Q?e84K9tJh6YaLMkf5bsBST9+r4SKBIggpbcrmO6ToJe2K9Vc0YqJccFb0Jlt1?=
 =?us-ascii?Q?e7yipEONSP7zN65kRqQFT1k94qjScifBPT/k/K3KnB7MxLl44iiELNUYUBJ9?=
 =?us-ascii?Q?M0rVOgLnhTGa9PWc9pgFhxyP+dxP6VIFFnr8BKh0Iu2pOd/q6lCxd3DAuWGN?=
 =?us-ascii?Q?KrE2h4on8sg8jSMkkdxNK6W7BdFQjZE1Qac3agYQ2juR+ye1+09pwia2uxia?=
 =?us-ascii?Q?G4JVHL+og1y3LHM/EDjmLjXeZEhwVBFFXeP1gWDQk0YTzqYQyj4C3gXmOa9s?=
 =?us-ascii?Q?elwOsY8DQrfRl+FMCbOeZx8htZQ6m3shAusYjhCHWOKdC4JpAcsCvDoA8Yt5?=
 =?us-ascii?Q?m8GQ/3fPN4bLk9Ti/5c/rtrD/L7WqMQdU2JbRcY7Ls9grHUUvl87xHzYmREW?=
 =?us-ascii?Q?3DuUVIWJyJF8iH6K7PI/3UZKCYHTOUARAKhWGAb621zhD/msVO+1XvbrtAai?=
 =?us-ascii?Q?2VWjWbxfAqlmDWtcS/ljtgFbaIgJFxhzFP2QqIVvC+Mn6NXYCv3TlQZ1R3oS?=
 =?us-ascii?Q?cG2sEVK4Q145FIj7p82iOarLdDuDVJmTHILoNW/yjsizsPcDjCXtx0K0S33w?=
 =?us-ascii?Q?v2Q/5yzuVb7QzS5jBn2FnF/LWtO7qTGx38MaKX5M+tMCdv2HuA8xXOAGrzba?=
 =?us-ascii?Q?gFXFt1GGEw+M/sJq06ggEF9s+P+8UfoutFx9FtGr0gcw3F36WAgrgDxrT4uC?=
 =?us-ascii?Q?vD5at2ZWs9S20+WeBOfdTpt9iHIDKv0tQ9gyVOTK+0grCG+SCi6uosMikmu6?=
 =?us-ascii?Q?aTTQ3O+DdXQgDKcJ2MmEJMnNmafzKj0AP4T6ur02nDcpFeIwoWE4WFv0//24?=
 =?us-ascii?Q?zLsun239meSf0TcQlLWpHezBwN+5cx0Ao6kOajVEfdDa3XSLcWr3SryTPLiJ?=
 =?us-ascii?Q?9a5Vx8TowKJDaPl9oKyclqb0Ql3Dw3iYucsjexxOzmxrwI4xC/idMPHWKQPL?=
 =?us-ascii?Q?RilDIXYnhWs+2QJrM8HlI22+XKZWCeEc/is8xhCosqgobwDtLdLxhk4+iigd?=
 =?us-ascii?Q?AYx/VJSnCBb2+PZnBcTmlyZzErkl73DiUV1W3yl2/Too8AbdpUZIDnYQ/x4x?=
 =?us-ascii?Q?gNfafdqxq68vdgcJLYUWlf1guVHBYWCBDNeyiZQAHgvkOwebhsfhNjpqTSyU?=
 =?us-ascii?Q?JVXGjA4vnYFpJmmGeR0gWUdrrCWV2xN4izFbYeM/1IlQ/BCijUIpeMi3990G?=
 =?us-ascii?Q?oDyq6/aGzSg9brsZEjhbN3Gl5UYEX/XjH7g3Zm7ccJsLTHWpa3jow16vs5+P?=
 =?us-ascii?Q?7d11MkejDSpDi7yz6t/zSHFH8t0y9xyA9tI+5e3WqGolU5XEQSnBSbjDNWe/?=
 =?us-ascii?Q?zp5SXtG2O+axTAeE/e2TYdOiO4xG4podLJ9c5bsfVoYnsOJ+cprRxhSlwRa7?=
 =?us-ascii?Q?ldYPeTpIs3DYqFA32nTrur3xmFpnhvO6pABo9LAw8QRBok5dkJrVU8Q6tlA5?=
 =?us-ascii?Q?ghT3O5Ss1VTKca/ePxF0m9nE3qp8xsVIWwr85ql48O54JoItdjjhV6NZwRBT?=
 =?us-ascii?Q?G+zm4vTuxhFmIc9Ge/pqdu0JG7drmS5dRdagxQge?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d968e41a-076c-466c-4467-08da92079659
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 02:04:11.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXtDgoOaipVvHD2wOl6I168ucUu5YOxobwmRGxeaWAd8R67EMJsoT4bbeCFmQJTm0TaNArvLZkituE4dnHD2vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4015
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thank you for taking a look.

On Thu, Sep 08, 2022 at 02:17:21PM -0700, Dmitry Torokhov wrote:
> On Thu, Sep 08, 2022 at 08:15:38AM -0500, Jeff LaBundy wrote:
> > Each call to device/fwnode_get_named_child_node() must be matched
> > with a call to fwnode_handle_put() once the corresponding node is
> > no longer in use. This ensures a reference count remains balanced
> > in the case of dynamic device tree support.
> > 
> > Currently, the driver never calls fwnode_handle_put(). This patch
> > adds the missing calls.
> 
> Hmm, dev_fwnode() however does not do that, which means that
> iqs7222_parse_props() has different refounting, depending on what is
> being fetched. I think we need to start there.

Right, but none of the callers that prompt iqs7222_parse_props() to
use dev_fwnode() follow with fwnode_handle_put().

> 
> Also, maybe we could avoid sprinkling gotos if we moved property reading
> code into helpers?

I like this idea; I will give it a try.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
