Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA3967C407
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 05:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjAZEwI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 23:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjAZEwH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 23:52:07 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7F77D95
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 20:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EorWBr3c44gh+jsgPn5FB27/BdpglMMQG6J3AAsnrOWCt+TLY/iAt1pVLKgPPjlI4lrqqhnYfe7ESAaewl7iscvr/mgBXRmNqvjeTVcjmlavyO+frSKT7l3FjyKBfpqYNh3JjtnoZALfmNDw1AVoPZQVaNovKiRDlhI8bNGCnHrr6F3gf2inpH4m2HG/WzugO7Ba37+uCqgljTWN38he3vn4FGAwn908dLo+phsDaIgHNBWouza1awCITINTC39rn+K4tNrdNq1g7j+bw/ldAGn3DSA5MUX30Kqt1vnEl6bf7sJaxDMwk/jn1QVQf9hudhldwriU95gnygrcgFyQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJynamnKtZ0scC5tpBHESElKNsOZGS+hXC9OZ0Vw1wE=;
 b=I9Sv3SfC5rMOiiNczxpEYpRyClXuOwbIL4um1Q2JaqafhVJzj8BIL6FTQQSoPWxJdhydlEH4tL2cWCxCjzCaPyBEHuRLWDUflozVeiheCMpn/t0Gn1NlSxtqkLEyCjo5jKfCagLF6mtXH/g/zIBxhfimp1NSRTyJ9o7nZRENuRSkPAwL3YR5qqdaU0p0Kvy8aFiOlU2qpF/cxkPJK2KWPMsm6RmIDTz+lDpS34RhHQXjluzR4bFAVtW9EuSsKR2FnfzHcLDjWcNCjTzJDeG7QnOAIxa5cSq4lK+jPcy2HE60+dfeOh7l2cJUOYkt2NlMclyHfRa+LugKeZUUKL+dpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJynamnKtZ0scC5tpBHESElKNsOZGS+hXC9OZ0Vw1wE=;
 b=ddta+adkwRcixrxtHuzCliw9IBbBL6pZ2LJQTuEhSicIuMCN5jwf4vfE4rcpZS208ful+DEcaubtCe9ZFvSl515LI4U4n9hsaBZoa85ZheaIoriYt+b5APh0PgKxF123pBpplPf6foedburfnqYKOSbVrRDzLS5E2qnRgpsuQJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB6250.namprd08.prod.outlook.com
 (2603:10b6:5:1f2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 04:52:01 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 04:52:01 +0000
Date:   Wed, 25 Jan 2023 22:51:55 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH resend 2/3] Input: silead - Add a settings
 module-parameter
Message-ID: <Y9IG6zQtGWWwhyLW@nixie71>
References: <20230125105416.17406-1-hdegoede@redhat.com>
 <20230125105416.17406-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125105416.17406-3-hdegoede@redhat.com>
