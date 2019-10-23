Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5EBE1067
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 05:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbfJWDJa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 23:09:30 -0400
Received: from p3plsmtpa07-08.prod.phx3.secureserver.net ([173.201.192.237]:51891
        "EHLO p3plsmtpa07-08.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727309AbfJWDJa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 23:09:30 -0400
Received: from labundy.com ([136.49.227.119])
        by :SMTPAUTH: with ESMTPSA
        id N71bi1FneKVk0N71ci7phJ; Tue, 22 Oct 2019 20:09:29 -0700
Date:   Tue, 22 Oct 2019 22:09:26 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     lee.jones@linaro.org, dmitry.torokhov@gmail.com, jdelvare@suse.com,
        linux@roeck-us.net, thierry.reding@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-hwmon@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        linux-pwm@vger.kernel.org, knaack.h@gmx.de, lars@metafoo.de,
        pmeerw@pmeerw.net, linux-iio@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Subject: Re: [PATCH 7/8] iio: proximity: Add support for Azoteq IQS622
 proximity sensor
Message-ID: <20191023030926.GA4458@labundy.com>
References: <1571631083-4962-1-git-send-email-jeff@labundy.com>
 <1571631083-4962-8-git-send-email-jeff@labundy.com>
 <20191022122341.32f0883f@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022122341.32f0883f@archlinux>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CMAE-Envelope: MS4wfJ7L6SZZRs9QEKetqQuLCirqsgeSEMNqTdbU5gW8I8RkGRJvkaPwoUScNrbRSredWSxwP4GLFTFo8HzP7OAqW6lZ/8O/ToyJk+iOQhlpsnUmh/0R5M/E
 BtSREfMRr8ntUYQdVHtQpLWUCO9NyVd47J4ahjVMn71Y5fFHN5frD5akO0HMmeBSRHheVk4Ks/OBCnFgIs+lc3uH0E1E2jrF5BWnO0fGbuvR/jXejJWGkJ3s
 odezzyEBRUX2a8hGEUwWey16Krw5r6zlcpiQ7yPfjJBOjFTlBI4ATYgxs7yF+jBP3rrWAQ9Pos2UPsr0lzOK+v8cOeD8hhrHaT1J+RRx3kysHYPplUAAPCbH
 aJlDMo/0fOzzbmpwyKB/+SiEjsCfj2DIoDE02fIITkKLpRSes2ohD48B2EWMHMBjV9r6NXpSDFdEi9AkYpXu9dpQaUnVmh8FiQoKKyuZYu6VOrM7H4ixQQOm
 lNUGyMnuntzwNhm82b+Pzp3vb119BEbR6+EkD4SuDestbPlgG8zLykXraS5tt9m2ATvkg50ciTtbHXGUP4y7b4fCykSEQSXXEdC9hUZT9kvl2XZdqDLrZ4Lt
 EE1Q+8uEXniyrm5vspKZWAjlYgEK+ItDQ4d0i4hDL82CAYPMrE0VxaijXPOPDkF6zUY6WjG9EdgqE7RBBXQE+rtv1THNO1iGQeGL1Q1qhWIaD4kTBZl8K1Xu
 3GkGYxyTgMM=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

Thanks again for your prompt review here and the rest of the series.

On Tue, Oct 22, 2019 at 12:23:46PM +0100, Jonathan Cameron wrote:
> On Sun, 20 Oct 2019 23:11:22 -0500
> Jeff LaBundy <jeff@labundy.com> wrote:
> 
> > This patch adds support for the Azoteq IQS622 proximity sensor,
> > capable of reporting a unitless measurement of a target's prox-
> > imity to the sensor.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> A few trivial bits inline + that question on the dt binding and
> whether it is something we ought to be deciding at device build
> time or whether there are devices where it should be configurable.
> 
> Thanks,
> 
> Jonathan
> 
> > ---
> >  drivers/iio/proximity/Kconfig       |  10 ++
> >  drivers/iio/proximity/Makefile      |   1 +
> >  drivers/iio/proximity/iqs622-prox.c | 334 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 345 insertions(+)
> >  create mode 100644 drivers/iio/proximity/iqs622-prox.c
> > 
> > diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
> > index d536014..2366fd7 100644
> > --- a/drivers/iio/proximity/Kconfig
> > +++ b/drivers/iio/proximity/Kconfig
> > @@ -21,6 +21,16 @@ endmenu
> >  
> >  menu "Proximity and distance sensors"
> >  
> > +config IQS622_PROX
> > +	tristate "Azoteq IQS622 proximity sensor"
> > +	depends on MFD_IQS62X
> > +	help
> > +	  Say Y here if you want to build support for the Azoteq IQS622
> > +	  proximity sensor.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called iqs622-prox.
> > +
> >  config ISL29501
> >  	tristate "Intersil ISL29501 Time Of Flight sensor"
> >  	depends on I2C
> > diff --git a/drivers/iio/proximity/Makefile b/drivers/iio/proximity/Makefile
> > index 0bb5f9d..802ba9d 100644
> > --- a/drivers/iio/proximity/Makefile
> > +++ b/drivers/iio/proximity/Makefile
> > @@ -5,6 +5,7 @@
> >  
> >  # When adding new entries keep the list in alphabetical order
> >  obj-$(CONFIG_AS3935)		+= as3935.o
> > +obj-$(CONFIG_IQS622_PROX)	+= iqs622-prox.o
> >  obj-$(CONFIG_ISL29501)		+= isl29501.o
> >  obj-$(CONFIG_LIDAR_LITE_V2)	+= pulsedlight-lidar-lite-v2.o
> >  obj-$(CONFIG_MB1232)		+= mb1232.o
> > diff --git a/drivers/iio/proximity/iqs622-prox.c b/drivers/iio/proximity/iqs622-prox.c
> > new file mode 100644
> > index 0000000..a805fb21
> > --- /dev/null
> > +++ b/drivers/iio/proximity/iqs622-prox.c
> > @@ -0,0 +1,334 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Azoteq IQS622 Proximity Sensor
> > + *
> > + * Copyright (C) 2019
> > + * Author: Jeff LaBundy <jeff@labundy.com>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/iio/events.h>
> > +#include <linux/iio/iio.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/iqs62x.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/notifier.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#define IQS622_IR_FLAGS				0x16
> > +#define IQS622_IR_FLAGS_TOUCH			BIT(1)
> > +#define IQS622_IR_FLAGS_PROX			BIT(0)
> > +
> > +#define IQS622_IR_UI_OUT			0x17
> > +
> > +#define IQS622_IR_THRESH_PROX			0x91
> > +#define IQS622_IR_THRESH_PROX_MAX		255
> > +#define IQS622_IR_THRESH_PROX_SHIFT		0
> > +
> > +#define IQS622_IR_THRESH_TOUCH			0x92
> > +#define IQS622_IR_THRESH_TOUCH_MAX		1020
> > +#define IQS622_IR_THRESH_TOUCH_SHIFT		2
> > +
> > +struct iqs622_prox_private {
> > +	struct iqs62x_core *iqs62x;
> > +	struct notifier_block notifier;
> > +	struct mutex lock;
> > +	bool thresh_prox;
> > +	bool event_en;
> > +	u8 thresh;
> > +	u8 flags;
> > +};
> > +
> > +static int iqs622_prox_init(struct iqs622_prox_private *iqs622_prox)
> > +{
> > +	struct iqs62x_core *iqs62x = iqs622_prox->iqs62x;
> > +	unsigned int val;
> > +	int error;
> > +
> > +	mutex_lock(&iqs622_prox->lock);
> > +
> > +	error = regmap_write(iqs62x->map,
> > +			     iqs622_prox->thresh_prox ? IQS622_IR_THRESH_PROX :
> > +							IQS622_IR_THRESH_TOUCH,
> > +			     iqs622_prox->thresh);
> > +	if (error)
> > +		goto err_mutex;
> > +
> > +	error = regmap_read(iqs62x->map, IQS622_IR_FLAGS, &val);
> > +	if (error)
> > +		goto err_mutex;
> > +	iqs622_prox->flags = val;
> > +
> > +	error = regmap_update_bits(iqs62x->map, IQS620_GLBL_EVENT_MASK,
> > +				   iqs62x->dev_desc->ir_mask,
> > +				   iqs622_prox->event_en ? 0 : 0xFF);
> > +
> > +err_mutex:
> > +	mutex_unlock(&iqs622_prox->lock);
> > +
> > +	return error;
> > +}
> > +
> > +static int iqs622_prox_notifier(struct notifier_block *notifier,
> > +				unsigned long event_flags, void *context)
> > +{
> > +	struct iqs62x_event_data *event_data = context;
> > +	struct iqs622_prox_private *iqs622_prox;
> > +	struct iio_dev *indio_dev;
> > +	enum iio_event_direction dir;
> > +	int error;
> > +	u8 flags_mask;
> > +
> > +	iqs622_prox = container_of(notifier, struct iqs622_prox_private,
> > +				   notifier);
> > +	indio_dev = iio_priv_to_dev(iqs622_prox);
> > +
> > +	if (event_flags & BIT(IQS62X_EVENT_SYS_RESET)) {
> > +		error = iqs622_prox_init(iqs622_prox);
> > +		if (error) {
> > +			dev_err(indio_dev->dev.parent,
> > +				"Failed to re-initialize device: %d\n", error);
> > +			return NOTIFY_BAD;
> > +		}
> > +
> > +		return NOTIFY_OK;
> > +	}
> > +
> > +	flags_mask = iqs622_prox->thresh_prox ? IQS622_IR_FLAGS_PROX :
> > +						IQS622_IR_FLAGS_TOUCH;
> > +
> > +	if (!((event_data->ir_flags ^ iqs622_prox->flags) & flags_mask))
> > +		return NOTIFY_DONE;
> > +
> > +	iqs622_prox->flags = event_data->ir_flags;
> > +
> > +	if (!iqs622_prox->event_en)
> > +		return NOTIFY_OK;
> > +
> > +	dir = iqs622_prox->flags & flags_mask ? IIO_EV_DIR_RISING :
> > +						IIO_EV_DIR_FALLING;
> > +
> > +	iio_push_event(indio_dev,
> > +		       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
> > +					    IIO_EV_TYPE_THRESH, dir),
> > +		       iio_get_time_ns(indio_dev));
> > +
> > +	return NOTIFY_OK;
> > +}
> > +
> > +static void iqs622_prox_notifier_unregister(void *context)
> > +{
> > +	struct iqs622_prox_private *iqs622_prox = context;
> > +	struct iio_dev *indio_dev = iio_priv_to_dev(iqs622_prox);
> > +	int error;
> > +
> > +	error = blocking_notifier_chain_unregister(&iqs622_prox->iqs62x->nh,
> > +						   &iqs622_prox->notifier);
> > +	if (error)
> > +		dev_err(indio_dev->dev.parent,
> > +			"Failed to unregister notifier: %d\n", error);
> > +}
> > +
> > +static int iqs622_prox_read_raw(struct iio_dev *indio_dev,
> > +				struct iio_chan_spec const *chan,
> > +				int *val, int *val2, long mask)
> > +{
> > +	struct iqs622_prox_private *iqs622_prox = iio_priv(indio_dev);
> > +	struct iqs62x_core *iqs62x = iqs622_prox->iqs62x;
> > +	int error;
> > +	__le16 val_buf;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		error = regmap_raw_read(iqs62x->map, IQS622_IR_UI_OUT,
> > +					&val_buf, sizeof(val_buf));
> > +		if (error)
> > +			return error;
> > +
> > +		*val = le16_to_cpu(val_buf);
> > +		return IIO_VAL_INT;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int iqs622_prox_read_event_config(struct iio_dev *indio_dev,
> > +					 const struct iio_chan_spec *chan,
> > +					 enum iio_event_type type,
> > +					 enum iio_event_direction dir)
> > +{
> > +	struct iqs622_prox_private *iqs622_prox = iio_priv(indio_dev);
> > +
> > +	return iqs622_prox->event_en;
> > +}
> > +
> > +static int iqs622_prox_write_event_config(struct iio_dev *indio_dev,
> > +					  const struct iio_chan_spec *chan,
> > +					  enum iio_event_type type,
> > +					  enum iio_event_direction dir,
> > +					  int state)
> > +{
> > +	struct iqs622_prox_private *iqs622_prox = iio_priv(indio_dev);
> > +	struct iqs62x_core *iqs62x = iqs622_prox->iqs62x;
> > +	int error;
> > +
> > +	mutex_lock(&iqs622_prox->lock);
> > +
> > +	error = regmap_update_bits(iqs62x->map, IQS620_GLBL_EVENT_MASK,
> > +				   iqs62x->dev_desc->ir_mask, state ? 0 : 0xFF);
> > +	if (!error)
> > +		iqs622_prox->event_en = state;
> > +
> > +	mutex_unlock(&iqs622_prox->lock);
> > +
> > +	return error;
> > +}
> > +
> > +static int iqs622_prox_read_event_value(struct iio_dev *indio_dev,
> > +					const struct iio_chan_spec *chan,
> > +					enum iio_event_type type,
> > +					enum iio_event_direction dir,
> > +					enum iio_event_info info,
> > +					int *val, int *val2)
> > +{
> > +	struct iqs622_prox_private *iqs622_prox = iio_priv(indio_dev);
> > +
> > +	*val = iqs622_prox->thresh;
> > +	*val <<= (iqs622_prox->thresh_prox ? IQS622_IR_THRESH_PROX_SHIFT :
> > +					     IQS622_IR_THRESH_TOUCH_SHIFT);
> > +
> > +	return IIO_VAL_INT;
> > +}
> > +
> > +static int iqs622_prox_write_event_value(struct iio_dev *indio_dev,
> > +					 const struct iio_chan_spec *chan,
> > +					 enum iio_event_type type,
> > +					 enum iio_event_direction dir,
> > +					 enum iio_event_info info,
> > +					 int val, int val2)
> > +{
> > +	struct iqs622_prox_private *iqs622_prox = iio_priv(indio_dev);
> > +	struct iqs62x_core *iqs62x = iqs622_prox->iqs62x;
> > +	int error = -EINVAL;
> > +
> > +	mutex_lock(&iqs622_prox->lock);
> 
> The ternary operators in here are bit messy, perhaps better to just
> have an if else block and some local variables?
> 

Sure thing; will do.

> > +
> > +	if (val > (iqs622_prox->thresh_prox ? IQS622_IR_THRESH_PROX_MAX :
> > +					      IQS622_IR_THRESH_TOUCH_MAX))
> > +		goto err_mutex;
> > +	val >>= (iqs622_prox->thresh_prox ? IQS622_IR_THRESH_PROX_SHIFT :
> > +					    IQS622_IR_THRESH_TOUCH_SHIFT);
> > +
> > +	error = regmap_write(iqs62x->map,
> > +			     iqs622_prox->thresh_prox ? IQS622_IR_THRESH_PROX :
> > +							IQS622_IR_THRESH_TOUCH,
> > +			     val);
> > +	if (!error)
> > +		iqs622_prox->thresh = val;
> > +
> > +err_mutex:
> > +	mutex_unlock(&iqs622_prox->lock);
> > +
> > +	return error;
> > +}
> > +
> > +static const struct iio_info iqs622_prox_info = {
> > +	.read_raw = &iqs622_prox_read_raw,
> > +	.read_event_config = iqs622_prox_read_event_config,
> > +	.write_event_config = iqs622_prox_write_event_config,
> > +	.read_event_value = iqs622_prox_read_event_value,
> > +	.write_event_value = iqs622_prox_write_event_value,
> > +};
> > +
> > +static const struct iio_event_spec iqs622_prox_events[] = {
> > +	{
> > +		.type = IIO_EV_TYPE_THRESH,
> > +		.dir = IIO_EV_DIR_EITHER,
> > +		.mask_separate = BIT(IIO_EV_INFO_ENABLE) |
> > +				 BIT(IIO_EV_INFO_VALUE),
> > +	},
> > +};
> > +
> > +static const struct iio_chan_spec iqs622_prox_channels[] = {
> > +	{
> > +		.type = IIO_PROXIMITY,
> > +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
> > +		.event_spec = iqs622_prox_events,
> > +		.num_event_specs = ARRAY_SIZE(iqs622_prox_events),
> > +	},
> > +};
> > +
> > +static int iqs622_prox_probe(struct platform_device *pdev)
> > +{
> > +	struct iqs62x_core *iqs62x = dev_get_drvdata(pdev->dev.parent);
> > +	struct iqs622_prox_private *iqs622_prox;
> > +	struct iio_dev *indio_dev;
> > +	unsigned int val;
> > +	int error;
> > +
> > +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*iqs622_prox));
> > +	if (!indio_dev)
> > +		return -ENOMEM;
> > +
> > +	indio_dev->modes = INDIO_DIRECT_MODE;
> > +	indio_dev->dev.parent = &pdev->dev;
> > +	indio_dev->channels = iqs622_prox_channels;
> > +	indio_dev->num_channels = ARRAY_SIZE(iqs622_prox_channels);
> > +	indio_dev->name = iqs62x->dev_desc->dev_name;
> > +	indio_dev->info = &iqs622_prox_info;
> > +
> > +	iqs622_prox = iio_priv(indio_dev);
> > +	iqs622_prox->iqs62x = iqs62x;
> > +
> > +	iqs622_prox->thresh_prox = device_property_read_bool(&pdev->dev,
> > +							     "azoteq,use-prox");
> 
> Outstanding question on this in the binding patch.
> 

