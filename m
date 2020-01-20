Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1C6F1432A4
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2020 20:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgATTvy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jan 2020 14:51:54 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43405 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgATTvy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jan 2020 14:51:54 -0500
Received: by mail-pf1-f194.google.com with SMTP id x6so220287pfo.10
        for <linux-input@vger.kernel.org>; Mon, 20 Jan 2020 11:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w/f3XsKLwdaTokaDi/QOyQIz3TYAKO3g8Z0fTPCjH9Y=;
        b=MD2zUusPIUOKokq6jbFMRQXSXapVeBmWYOg1FNbU0S99wqlEh22C9GEDODs/7OcFYJ
         lh4m9AJ45bf9Hs4YMmh0bKjqLHdm/2QNrTsd/zWdkRxIAHZ70Ijoxjbd6zXVaJ0EQTj1
         doabw9aWRHGyq8vSmunfNxCGRJv0sLMVMzyoZ9ofxeSrnmFvvJWTipqHxshQ9xyqDiXM
         FQ1jBtlsw4RZuvOPsVqZNhAfCMDyBQugQsykRfwPMy/2AWcSGJoiPLub5AHPmi7lA2Ee
         A/rKxeqaQTcWPwBEw6NTg8buFPp0JIG4U9fHnyl8W7BjeamzK4D8VqqI+Pm+5WxLeckT
         cAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w/f3XsKLwdaTokaDi/QOyQIz3TYAKO3g8Z0fTPCjH9Y=;
        b=abQ6YyPFTZqYLkAJb16Rjl6AbGEL9xsEDh71EhaN/eXRoj9er/FvdLGAxukjq874fx
         eeNpOPfscbPfYEN9n7Qh+LYvPisTIs1JSVJryJ8Ufvs4PH5EZjt34dYW+YsLWPJNBvvz
         CYQwv+Ug8/n0e4nZ/+4Kzz5G6yXgoGNXbE4bygTa9RAflaPEIipE2HVxpSveaDRoqKNT
         0yNSe1vBVEiAbEYnabnwgbIOGAvCtkK9YjDGjCFjNJ2haNlWA8v0XYpuBsmXKQfcj0we
         iboFk0jnySP3qg0y+2CIaGPM68yytrQYVu69JCltC2zxLgA4AQdKBf4ulsUDZ92pG1v0
         r3dg==
X-Gm-Message-State: APjAAAUy/6/TQRX10UE5fsm6IbkHWFzFNOUE6YVjn9m8j1mf4iiK4pom
        0zGufffUApT+zIWT7Cc425zO9XXU
X-Google-Smtp-Source: APXvYqx9me6hbphiUf3FMRUniphDRh7uqzngL3DJ9ogBpoD3OEj7MIVXRfdfrKQhZovZAIC7KlpDNw==
X-Received: by 2002:a63:9d0f:: with SMTP id i15mr1361779pgd.240.1579549913295;
        Mon, 20 Jan 2020 11:51:53 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 83sm39374546pgh.12.2020.01.20.11.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 11:51:52 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:51:50 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH 3/4] Input: exc3000: expose type, model and firmware
 revision as sysfs attributes
Message-ID: <20200120195150.GJ47797@dtor-ws>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
 <20200107171741.10856-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107171741.10856-3-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 07, 2020 at 06:17:39PM +0100, Lucas Stach wrote:
> This can be used by userspace to determine if a firmware update should be
> started.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/input/touchscreen/exc3000.c | 54 +++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index accee4fd1b97..ce83914d65ff 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -259,6 +259,47 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
>  	return 0;
>  }
>  
> +static ssize_t exc3000_sysfs_type_show(struct device *dev,
> +				       struct device_attribute *dattr,
> +				       char *buf)
> +{
> +	struct exc3000_data *data = dev_get_drvdata(dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%s\n", data->type);
> +}
> +static DEVICE_ATTR(type, 0444, exc3000_sysfs_type_show, NULL);
> +
> +static ssize_t exc3000_sysfs_model_show(struct device *dev,
> +					struct device_attribute *dattr,
> +					char *buf)
> +{
> +	struct exc3000_data *data = dev_get_drvdata(dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%s\n", data->model);
> +}
> +static DEVICE_ATTR(model, 0444, exc3000_sysfs_model_show, NULL);
> +
> +static ssize_t exc3000_sysfs_fw_rev_show(struct device *dev,
> +					 struct device_attribute *dattr,
> +					 char *buf)
> +{
> +	struct exc3000_data *data = dev_get_drvdata(dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%s\n", data->fw_rev);
> +}
> +static DEVICE_ATTR(fw_rev, 0444, exc3000_sysfs_fw_rev_show, NULL);
> +
> +static struct attribute *exc3000_attrs[] = {
> +	&dev_attr_type.attr,
> +	&dev_attr_model.attr,
> +	&dev_attr_fw_rev.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group exc3000_attr_group = {
> +	.attrs = exc3000_attrs,
> +};
> +
>  static int exc3000_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> @@ -285,6 +326,11 @@ static int exc3000_probe(struct i2c_client *client,
>  	if (error)
>  		return error;
>  
> +	dev_set_drvdata(&client->dev, data);
> +	error = sysfs_create_group(&client->dev.kobj, &exc3000_attr_group);
> +	if (error)
> +		return error;

Please use devm_device_add_group() instead.

> +
>  	input = devm_input_allocate_device(&client->dev);
>  	if (!input)
>  		return -ENOMEM;
> @@ -310,6 +356,13 @@ static int exc3000_probe(struct i2c_client *client,
>  	return 0;
>  }
>  
> +int exc3000_remove(struct i2c_client *client)
> +{
> +	sysfs_remove_group(&client->dev.kobj, &exc3000_attr_group);
> +
> +	return 0;
> +}
> +
>  static const struct i2c_device_id exc3000_id[] = {
>  	{ "exc3000", 0 },
>  	{ }
> @@ -331,6 +384,7 @@ static struct i2c_driver exc3000_driver = {
>  	},
>  	.id_table	= exc3000_id,
>  	.probe		= exc3000_probe,
> +	.remove		= exc3000_remove,
>  };
>  
>  module_i2c_driver(exc3000_driver);
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
