Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E450A4065A3
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 04:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhIJCTY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Sep 2021 22:19:24 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:55756 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhIJCTY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Sep 2021 22:19:24 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="42672476"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 10 Sep 2021 10:18:12 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(17051:0:AUTH_RELAY)
        (envelope-from <phoenix@emc.com.tw>); Fri, 10 Sep 2021 10:18:10 +0800 (CST)
Received: from 192.168.33.13
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2475:0:AUTH_LOGIN)
        (envelope-from <phoenix@emc.com.tw>); Fri, 10 Sep 2021 10:18:08 +0800 (CST)
From:   "phoenix" <phoenix@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <jingle.wu@emc.com.tw>, <josh.chen@emc.com.tw>,
        <dave.wang@emc.com.tw>
References: <20210729010940.5752-1-phoenix@emc.com.tw> <000001d79d99$53762dd0$fa628970$@emc.com.tw> <YS0+TU21/nok6Ge9@google.com>
In-Reply-To: <YS0+TU21/nok6Ge9@google.com>
Subject: RE: [PATCH] Input: elantench - Fix the firmware misreport coordinates for trackpoint occasionally.
Date:   Fri, 10 Sep 2021 10:18:08 +0800
Message-ID: <005101d7a5ea$18e01d30$4aa05790$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGk7tjGsgsB1mM/H5Ov4MUFApOKzQImMkU5AJ1HjHOr3I7dkA==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcODgwNTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy01NWZjYmI0OC0xMWRkLTExZWMtYTkyNS04OGQ3ZjY1ODJkZmNcYW1lLXRlc3RcNTVmY2JiNDktMTFkZC0xMWVjLWE5MjUtODhkN2Y2NTgyZGZjYm9keS50eHQiIHN6PSIyODM4IiB0PSIxMzI3NTcxMzg4ODA0ODgyMDciIGg9IkU4akNpY1dBdzF4R0pOU0VZU0NPQmZsNVFBUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmity,

Sorry for late reply.
> +		if (packet[4] == 0x80 || packet[5] == 0x80 ||
> +		    packet[1] >> 7 == packet[4] >> 7 ||
"I think this will reject X coordinates in range [0, 127]. Is this really
what is needed? What kind of patterns are you observing when firmware
misreports coordinates?"
this will reject X in range [128, 256] and [-128, -256]. This patch prevent
cursor suddenly jump to screen edge or corner.
The patterns we observing as below:
1. x (packet[4]) or y (packet[5]) is 0x80, ex: [xx xx xx xx 80 80]
2. ~x sign bit is same as MSB(most significant bit) of x, ex: [30 00 00 06
00 00] 
3. ~y sign bit is same as MSB of y, ex: [30 00 00 06 fa 00]

Best regards,
Phoenix Huang
-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Tuesday, August 31, 2021 4:24 AM
To: phoenix <phoenix@emc.com.tw>
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org;
jingle.wu@emc.com.tw; josh.chen@emc.com.tw; dave.wang@emc.com.tw
Subject: Re: [PATCH] Input: elantench - Fix the firmware misreport
coordinates for trackpoint occasionally.

Hi Phoenix,

On Mon, Aug 30, 2021 at 08:19:48PM +0800, phoenix wrote:
> Hi Dmitry,
> 
> Would you review this patch, thanks
> 
> Best regards,
> Phoenix Huang
> 
> -----Original Message-----
> From: Phoenix Huang [mailto:phoenix@emc.com.tw]
> Sent: Thursday, July 29, 2021 9:10 AM
> To: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; 
> dmitry.torokhov@gmail.com
> Cc: jingle.wu@emc.com.tw; josh.chen@emc.com.tw; dave.wang@emc.com.tw; 
> Phoenix Huang <phoenix@emc.com.tw>
> Subject: [PATCH] Input: elantench - Fix the firmware misreport 
> coordinates for trackpoint occasionally.
> 
> Signed-off-by: Phoenix Huang <phoenix@emc.com.tw>
> ---
>  drivers/input/mouse/elantech.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/input/mouse/elantech.c 
> b/drivers/input/mouse/elantech.c index 2d0bc029619f..07e1098f2d31 
> 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -517,6 +517,17 @@ static void elantech_report_trackpoint(struct 
> psmouse *psmouse,
>  	case 0x16008020U:
>  	case 0x26800010U:
>  	case 0x36808000U:
> +	
> +		/* This firmware misreport coordinates for trackpoint
> occasionally.
> +		* So we discard these packets by pattern to prevent cursor
> jumps.
> +		*/
> +		if (packet[4] == 0x80 || packet[5] == 0x80 ||
> +		    packet[1] >> 7 == packet[4] >> 7 ||

I think this will reject X coordinates in range [0, 127]. Is this really
what is needed? What kind of patterns are you observing when firmware
misreports coordinates?

Thanks.

--
Dmitry

