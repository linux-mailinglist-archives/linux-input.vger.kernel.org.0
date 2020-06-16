Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1C21FB63E
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 17:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgFPPcv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 11:32:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:43770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729005AbgFPPcv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 11:32:51 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D271A208B3;
        Tue, 16 Jun 2020 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592321570;
        bh=jCbT+CmvAYlHacJlykO+5M9RH/L4shsIDI1ktzTh1Gc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DYVzvYIphkOACZbtNzBvqJY6ykOFKDfcB2jfIlR+A1VP1iMZgvRCqBf8fG8lQuWpl
         k4F0pGF8kR/N+Wt3ZLAuHjDvuGCbw8wIOP05rZYQTdrijNSn2kXVgUaU62yDXsGh/N
         or+ulptq7CgbHeKKtNc+tfPTR8Cfqa8Ilh+kP2IA=
Date:   Tue, 16 Jun 2020 17:32:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Caiyuan Xie <shirleyxcy@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Caiyuan Xie <caiyuan.xie@cn.alps.com>
Subject: Re: [PATCH] add alps devices to the hid-ids.h
In-Reply-To: <20200522090937.5917-1-Shirleyxcy@gmail.com>
Message-ID: <nycvar.YFH.7.76.2006161732010.13242@cbobk.fhfr.pm>
References: <20200522090937.5917-1-Shirleyxcy@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 May 2020, Caiyuan Xie wrote:

> <Change List>
> --Add ALPS devices 

Please explain in the changelog why we want those device IDs added, 
especially as nothing in the code relies on these constants.

> 
> Signed-off-by: Caiyuan Xie <caiyuan.xie@cn.alps.com>
> ---
>  drivers/hid/hid-ids.h | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 1c71a1aa76b2..db318e6a1ad1 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
[ ... snip ... ]
>  #define USB_VENDOR_ID_AMI		0x046b
>  #define USB_DEVICE_ID_AMI_VIRT_KEYBOARD_AND_MOUSE	0xff10
>  
> @@ -385,7 +400,6 @@
>  #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_7349	0x7349
>  #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_73F7	0x73f7
>  #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_A001	0xa001
> -#define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_C002	0xc002
>  
>  #define USB_VENDOR_ID_ELAN		0x04f3
>  #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
> @@ -465,10 +479,6 @@
>  #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_010A 0x010a
>  #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
>  
> -#define USB_VENDOR_ID_GLORIOUS  0x258a
> -#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
> -#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
> -
>  #define I2C_VENDOR_ID_GOODIX		0x27c6
>  #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
>  
> @@ -760,7 +770,6 @@
>  #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2	0xc218
>  #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
>  #define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
> -#define USB_DEVICE_ID_LOGITECH_G11		0xc225
>  #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
>  #define USB_DEVICE_ID_LOGITECH_G510		0xc22d
>  #define USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO	0xc22e
> @@ -827,7 +836,6 @@
>  #define USB_DEVICE_ID_PICK16F1454	0x0042
>  #define USB_DEVICE_ID_PICK16F1454_V2	0xf2f7
>  #define USB_DEVICE_ID_LUXAFOR		0xf372
> -#define USB_DEVICE_ID_MCP2221		0x00dd
>  
>  #define USB_VENDOR_ID_MICROSOFT		0x045e
>  #define USB_DEVICE_ID_SIDEWINDER_GV	0x003b
> @@ -1099,9 +1107,6 @@
>  #define USB_DEVICE_ID_SYMBOL_SCANNER_2	0x1300
>  #define USB_DEVICE_ID_SYMBOL_SCANNER_3	0x1200
>  
> -#define I2C_VENDOR_ID_SYNAPTICS     0x06cb
> -#define I2C_PRODUCT_ID_SYNAPTICS_SYNA2393   0x7a13
> -
>  #define USB_VENDOR_ID_SYNAPTICS		0x06cb
>  #define USB_DEVICE_ID_SYNAPTICS_TP	0x0001
>  #define USB_DEVICE_ID_SYNAPTICS_INT_TP	0x0002
> @@ -1116,7 +1121,6 @@
>  #define USB_DEVICE_ID_SYNAPTICS_LTS2	0x1d10
>  #define USB_DEVICE_ID_SYNAPTICS_HD	0x0ac3
>  #define USB_DEVICE_ID_SYNAPTICS_QUAD_HD	0x1ac3
> -#define USB_DEVICE_ID_SYNAPTICS_DELL_K12A	0x2819
>  #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012	0x2968
>  #define USB_DEVICE_ID_SYNAPTICS_TP_V103	0x5710
>  #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7

What are all these unrelated changes about?

-- 
Jiri Kosina
SUSE Labs

