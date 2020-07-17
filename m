Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393B32236E6
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 10:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgGQIUV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 04:20:21 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:49906 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgGQIUU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 04:20:20 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36477954"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 17 Jul 2020 16:20:19 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(78053:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 17 Jul 2020 16:20:16 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2481:1:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 17 Jul 2020 16:20:16 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     "'linux-kernel'" <linux-kernel@vger.kernel.org>,
        "'linux-input'" <linux-input@vger.kernel.org>,
        "'phoenix'" <phoenix@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>,
        "'kai.heng.feng'" <kai.heng.feng@canonical.com>
References: <20200714105641.15151-1-jingle.wu@emc.com.tw> <20200716053912.GB1665100@dtor-ws> <1594880123.69588.jingle.wu@emc.com.tw> <20200717012719.GC1665100@dtor-ws> <20200717061010.GD1665100@dtor-ws>
In-Reply-To: <20200717061010.GD1665100@dtor-ws>
Subject: RE: [PATCH 2/2] Input: elan_i2c - Modify the IAP related functio n for page sizes 128, 512 bytes.
Date:   Fri, 17 Jul 2020 16:20:16 +0800
Message-ID: <002b01d65c13$1a19f0d0$4e4dd270$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIjNBmL5Bem/gD5U/Wevzos9rHsvgFMELwpAblpFq8B/K6BpwFpUkutqD5gC9A=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy01N2EwNTFhZC1jODA2LTExZWEtODE5YS1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcNTdhMDUxYWYtYzgwNi0xMWVhLTgxOWEtZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIyNTE2IiB0PSIxMzIzOTQ0NzYxNjM4NjA4NzciIGg9IlIyNWphZVB5ZHhSbDdFeUU4N29pcE1PbUt6Yz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry:

In this "static int elan_i2c_prepare_fw_update(struct i2c_client *client,
u16 ic_type, u8 iap_version)" function
If IC is old_pattern, it must be modified to iap_version
	-> u16 type = pattern >= 0x01 ? ic_type : iap_version;

Thanks

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Friday, July 17, 2020 2:10 PM
To: jingle.wu
Cc: linux-kernel; linux-input; phoenix; josh.chen; kai.heng.feng
Subject: Re: [PATCH 2/2] Input: elan_i2c - Modify the IAP related functio n
for page sizes 128, 512 bytes.

On Thu, Jul 16, 2020 at 06:27:19PM -0700, Dmitry Torokhov wrote:
> Hi Jingle,
> 
> On Thu, Jul 16, 2020 at 02:15:23PM +0800, jingle.wu wrote:
> > HI Dmitry:
> > 
> > Just to confirm, the older devices (I assume that pattern 0 means 
> > older)  have version command that is numerically higher than the one 
> > for the  newer (pattern >= 1) devices?
> > 
> > >> Yes, Pattern 1, 2 are newer devices.
> > 
> > > @@ -324,7 +342,14 @@ static int elan_i2c_get_sm_version(struct
i2c_client *client,
> > >  			return error;
> > >  		}
> > >  		*version = val[0];
> > > -		*ic_type = val[1];
> > > +
> > > +		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD,
val);
> > > +		if (error) {
> > > +			dev_err(&client->dev, "failed to get ic type: %d\n",
> > > +				error);
> > > +			return error;
> > > +		}
> > 
> > Could you please tell me why this chunk is needed?
> > >> Modify the old pattern IC firmware read the correct ic_type.
> > 
> > In the elan_i2c_core.c, move this code to elan_i2c_i2c.c. 
> > static int elan_query_device_info(struct elan_tp_data *data) {
> > 	.....
> > 	if (data->pattern == 0x01)
> > 		ic_type = data->ic_type;
> > 	else
> > 		ic_type = data->iap_version;
> > 	.....
> > 	return 0;
> > }
> 
> I am concerned that unconditionally substituting iap_version for 
> ic_type for "pattern 0" devices will break check in
> elan_check_ASUS_special_fw() as it operates on the ic_type returned by 
> ETP_I2C_OSM_VERSION_CMD and not iap_version.

I split the firmware handling code into a few patches and uploaded it to a
new elan-i2c branch:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git elan-i2c

Please take a look and let me know if I messed it up or not. I will be
looking at the new packet format next.

Thanks.

--
Dmitry

