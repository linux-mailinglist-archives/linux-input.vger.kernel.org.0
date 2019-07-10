Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D6C64E04
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2019 23:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbfGJVdD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jul 2019 17:33:03 -0400
Received: from mail.schafweide.org ([194.59.205.151]:44352 "EHLO
        mail.schafweide.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfGJVdC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jul 2019 17:33:02 -0400
X-Greylist: delayed 436 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Jul 2019 17:33:02 EDT
Received: from [IPv6:2a07:59c6:eeff:20:ad10:4528:f8b5:a068] (unknown [IPv6:2a07:59c6:eeff:20:ad10:4528:f8b5:a068])
        by mail.schafweide.org (Postfix) with ESMTPSA id B53791300F91
        for <linux-input@vger.kernel.org>; Wed, 10 Jul 2019 23:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=nord-west.org;
        s=default; t=1562793945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:openpgp:openpgp:autocrypt:autocrypt;
        bh=GLX5qJ0WwSRLNVrx3m5VywHXoMXpJ0vWHUYfMT6ig8U=;
        b=+TFX5z4R8JT4HPBJLyWw8HNxsobb6OD2D+mERByBI3i93jnvyyWxDRH1S9JQCVHQp4kWmp
        vIdn2GQny7j4o2Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nord-west.org;
        s=rsa; t=1562793945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:openpgp:openpgp:autocrypt:autocrypt;
        bh=GLX5qJ0WwSRLNVrx3m5VywHXoMXpJ0vWHUYfMT6ig8U=;
        b=FXJoV8IKD1Gx6WFxGiSEy6OYl0CgufC7o6CpEtkqFcXi1eMKoxtOF2QhvWGELJsx7GJwRE
        IanA57siVBAX/2dhxnGIy64X53yM38ZqT4DSgyMaKlumf7KafONfDb3h5k1xWHIac7lq+n
        MzQK3IEnY94cn0XhxIgRIZRddQbmIF4=
To:     linux-input@vger.kernel.org
From:   Bjoern Franke <bjo@nord-west.org>
Subject: Thinkpad A275 Trackpoint/Touchpad issues
Openpgp: preference=signencrypt
Autocrypt: addr=bjo@nord-west.org; prefer-encrypt=mutual; keydata=
 mQENBFj8f44BCADSkS8pPGOlEr8kZwAxF1WD9+RbIs+owDMcXH9aBk4FhNuFvZ0I0/d2rl8h
 zINV+5u7LLSCUTi97c9n4UN747Jvbnn80ZrIvg3d7wDGIPeL9qFZ/vN6XK6p5h2cJOwA4cj6
 fUIZvODsj0nAuclylHJlrDuONue87BRR9UieDDhuQNjFWSXMiLPqN0rUAgntKCv2a7KNswJM
 bmvqwaR2/UxJVNW/Ez6FYlRn8N4zGMwHgS2/KHyJ0by0CGvY7XCR94+S4xKR4fdseWs1vs0S
 Nd641LaJ544zmuJYd/2NfFmqnXkwuY2qrUjMdt/OLXENChwUDCMevUZ2sm0ACJ9bv0t1ABEB
 AAG0IUJqb2VybiBGcmFua2UgPGJqb0Bub3JkLXdlc3Qub3JnPokBVwQTAQgAQQIbAwUJBaOa
 gAULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgBYhBOdPquv6Ji+vRgIQqvz+YSc+9H1/BQJbM8fW
 AhkBAAoJEPz+YSc+9H1/PzEH/2cLGRR6UKyAzBtMV12btaAeXDgYPS8AgTwaJymtJeXriHOq
 KoHzUzipuAy+LaeO9ZXhiXSZ83IqTfv5MOd8O67VhB6ZbNH1JtRM1or9I+Mpzm+eKfyVwU4A
 OImP/ttNbkzTHNhcaws/d6jbuMPHFHyziSU96iedrPwwSqHXPkhjYQYjnJlIEFUVDGihRsFe
 ixpeKCKQs61YvgiBquElchuhmid9BrNi1P2wxD8/M3oYOfsIwvyj9EZSInT19eJR+JClvgVu
 fjhnOzRhiOJLnNQiLsyTBqiksD9Lodwsz837tpdxEKA/POOUn5Aa4ySCy4mcilDuSKNzYb2A
 UjCoJle5AQ0EWPx/jgEIAK9L7ZOOraHYnb4KuftIlSXwxJeezaqta2CEz1B48W3iKXUiKiVH
 EacdtFvk8q1UcxFxv27xZaMUygiKjwdxRtaqchKut+Az/9TimqHz/kx1eyBav4YtNZC2Krsp
 UozyKnj2707Jl1K85vxpt4BNg5VbBuv8WgjJxITTM/sJSH+QDs5yxumyAOZtyWzle//Bh21y
 jGoc1Cprl1pRpqo+2gYkFCWjuooNf1r+DYJm91EyurmU+mh00GCGDIwY/EFWSzQ6bjPWjoWy
 sretGhNiFyWt5CnkxMK+/XVA3UVLAq8IZDf2bv0vrrW6MkxvehPexZgW/AMNnFWdj7+WseR8
 kbsAEQEAAYkBPAQYAQgAJhYhBOdPquv6Ji+vRgIQqvz+YSc+9H1/BQJY/H+OAhsMBQkFo5qA
 AAoJEPz+YSc+9H1/29cIAJrSqoK2dpxcQy1d4RbrHrfeAmbllOUX8f9tGFKiF10AhqQjgiuc
 p+Q0xXHA1f62EDk/Xb+zxGScGJIQB/ViXKSZxpsMMIMCXWakUowh00TNj+oTVs1VLJtZKFc3
 eqWs13Gc5ThkvsIO5hobbkY5fEDQYBXdZKfRt73oNjwi0iy/oEHuC2eUWmeh2/iq0G38uLKZ
 tSMWv28PnkX3etOxJc4U0E0r7oTyGNRGc8+VHH8adoOccsEq4JLBg362laM7tcK4ILkgcgBe
 ZSq85EuLjjI9cD69S/siNv2lCBcB153OnjaG+5KzIz3v/Bf+jnVmIMIpmQeJuVM3chWzuagg qow=
Message-ID: <22780e30-be80-097f-ee8b-7c8b247eecb3@nord-west.org>
Date:   Wed, 10 Jul 2019 23:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I recently bought a Thinkpad A275 which unfortunately has a strange
behaviour regarding its TrackPoint buttons [1].
With its default configuration (no proto option for psmouse) it is
impossible to "press" the button for a longer time, e.g. to mark text or
middle scroll.

At work I'm using now a Thinkpad X270, which seem to use the same
TrackPoint/TrackPad and does not have the issues. I would like to
investigate what causes the different behaviour.

A275:

[   39.043452] psmouse serio1: synaptics: queried max coordinates: x
[..5712], y [..4780]
[   39.075521] psmouse serio1: synaptics: queried min coordinates: x
[1232..], y [1074..]
[   39.075533] psmouse serio1: synaptics: Your touchpad (PNP: LEN2053
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are
not used, you might want to try setting psmouse.synaptics_intertouch to
1 and report this to linux-input@vger.kernel.org.
[   39.132494] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.16,
id: 0x1e2b1, caps: 0xf40aa3/0x943300/0x12e800/0x410000, board id: 3075,
fw id: 2622508
[   39.132537] psmouse serio1: synaptics: serio: Synaptics pass-through
port at isa0060/serio1/input0
[   39.169047] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input9
[   39.179114] mousedev: PS/2 mouse device common for all mice
[   39.835989] psmouse serio2: trackpoint: IBM TrackPoint firmware:
0x0e, buttons: 3/3

X270:
[   10.051334] psmouse serio1: synaptics: Your touchpad (PNP: LEN2046
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are
not used, you might want to try setting psmouse.synaptics_intertouch to
1 and report this to linux-input@vger.kernel.org.
[   10.113613] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2,
id: 0x1e2b1, caps: 0xf408a3/0x943300/0x12e800/0x410000, board id: 3075,
fw id: 2527574
[   10.113617] psmouse serio1: synaptics: serio: Synaptics pass-through
port at isa0060/serio1/input0
[   10.786545] psmouse serio2: trackpoint: IBM TrackPoint firmware:
0x0e, buttons: 3/3
[ 2905.443640] psmouse serio2: Failed to disable mouse on
synaptics-pt/serio0
[ 2906.658135] psmouse serio1: synaptics: queried max coordinates: x
[..5712], y [..4780]
[ 2906.690080] psmouse serio1: synaptics: queried min coordinates: x
[1232..], y [1074..]

Btw, the A275 is running Arch on 5.2 and Ubuntu 19.04 on 5.0.

Kind Regards
Bjoern


[1]https://bugzilla.kernel.org/show_bug.cgi?id=203897
