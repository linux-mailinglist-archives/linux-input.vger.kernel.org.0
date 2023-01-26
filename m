Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A6B67C3EA
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 05:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjAZEl6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 23:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjAZEl4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 23:41:56 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B101E2B091
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 20:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT0J2ktZeLrUVJfM2BvIIYznwMpprsTsUyOmFuIH3htq6sPyg6TvsojqgQp/K9kom6TW4DYR9Uq2Wcvvz1IKCMfZqtvfqmWIePbRYSvBtWB5/3lqPL9YXbpI+6RvkCR2Xq1jLmnb+y/TX9TdtQDiQdUy5IqZpEfwD/frUkuKEhmK+zRnBVYF4dxNEhMMZFYKSSQ4PbAtUMVIZEHWGuT6ZW+y/NvNA/OCeicV7eKJOce9UWfLD4vrOFOoo9zFW+XK57s7WcpgVkt118Yp3alu5w6aYxr9OSQqqV7td7kN4eVO9WEiEbkWAsrXcPZxq+e+RHsqvxfJp6iOcwrgcUvZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbcPqmWO42NxzZK5OboMFZnadUtmzS45hjXBn4i9lxI=;
 b=EcelA2zwbXsQnsvy282bWV7+2EmFELy9dxPGWD73fu2onIcf1SdLI67SxTanw6iHiJekyZm8qwBNZHCjTSce/712M0DClxhj65GtxoO3dXyGEfvvSyqbH+ZHej8KzFJOtHtCQipYkDjP1NRJTzLHpXt5iwCfpsXQCF9T7stXhWoLp4Mt+89OfEQoavy8T6HPo2yOgPdGdacA0ezydyq77sN/T29NiDoVMISFi2KIzAf37DhCmgYZeHP+AcSYb7bIT5NGlgpwBTMxQnFlXrEalE6dGQCmTTW8CZd8he6RdgIeW9KkzZaPGBfMtfCstk2qzF2yW8cCjLEIcXGflIZ3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbcPqmWO42NxzZK5OboMFZnadUtmzS45hjXBn4i9lxI=;
 b=GRUjZrCQ3v9076SO077mYt74DYEngsxJZsEv46D1M04JkTrBaRbZccAAaWB7U9M8VVA7rwAlw5N5WNfVwQgMbuC7/FpIaLI3IBP81kIJneZoOa6s7vC+78coP/ja11NSVkIzTjL8m/Zbz/CQXn2oLJBulAvh4dmePZdKqJwPn3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CH0PR08MB8705.namprd08.prod.outlook.com
 (2603:10b6:610:18b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 04:41:51 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 04:41:51 +0000
Date:   Wed, 25 Jan 2023 22:41:45 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH resend 1/3] Input: touchscreen - Extend
 touchscreen_parse_properties() to allow overriding settings with a module
 option
Message-ID: <Y9IEiYMo9O1VWoNU@nixie71>
References: <20230125105416.17406-1-hdegoede@redhat.com>
 <20230125105416.17406-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125105416.17406-2-hdegoede@redhat.com>
