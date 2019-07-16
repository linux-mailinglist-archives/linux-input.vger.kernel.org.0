Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78CBC6A66B
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 12:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733098AbfGPKXn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 16 Jul 2019 06:23:43 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:51442 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733086AbfGPKXn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 06:23:43 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="31383268"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 16 Jul 2019 18:23:41 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(128577:0:AUTH_RELAY)
        (envelope-from <scott.liu@emc.com.tw>); Tue, 16 Jul 2019 18:23:39 +0800 (CST)
Received: from 192.168.135.106
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(122360:0:AUTH_RELAY)
        (envelope-from <scott.liu@emc.com.tw>); Tue, 16 Jul 2019 18:23:38 +0800 (CST)
From:   =?big5?B?vEK5xcJA?= <scott.liu@emc.com.tw>
To:     <linux-input@vger.kernel.org>
Cc:     <benjamin.tissoires@gmail.com>
Subject: force re-enumeration i2c_hid device?
Date:   Tue, 16 Jul 2019 18:23:38 +0800
Message-ID: <00ab01d53bc0$8824a440$986decc0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="big5"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdU7wIDp7tP+MlIxQEGcIu3SaKqauA==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDAwMzVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jNWI0MjljMC1hN2IzLTExZTktODc2Ni1jODljZGNkMjU5ZTlcYW1lLXRlc3RcYzViNDI5YzItYTdiMy0xMWU5LTg3NjYtYzg5Y2RjZDI1OWU5Ym9keS50eHQiIHN6PSI4NTciIHQ9IjEzMjA3NzQ2MjE3OTcyNDA4MCIgaD0iNFhRdDI0c1VackExUzdOclFkbTBuYVhoZ1ZvPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, 
        I have a touchscreen device with i2c-hid interface on Chromium os.
        I am trying to re-enumerate after update firmware. 
        The firmware was changed some:
                a. dimensions in report descriptor (LOCAL_X, Y)
                b. VID/PID in device descriptor
        The dimensions and VID/PID are stayed old information after trying
follow commands.
        
        I already tried below:
        1. echo ¡Vn ¡§0018:04F3:0732:0001¡¨ >
/sys/bus/hid/drivers/hid-multitouch/unbind
        
        2. echo ¡Vn ¡§0018:04F3:0732:0001¡¨ >
/sys/bus/i2c/drivers/i2c_hid/unbind
          bash: echo: write error: No such device
        3. reboot

        Can someone know how to force re-enumerate i2c_hid device? 
        Thanks!

BR,
Scott


