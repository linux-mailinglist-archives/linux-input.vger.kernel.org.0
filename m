Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B1DEC21
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 23:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbfD2VkQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 17:40:16 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:41775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfD2VkQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 17:40:16 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZl1l-1hEo5h0cBr-00Wj4u; Mon, 29 Apr 2019 23:40:14 +0200
Subject: Re: [PATCH 4/4] input: keyboard: gpio-keys-polled: skip oftree code
 when CONFIG_OF disabled
To:     Frank Rowand <frowand.list@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
References: <1555444645-15156-1-git-send-email-info@metux.net>
 <1555444645-15156-5-git-send-email-info@metux.net>
 <2a760b29-9f0b-ffa7-03dd-47ddb074563a@gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <d1a9f570-4f92-b46f-140e-45c823c82474@metux.net>
Date:   Mon, 29 Apr 2019 23:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <2a760b29-9f0b-ffa7-03dd-47ddb074563a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:I4a/wpfSYCV1FP4iWq6zHYT9Xsld2boyDi0X3mxwyz4FVfh43l1
 a3y7SajNXWAhMaiASYJtFUSzE96kmzZosSbSzZwueqX6AQpMJnxwNQLw/lTKymymgv/rPsh
 NM5K+IZlt2StBqcAxmaTvHiy5QxGRTXfA8VsmtS68v7H7aasK7Uocs9rKyFjOawoLJoCxwT
 qpr/60Kp6ApHBf2+XTEGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8EZCKlsu8ng=:rPthvjdHhKarYQ/3UCc3WV
 0RJ8yQyjwaKKhClCXbJYLZbXgtJqbLJfT13vDaP2mtobZfMFd6mI1SwLq2VSi1DnlH7oQiE1a
 8Tda6HBx665ByrICysG1qcI7JQjbHW4gyxBWRkzy/sdOxKm935HhVpnpCT07buc6RwP+Bc+2j
 LtP+Az4MZf8P5GkKtd6FCS6MhAar5+cGndlXc8Qeuyz1WSUigOPX1XmCnin/2fSnyDQgiYyPq
 Ofsf8YRrsP3zK1DFtyV7O5ZxlMI+tAhbzT09Dg7uNvQf+Ve1PzO9fQYmLtKOGx8RlimbFjZwB
 jZzZ5TOKXn/OY8fsKZknZYMsNWGD7lz6uXQUe0Ym72xzYlLVQLm8smrkMSuPjtBQNwbMc2l6R
 hEGtcwKMMTe6mbDvCXwe7p+kcfujiSpHFfUE+VUGSpbq8Wng7Mkb964NYTC+aILgaZApro9Rm
 gBpGzznFPY8Fbtcv/kUVzTMdmWJL+FAcDhj8n2zJfOwBdHRgzglXmDCtg2kSB0gdwXI+vBvGz
 UwyMtrGF+XgjXV3zZVrvJM/MCsr05Mbh35xiuS5he/AAkuH1UVTP1YujOwVmQGtYksuDW5/8y
 /yfuNpxprCzTHYBbIi5As3hYe7PcaOMCoU1BdSNnZiKzgBGwN68UBIebf38rdgzbP/xcTe6Oj
 rvrW/Fhc5Qrbh7XZXonXI5ulgwlsmCSP7S8eG5lZ/MUrHAul00c3+L4LX0yPBXfmpeOZhZggh
 y/cTQAti9kbkZLf70KxZz8i2jjfl3zdpLPCWRCDHPjRrDOvuXB4AdE2PAZNA9bQfRY+BD6ZKe
 DVbqjzAONChgTnTMA6YfE1muvPgX0iK6PsXIs9+f11A5M/++jEdreHpixfIcOEAK8kLKXez
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 29.04.19 21:44, Frank Rowand wrote:
> On 4/16/19 12:57 PM, Enrico Weigelt, metux IT consult wrote:
>> we don't need to build in oftree probing stuff when oftree isn't
>> enabled at all.
>>
>> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
>> ---
>>  drivers/input/keyboard/gpio_keys_polled.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
>> index 3f773b2..fbccb89 100644
>> --- a/drivers/input/keyboard/gpio_keys_polled.c
>> +++ b/drivers/input/keyboard/gpio_keys_polled.c
>> @@ -147,6 +147,7 @@ static void gpio_keys_polled_close(struct input_polled_dev *dev)
>>  static struct gpio_keys_platform_data *
>>  gpio_keys_polled_get_devtree_pdata(struct device *dev)
>>  {
>> +#ifdef CONFIG_OF
>>  	struct gpio_keys_platform_data *pdata;
>>  	struct gpio_keys_button *button;
>>  	struct fwnode_handle *child;
>> @@ -200,6 +201,9 @@ static void gpio_keys_polled_close(struct input_polled_dev *dev)
>>  	}
>>  
>>  	return pdata;
>> +#else /* CONFIG_OF */
>> +	return ERR_PTR(-ENOENT);
>> +#endif /* CONFIG_OF */
>>  }
>>  
>>  static void gpio_keys_polled_set_abs_params(struct input_dev *input,
>> @@ -226,7 +230,7 @@ static void gpio_keys_polled_set_abs_params(struct input_dev *input,
>>  	{ .compatible = "gpio-keys-polled", },
>>  	{ },
>>  };
> 
> 
>> -MODULE_DEVICE_TABLE(of, gpio_keys_polled_of_match);
>> +MODULE_DEVICE_TABLE_OF(gpio_keys_polled_of_match);
> 
> Not needed, when you use of_match_ptr() -- see below.

Shall I remove the MODULE_DEVICE_TABLE... line completely ?

I'd like to have nothing of-related compiled in, when oftree isn't
enabled.

>>  static struct gpio_desc *gpio_keys_polled_get_gpiod_fwnode(
>>  	struct device *dev,
>> @@ -452,7 +456,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>>  	.probe	= gpio_keys_polled_probe,
>>  	.driver	= {
>>  		.name	= DRV_NAME,
> 
>> +#ifdef CONFIG_OF
>>  		.of_match_table = gpio_keys_polled_of_match,
>> +#endif /* CONFIG_OF */
> 
> No need for the #ifdef, use of_match_ptr():
> 
>   		.of_match_table = of_match_ptr(gpio_keys_polled_of_match),

Ok, thanks.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
