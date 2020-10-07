Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70846286A0C
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 23:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgJGV1G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 17:27:06 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:45507 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727798AbgJGV1F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Oct 2020 17:27:05 -0400
X-Greylist: delayed 502 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 17:27:05 EDT
Received: from [192.168.0.2] (ip5f5af1b0.dynamic.kabel-deutschland.de [95.90.241.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id D6AFE20225BD0;
        Wed,  7 Oct 2020 23:18:41 +0200 (CEST)
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: i8042_init: PS/2 mouse not detected with ACPIPnP/PnPBIOS
Message-ID: <1a69c5bc-ccc4-68db-7871-af05a70052c9@molgen.mpg.de>
Date:   Wed, 7 Oct 2020 23:18:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Linux folks,


On the Asus F2A85-M PRO Linux 5.9-rc8 (and previous versions) does not 
recognize a plugged in PS/2 mouse using the Plug & Play method. The PS/2 
keyboard is detected fine, and using `i8042.nopnp`, the PS/2 mouse also 
works.

> [    1.035915] calling  i8042_init+0x0/0x42d @ 1
> [    1.035947] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
> [    1.035948] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
> [    1.036589] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    1.036621] initcall i8042_init+0x0/0x42d returned 0 after 687 usecs

But, the DSDT includes the “mouse device”. From

     acpidump > dump.bin; acpixtract dump.bin; iasl -d *dat; more dsdt.dsl

we get

                 Device (PS2M)
                 {
                     Name (_HID, EisaId ("PNP0F03") /* Microsoft 
PS/2-style Mouse */)  // _HID: Hardware ID
                     Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */) 
// _CID: Compatible ID
                     Method (_STA, 0, NotSerialized)  // _STA: Status
                     {
                         If ((IOST & 0x4000))
                         {
                             Return (0x0F)
                         }
                         Else
                         {
                             Return (Zero)
                         }
                     }

and the identifiers PNP0F03 and PNP0F13 are both listed in the array 
`pnp_aux_devids[]`. But adding print statements to 
`i8042_pnp_aux_probe()`, I do not see them, so the function does not 
seem to be called.

Hints for further debugging are much appreciated.


Kind regards,

Paul


