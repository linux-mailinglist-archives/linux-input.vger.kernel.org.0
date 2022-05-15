Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE1B5274B9
	for <lists+linux-input@lfdr.de>; Sun, 15 May 2022 02:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbiEOAHr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 May 2022 20:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbiEOAHq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 May 2022 20:07:46 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057309FEB
        for <linux-input@vger.kernel.org>; Sat, 14 May 2022 17:07:45 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id l16so14537488oil.6
        for <linux-input@vger.kernel.org>; Sat, 14 May 2022 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=zcNDlT31PXG0OMbvjtwSYbEBTXISPhLjUMVdG9bFdcc=;
        b=q7DXXO/VGydFk70gXe+2ZEsgtzyZ7vXFAgRJVIaaVcPVxIpstjxS4PUPGuzjP97ni+
         FK0tucO07E79ruBkG4syKyOWyc5VBU/GhKubr9cw+NeGYbdKMlBpgvKUNch/kRkCb3oa
         OypTiCZvTQkLaow3YkO5clNjsjUlZbOGOK67QDWz5tUcMv/1p5+ZH0SvJhZyyjgIbQBM
         nLsV5WbiD4cOc/i8Nzq8CssTV7hStqCWH3BHiDo5ZLivOXxTv9Z8QGr9HPc2jaSXsvSP
         xEWRWF+7+oN70uI83sw8sz+NFX9nFhOIeLhRl4TfQbTxZFFRYwLx560xDeWmypxWRmBW
         L5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :subject:references:in-reply-to:content-transfer-encoding;
        bh=zcNDlT31PXG0OMbvjtwSYbEBTXISPhLjUMVdG9bFdcc=;
        b=sYghFE/MGXdHKSN2UD+F+Rm3slcbEBwGEqbd+K6C/lMR0WYSjfE4n/MQgdqfUjyIeK
         JCQirSU/V7a3/f+RZOwMXnMefDe20pavd03LEjQ/pkYOzbhc2WV6I7X1wbP/2H1bEnyk
         KeGdX0Ko4NZcsmhi0KdmvR8wFWVcl9vrlbwI3xbVXA1W4CQRdHGQEXohWvY3TrcAtrjb
         o297HI9wfNLN9jGF3I6rNrvrDKgppAe1gQaGI5ca+07qoKd/57hl9bDAx4T+DkAL9ss1
         Sf41Tv0zqX2/pXju6JR+ZXQRC15OA/3//NfycerQYjnpvFMsQ5AFNcv8FrOrWNFpDQXM
         0RfQ==
X-Gm-Message-State: AOAM530vhDZvuA6h22pYw5Vs+UVrYemQ8v0sKpn8eBRc+pC8Ht9gazyP
        eVLtaKYTDNBvQEq+mMNxdtk=
X-Google-Smtp-Source: ABdhPJy6pyR/qtIcL/NsdNAgerlUX5HO4IT/RJDitTDYGIUC64YE9qOeCj+B/Rvr+ibrpAl1tzs6cg==
X-Received: by 2002:aca:3088:0:b0:326:d72b:3ea1 with SMTP id w130-20020aca3088000000b00326d72b3ea1mr10046021oiw.1.1652573263594;
        Sat, 14 May 2022 17:07:43 -0700 (PDT)
Received: from ?IPV6:2804:d51:495a:8100:5544:c32d:eb1:5107? ([2804:d51:495a:8100:5544:c32d:eb1:5107])
        by smtp.gmail.com with ESMTPSA id q4-20020acac004000000b00325cda1ffb4sm2483335oif.51.2022.05.14.17.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 May 2022 17:07:42 -0700 (PDT)
Message-ID: <eaa15224-50d9-e3b4-f5df-a29ef6a9043b@gmail.com>
Date:   Sat, 14 May 2022 21:07:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From:   marcoshalano@gmail.com
To:     Angela Czubak <acz@semihalf.com>, linux-input@vger.kernel.org,
        upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: Re: [PATCH v3 17/17] HID: multitouch: Add lid handler for touchpad on
 Redrix chromebook
References: <20220513093927.1632262-1-acz@semihalf.com>
 <20220513093927.1632262-18-acz@semihalf.com>
In-Reply-To: <20220513093927.1632262-18-acz@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 13/05/2022 06:39, Angela Czubak <acz@semihalf.com> wrote:
> If user closes the lid the touchscreen gets close to the touchpad surface,
> which causes interference and makes the touchpad enter noise mode.
> Right after opening the lid the cursor is unresponsive because of the mode
> mentioned.
> To fix this issue we switch the surface off and on so that Elan's FW
> performs recalibration once the lid has been opened.
> 
A non related question: this hid-haptic module is made just for newer touchpads which have a haptic response instead of regular clicks, or the haptic logic could be extended for other haptic devices, like Sony's DualSense controller triggers?

> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---
>   drivers/hid/hid-multitouch.c | 220 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 219 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 2d1b8c400c2f..73e47fe7d773 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -32,11 +32,14 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
>   #include <linux/hid.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   #include <linux/input/mt.h>
>   #include <linux/jiffies.h>
> +#include <linux/sched.h>
>   #include <linux/string.h>
>   #include <linux/timer.h>
>   
> @@ -159,6 +162,7 @@ struct mt_report_data {
>   };
>   
>   struct mt_device {
> +	struct list_head list;	/* for list of devices needing input handler */
>   	struct mt_class mtclass;	/* our mt device class */
>   	struct timer_list release_timer;	/* to release sticky fingers */
>   	struct hid_haptic_device *haptic;	/* haptic related configuration */
> @@ -173,8 +177,15 @@ struct mt_device {
>   
>   	struct list_head applications;
>   	struct list_head reports;
> +
> +	struct work_struct lid_work;
> +	struct mutex mode_mutex;
> +	bool lid_switch;
>   };
>   
> +static struct workqueue_struct *mt_mode_wq;
> +static LIST_HEAD(mt_devices_with_lid_handler);
> +
>   static void mt_post_parse_default_settings(struct mt_device *td,
>   					   struct mt_application *app);
>   static void mt_post_parse(struct mt_device *td, struct mt_application *app);
> @@ -394,6 +405,91 @@ static const struct mt_class mt_classes[] = {
>   	{ }
>   };
>   
> +static void mt_input_lid_event(struct input_handle *handle, unsigned int type,
> +			     unsigned int code, int value)
> +{
> +	struct mt_device *td, *n;
> +
> +	if (type == EV_SW && code == SW_LID && !value) {
> +		list_for_each_entry_safe(td, n, &mt_devices_with_lid_handler, list)
> +			queue_work(mt_mode_wq, &td->lid_work);
> +	}
> +}
> +
> +struct mt_input_lid {
> +	struct input_handle handle;
> +};
> +
> +static int mt_input_lid_connect(struct input_handler *handler,
> +				struct input_dev *dev,
> +				const struct input_device_id *id)
> +{
> +	struct mt_input_lid *lid;
> +	char *name;
> +	int error;
> +
> +	lid = kzalloc(sizeof(*lid), GFP_KERNEL);
> +	if (!lid)
> +		return -ENOMEM;
> +
> +	name = kasprintf(GFP_KERNEL, "hid-mt-lid-%s", dev_name(&dev->dev));
> +	if (!name) {
> +		error = -ENOMEM;
> +		goto err_free_lid;
> +	}
> +
> +	lid->handle.dev = dev;
> +	lid->handle.handler = handler;
> +	lid->handle.name = name;
> +	lid->handle.private = lid;
> +
> +	error = input_register_handle(&lid->handle);
> +	if (error)
> +		goto err_free_name;
> +
> +	error = input_open_device(&lid->handle);
> +	if (error)
> +		goto err_unregister_handle;
> +
> +	return 0;
> +
> +err_unregister_handle:
> +	input_unregister_handle(&lid->handle);
> +err_free_name:
> +	kfree(name);
> +err_free_lid:
> +	kfree(lid);
> +	return error;
> +}
> +
> +static void mt_input_lid_disconnect(struct input_handle *handle)
> +{
> +	struct mt_input_lid *lid = handle->private;
> +
> +	input_close_device(handle);
> +	input_unregister_handle(handle);
> +
> +	kfree(handle->name);
> +	kfree(lid);
> +}
> +
> +static const struct input_device_id mt_input_lid_ids[] = {
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT | INPUT_DEVICE_ID_MATCH_SWBIT,
> +		.evbit = { BIT_MASK(EV_SW) },
> +		.swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
> +	},
> +	{ },
> +};
> +
> +static struct input_handler mt_input_lid_handler = {
> +	.event =	mt_input_lid_event,
> +	.connect =	mt_input_lid_connect,
> +	.disconnect =	mt_input_lid_disconnect,
> +	.name =		"hid-mt-lid",
> +	.id_table =	mt_input_lid_ids,
> +};
> +
>   static ssize_t mt_show_quirks(struct device *dev,
>   			   struct device_attribute *attr,
>   			   char *buf)
> @@ -548,6 +644,83 @@ static struct mt_usages *mt_allocate_usage(struct hid_device *hdev,
>   	return usage;
>   }
>   
> +static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
> +			 bool surface_switch, bool button_switch);
> +
> +static void lid_work_handler(struct work_struct *work)
> +{
> +
> +	struct mt_device *td = container_of(work, struct mt_device,
> +					    lid_work);
> +	struct hid_device *hdev = td->hdev;
> +
> +	mutex_lock(&td->mode_mutex);
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, false, false);
> +	/* Elan's touchpad VID 323B needs this delay to handle both switch
> +	 * surface off and switch surface on and trigger recalibration
> +	 * properly.
> +	 */
> +	msleep(50);
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +	mutex_unlock(&td->mode_mutex);
> +}
> +
> +static const struct dmi_system_id mt_lid_handler_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Redrix"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Redrix4ES"),
> +		},
> +	},
> +	{}
> +};
> +
> +static int mt_create_lid_handler(void)
> +{
> +	int error = 0;
> +
> +	if (!dmi_check_system(mt_lid_handler_dmi_table))
> +		return 0;
> +
> +	mt_mode_wq = alloc_ordered_workqueue("hid-mt-lid", WQ_FREEZABLE);
> +	if (mt_mode_wq == NULL)
> +		return -ENOMEM;
> +
> +	error = input_register_handler(&mt_input_lid_handler);
> +	if (error)
> +		goto remove_wq;
> +
> +	return 0;
> +
> +remove_wq:
> +	destroy_workqueue(mt_mode_wq);
> +	mt_mode_wq = NULL;
> +	return error;
> +}
> +
> +static void mt_configure_lid_handler(struct mt_device *td)
> +{
> +	struct hid_device *hdev = td->hdev;
> +
> +	if (hdev->bus != BUS_I2C)
> +		return;
> +
> +	td->lid_switch = true;
> +	list_add_tail(&td->list, &mt_devices_with_lid_handler);
> +}
> +
> +static void mt_destroy_lid_handler(void)
> +{
> +	input_unregister_handler(&mt_input_lid_handler);
> +	destroy_workqueue(mt_mode_wq);
> +}
> +
>   static struct mt_application *mt_allocate_application(struct mt_device *td,
>   						      struct hid_report *report)
>   {
> @@ -571,6 +744,8 @@ static struct mt_application *mt_allocate_application(struct mt_device *td,
>   	if (application == HID_DG_TOUCHPAD) {
>   		mt_application->mt_flags |= INPUT_MT_POINTER;
>   		td->inputmode_value = MT_INPUTMODE_TOUCHPAD;
> +		if (mt_mode_wq)
> +			mt_configure_lid_handler(td);
>   	}
>   
>   	mt_application->scantime = DEFAULT_ZERO;
> @@ -1767,6 +1942,10 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   	INIT_LIST_HEAD(&td->applications);
>   	INIT_LIST_HEAD(&td->reports);
>   
> +	INIT_LIST_HEAD(&td->list);
> +	INIT_WORK(&td->lid_work, lid_work_handler);
> +	mutex_init(&td->mode_mutex);
> +
>   	if (id->vendor == HID_ANY_ID && id->product == HID_ANY_ID)
>   		td->serial_maybe = true;
>   
> @@ -1830,12 +2009,18 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
>   	struct mt_device *td = hid_get_drvdata(hdev);
>   	struct hid_haptic_device *haptic = td->haptic;
>   
> +	/* Wait for switch on completion */
> +	if (td->lid_switch)
> +		flush_workqueue(mt_mode_wq);
> +
> +	mutex_lock(&td->mode_mutex);
>   	/* High latency is desirable for power savings during S3/S0ix */
>   	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
>   	    !hid_hw_may_wakeup(hdev))
>   		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
>   	else
>   		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
> +	mutex_unlock(&td->mode_mutex);
>   
>   	if (td->is_haptic_touchpad)
>   		hid_haptic_suspend(hdev, haptic);
> @@ -1849,7 +2034,10 @@ static int mt_reset_resume(struct hid_device *hdev)
>   	struct hid_haptic_device *haptic = td->haptic;
>   
>   	mt_release_contacts(hdev);
> +
> +	mutex_lock(&td->mode_mutex);
>   	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +	mutex_unlock(&td->mode_mutex);
>   
>   	if (td->is_haptic_touchpad)
>   		hid_haptic_resume(hdev, haptic);
> @@ -1868,7 +2056,9 @@ static int mt_resume(struct hid_device *hdev)
>   
>   	hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
>   
> +	mutex_lock(&td->mode_mutex);
>   	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +	mutex_unlock(&td->mode_mutex);
>   
>   	if (td->is_haptic_touchpad)
>   		hid_haptic_resume(hdev, haptic);
> @@ -1883,7 +2073,9 @@ static int mt_reset(struct hid_device *hdev)
>   	struct hid_haptic_device *haptic = td->haptic;
>   
>   	mt_release_contacts(hdev);
> +	mutex_lock(&td->mode_mutex);
>   	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +	mutex_unlock(&td->mode_mutex);
>   
>   	if (td->is_haptic_touchpad)
>   		hid_haptic_reset(hdev, haptic);
> @@ -1899,6 +2091,8 @@ static void mt_remove(struct hid_device *hdev)
>   
>   	sysfs_remove_group(&hdev->dev.kobj, &mt_attribute_group);
>   	hid_hw_stop(hdev);
> +
> +	list_del(&td->list);
>   }
>   
>   /*
> @@ -2302,4 +2496,28 @@ static struct hid_driver mt_driver = {
>   	.resume = mt_resume,
>   #endif
>   };
> -module_hid_driver(mt_driver);
> +
> +static int __init mt_init(void)
> +{
> +	int ret;
> +
> +	ret = hid_register_driver(&mt_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = mt_create_lid_handler();
> +	if (ret)
> +		hid_unregister_driver(&mt_driver);
> +
> +	return ret;
> +}
> +module_init(mt_init);
> +
> +static void __exit mt_exit(void)
> +{
> +	if (mt_mode_wq)
> +		mt_destroy_lid_handler();
> +
> +	hid_unregister_driver(&mt_driver);
> +}
> +module_exit(mt_exit);
> 

