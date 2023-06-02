Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCC1272095A
	for <lists+linux-input@lfdr.de>; Fri,  2 Jun 2023 20:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbjFBSpQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jun 2023 14:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236483AbjFBSpO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jun 2023 14:45:14 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3E3E40
        for <linux-input@vger.kernel.org>; Fri,  2 Jun 2023 11:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWmjYaJyQQTUDwNfwJD7cBHSPPChLaPHk4K4GCUOMhhQi3s5Irm4rHDRtd3TX7jvXMxpRChwjrWaa/aRXI4dS/8hPb0/l/wgYV/TRiXEDIYFZgaG1aqmi/o4VXz7OrogAXYODRK7CYLbY1UNp2XxMB8+JsIJjsx1JHgFxN2Uuft4mfF9OoOfaaRX+vkZyn7ond2onXST6n2dkFrm08Xvc1qBZJnMARinSS6tmdHRnH09KMAgTadrvS4PdVH0w1Q+Fg0Nt9lg9C2XttVQep4CSjGCChRTv+5T3ORgboj5fut35MFKDZkeb1Axt5YfzApSfZP+8+WfcJnUnUg+BJiUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sI/NLlqrmuBP+779/CU9H6HnZc2rm/fQX2c2Z1wTbkQ=;
 b=P/LyxNx2G5uG3JYQdeFPlML06eRJj5EuG+GkQTQgJ3GpFUcy8TlOP+QfIHMGWQL0bEW8wo3xNxtavPjo0oYF8vcAyZbz7WNHUC38AOAab6BYE6fgFfn6DJg9gz08mMPsboCJdmqda6KIFIhDe0hXbg2qb8qG7YERXj85SuS8kuluWfPGATEdWHkmFocFY9d47u4q31c8B9azmuTSsbCsnQfpbJbRkG2Uj4LwzacCFKk2dmhV3Ek4KziJDtcOBkwaXgOu3srN+rLDuS/5RvkNUVPEZ8sfIrigra3gOzhvUaWdxxueP+vfnnFYdSSkwELkoXUDbpBbLaar81HXD4rYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sI/NLlqrmuBP+779/CU9H6HnZc2rm/fQX2c2Z1wTbkQ=;
 b=lkvYgPqlx7qwGpKZa4YpoKrS0mNYH2Knv+n0nlU2oqb8kEFjBKP4gydL9bUUnq+/1N2QnSw7gPdOoCD/uSmCvO7h1gbwIoXtAR449wUreldre5CzHeqNEmkMNgyvhT/lMC4VnYAD+TgtBPVFD9vXF2Ji/JOr8jyYR2vKGbOIod0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 18:44:57 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a65c:3aa0:b759:8527]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a65c:3aa0:b759:8527%5]) with mapi id 15.20.6433.022; Fri, 2 Jun 2023
 18:44:57 +0000
