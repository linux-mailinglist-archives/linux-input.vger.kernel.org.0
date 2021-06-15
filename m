Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B27A3A7869
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 09:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhFOHwH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 15 Jun 2021 03:52:07 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:50160 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231168AbhFOHv5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 03:51:57 -0400
Received: from smtpclient.apple (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id E7EC41A203F3;
        Tue, 15 Jun 2021 10:49:51 +0300 (EEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 2/2 v4] input: add SparkFun Qwiic Joystick driver
Date:   Tue, 15 Jun 2021 10:49:46 +0300
Message-Id: <01842F09-0140-4340-8582-117A20D69A99@kaa.org.ua>
References: <YMgzS6FIh/byG8Q5@google.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff LaBundy <jeff@labundy.com>
In-Reply-To: <YMgzS6FIh/byG8Q5@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Mailer: iPad Mail (18F72)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,
Thank you for your code-review

> 15 черв. 2021 р. о 07:57 Dmitry Torokhov <dmitry.torokhov@gmail.com> пише:
> 
> ﻿Hi Oleh,
> 
>> +struct qwiic_data {
>> +    __be16 x;
>> +    __be16 y;
>> +    u8 thumb;
>> +} __packed;
> 
> The members of this structure are naturally aligned, so there is no need
> to declare it as __packed.

Sorry, I forgot to fix this nitpick :-/

>> +
>> +static void qwiic_poll(struct input_dev *input)
>> +{
>> +    struct qwiic_jsk *priv;
>> +    struct qwiic_data data;
>> +    int err;
>> +
>> +    priv = input_get_drvdata(input);
>> +
>> +    err = i2c_smbus_read_i2c_block_data(priv->client, QWIIC_JSK_REG_DATA,
>> +                        sizeof(data), (u8 *)&data);
>> +    if (err != sizeof(data))
>> +        return;
>> +
>> +    input_report_abs(input, ABS_X, be16_to_cpu(data.x) >> 6);
>> +    input_report_abs(input, ABS_Y, be16_to_cpu(data.y) >> 6);
>> +    input_report_key(input, BTN_THUMBL, !data.thumb);
>> +    input_sync(input);
>> +}
>> +
>> +static int qwiic_probe(struct i2c_client *client,
>> +               const struct i2c_device_id *id)
> 
> The probe() does not use the i2c_device_id parameter, so I will switch
> it to probe_new() to avoid the temptation of using it in the future.

Sounds awesome!

> Please let me know if you disagree, otherwise I will go and apply (no
> need to resubmit).

I agree,
please merge.
