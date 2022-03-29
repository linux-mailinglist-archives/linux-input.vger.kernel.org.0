Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292A94EA447
	for <lists+linux-input@lfdr.de>; Tue, 29 Mar 2022 02:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbiC2AoR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Mar 2022 20:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbiC2AoR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Mar 2022 20:44:17 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B93237FC4
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 17:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9yBYVgfT/RzsHcp481hC6oh0eJ/XQQckGhXrWwo3N9SP0uNgRCYjctxyJJBz+ni7XJxQNZZjgrb30DyajkmAqw/Xx/rmK+XapIZWtM6u0Ax12L5DebqDTHeT9XWR3yJutLF4j/h/GA+IcbCKnQ/ohu1aWq/O1pXR3QFgCDr33Q7EQWcZ6HH5/zI7uZjc9iBsJWcXgaNLjbI742B+wUF5k6nF55kHq4/5O28PqJLrG7WIBuASVz6BN1dKz/eGHSVJukbtPCFUp0JBBfHA7Vz1Kpu0Q8HOUR0jBjfla9SDPYvRf2SkiSSvouY0KTkf5Jn4UtYBcgLSSU7T5aTOZAVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aZt6WZmxvbS79prY3o18n+kfrdftre7d0HwaTnMmR8=;
 b=B6vECQvf/Xh9TTY/EJBhKUnFYwRyRsEwg0LV1rxGqj3h05QRUtWLauv1InowapqN+43GufqwK8SZEylf8pgxKF//63GM4aYHldXHNAgQ6uyHwyeyxsKEEfjnf4emQLuw7Txo2EO0l0bO3Fkh+BqvbGxGIGnH1MdUF3cyQxWLPDyLlGSl8dFrk/41DYuhxSxS51fzD1dXU5HG/0nSRBRT6YVVsV4BD5bBC8azbjfMl8Za2JcmO6o8Sy9q+oE8RjWxjy/zIeuYAfvoSfteD9rp6zUKKlhei9zHRl0Kc/sB0J3snqhw8r4XB3YnomGhC/HU1CHB81XBCeg8UghObt+LlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aZt6WZmxvbS79prY3o18n+kfrdftre7d0HwaTnMmR8=;
 b=M+hSf7nfYfrSsbn6eRYN3WzxmO4XevKHGzIa8BEmUJ+dZft426wZ5cuBbnkUsASIUx2XSBXTvG+a8jTwcMX5UXpgPZehnFduAamZrIOqKACfCeTFvNiZfJETfaNVxCTc6bIqtVMNBHESI53FJjk7f+cD9H18ydeEOMnNGzO0OLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by MN2PR08MB5949.namprd08.prod.outlook.com (2603:10b6:208:11a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 00:42:31 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 00:42:31 +0000
Date:   Mon, 28 Mar 2022 19:42:25 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     "Liberado, Selso" <selso.liberado@guerbet.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: touchscreen event not rescaling to display resolution
Message-ID: <20220329004225.GA64746@nixie71>
References: <DU0PR01MB8928F41059ACB5940834D60D911D9@DU0PR01MB8928.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR01MB8928F41059ACB5940834D60D911D9@DU0PR01MB8928.eurprd01.prod.exchangelabs.com>
X-ClientProxiedBy: SN4PR0501CA0083.namprd05.prod.outlook.com
 (2603:10b6:803:22::21) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db4a5936-ad51-443b-5f5e-08da111d01e8
X-MS-TrafficTypeDiagnostic: MN2PR08MB5949:EE_
X-Microsoft-Antispam-PRVS: <MN2PR08MB59495884115801575DF9BBE4D31E9@MN2PR08MB5949.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUwH6H6NlemYR7JboOjjKljeratW7ZZG3aG8w90SMKeGioI707JHM+ikniKqHUJa2TSBTm3OpMy+EGVByFhs7jW/cH2eTPY9pg1XlwPmxRLy+S3lV9nfViSLNPgiieiP8tRTXx+1nAdCCYWm6UhtThO6raFIQsezYAHps0qHBvW4paVSfRKw0DOxsFrmOIY6mhGzuZ8GP0tLJplV1k2leLssVIsz3wnR8zM6/T0RAqSeU5AvzKsOQvkhUuGjTfPIkVFcGNrDuT6i0CsBT7/l7dpYx7VDYpPPXFzWnHObOQnI+x9dhZ1AcCwNvkUvM4YBwwFYUiT/+ROO5WiG/yuCV6gXSCB9Q5KYZ9SKODGaB55e30QpSZLqKsWRAucdP/0U7uiPEbWZSSHwnm//ZEyb5TtanRaowVzlPrYmuTUE1t5SrrIMpkP2D4rvSA+q7wFylbGc5bBX07NhrSOPJfsiUXCy6kp7b6KuZyPwdqmxwXDQC2TLBoGAOqkhT7YLV5f9int1lnyUHq7MzaLB49bbXim11cnGIRiho8u/UqwqDuBv5Otsb1Xn/PAXvZFCUSmw2uFUj4FR7qYanzpDQ5YQplgcCBAltfn2lzZLD+ogmcOYML8ZHL0EGhoqh5ffOajYfffPm7VzLsJjFgGwefZUw2D5Yyi/+YMhAmLDnwTs3WGAC9FOD9qr/tgzpcJ/4nqjLxsUQSsxoApcM9mmGgh98Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(39830400003)(396003)(366004)(376002)(136003)(346002)(33656002)(1076003)(186003)(8936002)(8676002)(66556008)(66476007)(26005)(66946007)(4326008)(316002)(6916009)(33716001)(508600001)(6666004)(2906002)(5660300002)(6506007)(52116002)(86362001)(6486002)(38350700002)(6512007)(9686003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B4iIT3QqU+6s2UP+PdRdKEB+4jhGs/oAwsJqq5htM1iVLVL4d/GT9KHgZyaA?=
 =?us-ascii?Q?AKkIl11dLaa+FjtBUY/Yl1oox4k5lhFK1hX/l8ukK8lgvDeWgKGGn3Q9evxW?=
 =?us-ascii?Q?bBgfiNxerK/ATjswOi1aTcduPxvgHt4cHcn/KlyYOIx9ZIf584xHqe9C7n/b?=
 =?us-ascii?Q?Ajy4GwZ8agChWo1Tj0rG49n6DnzxHKRKjdY6w0O3/HXVOcH1sA82WOu346rD?=
 =?us-ascii?Q?EEZq3HEFdwvg8bKPSlehqhwqX64djfrSxd3bW2ITYa5y6zWxkUXK1pYwl1Y/?=
 =?us-ascii?Q?vTkOLvVQt0t7999FW5u7NpFutu09VYyryUDX/RUOyAHeGnCUSpIGxPlmcPHt?=
 =?us-ascii?Q?v986bl6enMOaiKhc85WxvuvHhX5RZtTFy8M6EKACkF7ge/D3DNizfUyzlko6?=
 =?us-ascii?Q?Ar3xvdSSlew4iaWqAroJ2RKGbE+L12CHgpNpWAwM5mL801AibeJuOUvUuZwi?=
 =?us-ascii?Q?r72ZCRpx9xi3LjgiURSSNKzyU7xQ0o4EqrqQ1ajbfe5CLSJslnBcJG3um9Uh?=
 =?us-ascii?Q?shafOLpAjHJBO/qUDrvdHn9bInlgtxe1H4awueugc/NOqzfOg64wiQLpDtGw?=
 =?us-ascii?Q?ZzHRS7M2LJHTxf29OkWUBL1iDqEMdeG3QHNjbgdIDCcjxXW3aSlEAg8TErg2?=
 =?us-ascii?Q?Xya/tY/rULjEz8T/voriIWr2MHrd+c+G1CAIRMDjduGIt4gbbF8QDXw9Wy2J?=
 =?us-ascii?Q?Am8EC9yAPZCeKatxNrLZYlsSSb30kax+n8cUNnSBG/wlHVs3KPXgYjx3W7AS?=
 =?us-ascii?Q?ww6/a204nrOHVHRyo7LMsfC7M8mGpgGikZhdjOvm9T/EOsLQOpdrg+ZecKGD?=
 =?us-ascii?Q?pLSt6RjcrhXqkTxBacC+tWSsfAh8CQIeCwS0K6EzkGWfCVCxQA305FZs/P25?=
 =?us-ascii?Q?r+vRyzfccNnugeAXAA94Gd2hsD9ERRqmnjI1psw87rD6h733bD9sM6eupPht?=
 =?us-ascii?Q?Y+RYMgVoRgETSSjcRtjsQumwSIKmxHakG8z0cjB6k/AsNdmZyrMBIW0+qVvy?=
 =?us-ascii?Q?DjiEQeFWfTQr58Rqj1clRhf+Vhq4is3X3iJW68dfydzJ3mxnyA5HRQO0uE5k?=
 =?us-ascii?Q?wFrfFtFwE06inpivKP1mCGC9lrRuX/OIRt5B9vgKF387epe2kwMIw2L3ri8Q?=
 =?us-ascii?Q?8u16K0mJDmIvWm6uy6+WUNlIWdtyvkWhD9h4BoinIYICGV0os1erPwuLA3ot?=
 =?us-ascii?Q?odThpxRR7BLf4mKBefvG6a7u0V0wqUUo8/dy4vHtrkb4gBIW8XHwHxXdlwSl?=
 =?us-ascii?Q?QLopG9AzNb3tpVqQoYP9KEZ4ZwTxoiuVv1DL77Gb68WmnqB8A1cNkaqS6zhu?=
 =?us-ascii?Q?FQ2ceekdbHd2rnCj2mM8B/5lgAd8e3wUfP/oyNHM7g8s4omEpgtEplYWznbp?=
 =?us-ascii?Q?hsGggADiJSuq/iOmukOPmTt4aNxNEzXzB2hWVYzpSTgkvlDbzrP+0ycPHDCT?=
 =?us-ascii?Q?lvA71ac7LXoUXmnoquAY6kez6FfbZ3vUUT0oBq7WyfJpK2y/X+jo9OHLojWx?=
 =?us-ascii?Q?oND2aTEUvJBtZuNzQWJ6Q/oTPYz9NkfEfF7bvO5u0nbxAtCL1TFlP6se+Ogm?=
 =?us-ascii?Q?MlgAihROcdAYoLShLVsLDD06G1PnhwUHHizAxHWLMw2LQTmwSzMJ4vxYcVbl?=
 =?us-ascii?Q?6CDf5W0ohMcN9ZV48fHWCkKJUCh7v6s5F5zpL7JXxDx1Nqsqpkv9655/cAo6?=
 =?us-ascii?Q?UAhxqoRHrVYe6pYuWVtKI0j504R2HlA2kM7VEp92KzmoYutrQPx8KeMrktcW?=
 =?us-ascii?Q?LwuOv/qQMg=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4a5936-ad51-443b-5f5e-08da111d01e8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 00:42:31.1638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7B1WW8CbvPrt+03NYs1gqvh+RPTcR4f2xOU6htdxugHe9Sm767S027eQTRZ4obAmGu1TQi5Ghu4ReIqdKaebXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5949
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Selso,

On Mon, Mar 28, 2022 at 08:52:33AM +0000, Liberado, Selso wrote:
> Hello,
> 
> We have a 120x800 display with a touchscreen panel embedding the Ilitek 2511 chip.
> Kernel version is 5.14.85
> We selected the compatible driver building ili210x.c (there are specific function for our chip family).
> 
> We modified the dtb file as follow, expecting the touchscreen driver would rescale his coords with the display dimensions.
> 
> /* Capacitive touch controller */
> touchscreen@41{
> compatible = "ilitek,ili251x";
> reg = <0x41>;
> interrupt-parent = <&gpio5>;
> interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
> touchscreen-min-x = <0>;
> touchscreen-min-y = <0>;
> touchscreen-size-x = <1280>;
> touchscreen-size-y = <800>;
> };
> 
> When testing with evtest, the driver always returns values that are in the chip resolution range (about 16000).
> A dirty patch which applies proportional correction is working, meaning this is not about inverted axis or swap issue.
> We tried the Weston calibration tool and that works.
> 
> The 4 latest parameters are processed in a common file input/touchscreen.c. We don't see where those properties are reused, though.
> Do we use this input properties correctly ? Is an input driver expected to do rescale ?
> We worked with focaltech and "DT "Polytouch" chips and never needed to apply applicative correction.
> 
> Best regards,
> 
> 
> 

This is expected behavior; the touchscreen helpers merely save each
driver the trouble of parsing common properties. They do not do any
processing outside of axis swapping or inversion.

Some drivers give the appearance of scaling by writing max_x/y back
to resolution registers in the hardware, if they are available. The
ili210x driver does not appear to do this.

Kind regards,
Jeff LaBundy
