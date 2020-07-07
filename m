Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23154216A06
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 12:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgGGKU4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 06:20:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:45992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728135AbgGGKUu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 06:20:50 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E657206F6;
        Tue,  7 Jul 2020 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594117249;
        bh=+cBelIs0ehSsds8X4dHmvK2864Wy8QgaOL5fQnupcLk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZAvb6I9vDb3w6KWUww8p1xAQaAhA2POMmlykCDVLQumMM5h/pWVPlOzvEn2QDf+KP
         QOx8pEn3NzKUIwSz7/iLevs8Cg2BUcXxvR9e7pzUoo4/UUNnsEHyOtOTM1oKfXlXAV
         +XdZlgf6w/1mnxL7QlX+4Yax43oPMPgkMNFx/GwU=
Date:   Tue, 7 Jul 2020 12:20:46 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Marius Zachmann <mail@mariuszachmann.de>,
        Jean Delvare <jdelvare@suse.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v7] hwmon: add Corsair Commander Pro driver
In-Reply-To: <20200630021642.GA155878@roeck-us.net>
Message-ID: <nycvar.YFH.7.76.2007071220210.15962@cbobk.fhfr.pm>
References: <20200626055936.4441-1-mail@mariuszachmann.de> <20200630021642.GA155878@roeck-us.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 29 Jun 2020, Guenter Roeck wrote:

> On Fri, Jun 26, 2020 at 07:59:36AM +0200, Marius Zachmann wrote:
> > This is v7 of a driver for the Corsair Commander Pro.
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
> For my reference:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Waiting for Ack from HID maintainer.

Acked-by: Jiri Kosina <jkosina@suse.cz>

for the drivers/hid/hid-quirks.c hunk. Thanks,

-- 
Jiri Kosina
SUSE Labs

