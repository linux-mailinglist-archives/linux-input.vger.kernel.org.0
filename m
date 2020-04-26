Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B0B1B918A
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgDZQMF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726405AbgDZQMC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:12:02 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F748C061A0F;
        Sun, 26 Apr 2020 09:12:02 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h6so11774563lfc.0;
        Sun, 26 Apr 2020 09:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EGk59O8R6O1u7kRb6vg7K7Dh5PkymVwnc8pfZSlavs4=;
        b=eiWcxK5Q0yZTHpnmMzkwoAGaLEUyBgPJa9/rKUA1ilNc7r3jpGMxeDdgh3/an6zooZ
         GmlMQZ7afMyCXjOwQqpb9WNzWNDS08ZGR2IRVYlUSB7inO7wXtf0hvxFH6dPqz+OE8Bo
         I3RnmRFRKFikiP6qq+hLZQoOrBii6qqaWJl5mcag4GRyyVXahtoHu7dT7k3pMyL/tkw1
         9E46KXxQs7ZwVqVVSN5q7RBD0Lx2Joy/aLK5dPbSP+nuOOTK6bFnvWppQjTbVXNit2fZ
         QVKzORoPSY/8P0nkpHseI9CzqaVeCVevnjq+gKY6lU2N4AFFm69Xt9zJ7tyBf/+t0+qs
         V5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EGk59O8R6O1u7kRb6vg7K7Dh5PkymVwnc8pfZSlavs4=;
        b=UjztnfhaRjxLDuvJo4scLnVarmqimklcyYrxYoxYzoli+2HqHZYS3xwajdcBAhOx0W
         QFgjAICTe3qPmJUoX5Q/Ze+ufyahMoFey+Z0DCGKJarWjX7uhmtJyumz7/UaSiEfRBeu
         hYTTfMAjPYGo62RO9OQWvd1Nl0jRL08WVC3cEV4MyPMFUhfD9R8opPtOK7sp+izRSV7j
         8sa1gc4D3/u/mxrzHWkME9zhIlJK4+fpPPOmMmoW+QRs0BZK+X/KxmC7+jgyk6mYyQfq
         wbLOK80EMCWblXO5uWp3pYmbvy9yHOMwI4a3nFia4m317vhzRa137owbo8/IWzq++GFm
         Qdsw==
X-Gm-Message-State: AGi0PuahrezIMIpdonpSfC6YeRE9zgJ3Hk1HU0iLbETqMUZm5nbj2kMW
        5enCqvxeJuH6BiyHTCvOzWJ1p/rv
X-Google-Smtp-Source: APiQypJNUi9T4fijFfoPRCzqUx3j8tHjNvZR6y6r8u3TLWf09IKcjQriixnhOUZqrsIBry3ORoZ9WA==
X-Received: by 2002:a19:a411:: with SMTP id q17mr13041896lfc.214.1587917520410;
        Sun, 26 Apr 2020 09:12:00 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id p14sm9111380lfe.87.2020.04.26.09.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 09:11:59 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426045200.GN125362@dtor-ws> <20200426112150.GA16230@qmqm.qmqm.pl>
 <a9828df8-c974-3bc2-6ecf-962489cf1189@gmail.com>
 <489b497b-fd25-fa6b-59c9-9d925c489fe0@gmail.com>
Message-ID: <4d2a9eb2-3b01-59fe-7077-de8e11a6ddb1@gmail.com>
Date:   Sun, 26 Apr 2020 19:11:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <489b497b-fd25-fa6b-59c9-9d925c489fe0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 18:41, Dmitry Osipenko пишет:
> 26.04.2020 18:39, Dmitry Osipenko пишет:
>> 26.04.2020 14:21, Michał Mirosław пишет:
>>> On Sat, Apr 25, 2020 at 09:52:00PM -0700, Dmitry Torokhov wrote:
>>>> On Mon, Apr 13, 2020 at 03:32:23PM +0200, Michał Mirosław wrote:
>>>>> Driver only ever reports MT events. Clear capabilities of all others.
>>>> This is not true. input_mt_sync_frame() calls
>>>> input_mt_report_pointer_emulation() which does emut single-touch events
>>>> for the benefit of older userspace (or userspace that is not interested
>>>> in multitouch).
>>>
>>> Oh, I didn't notice that. Looking at the code, I see that
>>> input_mt_init_slots() sets up the emulated axes in this case.
>>>
>>> Do you need me to update the commitmsg?
>>
>> I tried Ubuntu 12.04 that uses ancient libinput (or whatever it was back
>> then), which doesn't support MT. Mouse doesn't move at all with this
>> patch being applied.

> Without this patch mouse moves, but it's not usable
>> because the cursor's position is wrong, i.e. mouse position doesn't
>> match the screen touches.

The fix for the legacy pointer emulation is trivial:

--- >8 ---
diff --git a/drivers/input/touchscreen/elants_i2c.c
b/drivers/input/touchscreen/elants_i2c.c
index 060c60c04f25..3644b5b48081 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1414,6 +1414,8 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_abs_set_res(ts->input, ABS_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_Y, ts->y_res);

+	touchscreen_parse_properties(ts->input, false, &ts->prop);
+
 	/* Multitouch input params setup */
 	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
--- >8 ---

Michał, please incorporate this change into the next version.

>> This means that input_mt_report_pointer_emulation() doesn't set up
>> everything needed for the legacy pointer emulation.
>>
> 
> I meant the input_mt_init_slots().
> 

