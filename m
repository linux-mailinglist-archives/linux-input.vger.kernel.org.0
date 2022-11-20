Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2136315B7
	for <lists+linux-input@lfdr.de>; Sun, 20 Nov 2022 19:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiKTSs2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Nov 2022 13:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKTSs2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Nov 2022 13:48:28 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B26DED0
        for <linux-input@vger.kernel.org>; Sun, 20 Nov 2022 10:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xcrk5kV6ISHlg+DbXUS8k4uGvcR4tKr/2HAIH+aMRtSiTyLjbg+fRw7x4seXtxnWr+JhgMHnKCqKfcCovc5BGUNLsx2VaS8/gaKXFsD/ad2dOrTHeJtt+cUBdETh34TQiw4Kb4YwqLXExEdCUrUYFk2q/xwwgIhTpoaBIXLU4+OFxXi5/+gB3rcJLfQJcL5GloCKy68p43w7wb7FSy/MZ8fnmrLE47yj1wZaYBkogau31Z44v5ixwYU2lHE6ALUZczrH3nyy7KAlC5YiQsSqO5MzZ662OGa2yx61rbBMDsqEjVY81+ydWcJk4/LQMpMlOZ7zHhLsTHNRqoz2E2QXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpumkZN/yhOlmcZoUAJDOvAKVBRyWJS2DIofGEc3ai0=;
 b=S1qmpUIc9coiMnaDJPiEfH+Dw+JVeuMJf+dHKHy0WTZaHywo5unz610N+7eiZ9uOkl0eEDLMsdVEbbXqPqhg9qP+n8Yo11Q8gaOzA+5ZZB4BytBk7kZ5qmnvHorBhkls4LB6C1mK/T1MiufqI+tuvPND/EGXc0GOSYUBZgbwJ9OoF8tzpFyteZraHGREmdpkyYu/r4NqxEEIcsgKJhCqR6CdcHrlhBHNMGeLY5XB5btk239NwdvdixbZXhqFOhlUIAL+0UiOoLN4pFkoWmgjBMt1x3guSuFJAvF8qVREImyuBM2wUJ7qZ/4Rm6nNlPVJ1asT4lXuUeix0iYJp/VV/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpumkZN/yhOlmcZoUAJDOvAKVBRyWJS2DIofGEc3ai0=;
 b=gYiWDXeO/Tlave4cRqctlvUavag4C+ROzNSxfnON1NHtjWhzwgAxt/WV+wxWNRYnSIrY0XbPmI1SeZLHYnvfY9L89sB/KBog+6qqyzVTMsoaFOG7O0CloryKJpg75Qx2r5TcOicHCtoR8G3I1Rk7qhQwUpQMojTC3lWoZyJUln4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BYAPR08MB6007.namprd08.prod.outlook.com
 (2603:10b6:a03:cd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sun, 20 Nov
 2022 18:48:21 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Sun, 20 Nov 2022
 18:48:21 +0000
Date:   Sun, 20 Nov 2022 12:48:19 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Albert Zhou <albert.zhou.50@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] hid: add info to Kconfig
Message-ID: <Y3p2czhlHeg5Rf/l@nixie71>
References: <20221120033456.4332-1-albert.zhou.50@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120033456.4332-1-albert.zhou.50@gmail.com>
X-ClientProxiedBy: SA9PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:20::6) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BYAPR08MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d4324c-8abc-400a-747c-08dacb27cc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nvHLN9pDhqLcZpgMlisN6y07+CsNd+RS++Tso1swBp1IwfXTHazoEzQ3kwNYyzE87vuADBXFFTuqnwPa2voWkV9RsfkDJN130kc/xNbMhc3vgXfg/Kjx/b56792cXAHaQoYHU42IX5sB0wxWDxWzVhoOHFyqmBAYHqIxkGuAZZUEqT/iY05ucYMOBGO9KJNB50XNvvneOS2N9oXS1HF2xsQX/CW9Riuo16H/8Yg33Jn6ymBplO6NkDttfXPojz9T4SPeSsApz2M+np2VsuRhh/hNJQ1ai08SwKlXw0OUigrS5eKtL4Q725ktuR/6xtsWiJLncVuLX0lvv3KxKNy5oRrfK6ZfL9cMorNSvH7MeGeiNV8HpRSdj5k37VIBAEHq2/eLwHt8zHogBd/JEWVeRSGfI6/VSPplJTTckEX/Xn40v+r8SXODODCGJfa9pAA5cbxaG7YvTsMaxhow/6pMsusxSnMCswU8azyY8MrvH9gNzjpQa5r6qgE0KWMOLfeYrfS8THxhhdnmYenp055NgwipS7Nfp/BFGfDBYdPfvm7kZoF9pZqLrUgA3xveD9L9xphJpLUkAlr1q4NkpxwxIPEoEypEFnhcVrdHZp+jXPOVYmPoPaI4xgWm0N+F+Up4SCoa7ngvEXRdaQVpv2d8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(376002)(136003)(396003)(366004)(39830400003)(451199015)(6506007)(316002)(6486002)(6916009)(66946007)(6512007)(9686003)(4326008)(8676002)(66556008)(66476007)(26005)(478600001)(5660300002)(8936002)(83380400001)(2906002)(41300700001)(186003)(33716001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L9C2BdZnlChu/aHEf/3HNsSPnTkLCU/3cHoZAIRd2N3OYQ8rpcn7RBOwXsHa?=
 =?us-ascii?Q?AsnE0CPjq41tvucaYsACuHCLVdE2Lwj5ZlXn6yVRuOt3hbkjIf0F4wSmChbr?=
 =?us-ascii?Q?xIVnFz3DSMhAggZlorfLjVi6DMd6OVSQsq9ElMhsOPKWgiyHvd/ijLFWKnZt?=
 =?us-ascii?Q?fNrJqFC1DwjZBtp/a3UR+io+DGSDn//RRtVLi3ud2zA01HiCc62eqOd8z6uD?=
 =?us-ascii?Q?jR/lpV5UUzsyBv3HELAeSfoOO20qZ+eLLFVG8oLIMPegw0Krj7vlkBkl0cud?=
 =?us-ascii?Q?2XIt/Cg26iYJDco9raO0NQQ3IOM2L1PrEybk25IE3PAa2ldHtLxg/UqXjMnA?=
 =?us-ascii?Q?b6o+nXG4G6wKjtPuzgDjvPHXISe7L19aPPckUfuXDyVH0Eqc/iqJ7UTeAiP2?=
 =?us-ascii?Q?zyfzonND1t7+w8hQg695/Ayd2GosE6/EWJwhRGDl0bnlBC2rZQGrbRfxwRJv?=
 =?us-ascii?Q?ZkrRsN1xSRaNH5xsKGmCvShudUa0Gm9++TqMVqhMOfmcxQYHKRowxpe4JyUk?=
 =?us-ascii?Q?Z8EQgnwxl5cWLcR2eBI4UPadzzokK6PCocm5lkHM7y/CZ2Y4NV3sypCgzQKV?=
 =?us-ascii?Q?pmn4I9waDEog6dKWdMBkDX5spnbmrwM7EhiCL0gdVqi3dO3mh+Ox7x/fj4b7?=
 =?us-ascii?Q?Z8Q8ey/o4t197ybk7CDepyu5Cy53Oe8Hf/tiR1etTp97yoqsSROoiZCzifX3?=
 =?us-ascii?Q?qNuGwQudkLQLtf+O4YZc2hWQJsJt4njoES0OljMYJZmLU1dTltKoYA55SOqx?=
 =?us-ascii?Q?0u5w9YKtrfvrUuukLdcvpN5yn9MB96JHsaFg8R8V+VfHT8KXQ5WdJ7n3CPM7?=
 =?us-ascii?Q?eXQYDhXMsQo2NCAckini+FLpQsp7e4r5ZAJI7nIPm5n5g5Oqrh1ncIPx1ypE?=
 =?us-ascii?Q?UxRjKSpGgdx+AFAFuG+KAG1Di57rhOKlVdCK7p8WCjMzMjOtGutV+e1ytYpV?=
 =?us-ascii?Q?sDl+afVkZKkG46Jp/dV7Ez8cuNVPwcETEVJFnHbtCAaitBI0xsNgum9A5FJ9?=
 =?us-ascii?Q?aS+NvZeekBnMk1KU6Vb4TIK4nfzuNtEQK8RChtO9pdBLCM5c/1hdpH7T4B15?=
 =?us-ascii?Q?c4RzzZwwVYSBSaakpGjuvC15LG1Bas2+IkclAILtl83KuMPmRPu7D9TsrA4x?=
 =?us-ascii?Q?gy8ddHn9u9opvP8maEU53hEI5GAkoXjurTdLelMs84RUOHVP68woT8w5CFFO?=
 =?us-ascii?Q?soLUvkTUR+6xsurevDl9gvSUoeE4vx4DE9AN26UwgpNfPx6GxZj6WaQRWwLF?=
 =?us-ascii?Q?+Z2M+Sop8IvfOF+o5ODnbWgSpt5Q7g1MU8eVD6/TUQvcK7/bnwknIba4Njzp?=
 =?us-ascii?Q?pg61bjLu6wYJlmUg9+HjMzstAC6GLYrRq47s0/A3zAOCTFxwJoRw6Q0RINzX?=
 =?us-ascii?Q?j57/QqllPgkpiqN3Tuwii5eDhX4ZtR+krPUr72nGmZ4dzhP7dPCchB7UjtE4?=
 =?us-ascii?Q?17Nq6SER/e6/laxqbhxdfhFwu7DQ9rsUh6Y5QJYaT43HbX1zT2Eu7vevGoNT?=
 =?us-ascii?Q?fJvQWzR9+6ubZ/fVR8vrYUPxO/XbaZ7aiSjtAkeoeDwmKeAWigSIa47I3MNF?=
 =?us-ascii?Q?MywWP/hf3DcdTC86ISSZOsdI+kg2BmPg9t74zUGW?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d4324c-8abc-400a-747c-08dacb27cc0e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 18:48:21.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KzQWZa1pI7kanvdkpraQGxFsUQo/F28e2w0LjluvGiL9fOI2/N6vTDsfPRKEt7ZJBRLfbSmINdPDviwPGfKQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6007
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Albert,

On Sun, Nov 20, 2022 at 02:34:56PM +1100, Albert Zhou wrote:
> Nowadays many laptops use multitouch for their touchpads. This is now
> indicated in the help message for HID_MULTITOUCH in the Kconfig.
> 
> Signed-off-by: Albert Zhou <albert.zhou.50@gmail.com>
> ---
>  drivers/hid/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 185a077d59cd..86f65258a912 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -697,7 +697,8 @@ config HID_MONTEREY
>  config HID_MULTITOUCH
>  	tristate "HID Multitouch panels"
>  	help
> -	  Generic support for HID multitouch panels.
> +	  Generic support for HID multitouch panels. Many newer laptops (like
> +	  the Dell XPS 13 9360) use multitouch for their touchpads.

This is just my opinion, but the intent is to describe what
the feature does, not make claims about what products might
happen to use it as of today.

Furthermore, "newer" is relative. This statement won't have
the same meaning years from now. I think the description is
fine as-is.

>  
>  	  Say Y here if you have one of the following devices:
>  	  - 3M PCT touch screens
> 
> base-commit: fe24a97cf2543e8832e7a2124802e5c32aac05aa
> -- 
> 2.34.1
> 

Kind regards,
Jeff LaBundy
