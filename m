Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82FF167C408
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 05:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjAZExb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 23:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjAZExa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 23:53:30 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F94554232
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 20:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF2QN3+qrn1hbB+90Y3fiOTk6XrDb1GwYF8a+dx10Mma/rKH3g9xGgADTHtjwZ+JKpa78RtuLzT7lfq393oC/eu0liK1lSQ9Ixw47T/ziI4uxVPvGdyniyMspBHDRSWUHkPkg1GtNMnwPQ7Y9Drp2Th5NDQHAQmACAVzz8gK+3EG4qzuNjEHME6eV1eIaZUWg0SgRllMEJkwIu4sBPJtDxFqkTB4pcCrL20hMQM9j1ZM/0wJuAo7iSL5j1i/AFsAe+bf6YE4z7SVJivho92jxuaJpO/PBWruQncp5hQgCzOwmeYw6p9XVCudhp33f3DdrmRH2J0Su0atOHfwz9PrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDNQQuiwyoxX7nHiGnO2g+525tIv/dsMM/1gjO3nSyU=;
 b=iTEPz/eoXkr8xT7h+WLkwTNoYMl62FmTEK7Ughd/2d4d8lH0BHR9JiaR8n4IBuPIV3oFu+namJ4wzULDI6k87UZYqDNvm/1B5r0PL8Tf3ddPT0BenKJTEU0XnSh/wVDTydU8A6gSQ/SQ0NFlY3P1aMvCqp06BJf8/+x7ho+viiMfPLavr6lsfmJG1nnfTKM5ZEkWy99TzY4OnkmtHZa41SH26JRN33TMdC6jTcW4jZRfvsyOrlsgJc8qzkyPqSPdP4ydPf9r/8OZdG3tmhuOBkTVJXjR0EXTAvXgOOGQr0FGkQBu/Fh7l3CYdpcYkm6wpB4p7WVRrpv0LaNVYkBItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDNQQuiwyoxX7nHiGnO2g+525tIv/dsMM/1gjO3nSyU=;
 b=JRDu2k7ch1W++dfZ/ZcX8EDqJZ4DbRtqdsqcaMbzXO04m7drZJ7DdeUjVA85RQK+v0IMzba+l0vQt/hfkkEADzn9ZqIXSLTihC+bSa+Gk0bELwB/79Uqsm2gk0JEzFPmem6gssR6vsgMTovjXbtG7bEH+/cNVMqvmgiiOhj+Wa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB6250.namprd08.prod.outlook.com
 (2603:10b6:5:1f2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 04:53:27 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 04:53:27 +0000
Date:   Wed, 25 Jan 2023 22:53:25 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH resend 3/3] Input: goodix - Add a settings
 module-parameter
Message-ID: <Y9IHRS91VA6AqMbF@nixie71>
References: <20230125105416.17406-1-hdegoede@redhat.com>
 <20230125105416.17406-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125105416.17406-4-hdegoede@redhat.com>
