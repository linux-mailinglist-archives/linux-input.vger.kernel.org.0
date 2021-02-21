Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AD93207FA
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 02:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhBUBiQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 20:38:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:42150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229847AbhBUBiQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 20:38:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71B4764EEC;
        Sun, 21 Feb 2021 01:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613871455;
        bh=6WM2exvlGXLeJZONSvTlHrgP3/jS1lf0s/20FYv9++8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fFQ88nHe4Q0HAD0NNe0O88+Wzb9gvq60QSWFDqs67RY0PrDuZwcmJ2xd4HiM7PmZa
         j+KCbO6gXVsSeQ6hTSVIKmYMFZEAnnMdzYfUTfI53jPlEdtkjKBaduRuJe379il9GP
         uZRsUxI79XZ5rU2CDNpnk2pDbqzJ4vNmb45ohjvESiTjz6BT/rFeztO36dOWleBe0F
         Krg5a6UIWPmBsrBm6JR4ocLviNOOSJgF0YeIj58vCAoi3w6CG13SKH58l/szlPuXkZ
         YpHfcPoYoTd58bt6F14NekQf4cvodhAFpoCh61JuV0/8fyTHVWuu2amvT2/Mf0p9k6
         Qg0MFUhphFM5Q==
Date:   Sun, 21 Feb 2021 02:37:31 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/7] HID: lenovo: Fix lenovo_led_set_tp10ubkbd()
 error handling
Message-ID: <20210221023731.616e20ba@kernel.org>
In-Reply-To: <20210220122438.21857-3-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
        <20210220122438.21857-3-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 20 Feb 2021 13:24:33 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Fix the following issues with lenovo_led_set_tp10ubkbd() error handling:
> 
> 1. On success hid_hw_raw_request() returns the number of bytes send.

bytes sent

> @@ -75,10 +75,12 @@ static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
>  	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
>  	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
>  				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> -	if (ret)
> +	if (ret != 3 && ret != -ENODEV)
>  		hid_err(hdev, "Set LED output report error: %d\n", ret);
>  
>  	mutex_unlock(&data->led_report_mutex);
> +
> +	return ret < 0 ? ret : 0;

So if ret == 2, it will log error but return 0. I think in that case it
should return -EIO.
