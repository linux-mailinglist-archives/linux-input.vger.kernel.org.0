Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDD1136498
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730365AbgAJBKB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:10:01 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54754 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730363AbgAJBKA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:10:00 -0500
Received: by mail-pj1-f67.google.com with SMTP id kx11so244397pjb.4;
        Thu, 09 Jan 2020 17:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lwpCUqSNIdRIXWw5VO/9s7Z+lxgBpeAoKbsyO2NjUSI=;
        b=FNYOxezbyKhgXAEJ9shclMdzHdxUm9pPwa/XVvQ4COjHGeVwT7DbNk2FpjWLJZHASx
         XVxozu+UoORan0rY7JFuLGomBF+mrI/rUvcJKGSy3YM5ISjCO82+dkgH88/zZpQFQ9Ge
         c29t1VKeNxdwTOGy1C3DjiwqUbSNftsDc/QU6n0kxs0X3kvAXtjCv0GFpXI0UMYu3lVU
         SkxVkzBbquTmzogTj+Gz4HFyhkNVA/nCIdHUC75DbtTpnekK0U2+S+THOApieZgokX4r
         Rg3LhdxO6qEYDrU8/wi8L2lUIrvEYD2vyW1JtsJUDQeCae1YXdbZ6z2A83cw5l3OkqTx
         glew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lwpCUqSNIdRIXWw5VO/9s7Z+lxgBpeAoKbsyO2NjUSI=;
        b=Ub+08sGlh1nZH2etjzcadZ2+kg9jGUHlOpfbvEhZYZzqL/uPv5w6iFEZHuaImpVa76
         GwjoKoPdxIGQqPvlO/cpwpKmBWf2tGdPrl3+WBleaLiACGmibY1Bvxk06g89l77YtRhx
         m4uqzAZkdXGDcLf2pUKPzPmle2Bm6KzaPpue4hDKAtPeLgxr9AyGdeNjaIdjYZCaoseg
         T2E/1TPlBKyRKGR/QOUG92DANEzS0/NWZBHAhyS+TwfvdObb4iw8n3FkRNIu/heDOXiK
         FTngMOln4cg1Na/aDUeMHSTn0LyXdUm62XAcAV0zwudUGoLFIG+c3JJfNY16LxO9Jr8Y
         TxLw==
X-Gm-Message-State: APjAAAUfwonQrgsPumbrjm33alEcHzb965ebIGx5A1ccjcZmsglgM0jD
        GzAt5px9SlcVIu/SGli2iT0=
X-Google-Smtp-Source: APXvYqxq6gO6/lnxw0yYgJkP0wJXKOL226Wo63l3xFnHtLtYL096U4SpyO8m99J4DcOV04SDiBo4xA==
X-Received: by 2002:a17:90a:cb83:: with SMTP id a3mr1230963pju.80.1578618599824;
        Thu, 09 Jan 2020 17:09:59 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g18sm270429pfi.80.2020.01.09.17.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:09:59 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:09:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 6/6] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20200110010957.GP8314@dtor-ws>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-7-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108111050.19001-7-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On Wed, Jan 08, 2020 at 12:10:50PM +0100, Marco Felsch wrote:
> +static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (device_may_wakeup(dev))
> +		return 0;
> +
> +	ret = regulator_enable(tsdata->vcc);
> +	if (ret)
> +		dev_warn(dev, "Failed to enable vcc\n");

I wonder if we should not return error here instead of continuing. If
device is not powered up properly we'll have hard time communicating
with it.

The same is for suspend: maybe we should abort if we can't switch off
regulator or write to the device.

Thanks.

-- 
Dmitry
