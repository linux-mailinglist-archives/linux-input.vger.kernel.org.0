Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6E9C6FB1C
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 10:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbfGVIRs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 04:17:48 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33503 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbfGVIRs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 04:17:48 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so26034330lfc.0;
        Mon, 22 Jul 2019 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B3z2y6DiNEDzyCnuBCeFgib1GvCFW5U7hl89KClyMMA=;
        b=RP24Cxrb5nRAy02O/Fv+y5ZXisRkexQWPX+sc0F4THtUla8EUf7Hm8gW7/caqxHIoD
         2i26kaBu0oKA1leaT4TVpDvuy2+2PsO9rgJ08EaEGcq+X/BQnDCF7aRteV0cmmRHm1p6
         N6Lp4nDp5KUd8PKRJg+J1G7LO7PnWUTmRrS2ekwdV8z58ShVN0+B3tpwyMfwUay1q7V5
         /j2zSop2733aP5x0F+6zqasb5Z44biqAdh2Xc7jouev2q8NxdR5zQAf7eGMtpmoB72I3
         P4yFgV3Nztlp366/GM1r9UlPhUEafns78e3ZhXMsiUdMFZ5f41Hzqp7I56iQTtGMN/o7
         LJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B3z2y6DiNEDzyCnuBCeFgib1GvCFW5U7hl89KClyMMA=;
        b=Yi+H5ibffgU1Kk9DqJqB/mWOEig1KVuG4m1v5hOPQDvBnf3yqaycahhcvtfabFJb05
         uIW7XrqveeXXwOfx59Vr5IZ2tOZBbjJeFW/MGEExCgjF9akQTh0LwQh6V27wTTp5Ywd+
         QlHn/xpDibDmoUKrxlJpi/fVKnTqz1TDjNMVs42jc9sVbYNnZqXQlCfAegmJuCZh57AH
         9ce6ZjwVPW36AJ/GcyklzKihx0vLXUZO+WRFztumUBrbQSR+LMXXiwY3kj2wOMOX3kj1
         U1IHD59SVW0hVoS8Nrqo8pWMGdDmvrBaMhUlnZixGn05+I1zTNDdNdce8C7Ub3z4bu6c
         aCug==
X-Gm-Message-State: APjAAAVDdAYcjqZ4ikh/Oe6eTfaqlb5zLZ0JOIhhLuzkUJEdKZ8aL9iq
        f6n27FhovaRsyXDlL9sr2iY=
X-Google-Smtp-Source: APXvYqzPe8/XMAkrBJpupIhejmA8ZMAaQU5mUD7lT3WVR72QRpWQ0PgS7JuSTafInarUHtsMroK5RA==
X-Received: by 2002:ac2:418f:: with SMTP id z15mr29532862lfh.177.1563783465457;
        Mon, 22 Jul 2019 01:17:45 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id 63sm7491060ljs.84.2019.07.22.01.17.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 01:17:44 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:17:39 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Your Name <you@example.com>
Subject: Re: [PATCH v3] Input: elantech: Enable SMBus on new (2018+) systems
Message-ID: <20190722081739.GA804@penguin>
References: <20190121070258.1844-1-kai.heng.feng@canonical.com>
 <20190722074055.22427-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722074055.22427-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kai-Heng,

On Mon, Jul 22, 2019 at 03:40:55PM +0800, Kai-Heng Feng wrote:
> There are some new HP laptops with Elantech touchpad don't support
> multitouch.
> 
> Currently we use ETP_NEW_IC_SMBUS_HOST_NOTIFY() to check if SMBus is
> supported, but in addition to firmware version, the bus type also
> informs us if the IC can support SMBus, so also check that.
> 
> In case of breaking old ICs, only enables SMBus on systems manufactured
> after 2018, alongsides aforementioned checks.
> 
> Lastly, consolidats all check into elantech_use_host_notify() and use it
> to determine whether to use PS/2 or SMBus.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Your Name <you@example.com>

I do not think "Your Name" should be signing DCO here :)