X-ClientProxiedBy: DM6PR02CA0128.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::30) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ea05c6-67a6-4d12-fdac-08daff590ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jBHq11Qh/1FxLRaOqgGcF3YFmCVUI/f97+OX1KGZqCdr+FGD4kql0PdiZNllVWFFT04BHWtyMzZpLe+SXbWcoqiX+LQ5TQBID+VLQb2JMq27Dbk//vs39dfmLL/PqiOng0P41iRmCKykeX3F6F+1xFN8MlbCOopX+fJBSCA0gnSwckOv/wQ+6EUyhP4sEQBJWn+KdxCbvn92hf7jkb/fYVX8irKZfU34cgxGlGPEdg96VpF/QAPEHUsoyM7Gwn7oBPGGgESisQWmwRuudUfv7rmRXl6GPWrz+uEEhJDF32TJIDn5bgYn3cSl7ZRNnVNY1sHfXI1oY0TmuOyEDUmqXGjJyzcngZh2VProGZXXnZS6W9MtrV6oO70UfnZczM1PtYx5ff37ZIfR9+bPn2lM2lhITj9AC0xE4uNkplixuD/C15+cqCr3bfAWqrnac190zNWL6ZihVotARL2Eclt4bvGTZS4kxJTUEif+srxEIP32w5kBIXTdxb+VXBltwncXWN3zIQ7xmVERo6AMUR89CGuf4q0eEhkgR+aADCQm/uQj3vHzXG3mPQSNRiv8B5odVLJUwp8Ch9COi0y9njtaPLfWI3ocaqXfUo4MWTNDRrYwPD1CfBcUYdY47mwBMozR0hUCHQi/8LE/0/xNF65Nrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(376002)(396003)(39830400003)(136003)(366004)(451199018)(316002)(54906003)(33716001)(83380400001)(86362001)(38100700002)(26005)(186003)(6512007)(9686003)(478600001)(6486002)(6506007)(6666004)(2906002)(8936002)(41300700001)(5660300002)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lciTy307yIHH0k9lm6wukFYleWPbKfFSeVpyob6qIOjgQbQAdrp+KgvwYywT?=
 =?us-ascii?Q?P7ytI3VaUyLDB71T0GUoHcPtHO4y3wc4dG1ldBHW4yu3MFVoVqzupNngnvRS?=
 =?us-ascii?Q?2WMtDulkaK0kx6LBZ0kUv1Z75/qps8q3a2IlTJyfk+sMbdxEES+fDRB1s7at?=
 =?us-ascii?Q?DedRPB5bMmqYMKT4rAisx8STcAjyiwwwqK/L/08uK18DR5LQhyE7Tbmn7fAT?=
 =?us-ascii?Q?Do4FufmgjLPx4Z+cdpRghBJpA0PBT0OBJR3Ne4zIAvMuPUlXaipoTxZVbe2w?=
 =?us-ascii?Q?v/CN6dBcklS+jeKmQsSfbsRNsrS9WswEiAyICLTDW5k5hL3myQTkjZpt5vUD?=
 =?us-ascii?Q?tIOYvjFqN2k1dfLrYPVrnP+jVsY946j8VwBTdixgC/qtBB5iWzugQ5tfXzRd?=
 =?us-ascii?Q?MG5/uz98jLUa+JA9BTRw5nQfPBePVx5TIboYJABNvT1p5uyiQRSEHEGr7ZnC?=
 =?us-ascii?Q?z5THGm4dm2k0EeSVs9e7zgrgEHrBECt119/wpTtT1yl7aw6LPmUwiFtisrDJ?=
 =?us-ascii?Q?5ibCzNmONV4M/UvYOsNLQ0mrS8ayc133AQtDcfHfIoRlKb7yF4jZlFeV3Yz4?=
 =?us-ascii?Q?47MJ8rjtHuVxSY3za742cgVXWcGbSijXjPoVTFo4IzPY+djwW4s5J1ch6UbP?=
 =?us-ascii?Q?Y+VaJMwZfOT8Udc2Zc+xUkJNu5uS5lG2O3vMDYFEztYQIO5Q4hoJaep/epuS?=
 =?us-ascii?Q?wD63Av2rCrcwxu8xJB3tSSIFCMY0REIHSrcF+iM7CZbpv15PggPIfiIe5Uek?=
 =?us-ascii?Q?MWBcXD0DPYLYoot0U3PyZeIq7GKhl1WS5zTQzdKxCtZmf4XwrnnHlYWZTxwo?=
 =?us-ascii?Q?SjFz8UgquqS6IzZYPe4xVzv8k1uYIy8fQr1rMECe3EN6nt0i1a85XrHJ4EKb?=
 =?us-ascii?Q?rb5TCXyXHwsBi8fmEQC/B7fQazahrhlSSHOOpMncagiVNuPmIYsVAgMoLXIc?=
 =?us-ascii?Q?zMdxu0MFeinZo5FX5q+l3CZ02DpDsH12vh/rQ4KmM8t3an5ZVJA8Xw77olkc?=
 =?us-ascii?Q?GyglcFtKA3aEvBedP3CUFZTMZgc9ZVxaJnrDYsZ2+U4x9j501qVPayjVe8os?=
 =?us-ascii?Q?ParWQcfDPA2v6LyPbaaSxKEA6VBGbL2ufnaPY0q24ej5bYAVIyiF6eIKvaex?=
 =?us-ascii?Q?Dl3u7qax3PM7fpDmEyNMziLrW78ILWQuzPXw6J6t4wTjfUsACmtZu5c1/q9d?=
 =?us-ascii?Q?qISqpvuf64Ju++udfXF5gQdQAiyR0KhEOiss/AB4B7+i0cqIgirisStQjr5+?=
 =?us-ascii?Q?+qGEpLQQKkD3Q71s4gOHbgZg55b12QfkrnCY4HVp1eCoLjIr7j+Fqo/QzHXp?=
 =?us-ascii?Q?DigDaWuHS4XkdkHbCOvSzh1y8FKXU9flPpVorysmbVtjfLVg95l5ObanuJbJ?=
 =?us-ascii?Q?8T8tl8jfdDPDQcYxivZG3M1qYe3i5PaJOC8XjFQ2sRZAlx7mwvF0ONh8h0z5?=
 =?us-ascii?Q?TNVw5sIAesUa6WnY0Bd2SQJwWv2wjIBc2i99Xl8ppURQzIQXCeieu6EN5/wY?=
 =?us-ascii?Q?imiJPu6G80H5ts9/71/0tz2ibaxmGJXTWrMRzDAPAY/gmRhqbm3CVPN0Q+i0?=
 =?us-ascii?Q?SaWlP4wBItQ5u11rw7fhcjM9CHU+cI/PryYBI3l6?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ea05c6-67a6-4d12-fdac-08daff590ff7
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 04:52:01.4085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16seyVwxmwlaXBBUqKQ2u1seYHqB9fLuzAgRDbOmYWc0UR1lHzDhbnFIR2JnB3Js59+QqGIY3JU7KSm+7Y8eKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6250
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Wed, Jan 25, 2023 at 11:54:15AM +0100, Hans de Goede wrote:
> Add a settings module-parameter which can be allowed to specify/override
> various device-properties.
> 
> Unlike most other touchscreen controllers Silead touchscreens don't tell us
> the ranges of the reported x and y coordinates and Silead touchscreens also
> often need to have their axis inverted and/or swapped to match the display
> coordinates.
> 
> Being able to specify the necessary properties through a module parameter,
> allows users of new device-models to help us with bringing up support for
> new devices without them needing to do a local kernel-build just to modify
> these settings.
> 
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

