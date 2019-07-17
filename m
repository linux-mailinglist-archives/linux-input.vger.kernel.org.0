Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54876BB77
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 13:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfGQLcD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 17 Jul 2019 07:32:03 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:64933 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfGQLcD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 07:32:03 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="31401584"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 17 Jul 2019 19:32:01 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(128597:0:AUTH_RELAY)
        (envelope-from <scott.liu@emc.com.tw>); Wed, 17 Jul 2019 19:32:00 +0800 (CST)
Received: from 192.168.135.106
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(122355:0:AUTH_RELAY)
        (envelope-from <scott.liu@emc.com.tw>); Wed, 17 Jul 2019 19:31:58 +0800 (CST)
From:   =?utf-8?B?5YqJ5ZiJ6ae/?= <scott.liu@emc.com.tw>
To:     "'Harry Cutts'" <hcutts@chromium.org>
Cc:     "'linux-input'" <linux-input@vger.kernel.org>,
        "'Benjamin Tissoires'" <benjamin.tissoires@gmail.com>
References: <00ab01d53bc0$8824a440$986decc0$@emc.com.tw> <CA+jURcv8RW4tUPafgcJ=zw4G84oRmXYAnJ+S97GNka6ndwN86Q@mail.gmail.com>
In-Reply-To: <CA+jURcv8RW4tUPafgcJ=zw4G84oRmXYAnJ+S97GNka6ndwN86Q@mail.gmail.com>
Subject: RE: force re-enumeration i2c_hid device?
Date:   Wed, 17 Jul 2019 19:31:59 +0800
Message-ID: <016f01d53c93$3f12bf70$bd383e50$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHIgY2iYMojs2alUCqq3moooCQi7wJbPZO8ptVIeoA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDAwMzVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03Yzk3ZjVhYy1hODg2LTExZTktODc2Ni1jODljZGNkMjU5ZTlcYW1lLXRlc3RcN2M5N2Y1YWUtYTg4Ni0xMWU5LTg3NjYtYzg5Y2RjZDI1OWU5Ym9keS50eHQiIHN6PSIxNjg4IiB0PSIxMzIwNzgzNjcxOTE0NDg0ODAiIGg9ImI1YlF6Yk9GMzY3NGJrUy9BbFdJVnp1RGJqYz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Indeed, my firmware was goes wrong. The Chormium os can enumerate right touchscreen resolution after fix firmware.
Thanks for your helps!

BR,
Scott 


> -----Original Message-----
> From: Harry Cutts [mailto:hcutts@chromium.org]
> Sent: Wednesday, July 17, 2019 1:43 AM
> To: 劉嘉駿
> Cc: linux-input; Benjamin Tissoires
> Subject: Re: force re-enumeration i2c_hid device?
> 
> Cross-posting my response from the chromium-os-dev mailing list [0], since
> this is probably a better list for this:
> 
> On Tue, 16 Jul 2019 at 03:23, 劉嘉駿 <scott.liu@emc.com.tw> wrote:
> >         I already tried below:
> >         1. echo –n “0018:04F3:0732:0001” >
> > /sys/bus/hid/drivers/hid-multitouch/unbind
> >
> >         2. echo –n “0018:04F3:0732:0001” >
> > /sys/bus/i2c/drivers/i2c_hid/unbind
> >           bash: echo: write error: No such device
> 
> In case it helps, here's [1] our firmware updater code for rebinding the device.
> I don't know off the top of my head what type of device path it takes.
> However...
> 
> >         3. reboot
> 
> Rebooting should definitely rebind the device. If you're not seeing your
> firmware changes after that, there's something wrong with your firmware
> update process, not the rebinding.
> 
> Hope this helps.
> 
> Harry Cutts
> Chrome OS Touch/Input
> 
> [0]:
> https://groups.google.com/a/chromium.org/forum/#!topic/chromium-os-dev/
> KVEKir0zUgo
> [1]:
> https://chromium.googlesource.com/chromiumos/platform/touch_updater/+/
> fe4bdeb94734c092ee16dc9ff90cd269da3ee9fc/scripts/chromeos-touch-comm
> on.sh#138

