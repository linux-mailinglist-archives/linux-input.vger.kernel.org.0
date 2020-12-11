Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77022D6E2B
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 03:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391849AbgLKCjd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 21:39:33 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:14789 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391838AbgLKCjY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 21:39:24 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="38544290"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 11 Dec 2020 10:38:25 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(127523:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 11 Dec 2020 10:38:24 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(106420:1:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 11 Dec 2020 10:38:22 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <phoenix@emc.com.tw>, <josh.chen@emc.com.tw>,
        <dave.wang@emc.com.tw>
References: <20201207090751.9076-1-jingle.wu@emc.com.tw> <X9G8xUk/QvcxsNWi@google.com>
In-Reply-To: <X9G8xUk/QvcxsNWi@google.com>
Subject: RE: [PATCH 1/2] Input: elan_i2c - Add new trackpoint report type 0x5F.
Date:   Fri, 11 Dec 2020 10:38:22 +0800
Message-ID: <004b01d6cf66$b1a8c590$14fa50b0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJnCFa5POgkA0Msoaon23+TYxT29AGcL9WIqMPaTJA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1lZjJlZjI0ZS0zYjU5LTExZWItYjhhNy1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcZWYyZWYyNTAtM2I1OS0xMWViLWI4YTctZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIyOTY1IiB0PSIxMzI1MjEyNzkwMjYwNDc1MzUiIGg9InhhdkI0WEp6QWF6V2lEc2xuY3oyZy80VDRGST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI Dmitry:

I would prefer if we validated report length versus the packet type before
accepting it.

-> If the tracking point report is 0x5F, the report length is 7, but the
touchpad report length is 32.
-> So, report length will be different with this module.

THANKS
JINGLE


-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Thursday, December 10, 2020 2:14 PM
To: jingle.wu
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org;
phoenix@emc.com.tw; josh.chen@emc.com.tw; dave.wang@emc.com.tw
Subject: Re: [PATCH 1/2] Input: elan_i2c - Add new trackpoint report type
0x5F.

Hi Jingle,

On Mon, Dec 07, 2020 at 05:07:51PM +0800, jingle.wu wrote:
> The 0x5F is new trackpoint report type of some module.
> 
> Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c_core.c  | 2 ++  
> drivers/input/mouse/elan_i2c_smbus.c | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c 
> b/drivers/input/mouse/elan_i2c_core.c
> index 61ed3f5ca219..8f0c4663167c 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -52,6 +52,7 @@
>  #define ETP_REPORT_ID		0x5D
>  #define ETP_REPORT_ID2		0x60	/* High precision report */
>  #define ETP_TP_REPORT_ID	0x5E
> +#define ETP_TP_REPORT_ID2	0x5F
>  #define ETP_REPORT_ID_OFFSET	2
>  #define ETP_TOUCH_INFO_OFFSET	3
>  #define ETP_FINGER_DATA_OFFSET	4

I think we might need to move this into elan_i2c.h so that we can reference
it from elan_i2c_smbus.c.

> @@ -1076,6 +1077,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
>  		elan_report_absolute(data, report, true);
>  		break;
>  	case ETP_TP_REPORT_ID:
> +	case ETP_TP_REPORT_ID2:
>  		elan_report_trackpoint(data, report);
>  		break;
>  	default:
> diff --git a/drivers/input/mouse/elan_i2c_smbus.c 
> b/drivers/input/mouse/elan_i2c_smbus.c
> index 1820f1cfc1dc..1226d47ec3cf 100644
> --- a/drivers/input/mouse/elan_i2c_smbus.c
> +++ b/drivers/input/mouse/elan_i2c_smbus.c
> @@ -45,6 +45,7 @@
>  #define ETP_SMBUS_CALIBRATE_QUERY	0xC5
>  
>  #define ETP_SMBUS_REPORT_LEN		32
> +#define ETP_SMBUS_REPORT_LEN2		7
>  #define ETP_SMBUS_REPORT_OFFSET		2
>  #define ETP_SMBUS_HELLOPACKET_LEN	5
>  #define ETP_SMBUS_IAP_PASSWORD		0x1234
> @@ -497,7 +498,7 @@ static int elan_smbus_get_report(struct i2c_client
*client,
>  		return len;
>  	}
>  
> -	if (len != ETP_SMBUS_REPORT_LEN) {
> +	if ((len != ETP_SMBUS_REPORT_LEN) && (len != ETP_SMBUS_REPORT_LEN2))

> +{

I would prefer if we validated report length versus the packet type before
accepting it.

>  		dev_err(&client->dev,
>  			"wrong report length (%d vs %d expected)\n",
>  			len, ETP_SMBUS_REPORT_LEN);
> --
> 2.17.1
> 

Thanks.

-- 
Dmitry

