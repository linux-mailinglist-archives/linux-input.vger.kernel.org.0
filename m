Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502B520B294
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 15:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgFZNgK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jun 2020 09:36:10 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:42184 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728320AbgFZNgJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jun 2020 09:36:09 -0400
Received: from [78.43.71.214] (helo=marius.localnet)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@mariuszachmann.de>)
        id 1jooWO-0002Ol-Vf; Fri, 26 Jun 2020 15:36:00 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v7] hwmon: add Corsair Commander Pro driver
Date:   Fri, 26 Jun 2020 15:36:00 +0200
Message-ID: <1840543.YiJnzbJd1b@marius>
In-Reply-To: <20200626132135.GA122231@roeck-us.net>
References: <20200626132135.GA122231@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Con-Id: 241080
X-Con-U: 0-mail
X-Originating-IP: 78.43.71.214
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 26.06.20 at 15:21:35 CEST, Guenter Roeck wrote
> On Fri, Jun 26, 2020 at 07:59:36AM +0200, Marius Zachmann wrote:
> > This is v7 of a driver for the Corsair Commander Pro.
> 
> Note to self: Reword when applying.
> 
> > It provides sysfs attributes for:
> > - Reading fan speed
> > - Reading temp sensors
> > - Reading voltage values
> > - Writing pwm and reading last written pwm
> > - Reading fan and temp connection status
> > 
> > It is an usb driver, so it needs to be ignored by usbhid.
> > The Corsair Commander Pro is a fan controller and provides
> > no means for user interaction.
> > The two device numbers are there, because there is a slightly
> > different version of the same device. (Only difference
> > seem to be in some presets.)
> > 
> > This is based on the staging/hwmon tree.
> > 
> > Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> 
> Looks good. For my reference:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> We'll have to wait for an ACK from a HID maintainer before I can apply it.
> 
> Thanks,
> Guenter
> 

Thank you very much for your reviews and time!

Marius




