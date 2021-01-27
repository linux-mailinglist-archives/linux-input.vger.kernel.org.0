Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6B0306107
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 17:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343988AbhA0Q33 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 11:29:29 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:40965 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343976AbhA0Q3I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 11:29:08 -0500
Received: from [192.168.1.150] (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0F029100004
        for <linux-input@vger.kernel.org>; Wed, 27 Jan 2021 16:28:12 +0000 (UTC)
Message-ID: <86f1ab110d0fb31fd308d38ad801a0b87df54c17.camel@hadess.net>
Subject: EVIOCGKEYCODE_V2 not working for a specific driver?
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Date:   Wed, 27 Jan 2021 17:28:12 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey,

I was trying to figure out, for remotes like the one supported by the
hid-creative-sb0540 driver, what needed to be done to allow keys to be
remapped, especially the ones that don't have a mapping by default.

I think that the keymap is setup correctly in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-creative-sb0540.c#n194
and pressing buttons emits events with the correct keycodes.

But using EVIOCGKEYCODE or EVIOCGKEYCODE_V2 always gives me "0" as the
keycode for all the scancodes it can go through.

I also tried evmap:
https://github.com/vovcat/evmap/
and this manages to extract 257 keys, from 00, to ff, inclusive:
sudo ./evmap -d /dev/input/event20 -p
[sudo] password for hadess: 
index scancode    keycode name
    0 ff000000          0 RESERVED
    1 ff000000          0 RESERVED
    2 ff000001          0 RESERVED
    3 ff000002          0 RESERVED
    4 ff000003          0 RESERVED
    5 ff000004          0 RESERVED
    6 ff000005          0 RESERVED
    7 ff000006          0 RESERVED
<snip>
  256 ff0000ff          0 RESERVED

I tried reading through input.c's handling of the input_get_keycode()
and associated, and can't figure out what's wrong here.

Any ideas?

Cheers

