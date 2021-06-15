Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB15B3A82EB
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 16:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhFOOeR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 10:34:17 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:52610 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230463AbhFOOeQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 10:34:16 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 5999A1A203F3;
        Tue, 15 Jun 2021 17:32:08 +0300 (EEST)
Subject: Re: [PATCH 2/2 v4] input: add SparkFun Qwiic Joystick driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff LaBundy <jeff@labundy.com>
References: <20210608223130.16830-1-oleg@kaa.org.ua>
 <20210608223130.16830-2-oleg@kaa.org.ua> <YMgzS6FIh/byG8Q5@google.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <9d488da2-48fc-b80c-37a6-8c0576e8b838@kaa.org.ua>
Date:   Tue, 15 Jun 2021 17:32:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMgzS6FIh/byG8Q5@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

15.06.21 07:57, Dmitry Torokhov пише:

>> +struct qwiic_ver {
>> +	u8 major;
>> +	u8 minor;
>> +};
>> +
>> +struct qwiic_data {
>> +	__be16 x;
>> +	__be16 y;
>> +	u8 thumb;
>> +} __packed;
> 
> The members of this structure are naturally aligned, so there is no need
> to declare it as __packed.


But struct qwiic_data require packed attribute, because without that it will be 6 bytes not 5.

>> +
>> +static void qwiic_poll(struct input_dev *input)
>> +{
>> +	struct qwiic_jsk *priv;
>> +	struct qwiic_data data;
>> +	int err;
>> +
>> +	priv = input_get_drvdata(input);
>> +
>> +	err = i2c_smbus_read_i2c_block_data(priv->client, QWIIC_JSK_REG_DATA,
>> +					    sizeof(data), (u8 *)&data);
>> +	if (err != sizeof(data))
>> +		return;
>> +
>> +	input_report_abs(input, ABS_X, be16_to_cpu(data.x) >> 6);
>> +	input_report_abs(input, ABS_Y, be16_to_cpu(data.y) >> 6);
>> +	input_report_key(input, BTN_THUMBL, !data.thumb);
>> +	input_sync(input);
>> +}
>> +
>> +static int qwiic_probe(struct i2c_client *client,
>> +		       const struct i2c_device_id *id)
> 
> The probe() does not use the i2c_device_id parameter, so I will switch
> it to probe_new() to avoid the temptation of using it in the future.
> 
> Please let me know if you disagree, otherwise I will go and apply (no
> need to resubmit).
> 
> Thanks.
> 

-- 
Best regards,
Oleh Kravchenko

