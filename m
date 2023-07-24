Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C10576034C
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 01:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjGXXr0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jul 2023 19:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGXXrZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jul 2023 19:47:25 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740681712
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 16:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3H2jY7OBDJ9eZIa/N+10G2Ul4kxU4eJXo0jdLwWcrRxyJmr4Cke/auL3W6lDkMQTlfQCNuyb07dZJhJyEFNzfm6HJ86K6WaKodkEc5PClyGFP2Wp+T5DnTBmHI9T7QBbW/iVGm0YvD/yHLgKYcEX+EaQJXXAdIZO3CzyiH6uBdZn/JjYmZyqrVEhRLUnfzT5Q7QO1+xNwMka+xCpHlquP84SoQi1PdtpO+p/1X8ad6pWfy2Kf3r1MXUY7PoM8VET04nYuxZeScHuutbVeYad3FJxthpfyglTXrsfpJHqx9BhTf9y8Eq8OPJnlkx43TZDIlgIKjWa3l4Lm3oOujr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9FoNwNTh8kiBVHXlQ/jNy6VetEHDIcLIXU7zrxkmqk=;
 b=hNz8NebsHNLc3D2//mTjOZ4zv1z/3b+4jMzoyiOaYy+TUJ4anwD2VOnTeY3vnyHMvw3BbSOpmfQ79ZTbuiG5Dy/hgFzJF4BhjzghSl/p4/r0W41SV5PRvXYCbblEe4s89EBE0wmLY4PmKiiqQS8obibP99+/EbeWTx9ROtqPj5wf4ds9cPxzS7CAXSUj4L+8okGFdHyp0R1taVwkb5Sc73Rlbrc09f0K79FMefxjYUrtxPQA301ItqoGg4F4EFNMl3dIhL/eTpnAnvvvtvz4oND2Bqb4Ssn29ETd+a4TF/SFI3AoSypAUFkLgQs04oaTIS6A/k+nriPbzxM2LiZv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9FoNwNTh8kiBVHXlQ/jNy6VetEHDIcLIXU7zrxkmqk=;
 b=iMVYi3GH77/EUg0U/CRl2x2gjp4gG9170NkEQEQUwf6fGlS4Zra/JERfXYbuHM+iI2Sv5MoqA2a0SYyBV9ThdLKcWJZmax5mhVev9gjfofn3EGSMaNxcrlbdUQ8ydjNTIATM3Y3g3NFI/u62959LGZh/Fu0OcCvpUPNqFtvJjm5YwJaW6pQGCgZOKBOp8nWlijvuJ0CEzAzDAIYCwvqSKqByiFM8CsvomwUegbpANPoiVdeCPPBeLc/Gs7TtZm/23pekwLSG145d01qcd7Gx1eV+bow3fM7lWgXTipKes6COpR5cSVp5UGWJaEIX9VGCSpwlpFXMDQm1EVx9wO1rQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by CY8PR12MB7539.namprd12.prod.outlook.com (2603:10b6:930:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 23:47:22 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::44c8:5037:8201:a933]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::44c8:5037:8201:a933%4]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 23:47:22 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     HP Dev <hphyperxdev@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Chris Toledanes <chris.toledanes@hp.com>,
        Carl Ng <carl.ng@hp.com>, Max Nguyen <maxwell.nguyen@hp.com>
Subject: Re: [PATCH V2] Input: xpad - Add HyperX Clutch Gladiate Support
References: <20230724224903.146092-1-hphyperxdev@gmail.com>
Date:   Mon, 24 Jul 2023 16:47:14 -0700
In-Reply-To: <20230724224903.146092-1-hphyperxdev@gmail.com> (HP Dev's message
        of "Mon, 24 Jul 2023 15:49:05 -0700")
