Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41112818E8
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfHEMMq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:12:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:55998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfHEMMq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 08:12:46 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F5A72086D;
        Mon,  5 Aug 2019 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565007165;
        bh=6p61YBrigsh6c3DdbGJboBrAdx42HdHFK34yib23crQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=a7h/o3HHcs8Cr+t8AkTKNuTIvz23zMUQ4XBqfsz7eJhTxhczASKr9TbLI1fxBmuh4
         t4OYPI5Ek0Bv0pQMGdHQQ29AvPD+JaBibq26hD0Iun6PGlabqB5N+WzTwf30WzZirc
         A6ngax6fKWtdA1MBqm8sfPPuiRNHCEl6rVpwDhCs=
Date:   Mon, 5 Aug 2019 14:12:40 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Istv=E1n_V=E1radi?= <ivaradi@varadiistvan.hu>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: Add Saitek X52 to the HID IDs
In-Reply-To: <20190724180806.5745-1-ivaradi@varadiistvan.hu>
Message-ID: <nycvar.YFH.7.76.1908051411410.5899@cbobk.fhfr.pm>
References: <20190724180806.5745-1-ivaradi@varadiistvan.hu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 24 Jul 2019, István Váradi wrote:

> The USB device ID of the Saitek X52 joystick is added as a
> define to hid-ids.h.
> 
> Signed-off-by: István Váradi <ivaradi@varadiistvan.hu>
> ---
>  drivers/hid/hid-ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 0d695f8e1b2c..3a90962614ef 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -989,6 +989,7 @@
>  #define USB_DEVICE_ID_SAITEK_RAT7	0x0cd7
>  #define USB_DEVICE_ID_SAITEK_RAT9	0x0cfa
>  #define USB_DEVICE_ID_SAITEK_MMO7	0x0cd0
> +#define USB_DEVICE_ID_SAITEK_X52	0x075c
>  
>  #define USB_VENDOR_ID_SAMSUNG		0x0419
>  #define USB_DEVICE_ID_SAMSUNG_IR_REMOTE	0x0001

István,

thanks for the fix. I don't think it's necessary to have this as a 
split-out change from the quirk addition. I've squashed the two patches 
into one, and applied to for-5.3/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs

