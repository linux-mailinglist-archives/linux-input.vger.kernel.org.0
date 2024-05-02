Return-Path: <linux-input+bounces-3390-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A08B9979
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2024 12:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B122128592F
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2024 10:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CE25FEF2;
	Thu,  2 May 2024 10:54:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from emcscan.emc.com.tw (emcscan.emc.com.tw [192.72.220.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B6B5F84F
	for <linux-input@vger.kernel.org>; Thu,  2 May 2024 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.72.220.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714647254; cv=none; b=JIqLI094dfPfe/CnHMozS0uTzCGW73Yg9CmFd0c4pG0UTS62jI5VFOdYbpXwjKsgfw97Kc7v557nmUj47cyU1GAb2cZOeoyGXUjI5Wzih06eZFLMDyHhBVkzaQUg7sYn2Jdip3EkJCX6yzBNoUQ/L0U4ZMMaDEEEq0X2PFuKFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714647254; c=relaxed/simple;
	bh=+GRRN+lxAgTpny0qBHzOZB5GQipSuGqI3AqbrrFpiTE=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gx4uf6I5rGyysa7fApdVH9XS+JM0jPuVoik53+8wWFumodi9T4b4hkdmJAOoBEk3Di8oiVwMKu1dFtpAmFW90jHly4GfImP8RTUkrMEQ77R6ngVMTZAjWeJr3slQWipBg+SnQ4aKuA1Y2Sa+kzlMVSCDIDq5jndaSnQFTOmI1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emc.com.tw; spf=pass smtp.mailfrom=emc.com.tw; arc=none smtp.client-ip=192.72.220.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emc.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emc.com.tw
X-IronPort-AV: E=Sophos;i="6.07,247,1708358400"; 
   d="scan'208";a="6849213"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 02 May 2024 18:52:58 +0800
Received: from 192.168.10.23
	by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(194262:0:AUTH_RELAY)
	(envelope-from <phoenix@emc.com.tw>); Thu, 02 May 2024 18:52:56 +0800 (CST)
Received: from 192.168.33.24
	by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2472:0:AUTH_RELAY)
	(envelope-from <phoenix@emc.com.tw>); Thu, 02 May 2024 18:52:54 +0800 (CST)
From: "Phoenix" <phoenix@emc.com.tw>
To: "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
	"'Jonathan Denose'" <jdenose@google.com>
Cc: "'LKML'" <linux-kernel@vger.kernel.org>,
	<linux-input@vger.kernel.org>,
	"'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>,
	"'Jeffery Miller'" <jefferymiller@google.com>,
	"'Hans de Goede'" <hdegoede@redhat.com>,
	"'Josh.Chen'" <josh.chen@emc.com.tw>,
	<jingle.wu@emc.com.tw>
References: <20240501140231.1.Ifa0e25ebf968d8f307f58d678036944141ab17e6@changeid> <ZjKV44wZWH4MBCrF@google.com>
In-Reply-To: <ZjKV44wZWH4MBCrF@google.com>
Subject: RE: [PATCH] Input: elantech - fix touchpad state on resume for Lenovo N24
Date: Thu, 2 May 2024 18:52:54 +0800
Message-ID: <003301da9c7e$e28cedb0$a7a6c910$@emc.com.tw>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNl6RFy0XqrrreO5MtCRWC09GhC+wHH6cKKrl7rqjA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXDg4MDUxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMjAxMGNhZWEtMDg3Mi0xMWVmLWE4OTAtMDhiZmI4ZDdiOWIxXGFtZS10ZXN0XDIwMTBjYWVjLTA4NzItMTFlZi1hODkwLTA4YmZiOGQ3YjliMWJvZHkudHh0IiBzej0iNTkwNiIgdD0iMTMzNTkxMjA3NzM5MjIwMzE5IiBoPSIwakp4bGxMYTlYUEhzcldsRUk4TWpJRXRyRWc9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true

Loop Josh, Jingle

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com> 
Sent: Thursday, May 2, 2024 3:20 AM
To: Jonathan Denose <jdenose@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>; linux-input@vger.kernel.org; Greg
Kroah-Hartman <gregkh@linuxfoundation.org>; Jeffery Miller
<jefferymiller@google.com>; Phoenix Huang <phoenix@emc.com.tw>; Hans de
Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Input: elantech - fix touchpad state on resume for
Lenovo N24

On Wed, May 01, 2024 at 02:02:32PM +0000, Jonathan Denose wrote:
> The Lenovo N24 on resume becomes stuck in a state where it sends 
> incorrect packets, causing elantech_packet_check_v4 to fail.
> The only way for the device to resume sending the correct packets is 
> for it to be disabled and then re-enabled.
> 
> This change adds a dmi check to trigger this behavior on resume.
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Adding a couple more folks to take a look at this...

> ---
> 
>  drivers/input/mouse/elantech.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/input/mouse/elantech.c 
> b/drivers/input/mouse/elantech.c index 4e38229404b4b..e0f3095b4227e 
> 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1476,6 +1476,23 @@ static void elantech_disconnect(struct psmouse
*psmouse)
>  	psmouse->private = NULL;
>  }
>  
> +/*
> + * Some hw_version 4 models fail to properly activate absolute mode 
> +on
> + * resume without going through disable/enable cycle.
> + */
> +static const struct dmi_system_id elantech_needs_reenable[] = { #if 
> +defined(CONFIG_DMI) && defined(CONFIG_X86)
> +	{
> +		/* Lenovo N24 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "81AF"),
> +		},
> +	},
> +#endif
> +	{ }
> +};
> +
>  /*
>   * Put the touchpad back into absolute mode when reconnecting
>   */
> @@ -1486,6 +1503,22 @@ static int elantech_reconnect(struct psmouse
*psmouse)
>  	if (elantech_detect(psmouse, 0))
>  		return -1;
>  
> +	if (dmi_check_system(elantech_needs_reenable)) {
> +		int err;
> +
> +		err = ps2_sendbyte(&psmouse->ps2dev, PSMOUSE_CMD_DISABLE,
NULL);
> +
> +		if (err)
> +			psmouse_warn(psmouse, "Failed to deactivate mouse on
%s: %d\n",
> +					psmouse->ps2dev.serio->phys, err);
> +
> +		err = ps2_sendbyte(&psmouse->ps2dev, PSMOUSE_CMD_ENABLE,
NULL);
> +
> +		if (err)
> +			psmouse_warn(psmouse, "Failed to reactivate mouse on
%s: %d\n",
> +					psmouse->ps2dev.serio->phys, err);
> +	}
> +
>  	if (elantech_set_absolute_mode(psmouse)) {
>  		psmouse_err(psmouse,
>  			    "failed to put touchpad back into absolute
mode.\n");
> --
> 2.45.0.rc0.197.gbae5840b3b-goog
> 

-- 
Dmitry


