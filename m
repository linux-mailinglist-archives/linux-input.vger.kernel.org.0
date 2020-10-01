Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE8827F790
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 03:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgJABnv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 21:43:51 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47543 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbgJABnv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 21:43:51 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id A4BB55C0262;
        Wed, 30 Sep 2020 21:43:49 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute2.internal (MEProxy); Wed, 30 Sep 2020 21:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duggan.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=N5xYIHNsQj6YcLP2u7bpecTn7CyjbfD
        /aVUxvvuMkDY=; b=EAHXRTFCPKtzDcPZQ31Tr62i6gweFh4/VsShVPcJw9hVD5H
        i5VRO7n5k3/+26s6x7OgHKI5aRC8rLN+PT/698Mh28CTd6zXZI7sVIiKaN5Z3QDc
        ukWfg+6OyJCAcqqU0A0YTyTxZNxEQY1a2KNoj04liORjmAUXm0THxL7oNgqknAuy
        YLWHeCNvXEbxRT3ZrdyA5of99z9CnZ2cmUrUZMBbp2MOfRMmjMp5FokZL9CfxJAr
        9EBvp3tavaBFA7U3jlGsUH6dCe2AjSHeXJ0sw6BEbIQjlQO3PC7ykoxZKxfPVwr9
        geCi0AP+Dr3vAk2sHvEDxOO6b3knNmbNUrN5yqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N5xYIH
        NsQj6YcLP2u7bpecTn7CyjbfD/aVUxvvuMkDY=; b=AHFoXn1hq2ZSlJ47TUq69+
        eda6b8knnzuXPo2w6IU3wshKjUbxANgMyxhlqjPfJlpfuRnD+83CrmjTdhOhMMv6
        L9AC50hNeamGYoHKE0WFgIKLr6mleQvthsuIcrXChMK6HXnA4DixPhHbafXQp8Vv
        07d+fAdpyx4EAk+6OmNcaty/1scagWEVMxNaCSEf6i3AWaw6gijfIbXgBVlcgF6P
        8j0kMqjyEkNRtjB05y+wtwyaL3ZiXb5me3wjss+2hnSAC3mbQXFr7RXnI2Y4/Q3g
        tZpllQmmbciufYGTMN4ugvYJ/ep6dBieQS/MFvGKfCtlukvsg9gNvh6l46irDxAg
        ==
X-ME-Sender: <xms:VTR1X4HUQKo25Y0GMiuiy-p0e4u487aD95_V2t5F7Olfxu2zxEBJTA>
    <xme:VTR1XxV9aMncB8G_aORNp05ZTZsUkGw9xrJGR2IgsvSezS4FcJ_5-WkxxLRAZGYeW
    egQeBpwGP1WjGAaig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucffuhhgghgrnhdfuceorghnughrvgifseguuhhgghgrnhdruhhsqeenucggtffrrg
    htthgvrhhnpedvgfeuvefgffelvefgieeujeeuueekiedtvedtleehuefgvedtgedtudeu
    ieelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesughughhgrghnrdhush
X-ME-Proxy: <xmx:VTR1XyJ4mh7zy86UjTGt_CqrHpcHJKKKIj9e_4v8obRH3y9_JbRFIw>
    <xmx:VTR1X6Ee70_znYDeBNTWORRjIAJSeyKQsJpY6zwrfUayJx7F1Icm0Q>
    <xmx:VTR1X-V0BPV_mecCj3JT_yFQGD_UJGTldcOjDLGGD5Fp9uZ5wIkL8A>
    <xmx:VTR1X5F2b3QKSjvu2kr7np2YWffo8jUl-4o8ST1OKvrf2IUVq4MELw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 320643C0411; Wed, 30 Sep 2020 21:43:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <28c71947-0cab-443f-b405-33cf3ab7ecaf@www.fastmail.com>
In-Reply-To: <20200930094147.635556-2-vincent.huang@tw.synaptics.com>
References: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
 <20200930094147.635556-2-vincent.huang@tw.synaptics.com>
Date:   Wed, 30 Sep 2020 18:43:06 -0700
From:   "Andrew Duggan" <andrew@duggan.us>
To:     "Vincent Huang" <vincent.huang@tw.synaptics.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Jiri Kosina" <jikos@kernel.org>,
        "Andrew Duggan" <aduggan@synaptics.com>,
        "Hans de Goede" <hdegoede@redhat.com>,
        "Benjamin Tissoires" <btissoir@redhat.com>,
        "Lyude Paul" <lyude@redhat.com>,
        "Chris Heiny" <chris.heiny@synaptics.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_1/2]_Input:_synaptics-rmi4_-_rename_f30=5Fdata_t?=
 =?UTF-8?Q?o_gpio=5Fdata?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Wed, Sep 30, 2020, at 2:41 AM, Vincent Huang wrote:
> f30_data in rmi_device_platform_data could be also referenced by RMI
> function 3A, so rename it and the structure name to avoid confusion.
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Andrew Duggan <aduggan@synaptics.com>

