Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7550D364739
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 17:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbhDSPjW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 11:39:22 -0400
Received: from saul.pp3345.net ([163.172.111.124]:44134 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232986AbhDSPjW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 11:39:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65E6B9A5823;
        Mon, 19 Apr 2021 17:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
        t=1618846731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LKO/TE23nhc36iMkowueoXQaX2oaaO6b3cQ17yjNIVw=;
        b=OdhCti54/zBW5g6L0iRtKoFAYNC+xgVIBsTD2ajT2Xgntur8PibxC/DwsSJW5Z+hIAqvZ9
        zR/DtCrf3lpzo0r+8uxYKYlmaHijMHaX/BLYy2Y5Fsi1dR2YgV2yPaVu+aj27x69GMA3J8
        gAuLnOtdbUuxZQ7LNB9XYEhvo32qbN26IwfuANEItYmddV2XHR0zmcfuqKIVWpraazrkDm
        s9ATE2CvjQVSMnj3+8ionBaecB5NgD4O51E5sLRK0kKqyIeg7ixgUO5Nv6byifmbYDWUMd
        MBmYUQachKmjOecqmXMtuZUVMfH4P0y3wOtKIWRBKg/CBfTAlCmYir9h7++nwg==
Subject: Re: psmouse serio2 psmouse.synaptics_intertouch=1
To:     =?UTF-8?Q?Andr=c3=a9_Najda?= <andre@najda.de>
Cc:     linux-input@vger.kernel.org
References: <4438747.vXUDI8C0e8@xc1507v2>
 <d81cea9f-67f4-c333-4652-e41cb837a8d5@pp3345.net>
 <2130114.vFx2qVVIhK@xc1507v2>
From:   Yussuf Khalil <dev@pp3345.net>
Message-ID: <43b47c32-3eca-e682-b9b4-7f7159ba9fc1@pp3345.net>
Date:   Mon, 19 Apr 2021 17:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2130114.vFx2qVVIhK@xc1507v2>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Can you submit a commit that adds the PNP ID to the smbus_pnp_ids list in 
drivers/input/mouse/synaptics.c?

On 16.04.21 13:27, André Najda wrote:
> [    0.000000] DMI: TUXEDO P65_67HSHP/P65_67HSHP, BIOS 1.05.14 02/23/2018 
> 02/23/2018
> 
> This is a laptop from Tuxedo company based on Clevo P650HS(-G) model.
> 
> the touchpad still works after
> 
> - suspend and resume cycle
> - hibernate and resume cycle
> 
> (sent a second time with mailinglist in CC)
> 
