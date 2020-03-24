Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC981191A1A
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 20:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgCXTiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 15:38:14 -0400
Received: from mail.astralinux.ru ([217.74.38.120]:40740 "EHLO astralinux.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725835AbgCXTiO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 15:38:14 -0400
Received: from [46.148.196.138] (account dmastykin@astralinux.ru HELO [192.168.32.67])
  by astralinux.ru (CommuniGate Pro SMTP 6.2.7)
  with ESMTPSA id 1787107; Tue, 24 Mar 2020 22:35:34 +0300
Subject: Re: [PATCH v3 1/2] Input: goodix - Add support for more then one
 touch-key
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
References: <20200316075302.3759-1-dmastykin@astralinux.ru>
 <20200324185121.GA75430@dtor-ws>
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
Message-ID: <4c0be7d7-4d88-5adf-bbb3-5af036115e7a@astralinux.ru>
Date:   Tue, 24 Mar 2020 22:38:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200324185121.GA75430@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,
we had discussed earlier this point with Hans:

Hans:
 >>> 3) In goodix_ts_report_key you do:
 >>>
 >>>                   for (i = 0; i < GOODIX_MAX_KEYS; ++i)
 >>>                           if (key_value & (1 << i))
 >>>                                   input_report_key(ts->input_dev, 
ts->keymap[i], 1
 >>>
 >>> But if the user then jumps his finger from say touch_key 0 to 
touch_key 1
 >>> without us receiving a "packet" in between with GOODIX_HAVE_KEY set,
 >>> then we never release touch_key 0. So instead this really should be:
 >>>
 >>>                   for (i = 0; i < GOODIX_MAX_KEYS; ++i)
 >>>                           input_report_key(ts->input_dev, 
ts->keymap[i],
 >>>                                            key_value & (1 << i));
 >>>

Me:
 >> It seems, that this problem never happens. When user moves finger from
 >> button to button, we stably receive 2-3 packets without
 >> GOODIX_HAVE_KEY in between, that release all previous touches. From
 >> other hand, your change will not work when the same keycode is
 >> assigned to several buttons - it will be immediately released.

Hans:
 >
 > Hmm, interesting point I did not think of that. That would be a bit
 > weird thing to do, but it is not impossible...
 >
 > I'm afraid Dmitry (the input maintainer) will likely make the same
 > remark as I do though (when you submit this upstream). But we'll see.
 >
 > Keeping this as is is fine with me.

So I'm impressed about your mutual understanding) And waiting for your 
decision.
Thank you!

Kind regards
Dmitry Mastykin

On 3/24/20 9:51 PM, Dmitry Torokhov wrote:
> Hi Dmitry,
> 
> On Mon, Mar 16, 2020 at 10:53:03AM +0300, Dmitry Mastykin wrote:
>> +static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
>> +{
>> +	int touch_num;
>> +	u8 key_value;
>> +	int i;
>> +
>> +	if (data[0] & GOODIX_HAVE_KEY) {
>> +		touch_num = data[0] & 0x0f;
>> +		key_value = data[1 + ts->contact_size * touch_num];
>> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
>> +			if (key_value & (1 << i))
>> +				input_report_key(ts->input_dev, ts->keymap[i], 1);
>> +	} else
>> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
>> +			input_report_key(ts->input_dev, ts->keymap[i], 0);
> 
> Should this be written as:
> 
> 	if (data[0] & GOODIX_HAVE_KEY) {
> 		touch_num = data[0] & 0x0f;
> 		key_value = data[1 + ts->contact_size * touch_num];
> 	} else {
> 		/* Release all keys */
> 		key_value = 0;
> 	}
> 
> 	for (i = 0; i < GOODIX_MAX_KEYS; i++)
> 		input_report_key(ts->input_dev, ts->keymap[i],
> 				 key_value & BIT(i);
> 
> or the device may send incremental updates to the keys pressed without
> resending currently pressed keys (sounds unlikely)?
> 
> Thanks.
> 