Message-ID: <87o7k027p9.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|CY8PR12MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4527a8-b4f6-4c96-a7b5-08db8ca052e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sMS/hwApF68FZZS761CQzDbWkB9fYGgx0aRlozT7Z/lCPfswovPNpM5qAi6Vf+z8KrY1GVTTfuMN/8eI0W8JeztAkkGooA16McmI3hypGHf2jubjFyRhfMlrXI16Yc1XOjNsJjo0SyCyPSEnw81RWwf0D0U2/QulNjd3XN2bCBH11Nc2QawKpbtl99+8/x9JhTNsJPaGX/qVzHCpS3rYzXEWCBT+0yFajBumXBsC5eYRL9G3j38dcZkz5lYZm2/a1BgEcLJoQaxoplTX/8K8uz+5Wm8EDBzzik65bicp5v9PBnHkMCsJD3+RroHvlkp9Ivhp19/GzETmFokMLOPz5rUcCa5SUfB/wD84AmavszymGVgebY0Odf3cJbOfmYTC9bkrN9jMIJd1UUHLE/MJdJOcTZd90UobvcYIh4T6PvfuZGU1C5dFbZKdcVNts89UwcIqV7Wm+0GGakg/pFEfaWusoHjJbacLFdDsNYJL+6Y2YCOgzbqs93+IFFgg3F3Gsxt1jCmvtXFpq2qLzeI5cIl18JjxHdn3rr5vIqS+6fJTgsaR7KWC20iqCkuP+Gik
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6512007)(38100700002)(6506007)(2616005)(186003)(26005)(5660300002)(8936002)(8676002)(41300700001)(2906002)(66556008)(36756003)(6486002)(6666004)(45080400002)(66946007)(6916009)(66476007)(4326008)(316002)(54906003)(478600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?46Ywe+c+1Y1LRKxCPIXA3s4np/6LBHt//JJVvlmGvR7Y8my4Xja2UuuWd4ip?=
 =?us-ascii?Q?5izJ8VXsiytW9f/L+GcwQH5Rz+pPDufVKrIO8g4clB0jJzSX4OBBqTuei8JG?=
 =?us-ascii?Q?RFYM3PfvP0knZBnqEai/L7d4Ix79ZGYCpo6SwYEt8ZXlr9d10jrzz8khqccA?=
 =?us-ascii?Q?PZrFazqBHMD6LvWqLJZReT2NwVL6Mr9blibSPnl9ElwqcH4tsYJbjf0vvw40?=
 =?us-ascii?Q?mqIa2IAMJwRx5ICTu0G1rSVqMYb9zAuHDjfYNynzvZ/qyZ8DLzy403WGB50W?=
 =?us-ascii?Q?YhBCengGHnCQqAXYdG5d8YzD4v/t6ttS/1L31tuyD1pSA0OwdASPRpgCx7Ak?=
 =?us-ascii?Q?2n4XNUv+9hyNqjjfIaHew645odexAjTBPPNBtBJ/Ig483OnW6XmRyyIz3Ry6?=
 =?us-ascii?Q?BesKfTH2xckxin6FBIx+h6RVCR6D8Pv0JgxW64nQSQZaDlXzCVpcAIJDyEKh?=
 =?us-ascii?Q?C/8q9ZYtIMiPWS+XiKrVDSAF1ahj1BuSeUyzsUjrlqiTRO84hGpZ+Taub2dj?=
 =?us-ascii?Q?dL39J0v4vJI5VggKiuNjk5vuAHG5FK/Atmn/V0HZN58m9M8DXOwt1NxKn7mH?=
 =?us-ascii?Q?JdxjcixhYF/Gd/RavQlF4uMfvB4VsOBMA6DZ9epsgInhkpGMm9o/Zx2Ob57u?=
 =?us-ascii?Q?UcoxgDGKvwmnsljlLp/TjamV19F+TwK9Bl44Yh+kUPSatjGaO/7WjcoNl2Vh?=
 =?us-ascii?Q?GJKPxZOODdA+PjMfHyQm5MHhVtvn8HzDJvcgt+/MHfQexniPQSxmThTMFOaO?=
 =?us-ascii?Q?NuZYxG/VFRYictLzST3fyAq53HFt+inIXxHOvQDNp2TfkPuLxG0wRII9POhs?=
 =?us-ascii?Q?er17U3NLivPkiDJOEtlTBRv6FYHOtESaPHdX+TIVfeo4XbFrwRgIYygwTx9E?=
 =?us-ascii?Q?GdMEH956fqKUpYf6arcvfMNFo2lVRAW+WNQVAWvXmsxXGUxMDjcx9tQiwqoD?=
 =?us-ascii?Q?ALfEDJbiYSpXU+v1tjmjlGlhdrH5Bp4WRRWv9E1/Yw/e2G/CX2u9u3Mu0SmP?=
 =?us-ascii?Q?wUmT2kQ1ls31CTmXVPKt4o6levlvpXrkq9c81ns7cQWZEIF4pRc7alAqPwq8?=
 =?us-ascii?Q?J934apB7FxyWHYIA+DWCcRnwhID04gk0iXaWfacbyYtnP83UosYQJmiisMAA?=
 =?us-ascii?Q?dG0He1j4zpIATaDU7pcJYw3NUsw9yog4lOi+3aLuDvNhSkIvQo3DJ7G7Nx7N?=
 =?us-ascii?Q?aFqwGCSr17Wu7mWF1BcbX14kMjsIm0jK9ku3eqwYHR8kvw7C02jnL9gjm2fV?=
 =?us-ascii?Q?aI35KqmhYe6Qc+S5mWO1sVY7tz+/q9Kqfj0veMyMRERXlFPrRojgFkjdip8M?=
 =?us-ascii?Q?HyawpBKxhpAt2/hem1bIxshe4NJID28Rmf9e/s59qz5eBCKKRdWF4v+rdYNe?=
 =?us-ascii?Q?KW5Yh0vu+uFOWkKsbYih0irQowb9UJEZm2s6ymNifYXrX23wMIFKsbJY+TPS?=
 =?us-ascii?Q?xmyjiW5go4UDxRlG/TLbVwXqDwjT86rJv+MHsqCpsjagL5MVXZL6DwWRUTXV?=
 =?us-ascii?Q?+2fEd/s3dhArPv8QBzN8VTSYGR8M83MLlUnny68lGF/SdOEJIqs4UfDZfWlo?=
 =?us-ascii?Q?8ci34TPf+r5RkLObWzL5jQmWx4b9JW2D86uoOvTgJt31xkRd4w16h6KNerHg?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4527a8-b4f6-4c96-a7b5-08db8ca052e5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 23:47:21.8049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv75UjdaNa+NnPmqMQXq5M7pBq+HVBpzDp+iGLFziMwmkLQxXE4One1xU6dH4j62ZhCtmoPGOqDhYTvCbQW3gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7539
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 24 Jul, 2023 15:49:05 -0700 HP Dev <hphyperxdev@gmail.com> wrote:
> Add HyperX controller support to xpad_device and xpad_table.
>
> Suggested-by: Chris Toledanes <chris.toledanes@hp.com>
> Reviewed-by: Carl Ng <carl.ng@hp.com>
> Signed-off-by: Max Nguyen <maxwell.nguyen@hp.com>
> ---
> V1 -> V2: Remove Xbox 360 vendor-specific class support.

Thanks for making this change. I think it makes sense. I think if we
want to have universal support for probing both Xbox 360 and Xbox One
controller devices for a single vendorId in the xpad driver, the
XPAD_XBOX360_VENDOR and XPAD_XBOXONE_VENDOR macros would be consolidated
(one macro that instantiates support for both protocols). Since no
HyperX controller for supporting Xbox 360 exists currently, I do not
think it makes sense to introduce XPAD_XBOX360_VENDOR vendor-specific
class matching for the HyperX vendorId in this patch (what v2 resolves).

>
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index cdb193317c3b..1e377d040c43 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -130,6 +130,7 @@ static const struct xpad_device {
>  	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>  	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>  	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
> +	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
>  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
> @@ -457,6 +458,7 @@ static const struct usb_device_id xpad_table[] = {
>  	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
>  	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
>  	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
> +	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */

Reviewed-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
