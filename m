Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A22B2A2BDC
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 14:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgKBNoq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 08:44:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36714 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725789AbgKBNoq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Nov 2020 08:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604324684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pxp2Nj1H/5tlJcYtXlgneoQlHOclOYbhbDQvMkea8qo=;
        b=O810SnJso3/sMkbNvA6/TiTbFK+ufC9t6j6zvosaf6B7xmD5HwGZCS0zuMhi7sjV8ITJjH
        nQwvBWqnnWyLbxSa3wZC9BWxMBD2mB8RWK4dFcL3Attu/aSIpgvitzqUlkeTMLerHAgNOh
        hWyWiFxsaJrMPBQptI3QnoGWT9GfFyc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-jMxxOns1PFSc0DIFlBduNQ-1; Mon, 02 Nov 2020 08:44:42 -0500
X-MC-Unique: jMxxOns1PFSc0DIFlBduNQ-1
Received: by mail-ed1-f70.google.com with SMTP id dm20so6203046edb.2
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 05:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pxp2Nj1H/5tlJcYtXlgneoQlHOclOYbhbDQvMkea8qo=;
        b=O9aHfKw1N8z7TA3O5UWVeLsgR8OG2QQtv9LwT2MHuhgwq71wSS4H4423we0P+eXSfM
         IFd0YlB3TCW9y1/rfjjrnzGgYO9/T5KbxlluWJRN0Z59DhYxZpiQ0n+UA+ImiN/wZ0xz
         jdD1JmR0BmaQVWZ5AeL4PQoVwBV73UVsKqzPlpsGzCx+g13BbuWCdC6G/bzVrmr78TGb
         kcEX74KsvzLh94gPj+1lQZWckHniAm9w+uZPP6a6ldRrWgIYy81DuUfQ9U4gCkFCVNju
         I30FGVx8+TXsy8oNZGffIEhfLH+dhiuYj2VR4fZvr5ADSrBviUCe9uzd96Eu7yKV/XAH
         88ww==
X-Gm-Message-State: AOAM532JodZScPOwFLopn/wELq79nIic4bgiiMO1wMS6in3d18wdXRdL
        A8d85PvbyTVNvAN9WuaE08Rx+G5R+4AIvj9/O9DfUB5s7v7eIBSsD8vyjS6NvXPpUPcevlYv6Tk
        xNWBKvY1g3hu949vGjTQCSQA=
X-Received: by 2002:a17:906:e24a:: with SMTP id gq10mr15113756ejb.552.1604324681374;
        Mon, 02 Nov 2020 05:44:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWvO2wOXIHG0WcqBr0VvVt9fW3W+FD7pcZxHVRYOLbpg31aIOWkejywOf8MCHBM6hkRjxM/g==
X-Received: by 2002:a17:906:e24a:: with SMTP id gq10mr15113746ejb.552.1604324681151;
        Mon, 02 Nov 2020 05:44:41 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id y12sm7314695ejj.95.2020.11.02.05.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 05:44:40 -0800 (PST)
Subject: Re: [PATCH 1/3] HID: logitech-dj: Handle quad/bluetooth keyboards
 with a builtin trackpad
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, stable@vger.kernel.org
References: <20201102133658.4410-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3f645eea-31a0-d1a9-7e70-54e766bab9c2@redhat.com>
Date:   Mon, 2 Nov 2020 14:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102133658.4410-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/2/20 2:36 PM, Hans de Goede wrote:
> Some quad/bluetooth keyboards, such as the Dinovo Edge (Y-RAY81) have a
> builtin touchpad. In this case when asking the receiver for paired devices,
> we get only 1 paired device with a device_type of REPORT_TYPE_KEYBOARD.
> 
> This means that we do not instantiate a second dj_hiddev for the mouse
> (as we normally would) and thus there is no place for us to forward the
> mouse input reports to, causing the touchpad part of the keyboard to not
> work.
> 
> There is no way for us to detect these keyboards, so this commit adds
> an array with device-ids for such keyboards and when a keyboard is on
> this list it adds STD_MOUSE to the reports_supported bitmap for the
> dj_hiddev created for the keyboard fixing the touchpad not working.
> 
> Using a list of device-ids for this is not ideal, but there are only
> very few such keyboards so this should be fine. Besides the Dinovo Edge,
> other known wireless Logitech keyboards with a builtin touchpad are:
> 
> * Dinovo Mini (TODO add its device-id to the list)

