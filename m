Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4CC74AACD
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 07:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjGGF4l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 01:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGGF4k (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 01:56:40 -0400
Received: from emcscan.emc.com.tw (emcscan.emc.com.tw [192.72.220.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DEEBCE3
        for <linux-input@vger.kernel.org>; Thu,  6 Jul 2023 22:56:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,187,1684771200"; 
   d="scan'208";a="3515394"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 07 Jul 2023 13:56:36 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(144022:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 07 Jul 2023 13:56:33 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(102915:1:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 07 Jul 2023 13:56:32 +0800 (CST)
From:   "Jingle.Wu" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <phoenix@emc.com.tw>, <josh.chen@emc.com.tw>,
        <dave.wang@emc.com.tw>
References: <20230531090340.1035499-1-jingle.wu@emc.com.tw> <ZJ4MVbTnBT5sM5XR@google.com> 
In-Reply-To: 
Subject: RE: [PATCH]  Input: elan_i2c - Implement inhibit/uninhibit functions.
Date:   Fri, 7 Jul 2023 13:56:32 +0800
Message-ID: <000001d9b097$c7c902d0$575b0870$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQFEypu60gX+z1j7S/LVgPsQG8PWFQJM2ygisMIRvaCAAyDs4A==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wNTM1YzVhYi0xYzhiLTExZWUtYTg2MS1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcMDUzNWM1YWQtMWM4Yi0xMWVlLWE4NjEtZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIxOTI5MCIgdD0iMTMzMzMxODI5OTE4ODE4NTE0IiBoPSIySGR1Uzg1a3llTm1Eb3ZPd3dqdFRyZnc4Ulk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI Dmitry:

...
module_i2c_driver(elan_driver);

static int __init elan_init(void)
{
	return elan_create_lid_handler();
}

static void __exit elan_exit(void)
{
	if (elan_mode_wq)
		elan_destroy_lid_handler();
}

module_init(elan_init);
module_exit(elan_exit);
...

If I change to elan_create_lid_handler() at module_init, complie error as
follow.

<pre><b>./include/linux/module.h:130:49:</b> <font color="#C01C28"><b>error:
</b></font>redefinition of '<b>__inittest</b>'
  130 |         static inline initcall_t __maybe_unused <font
color="#C01C28"><b>__inittest</b></font>(void)                \
      |                                                 <font
color="#C01C28"><b>^~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1666:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_init</b>'
 1666 | <font color="#2AA1B3"><b>module_init</b></font>(elan_init);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/module.h:130:49:</b> <font color="#2AA1B3"><b>note:
</b></font>previous definition of '<b>__inittest</b>' with type '<b>int
(*(void))(void)</b>'
  130 |         static inline initcall_t __maybe_unused <font
color="#2AA1B3"><b>__inittest</b></font>(void)                \
      |                                                 <font
color="#2AA1B3"><b>^~~~~~~~~~</b></font>
<b>./include/linux/device/driver.h:266:1:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_init</b>'
  266 | <font color="#2AA1B3"><b>module_init</b></font>(__driver##_init); \
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/i2c.h:956:9:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_driver</b>'
  956 |         <font
color="#2AA1B3"><b>module_driver</b></font>(__i2c_driver, i2c_add_driver, \
      |         <font color="#2AA1B3"><b>^~~~~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1653:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_i2c_driver</b>'
 1653 | <font color="#2AA1B3"><b>module_i2c_driver</b></font>(elan_driver);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~~~~~~~</b></font>
<b>./include/linux/module.h:132:13:</b> <font color="#C01C28"><b>error:
</b></font>redefinition of '<b>init_module</b>'
  132 |         int <font color="#C01C28"><b>init_module</b></font>(void)
__copy(initfn)                    \
      |             <font color="#C01C28"><b>^~~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1666:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_init</b>'
 1666 | <font color="#2AA1B3"><b>module_init</b></font>(elan_init);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/module.h:132:13:</b> <font color="#2AA1B3"><b>note:
</b></font>previous definition of '<b>init_module</b>' with type
'<b>int(void)</b>'
  132 |         int <font color="#2AA1B3"><b>init_module</b></font>(void)
__copy(initfn)                    \
      |             <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/device/driver.h:266:1:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_init</b>'
  266 | <font color="#2AA1B3"><b>module_init</b></font>(__driver##_init); \
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/i2c.h:956:9:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_driver</b>'
  956 |         <font
color="#2AA1B3"><b>module_driver</b></font>(__i2c_driver, i2c_add_driver, \
      |         <font color="#2AA1B3"><b>^~~~~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1653:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_i2c_driver</b>'
 1653 | <font color="#2AA1B3"><b>module_i2c_driver</b></font>(elan_driver);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~~~~~~~</b></font>
<b>./include/linux/module.h:138:49:</b> <font color="#C01C28"><b>error:
</b></font>redefinition of '<b>__exittest</b>'
  138 |         static inline exitcall_t __maybe_unused <font
color="#C01C28"><b>__exittest</b></font>(void)                \
      |                                                 <font
color="#C01C28"><b>^~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1667:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_exit</b>'
 1667 | <font color="#2AA1B3"><b>module_exit</b></font>(elan_exit);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/module.h:138:49:</b> <font color="#2AA1B3"><b>note:
</b></font>previous definition of '<b>__exittest</b>' with type '<b>void
(*(void))(void)</b>'
  138 |         static inline exitcall_t __maybe_unused <font
color="#2AA1B3"><b>__exittest</b></font>(void)                \
      |                                                 <font
color="#2AA1B3"><b>^~~~~~~~~~</b></font>
<b>./include/linux/device/driver.h:271:1:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_exit</b>'
  271 | <font color="#2AA1B3"><b>module_exit</b></font>(__driver##_exit);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/i2c.h:956:9:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_driver</b>'
  956 |         <font
color="#2AA1B3"><b>module_driver</b></font>(__i2c_driver, i2c_add_driver, \
      |         <font color="#2AA1B3"><b>^~~~~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1653:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_i2c_driver</b>'
 1653 | <font color="#2AA1B3"><b>module_i2c_driver</b></font>(elan_driver);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~~~~~~~</b></font>
<b>./include/linux/module.h:140:14:</b> <font color="#C01C28"><b>error:
</b></font>redefinition of '<b>cleanup_module</b>'
  140 |         void <font
color="#C01C28"><b>cleanup_module</b></font>(void) __copy(exitfn)
\
      |              <font color="#C01C28"><b>^~~~~~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1667:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_exit</b>'
 1667 | <font color="#2AA1B3"><b>module_exit</b></font>(elan_exit);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/module.h:140:14:</b> <font color="#2AA1B3"><b>note:
</b></font>previous definition of '<b>cleanup_module</b>' with type
'<b>void(void)</b>'
  140 |         void <font
color="#2AA1B3"><b>cleanup_module</b></font>(void) __copy(exitfn)
\
      |              <font color="#2AA1B3"><b>^~~~~~~~~~~~~~</b></font>
<b>./include/linux/device/driver.h:271:1:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_exit</b>'
  271 | <font color="#2AA1B3"><b>module_exit</b></font>(__driver##_exit);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~</b></font>
<b>./include/linux/i2c.h:956:9:</b> <font color="#2AA1B3"><b>note:
</b></font>in expansion of macro '<b>module_driver</b>'
  956 |         <font
color="#2AA1B3"><b>module_driver</b></font>(__i2c_driver, i2c_add_driver, \
      |         <font color="#2AA1B3"><b>^~~~~~~~~~~~~</b></font>
<b>drivers/input/mouse/elan_i2c_core.c:1653:1:</b> <font
color="#2AA1B3"><b>note: </b></font>in expansion of macro
'<b>module_i2c_driver</b>'
 1653 | <font color="#2AA1B3"><b>module_i2c_driver</b></font>(elan_driver);
      | <font color="#2AA1B3"><b>^~~~~~~~~~~~~~~~~</b></font>
</pre>

THANJS
JINGLE
-----Original Message-----
From: Jingle.Wu [mailto:jingle.wu@emc.com.tw] 
Sent: Wednesday, July 5, 2023 2:09 PM
To: 'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
Cc: 'linux-kernel@vger.kernel.org' <linux-kernel@vger.kernel.org>;
'linux-input@vger.kernel.org' <linux-input@vger.kernel.org>;
'phoenix@emc.com.tw' <phoenix@emc.com.tw>; 'josh.chen@emc.com.tw'
<josh.chen@emc.com.tw>; 'dave.wang@emc.com.tw' <dave.wang@emc.com.tw>
Subject: RE: [PATCH] Input: elan_i2c - Implement inhibit/uninhibit
functions.

HI Dmitry:

1.
> +static void elan_input_lid_event(struct input_handle *handle, 
> +unsigned
int type,
> +			     unsigned int code, int value) {
> +	struct elan_tp_data *data, *n;
> +
> +	if (type == EV_SW && code == SW_LID) {
> +		list_for_each_entry_safe(data, n,
&elan_devices_with_lid_handler, 
> +list) {

Why do you need the "_safe()" variant here?
-> Because I took the above link as reference.  
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3
578852/7/drivers/hid/hid-multitouch.c#394

2. 
> +	data->lid_switch = true;
> +	INIT_LIST_HEAD(&data->list);
> +	INIT_WORK(&data->lid_work, lid_work_handler);
> +	list_add_tail(&data->list, &elan_devices_with_lid_handler);

It looks like you call elan_create_lid_handler() from elan_probe() which
means it can be called several times (we should not assume there is only one
controller), I do not see it being destroyed in remove() either, so it will
break if you bind/unbind the driver.

I also not sure why you need the list of you have a handler per device.

-> If the elan_create_lid_handler() function not be put into probe(), 
-> the lid
handler would be invalid in elan private data("struct elan_tp_data *data").
Or do you have any suggestions for it? Thanks.

3.
> +	error = elan_create_lid_handler(data);
> +	if (error)
> +		dev_err(dev, "failed to create lid handler: %d\n", error);

Do we need this on _ALL_ devices with ELan controllers, or just certain
ones? If we need this on all devices how did it work before?

-> Yes, we need this on all device.
In Chromeos kernel v5.4 before, the elan_inhibit()/uninhibit function was
built and worked successfully in elan_i2c_driver.
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads
/chromeos-5.4/drivers/input/mouse/elan_i2c_core.c#353


Thanks
JINGLE

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com]
Sent: Friday, June 30, 2023 6:57 AM
To: jingle.wu <jingle.wu@emc.com.tw>
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org;
phoenix@emc.com.tw; josh.chen@emc.com.tw; dave.wang@emc.com.tw
Subject: Re: [PATCH] Input: elan_i2c - Implement inhibit/uninhibit
functions.

Hi Jingle,

On Wed, May 31, 2023 at 05:03:40PM +0800, jingle.wu wrote:
>  Add inhibit/uninhibit functions.

You need to provide justification for this change, i.e. explain why you need
this/what is currently not working or working sub-optimally.

> 
>  Signed-off-by: Jingle.wu <jingle.wu@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 207
> ++++++++++++++++++++++++++++
>  1 file changed, 207 insertions(+)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c
> b/drivers/input/mouse/elan_i2c_core.c
> index 5f0d75a45c80..4ea57f4c7bd4 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -56,6 +56,7 @@ struct elan_tp_data {
>  	struct input_dev	*input;
>  	struct input_dev	*tp_input; /* trackpoint input node */
>  	struct regulator	*vcc;
> +	struct list_head list;	/* for list of devices needing input handler
*/
>  
>  	const struct elan_transport_ops *ops;
>  
> @@ -63,6 +64,11 @@ struct elan_tp_data {
>  	struct completion	fw_completion;
>  	bool			in_fw_update;
>  
> +	struct work_struct	lid_work;
> +	bool			lid_switch;
> +	int			lid_value;
> +	bool			in_inhibit;
> +
>  	struct mutex		sysfs_mutex;
>  
>  	unsigned int		max_x;
> @@ -96,6 +102,9 @@ struct elan_tp_data {
>  	u32			quirks;		/* Various quirks */
>  };
>  
> +static struct workqueue_struct *elan_mode_wq; static 
> +LIST_HEAD(elan_devices_with_lid_handler);
> +
>  static u32 elan_i2c_lookup_quirks(u16 ic_type, u16 product_id)  {
>  	static const struct {
> @@ -329,6 +338,74 @@ static int elan_initialize(struct elan_tp_data *data,
bool skip_reset)
>  	return error;
>  }
>  
> +static int elan_reactivate(struct elan_tp_data *data) {
> +	struct device *dev = &data->client->dev;
> +	int error;
> +
> +	error = elan_set_power(data, true);
> +	if (error)
> +		dev_err(dev, "failed to restore power: %d\n", error);
> +
> +	error = data->ops->sleep_control(data->client, false);
> +	if (error) {
> +		dev_err(dev,
> +			"failed to wake device up: %d\n", error);
> +		return error;
> +	}
> +
> +	return error;
> +}
> +
> +static int elan_inhibit(struct input_dev *input_dev)

I would rather you did not call it inhibit/uninhibit because this is not
what it does.

Please split the logic for recalibration from logic of powering on and off
the device. I also hope in the future firmware revisions the distinction
will be more clear (i.e. have a separate method/command to recalibrate
baseline on demand).

> +{
> +	struct elan_tp_data *data = input_get_drvdata(input_dev);
> +	struct i2c_client *client = data->client;
> +	int error;
> +
> +	dev_dbg(&client->dev, "inhibiting\n");
> +	/*
> +	 * We are taking the mutex to make sure sysfs operations are
> +	 * complete before we attempt to bring the device into low[er]
> +	 * power mode.
> +	 */
> +	error = mutex_lock_interruptible(&data->sysfs_mutex);
> +	if (error)
> +		return error;
> +
> +	disable_irq(client->irq);
> +
> +	error = elan_set_power(data, false);
> +	if (error)
> +		enable_irq(client->irq);
> +
> +	data->in_inhibit = true;
> +	mutex_unlock(&data->sysfs_mutex);
> +
> +	return error;
> +}
> +
> +static int elan_uninhibit(struct input_dev *input_dev) {
> +	struct elan_tp_data *data = input_get_drvdata(input_dev);
> +	struct i2c_client *client = data->client;
> +	int error;
> +
> +	dev_dbg(&client->dev, "uninhibiting\n");
> +	error = mutex_lock_interruptible(&data->sysfs_mutex);
> +	if (error)
> +		return error;
> +
> +	error = elan_reactivate(data);
> +	if (error == 0)
> +		enable_irq(client->irq);
> +
> +	data->in_inhibit = false;
> +	mutex_unlock(&data->sysfs_mutex);
> +
> +	return error;
> +}
> +
>  static int elan_query_device_info(struct elan_tp_data *data)  {
>  	int error;
> @@ -1187,6 +1264,124 @@ static void elan_disable_regulator(void *_data)
>  	regulator_disable(data->vcc);
>  }
>  
> +static void lid_work_handler(struct work_struct *work) {
> +	struct elan_tp_data *data = container_of(work, struct elan_tp_data,
> +					    lid_work);
> +
> +	if (data->lid_value)
> +		elan_inhibit(data->input);
> +	else
> +		elan_uninhibit(data->input);
> +
> +}
> +
> +static void elan_input_lid_event(struct input_handle *handle, unsigned
int type,
> +			     unsigned int code, int value) {
> +	struct elan_tp_data *data, *n;
> +
> +	if (type == EV_SW && code == SW_LID) {
> +		list_for_each_entry_safe(data, n,
&elan_devices_with_lid_handler,
> +list) {

Why do you need the "_safe()" variant here?

> +			data->lid_value = value;
> +			queue_work(elan_mode_wq, &data->lid_work);
> +		}
> +	}
> +
> +}
> +
> +struct elan_input_lid {
> +	struct input_handle handle;
> +};
> +
> +static int elan_input_lid_connect(struct input_handler *handler,
> +				struct input_dev *dev,
> +				const struct input_device_id *id) {
> +	struct elan_input_lid *lid;
> +	char *name;
> +	int error;
> +
> +	lid = kzalloc(sizeof(*lid), GFP_KERNEL);
> +	if (!lid)
> +		return -ENOMEM;
> +	name = kasprintf(GFP_KERNEL, "elan-i2c-lid-%s",
dev_name(&dev->dev));
> +	if (!name) {
> +		error = -ENOMEM;
> +		goto err_free_lid;
> +	}
> +	lid->handle.dev = dev;
> +	lid->handle.handler = handler;
> +	lid->handle.name = name;
> +	lid->handle.private = lid;
> +	error = input_register_handle(&lid->handle);
> +	if (error)
> +		goto err_free_name;
> +	error = input_open_device(&lid->handle);
> +	if (error)
> +		goto err_unregister_handle;
> +	return 0;
> +err_unregister_handle:
> +	input_unregister_handle(&lid->handle);
> +err_free_name:
> +	kfree(name);
> +err_free_lid:
> +	kfree(lid);
> +	return error;
> +}
> +
> +static void elan_input_lid_disconnect(struct input_handle *handle) {
> +	struct elan_input_lid *lid = handle->private;
> +
> +	input_close_device(handle);
> +	input_unregister_handle(handle);
> +	kfree(handle->name);
> +	kfree(lid);
> +}
> +
> +static const struct input_device_id elan_input_lid_ids[] = {
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
INPUT_DEVICE_ID_MATCH_SWBIT,
> +		.evbit = { BIT_MASK(EV_SW) },
> +		.swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
> +	},
> +	{ },
> +};
> +
> +static struct input_handler elan_input_lid_handler = {
> +	.event =	elan_input_lid_event,
> +	.connect =	elan_input_lid_connect,
> +	.disconnect =	elan_input_lid_disconnect,
> +	.name =		"elan-i2c-lid",
> +	.id_table =	elan_input_lid_ids,
> +};
> +
> +static int elan_create_lid_handler(struct elan_tp_data *data) {
> +	int error = 0;
> +
> +	elan_mode_wq = create_singlethread_workqueue("elan-i2c-lid");
> +	if (elan_mode_wq == NULL)
> +		return -ENOMEM;
> +	error = input_register_handler(&elan_input_lid_handler);
> +	if (error)
> +		goto remove_wq;
> +
> +	data->lid_switch = true;
> +	INIT_LIST_HEAD(&data->list);
> +	INIT_WORK(&data->lid_work, lid_work_handler);
> +	list_add_tail(&data->list, &elan_devices_with_lid_handler);

It looks like you call elan_create_lid_handler() from elan_probe() which
means it can be called several times (we should not assume there is only one
controller), I do not see it being destroyed in remove() either, so it will
break if you bind/unbind the driver.

I also not sure why you need the list of you have a handler per device.

> +
> +	return 0;
> +
> +remove_wq:
> +	data->lid_switch = false;
> +	destroy_workqueue(elan_mode_wq);
> +	elan_mode_wq = NULL;
> +	return error;
> +}
> +
>  static int elan_probe(struct i2c_client *client)  {
>  	const struct elan_transport_ops *transport_ops; @@ -1325,6 +1520,10 
> @@ static int elan_probe(struct i2c_client *client)
>  		}
>  	}
>  
> +	error = elan_create_lid_handler(data);
> +	if (error)
> +		dev_err(dev, "failed to create lid handler: %d\n", error);

Do we need this on _ALL_ devices with ELan controllers, or just certain
ones? If we need this on all devices how did it work before?

> +
>  	return 0;
>  }
>  
> @@ -1334,6 +1533,10 @@ static int elan_suspend(struct device *dev)
>  	struct elan_tp_data *data = i2c_get_clientdata(client);
>  	int ret;
>  
> +	/* Wait for switch on completion */
> +	if (data->lid_switch)
> +		flush_workqueue(elan_mode_wq);
> +
>  	/*
>  	 * We are taking the mutex to make sure sysfs operations are
>  	 * complete before we attempt to bring the device into low[er] @@
> -1371,6 +1574,10 @@ static int elan_resume(struct device *dev)
>  	struct elan_tp_data *data = i2c_get_clientdata(client);
>  	int error;
>  
> +	/* Wait for switch on completion */
> +	if (data->lid_switch)
> +		flush_workqueue(elan_mode_wq);
> +
>  	if (!device_may_wakeup(dev)) {
>  		error = regulator_enable(data->vcc);
>  		if (error) {
> --
> 2.34.1
> 

Thanks.

--
Dmitry

