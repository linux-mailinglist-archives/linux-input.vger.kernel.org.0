Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571B912422E
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 09:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfLRIs6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 18 Dec 2019 03:48:58 -0500
Received: from smtprelay.restena.lu ([158.64.1.62]:44380 "EHLO
        smtprelay.restena.lu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfLRIs6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 03:48:58 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Dec 2019 03:48:56 EST
Received: from pluto.restena.lu (pluto.restena.lu [IPv6:2001:a18:1:10::156])
        by smtprelay.restena.lu (Postfix) with ESMTPS id D553142D2A;
        Wed, 18 Dec 2019 09:41:41 +0100 (CET)
Date:   Wed, 18 Dec 2019 09:41:41 +0100
From:   Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: hid-picolcd: fix possible sleep-in-atomic-context
 bug
Message-ID: <20191218094141.785d8e31@pluto.restena.lu>
In-Reply-To: <20191218080201.2508-1-baijiaju1990@gmail.com>
References: <20191218080201.2508-1-baijiaju1990@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jia-Ju,

Your checker has been looking at fallback implementation for
the might-sleep hid_alloc_report_buf(GFP_KERNEL).

Did you have a look at the low-lever bus-driver implementations:
  hdev->ll_driver->request
                   ^^^^^^^

Are those all sleeping as well or maybe they don't sleep?


I will have a look over the coming days.

Best regards,
Bruno Prémont

On Wed, 18 Dec 2019 16:02:01 +0800 Jia-Ju Bai wrote:
> The driver may sleep while holding a read lock.
> The function call path (from bottom to top) in Linux 4.19 is:
> 
> drivers/hid/hid-core.c, 1459: 
> 	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
> ./include/linux/hid.h, 1051: 
> 	__hid_request in hid_hw_request
> drivers/hid/hid-picolcd_leds.c, 56:
> 	hid_hw_request in picolcd_leds_set
> drivers/hid/hid-picolcd_leds.c, 53:
> 	_raw_spin_lock_irqsave in picolcd_leds_set
> 
> drivers/hid/hid-core.c, 1459: 
> 	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
> ./include/linux/hid.h, 1051: 
> 	__hid_request in hid_hw_request
> drivers/hid/hid-picolcd_lcd.c, 49: 
> 	hid_hw_request in picolcd_set_contrast
> drivers/hid/hid-picolcd_lcd.c, 46: 
> 	_raw_spin_lock_irqsave in picolcd_set_contrast
> 
> drivers/hid/hid-core.c, 1459: 
> 	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
> ./include/linux/hid.h, 1051: 
> 	__hid_request in hid_hw_request
> drivers/hid/hid-picolcd_core.c, 245: 
> 	hid_hw_request in picolcd_reset
> drivers/hid/hid-picolcd_core.c, 235: 
> 	_raw_spin_lock_irqsave in picolcd_reset
> 
> drivers/hid/hid-core.c, 1459: 
> 	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
> ./include/linux/hid.h, 1051: 
> 	__hid_request in hid_hw_request
> drivers/hid/hid-picolcd_core.c, 111: 
> 	hid_hw_request in picolcd_send_and_wait
> drivers/hid/hid-picolcd_core.c, 100: 
> 	_raw_spin_lock_irqsave in picolcd_send_and_wait
> 
> hid_alloc_report_buf(GFP_KERNEL) can sleep at runtime.
> 
> To fix these bugs, hid_hw_request() is called without holding the
> spinlock.
> 
> These bugs are found by a static analysis tool STCheck written by myself.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/hid/hid-picolcd_core.c | 4 ++--
>  drivers/hid/hid-picolcd_lcd.c  | 6 ++++--
>  drivers/hid/hid-picolcd_leds.c | 6 ++++--
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
> index 1b5c63241af0..55d1892daa15 100644
> --- a/drivers/hid/hid-picolcd_core.c
> +++ b/drivers/hid/hid-picolcd_core.c
> @@ -99,8 +99,8 @@ struct picolcd_pending *picolcd_send_and_wait(struct hid_device *hdev,
>  		work = NULL;
>  	} else {
>  		data->pending = work;
> -		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
>  		spin_unlock_irqrestore(&data->lock, flags);
> +		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
>  		wait_for_completion_interruptible_timeout(&work->ready, HZ*2);
>  		spin_lock_irqsave(&data->lock, flags);
>  		data->pending = NULL;
> @@ -233,8 +233,8 @@ int picolcd_reset(struct hid_device *hdev)
>  		spin_unlock_irqrestore(&data->lock, flags);
>  		return -ENODEV;
>  	}
> -	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
>  	spin_unlock_irqrestore(&data->lock, flags);
> +	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
>  
>  	error = picolcd_check_version(hdev);
>  	if (error)
> diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
> index 0c4b76de8ae5..1fd291674ffe 100644
> --- a/drivers/hid/hid-picolcd_lcd.c
> +++ b/drivers/hid/hid-picolcd_lcd.c
> @@ -26,6 +26,7 @@ static int picolcd_get_contrast(struct lcd_device *ldev)
>  static int picolcd_set_contrast(struct lcd_device *ldev, int contrast)
>  {
>  	struct picolcd_data *data = lcd_get_data(ldev);
> +	int status;
>  	struct hid_report *report = picolcd_out_report(REPORT_CONTRAST, data->hdev);
>  	unsigned long flags;
>  
> @@ -35,9 +36,10 @@ static int picolcd_set_contrast(struct lcd_device *ldev, int contrast)
>  	data->lcd_contrast = contrast & 0x0ff;
>  	spin_lock_irqsave(&data->lock, flags);
>  	hid_set_field(report->field[0], 0, data->lcd_contrast);
> -	if (!(data->status & PICOLCD_FAILED))
> -		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
> +	status = data->status;
>  	spin_unlock_irqrestore(&data->lock, flags);
> +	if (!(status & PICOLCD_FAILED))
> +		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
>  	return 0;
>  }
>  
> diff --git a/drivers/hid/hid-picolcd_leds.c b/drivers/hid/hid-picolcd_leds.c
> index 6b505a753511..6652aa6b98dd 100644
> --- a/drivers/hid/hid-picolcd_leds.c
> +++ b/drivers/hid/hid-picolcd_leds.c
> @@ -32,6 +32,7 @@
>  void picolcd_leds_set(struct picolcd_data *data)
>  {
>  	struct hid_report *report;
> +	int status;
>  	unsigned long flags;
>  
>  	if (!data->led[0])
> @@ -42,9 +43,10 @@ void picolcd_leds_set(struct picolcd_data *data)
>  
>  	spin_lock_irqsave(&data->lock, flags);
>  	hid_set_field(report->field[0], 0, data->led_state);
> -	if (!(data->status & PICOLCD_FAILED))
> -		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
> +	status = data->status;
>  	spin_unlock_irqrestore(&data->lock, flags);
> +	if (!(status & PICOLCD_FAILED))
> +		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
>  }
>  
>  static void picolcd_led_set_brightness(struct led_classdev *led_cdev,
