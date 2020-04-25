Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7780D1B86AD
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 15:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgDYNBy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 09:01:54 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44629 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgDYNBy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 09:01:54 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E9400240006;
        Sat, 25 Apr 2020 13:01:49 +0000 (UTC)
Message-ID: <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
Subject: Re: [PATCH v11 00/11] HID: nintendo
From:   Bastien Nocera <hadess@hadess.net>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com
Date:   Sat, 25 Apr 2020 15:01:49 +0200
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Daniel,

On Mon, 2020-03-16 at 22:29 -0500, Daniel J. Ogorchock wrote:
> I removed the IMU patch for now, since I have some more work on it to
> do
> before it's ready. This version fixes a bug with joy-con S-trigger
> configuration and switches the pro controller's Dpad input to a hat.

I don't have a Nintendo Switch Pro controller, but I recently got an
8Bitdo "GBros" adapter along with a third-party GameCube adapter for
less than 20€, and tried out the "Switch" mode against your driver.

When plugging it in via USB:
[  593.228423] input: Nintendo Co., Ltd. Pro Controller as /devices/pci0000:00/0000:00:14.0/usb3/3-1/3-1:1.0/0003:057E:2009.0007/input/input34
[  593.229859] hid-generic 0003:057E:2009.0007: input,hidraw4: USB HID v1.11 Joystick [Nintendo Co., Ltd. Pro Controller] on usb-0000:00:14.0-1/input0
[  593.317011] nintendo 0003:057E:2009.0007: hidraw4: USB HID v81.11 Joystick [Nintendo Co., Ltd. Pro Controller] on usb-0000:00:14.0-1/input0
[  595.476014] nintendo 0003:057E:2009.0007: Failed to set baudrate; ret=-110
[  595.485961] nintendo 0003:057E:2009.0007: probe - fail = -110
[  595.486019] nintendo: probe of 0003:057E:2009.0007 failed with error -110

After pairing it with Bluetooth:
[ 3974.268521] nintendo 0005:057E:2009.0009: unknown main item tag 0x0
[ 3974.271295] nintendo 0005:057E:2009.0009: hidraw4: BLUETOOTH HID v80.01 Gamepad [Pro Controller] on 44:85:00:1e:ab:f8
[ 3976.494269] nintendo 0005:057E:2009.0009: controller MAC = 98:B6:E9:42:A8:DD
[ 3977.036391] nintendo 0005:057E:2009.0009: Failed to set home LED dflt; ret=-110
[ 3977.036402] nintendo 0005:057E:2009.0009: Failed to create leds; ret=-110
[ 3977.049328] nintendo 0005:057E:2009.0009: probe - fail = -110
[ 3977.564465] leds 0005:057E:2009.0009:home: Setting an LED's brightness failed (-110)
[ 3978.076440] leds 0005:057E:2009.0009:player4: Setting an LED's brightness failed (-110)
[ 3978.589367] leds 0005:057E:2009.0009:player3: Setting an LED's brightness failed (-110)
[ 3979.101347] leds 0005:057E:2009.0009:player2: Setting an LED's brightness failed (-110)
[ 3979.612308] leds 0005:057E:2009.0009:player1: Setting an LED's brightness failed (-110)
[ 3979.612977] nintendo: probe of 0005:057E:2009.0009 failed with error -110

I'm guessing the LED and baudrate setting failures should probably be
non-fatal. Let me know if there's anything else you'd like me to test.

For Fedora users who want to try out this v11 version of the driver:
https://koji.fedoraproject.org/koji/taskinfo?taskID=43730136
(note that the build will be removed in a bit less than a week)

Cheers

