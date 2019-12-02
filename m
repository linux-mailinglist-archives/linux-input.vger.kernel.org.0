Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B71B10E4CA
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 04:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbfLBDHe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Dec 2019 22:07:34 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:63103 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbfLBDHe (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Sun, 1 Dec 2019 22:07:34 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33103634"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 02 Dec 2019 11:07:29 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71494:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 02 Dec 2019 11:07:28 +0800 (CST)
Received: from 192.168.33.57
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(101175:1:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 02 Dec 2019 11:07:26 +0800 (CST)
From:   "Dave.Wang" <dave.wang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <Linux-kernel@vger.kernel.org>, <Linux-input@vger.kernel.org>,
        <jingle.wu@emc.com.tw>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>
References: <001e01d5a368$24946950$6dbd3bf0$@emc.com.tw> <20191202010253.GO248138@dtor-ws>
In-Reply-To: <20191202010253.GO248138@dtor-ws>
Subject: RE: [PATCH] Input: elan_i2c - Add more hardware ID for Lenovo laptop
Date:   Mon, 2 Dec 2019 11:07:26 +0800
Message-ID: <000201d5a8bd$9fead3f0$dfc07bd0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQI6+YXXx3QKDBXF90Pih5gjJN6pWADF47uwptVVUQA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYxMjlcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1kZDUyOGFlOS0xNGIwLTExZWEtYWExNy04OGQ3ZjY1NjczMzBcYW1lLXRlc3RcZGQ1MjhhZWEtMTRiMC0xMWVhLWFhMTctODhkN2Y2NTY3MzMwYm9keS50eHQiIHN6PSIyNTgxIiB0PSIxMzIxOTcyOTY0NTg0ODcyNjAiIGg9ImNJU2RhQ3h3ajlmTWVLQWNKa1BqaEFaWkNZbz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

List device with its corresponding hardware ID as below patch,
Please check , thanks!

Add more hardware ID for Lenovo laptop.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 include/linux/input/elan-i2c-ids.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/input/elan-i2c-ids.h
b/include/linux/input/elan-i2c-ids.h
index 1ecb6b45812c..520858d12680 100644
--- a/include/linux/input/elan-i2c-ids.h
+++ b/include/linux/input/elan-i2c-ids.h
@@ -67,8 +67,15 @@ static const struct acpi_device_id elan_acpi_id[] = {
 	{ "ELAN062B", 0 },
 	{ "ELAN062C", 0 },
 	{ "ELAN062D", 0 },
+	{ "ELAN062E", 0 }, /* Lenovo V340 Whiskey Lake U */
+	{ "ELAN062F", 0 }, /* Lenovo V340 Comet Lake U */
 	{ "ELAN0631", 0 },
 	{ "ELAN0632", 0 },
+	{ "ELAN0633", 0 }, /* Lenovo S145 */
+	{ "ELAN0634", 0 }, /* Lenovo V340 Ice lake */
+	{ "ELAN0635", 0 }, /* Lenovo V1415-IIL */
+	{ "ELAN0636", 0 }, /* Lenovo V1415-Dali */
+	{ "ELAN0637", 0 }, /* Lenovo V1415-IGLR */
 	{ "ELAN1000", 0 },
 	{ }
 };
-- 
2.17.1

Best regards,
Dave

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Monday, December 2, 2019 9:03 AM
To: Dave.Wang <dave.wang@emc.com.tw>
Cc: Linux-kernel@vger.kernel.org; Linux-input@vger.kernel.org;
jingle.wu@emc.com.tw; Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] Input: elan_i2c - Add more hardware ID for Lenovo
laptop

Hi Dave,

On Mon, Nov 25, 2019 at 04:12:56PM +0800, Dave.Wang wrote:
> Add more hardware ID for Lenovo laptop.

Any chance you could also list what devices use which hardware ID?

Thanks!

> 
> Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
> ---
>  include/linux/input/elan-i2c-ids.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/input/elan-i2c-ids.h
> b/include/linux/input/elan-i2c-ids.h
> index 1ecb6b45812c..247e3f75bae7 100644
> --- a/include/linux/input/elan-i2c-ids.h
> +++ b/include/linux/input/elan-i2c-ids.h
> @@ -67,8 +67,15 @@ static const struct acpi_device_id elan_acpi_id[] = {
>  	{ "ELAN062B", 0 },
>  	{ "ELAN062C", 0 },
>  	{ "ELAN062D", 0 },
> +	{ "ELAN062E", 0 },
> +	{ "ELAN062F", 0 },
>  	{ "ELAN0631", 0 },
>  	{ "ELAN0632", 0 },
> +	{ "ELAN0633", 0 },
> +	{ "ELAN0634", 0 },
> +	{ "ELAN0635", 0 },
> +	{ "ELAN0636", 0 },
> +	{ "ELAN0637", 0 },
>  	{ "ELAN1000", 0 },
>  	{ }
>  };
> -- 
> 2.17.1
> 

-- 
Dmitry

