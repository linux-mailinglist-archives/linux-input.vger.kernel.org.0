Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854FB3A21C4
	for <lists+linux-input@lfdr.de>; Thu, 10 Jun 2021 03:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbhFJBJq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Jun 2021 21:09:46 -0400
Received: from unboiled.info ([51.15.87.8]:33496 "EHLO unboiled.info"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229557AbhFJBJq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Jun 2021 21:09:46 -0400
X-Greylist: delayed 526 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Jun 2021 21:09:46 EDT
Subject: Re: UPD: hid-multitouch: goodix: hovering works as touch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=unboiled.info;
        s=mail; t=1623286744;
        bh=6i/DnXGYfzcprDlbRyWJPM7fK9YDa7T/isKmO6JnvOU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=bT2OOGEGJFOiAR0rV8R/1QAMPlkyaDpbiVjaliB/YeEJkgwPPQxErjGCSgo2nlKVe
         4Nw5V/pCljnDdekJHhoWnAtoFw7etLCAzKusXrM2U9snGKvo81jnscvPDlDcn1la0I
         t6Cnm57Nd+UOOitlPSJoeV9Zs9+8/wxAfI95F5zQ=
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniele Gobbetti <daniele@gobbetti.name>,
        Vitaly Minko <vitaly@minko.me>
References: <ab5ad25b-d39c-83fe-4a88-eebed7f8b23a@minko.me>
 <7b7af64e-8e70-3a9c-eee9-010574adc241@astralinux.ru>
From:   Alexander Sosedkin <monk@unboiled.info>
Message-ID: <a84aa67c-16b8-27c2-e1a2-e497314efc4b@unboiled.info>
Date:   Thu, 10 Jun 2021 02:59:03 +0200
MIME-Version: 1.0
In-Reply-To: <7b7af64e-8e70-3a9c-eee9-010574adc241@astralinux.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/15/21 9:13 AM, Dmitry Mastykin wrote:
> Hi Vitaly,
> 
> Yes, we made a quirk for separate non-multitouch processing of the 
> HID_DG_PEN application for Goodix gt7385p (I2C_DEVICE_ID_GOODIX_0113 == 
> 0x0113). It works well, BTN_TOOL_PEN and BTN_TOUCH events have right order.
> I attach patches for kernel 5.4
> Buttons support was very tricky, because the panel tries to imitate 
> eraser usage with combination of tip's and eraser's bits off and on, 
> seems that Windows driver needs this. In second patch we add 
> state-machines for pen buttons to simulate right and middle click. It 
> works also well with this panel/pen, but I'm not sure if it works with 
> other devices.
> 
> Kind regards,
> Dmitry Mastykin

These patches have solved the same problem for my OneNetbook 4's
"GXTP7386:00 27C6:011A Stylus" manifesting the same symptoms.
I just had to replace the device ID from 0x0113 to 0x011A.
Tested on 5.12.4 and 5.12.7.
It'd be nice to see these fixes extended and upstreamed one day.

Dmitry, thanks for putting work into this.
Benjamin, would you kindly take a look at this submission?
