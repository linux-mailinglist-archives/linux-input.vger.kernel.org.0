Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3AA11801FB
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 16:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJPhW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 11:37:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45967 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726295AbgCJPhW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 11:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583854640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r299NYbtAjtRD0jW6H2WbOqnLFo/fD8AZ+MzWM7505w=;
        b=RDXa5b7o6BDTQBgkJf7NpLLv7i5U9qC/pwxfYK6ND56CGnilA+mokyVBWsEJ315HMYvdzH
        JLl9yWFUT02tEu3jBRYBjD0C579BFgM5OTgDBYgNfomcpdqoFvqG1wLKo4DMsrJj0FQK6x
        gK3bvRlERJDBuK+YI+jY6AAmm3rlFcY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-igq7i_jZMhqSM3CrQYZnsg-1; Tue, 10 Mar 2020 11:37:18 -0400
X-MC-Unique: igq7i_jZMhqSM3CrQYZnsg-1
Received: by mail-wm1-f71.google.com with SMTP id f207so522422wme.6
        for <linux-input@vger.kernel.org>; Tue, 10 Mar 2020 08:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r299NYbtAjtRD0jW6H2WbOqnLFo/fD8AZ+MzWM7505w=;
        b=Xjms6X0GMGqK5R+mgSRPqQKylTKqc/RCWjKVmCatXHWk1DxIqCJKEv09iB2L94gkzO
         B4M2eDQvAfo6vq67GVUe0EjM/8D0KpaXTQQb4IET3migv4T6h2nMOA4Oydy/J8Ckl5PR
         X3yDJEbLFV0AvoumiSpSXoxuOp3GjS4scd6k/LHyrFu1n7FTYKxXh+FP9lRk66zkg8An
         0egG/NAFVMKuFk4edMV/A+tQcKn0U9pmUD2kHY9uAbRKcNXlZgfE3fnb3tAFyQ/a2egH
         DK8s0BWy1qd8xlgjzsA4/EIfK29MajVZD2j+LoViDWIkp/pi4JybyOFeFFoaGSh+/5kO
         dWhA==
X-Gm-Message-State: ANhLgQ0O6phXw9IdZi16uLcArVIzbyObbm3GjVp41EZ3ojh5NYH4KstV
        sgy/Mr6W98refQL1ZWyR5ALIzObqeX22nw8AJ7r4/tFZUp7zKlIPrMNKgMyIubN5cZAzCn0Cjhn
        IDOqid4LW9heKYu1Lg9rln3Y=
X-Received: by 2002:a1c:1b51:: with SMTP id b78mr2753287wmb.8.1583854637209;
        Tue, 10 Mar 2020 08:37:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsVHIQeKAfOESArktdQJyyFpsJiwFB5Pg7s4YQ4u1xFD88tVwH449addW56lSUIvgAXcB5qdw==
X-Received: by 2002:a1c:1b51:: with SMTP id b78mr2753195wmb.8.1583854635907;
        Tue, 10 Mar 2020 08:37:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id n13sm4619148wmd.21.2020.03.10.08.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 08:37:15 -0700 (PDT)
Subject: Re: [PATCH 1/2] Input: goodix - Add support for touch-keys and
 keycode mapping
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <20200310131705.13516-1-dmastykin@astralinux.ru>
 <44683bdc-9608-d6ea-2b87-b2c65b09f754@redhat.com>
 <220d060e-2ce8-c60d-7237-6cdb119c69c0@astralinux.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <84422996-00b9-29c6-ef27-0f3e9b8da3cf@redhat.com>
Date:   Tue, 10 Mar 2020 16:37:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <220d060e-2ce8-c60d-7237-6cdb119c69c0@astralinux.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/10/20 4:29 PM, Dmitry Mastykin wrote:
> 
> Hi Hans,
> 
> thank you for the suggested ideas for the patches, reviewing them, and for suggested commit message in the last mail.

You're welcome.

> Should I change patch to v2 after correcting the commit message?

Yes the normal way to do this is to use:

git send-email --subject-prefix="PATCH v2" ...

When sending and add a changelog to the commit message after your
Signed-off-by, like this:

Signed-off-by: ...
---
Changes in v2:
- Improve commit message

When Dmitry Torokhov then applies these patches, git am will
automatically remove the changelog (which is mainly for reviewing
purposes) because it ignores everything after the first '---' line.

Regards,

Hans




