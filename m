Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10C011A4BA6
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 23:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDJVq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 17:46:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39839 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgDJVq6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 17:46:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id i20so3256848ljn.6;
        Fri, 10 Apr 2020 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7DRxr8UXPXMC8ZZ6lywET8o4n8MINsf5hUII1rWJ+Io=;
        b=NIt+x5EuT+0R01CG45BZ7hqAJFsmmCQTaDB4Kuc+WLsSIq5DqfYZa1I6NuC4Y5oKX1
         ru0lnIL/RiBSN10StfSLpENKSFwqho1m8HE6LFCi6oEEfssGuM9QyyCGiIpHFtJ6a0DS
         41tpl6dQlx8ssnX0ImUy6Gbqs3iLabRGcRF/89mT61LH7so6+ZLPxEdSwtgNuaL+WQnY
         QLU1pQNaBRLRcnwYjA87QuuEjBuXbgL6XoKo8QKLhIMTSmBxh8Zsxe3Iaa8qR5nOuvgZ
         5DzdYKAfamTR9pME5VwowbJ1OZnIPtbJgrxlqOVAHkYQUxBwDdFiDu45yp8f7F7TgYLh
         rtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7DRxr8UXPXMC8ZZ6lywET8o4n8MINsf5hUII1rWJ+Io=;
        b=bEpOL4ovKF24O/2MG8poCg7Bxbb5+jd9HbvEE9NDNZJFOC20N7YUT/rrI1Iifix2lN
         2oa3v5AYol6806tNZP70xc5/OEWkyPED/afVc0s4K+OSrUjxG5coYEMqVHUVdZBckOFd
         qkvJtdBW0baozzSz7dIxO7Is2z4049DAqsyWdqaRlVKOZgoP5YeeCeJd3SSyWVK8xGm9
         Y+DdIeUYyq6kGZmScv6purGELb1sybJJ1y48JknPfOyo98u4S68aYnU5OwcqyzHohFNp
         u4Rhot6Y+dq7fyxNNNhYLQduJIfn9Cs1sJWjtM0yZpae7LHdFB3pUGJ+IOQCfc6tc5Fu
         iDrw==
X-Gm-Message-State: AGi0PuYmsoyeP8nOT8zZhs0Uu274zaEHVGwa/QyxFJLdZEKdnPjYdyei
        iJjXn49nuiKmXf7/DCR3OMI=
X-Google-Smtp-Source: APiQypLaPwaeGLjp5KfZEURvyCJPwfq93DAW2oYcpxxSJ5CD45lDBZJa6FivhkxOkPSKwuhr/aY/qg==
X-Received: by 2002:a2e:b558:: with SMTP id a24mr3895853ljn.56.1586555216468;
        Fri, 10 Apr 2020 14:46:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id i25sm1860234ljg.82.2020.04.10.14.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 14:46:55 -0700 (PDT)
Subject: Re: [PATCH v10 18/55] Input: atmel_mxt_ts: Rename mxt_hw_version_show
 to hw_version_show
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-19-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aae29974-7a8f-404b-b115-59416021ff61@gmail.com>
Date:   Sat, 11 Apr 2020 00:46:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331105051.58896-19-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.03.2020 13:50, Jiada Wang пишет:
> Rename mxt_hw_version_show to hw_version_show to address checkpatch warning
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index b2a37a9597f3..cec823de4096 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -3114,8 +3114,8 @@ static ssize_t fw_version_show(struct device *dev,
>  }
>  
>  /* Hardware Version is returned as FamilyID.VariantID */
> -static ssize_t mxt_hw_version_show(struct device *dev,
> -				   struct device_attribute *attr, char *buf)
> +static ssize_t hw_version_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
>  {
>  	struct mxt_data *data = dev_get_drvdata(dev);
>  	struct mxt_info *info = data->info;
> @@ -3404,7 +3404,7 @@ static const struct attribute_group mxt_fw_attr_group = {
>  };
>  
>  static DEVICE_ATTR_RO(fw_version);
> -static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
> +static DEVICE_ATTR_RO(hw_version);
>  static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);

What about to add a patch to convert the mxt_object_show to
DEVICE_ATTR_RO(object_show)?