Message-ID: <dc4da9cf-a66f-6e09-165d-f16a405f2a38@amd.com>
Date:   Fri, 2 Jun 2023 13:43:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] HID: i2c-hid: Block a rogue device on ASUS TUF A16
Content-Language: en-US
To:     Friedrich Vock <friedrich.vock@gmx.de>,
        linux-input@vger.kernel.org,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20230530154058.17594-1-friedrich.vock@gmx.de>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230530154058.17594-1-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e42e080-bae9-463d-0523-08db6399769d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1Og8iaZcmXsJl39Cl/9zqAR8FfXdGH1bO9soxOrrRRCXOUuanXM86ScG3xUqN00nWaS52uWPfRYZ+7y+UfZhwneRfmpIK/mgzayYf8Ag5Q4IOajinXEiYXgJOZjb4M+5kpJ+rv0W9+EM2L6+vK+WEI9FuoZpEYCuOZxiL1qxCmeyLRTHxPdsPRd/86bIHbvTl4yzUoVIg22me8IzGpF1egvIMDHfrtctIhmPG+oJYPZRU6lXBiL9qo9XGih7Zow881wOtNLXu8r8hCeMmPMf4CAmBU6NA7iFNOeuPObnO2r2LkKJdFoRxzM33vbYnU6Eu7zADm3SrJ35j+05aUuIagCoHnAZSZgTz6hg947CAKtueWVrow1RS3Jkpb0/2uRJszezUuaL8kYMZa4CdLQekF817xRt6cbzPaFEhXCQZ9kzmDNW7Yuj/WNUnswZWZjrXXsVITs97wqkR6W5N0z8WNvcdHXxes/8Gtg++myxq7VlGXUphj4NG1Les+DD6ELdYr2QUF2vi2qUO6zR/PwILjzRRVUyOOWOkx+baFXA0u1ey4qoQF5M3zmsedoxY1Qk8zZ0vmOoC2nABC1MJAJczJdbdoThojAWM2x0toRmA4z5nYp9ZSY4edp9KxfwUjUriiB2WTNpt+at6k0Ge8ORco0EC3Qb6hsNSIQjLKxJXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(6506007)(53546011)(6512007)(86362001)(186003)(31696002)(66946007)(66556008)(66476007)(6636002)(4326008)(31686004)(2616005)(5660300002)(8936002)(8676002)(478600001)(83380400001)(2906002)(6486002)(45080400002)(38100700002)(54906003)(966005)(316002)(110136005)(6666004)(26005)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhKeUY5dkQrbXU4YTZpN0s1a0lqNDE5bzRNSFRGRW1Ydm9UZktmQWJjUEhT?=
 =?utf-8?B?YTNnTUlvQVpVN0JrWDlTRnZoR3AxRGMrOTlyeVhUT3Yyd3hsYlEyQmxJS29Q?=
 =?utf-8?B?a0czemVLazZ6VUprWXdlZXF5VUR4K1drTmt3MEsrNWZxZ3NZQVJObEQzQnp1?=
 =?utf-8?B?SE1qcWk1dnp0WU1rL05BamRGelRoY3VvZlRhWVNGQWNqT1JJS2MralgxcXda?=
 =?utf-8?B?V0FnWmk1dVIxeXdUUjB2NlFxTlViNFB0d01lU0VJbE1qSkhsZThWWVFqTzJy?=
 =?utf-8?B?ai9OMXNpejljZmtXK0lYNnMzcUpvZFRiRWtFSE84VjRpYi94NGNGdERsOS9n?=
 =?utf-8?B?VWN3Z3BiemdZVmY4S1EvSEMza3hGNWtjS1p5RWhDcFprajhBSUp6emxZcm1Z?=
 =?utf-8?B?MWtZcFZ1dXVtMXdjcHRXR2FXRHJMR1dRY2NORTZoMmhINlo5RnJMZ3NTSUZB?=
 =?utf-8?B?dUFZdUt0d1RYbVNtKzlGQjNYNktPdmVxZFVwQ1Q1YnVvT2xCazZwaVN3cHJr?=
 =?utf-8?B?cU0yUXJtQU1qS2ppTVJ3RTVhRER6VkJXVFExOTJlaXdXSERwRGQrRFZsLzd3?=
 =?utf-8?B?MWlwdHpPWS8wMlpBQmpCNmQxYVc2S0JyOVJzS3Y5VFJRQXlPTFZkV0RJVVV4?=
 =?utf-8?B?ZWZTdk82bkxrK0NXbmlZaUxkbFlvR0czNUEwTjNONXE1cU8yZXZLUjVHZVZz?=
 =?utf-8?B?OEc3ZEFQM09rYmZ1ejI1a3Rwc2xvcG1CclRxVC9Kc2ZqVjZvc2IrMnBYK1dz?=
 =?utf-8?B?VHpWQ1U1ZnpoMUdsSnZGeFVWYXd3WkFHcURDZVh0WTBISkpWQmwzUTVxVmxI?=
 =?utf-8?B?aTJCZDloVmkrQ2R4M2xBT3p4WU4vTUJ6UG9tV0ZDbGd3SjRSRE5QYlB5K0da?=
 =?utf-8?B?NmJzRjU3aXFZYU9yTm1DREpNQ2FVdE5YZ2Zzd2JiS0gxM1VCdUluOGMvVjRj?=
 =?utf-8?B?Zm1YQjVhTXhKbFpkVUIxTDkydkpvSnBxUG0rMlVFZE9XYll3WnZ0WlVPbmpU?=
 =?utf-8?B?cGhuV0NKRk1CeWN6Q0l1Z3VPTFRuQk9YSmJwSGxCNUFBZEpQNTg4SDRiY1Ez?=
 =?utf-8?B?RFRBTmJIcUFweG0zM0RzRnptNzRHWlZMSjhwR2l6ZjdldTlmdTZtdzZXZk5k?=
 =?utf-8?B?eXpCRi9Fb2ExT3JTb1VFME1BbTlBd2lnY0RGZWdtRUxjUUZsclVMZDgybVFV?=
 =?utf-8?B?OEVTdVBZMGVmU3UrdkI4U2xFcjFVNU0rQnlzMGdLT3ZvNFhUdDRYOXU5azA0?=
 =?utf-8?B?RVprMGs5dm11SGg4VWZsVWRkRmpxYUFqWDFoNS9RNHY5UVBtbytjT1BRYkt2?=
 =?utf-8?B?Y0tvSmEwbWIvREJKSHVpYUlYWWtNbWFJSEtmemhaQmtQcVhIc05zcGhGQy9Q?=
 =?utf-8?B?aEtjYUV4ZFhFbjVhQUdrWkRrajZQcElmaDBNYmZ4Z2trL25UemJwcFgrSGFC?=
 =?utf-8?B?V2gwdzE0MGU1d0d4VVdYOUZrQUdyN1JqOEdlSTlPZGtmdGIyODJ6TzZlYWZT?=
 =?utf-8?B?Yy9uSlE0N29sTm1rZy8xS3l2ODZwMm8wTDAzb2p1VXdFR0grK3ErTW5XeGFu?=
 =?utf-8?B?bGlNeS9ETjA0SE9GVy9WSWJ4ZGhBaUZXeFZpNGJwek9Oc3FkNXB4R1lLYzVP?=
 =?utf-8?B?Tk44cmxSNHpOUTRDQWJoc1lqRmhRMVhTczByL3hKelVxdnVEOE1PYTVCaEZP?=
 =?utf-8?B?M2g3d2JXNWRpeW1VVkxCU2xWRk5WSFlsRTJQTUVZeTBZRDB1QS8rd0NjUElw?=
 =?utf-8?B?eXZiZlRYZkZjbWNKVGJXNUl3bllRbWw0UVN3bWsrRGJZNW5KRG1iS0hiZ0Q0?=
 =?utf-8?B?MkdsRkZpTHNXdFNFZ1J4T3prV3JmOFRoSGQvOCtUc0lEOG5Rekc3ZXlNZlA3?=
 =?utf-8?B?UEt2ZzhibUxydmphVmFmRlp4emdmYVFFRTBOOWNnRit6TU1YRzlMOWowbE4x?=
 =?utf-8?B?VWZQM2xtbElEU1hXTVlFSVpDV3FOQ2crRnVFdlU4bFFJS1QrVUJGZE4xOFZU?=
 =?utf-8?B?c240Qjk1eHhLVTZ6S2tHRWE5TG4xQ09hTVg5citsNFpuR3RybkFRZmFUSENt?=
 =?utf-8?B?OHp6UTR2L0U1QUFvVVV4d1NGTEhQZm9XOHc4NUVoNVNKUHpkS0FCVSthQnAw?=
 =?utf-8?Q?uTpjUIKTydB6TebkoAEgqVgrT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e42e080-bae9-463d-0523-08db6399769d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 18:44:57.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XH2MvDxd4ZEbMYx6HxCXvfVwy40jKSvSVauM9Ho9pal/o/iAXMyNbUtx3i4EJbBQZtoBruHPvH1z6ONQEOeBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+ some AMD guys

