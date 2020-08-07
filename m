Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C69B23E53B
	for <lists+linux-input@lfdr.de>; Fri,  7 Aug 2020 02:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgHGAjG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 20:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHGAjF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 20:39:05 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE932C061574;
        Thu,  6 Aug 2020 17:39:04 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a79so71047pfa.8;
        Thu, 06 Aug 2020 17:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t4/3W8u2rIhWMXg6RuKUHvZUyPa7uw4QLs9l3y6bL9w=;
        b=R1AEdH1HVkuLNcVvogEHDZ3pB5/TsLz5yBJPxGJnMVc0WN1yVloTEGSO4XmuslW+kN
         YlSaXkN6qTcrZJZBhC2lv5pu51Vejqpch4QKvXI8/Z3wGeNqalJCtfYjZT9Ptw2GD/8k
         6u+SrFwMLbr61AiRaSmIJpXlcShfOAx0V1vcHx29ZisRIKcQr4NejTSWKyEZxYy8OUA1
         kjiySRiRgakulbGAQAdLBDJNyPYJ4DnWoh+7AQvu76S698GMFh+jvpHehp8jOzseJ/7s
         s7ZLJ1LEppjABNK3/1HawUSEP41rY6DsdOwz6yvslDt0bvyGs4gNn59QN7IJE7PDThaM
         VhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t4/3W8u2rIhWMXg6RuKUHvZUyPa7uw4QLs9l3y6bL9w=;
        b=IQnfsXcPAg/QBd3aknaIQ1F3C9vzBLgy9kYmTvYM2nQe+rqbr6OFNArY406v3tjLXP
         QGZii7v0qCXSLQTH+BfNKYmHzahcC7PYjMGbWEQ9mHBCiyXWfN8eLsfMIWa0DkuyRZC/
         7LJiDvSUpSjtQwiKjBCE9pcEdG0gczTprUdhDd/DpT7d8Ud4cvtFUWZWTZDcJ06RzjK8
         wQGvjlYw+JEwVx14DWg4KwNE43OWNEMIkOY1F9//EGMDPMqWK1M6bJC/qADMGwvYFVYY
         ztSdn+3PuDTomEvmRyczT/7sq/6NeT6YXCfQFueu0K01VKzBD7HQ9a0Uhocv9FUO8+v9
         Pdvg==
X-Gm-Message-State: AOAM533NbQ3akXC3UP9B+Ofe7MI3FmNw8fR5b5pojtG86iwgvshbzteD
        vETd0WFjvI2IJ1WjCXfo0Ls=
X-Google-Smtp-Source: ABdhPJwETckdFI9Y4BjkmA5ClKXbJycNEvktitdnLDBXvObLH/MeL2c649JTGPsj85xBtw0A2kZdpw==
X-Received: by 2002:aa7:947b:: with SMTP id t27mr10409950pfq.117.1596760743926;
        Thu, 06 Aug 2020 17:39:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m3sm8460534pjs.22.2020.08.06.17.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 17:39:03 -0700 (PDT)
Date:   Thu, 6 Aug 2020 17:39:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCHv4 4/4] Input: EXC3000: Add support to query model and
 fw_version
Message-ID: <20200807003901.GQ1665100@dtor-ws>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
 <20200805160520.456570-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805160520.456570-5-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

On Wed, Aug 05, 2020 at 06:05:20PM +0200, Sebastian Reichel wrote:
>  
> +static int exc3000_query_interrupt(struct exc3000_data *data)
> +{
> +	u8 *buf = data->buf;
> +	int err;
> +
> +	err = i2c_master_recv(data->client, buf, EXC3000_LEN_FRAME);
> +	if (err < 0)
> +		return err;
> +
> +	if (buf[0] != 0x42)

I changed this to 'B' to match the rest of the function.

> +		return -EPROTO;
> +
> +	if (buf[4] == 'E')
> +		strlcpy(data->model, buf+5, sizeof(data->model));
> +	else if (buf[4] == 'D')
> +		strlcpy(data->fw_version, buf+5, sizeof(data->fw_version));
> +	else
> +		return -EPROTO;
> +
> +	return 0;
> +}
> +
> +	error = sysfs_create_group(&client->dev.kobj, &exc3000_attribute_group);
> +	if (error)
> +		return error;
> +
> +	error = devm_add_action_or_reset(&client->dev, exc3000_unregister_sysfs, &client->dev);
> +	if (error)
> +		return error;

Replaced 2 calls with devm_device_add_group().

Please yell if I managed to break it...

Thanks.

-- 
Dmitry
