Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1D84860CE
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 08:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbiAFHAy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 02:00:54 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:12044 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbiAFHAx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jan 2022 02:00:53 -0500
X-Greylist: delayed 592 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jan 2022 02:00:53 EST
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="44199672"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 06 Jan 2022 14:51:00 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(7893:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 06 Jan 2022 14:50:57 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(30593:2:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 06 Jan 2022 14:50:54 +0800 (CST)
From:   "Jingle.Wu" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Hans de Goede'" <hdegoede@redhat.com>
Cc:     <linux-input@vger.kernel.org>
References: <20211222220641.439863-1-hdegoede@redhat.com> <YdOVBVUVWnVkaLTZ@google.com>
In-Reply-To: <YdOVBVUVWnVkaLTZ@google.com>
Subject: RE: [PATCH] Input: elan_i2c - Fix regulator enable count imbalance after suspend/resume
Date:   Thu, 6 Jan 2022 14:50:54 +0800
Message-ID: <000b01d802c9$c0396aa0$40ac3fe0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHNJmQt3Ok8SkTCoXTPqGkdUjpfMQIqttknrFnwu7A=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1mZGE3NzY2Ny02ZWJjLTExZWMtYTg1Mi1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcZmRhNzc2NjktNmViYy0xMWVjLWE4NTItZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIzMDI2IiB0PSIxMzI4NTkyNTQ1NDAxNjAyMzEiIGg9ImJLODRXWHhDcDdCMUwwa1ZiaGxISVIyeUVvST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans/Dmitry:

It is not OK to skip elan_enable_power() for all Elan touchpad controllers.

I suggest to deal with this touchpad module ID as "quirk" case to support
this special case.

Thanks
Jingle

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Tuesday, January 4, 2022 8:30 AM
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jingle Wu <jingle.wu@emc.com.tw>; linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: elan_i2c - Fix regulator enable count imbalance
after suspend/resume

Hi Hans,

On Wed, Dec 22, 2021 at 11:06:41PM +0100, Hans de Goede wrote:
> Before these changes elan_suspend() would only call 
> elan_disable_power() when device_may_wakeup() returns false; whereas 
> elan_resume() would unconditionally call elan_enable_power(), leading 
> to an enable count imbalance when device_may_wakeup() returns true.
> 
> This triggers the "WARN_ON(regulator->enable_count)" in 
> regulator_put() when the elan_i2c driver gets unbound, this happens 
> e.g. with the hot-plugable dock with Elan I2C touchpad for the Asus TF103C
2-in-1.
> 
> Fix this by making the elan_enable_power() call also be conditional on 
> device_may_wakeup() returning false.

elan_enable_power() not only tries to toggle the regulator, but also tries
to issue command to the controller to power/wake it up. I need confirmation
from Jingle Wu that skipping this is OK for all Elan touchpad controllers,
or if we need to add call to either power control or sleep control method to
make sure the controller it fully resumed.

Jingle, what can you tell us here?

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c 
> b/drivers/input/mouse/elan_i2c_core.c
> index 47af62c12267..cdb36d35ffa4 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1412,17 +1412,17 @@ static int __maybe_unused elan_resume(struct
device *dev)
>  	struct elan_tp_data *data = i2c_get_clientdata(client);
>  	int error;
>  
> -	if (device_may_wakeup(dev) && data->irq_wake) {
> +	if (!device_may_wakeup(dev)) {
> +		error = elan_enable_power(data);
> +		if (error) {
> +			dev_err(dev, "power up when resuming failed: %d\n",
error);
> +			goto err;
> +		}
> +	} else if (data->irq_wake) {
>  		disable_irq_wake(client->irq);
>  		data->irq_wake = false;
>  	}
>  
> -	error = elan_enable_power(data);
> -	if (error) {
> -		dev_err(dev, "power up when resuming failed: %d\n", error);
> -		goto err;
> -	}
> -
>  	error = elan_initialize(data, data->quirks &
ETP_QUIRK_QUICK_WAKEUP);
>  	if (error)
>  		dev_err(dev, "initialize when resuming failed: %d\n",
error);
> --
> 2.33.1
> 

Thanks.

-- 
Dmitry