On 5/30/2023 10:40 AM, Friedrich Vock wrote:
> On these laptops, there seems to be a device that, when probed by
> i2c-hid, constantly sends bogus interrupts and interferes with the
> keyboard controller. When the device is enabled, it takes the keyboard
> around 8 seconds to register that keys are being pressed or released.

Do you know what interrupt is firing constantly?
Presumably it is the GPIO controller master interrupt, right?
And it's for GPIO 7 (guessed from acpidump on one of the bug
reports).

To confirm check /proc/interrupts.

If it's not obvious which GPIO is firing there is also a dynamic
debug statement in pinctrl-amd.c that may be helpful to figure
this out.

I would also suspect in Windows this doesn't happen.  If possible
can you confirm that? Check in Device Manager what driver is bound
to this device. Is it "inbox" from Microsoft or is it an ASUS
specific driver?

I wonder if the GPIO controller got programmed differently in
Windows for some reason. We may want to confirm the values for
GPIO registers from /sys/kernel/debug/gpio in Linux against those
that are programmed in Windows.

This can be accomplished using R/W everything in Windows.

>
> Nothing I tried seemed to make the device work, and preventing the
> device from being probed doesn't seem to break any functionality of
> the laptop.
>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>

There are a few bug reports that popped up around this issue that should
probably also be tagged.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217493

