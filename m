Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB7C3002FF
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 13:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbhAVJZ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 04:25:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:33964 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbhAVJB6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 04:01:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 15E19AEAC;
        Fri, 22 Jan 2021 09:01:16 +0000 (UTC)
Date:   Fri, 22 Jan 2021 10:01:15 +0100
Message-ID: <s5hv9bp8hwk.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pau Oliva Fora <pof@eslack.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Hannes Reinecke <hare@suse.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 2/2] isa: Make the remove callback for isa drivers return void
In-Reply-To: <20210121204812.402589-3-uwe@kleine-koenig.org>
References: <20210121204812.402589-1-uwe@kleine-koenig.org>
        <20210121204812.402589-3-uwe@kleine-koenig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 21 Jan 2021 21:48:12 +0100,
Uwe Kleine-König wrote:
> 
> The driver core ignores the return value of the remove callback, so
> don't give isa drivers the chance to provide a value.
> 
> Adapt all isa_drivers with a remove callbacks accordingly; they all
> return 0 unconditionally anyhow.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

For the sound/* changes:
Reviewed-by: Takashi Iwai <tiwai@suse.de>

BTW, how will we take the patches?
Judging from the LOCs, sound/* are mostly affected, so I may merge
them via sound.git tree, if other people have no objection.


thanks,

Takashi
