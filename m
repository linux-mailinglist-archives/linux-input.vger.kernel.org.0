Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F5032B4D2
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446896AbhCCF3e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 3 Mar 2021 00:29:34 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:50072 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244992AbhCCDOy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 22:14:54 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="39618795"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 03 Mar 2021 11:13:26 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2838:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Wed, 03 Mar 2021 11:13:24 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2473:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Wed, 03 Mar 2021 11:13:21 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     =?iso-8859-1?Q?'Uwe_Kleine-K=F6nig'?= 
        <u.kleine-koenig@pengutronix.de>,
        "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        <kernel@pengutronix.de>
Cc:     <linux-input@vger.kernel.org>
References: <20210302210934.iro3a6chigx72r4n@pengutronix.de>
In-Reply-To: <20210302210934.iro3a6chigx72r4n@pengutronix.de>
Subject: RE: elan_i2c: failed to read report data: -71
Date:   Wed, 3 Mar 2021 11:13:21 +0800
Message-ID: <016d01d70fdb$2aa48b00$7feda100$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFWM07JFvN31vfpaJNtqdEvnTXapqtzT1rw
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy02ODM1NDM0Ny03YmNlLTExZWItOGUwZi1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcNjgzNTQzNDktN2JjZS0xMWViLThlMGYtZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIzMDI1IiB0PSIxMzI1OTIxNDgwMTY4ODg2MTUiIGg9IjVqeGRZS2xKZDNDeWU1RHhoVmt6eFRQWU9ncz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI uwe:

Please updates this patchs.

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=nex
t&id=056115daede8d01f71732bc7d778fb85acee8eb6

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=nex
t&id=e4c9062717feda88900b566463228d1c4910af6d

Thanks
jingle

-----Original Message-----
From: Uwe Kleine-König [mailto:u.kleine-koenig@pengutronix.de] 
Sent: Wednesday, March 03, 2021 5:10 AM
To: Jingle Wu; Dmitry Torokhov; kernel@pengutronix.de
Cc: linux-input@vger.kernel.org
Subject: elan_i2c: failed to read report data: -71

Hello,

I just installed Linux on a new Thinkpad E15 and I experience a non-working
touchpad. I can move the mouse just fine, but when I press one of the three
buttons or move the trackpoint the kernel log gets flooded with:

	elan_i2c 0-0015: failed to read report data: -71

and nothing happens in the GUI.

This is a kernel from Debian testing, i.e. 5.10.13, during probe of the
device the following is reported:

	elan_i2c 0-0015: supply vcc not found, using dummy regulator
	elan_i2c 0-0015: Elan Touchpad: Module ID: 0x000e, Firmware: 0x0001,
Sample: 0x0000, IAP: 0x0000
	input: Elan Touchpad as
/devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/input/input21
	input: Elan TrackPoint as
/devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/input/input22

I backported commits

	056115daede8 Input: elan_i2c - add new trackpoint report type 0x5F
	c7f0169e3bd2 Input: elan_i2c_core - move header inclusion inside

to this kernel, but this didn't help.

When enabling smbus tracing the matching events are:

 irq/159-elan_i2-2207    [003] ....   963.625641: smbus_read: i2c-0 a=015
f=0040 c=a8 BLOCK_DATA
 irq/159-elan_i2-2207    [003] ....   963.629247: smbus_result: i2c-0 a=015
f=0000 c=a8 BLOCK_DATA rd res=-71

The relevant code is:

        len = i2c_smbus_read_block_data(client,
                                        ETP_SMBUS_PACKET_QUERY,
                                        &report[ETP_SMBUS_REPORT_OFFSET]);
        if (len < 0) {
                dev_err(&client->dev, "failed to read report data: %d\n",
len);
                return len;
        }

I think the failing location in the i2c driver is

        if (read_write == I2C_SMBUS_READ ||
            command == I2C_SMBUS_BLOCK_PROC_CALL) {
                len = inb_p(SMBHSTDAT0(priv));
                if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
                        return -EPROTO;

                data->block[0] = len;
                for (i = 0; i < len; i++)
                        data->block[i + 1] = inb_p(SMBBLKDAT(priv));
        }

in i801_block_transaction_by_block().

Does this ring a bell? Does someone know if there is documentation
available?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