> ---
>   drivers/hid/i2c-hid/i2c-hid-core.c       |  5 +++
>   drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 48 ++++++++++++++++++++++++
>   drivers/hid/i2c-hid/i2c-hid.h            |  3 ++
>   3 files changed, 56 insertions(+)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index efbba0465eef..5f0686d058df 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1035,6 +1035,11 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>
>   	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
>
> +	if (i2c_hid_device_blocked(hid->vendor, hid->product)) {
> +		ret = -ENODEV;
> +		goto err_irq;
> +	}
> +
The thing I worry about here is that an unserviced interrupt can prevent the
hardware from going into proper low power states; particularly at runtime.

I think we should better understand what's going on before going down this
path of just ignoring it.

>   	ret = hid_add_device(hid);
>   	if (ret) {
>   		if (ret != -ENODEV)
> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> index 210f17c3a0be..d2c2806b64b4 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> @@ -440,6 +440,38 @@ static const struct dmi_system_id i2c_hid_dmi_quirk_table[] = {
>   	{ }	/* Terminate list */
>   };
>
> +static const struct hid_device_id i2c_hid_blocked_ite_device = {
> +	HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC, USB_VENDOR_ID_ITE, 0x8051)
> +};
> +
> +/*
> + * This list contains devices that can't be activated at all, for example
> + * because activating them breaks other important parts of the system.
> + */
> +static const struct dmi_system_id i2c_hid_dmi_block_table[] = {
> +	/*
> +	 * On ASUS TUF Gaming A16 laptops, there is a device that will make the
> +	 * keyboard controller stop working correctly and flood the CPU with bogus
> +	 * interrupts.
> +	 */
> +	{
> +		.ident = "ASUS TUF Gaming A16 (Ryzen 7 7735HS)",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
> +		},
> +		.driver_data = (void *)&i2c_hid_blocked_ite_device,
> +	},
> +	{
> +		.ident = "ASUS TUF Gaming A16 (Ryzen 9 7940HS)",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
> +		},
> +		.driver_data = (void *)&i2c_hid_blocked_ite_device,
> +	},
> +	{ }	/* Terminate list */
If this *does* end up being the best solution, I think it's better
to patch in the DMI to gpiolib-acpi.c similar to other quirks for floating
GPIOs.  Example:

https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1654

> +};
>
>   struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
>   {
> @@ -492,3 +524,19 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product)
>
>   	return quirks;
>   }
> +
> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
> +{
> +	const struct dmi_system_id *system_id =
> +			dmi_first_match(i2c_hid_dmi_block_table);
> +
> +	if (system_id) {
> +		const struct hid_device_id *device_id =
> +				(struct hid_device_id *)(system_id->driver_data);
> +
> +		if (device_id && device_id->vendor == vendor &&
> +		    device_id->product == product)
> +			return true;
> +	}
> +	return false;
> +}
> diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
> index 2c7b66d5caa0..e17bdd758f39 100644
> --- a/drivers/hid/i2c-hid/i2c-hid.h
> +++ b/drivers/hid/i2c-hid/i2c-hid.h
> @@ -10,6 +10,7 @@ struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
>   char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>   					       unsigned int *size);
>   u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product);
> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product);
>   #else
>   static inline struct i2c_hid_desc
>   		   *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
> @@ -19,6 +20,8 @@ static inline char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>   { return NULL; }
>   static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product)
>   { return 0; }
> +static inline bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
> +{ return false; }
>   #endif
>
>   /**
> --
> 2.40.1
>
>
