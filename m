Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649A122304B
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 03:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgGQB1Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jul 2020 21:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgGQB1X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jul 2020 21:27:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702EFC061755;
        Thu, 16 Jul 2020 18:27:23 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ch3so5730172pjb.5;
        Thu, 16 Jul 2020 18:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e1upXG/w6fJvlrnOhhbNLfAIfkDeUhkYBp8tA8xaSkg=;
        b=TjrPyIyK0rODcxcEGIfCjagLjCDheZqGzLxIA0k0oOZOUeG4PxFrrvjosMzhwTl9LP
         yWHS/fiyp1BWteyWGaekFRbLKibkCurhdwPviCwjxYwaICTBtnkoV05rT8oAuFBP/+xX
         0XKcZ3HIXga/Bu586SbIXQRgn+37dqnQP3VRAtT1JLsbCIDwcXxZVioNomdWmCuuo+NX
         EKAdX0LUM33KBMmKHFymIb7mqvUiD+Iqeh7jxPN0VuZPO/Mz1mzoObJWRsS3iqaBcJNL
         /e3dfoEGeBp5GDU3YGY6DzHVwVP5I5rKRWHR/TNo4TNZYbJ5eLmMXCFrt35jZrM9ckzX
         rbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e1upXG/w6fJvlrnOhhbNLfAIfkDeUhkYBp8tA8xaSkg=;
        b=cqNAG92WUV/ekcPyae6WnKmxYnQYZv7ofO1RI7qE91l12mXrcYdv+/v/O3rBdXzcXk
         lQ5tsuTop6EVHuTy6pS3AKA/TU3GR41BAYvRZBuiCzb8NQdrFbLlKOfIFOL4jO9EUlHj
         EGl18WxpucaZXjHsSUcRXoI81xA+TlykIxCF2fmGIWtj/FNJbGFj1Ha8ispAQQcUk3wu
         2rCOhgAuCNBvOUWI32TMzuftS8h/8YVFvhiyJknvnSzebRImqQUsr9SBC6logA8mr3sE
         03bEzqvvk0B8gw5cPa/h0Qu8dfcrKreebdxN/EzUHb5bzZ/nnhVzYnQvwOHZN0Eg4RG4
         rEzQ==
X-Gm-Message-State: AOAM533IZ5iqZk8LjkDMk9ozRX3OcheoR8XBaEAaPOxgPg/ETn+Nd9Uq
        dAlrC9J4/YGgXlqYOdWejek=
X-Google-Smtp-Source: ABdhPJxZ/3zG5CwWxAp40LcYWTc3CuwMq+bDJV1J/HM3vCD3nvNxrg3EzxgCM6Hbo15HJf0/JrZjYA==
X-Received: by 2002:a17:902:a388:: with SMTP id x8mr5641436pla.159.1594949242695;
        Thu, 16 Jul 2020 18:27:22 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v2sm1059780pje.19.2020.07.16.18.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 18:27:21 -0700 (PDT)
Date:   Thu, 16 Jul 2020 18:27:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        phoenix <phoenix@emc.com.tw>, "josh.chen" <josh.chen@emc.com.tw>,
        "kai.heng.feng" <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 2/2] Input: elan_i2c - Modify the IAP related functio n
 for page sizes 128, 512 bytes.
Message-ID: <20200717012719.GC1665100@dtor-ws>
References: <20200714105641.15151-1-jingle.wu@emc.com.tw>
 <20200716053912.GB1665100@dtor-ws>
 <1594880123.69588.jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594880123.69588.jingle.wu@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Thu, Jul 16, 2020 at 02:15:23PM +0800, jingle.wu wrote:
> HI Dmitry:
> 
> Just to confirm, the older devices (I assume that pattern 0 means older)
>  have version command that is numerically higher than the one for the
>  newer (pattern >= 1) devices?
> 
> >> Yes, Pattern 1, 2 are newer devices.
> 
> > @@ -324,7 +342,14 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
> >  			return error;
> >  		}
> >  		*version = val[0];
> > -		*ic_type = val[1];
> > +
> > +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD, val);
> > +		if (error) {
> > +			dev_err(&client->dev, "failed to get ic type: %d\n",
> > +				error);
> > +			return error;
> > +		}
> 
> Could you please tell me why this chunk is needed?
> >> Modify the old pattern IC firmware read the correct ic_type.
> 
> In the elan_i2c_core.c, move this code to elan_i2c_i2c.c. 
> static int elan_query_device_info(struct elan_tp_data *data)
> {
> 	.....
> 	if (data->pattern == 0x01)
> 		ic_type = data->ic_type;
> 	else
> 		ic_type = data->iap_version;
> 	.....
> 	return 0;
> }

I am concerned that unconditionally substituting iap_version for ic_type
for "pattern 0" devices will break check in
elan_check_ASUS_special_fw() as it operates on the ic_type returned by
ETP_I2C_OSM_VERSION_CMD and not iap_version.

Thanks.

-- 
Dmitry
