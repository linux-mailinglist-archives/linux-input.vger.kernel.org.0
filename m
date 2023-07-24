Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35E4B75FCD7
	for <lists+linux-input@lfdr.de>; Mon, 24 Jul 2023 19:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjGXRCS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jul 2023 13:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjGXRCR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jul 2023 13:02:17 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A848E54
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 10:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD+QYN3HLbcRz6umG29wYvKbYnmuFjkTnwzuY7B7di6ejLGu2r1NFW6fZOzPM7FrevTJobl6aDd7+8gdEPOumcw+S73g4jvrH4j579v1/m53o7Y9e+Gy4xNCZYdJ3fBiNvqSznd+sJXVVHjow6Tx3E//VLYaIrjJDOu23Thuo2AoU3+5TZ5lg1uw9zTfLHZGf+bJhXuJiNvI2CJ/vUhLK7rBz1BhDULAKsa71eg5EVNK9qcDIO7cI3x4StBZLHdU+u8K93cxkJN2hYFIljVgTb4XfWB7F4kzbtaKRo0+XvDlTWoD7cQbpgqRl/dpBHZYEMkRAzP6h5a0I6LANca6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JifbDVPgq6xy2dC9+jg2JhDXKHSVkn21KMqANtuIJ4I=;
 b=gM2HBJtjWmpbe0JOcg3QbX5oIBb08+x7ytfpNCNaiiQfeQ2cAVwfi2glTfKfqeK7l+9krTGdIhb+kGfcuyE8h4YJv6yDeb5h64pgYIgQ0zl2O+sd1UM8JD+gWHhyXXTUjgEXYTvYkHyRdW9y2bK2V2cS9iw9kkiKb1L+ILo5uZUp1lC0KC1ARE8UZwz7ewDn/J509lPb5MDjAw23EbNWeD9Dt5RFaw6NeWPoSbhCIRybzuIVz4/gDCM/oSLY1xl8X7L4hbmkgXhbdZBnMseu062/+RxDf8keMfOHEkVyCm2rsD17OxO4jRpa87Eh+mDF4ZxkfavxAEQYpDIacbFVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JifbDVPgq6xy2dC9+jg2JhDXKHSVkn21KMqANtuIJ4I=;
 b=lhEVi/Uu7riEUR/vs3Jujcux1JA9ASfdiY7vaporiCK/cjEDl5ibycf9siwwEGjAt5L3X5f2CVcjYFdvLdYqpHSkkjqS98Wk2/b+CiqBPwpaFZeIxi5K+ua2Rz5dSk/8RAXCqqJEpKzNtzhygypj/WsyNOl2G/So/LG8DZpU4z6OKl6AurT5xGpxda/gHz4Vh5S+ZG4ICxLT53HwsDOHh3KMkT2raYqKt2LHqNdBgJs9uAzfYiWeRG6GuVRVoTIZ9xa1gYDYCT+3FaoUo8IF3g87Qlt6wJghidYcDF52ETQY20/Isw2WlEVWgZtFRyaDjmcHX7TdkLzUm2LlNs2lng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN7PR12MB2740.namprd12.prod.outlook.com (2603:10b6:408:23::16)
 by SJ1PR12MB6169.namprd12.prod.outlook.com (2603:10b6:a03:45c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 17:02:13 +0000
Received: from BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::7017:95a8:45ae:3b81]) by BN7PR12MB2740.namprd12.prod.outlook.com
 ([fe80::7017:95a8:45ae:3b81%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:02:13 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     "Nguyen, Max" <maxwell.nguyen@hyperx.com>
Cc:     HP Dev <hphyperxdev@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "TOLEDANES, CHRIS" <chris.toledanes@hp.com>,
        "Ng, Carl" <carl.ng@hp.com>
Subject: Re: [PATCH] Input: xpad - Add HyperX Clutch Gladiate support
References: <20230722010532.120280-1-hphyperxdev@gmail.com>
        <87a5vo3bpe.fsf@nvidia.com>
        <MW4PR84MB178025C2FCDAE078762D0CCAEB02A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
Date:   Mon, 24 Jul 2023 10:02:01 -0700
In-Reply-To: <MW4PR84MB178025C2FCDAE078762D0CCAEB02A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
        (Max Nguyen's message of "Mon, 24 Jul 2023 16:40:14 +0000")
Message-ID: <87sf9d1bw6.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To BN7PR12MB2740.namprd12.prod.outlook.com
 (2603:10b6:408:23::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR12MB2740:EE_|SJ1PR12MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ff7f40-7c58-40c2-78bc-08db8c67b9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UwA/gWERzDh+qnb6obtG1ZXB4HpSCS6l6ivCChYwAfo2aPMyav0fqaT5XZR/e6BJCcinpAq4L81krY8lTEbIoVZFwIpaUuIEYeSEpHvGgPk20BHkO3KF1SKETjwp+WwwT2ZvI7NAbUkBoUKfA9eoGhocZwTAOFEdCb0nGMd3V9bQm28PR5zqAG+CUkj2TzbmqV4yZPQH1z9yTlMIxk9QRZx7fpTSepKYjrih+cflU8mRQWXIsAOJYPqJoG2XPeidUIYxN8z5WES5m+l2DzwKOuxEZwuGZ6iwoyvDuPz+QJfliJAhQ6hkbXAzwUZLePBQib445AzaHKwjhbR79mepgbYGzm9ft4Ek+xvfsV1kZSfIHjIkn+aR1pDZRhqAEFZyEoVekE7AVX96LKXFIsvy+GA+jKTefuByxhvuGPkJE2H9DJDF3kNeXB0PZ5eE4dDS7njEONjaPrNJZLzwQYaKKRf2X2Vma0bT7ucllUZ7P7kWzT9Fy/SY+gAEKFgavtB8/xXRR5HwUXjKFyfYJ6eAK/+lf6QfeumiteqNoUVWzpClUNFWKgCospdH8FVLzXs0Q5OEVaCXQNvMKzye1u0iOi8DYanpeNytpxkX0uHFcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2740.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(86362001)(38100700002)(66556008)(66476007)(4326008)(478600001)(6916009)(316002)(41300700001)(5660300002)(54906003)(8936002)(8676002)(6512007)(966005)(6486002)(6666004)(2906002)(186003)(45080400002)(26005)(6506007)(66946007)(36756003)(53546011)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YN0/a79+qELEQwAz4a9I3IkK39Zi3ECtenTG3WYFFTguBRPLySM+Br9DMa/n?=
 =?us-ascii?Q?KblpS+PvJz1E99MeXq+TSHeDUYUHsWS6Br1yLN0B/0IPdVFv3d3KjBT7rngu?=
 =?us-ascii?Q?rYYm/pX7tHxjuToUZNT2YPwtDuG/wWVJLRmiLQt65yOQVkleoBSjoTRDK8LG?=
 =?us-ascii?Q?NYGjkpWbFC5WHBMUpTx/azv7YoYxfEn+/ctYLf1n5MR6XZLcrImJLsShUDbY?=
 =?us-ascii?Q?cB2tVadFwClMVNXCQC8NDGFRLFqoTAHlFz0rjpcyjRYkFkFnsKRdlP4WdHE+?=
 =?us-ascii?Q?0c5oWNPW85aB9Kvj2dFiOfJBYb8w43mpxyJakLbcZD0seCmD0ygi5jUkGI7L?=
 =?us-ascii?Q?Pq40Xyx+M+VOqqkOb0eUnxt72oH55Pj5gkLNrDaRajlaXMP53C0OGvd25Ewa?=
 =?us-ascii?Q?agvu4zcUvS6vkCbTjQ0zSSZGRezwekaDFAbMlIBdHeA1HXiSrBC049LfT2/3?=
 =?us-ascii?Q?OGIsF5OUfXFDqkQtkRk8tuHUkitNKiBhDsMo7c6AARTkAsd8kY/zi0PpPd18?=
 =?us-ascii?Q?51dCPMkdSArMoM5oKnlYdDPTI0HDHRrPbdUTD+VWtXyh0lwBby03xkddJczx?=
 =?us-ascii?Q?k0zsGbyv3YLyhKsIEqnNRGUt+s75wVrZOihtsLAPpSc2xSXU96sXhxP/lVTB?=
 =?us-ascii?Q?jf2wNw1ZgLmLi5NPa/gpYJg2MzxddvfSaRZCDcYZCkNz/ndU+4eAXWaZcuEz?=
 =?us-ascii?Q?nqnMB4TIK6oqH+lmlMZNVauG6Q4067JUGakAODb2UVnKp2o8hbebAkJjTCJi?=
 =?us-ascii?Q?U/NStgw6Zj+QrM1Ce+QiTDalsttsO00VyQja+J9MpEutT2UxN3ScqwNIskJg?=
 =?us-ascii?Q?0cQ9Qo0GPAbR+nDad5IDzvAEDZDy+LLq6Eg9PvQpW+oKYFuhrhvoRFWXxQhH?=
 =?us-ascii?Q?SXBQ7Rp/AY3QwptE9QpTrwSOZfCc7NEdJHUUutFoNUjlLovuAX687zxFTRlQ?=
 =?us-ascii?Q?PWtH3dUYsF+IwJy/AzJHRMFfSWGg0eYfF7kv0imGKhw5n68biIybiNnUVx3Z?=
 =?us-ascii?Q?Yn93bA65AlXtwsfINkABOtst2RVql5CmgXF97p+XOAz5pl7+sz/Fpv8ueLjo?=
 =?us-ascii?Q?U2npqV4YbsXtwNcZFWYX/eIPiahoh2uGqWii94jEaoJR83S7IWcDwJTbJ//O?=
 =?us-ascii?Q?W40HvErVp5LVntkqNJAWVWwRTdzX8A7UbYnY85PFXnVMTJzW6D7waM74bVKg?=
 =?us-ascii?Q?b3DYuBjHvY5LnxtBZMQDGkLUPAMh02hYYoIQfUQT2vaHk7dLjzF3Rdh+NAuv?=
 =?us-ascii?Q?AiQg38GaqtmIZRXoK9hWQNZFC+vGW8hjH1vAud5ZKt5jNy6l5B95lhhBV3nZ?=
 =?us-ascii?Q?l/vopQhwHIGsjdll2F7FOtCC+Lb5pX4FBmkyYBkVQlE7faH3byqIGNDwSN6f?=
 =?us-ascii?Q?5ImghOWqWiFlE28h0HdruMTUoVI8rbybGkZbKEVeqS3F/AxzgKp72jdgjhRZ?=
 =?us-ascii?Q?AYruT55G8AYVUuDW6yuDGN3KOWMDqIxL3mQ1cmp+q+Eju27rV5JwHuiO1wT+?=
 =?us-ascii?Q?vrtFiav4HAMbtk5/NUqnHTzDgR9Tmzypw4VX4Jr5YzSFJJ524NF24mJq2ooN?=
 =?us-ascii?Q?wnBM/y8ihaEQFoXCjGZUDErT0OqWZb1Mpb5fN1rJKd/xLbodffNTTy9wXK9m?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ff7f40-7c58-40c2-78bc-08db8c67b9f9
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2740.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:02:13.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n77agfaYdUJ3t+xmyAU5pA7F7iVcGYqOj4WG0Tf31sdSFIg5ETJ2JC8XMMPdmm1076cuDD/hgp0sYikltx+oMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6169
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 24 Jul, 2023 16:40:14 +0000 "Nguyen, Max" <maxwell.nguyen@hyperx.com> wrote:
> Hi Rahul,
>
>  
>
> My apologies for the resend.  We resent due to white space issues in the previous patches.  I will resend again and address the comments you
> mentioned below.
>
No worries. The point on resending was minor. If you make the changes to
the patch, be sure to make it a v2 rather than a resend.
>  
>
> The purpose of adding Xbox 360 specified class is to cover future products that will need this protocol support ahead of project launch date. 
> This is purely for testing during development.
>
Yeah, lets omit this from submission to the mainline kernel till the
future products with Xbox 360 support are implemented. Even then if they
support Xbox One devices, you do not need Xbox 360 vendor-specific class
support since you can use Xbox One class support. I have little knobs
like this too that I keep internal for testing purposes.
>  
>
> Regards,
>
> Max
>
In general, this type of reply is considered top-posting and is looked
down upon in the kernel community. I see you are likely using Outlook
which is not the best mailing option for interacting with the kernel
mailing lists.

* https://people.kernel.org/tglx/
* https://www.kernel.org/doc/html/latest/process/email-clients.html

-- Rahul Rameshbabu

>  
>
> From: Rahul Rameshbabu <rrameshbabu@nvidia.com> 
> Sent: Friday, July 21, 2023 7:46 PM
> To: HP Dev <hphyperxdev@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; linux-input@vger.kernel.org; TOLEDANES, CHRIS <chris.toledanes@hp.com>; Ng, Carl
> <carl.ng@hp.com>; Nguyen, Max <maxwell.nguyen@hp.com>
> Subject: Re: [PATCH] Input: xpad - Add HyperX Clutch Gladiate support
>
>  
>
> CAUTION: External Email 
>
> On Fri, 21 Jul, 2023 18:05:32 -0700 HP Dev <hphyperxdev@gmail.com> wrote:
>> Add HyperX controller support to xpad_device and xpad_table.
>
> This patch appears to be a resend of a previous patch but does not
> follow the right practice for patch resends.
>
> https://docs.kernel.org/process/submitting-patches.html#don-t-get-discouraged-or-impatient
>
> https://lore.kernel.org/linux-input/ZKxVBULWtM30ZJ7D@google.com/
>
>>
>> Reported-by: Chris Toledanes <chris.toledanes@hp.com>
>
> I think this may not be an accurate use of the Reported-by: git trailer.
> My guess is you would want to use the Suggested-by: trailer here. This
> patch does not solve a "regression" in the xpad driver that was reported
> by someone or some automation but rather adds a new controller to be
> probed by the driver.
>
> https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
>
>> Reviewed-by: Carl Ng <carl.ng@hp.com>
>> Signed-off-by: Max Nguyen <maxwell.nguyen@hp.com>
>> ---
>> drivers/input/joystick/xpad.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index cdb193317c3b..dfddb0bba8d8 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -130,6 +130,7 @@ static const struct xpad_device {
>> { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>> { 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>> { 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
>> + { 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
>> { 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>> { 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>> { 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
>> @@ -457,6 +458,8 @@ static const struct usb_device_id xpad_table[] = {
>> { USB_INTERFACE_INFO('X', 'B', 0) }, /* Xbox USB-IF not-approved class */
>> XPAD_XBOX360_VENDOR(0x0079), /* GPD Win 2 controller */
>> XPAD_XBOX360_VENDOR(0x03eb), /* Wooting Keyboards (Legacy) */
>> + XPAD_XBOX360_VENDOR(0x03f0), /* HP HyperX XBox 360 Controllers */
>
> There are no HP HyperX Xbox 360 controllers previously supported or
> added in this patch. I think the above line should be removed since you
> only have a XTYPE_XBOXONE type controller. You probably do not need to
> match against Xbox 360 vendor-specific class since you only implement an
> Xbox One controller.
>
>> + XPAD_XBOXONE_VENDOR(0x03f0), /* HP HyperX Xbox One Controllers */
>> XPAD_XBOX360_VENDOR(0x044f), /* Thrustmaster Xbox 360 controllers */
>> XPAD_XBOX360_VENDOR(0x045e), /* Microsoft Xbox 360 controllers */
>> XPAD_XBOXONE_VENDOR(0x045e), /* Microsoft Xbox One controllers */
>
> -- Rahul Rameshbabu
