Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C2D8A343
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfHLQ0k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:26:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33937 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfHLQ0j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:26:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id e8so354451wme.1
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 09:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BCSV8W8crhzepNxJm5ULkSzkz8tlFR9gxIdG65AHcyk=;
        b=N6wGM8/gEm42RgPf10BNxkMZGdxQHdGI+exMo6I3pcWQ2KTEDbaC5fB6PQCzSYlg9I
         qWE6PT4NsA/P4Y4vXJcrEz7CqSvANmuqZ1l7PQARMwMLgOmFuIlZmGrJAVsYNQ+2N/1N
         wtGkzkqCRgK89JvW0phiSSdxQIxhM2kvOadnVqGEAWitc/zXD3/n18N8A8I7zVkn2pEZ
         6uDCC0UFIbAeykfDXkv0TeenBC179EitgtKGmO5Yan3MrjcDpy83Hj2C1YXV1b/oHcKZ
         F1pweP1WIxkW+iKkxL3pEG+gP1AzGbq5moF5TBQ5st7j4hNAj6lbHSUFxSVfI0rsCL/G
         uLLQ==
X-Gm-Message-State: APjAAAWNEVYhF6qniZo472AS1m/3nKm3nLSh2wCR8jREI3wc1Eu2ExkU
        Fs4SvVZbcc+nKzXNdJAT2CWP3Q==
X-Google-Smtp-Source: APXvYqyG/4/23Y7sZK2DpewmP+kdZ2n2Y2MnTD7Ivy/oXpB7X5leUEUuNTZmoKAgfV7nollf6ogoIw==
X-Received: by 2002:a05:600c:254e:: with SMTP id e14mr143925wma.150.1565627197871;
        Mon, 12 Aug 2019 09:26:37 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id w15sm76719wmi.19.2019.08.12.09.26.37
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 09:26:37 -0700 (PDT)
Subject: Re: [PATCH] HID: logitech-dj: add support of the G700(s) receiver
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190812160804.11803-1-benjamin.tissoires@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f97403fd-4bf0-f82b-06e7-8bf4dcb2b2aa@redhat.com>
Date:   Mon, 12 Aug 2019 18:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812160804.11803-1-benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12-08-19 18:08, Benjamin Tissoires wrote:
> Both the G700 and the G700s are sharing the same receiver.
> Include support for this receiver in hid-logitech-dj so that userspace
> can differentiate both.
> 
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Nice, looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/hid/hid-logitech-dj.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index c547cba05fbb..d6250b0cb9f8 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -959,6 +959,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
>   		break;
>   	case 0x07:
>   		device_type = "eQUAD step 4 Gaming";
> +		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
>   		break;
>   	case 0x08:
>   		device_type = "eQUAD step 4 for gamepads";
> @@ -1832,6 +1833,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
>   	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>   			 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2),
>   	 .driver_data = recvr_type_hidpp},
> +	{ /* Logitech G700(s) receiver (0xc531) */
> +	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +		0xc531),
> +	 .driver_data = recvr_type_gaming_hidpp},
>   	{ /* Logitech lightspeed receiver (0xc539) */
>   	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>   		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED),
> 
