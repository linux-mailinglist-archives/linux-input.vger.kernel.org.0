Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C976A3AF60A
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 21:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhFUTZc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 15:25:32 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:51265 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhFUTZc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 15:25:32 -0400
Received: from [192.168.1.155] ([95.118.106.223]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MdNwm-1lM4lE3FxI-00ZRYS; Mon, 21 Jun 2021 21:23:12 +0200
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     Hans de Goede <hdegoede@redhat.com>, leo60228 <leo@60228.dev>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
 <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
 <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <436b87c1-5c24-05ce-98fd-c3664c7765e2@metux.net>
Date:   Mon, 21 Jun 2021 21:23:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pssvFtUXCsKqPabfMS3MfR5mWNP3oGs46zYpeqHlY03AhyYToJq
 OZBUO+yvxTojMEOnEco1QsHElQQwAhiv3agEKPDigXhDclBzjgrGDdTXRwN8Z52rj98u2uG
 wTOUokDLp5Tepye2OjEZubps/lpQB8utp9ZNGH8L0N+b61X0FVd0JLwXaxWN4JePGu0ZwcT
 D1Uzw15IHfJHQqX6hsXkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QCtZMNliL7o=:JyTuljuGLp200MJtuMMENa
 h1n8vyNqcyQWSBrTSiUrsqu35I+G9Ws7dyEmgVs/1zEI+cwg5nh5HoJmcF+kRu3oiY1a17lu5
 pUCp122Sx0K5sozf9wsrFAZ9SMlZyg4yZivzgK7m35G/rxd1DmFCSJrsN82lcVCY5m4FiQ5EL
 e65puVTwLobzVSR6Cx26nSGyrTaZVzNFisbdd1b6FBtC1OfxoN+4iJxcAQwGgY0d7mHWTZe9t
 CUo+eVJL+XExOku2vOeW3qsfsV5x5J/TpXbF9Tw4i1+oIF6FEjHQM2v2/KytTIvESrUwcjfxF
 XloA6D7WpYYIUuj5WB159TEPt29tJbRKZdRjsRmYj7zZ2OgTZIrzbYY5j8kWS7V+JCyu+Jt7/
 zbpIKdf7MEJ69a2oZe5AyVUPfLZXhIErU4F54LUmFGk6LMO06gaK1WqC1coNBE6E0XLjHCHxU
 rL/ewgL5iwKpDnLQoMWplBUCbYhN7rHUjXir4BvwJIO6ANOVpaA07DcU1YZBFr4B6AZVfwTc3
 Y4AuZk/3pvGzeZTAa9fZ6E=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16.06.21 19:50, Hans de Goede wrote:

Hi,

>> hmm, keyboard backlight ... don't we already have something for that
>> in input subsys ? I believe that some lone LEDs aren't the right subsys
>> for those stuff.
> 
> Actually the standardized userspace API for exporting keyboard backlights
> is using the LED class sysfs API, e.g.:
> 
> cat /sys/class/leds/tpacpi\:\:kbd_backlight/brightnes

Sounds like we don't have an API for that particular case at all.
Everbody just exposes LED class devices and userland always needs
hardware specific code to practically use it.

We should at least have some standard mechanism for get least getting
the connection between an input device and it's backlight device(s).

> And the same for Dell and other kbd backlights, also the upower
> daemon even has code for dealing with kbd-backlights:
> https://gitlab.freedesktop.org/upower/upower/-/blob/master/src/up-kbd-backlight.c
> exporting them over its dbus API so that non-root users can
> control them.

Looks like a very complicated way to do that. But actually I've never
understood why I should use this strange upower thing anways :p

> Basically using the LED class for kbd-backlight functionality
> basically is the defacto standard under Linux, so exposing this
> through the LED class is definitely the right thing to do.

In general, LED class isn't so bad, as it already gives us LED control
(*1), but I don't see any portable way for finding the corresponding
LED for some input device. In DRM I see the backlight as subdevice.



--mtx


*1) just recognized that on my toshiba portege (TOS6208) it only works
    for readout - writing to "brightness" does nothing at all
-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