> +static bool elantech_use_host_notify(struct psmouse *psmouse,
> +				     struct elantech_device_info *info)
> +{
> +	bool host_notify = false;
> +
> +	if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
> +		host_notify = true;
> +	else {
> +		switch (info->bus) {
> +		case ETP_BUS_PS2_ONLY:
> +			/* expected case */
> +			break;
> +		case ETP_BUS_SMB_ALERT_ONLY:
> +			/* fall-through  */
> +		case ETP_BUS_PS2_SMB_ALERT:
> +			psmouse_dbg(psmouse, "Ignoring SMBus provider through alert protocol.\n");
> +			break;
> +		case ETP_BUS_SMB_HST_NTFY_ONLY:
> +			/* fall-through  */
> +		case ETP_BUS_PS2_SMB_HST_NTFY:
> +			/* SMbus implementation is stable since 2018 */
> +			if (dmi_get_bios_year() >= 2018)
> +				host_notify = true;
> +			break;
> +		default:
> +			psmouse_dbg(psmouse,
> +				    "Ignoring SMBus bus provider %d.\n",
> +				    info->bus);
> +		}
> +	}

I think this is way too verbose. How about a bit more condensed form:


Input: elantech - enable SMBus on new (2018+) systems

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

There are some new HP laptops with Elantech touchpad that don't support
multitouch.

Currently we use ETP_NEW_IC_SMBUS_HOST_NOTIFY() to check if SMBus is supported,
but in addition to firmware version, the bus type also informs us whether the IC
can support SMBus. To avoid breaking old ICs, we will only enable SMbus support
based the bus type on systems manufactured after 2018.

Lastly, let's consolidate all checks into elantech_use_host_notify() and use it
to determine whether to use PS/2 or SMBus.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/elantech.c |   54 +++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..73544776a9ed 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1827,6 +1827,30 @@ static int elantech_create_smbus(struct psmouse *psmouse,
 				  leave_breadcrumbs);
 }
 
+static bool elantech_use_host_notify(struct psmouse *psmouse,
+				     struct elantech_device_info *info)
+{
+	if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
+		return true;
+
+	switch (info->bus) {
+	case ETP_BUS_PS2_ONLY:
+		/* expected case */
+		break;
+	case ETP_BUS_SMB_HST_NTFY_ONLY:
+	case ETP_BUS_PS2_SMB_HST_NTFY:
+		/* SMbus implementation is stable since 2018 */
+		if (dmi_get_bios_year() >= 2018)
+			return true;
+	default:
+		psmouse_dbg(psmouse,
+			    "Ignoring SMBus bus provider %d\n", info->bus);
+		break;
+	}
+
+	return false;
+}
+
 /**
  * elantech_setup_smbus - called once the PS/2 devices are enumerated
  * and decides to instantiate a SMBus InterTouch device.
@@ -1846,7 +1870,7 @@ static int elantech_setup_smbus(struct psmouse *psmouse,
 		 * i2c_blacklist_pnp_ids.
 		 * Old ICs are up to the user to decide.
 		 */
-		if (!ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version) ||
+		if (!elantech_use_host_notify(psmouse, info) ||
 		    psmouse_matches_pnp_id(psmouse, i2c_blacklist_pnp_ids))
 			return -ENXIO;
 	}
@@ -1866,34 +1890,6 @@ static int elantech_setup_smbus(struct psmouse *psmouse,
 	return 0;
 }
 
-static bool elantech_use_host_notify(struct psmouse *psmouse,
-				     struct elantech_device_info *info)
-{
-	if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
-		return true;
-
-	switch (info->bus) {
-	case ETP_BUS_PS2_ONLY:
-		/* expected case */
-		break;
-	case ETP_BUS_SMB_ALERT_ONLY:
-		/* fall-through  */
-	case ETP_BUS_PS2_SMB_ALERT:
-		psmouse_dbg(psmouse, "Ignoring SMBus provider through alert protocol.\n");
-		break;
-	case ETP_BUS_SMB_HST_NTFY_ONLY:
-		/* fall-through  */
-	case ETP_BUS_PS2_SMB_HST_NTFY:
-		return true;
-	default:
-		psmouse_dbg(psmouse,
-			    "Ignoring SMBus bus provider %d.\n",
-			    info->bus);
-	}
-
-	return false;
-}
-
 int elantech_init_smbus(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;

Thanks.

-- 
Dmitry