This LGTM, with one comment that I do not feel strongly about.

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/touchscreen/silead.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 8a7351c4414c..22cee8d1bb22 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -58,6 +58,10 @@
>  
>  #define SILEAD_MAX_FINGERS	10
>  
> +static char *settings;
> +module_param(settings, charp, 0444);
> +MODULE_PARM_DESC(settings, "Override touchscreen settings using a ; separated key=value list, e.g. \"touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-x-y\"");
> +
>  enum silead_ts_power {
>  	SILEAD_POWER_ON  = 1,
>  	SILEAD_POWER_OFF = 0
> @@ -133,14 +137,15 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
>  
>  	input_set_abs_params(data->input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
>  	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
> -	touchscreen_parse_properties(data->input, true, &data->prop);
> +	touchscreen_parse_properties_with_settings(data->input, true,
> +						   &data->prop, settings);
>  	silead_apply_efi_fw_min_max(data);
>  
>  	input_mt_init_slots(data->input, data->max_fingers,
>  			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
>  			    INPUT_MT_TRACK);
>  
> -	if (device_property_read_bool(dev, "silead,home-button"))
> +	if (touchscreen_property_read_bool(dev, "silead,home-button", settings))

While harmless, this seems like a bit of an overuse of the proposed
functionality. Either the platform has a home button or it does not.
Would users really need to experiment with this property enabled or
disabled?

>  		input_set_capability(data->input, EV_KEY, KEY_LEFTMETA);
>  
>  	data->input->name = SILEAD_TS_NAME;
> @@ -173,7 +178,8 @@ static int silead_ts_request_pen_input_dev(struct silead_ts_data *data)
>  	input_set_capability(data->pen_input, EV_KEY, BTN_TOUCH);
>  	input_set_capability(data->pen_input, EV_KEY, BTN_TOOL_PEN);
>  	set_bit(INPUT_PROP_DIRECT, data->pen_input->propbit);
> -	touchscreen_parse_properties(data->pen_input, false, &data->prop);
> +	touchscreen_parse_properties_with_settings(data->pen_input, false,
> +						   &data->prop, settings);
>  	input_abs_set_res(data->pen_input, ABS_X, data->pen_x_res);
>  	input_abs_set_res(data->pen_input, ABS_Y, data->pen_y_res);
>  
> @@ -523,8 +529,8 @@ static int silead_ts_setup(struct i2c_client *client)
>  	 * this.
>  	 */
>  
> -	if (device_property_read_bool(&client->dev,
> -				      "silead,stuck-controller-bug")) {
> +	if (touchscreen_property_read_bool(&client->dev, "silead,stuck-controller-bug",
> +					   settings)) {
>  		pm_runtime_set_active(&client->dev);
>  		pm_runtime_enable(&client->dev);
>  		pm_runtime_allow(&client->dev);
> @@ -591,8 +597,8 @@ static void silead_ts_read_props(struct i2c_client *client)
>  	const char *str;
>  	int error;
>  
> -	error = device_property_read_u32(dev, "silead,max-fingers",
> -					 &data->max_fingers);
> +	error = touchscreen_property_read_u32(dev, "silead,max-fingers", settings,
> +					      &data->max_fingers);
>  	if (error) {
>  		dev_dbg(dev, "Max fingers read error %d\n", error);
>  		data->max_fingers = 5; /* Most devices handle up-to 5 fingers */
> @@ -605,9 +611,9 @@ static void silead_ts_read_props(struct i2c_client *client)
>  	else
>  		dev_dbg(dev, "Firmware file name read error. Using default.");
>  
> -	data->pen_supported = device_property_read_bool(dev, "silead,pen-supported");
> -	device_property_read_u32(dev, "silead,pen-resolution-x", &data->pen_x_res);
> -	device_property_read_u32(dev, "silead,pen-resolution-y", &data->pen_y_res);
> +	data->pen_supported = touchscreen_property_read_bool(dev, "silead,pen-supported", settings);
> +	touchscreen_property_read_u32(dev, "silead,pen-resolution-x", settings, &data->pen_x_res);
> +	touchscreen_property_read_u32(dev, "silead,pen-resolution-y", settings, &data->pen_y_res);
>  }
>  
>  #ifdef CONFIG_ACPI
> -- 
> 2.39.0
> 

Kind regards,
Jeff LaBundy
