Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD1E2EF130
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 12:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbhAHLYR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 06:24:17 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51475 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbhAHLYR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 06:24:17 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B07511BF207;
        Fri,  8 Jan 2021 11:23:35 +0000 (UTC)
Message-ID: <c680fafd0d67bdca6ee114e542a0af99828acb83.camel@hadess.net>
Subject: Logitech M705 mouse not disappearing when turned off
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
Date:   Fri, 08 Jan 2021 12:23:35 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey,

I have recently bought a Logitech Marathon Mouse/Performance Plus M705,
and I ended up with 2 power_supply class batteries for it when it was
turned off already when using kernel 5.9.13.

Using a newer kernel (5.11-rc2), the power_supply class device doesn't
disappear either:
P: /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.2/0003:046D:C52B.0005/0003:046D:406D.0008/power_supply/hidpp_battery_2
L: 0
E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.2/0003:046D:C52B.0005/0003:046D:406D.0008/power_supply/hidpp_battery_2
E: SUBSYSTEM=power_supply
E: POWER_SUPPLY_NAME=hidpp_battery_2
E: POWER_SUPPLY_TYPE=Battery
E: POWER_SUPPLY_ONLINE=0
E: POWER_SUPPLY_STATUS=Unknown
E: POWER_SUPPLY_SCOPE=Device
E: POWER_SUPPLY_MODEL_NAME=Marathon Mouse/Performance Plus M705
E: POWER_SUPPLY_MANUFACTURER=Logitech
E: POWER_SUPPLY_SERIAL_NUMBER=406d-b1-4d-65-da
E: POWER_SUPPLY_CAPACITY_LEVEL=Unknown

But the "online" state changes, which upower doesn't handle at all for
device power (as opposed to system power).

Is the fact that the power_supply device doesn't disappear a known
problem? I'll look into the upower problem soon.

Cheers

