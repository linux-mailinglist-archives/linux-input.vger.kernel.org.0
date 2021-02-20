Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DF3320647
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 17:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhBTQsU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 11:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhBTQsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 11:48:19 -0500
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6658EC061574;
        Sat, 20 Feb 2021 08:47:39 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 5DAE5140AF8;
        Sat, 20 Feb 2021 17:47:35 +0100 (CET)
Date:   Sat, 20 Feb 2021 17:47:35 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 5/7] HID: lenovo: Set LEDs max_brightness value
Message-ID: <20210220174735.2f17ae8b@nic.cz>
In-Reply-To: <387a8e36-21fe-2b52-41a5-b2945989cd07@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
        <20210220122438.21857-6-hdegoede@redhat.com>
        <20210220161645.778fd38f@nic.cz>
        <387a8e36-21fe-2b52-41a5-b2945989cd07@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 20 Feb 2021 17:34:12 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
> 
> On 2/20/21 4:16 PM, Marek Behun wrote:
> > On Sat, 20 Feb 2021 13:24:36 +0100
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >   
> >> +	data->led_mute.max_brightness = LED_ON;  
> > 
> > These constants are obsolete since we now support variable maximum
> > brightness. Just put 1 there.  
> 
> Ok, any other remarks wrt the LED bits before I send out a v3 ?

I will review the remaining patches tonight.
