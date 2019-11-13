Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1419EF9F3E
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 01:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfKMAXo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 19:23:44 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35627 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKMAXn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 19:23:43 -0500
Received: by mail-pg1-f194.google.com with SMTP id q22so132792pgk.2;
        Tue, 12 Nov 2019 16:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1rENiV99gbf1LZMPwbAky1vaj1Op/LwI+spFFaZKS+A=;
        b=M5t3w7OgmSXnfl/fZSQHAPG8G5sJM2/gMxl2BF1qblpgIW9V6Xal+yyqq8sryIEAZ3
         82uSXcTQkWY4gUB8O/grfz35Tz0pmlm75ho6qbnegM6SKtbJ9WZimgdpEu2gxAKquH5q
         +ENzDN8bRf1FiuAa73xDW6it778e3qOUlRtYYupj3jUtiB6akw4pqqWV6YjPDpm68wQ8
         N7WzKHQF0w9XGdjhWaLjxwyO5W2Yqu2e0km5Z4repKnm4bPhhJIv8riYyHncenJgs40j
         sFbdHhvao7RycKZZqx4isgM89f3TN4oN3Oi+5uxoRsIFYNV9NnwlvgLxqWVnH5aDaKWB
         9bIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1rENiV99gbf1LZMPwbAky1vaj1Op/LwI+spFFaZKS+A=;
        b=Gtq7AHx7ThF0IQztqGLcj/sb7w8anpY0OShpBVQzdjGlf8oU5pGlprteYgsPDIsfv1
         e0XNr3cM1pqu9OULHSebGddBHt6o0YWXEwm1q1p+RdiddWPBPQ419Jeq9o5mfbJQTMRk
         /6OTigyj4JFj/vETQBR/wBUA85qV1MNfWE4ddB3WCmp017Do8uIHVVlHmnlU8rPp+gxg
         z0Q/RlUbuI1Gf5GB6xTqU4eGGe5OCN4ln0yaCnvkmuPQCoc3fqa3828uHFatFri1o2xU
         Y3zhGp0ukK3r8MKOBMKca53NGIEobElb+2piEfhyD6gM++UULY/6KeSjiafjzCzgGN4r
         e2ow==
X-Gm-Message-State: APjAAAX37CTBjCgkfn8n+AQV4S+B3+kWPya6zHKGBkoJzPwpfGXdnl1p
        vkfv1J14SDpEOQg0wJjLoaE=
X-Google-Smtp-Source: APXvYqwZM5a9Wk8fGL0upxftZeSGMH33qZ6WqaaqIa95Y4FK3QqvBUQy4uCA8n0aeisn06b3L3e/ww==
X-Received: by 2002:a17:90a:3807:: with SMTP id w7mr781794pjb.33.1573604622401;
        Tue, 12 Nov 2019 16:23:42 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q8sm167830pgg.15.2019.11.12.16.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 16:23:41 -0800 (PST)
Date:   Tue, 12 Nov 2019 16:23:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv1 2/2] Input: EXC3000: Add support to query model and
 fw_version
Message-ID: <20191113002339.GJ13374@dtor-ws>
References: <20191107181010.17211-1-sebastian.reichel@collabora.com>
 <20191107181010.17211-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107181010.17211-2-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

On Thu, Nov 07, 2019 at 07:10:10PM +0100, Sebastian Reichel wrote:
> Expose model and fw_version via sysfs. Also query the model
> in probe to make sure, that the I2C communication with the
> device works before successfully probing the driver.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/input/touchscreen/exc3000.c | 136 ++++++++++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index 7d695022082c..4c9f132629b9 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -41,6 +41,11 @@ struct exc3000_data {
>  	struct touchscreen_properties prop;
>  	struct timer_list timer;
>  	u8 buf[2 * EXC3000_LEN_FRAME];
> +	char model[11];
> +	char fw_version[6];
> +	struct completion wait_event;
> +	struct mutex query_lock;
> +	int query_result;
>  };
>  
>  static void exc3000_report_slots(struct input_dev *input,
> @@ -121,6 +126,35 @@ static int exc3000_read_data(struct i2c_client *client,
>  	return 0;
>  }
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
> +		goto out;
> +	} else if (buf[0] == 0x42 && buf[4] == 'D') {
> +		memcpy(data->fw_version, buf+5, 5);
> +		data->fw_version[5] = '\0';
> +		goto out;
> +	}
> +
> +	data->query_result = -EPROTO;
> +
> +out:
> +	complete(&data->wait_event);
> +}
> +
>  static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  {
>  	struct exc3000_data *data = dev_id;
> @@ -129,6 +163,11 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  	int slots, total_slots;
>  	int error;
>  
> +	if (mutex_is_locked(&data->query_lock)) {
> +		exc3000_query_interrupt(data);
> +		goto out;
> +	}
> +
>  	error = exc3000_read_data(data->client, buf, &total_slots);
>  	if (error) {
>  		/* Schedule a timer to release "stuck" contacts */
> @@ -156,12 +195,92 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int exc3000_get_fw_version(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct exc3000_data *data = dev_get_drvdata(dev);
> +	static const u8 request[68] =
> +		{0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'D', 0x00};
> +	struct i2c_client *client = data->client;
> +	int err;
> +
> +	mutex_lock(&data->query_lock);
> +
> +	data->query_result = -ETIMEDOUT;
> +	reinit_completion(&data->wait_event);
> +
> +	err = i2c_master_send(client, request, sizeof(request));
> +	if (err < 0) {
> +		mutex_unlock(&data->query_lock);
> +		return err;
> +	}
> +
> +	wait_for_completion_interruptible_timeout(&data->wait_event, 1*HZ);
> +	mutex_unlock(&data->query_lock);
> +
> +	if (data->query_result < 0)
> +		return data->query_result;
> +
> +	return sprintf(buf, "%s\n", data->fw_version);
> +}
> +static DEVICE_ATTR(fw_version, S_IRUGO, exc3000_get_fw_version, NULL);
> +
> +static ssize_t exc3000_get_model(struct exc3000_data *data)
> +{
> +	static const u8 request[68] =
> +		{0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'E', 0x00};
> +	struct i2c_client *client = data->client;
> +	int err;
> +
> +	mutex_lock(&data->query_lock);
> +	data->query_result = -ETIMEDOUT;
> +	reinit_completion(&data->wait_event);
> +
> +	err = i2c_master_send(client, request, sizeof(request));
> +	if (err < 0) {
> +		mutex_unlock(&data->query_lock);
> +		return err;
> +	}
> +
> +	wait_for_completion_interruptible_timeout(&data->wait_event, 1*HZ);
> +	mutex_unlock(&data->query_lock);
> +
> +	return data->query_result;
> +}
> +
> +static ssize_t exc3000_get_model_sysfs(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct exc3000_data *data = dev_get_drvdata(dev);
> +	int err = exc3000_get_model(data);

Do we really need to re-fetch model (and firmware ID) on each access?
Can we query it as probe time and cache? This I think would simplify the
driver, as you probably would not need to hook it into the ISR. Can you
just post a read/write transaction to fetch it without waiting for
interrupt? Or, if single transaction does not work and you need to wait
for certain time for response - just add msleep() and maybe mark driver
for async probe...

Thanks.

-- 
Dmitry