> ---
>  drivers/hid/hid-rmi.c           |  2 +-
>  drivers/input/mouse/synaptics.c |  2 +-
>  drivers/input/rmi4/rmi_f30.c    | 14 +++++++-------
>  include/linux/rmi.h             | 11 ++++++-----
>  4 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
> index 9ce22acdfaca..62315e31d520 100644
> --- a/drivers/hid/hid-rmi.c
> +++ b/drivers/hid/hid-rmi.c
> @@ -722,7 +722,7 @@ static int rmi_probe(struct hid_device *hdev, const 
> struct hid_device_id *id)
>  	}
>  
>  	if (data->device_flags & RMI_DEVICE_HAS_PHYS_BUTTONS)
> -		rmi_hid_pdata.f30_data.disable = true;
> +		rmi_hid_pdata.gpio_data.disable = true;
>  
>  	data->xport.dev = hdev->dev.parent;
>  	data->xport.pdata = rmi_hid_pdata;
> diff --git a/drivers/input/mouse/synaptics.c 
> b/drivers/input/mouse/synaptics.c
> index 4b81b2d0fe06..8a54efd6eb95 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -1752,7 +1752,7 @@ static int synaptics_create_intertouch(struct 
> psmouse *psmouse,
>  			.kernel_tracking = false,
>  			.topbuttonpad = topbuttonpad,
>  		},
> -		.f30_data = {
> +		.gpio_data = {
>  			.buttonpad = SYN_CAP_CLICKPAD(info->ext_cap_0c),
>  			.trackstick_buttons =
>  				!!SYN_CAP_EXT_BUTTONS_STICK(info->ext_cap_10),
> diff --git a/drivers/input/rmi4/rmi_f30.c b/drivers/input/rmi4/rmi_f30.c
> index a90dad1d9ac7..35045f161dc2 100644
> --- a/drivers/input/rmi4/rmi_f30.c
> +++ b/drivers/input/rmi4/rmi_f30.c
> @@ -168,17 +168,17 @@ static int rmi_f30_config(struct rmi_function *fn)
>  				rmi_get_platform_data(fn->rmi_dev);
>  	int error;
>  
> -	/* can happen if f30_data.disable is set */
> +	/* can happen if gpio_data.disable is set */
>  	if (!f30)
>  		return 0;
>  
> -	if (pdata->f30_data.trackstick_buttons) {
> +	if (pdata->gpio_data.trackstick_buttons) {
>  		/* Try [re-]establish link to F03. */
>  		f30->f03 = rmi_find_function(fn->rmi_dev, 0x03);
>  		f30->trackstick_buttons = f30->f03 != NULL;
>  	}
>  
> -	if (pdata->f30_data.disable) {
> +	if (pdata->gpio_data.disable) {
>  		drv->clear_irq_bits(fn->rmi_dev, fn->irq_mask);
>  	} else {
>  		/* Write Control Register values back to device */
> @@ -245,10 +245,10 @@ static int rmi_f30_map_gpios(struct rmi_function *fn,
>  		if (!rmi_f30_is_valid_button(i, f30->ctrl))
>  			continue;
>  
> -		if (pdata->f30_data.trackstick_buttons &&
> +		if (pdata->gpio_data.trackstick_buttons &&
>  		    i >= TRACKSTICK_RANGE_START && i < TRACKSTICK_RANGE_END) {
>  			f30->gpioled_key_map[i] = trackstick_button++;
> -		} else if (!pdata->f30_data.buttonpad || !button_mapped) {
> +		} else if (!pdata->gpio_data.buttonpad || !button_mapped) {
>  			f30->gpioled_key_map[i] = button;
>  			input_set_capability(input, EV_KEY, button++);
>  			button_mapped = true;
> @@ -264,7 +264,7 @@ static int rmi_f30_map_gpios(struct rmi_function *fn,
>  	 * but I am not sure, so use only the pdata info and the number of
>  	 * mapped buttons.
>  	 */
> -	if (pdata->f30_data.buttonpad || (button - BTN_LEFT == 1))
> +	if (pdata->gpio_data.buttonpad || (button - BTN_LEFT == 1))
>  		__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
>  
>  	return 0;
> @@ -372,7 +372,7 @@ static int rmi_f30_probe(struct rmi_function *fn)
>  	struct f30_data *f30;
>  	int error;
>  
> -	if (pdata->f30_data.disable)
> +	if (pdata->gpio_data.disable)
>  		return 0;
>  
>  	if (!drv_data->input) {
> diff --git a/include/linux/rmi.h b/include/linux/rmi.h
> index 7b22366d0065..00dda5381bf8 100644
> --- a/include/linux/rmi.h
> +++ b/include/linux/rmi.h
> @@ -102,15 +102,16 @@ struct rmi_2d_sensor_platform_data {
>  };
>  
>  /**
> - * struct rmi_f30_data - overrides defaults for a single F30 GPIOs/LED 
> chip.
> + * struct rmi_gpio_data - overrides defaults for a single F30/F3A 
> GPIOs/LED
> + * chip.
>   * @buttonpad - the touchpad is a buttonpad, so enable only the first 
> actual
>   * button that is found.
> - * @trackstick_buttons - Set when the function 30 is handling the 
> physical
> + * @trackstick_buttons - Set when the function 30 or 3a is handling 
> the physical
>   * buttons of the trackstick (as a PS/2 passthrough device).
> - * @disable - the touchpad incorrectly reports F30 and it should be 
> ignored.
> + * @disable - the touchpad incorrectly reports F30/F3A and it should 
> be ignored.
>   * This is a special case which is due to misconfigured firmware.
>   */
> -struct rmi_f30_data {
> +struct rmi_gpio_data {
>  	bool buttonpad;
>  	bool trackstick_buttons;
>  	bool disable;
> @@ -218,7 +219,7 @@ struct rmi_device_platform_data {
>  	/* function handler pdata */
>  	struct rmi_2d_sensor_platform_data sensor_pdata;
>  	struct rmi_f01_power_management power_management;
> -	struct rmi_f30_data f30_data;
> +	struct rmi_gpio_data gpio_data;
>  };
>  
>  /**
> -- 
> 2.25.1
> 
>