>  >> Previous press/release behavior has changed.
>  >> Before: both press/release events were generated on key touch.
>  >> Now: press/release events correspond to real touch and release now.
>  >
>  > Looking at the old code I do not think that this is correct,
>  > the old code keeps reporting KEY_LEFTMETA as pressed as long as
>  > the GOODIX_HAVE_KEY is set. I guess the undesirable behavior you
>  > describe here was the result of an earlier version of your
>  > patch to support more then one touch key.
>  >
> I've just tested the old code: it has wrong behavior. And the patch 2/2 ("Input: goodix - Ignore spurious interrupts", 2020-03-10) makes it correct.

Ah ok, that explains. Well then this bit should probably go to the
commit message of 2/2, since the problem will still exist after 1/2, right?





> 
> Kind regards
> Dmitry Mastykin
> 
> 
> On 3/10/20 5:40 PM, Hans de Goede wrote:
>  > Hi,
>  >
>  > Thank you for your patches.
>  >
>  > On 3/10/20 2:17 PM, Dmitry Mastykin wrote:
>  >> KEY_LEFTMETA is assigned to the first touch-key (it will be the default
>  >> keycode for devices with a single touch-key).
>  >> KEY_F1, KEY_F2... are assigned to other touch-keys.
>  >> One may assign any keycodes via HWDB.
>  >
>  > I think the commit message could use some work, e.g. something like this:
>  >
>  > ###
>  >
>  > Subj: Input: goodix - Add support for more then one touch-key
>  >
>  > Some devices with a goodix touchscreen have more then 1 capacitive
>  > touch-key. This commit replaces the current support for a single
>  > touch-key, which ignored the reported key-code. With support for
>  > up to 7 touch-keys, based upon checking the key-code which is
>  > post-fixed to any reported touch-data.
>  >
>  > KEY_LEFTMETA is assigned to the first touch-key (it will still be
>  > the default keycode for devices with a single touch-key).
>  > KEY_F1, KEY_F2... are assigned as default keycode for the other
>  > touch-keys.
>  >
>  > This commit also add supports for keycode remapping, so that
>  > systemd-udev's hwdb can be used to remap the codes to send
>  > keycodes to match the icons on the buttons for devices with more
>  > then 1 touch-key.
>  >
>  > ###
>  >
>  >> Previous press/release behavior has changed.
>  >> Before: both press/release events were generated on key touch.
>  >> Now: press/release events correspond to real touch and release now.
>  >
>  > Looking at the old code I do not think that this is correct,
>  > the old code keeps reporting KEY_LEFTMETA as pressed as long as
>  > the GOODIX_HAVE_KEY is set. I guess the undesirable behavior you
>  > describe here was the result of an earlier version of your
>  > patch to support more then one touch key.
>  >
>  >> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
>  >
>  > Other then the remarks about the commit message this looks
>  > good to me.
>  >
>  > Regards,
>  >
>  > Hans
>  >
>  >
>  >> ---
>  >>   drivers/input/touchscreen/goodix.c | 54 ++++++++++++++++++++++++------
>  >>   1 file changed, 44 insertions(+), 10 deletions(-)
>  >>
>  >> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>  >> index fdec508..6a7ecc6 100644
>  >> --- a/drivers/input/touchscreen/goodix.c
>  >> +++ b/drivers/input/touchscreen/goodix.c
>  >> @@ -38,6 +38,7 @@
>  >>   #define GOODIX_CONTACT_SIZE        8
>  >>   #define GOODIX_MAX_CONTACT_SIZE        9
>  >>   #define GOODIX_MAX_CONTACTS        10
>  >> +#define GOODIX_MAX_KEYS            7
>  >>   #define GOODIX_CONFIG_MIN_LENGTH    186
>  >>   #define GOODIX_CONFIG_911_LENGTH    186
>  >> @@ -55,6 +56,7 @@
>  >>   #define GOODIX_REG_ID            0x8140
>  >>   #define GOODIX_BUFFER_STATUS_READY    BIT(7)
>  >> +#define GOODIX_HAVE_KEY            BIT(4)
>  >>   #define GOODIX_BUFFER_STATUS_TIMEOUT    20
>  >>   #define RESOLUTION_LOC        1
>  >> @@ -100,6 +102,7 @@ struct goodix_ts_data {
>  >>       enum goodix_irq_pin_access_method irq_pin_access_method;
>  >>       unsigned int contact_size;
>  >>       u8 config[GOODIX_CONFIG_MAX_LENGTH];
>  >> +    unsigned short keymap[GOODIX_MAX_KEYS];
>  >>   };
>  >>   static int goodix_check_cfg_8(struct goodix_ts_data *ts,
>  >> @@ -285,8 +288,14 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>  >>        */
>  >>       max_timeout = jiffies + msecs_to_jiffies(GOODIX_BUFFER_STATUS_TIMEOUT);
>  >>       do {
>  >> +        /*
>  >> +         * We are going to read ts->contact_size * max(1, touch_num) + 2
>  >> +         * bytes, where + 2 consists of reading 1 extra byte for the
>  >> +         * header + 1 extra byte for the footer which contains the
>  >> +         * touch-key code.
>  >> +         */
>  >>           error = goodix_i2c_read(ts->client, GOODIX_READ_COOR_ADDR,
>  >> -                    data, ts->contact_size + 1);
>  >> +                    data, ts->contact_size + 2);
>  >>           if (error) {
>  >>               dev_err(&ts->client->dev, "I2C transfer error: %d\n",
>  >>                       error);
>  >> @@ -299,10 +308,10 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>  >>                   return -EPROTO;
>  >>               if (touch_num > 1) {
>  >> -                data += 1 + ts->contact_size;
>  >> +                data += 2 + ts->contact_size;
>  >>                   error = goodix_i2c_read(ts->client,
>  >>                           GOODIX_READ_COOR_ADDR +
>  >> -                            1 + ts->contact_size,
>  >> +                            2 + ts->contact_size,
>  >>                           data,
>  >>                           ts->contact_size *
>  >>                               (touch_num - 1));
>  >> @@ -353,6 +362,23 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
>  >>       input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
>  >>   }
>  >> +static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
>  >> +{
>  >> +    int touch_num;
>  >> +    u8 key_value;
>  >> +    int i;
>  >> +
>  >> +    if (data[0] & GOODIX_HAVE_KEY) {
>  >> +        touch_num = data[0] & 0x0f;
>  >> +        key_value = data[1 + ts->contact_size * touch_num];
>  >> +        for (i = 0; i < GOODIX_MAX_KEYS; ++i)
>  >> +            if (key_value & (1 << i))
>  >> +                input_report_key(ts->input_dev, ts->keymap[i], 1);
>  >> +    } else
>  >> +        for (i = 0; i < GOODIX_MAX_KEYS; ++i)
>  >> +            input_report_key(ts->input_dev, ts->keymap[i], 0);
>  >> +}
>  >> +
>  >>   /**
>  >>    * goodix_process_events - Process incoming events
>  >>    *
>  >> @@ -363,7 +389,7 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
>  >>    */
>  >>   static void goodix_process_events(struct goodix_ts_data *ts)
>  >>   {
>  >> -    u8  point_data[1 + GOODIX_MAX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
>  >> +    u8  point_data[2 + GOODIX_MAX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
>  >>       int touch_num;
>  >>       int i;
>  >> @@ -371,11 +397,7 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>  >>       if (touch_num < 0)
>  >>           return;
>  >> -    /*
>  >> -     * Bit 4 of the first byte reports the status of the capacitive
>  >> -     * Windows/Home button.
>  >> -     */
>  >> -    input_report_key(ts->input_dev, KEY_LEFTMETA, point_data[0] & BIT(4));
>  >> +    goodix_ts_report_key(ts, point_data);
>  >>       for (i = 0; i < touch_num; i++)
>  >>           if (ts->contact_size == 9)
>  >> @@ -961,6 +983,7 @@ static int goodix_i2c_test(struct i2c_client *client)
>  >>   static int goodix_configure_dev(struct goodix_ts_data *ts)
>  >>   {
>  >>       int error;
>  >> +    int i;
>  >>       ts->int_trigger_type = GOODIX_INT_TRIGGER;
>  >>       ts->max_touch_num = GOODIX_MAX_CONTACTS;
>  >> @@ -978,8 +1001,19 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
>  >>       ts->input_dev->id.product = ts->id;
>  >>       ts->input_dev->id.version = ts->version;
>  >> +    ts->input_dev->keycode = ts->keymap;
>  >> +    ts->input_dev->keycodesize = sizeof(ts->keymap[0]);
>  >> +    ts->input_dev->keycodemax = GOODIX_MAX_KEYS;
>  >> +
>  >>       /* Capacitive Windows/Home button on some devices */
>  >> -    input_set_capability(ts->input_dev, EV_KEY, KEY_LEFTMETA);
>  >> +    for (i = 0; i < GOODIX_MAX_KEYS; ++i) {
>  >> +        if (i == 0)
>  >> +            ts->keymap[i] = KEY_LEFTMETA;
>  >> +        else
>  >> +            ts->keymap[i] = KEY_F1 + (i - 1);
>  >> +
>  >> +        input_set_capability(ts->input_dev, EV_KEY, ts->keymap[i]);
>  >> +    }
>  >>       input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_X);
>  >>       input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_Y);
>  >>
>  >
> 

