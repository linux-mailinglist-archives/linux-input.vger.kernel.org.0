Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F75B1076A4
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 18:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfKVRnw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 12:43:52 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37374 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfKVRnw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 12:43:52 -0500
Received: by mail-wr1-f68.google.com with SMTP id t1so9618087wrv.4
        for <linux-input@vger.kernel.org>; Fri, 22 Nov 2019 09:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Jhs/tdQjYIEWTRcB0MrJAK0ricmoQz3oM5hnSS/G8Wo=;
        b=DeUEAA999MCNj61UTE0yqunROn+JFWelJgFE8QESgDgghl2Ui7AFdQ4ar1Ai/aBBSH
         WAQ9JlOFRHpfad/lAlBFS9CTicthJ0a5IAq5jl/iN5lU2THKfiBJKsD25qGoLr8RHS6K
         2zhADrvh1tzWnzYUM7NU350i+Kxb3iAihmzza7MoGvyJzcWMDh04Qj5GADdjkxX9v8Bz
         D5zqHU4t0Triv86UlrucEoeXluMnv0ujiTqoKfUzKQHQMZe8YRqbgvvWpPmfWGvv7/f9
         RhhCwVXotRx9kxmdbVYWe43kk8DcR/bf/HQOjH37c/dr56vgFwBh3oEkTclNzUoxfVXz
         7BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Jhs/tdQjYIEWTRcB0MrJAK0ricmoQz3oM5hnSS/G8Wo=;
        b=fgjezRTgBZ2KaGLxvYQBLULfr2fi7UnLbANHX6sQFsv1xOYamRVrEza9gABr0KOyED
         IyESy/zMr2CmSJYWtqPAOayXGEL8DyA17uWAJlJaLOoxzFDMHos2LkuWt2H3ug7WkJzr
         sJmRs4wHoGFWCj/BMziCED2BU3v5uzc/yJk5APmDam5kWqEMIAWLqkydaPWmQVAtaxal
         I+SEsHSK6zts/yPHqbKLTigqr3ZtGbH0f9cM35lK25Pvxz0B6ybFSNrBfTfp43Glr9xD
         EbGj1p31w1pVK+2A8uidWWbimDcAvsSLJkN+e+o0Q0WP3x1T39k0zsj+4gFpiAfHVsnN
         2wxg==
X-Gm-Message-State: APjAAAVJE8jeJuchG3zY5eMTJGK1t53dz5eo8f4yXUTGFR+mcI5132bm
        FXXQXAzTnlDLc1yV7hnZdPHRWw==
X-Google-Smtp-Source: APXvYqxxk9S8do51zGWUu4tC45fKtPKiwgqbw8KXvXwcwCl5HBK9lKgKuSNJfyc3xQ7DBnfLi+aznQ==
X-Received: by 2002:adf:e545:: with SMTP id z5mr18581366wrm.321.1574444630111;
        Fri, 22 Nov 2019 09:43:50 -0800 (PST)
Received: from [10.32.50.232] ([185.149.63.251])
        by smtp.gmail.com with ESMTPSA id a6sm9096597wrh.69.2019.11.22.09.43.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 09:43:49 -0800 (PST)
Subject: Re: [PATCHv1 2/2] Input: EXC3000: Add support to query model and
 fw_version
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20191107181010.17211-1-sebastian.reichel@collabora.com>
 <20191107181010.17211-2-sebastian.reichel@collabora.com>
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
Message-ID: <4ee3ce4f-f544-700c-bc8d-817cea35137a@flowbird.group>
Date:   Fri, 22 Nov 2019 18:43:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191107181010.17211-2-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

On 07/11/2019 19:10, Sebastian Reichel wrote:
> Expose model and fw_version via sysfs. Also query the model
> in probe to make sure, that the I2C communication with the
> device works before successfully probing the driver.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/input/touchscreen/exc3000.c | 136 ++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
>
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index 7d695022082c..4c9f132629b9 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -41,6 +41,11 @@ struct exc3000_data {
>   	struct touchscreen_properties prop;
>   	struct timer_list timer;
>   	u8 buf[2 * EXC3000_LEN_FRAME];
> +	char model[11];
> +	char fw_version[6];

These buffers are too small.

I know those are the values shown in the EETI "I2C Programming Guide" 
but, on my exc80H32 I have 16 bytes for the model and 14 for the fw_version.

It may even be possible to have larger, depends on the firmware / config 
blob that has been loaded.

The guide seems to be mostly an example. As nothing else is sent in the 
reply message, worst case the full frame would be filled.


>   
> +static void exc3000_query_interrupt(struct exc3000_data *data)
> +{
> +	u8 *buf = data->buf;
> +	int err;
> +
> +	data->query_result = 0;
> +
> +	err = i2c_master_recv(data->client, buf, EXC3000_LEN_FRAME);
> +	if (err < 0) {
> +		data->query_result = err;
> +		goto out;
> +	}
> +
> +	if (buf[0] == 0x42 && buf[4] == 'E') {
> +		memcpy(data->model, buf+5, 10);
> +		data->model[10] = '\0';

Maybe use sizeof() to avoid the hard coded 10?

> +		goto out;
> +	} else if (buf[0] == 0x42 && buf[4] == 'D') {
> +		memcpy(data->fw_version, buf+5, 5);
> +		data->fw_version[5] = '\0';
> +		goto out;
> +	}
> +


Ok so at least there won't be a buffer overflow but it will truncate.


> +static DEVICE_ATTR(fw_version, S_IRUGO, exc3000_get_fw_version, NULL);
> +


Maybe use DEVICE_ATTR_RO  to reduce the amount of boilerplate?


> +	input->dev.groups = exc3000_attribute_groups;


Hum, this adds the attributes to the input device (in /sys/class/input) 
but these attributes are really for the whole I2C device.

Wouldn't it be better to use devm_device_add_group() to add them to the 
I2C device?


> +	for (retry = 0; retry < 3; ++retry) {
> +		error = exc3000_get_model(data);
> +		if (!error) {
> +			break;
> +		}
> +		dev_warn(&client->dev, "Retry %d get EETI EXC3000 model: %d\n", retry + 1, error);
> +	}
> +


Is there a particular reason why retries are needed?


Regards,


Martin

