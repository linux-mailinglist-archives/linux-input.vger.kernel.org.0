Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2055F374A1D
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhEEV2r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:28:47 -0400
Received: from gateway34.websitewelcome.com ([192.185.148.104]:12312 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229893AbhEEV2r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:28:47 -0400
X-Greylist: delayed 1234 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 May 2021 17:28:46 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id E12F3D951A
        for <linux-input@vger.kernel.org>; Wed,  5 May 2021 16:07:10 -0500 (CDT)
Received: from gator3214.hostgator.com ([198.57.247.178])
        by cmsmtp with SMTP
        id eOjdlUQztw11MeOjdlkHJ5; Wed, 05 May 2021 16:07:10 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dolney.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From
        :Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=elMwgu0jRhs3Ymyww0x9NhpPAqMCyRdyM6ALa5N9aTo=; b=YAKi85qE1U6DWpGKz6lFGJN3mN
        NbYs9CZgIN8Ut86bZQ2vt7RqTB2jjtGqD0MSDRmNv849MpPGg+nl3aDpL99yJN5BolqEV5ZsgTPrL
        0QYwgbVpBYeaovUj6jh6VUNYI1Fve3Sufc6Eg6ZC5cLDhttgZ/EIvggHHFQNrhEYSzal/pbzy6sjX
        blBBFzuqrjHOUflJbEqhv7soVNayNKwZwgxm4/+B1oTuoHTMDIS6G7KMyJMBCVFTo4rKsjBiFuUTH
        kf6JFi0VomlOx5RPzyXPiqkk4HUVt8ErETa9cFodxwljHg0VOOvaoCNHeLCa0WKmqWojOgD9z3Znx
        jCDkd5vw==;
Received: from [191.101.174.52] (port=35450 helo=[10.161.0.38])
        by gator3214.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <kernel@dolney.com>)
        id 1leOjd-0047qC-AK
        for linux-input@vger.kernel.org; Wed, 05 May 2021 16:07:09 -0500
Message-ID: <a89decb8584e4bc6d01eaade28fed7be334c56af.camel@dolney.com>
Subject: synaptics: Your touchpad (PNP: LEN2018 PNP0f13) says it can support
 a different bus
From:   Derek Dolney <kernel@dolney.com>
To:     linux-input@vger.kernel.org
Date:   Wed, 05 May 2021 17:06:28 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3214.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - dolney.com
X-BWhitelist: no
X-Source-IP: 191.101.174.52
X-Source-L: No
X-Exim-ID: 1leOjd-0047qC-AK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([10.161.0.38]) [191.101.174.52]:35450
X-Source-Auth: derek@dolney.com
X-Email-Count: 1
X-Source-Cap: ZGRqZHJkZGQ7ZGRqZHJkZGQ7Z2F0b3IzMjE0Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

First of all thank you for all your hard work keeping the Linux kernel
awesome!

Running on a Lenovo Thinkpad T460p, I found these lines in my dmesg:

[   17.360279] psmouse serio1: synaptics: queried max coordinates: x
[..5676], y [..4758]
[   17.390832] psmouse serio1: synaptics: queried min coordinates: x
[1266..], y [1096..]
[   17.390853] psmouse serio1: synaptics: Your touchpad (PNP: LEN2018
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
are not used, you might want to try setting
psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.

Indeed i2c-hid and hid-rmi modules are not loaded. Setting
psmouse.synaptics_intertouch=1 as directed, now I get the following and
the device works well imho:

[   80.967562] psmouse serio1: synaptics: queried max coordinates: x
[..5676], y [..4758]
[   81.004823] psmouse serio1: synaptics: queried min coordinates: x
[1266..], y [1096..]
[   81.004828] psmouse serio1: synaptics: Trying to set up SMBus access
[   81.025153] rmi4_smbus 7-002c: registering SMbus-connected sensor
[   81.079177] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer:
Synaptics, product: TM3053-006, fw id: 2010421
[   81.141785] input: Synaptics TM3053-006 as /devices/rmi4-
00/input/input22
[   81.148458] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
[   81.559841] input: PS/2 Generic Mouse as /devices/rmi4-00/rmi4-
00.fn03/serio2/input/input23

Thanks again,
Derek