X-ClientProxiedBy: DM6PR06CA0084.namprd06.prod.outlook.com
 (2603:10b6:5:336::17) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CH0PR08MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f77da5-7631-4455-200a-08daff57a41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5A47WDFLDJDBHHNkTaG15Lweut8Y9Ff4oc5nvIQDie9e1XAffcj2SeUydkyV5xICEycfcQ0WLqZmgJQ8IRzey+pUnuWHgYu3uXB9GJvLrEtNUK8veMdrdLke8jGRqYUOkH2B96T5hWmRZBs84hGwSH9afhPg26vmgMWCfvbMCM0V/zPZe2SFNeCYwiCyBhhalLRdBJkJPWxuDhY2N9Br16bd9X3OckQD5v7LCq4/rOGr4DZQXF5L5mIl0PI7O6kfNz80plmc6m4T2uU2/EcQJymGmvsV2ICZbd90qxi383AC5bKN3CVDuKjGo/vNyV0MiIioH3ZdvL0me7Z8xNoTJLePNuXPZ2CB7LsrTSvHKzsMLtRxTtiR8xhaK+nIcnCaBgn/ugIgfHncert0avso1uop77PcUZOniVJ6WjQccXsYN541xPTKq+XuiM7eeGPBhRtrek/j80+qfWE27HXSXZayWv03UX3SnnyNQZb4O5XhDXpwSx/sM2AhajqsGitNOCDiRnW2wlWBxETH09NFe19vDpxx97OnCjwnqBA56g0xqGsz6YdeYzzIE58zadqAOtacoqC9yQRwzLqRdyt669/4UqfOsBdAEl+I3wr3qqKJFLG6xeQND1PRBbYVvpbsdNZXpKQTzr7uaH3R8Bii+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39830400003)(396003)(366004)(136003)(346002)(376002)(451199018)(26005)(2906002)(8936002)(9686003)(66946007)(41300700001)(66556008)(6506007)(66476007)(5660300002)(316002)(6666004)(86362001)(54906003)(6512007)(6486002)(478600001)(33716001)(186003)(83380400001)(30864003)(4326008)(6916009)(38100700002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+Y/dTkqgMVGjRlxhCRf9adTGQvVPcliB2Ak3HceJUb3QreqK8hrNjXnyJhD?=
 =?us-ascii?Q?Jkae2hVOWRp8hY6WIPWCk+vQe521wwZPok1ikourAS3Sbu2VUTqWKCIJupM2?=
 =?us-ascii?Q?IkIYKOlgg7JE6EexJJU2jc4y47uCGlU9Q07EYoB7lLtJqEEU0tKOyCs11k3m?=
 =?us-ascii?Q?UgNQSe6JXW66WgokEy8B8gTxrAJL2Ht9tkwYYLhiHNrR03hanbzICfEVT8eZ?=
 =?us-ascii?Q?kEyLRcYr6ZFU8TnTYI5MAsUKE44zBF3L5E2QUmPikTj/3tTHujj6Scvl638H?=
 =?us-ascii?Q?pzVSUBlfDMHJ7gqYQ58fpyNzzyHDijDAKXggvk4UP2HnoWLuWEiUWoioG17I?=
 =?us-ascii?Q?gayWR5rMDqsCJoFI2n4y/iprZYQp7YcmbhmxfM1JR2yvZe8AcImEszsiYVh6?=
 =?us-ascii?Q?1sgjXT/KYWzHK462Vv4W4DpEbUfCCzMNz+gCkqDDshCo1ADkQ05fHrOmVOwO?=
 =?us-ascii?Q?YIQEyS3dZ/5MDjVvmvTNtiabmxR2iN2qPp4lBcx2QBu11bdIs885VZPN7Hhi?=
 =?us-ascii?Q?KVuikKaO+K5rl50VGhglQub85J/FGlFTrzHzPeuH8ELg8jbxprHzXKce5q1l?=
 =?us-ascii?Q?p3BlSHX9tLLTBwvGWwwlDBcFmYdRUdYc5kQ/wKM/QpBw2ipWuIQn2UVUy2qK?=
 =?us-ascii?Q?NoNS2OE8WxQECmLIMBrhc3t9CCZl0Zyo3+ZNgfnTBSY7jP+edJOSd7eWvBgA?=
 =?us-ascii?Q?LYmStGZUqTplvb/GG5hdZmLgVWM2JBwvCws74NT3en0K3VJsdVvxzg0y8xd+?=
 =?us-ascii?Q?diFP5vzkDBjH8y2zHS/C3zgzJFPbiYMVNRY68TOoQCrEC+lBLRC6SWMlxeKD?=
 =?us-ascii?Q?xfBBto4TPrfByxpmzqCeuxhKkKn28cppXMpUS02sdaomUiYVRuCCgQyGzuIv?=
 =?us-ascii?Q?nRqDNZiWfJhW4vpcQF71hnfZJoETpPYiUWwbNgcB0bBrBuTwzym1dKRM3PjE?=
 =?us-ascii?Q?oYdRDKSKag/2o6aLuLnmV2YnzVk4lFl80BCixSYgpHL8vcJMQqY+SJ2glWJE?=
 =?us-ascii?Q?DISMlkkJviPedZtKtkQg23tiH/ZJp5S4kqIyXQX4bnVcyFQLTM7tDGrjtneW?=
 =?us-ascii?Q?x6G0ZBGqe4u2vBvyGbqjW+9SI+NtnIRQQSB3+MoxU0MBf0ZVTIjTdsdGz5TC?=
 =?us-ascii?Q?9ukmGH5zz4M1cL5hAkg980RotX2Zey2/6+2pxe7cJopAJBCLrbvL7Ghw0zTm?=
 =?us-ascii?Q?zx7CFUNhdy5M5qz0ig5yG8rlen8aK2LvJLk4D9euA0UA9tDemfB9Tn42o6L1?=
 =?us-ascii?Q?Iif0d3GJqMi/mtyWuD2FNtJUpG0WCHnKkoAt14e54ro89W3BRIGU91R2iq3M?=
 =?us-ascii?Q?qvvAW8NqM60ZT8JsUhBId9lRiyGjC3LxswjZlJPtqoMv+tOkXMj2iANbCbAD?=
 =?us-ascii?Q?mY3eAa6TeuNE/Sm5PaE93dckO3gXUGmsuXlQxrvdrWSf7hfMVJK1KvlVQoxE?=
 =?us-ascii?Q?FZHOMQqxwdQKNa/wLSOt6V7Ibcb19nmoEIfHmrdxWtmu2imQCYas50YwAdME?=
 =?us-ascii?Q?PmToTSncBu7knNs0R3a6cFAT2ruy8FKgtr/L4KRspP1BsWOgoAoYSHKSzNwl?=
 =?us-ascii?Q?FH30bPDPG2SAGrpDsyRhJ4B6/2rntgbnMoJ648Jy?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f77da5-7631-4455-200a-08daff57a41a
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 04:41:50.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkQlxPNf8Vdie4Yxq6co5z2xNdY8Di9eO61TBIBXEzL2tzzk+pUgGBgd2GenTMOSEHXDCIiO1LYVoIDuaHwywg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB8705
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Wed, Jan 25, 2023 at 11:54:14AM +0100, Hans de Goede wrote:
> On x86/ACPI platforms touchscreens mostly just work without needing any
> device/model specific configuration. But in some cases (mostly with Silead
> and Goodix touchscreens) it is still necessary to manually specify various
> touchscreen-properties on a per model basis.
> 
> This is handled by drivers/platform/x86/touchscreen_dmi.c which contains
> a large list of per-model touchscreen properties which it attaches to the
> (i2c)device before the touchscreen driver's probe() method gets called.
> This means that ATM changing these settings requires recompiling the
> kernel. This makes figuring out what settings/properties a specific
> touchscreen needs very hard for normal users to do.
> 
> Add a new, optional, settings_override string argument to
> touchscreen_parse_properties(), which takes a list of ; separated
> property-name=value pairs, e.g. :
> "touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-x-y".
> 
> This new argument can be used by drivers to implement a module option which
> allows users to easily specify alternative settings for testing.
> 
> The 2 new touchscreen_property_read_u32() and
> touchscreen_property_read_bool() helpers are also exported so that
> drivers can use these to add settings-override support to the code
> for driver-specific properties.
> 
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Thank you for resurrecting this series. Perhaps I can give my own $.02 as
a fellow customer of input.

I can appreciate the hesitancy that was expressed in the past, as this is
not a generic solution and is specific to touch devices. However, I also
agree with your point that extending dts overrides to all properties opens
a can of worms which should not necessarily gate this benign series (i.e.,
"good is not the enemy of great").

Personally I am highly in favor of this series because I myself have had
to support this very situation where a panel arrives 180 degrees from the
expected orientation, and fellow teammates who are not in a position to
quickly spin a build need a means to quickly unblock themselves through a
serial console or other means.

The code itself also LGTM and I verified there were no regressions on one
of my own drivers that expects these properties to come from dts, and so:

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> Changes in v2:
> - Instead of patching all drivers rename touchscreen_parse_properties()
>   to touchscreen_parse_properties_with_override() and add
>   a static inline wrapper which passes NULL.
> ---
>  drivers/input/touchscreen.c       | 103 ++++++++++++++++++++++++++----
>  include/linux/input/touchscreen.h |  19 +++++-
>  2 files changed, 109 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
> index 4620e20d0190..3b9505d5468d 100644
> --- a/drivers/input/touchscreen.c
> +++ b/drivers/input/touchscreen.c
> @@ -12,15 +12,80 @@
>  #include <linux/input/touchscreen.h>
>  #include <linux/module.h>
>  
> +static int touchscreen_get_prop_from_settings_string(const char *settings,
> +						     const char *propname,
> +						     bool is_boolean,
> +						     u32 *val_ret)
> +{
> +	char *begin, *end;
> +	u32 val;
> +
> +	if (!settings)
> +		return -ENOENT;
> +
> +	begin = strstr(settings, propname);
> +	if (!begin)
> +		return -ENOENT;
> +
> +	/* begin must be either the begin of settings, or be preceded by a ';' */
> +	if (begin != settings && begin[-1] != ';')
> +		return -EINVAL;
> +
> +	end = begin + strlen(propname);
> +	if (*end != '=') {
> +		if (is_boolean && (*end == '\0' || *end == ';')) {
> +			*val_ret = true;
> +			return 0;
> +		}
> +		return -EINVAL;
> +	}
> +
> +	val = simple_strtoul(end + 1, &end, 0);
> +	if (*end != '\0' && *end != ';')
> +		return -EINVAL;
> +
> +	*val_ret = val;
> +	return 0;
> +}
> +
> +int touchscreen_property_read_u32(struct device *dev, const char *propname,
> +				  const char *settings, u32 *val)
> +{
> +	int error;
> +
> +	error = device_property_read_u32(dev, propname, val);
> +
> +	if (touchscreen_get_prop_from_settings_string(settings, propname,
> +						      false, val) == 0)
> +		error = 0;
> +
> +	return error;
> +}
> +EXPORT_SYMBOL(touchscreen_property_read_u32);
> +
> +bool touchscreen_property_read_bool(struct device *dev, const char *propname,
> +				    const char *settings)
> +{
> +	u32 val;
> +
> +	val = device_property_read_bool(dev, propname);
> +
> +	touchscreen_get_prop_from_settings_string(settings, propname, true, &val);
> +
> +	return val;
> +}
> +EXPORT_SYMBOL(touchscreen_property_read_bool);
> +
>  static bool touchscreen_get_prop_u32(struct device *dev,
>  				     const char *property,
> +				     const char *settings,
>  				     unsigned int default_value,
>  				     unsigned int *value)
>  {
>  	u32 val;
>  	int error;
>  
> -	error = device_property_read_u32(dev, property, &val);
> +	error = touchscreen_property_read_u32(dev, property, settings, &val);
>  	if (error) {
>  		*value = default_value;
>  		return false;
> @@ -50,20 +115,28 @@ static void touchscreen_set_params(struct input_dev *dev,
>  }
>  
>  /**
> - * touchscreen_parse_properties - parse common touchscreen properties
> + * touchscreen_parse_properties_with_settings - parse common touchscreen properties
>   * @input: input device that should be parsed
>   * @multitouch: specifies whether parsed properties should be applied to
>   *	single-touch or multi-touch axes
>   * @prop: pointer to a struct touchscreen_properties into which to store
>   *	axis swap and invert info for use with touchscreen_report_x_y();
>   *	or %NULL
> + * @settings: string with ; separated name=value pairs overriding
> + *	the device-properties or %NULL.
>   *
>   * This function parses common properties for touchscreens and sets up the
>   * input device accordingly. The function keeps previously set up default
>   * values if no value is specified.
> + *
> + * Callers can optional specify a settings string overriding the
> + * device-properties, this can be used to implement a module option which
> + * allows users to easily specify alternative settings for testing.
>   */
> -void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
> -				  struct touchscreen_properties *prop)
> +void touchscreen_parse_properties_with_settings(struct input_dev *input,
> +						bool multitouch,
> +						struct touchscreen_properties *prop,
> +						const char *settings)
>  {
>  	struct device *dev = input->dev.parent;
>  	struct input_absinfo *absinfo;
> @@ -79,26 +152,32 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
>  
>  	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
> +						settings,
>  						input_abs_get_min(input, axis_x),
>  						&minimum);
>  	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
> +						 settings,
>  						 input_abs_get_max(input,
>  								   axis_x) + 1,
>  						 &maximum);
>  	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
> +						 settings,
>  						 input_abs_get_fuzz(input, axis_x),
>  						 &fuzz);
>  	if (data_present)
>  		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
>  
>  	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
> +						settings,
>  						input_abs_get_min(input, axis_y),
>  						&minimum);
>  	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
> +						 settings,
>  						 input_abs_get_max(input,
>  								   axis_y) + 1,
>  						 &maximum);
>  	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
> +						 settings,
>  						 input_abs_get_fuzz(input, axis_y),
>  						 &fuzz);
>  	if (data_present)
> @@ -107,10 +186,12 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
>  	data_present = touchscreen_get_prop_u32(dev,
>  						"touchscreen-max-pressure",
> +						settings,
>  						input_abs_get_max(input, axis),
>  						&maximum);
>  	data_present |= touchscreen_get_prop_u32(dev,
>  						 "touchscreen-fuzz-pressure",
> +						 settings,
>  						 input_abs_get_fuzz(input, axis),
>  						 &fuzz);
>  	if (data_present)
> @@ -122,28 +203,28 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  	prop->max_x = input_abs_get_max(input, axis_x);
>  	prop->max_y = input_abs_get_max(input, axis_y);
>  
> -	prop->invert_x =
> -		device_property_read_bool(dev, "touchscreen-inverted-x");
> +	prop->invert_x = touchscreen_property_read_bool(dev, "touchscreen-inverted-x",
> +							settings);
>  	if (prop->invert_x) {
>  		absinfo = &input->absinfo[axis_x];
>  		absinfo->maximum -= absinfo->minimum;
>  		absinfo->minimum = 0;
>  	}
>  
> -	prop->invert_y =
> -		device_property_read_bool(dev, "touchscreen-inverted-y");
> +	prop->invert_y = touchscreen_property_read_bool(dev, "touchscreen-inverted-y",
> +							settings);
>  	if (prop->invert_y) {
>  		absinfo = &input->absinfo[axis_y];
>  		absinfo->maximum -= absinfo->minimum;
>  		absinfo->minimum = 0;
>  	}
>  
> -	prop->swap_x_y =
> -		device_property_read_bool(dev, "touchscreen-swapped-x-y");
> +	prop->swap_x_y = touchscreen_property_read_bool(dev, "touchscreen-swapped-x-y",
> +							settings);
>  	if (prop->swap_x_y)
>  		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
>  }
> -EXPORT_SYMBOL(touchscreen_parse_properties);
> +EXPORT_SYMBOL(touchscreen_parse_properties_with_settings);
>  
>  static void
>  touchscreen_apply_prop_to_x_y(const struct touchscreen_properties *prop,
> diff --git a/include/linux/input/touchscreen.h b/include/linux/input/touchscreen.h
> index fe66e2b58f62..0023c6e368ba 100644
> --- a/include/linux/input/touchscreen.h
> +++ b/include/linux/input/touchscreen.h
> @@ -17,8 +17,23 @@ struct touchscreen_properties {
>  	bool swap_x_y;
>  };
>  
> -void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
> -				  struct touchscreen_properties *prop);
> +void touchscreen_parse_properties_with_settings(struct input_dev *input,
> +						bool multitouch,
> +						struct touchscreen_properties *prop,
> +						const char *settings);
> +
> +static inline void touchscreen_parse_properties(struct input_dev *input,
> +						bool multitouch,
> +						struct touchscreen_properties *prop)
> +{
> +	touchscreen_parse_properties_with_settings(input, multitouch, prop, NULL);
> +}
> +
> +int touchscreen_property_read_u32(struct device *dev, const char *propname,
> +				  const char *settings, u32 *val);
> +
> +bool touchscreen_property_read_bool(struct device *dev, const char *propname,
> +				    const char *settings);
>  
>  void touchscreen_set_mt_pos(struct input_mt_pos *pos,
>  			    const struct touchscreen_properties *prop,
> -- 
> 2.39.0
> 

Kind regards,
Jeff LaBundy