Benjamin, you have a Dinovo Mini, right ?

It looks like that is using the same quad/bluetooth combo receiver
as the Dinovo Edge, but then with slightly different USB ids, which
means that atm we are not using the logitech-dj driver for it.

But the dongles appear to be interchangeable I can pair the Dinovo
Edge with both the MX5000 and the MX5500 dongles which I have, so
someone who mixes up dongles (or gets a spare one) could end up
using the Dinovo Mini with a dongle which is already handled by
the logitech-dj driver.

As such it would be good if you can add the Dinovo Mini to the
device-id list this patch introduces (or if you tell me the device-id
I can do a v2 adding it depending on the timing).

Also I think you should probably add the USB-ids for your
Dinovo dongle to the logitech-dj driver. This will allow you
to verify that adding the device-id is necessary and also
will give you battery status reporting while used in USB HID
proxy mode.

Last you may want to check battery-status reporting in Bluetooth
mode, and maybe also make the logitech-hidpp driver handle the
Dinovo Mini in bluetooth mode, as at least on the Dinovo Edge
the standard HID battery reporting done in bluetooth mode
(and not in HID proxy mode interesting enough) seems to be
broken.

Regards,

Hans



> * K400 (uses a unifying receiver so is not affected)
> * K600 (uses a unifying receiver so is not affected)
> 
> Cc: stable@vger.kernel.org
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1811424
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index ea1e40530f85..9ed7260b9593 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -867,11 +867,23 @@ static void logi_dj_recv_queue_notification(struct dj_receiver_dev *djrcv_dev,
>  	schedule_work(&djrcv_dev->work);
>  }
>  
> +/*
> + * Some quad/bluetooth keyboards have a builtin touchpad in this case we see
> + * only 1 paired device with a device_type of REPORT_TYPE_KEYBOARD. For the
> + * touchpad to work we must also forward mouse input reports to the dj_hiddev
> + * created for the keyboard (instead of forwarding them to a second paired
> + * device with a device_type of REPORT_TYPE_MOUSE as we normally would).
> + */
> +static const u16 kbd_builtin_touchpad_ids[] = {
> +	0xb309, /* Dinovo Edge */
> +};
> +
>  static void logi_hidpp_dev_conn_notif_equad(struct hid_device *hdev,
>  					    struct hidpp_event *hidpp_report,
>  					    struct dj_workitem *workitem)
>  {
>  	struct dj_receiver_dev *djrcv_dev = hid_get_drvdata(hdev);
> +	int i, id;
>  
>  	workitem->type = WORKITEM_TYPE_PAIRED;
>  	workitem->device_type = hidpp_report->params[HIDPP_PARAM_DEVICE_INFO] &
> @@ -883,6 +895,13 @@ static void logi_hidpp_dev_conn_notif_equad(struct hid_device *hdev,
>  		workitem->reports_supported |= STD_KEYBOARD | MULTIMEDIA |
>  					       POWER_KEYS | MEDIA_CENTER |
>  					       HIDPP;
> +		id = (workitem->quad_id_msb << 8) | workitem->quad_id_lsb;
> +		for (i = 0; i < ARRAY_SIZE(kbd_builtin_touchpad_ids); i++) {
> +			if (id == kbd_builtin_touchpad_ids[i]) {
> +				workitem->reports_supported |= STD_MOUSE;
> +				break;
> +			}
> +		}
>  		break;
>  	case REPORT_TYPE_MOUSE:
>  		workitem->reports_supported |= STD_MOUSE | HIDPP;
> 

