Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2DA171251
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 09:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgB0IUk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 03:20:40 -0500
Received: from smtprelay0183.hostedemail.com ([216.40.44.183]:58162 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728454AbgB0IUk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 03:20:40 -0500
X-Greylist: delayed 483 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Feb 2020 03:20:39 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 0EB26800BE66
        for <linux-input@vger.kernel.org>; Thu, 27 Feb 2020 08:12:38 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 40496A8D1;
        Thu, 27 Feb 2020 08:12:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:968:973:978:988:989:1042:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1981:2194:2198:2199:2200:2393:2559:2562:2731:2828:2899:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3874:4250:4321:5007:6119:6742:7514:7576:7653:7903:7904:8603:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12555:12740:12760:12895:13141:13230:13439:14181:14659:14721:21080:21433:21451:21611:21627:21740:21772:21795:21939:30029:30051:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: air39_164c43472a863
X-Filterd-Recvd-Size: 3870
Received: from XPS-9350 (47-209-22-207.mmlkcmtc01.res.dyn.suddenlink.net [47.209.22.207])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Thu, 27 Feb 2020 08:12:33 +0000 (UTC)
Message-ID: <3ec7521233aed6e1c2d27f387b7b2d2b55694e84.camel@perches.com>
Subject: Re: [V1,1/1] Input/misc: add support for Advantech software defined
 button
From:   Joe Perches <joe@perches.com>
To:     ycho1399@gmail.com, linux-input@vger.kernel.org
Cc:     voyandrea@gmail.com, andrea.ho@advantech.com.tw,
        oakley.ding@advantech.com.tw,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Date:   Thu, 27 Feb 2020 00:11:02 -0800
In-Reply-To: <20200227031721.17703-1-Andrea.Ho@advantech.com.tw>
References: <20200227031721.17703-1-Andrea.Ho@advantech.com.tw>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-02-27 at 03:15 +0000, ycho1399@gmail.com wrote:
> From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
> 
> Advantech sw_button is a ACPI event trigger button.
> 
> With this driver, we can report KEY_EVENTs on the
> Advantech Tabletop Network Appliances products and it has been
> tested in FWA1112VC.
> 
> Add the software define button support to report KEY_EVENTs by
> different acts of pressing button (like double-click, long pressed
> and tick) that cloud be get on user interface and trigger the
> customized actions.
[]
> diff --git a/drivers/input/misc/adv_swbutton.c b/drivers/input/misc/adv_swbutton.c
> new file mode 100644

mostly trivia:

> +/*
> + * Switch two elements in array.
> + *
> + * @param xp, yp The array elements need to swap.
> + */
> +void array_swap(unsigned int *xp, unsigned int *yp)
> +{
> +	int temp = *xp;
> +	*xp = *yp;
> +	*yp = temp;
> +}

kernel.h has swap

> +/*
> + * Sorting an array in ascending order
> + *
> + * @param arr The array for sorting.
> + * @param n The array size
> + */
> +void sort_asc(unsigned int arr[], int n)
> +{
> +	int i, j, min_idx;
> +
> +	for (i = 0; i < n - 1; i++) {
> +		min_idx = i;
> +		for (j = i + 1; j < n; j++)
> +			if (arr[j] < arr[min_idx])
> +				min_idx = j;
> +
> +		array_swap(&arr[min_idx], &arr[i]);
> +	}
> +}

sort.h has a generic sort too

> +
> +/*
> + * initial software button timer to check tick or double click
> + *
> + * @param btn Struct of acpi_button that should be required.
> + */ 
> +static void swbtn_init_timer(struct acpi_button *btn)
> +{
> +	pr_info(PREFIX "swbtn timer start\n");

Many of these printks should be removed and ftrace used
when necessary.

> +static int acpi_button_add(struct acpi_device *device)
> +{
> +	struct acpi_button *button;
> +	struct input_dev *input;
> +	const char *hid = acpi_device_hid(device);
> +	char *name, *class;
> +	int error, i;
> +
> +	pr_info(PREFIX "%s\n",  __func__);
> +	button = kzalloc(sizeof(*button), GFP_KERNEL);
> +	if (!button) {
> +		pr_err(PREFIX "alloc acpi_button failed\n");

alloc failure messages aren't really necessary
as a dump_stack() is already done on failure.

[]

> +		for (i = (!swbtn_cfg.dclick_enabled);
> +		     i < (swbtn_cfg.lkey_number + 2); i++) {
> +			pr_info(PREFIX "%d. Enabled keycode[0x%x]\n",
> +				i, swbtn_keycodes[i]);

Is it really useful to print all enabled keycodes?


