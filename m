Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DE3228E32
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 04:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731781AbgGVC3n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 22:29:43 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:64449 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731595AbgGVC3m (ORCPT
        <rfc822;Linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 22:29:42 -0400
X-Greylist: delayed 604 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Jul 2020 22:29:42 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36533943"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 22 Jul 2020 10:19:36 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(139077:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Wed, 22 Jul 2020 10:19:34 +0800 (CST)
Received: from 192.168.33.57
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2477:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Wed, 22 Jul 2020 10:19:33 +0800 (CST)
From:   "Dave.Wang" <dave.wang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <Linux-input@vger.kernel.org>, <Linux-kernel@vger.kernel.org>,
        <phoenix@emc.com.tw>, <josh.chen@emc.com.tw>,
        <jingle.wu@emc.com.tw>, <kai.heng.feng@canonical.com>
References: <20191209111107.32239-1-dave.wang@emc.com.tw> <20200721161236.GI1665100@dtor-ws>
In-Reply-To: <20200721161236.GI1665100@dtor-ws>
Subject: RE: [PATCH 1/3] Input: elan_i2c - Do no operation for elan_smbus_set_mode function
Date:   Wed, 22 Jul 2020 10:19:33 +0800
Message-ID: <002601d65fce$8a0148d0$9e03da70$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQKMobxR7qDwdRZsC9ditFT1DgHVnAJCKYzFp5RE3UA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYxMjlcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jNzQ1ODM0Mi1jYmMxLTExZWEtYWE4Yy04OGQ3ZjY1NjczMzBcYW1lLXRlc3RcYzc0NTgzNDMtY2JjMS0xMWVhLWFhOGMtODhkN2Y2NTY3MzMwYm9keS50eHQiIHN6PSIyNDMwIiB0PSIxMzIzOTg1Nzk3MzEyNzIyMzUiIGg9IjNHWVo1d1lBSHpXRHEvZk1ZN0pOb3ljV3pWTT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Dmitry,

Are there devices that do not trigger errors?
=> Yes, there exist devices that would act normally. However, our team
cannot organize the rule to recognize which devices could trigger this
command without error. 
What I sure about is that some devices would get TP no function while
triggering this command. 
Besides, ABS mode had been set in P/S2 protocol, so there is no need to set
ABS mode again in SMBUS driver. 

How do we put SMbus devices into low power mode?
=> As far as I am concerned, core.c only set the mode into ABS mode or
ENABLE_CALIBRATE mode after updating firmware. 
I don't know what or when to set SMbus devices into low power mode.

Best regards,
Dave

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Wednesday, July 22, 2020 12:13 AM
To: Dave Wang <dave.wang@emc.com.tw>
Cc: Linux-input@vger.kernel.org; Linux-kernel@vger.kernel.org;
phoenix@emc.com.tw; josh.chen@emc.com.tw; jingle.wu@emc.com.tw;
kai.heng.feng@canonical.com
Subject: Re: [PATCH 1/3] Input: elan_i2c - Do no operation for
elan_smbus_set_mode function

Hi Dave,

On Mon, Dec 09, 2019 at 06:11:07AM -0500, Dave Wang wrote:
> Some touchpads might get error while triggerring the set_mode command 
> in SMBus interface. Do no operation for elan_smbus_set_mode function.

Are there devices that do not trigger errors? How do we put SMbus devices
into low power mode?

> 
> Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c_smbus.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_smbus.c 
> b/drivers/input/mouse/elan_i2c_smbus.c
> index 8c3185d54c73..bcb9ec4a7a6b 100644
> --- a/drivers/input/mouse/elan_i2c_smbus.c
> +++ b/drivers/input/mouse/elan_i2c_smbus.c
> @@ -84,10 +84,7 @@ static int elan_smbus_initialize(struct i2c_client 
> *client)
>  
>  static int elan_smbus_set_mode(struct i2c_client *client, u8 mode)  {
> -	u8 cmd[4] = { 0x00, 0x07, 0x00, mode };
> -
> -	return i2c_smbus_write_block_data(client, ETP_SMBUS_IAP_CMD,
> -					  sizeof(cmd), cmd);
> +	return 0; /* A no-op */
>  }
>  
>  static int elan_smbus_sleep_control(struct i2c_client *client, bool 
> sleep)
> --
> 2.17.1
> 

Thanks.

--
Dmitry

