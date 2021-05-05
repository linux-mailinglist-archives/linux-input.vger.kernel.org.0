Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD2E374A30
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhEEVdH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:33:07 -0400
Received: from saul.pp3345.net ([163.172.111.124]:41730 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229893AbhEEVdH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:33:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0374C9A594A;
        Wed,  5 May 2021 23:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
        t=1620250329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pUe2pELBJJmsvp2Rr9I9rJZ5zavX7rrjSzwaQdHm0wY=;
        b=bbV550Px9P6MIJVELwSMDaktjpbO8jUwS4KLTo71gprmv6azVezmmzqCuyIM4/YZy7Xxmk
        tZB2TK42PuUO/8gbcSgSIEzhA+YdGRZmKEBw5Kvjx/9IS3aQH/FOzwq9kGI4g5va58dtbm
        5h/5X3p6S73tat2/yhtCzZ+XbIKUc7x/e0KIorMxVP6qk2TIQ+YQp1DpqT2HF49Ggsdo2D
        BMSB1BdNZ667qAQ6rEGeNRMoyNJqHZjPR5NjWgUQ65QeUhFXSnXAgVZsh7GMF9vvPA0OvY
        46GUFpgitgp18SnWfk/aKTvO0Ye8L0Lf3OhvNfBCooBnRIULk3jyqngDlAsn+A==
Subject: Re: synaptics: Your touchpad (PNP: LEN2018 PNP0f13) says it can
 support a different bus
To:     Derek Dolney <kernel@dolney.com>, linux-input@vger.kernel.org
References: <a89decb8584e4bc6d01eaade28fed7be334c56af.camel@dolney.com>
From:   Yussuf Khalil <dev@pp3345.net>
Message-ID: <e98baacb-7523-4df9-bada-36b50f090b41@pp3345.net>
Date:   Wed, 5 May 2021 23:32:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a89decb8584e4bc6d01eaade28fed7be334c56af.camel@dolney.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Derek,

have you tested whether suspending and resuming works fine? If yes, can
you send in a commit that adds the PNP ID to the list in
drivers/input/mouse/synaptics.c?

Regards
Yussuf Khalil

On 05.05.21 23:06, Derek Dolney wrote:
> First of all thank you for all your hard work keeping the Linux kernel
> awesome!
> 
> Running on a Lenovo Thinkpad T460p, I found these lines in my dmesg:
> 
> [   17.360279] psmouse serio1: synaptics: queried max coordinates: x
> [..5676], y [..4758]
> [   17.390832] psmouse serio1: synaptics: queried min coordinates: x
> [1266..], y [1096..]
> [   17.390853] psmouse serio1: synaptics: Your touchpad (PNP: LEN2018
> PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
> are not used, you might want to try setting
> psmouse.synaptics_intertouch to 1 and report this to
> linux-input@vger.kernel.org.
> 
> Indeed i2c-hid and hid-rmi modules are not loaded. Setting
> psmouse.synaptics_intertouch=1 as directed, now I get the following and
> the device works well imho:
> 
> [   80.967562] psmouse serio1: synaptics: queried max coordinates: x
> [..5676], y [..4758]
> [   81.004823] psmouse serio1: synaptics: queried min coordinates: x
> [1266..], y [1096..]
> [   81.004828] psmouse serio1: synaptics: Trying to set up SMBus access
> [   81.025153] rmi4_smbus 7-002c: registering SMbus-connected sensor
> [   81.079177] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer:
> Synaptics, product: TM3053-006, fw id: 2010421
> [   81.141785] input: Synaptics TM3053-006 as /devices/rmi4-
> 00/input/input22
> [   81.148458] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
> [   81.559841] input: PS/2 Generic Mouse as /devices/rmi4-00/rmi4-
> 00.fn03/serio2/input/input23
> 
> Thanks again,
> Derek
> 