After thinking about this some more, I think the control in question needs to be
configurable from user space at runtime. I'll provide more detail in the binding
patch [1/8].

> > +
> > +	error = regmap_read(iqs62x->map,
> > +			    iqs622_prox->thresh_prox ? IQS622_IR_THRESH_PROX :
> > +						       IQS622_IR_THRESH_TOUCH,
> > +			    &val);
> > +	if (error)
> > +		return error;
> > +	iqs622_prox->thresh = val;
> > +
> > +	mutex_init(&iqs622_prox->lock);
> > +
> > +	error = iqs622_prox_init(iqs622_prox);
> > +	if (error)
> > +		return error;
> > +
> > +	iqs622_prox->notifier.notifier_call = iqs622_prox_notifier;
> > +	error = blocking_notifier_chain_register(&iqs622_prox->iqs62x->nh,
> > +						 &iqs622_prox->notifier);
> > +	if (error) {
> > +		dev_err(&pdev->dev, "Failed to register notifier: %d\n", error);
> > +		return error;
> > +	}
> > +
> > +	error = devm_add_action_or_reset(&pdev->dev,
> > +					 iqs622_prox_notifier_unregister,
> > +					 iqs622_prox);
> > +	if (error) {
> 
> As in previous, feels a little verbose.
> 

Sure thing; I'll drop the error message.

> > +		dev_err(&pdev->dev, "Failed to add action: %d\n", error);
> > +		return error;
> > +	}
> > +
> > +	return devm_iio_device_register(&pdev->dev, indio_dev);
> > +}
> > +
> > +static struct platform_driver iqs622_prox_platform_driver = {
> > +	.driver = {
> > +		.name	= IQS622_DRV_NAME_PROX,
> > +	},
> > +	.probe		= iqs622_prox_probe,
> > +};
> > +module_platform_driver(iqs622_prox_platform_driver);
> > +
> > +MODULE_AUTHOR("Jeff LaBundy <jeff@labundy.com>");
> > +MODULE_DESCRIPTION("Azoteq IQS622 Proximity Sensor");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:" IQS622_DRV_NAME_PROX);
> 
> 

Kind regards,
Jeff LaBundy