X-ClientProxiedBy: SA9PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:806:24::31) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 51179155-9e43-4841-242e-08daff594375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Dw4vASf0Nt5YuNijVgLgEJDK7G+K0a7vpNHBll1UjaND2RYg45U9Ij8ugcLc1Pjy6VPXD2MhHeezhFGBUutt2rYzf7HLNBQG/vNypTWJl2iHyB+oDFMKvrMJp3bOTvFz3sjBToQVHzkbRI7DsVqDa6+m07+X0RQk5wW4HXjvBw7fA7hdsgAtPbJwptQHrMGccxcMjRJGAPFb32KNVnV5GWS1nZ+YOFfZyVUuUeZTSJu3n6vcJwhPSAQtmu7TNENOeEV491w/xi/yOBGsYe0SQVBQSM2FePamxE9r1FmKQFmPMH813L8fMlo0m230oMwXprSF4PFHLUmzjmdGhVwbEeLSstMvxJHAMUSECsf6koiB9ZXHnLyqbyjpHnRlEdY43rKQVzoQrvr9cm635NGyWp37Bd8hjdBtr6Dsw1/5lOKKE0vabz5iNE6mQ4eoUPkJNamsYcao99GbEVLpB8d6OGxca61Y1biG/EhwweqE4DgnX0knaSZ+1efBDIF+furmP5fCN49GTcabrLogcr08+b+9GxG+sRVtAfg1aDzcsAHUwA7fjjmxtzF6E5iTnwK5Ckdi7zI9DJYGg+BCalvP7qB+cNL7RwgIN1sGb88IzOpUbz2VP4zjSckUuvptA79ivw+uTk6oZgkbyXPEas3pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(376002)(396003)(39830400003)(136003)(366004)(451199018)(316002)(54906003)(33716001)(83380400001)(86362001)(38100700002)(26005)(186003)(6512007)(9686003)(478600001)(6486002)(6506007)(2906002)(8936002)(41300700001)(5660300002)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6RhLY7euWQDayxehPgKfq7pKuiSv6LWBhCxNEQ4kX1pwVqMKMlRpB7o7RA5t?=
 =?us-ascii?Q?6jElpaenjXjxOWos7DxKf8WuKapS52Ft2n9MgtAIxGbYJr7Axfx3gNKdtfbR?=
 =?us-ascii?Q?8t6TJZqS7kpDzdCvyxNeSNoyqiB3tg+8ecGPp54K4aTma8ia44lsStdSNmZu?=
 =?us-ascii?Q?kUrrejWnpORQ7Z4sYblhn3/1bJCsADAbOlirx6HD3WTAwiBCoPJMC5hZtPnu?=
 =?us-ascii?Q?gKmroV9lO8T/taJZ4ShQNlc1G21/AaVNAgjbm6X4CHvPikj0lPQEIt7ceqmz?=
 =?us-ascii?Q?DDpLHPstCJzamqKB0lHX21wr4VQGGIGQVKK6LNNlYpSjfNGTR9Qn+eHKuInV?=
 =?us-ascii?Q?ZZU7Nu0HHz8thgYM7TQ7Mv9l4VBmoF+OF0zn11ATkocNPTjvrVXGwEn9bh8N?=
 =?us-ascii?Q?dFA+qkKoVoCHJA/sD4SRVZE2GMMUt5RP4sTlZnpkF4V5mYmJZ7Stulr0rhB8?=
 =?us-ascii?Q?YX/wi0RaV+5PVoIQ5EWEWBOFmtBZgQd8BqFhI4n2z+uLlEmJ20I8pnU7kMFQ?=
 =?us-ascii?Q?ai2jDiqQt/KkHpTRSjkU2voSbprVxHuNZXOL85CriahTVsCDcIMx0yU5rDcR?=
 =?us-ascii?Q?cARiwHa/tD053hLdG0HCvHCFuU5FtoJJP+e5vC+QbhVdrFsbrdJ5QNaAb8lO?=
 =?us-ascii?Q?OXSB21BqaX2IuAwpoufn9gQkTemkcOSfwh235uwHtQkY5Gsb3JljIMYUMOiG?=
 =?us-ascii?Q?swHAa3lCNwD5TaEz1iJ/YS/4qRtRObbIHIDWMBV4NcoMgC0oWdyux+LK3Ar1?=
 =?us-ascii?Q?tXl80Z5Chn2YzpemDefdUFNF3snBB2bmssyRsfD22hYfegG7JqxIZFb/G81S?=
 =?us-ascii?Q?JSnrWvWFxcWAwgCBYgSKYiilU9AbyMRgKxnJDqRAkwOZN9EyruO7TlM/MDUq?=
 =?us-ascii?Q?TUHglpHrJgd8uQnrW/Uhb4sgUZNEykGwxDu3rSqpneyn6G5gV+KCnJygavqL?=
 =?us-ascii?Q?Qql+sMJ6xGuU2F6xcPAVZQ1MQwqNqRyJpJZGBPXTXZbo5sqVkrz/g9NJmeeT?=
 =?us-ascii?Q?iDyfyijFBq1tB/FhpJe1HmBkHk6AefDAhDF+cEjgWdW+nwIiiaIjXdqggaNH?=
 =?us-ascii?Q?pscVPjN8yc1YllAilOAiMwHAOQx6lAjWo8Q1bt99hKY+25/Hagx68UzQRpdH?=
 =?us-ascii?Q?T0I+Zh14vKRaRbMKGKo2dYwS8VsYRjDEBerCJs7ANTb4NcdSBWBhRoIsP/bk?=
 =?us-ascii?Q?oUoWO3pYcxvknJ91rL09wnL7uPqrbuRubAdsHnWLT1anIq/iC3Rxgn8DFJSY?=
 =?us-ascii?Q?8AaNJ81mBvurqUo5LOhmeckoQ2KkxzxT60L5ZCdSlgbmr4/hcnKFehi6sFxk?=
 =?us-ascii?Q?qmxk9kcOxzfaWTN8mfHCyC9PRJyZigqIXlHMTe4LTYLJ6Bit+vu0dGZ6nAn9?=
 =?us-ascii?Q?iW8zAASjvgRbRTepIGfn39HQyyBQ617t0qdB+l4FAZkqy9SvsGinD54NCdCX?=
 =?us-ascii?Q?pNcMTeCjvvz17iY66PdaRtMQbvTw5blLHXXpOcMkLADMnqkjiASpDJ0bU/0j?=
 =?us-ascii?Q?utTnOkSfoQ1ExiTc5d/XyrnoE4djiK9d6K5+scMUC4v4Bc2hupoxowxO3hJX?=
 =?us-ascii?Q?9P0FxjZfeME3Bx56s/R6kv7/J19f5VIVZQN4f3+f?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51179155-9e43-4841-242e-08daff594375
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 04:53:27.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJobw4WhAb48tQAyKsnbkbjhgAi8nlV8mAeM36qbDtLoz3VAUQpvrkjuFdjat1rTsrJLF9Ts7aUJ2bjFOw7hXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6250
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 25, 2023 at 11:54:16AM +0100, Hans de Goede wrote:
> Add a settings module-parameter which can be allowed to specify/override
> various device-properties.
> 
> Usuually Goodix touchscreens on x86 devices (where there is no devicetree
> to specify the properties) just work. But in some cases the touchscreen is
> mounted 90 or 180 degrees rotated vs the display, requiring setting the
> touchscreen-x/y-inverted or touchscreen-swapped-x-y properties.
> 
> Being able to specify the necessary properties through a module parameter,
> allows users of new device-models to help us with bringing up support for
> new devices without them needing to do a local kernel-build just to modify
> these settings.
> 
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/touchscreen/goodix.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 620f5ec0962f..a105dee04156 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -53,6 +53,10 @@
>  #define ACPI_GPIO_SUPPORT
>  #endif
>  
> +static char *settings;
> +module_param(settings, charp, 0444);
> +MODULE_PARM_DESC(settings, "Override touchscreen settings using a ; separated key=value list, e.g. \"touchscreen-fuzz-x=5;touchscreen-fuzz-y=5;touchscreen-swapped-x-y\"");
> +
>  struct goodix_chip_id {
>  	const char *id;
>  	const struct goodix_chip_data *data;
> @@ -1197,7 +1201,8 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
>  	goodix_read_config(ts);
>  
>  	/* Try overriding touchscreen parameters via device properties */
> -	touchscreen_parse_properties(ts->input_dev, true, &ts->prop);
> +	touchscreen_parse_properties_with_settings(ts->input_dev, true,
> +						   &ts->prop, settings);
>  
>  	if (!ts->prop.max_x || !ts->prop.max_y || !ts->max_touch_num) {
>  		if (!ts->reset_controller_at_probe &&
> -- 
> 2.39.0
> 
